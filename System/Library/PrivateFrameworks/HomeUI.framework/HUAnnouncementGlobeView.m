@interface HUAnnouncementGlobeView
- (ANRemotePlaybackSession)announceRemotePlaybackSession;
- (BOOL)_isNextAnnouncementTheOldest;
- (BOOL)hasActivePlaybackSession;
- (CGSize)playbackBoundingBoxSize;
- (HFAudioPlayer)audioPlayer;
- (HUAnnouncementGlobeView)initWithAnnouncementPayload:(id)a3 delegate:(id)a4;
- (HUAnnouncementsGlobeViewDelegate)globeViewDelegate;
- (NSMutableArray)announcementIDs;
- (NSMutableArray)currentlyDisplayedAnnouncements;
- (NSMutableArray)visitedAnnouncements;
- (NSMutableDictionary)announcementsInfo;
- (NSString)announcementGroupID;
- (NSString)lastPlayedAnnouncementID;
- (NSString)selectedAnnouncementID;
- (OS_dispatch_queue)dataSourceUpdateQueue;
- (UIImageView)playImageView;
- (UILabel)announcementsProgressLabel;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)tappableCoverView;
- (UIVisualEffectView)backgroundView;
- (double)_radiusOfPlaybackViewInSlotPosition:(unint64_t)a3;
- (double)_xCoordinateForPlaybackViewInSlotPosition:(unint64_t)a3;
- (double)_yCoordinateForPlaybackViewInSlotPosition:(unint64_t)a3;
- (id)_blurEffectForCurrentInterfaceStyle;
- (id)_nextAnnouncementPlaybackView;
- (id)_onQueue_fetchNewAnnouncementInfo:(id)a3 oldestVisitedAnnouncementID:(id)a4;
- (int64_t)displayVisitedOnceToken;
- (int64_t)seedOnceToken;
- (unint64_t)_indexOfLatestCachedAnnouncementFromIDs:(id)a3;
- (unint64_t)_numberOfSlotsAvailableForNewAnnouncements:(id)a3;
- (unint64_t)_numberOfUnplayedAnnouncements;
- (unint64_t)totalNumberOfAnnouncements;
- (void)_addOrInsertAnnouncementsFromIDs:(id)a3 withInfo:(id)a4 withinRange:(_NSRange)a5 inFreeSlots:(unint64_t)a6;
- (void)_addVisitedAnnouncementsToDisplayQueueIfNeeded;
- (void)_appendAnnouncements:(id)a3 withInfo:(id)a4;
- (void)_configureVisualStyleForBackgroundView;
- (void)_layoutPlaybackViewCenteredIfNeeded:(id)a3;
- (void)_layoutPlaybackViewsWithAnimationDuration:(double)a3 completion:(id)a4;
- (void)_playAnnouncementWithInfo:(id)a3;
- (void)_playNextAnnouncement;
- (void)_playRecentlyAddedAnnouncements;
- (void)_seedVisitedAnouncements:(id)a3 withInfo:(id)a4;
- (void)_setupConstrainstsForPlaybackViews;
- (void)_setupConstraintsForPlaybackViewIfNeeded:(id)a3 slotPosition:(unint64_t)a4;
- (void)_setupIncomingAnnouncementSession;
- (void)_setupSubviewsForAnnouncementInfo:(id)a3;
- (void)_showVisitedAnnouncementsView;
- (void)_submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:(BOOL)a3 forAnnouncementID:(id)a4 interruptedByUser:(BOOL)a5;
- (void)_togglePlayback:(id)a3;
- (void)_updateLayoutAndAppearanceForPlaybackView:(id)a3 atSlotPosition:(unint64_t)a4;
- (void)audioPlayer:(id)a3 didPausePlaybackWithReason:(id)a4;
- (void)audioPlayer:(id)a3 didUpdateAveragePower:(double)a4;
- (void)audioPlayerDidFinishPlayback:(id)a3 withError:(id)a4;
- (void)layoutSubviews;
- (void)setAnnounceRemotePlaybackSession:(id)a3;
- (void)setAnnouncementGroupID:(id)a3;
- (void)setAnnouncementIDs:(id)a3;
- (void)setAnnouncementsInfo:(id)a3;
- (void)setAnnouncementsProgressLabel:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCurrentlyDisplayedAnnouncements:(id)a3;
- (void)setDataSourceUpdateQueue:(id)a3;
- (void)setDisplayVisitedOnceToken:(int64_t)a3;
- (void)setGlobeViewDelegate:(id)a3;
- (void)setHasActivePlaybackSession:(BOOL)a3;
- (void)setLastPlayedAnnouncementID:(id)a3;
- (void)setPlayImageView:(id)a3;
- (void)setPlaybackBoundingBoxSize:(CGSize)a3;
- (void)setSeedOnceToken:(int64_t)a3;
- (void)setSelectedAnnouncementID:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTappableCoverView:(id)a3;
- (void)setTotalNumberOfAnnouncements:(unint64_t)a3;
- (void)setVisitedAnnouncements:(id)a3;
- (void)skipToNextAnnouncement;
- (void)stopPlayback;
- (void)teardownAnnouncements;
- (void)updateConstraints;
@end

@implementation HUAnnouncementGlobeView

- (HUAnnouncementGlobeView)initWithAnnouncementPayload:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HUAnnouncementGlobeView;
  v8 = -[HUAnnouncementGlobeView initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_globeViewDelegate, v7);
    v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];
    uint64_t v11 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4A760]];
    announcementGroupID = v9->_announcementGroupID;
    v9->_announcementGroupID = (NSString *)v11;

    uint64_t v13 = objc_opt_new();
    announcementsInfo = v9->_announcementsInfo;
    v9->_announcementsInfo = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    announcementIDs = v9->_announcementIDs;
    v9->_announcementIDs = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    currentlyDisplayedAnnouncements = v9->_currentlyDisplayedAnnouncements;
    v9->_currentlyDisplayedAnnouncements = (NSMutableArray *)v17;

    uint64_t v19 = objc_opt_new();
    visitedAnnouncements = v9->_visitedAnnouncements;
    v9->_visitedAnnouncements = (NSMutableArray *)v19;

    [(NSMutableDictionary *)v9->_announcementsInfo setObject:&unk_1F19B4670 forKey:*MEMORY[0x1E4F4A788]];
    [(NSMutableDictionary *)v9->_announcementsInfo setObject:v6 forKey:v10];
    [(NSMutableArray *)v9->_announcementIDs addObject:v10];
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v9 action:sel__togglePlayback_];
    tapGestureRecognizer = v9->_tapGestureRecognizer;
    v9->_tapGestureRecognizer = (UITapGestureRecognizer *)v21;

    v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.dataSourceUpdateQueue", v23);
    dataSourceUpdateQueue = v9->_dataSourceUpdateQueue;
    v9->_dataSourceUpdateQueue = (OS_dispatch_queue *)v24;

    v9->_totalNumberOfAnnouncements = 1;
    v9->_seedOnceToken = 0;
    v9->_displayVisitedOnceToken = 0;
    [(HUAnnouncementGlobeView *)v9 _setupSubviewsForAnnouncementInfo:v6];
    [(HUAnnouncementGlobeView *)v9 _setupIncomingAnnouncementSession];
  }
  return v9;
}

- (BOOL)hasActivePlaybackSession
{
  v2 = [(HUAnnouncementGlobeView *)self audioPlayer];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setupSubviewsForAnnouncementInfo:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F43028];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [(HUAnnouncementGlobeView *)self _blurEffectForCurrentInterfaceStyle];
  v8 = (UIVisualEffectView *)[v6 initWithEffect:v7];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v8;

  [(HUAnnouncementGlobeView *)self _configureVisualStyleForBackgroundView];
  [(UIVisualEffectView *)self->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVisualEffectView *)self->_backgroundView setUserInteractionEnabled:0];
  [(HUAnnouncementGlobeView *)self addSubview:self->_backgroundView];
  v10 = [HUAnnouncementPlaybackView alloc];
  double v11 = *MEMORY[0x1E4F1DB28];
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v29 = -[HUAnnouncementPlaybackView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], v12, v13, v14);
  [(HUAnnouncementPlaybackView *)v29 setAnnouncementInfo:v5];

  [(HUAnnouncementPlaybackView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HUAnnouncementPlaybackView *)v29 setUserInteractionEnabled:0];
  uint64_t v15 = [(UIVisualEffectView *)self->_backgroundView contentView];
  [v15 addSubview:v29];

  v16 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  [v16 addObject:v29];

  uint64_t v17 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v11, v12, v13, v14);
  tappableCoverView = self->_tappableCoverView;
  self->_tappableCoverView = v17;

  [(UIView *)self->_tappableCoverView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v19 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIView *)self->_tappableCoverView setBackgroundColor:v19];

  [(UIView *)self->_tappableCoverView addGestureRecognizer:self->_tapGestureRecognizer];
  v20 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopPlayback_AX_Label_Title", @"HUAnnounceStopPlayback_AX_Label_Title", 1);
  [(UIView *)self->_tappableCoverView setAccessibilityLabel:v20];

  uint64_t v21 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopPlayback_AX_Label_Hint", @"HUAnnounceStopPlayback_AX_Label_Hint", 1);
  [(UIView *)self->_tappableCoverView setAccessibilityHint:v21];

  [(UIView *)self->_tappableCoverView setIsAccessibilityElement:1];
  [(HUAnnouncementGlobeView *)self addSubview:self->_tappableCoverView];
  v22 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v11, v12, v13, v14);
  playImageView = self->_playImageView;
  self->_playImageView = v22;

  [(UIImageView *)self->_playImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  dispatch_queue_t v24 = [MEMORY[0x1E4F42A80] _systemImageNamed:@"play.fill"];
  v25 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:*MEMORY[0x1E4F43870] scale:-1];
  v26 = [v24 imageWithConfiguration:v25];

  [(UIImageView *)self->_playImageView setContentMode:1];
  [(UIImageView *)self->_playImageView setImage:v26];
  objc_super v27 = self->_playImageView;
  v28 = [MEMORY[0x1E4F428B8] systemBlackColor];
  [(UIImageView *)v27 setTintColor:v28];

  [(UIImageView *)self->_playImageView setAlpha:0.0];
  [(UIView *)self->_tappableCoverView addSubview:self->_playImageView];
}

- (void)updateConstraints
{
  v58.receiver = self;
  v58.super_class = (Class)HUAnnouncementGlobeView;
  [(HUAnnouncementGlobeView *)&v58 updateConstraints];
  BOOL v3 = objc_opt_new();
  v4 = [(UIVisualEffectView *)self->_backgroundView centerXAnchor];
  id v5 = [(HUAnnouncementGlobeView *)self centerXAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];
  [v3 addObject:v6];

  id v7 = [(UIVisualEffectView *)self->_backgroundView centerYAnchor];
  v8 = [(HUAnnouncementGlobeView *)self centerYAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  [v3 addObject:v9];

  v10 = [(UIVisualEffectView *)self->_backgroundView heightAnchor];
  double v11 = [(HUAnnouncementGlobeView *)self heightAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  [v3 addObject:v12];

  double v13 = [(UIVisualEffectView *)self->_backgroundView widthAnchor];
  double v14 = [(UIVisualEffectView *)self->_backgroundView heightAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  v16 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  uint64_t v17 = [v16 objectAtIndexedSubscript:0];

  v18 = [v17 centerXAnchor];
  uint64_t v19 = [(UIVisualEffectView *)self->_backgroundView centerXAnchor];
  v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];
  [v17 setCenterXConstraint:v20];

  uint64_t v21 = [v17 centerYAnchor];
  v22 = [(UIVisualEffectView *)self->_backgroundView centerYAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];
  [v17 setCenterYConstraint:v23];

  dispatch_queue_t v24 = [v17 heightAnchor];
  v25 = [v24 constraintEqualToConstant:120.0];
  [v17 setHeightConstraint:v25];

  v26 = [v17 widthAnchor];
  objc_super v27 = [v17 heightAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v17 setWidthConstraint:v28];

  v29 = [v17 centerXConstraint];
  [v3 addObject:v29];

  v30 = [v17 centerYConstraint];
  [v3 addObject:v30];

  v31 = [v17 heightConstraint];
  [v3 addObject:v31];

  v32 = [v17 widthAnchor];
  v33 = [v17 heightAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v3 addObject:v34];

  v35 = [(UIView *)self->_tappableCoverView centerXAnchor];
  v36 = [(HUAnnouncementGlobeView *)self centerXAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v3 addObject:v37];

  v38 = [(UIView *)self->_tappableCoverView centerYAnchor];
  v39 = [(HUAnnouncementGlobeView *)self centerYAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v3 addObject:v40];

  v41 = [(UIView *)self->_tappableCoverView heightAnchor];
  v42 = [(HUAnnouncementGlobeView *)self heightAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  [v3 addObject:v43];

  v44 = [(UIView *)self->_tappableCoverView widthAnchor];
  v45 = [(HUAnnouncementGlobeView *)self heightAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v3 addObject:v46];

  v47 = [(UIImageView *)self->_playImageView centerXAnchor];
  v48 = [(UIView *)self->_tappableCoverView centerXAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  [v3 addObject:v49];

  v50 = [(UIImageView *)self->_playImageView centerYAnchor];
  v51 = [(UIView *)self->_tappableCoverView centerYAnchor];
  v52 = [v50 constraintEqualToAnchor:v51];
  [v3 addObject:v52];

  v53 = [(UIImageView *)self->_playImageView heightAnchor];
  v54 = [v53 constraintEqualToConstant:44.0];
  [v3 addObject:v54];

  v55 = [(UIImageView *)self->_playImageView widthAnchor];
  v56 = [(UIImageView *)self->_playImageView heightAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  [v3 addObject:v57];

  [MEMORY[0x1E4F28DC8] activateConstraints:v3];
  [v17 setNeedsUpdateConstraints];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HUAnnouncementGlobeView;
  [(HUAnnouncementGlobeView *)&v6 layoutSubviews];
  BOOL v3 = [(HUAnnouncementGlobeView *)self layer];
  [v3 setMasksToBounds:1];

  v4 = [(HUAnnouncementGlobeView *)self layer];
  [(HUAnnouncementGlobeView *)self bounds];
  [v4 setCornerRadius:v5 * 0.5];
}

- (void)skipToNextAnnouncement
{
  BOOL v3 = [(HUAnnouncementGlobeView *)self audioPlayer];
  int v4 = [v3 isPlaying];

  if (v4)
  {
    double v5 = [(HUAnnouncementGlobeView *)self audioPlayer];
    [v5 stop];

    objc_super v6 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    id v7 = [v6 objectAtIndexedSubscript:0];

    [v7 playbackStopped];
    [(HUAnnouncementGlobeView *)self _playNextAnnouncement];
  }
}

- (void)stopPlayback
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUAnnouncementGlobeView *)self audioPlayer];
  [v3 stop];

  int v4 = [(HUAnnouncementGlobeView *)self playImageView];
  [v4 setAlpha:1.0];

  double v5 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStartPlayback_AX_Label_Title", @"HUAnnounceStartPlayback_AX_Label_Title", 1);
  objc_super v6 = [(HUAnnouncementGlobeView *)self tappableCoverView];
  [v6 setAccessibilityLabel:v5];

  id v7 = _HULocalizedStringWithDefaultValue(@"HUAnnounceResumePlayback_AX_Label_Hint", @"HUAnnounceResumePlayback_AX_Label_Hint", 1);
  v8 = [(HUAnnouncementGlobeView *)self tappableCoverView];
  [v8 setAccessibilityHint:v7];

  v9 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    double v11 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    double v12 = [v11 objectAtIndexedSubscript:0];

    [v12 playbackStopped];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    double v13 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v17++) setAlpha:0.5];
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    uint64_t v18 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      v20 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        v22 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
        v23 = [v12 announcementInfo];
        objc_msgSend(v22, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v23, -[HUAnnouncementGlobeView totalNumberOfAnnouncements](self, "totalNumberOfAnnouncements"));
      }
    }
  }
  [(HUAnnouncementGlobeView *)self setAudioPlayer:0];
  dispatch_queue_t v24 = [(HUAnnouncementGlobeView *)self announceRemotePlaybackSession];
  v25 = [(HUAnnouncementGlobeView *)self lastPlayedAnnouncementID];
  [v24 setPlaybackStoppedForAnnouncement:v25];
}

- (void)teardownAnnouncements
{
  BOOL v3 = [(HUAnnouncementGlobeView *)self audioPlayer];
  int v4 = [v3 isPlaying];

  double v5 = [(HUAnnouncementGlobeView *)self announceRemotePlaybackSession];
  [v5 endSession];

  [(HUAnnouncementGlobeView *)self setAnnounceRemotePlaybackSession:0];
  objc_super v6 = [(HUAnnouncementGlobeView *)self audioPlayer];
  [v6 stop];

  if (v4)
  {
    id v7 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    v8 = [v7 objectAtIndexedSubscript:0];

    v9 = [v8 announcementInfo];
    uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];

    [(HUAnnouncementGlobeView *)self _submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:1 forAnnouncementID:v10 interruptedByUser:1];
  }
  double v11 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  [v11 makeObjectsPerformSelector:sel_removeFromSuperview];

  double v12 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  [v12 removeAllObjects];

  double v13 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
  [v13 removeAllObjects];

  uint64_t v14 = [(HUAnnouncementGlobeView *)self announcementIDs];
  [v14 removeAllObjects];

  id v15 = [(HUAnnouncementGlobeView *)self announcementsInfo];
  [v15 removeAllObjects];
}

- (void)_configureVisualStyleForBackgroundView
{
  BOOL v3 = [(HUAnnouncementGlobeView *)self backgroundView];
  int v4 = [(HUAnnouncementGlobeView *)self _blurEffectForCurrentInterfaceStyle];
  [v3 setEffect:v4];

  double v5 = [(HUAnnouncementGlobeView *)self traitCollection];
  [v5 userInterfaceStyle];

  backgroundView = self->_backgroundView;
  id v7 = [MEMORY[0x1E4F428B8] colorWithRed:0.882352941 green:0.88627451 blue:0.894117647 alpha:1.0];
  [(UIVisualEffectView *)backgroundView setBackgroundColor:v7];
}

- (void)_setupIncomingAnnouncementSession
{
  BOOL v3 = [(HUAnnouncementGlobeView *)self announcementGroupID];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F4A928]);
    [(HUAnnouncementGlobeView *)self setAnnounceRemotePlaybackSession:v4];

    double v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Now setting up Announce Remote Playback Session", buf, 2u);
    }

    objc_super v6 = [(HUAnnouncementGlobeView *)self announceRemotePlaybackSession];
    id v7 = [(HUAnnouncementGlobeView *)self announcementGroupID];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke;
    v8[3] = &unk_1E6388098;
    v8[4] = self;
    [v6 startSessionForGroupID:v7 announcementsHandler:v8];
  }
}

void __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSourceUpdateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke_2;
  v7[3] = &unk_1E63850E0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  id v3 = objc_opt_new();
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v24 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Received announcements handler callback with [%lu] announcements", buf, 0xCu);
  }

  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = v19;
    _os_log_debug_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEBUG, "Received announcements handler callback with announcements = %@", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v7 = 0;
    uint64_t v8 = *MEMORY[0x1E4F4A788];
    do
    {
      uint64_t v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v7];
      uint64_t v10 = [v9 contextDictionary];
      double v11 = (void *)[v10 mutableCopy];

      double v12 = [NSNumber numberWithUnsignedInteger:v7];
      [v11 setObject:v12 forKey:v8];

      double v13 = [v9 announcementID];
      [v3 setObject:v11 forKey:v13];

      uint64_t v14 = [v9 announcementID];
      [v2 addObject:v14];

      ++v7;
    }
    while (v7 < [*(id *)(a1 + 32) count]);
  }
  [*(id *)(a1 + 40) setAnnouncementsInfo:v3];
  [*(id *)(a1 + 40) setAnnouncementIDs:v2];
  id v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [*(id *)(a1 + 40) announcementsInfo];
    *(_DWORD *)buf = 138412290;
    uint64_t v24 = (uint64_t)v16;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "New Announcement Info %@", buf, 0xCu);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke_37;
  block[3] = &unk_1E6386340;
  block[4] = *(void *)(a1 + 40);
  id v21 = v2;
  id v22 = v3;
  id v17 = v3;
  id v18 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__HUAnnouncementGlobeView__setupIncomingAnnouncementSession__block_invoke_37(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = (id)[*(id *)(a1 + 40) copy];
  id v3 = (void *)[*(id *)(a1 + 48) copy];
  [v2 _appendAnnouncements:v4 withInfo:v3];
}

- (void)_appendAnnouncements:(id)a3 withInfo:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(HUAnnouncementGlobeView *)self _seedVisitedAnouncements:v7 withInfo:v8];
  -[HUAnnouncementGlobeView setTotalNumberOfAnnouncements:](self, "setTotalNumberOfAnnouncements:", [v7 count]);
  unint64_t v9 = [(HUAnnouncementGlobeView *)self _indexOfLatestCachedAnnouncementFromIDs:v7];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_29;
  }
  unint64_t v10 = v9;
  unint64_t v11 = [v7 count] + ~v9;
  unint64_t v12 = [(HUAnnouncementGlobeView *)self _numberOfSlotsAvailableForNewAnnouncements:v7];
  double v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v60 = self;
    __int16 v61 = 2112;
    v62 = v14;
    __int16 v63 = 2048;
    unint64_t v64 = v11;
    __int16 v65 = 2048;
    unint64_t v66 = v12;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ New Announcements count = %lu, Free slots = %lu", buf, 0x2Au);
  }
  if (v11 && v12)
  {
    id v15 = objc_opt_new();
    uint64_t v16 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    uint64_t v17 = [v16 count];

    if (v12 >= v11) {
      unint64_t v18 = v11;
    }
    else {
      unint64_t v18 = v12;
    }
    if (v17 == 3)
    {
      SEL aSelector = a2;
      if (v18 <= 2)
      {
        unint64_t v19 = 2;
        do
        {
          v20 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
          id v21 = [v20 objectAtIndexedSubscript:v19];

          id v22 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
          [v22 insertObject:v21 atIndex:0];

          [v15 addObject:v21];
          --v19;
        }
        while (v19 > 2 - v18);
      }
      v23 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
      [v23 removeObjectsInArray:v15];

      uint64_t v24 = HFLogForCategory();
      a2 = aSelectora;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = NSStringFromSelector(aSelectora);
        *(_DWORD *)buf = 138412802;
        v60 = self;
        __int16 v61 = 2112;
        v62 = v25;
        __int16 v63 = 2112;
        unint64_t v64 = (unint64_t)v15;
        _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@ [Insert-Operation] Removing and Pushing back views into visited announcements = %@", buf, 0x20u);
      }
      unint64_t v26 = v18;
    }
    else
    {
      unint64_t v26 = 0;
    }
    -[HUAnnouncementGlobeView _addOrInsertAnnouncementsFromIDs:withInfo:withinRange:inFreeSlots:](self, "_addOrInsertAnnouncementsFromIDs:withInfo:withinRange:inFreeSlots:", v7, v8, v10, v18, v12);
    [(HUAnnouncementGlobeView *)self _addVisitedAnnouncementsToDisplayQueueIfNeeded];
    v37 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    v38 = [v37 objectAtIndexedSubscript:0];

    [(HUAnnouncementGlobeView *)self _setupConstrainstsForPlaybackViews];
    uint64_t v39 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
    if (v39)
    {
      v40 = (void *)v39;
      v41 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
      char v42 = objc_opt_respondsToSelector();

      if (v42)
      {
        v43 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
        v44 = [v38 announcementInfo];
        objc_msgSend(v43, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v44, -[HUAnnouncementGlobeView totalNumberOfAnnouncements](self, "totalNumberOfAnnouncements"));
      }
    }
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __57__HUAnnouncementGlobeView__appendAnnouncements_withInfo___block_invoke;
    v55[3] = &unk_1E638B870;
    v55[4] = self;
    id v56 = v15;
    SEL v57 = a2;
    unint64_t v58 = v26;
    id v45 = v15;
    [(HUAnnouncementGlobeView *)self _layoutPlaybackViewsWithAnimationDuration:v55 completion:0.5];

    goto LABEL_29;
  }
  long long v27 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if (![v27 count]) {
    goto LABEL_19;
  }
  long long v28 = [(HUAnnouncementGlobeView *)self audioPlayer];
  if (v28)
  {

LABEL_19:
    goto LABEL_20;
  }
  unint64_t v46 = [(HUAnnouncementGlobeView *)self _numberOfUnplayedAnnouncements];

  if (!v46)
  {
LABEL_20:
    long long v29 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    v30 = [v29 objectAtIndexedSubscript:0];

    uint64_t v31 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
    if (v31)
    {
      v32 = (void *)v31;
      v33 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
      char v34 = objc_opt_respondsToSelector();

      if (v34)
      {
        v35 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
        v36 = [v30 announcementInfo];
        objc_msgSend(v35, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v36, -[HUAnnouncementGlobeView totalNumberOfAnnouncements](self, "totalNumberOfAnnouncements"));
      }
    }

    goto LABEL_29;
  }
  v47 = HFLogForCategory();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = NSStringFromSelector(a2);
    unint64_t v49 = [(HUAnnouncementGlobeView *)self _numberOfUnplayedAnnouncements];
    v50 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    *(_DWORD *)buf = 138413058;
    v60 = self;
    __int16 v61 = 2112;
    v62 = v48;
    __int16 v63 = 2048;
    unint64_t v64 = v49;
    __int16 v65 = 2112;
    unint64_t v66 = (unint64_t)v50;
    _os_log_impl(&dword_1BE345000, v47, OS_LOG_TYPE_DEFAULT, "%@:%@ Now Playing [%lu] unplayed announcements [%@]....", buf, 0x2Au);
  }
  [(HUAnnouncementGlobeView *)self _addVisitedAnnouncementsToDisplayQueueIfNeeded];
  v51 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  unint64_t v52 = [v51 count];

  if (v52 >= 2)
  {
    [(HUAnnouncementGlobeView *)self _setupConstrainstsForPlaybackViews];
    [(HUAnnouncementGlobeView *)self _layoutPlaybackViewsWithAnimationDuration:0 completion:0.5];
  }
  [(HUAnnouncementGlobeView *)self _togglePlayback:0];
LABEL_29:
}

void __57__HUAnnouncementGlobeView__appendAnnouncements_withInfo___block_invoke(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    return;
  }
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    id v6 = *(void **)(a1 + 40);
    int v18 = 138412802;
    uint64_t v19 = v4;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@:%@ Animation Complete! Removing unused views [%@] ", (uint8_t *)&v18, 0x20u);
  }
  [*(id *)(a1 + 40) makeObjectsPerformSelector:sel_removeFromSuperview];
  id v7 = [*(id *)(a1 + 32) audioPlayer];
  if (v7)
  {

    goto LABEL_6;
  }
  if (!*(void *)(a1 + 56))
  {
LABEL_6:
    id v8 = [*(id *)(a1 + 32) audioPlayer];

    if (v8)
    {
      unint64_t v9 = [*(id *)(a1 + 32) currentlyDisplayedAnnouncements];
      unint64_t v10 = [v9 objectAtIndexedSubscript:0];

      [v10 resumePlaybackAnimation];
    }
    else
    {
      uint64_t v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
        uint64_t v17 = [*(id *)(a1 + 32) currentlyDisplayedAnnouncements];
        int v18 = 138412802;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        id v21 = v16;
        __int16 v22 = 2112;
        v23 = v17;
        _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Starting playback for added announcements [%@]....", (uint8_t *)&v18, 0x20u);
      }
      [*(id *)(a1 + 32) _togglePlayback:0];
    }
    return;
  }
  unint64_t v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    double v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v18 = 138412546;
    uint64_t v19 = v12;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@ Now Playing recently added announcements...", (uint8_t *)&v18, 0x16u);
  }
  [*(id *)(a1 + 32) _playRecentlyAddedAnnouncements];
}

- (void)_seedVisitedAnouncements:(id)a3 withInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_int64_t seedOnceToken = &self->_seedOnceToken;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__HUAnnouncementGlobeView__seedVisitedAnouncements_withInfo___block_invoke;
  v13[3] = &unk_1E638A8D8;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  SEL v16 = a2;
  int64_t seedOnceToken = self->_seedOnceToken;
  id v11 = v8;
  id v12 = v7;
  if (seedOnceToken != -1) {
    dispatch_once(p_seedOnceToken, v13);
  }
}

void __61__HUAnnouncementGlobeView__seedVisitedAnouncements_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) currentlyDisplayedAnnouncements];
  id v3 = [v2 objectAtIndexedSubscript:0];

  uint64_t v4 = [v3 announcementInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F4A788]];
  uint64_t v6 = [v5 unsignedIntegerValue];

  if (v6)
  {
    unint64_t v7 = 0;
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    do
    {
      if (v7 >= [*(id *)(a1 + 40) count]) {
        break;
      }
      id v12 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v7];
      double v13 = -[HUAnnouncementPlaybackView initWithFrame:]([HUAnnouncementPlaybackView alloc], "initWithFrame:", v8, v9, v10, v11);
      id v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v12];
      [(HUAnnouncementPlaybackView *)v13 setAnnouncementInfo:v14];

      [(HUAnnouncementPlaybackView *)v13 setFullyPlayed:1];
      [(HUAnnouncementPlaybackView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HUAnnouncementPlaybackView *)v13 setUserInteractionEnabled:0];
      [(HUAnnouncementPlaybackView *)v13 setAlpha:0.0];
      id v15 = [*(id *)(a1 + 32) visitedAnnouncements];
      [v15 addObject:v13];

      ++v7;
    }
    while (v6 != v7);
  }
  SEL v16 = [*(id *)(a1 + 32) visitedAnnouncements];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    int v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      __int16 v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
      id v21 = [*(id *)(a1 + 32) visitedAnnouncements];
      int v22 = 138412802;
      uint64_t v23 = v19;
      __int16 v24 = 2112;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      long long v27 = v21;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "%@:%@ Seeded visitedAnnouncements =  [%@]", (uint8_t *)&v22, 0x20u);
    }
  }
}

- (void)_addVisitedAnnouncementsToDisplayQueueIfNeeded
{
  p_displayVisitedOnceToken = &self->_displayVisitedOnceToken;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__HUAnnouncementGlobeView__addVisitedAnnouncementsToDisplayQueueIfNeeded__block_invoke;
  block[3] = &unk_1E6386018;
  block[4] = self;
  if (*p_displayVisitedOnceToken != -1) {
    dispatch_once(p_displayVisitedOnceToken, block);
  }
}

void __73__HUAnnouncementGlobeView__addVisitedAnnouncementsToDisplayQueueIfNeeded__block_invoke(uint64_t a1)
{
  id v15 = [*(id *)(a1 + 32) visitedAnnouncements];
  if (![v15 count])
  {
LABEL_10:

    return;
  }
  v2 = [*(id *)(a1 + 32) currentlyDisplayedAnnouncements];
  unint64_t v3 = [v2 count];

  if (v3 <= 2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) visitedAnnouncements];
    unint64_t v5 = [v4 count];

    uint64_t v6 = [*(id *)(a1 + 32) currentlyDisplayedAnnouncements];
    unint64_t v7 = 3 - [v6 count];

    unint64_t v8 = v5 >= v7 ? v7 : v5;
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        double v10 = [*(id *)(a1 + 32) visitedAnnouncements];
        double v11 = [v10 objectAtIndexedSubscript:i];

        id v12 = [*(id *)(a1 + 32) currentlyDisplayedAnnouncements];
        [v12 addObject:v11];

        [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v11 setUserInteractionEnabled:0];
        double v13 = [*(id *)(a1 + 32) backgroundView];
        id v14 = [v13 contentView];
        [v14 addSubview:v11];
      }
      id v15 = [*(id *)(a1 + 32) visitedAnnouncements];
      objc_msgSend(v15, "removeObjectsInRange:", 0, v8);
      goto LABEL_10;
    }
  }
}

- (void)_setupConstrainstsForPlaybackViews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  unint64_t v5 = [v4 objectAtIndexedSubscript:0];

  uint64_t v6 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  unint64_t v7 = 0;
  if ((unint64_t)[v6 count] >= 2)
  {
    unint64_t v8 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    unint64_t v7 = [v8 objectAtIndexedSubscript:1];
  }
  double v9 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ((unint64_t)[v9 count] < 3)
  {
    double v11 = 0;
  }
  else
  {
    double v10 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    double v11 = [v10 objectAtIndexedSubscript:2];
  }
  [(HUAnnouncementGlobeView *)self _layoutPlaybackViewCenteredIfNeeded:v5];
  [(HUAnnouncementGlobeView *)self _setupConstraintsForPlaybackViewIfNeeded:v7 slotPosition:2];
  [(HUAnnouncementGlobeView *)self _setupConstraintsForPlaybackViewIfNeeded:v11 slotPosition:3];
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = NSStringFromSelector(a2);
    int v16 = 138412546;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Setup complete for All Playback views. Animation Begins!", (uint8_t *)&v16, 0x16u);
  }
  id v14 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  id v15 = [v14 objectAtIndexedSubscript:0];

  [v15 pausePlaybackAnimation];
}

- (void)_layoutPlaybackViewsWithAnimationDuration:(double)a3 completion:(id)a4
{
  id v7 = a4;
  unint64_t v8 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  double v9 = [v8 objectAtIndexedSubscript:0];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__16;
  v26[4] = __Block_byref_object_dispose__16;
  double v10 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ((unint64_t)[v10 count] <= 1)
  {
    id v27 = 0;
  }
  else
  {
    double v11 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    id v27 = [v11 objectAtIndexedSubscript:1];
  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__16;
  v24[4] = __Block_byref_object_dispose__16;
  id v12 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ((unint64_t)[v12 count] < 3)
  {
    id v25 = 0;
  }
  else
  {
    double v13 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    id v25 = [v13 objectAtIndexedSubscript:2];
  }
  id v14 = (void *)MEMORY[0x1E4F42FF0];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__HUAnnouncementGlobeView__layoutPlaybackViewsWithAnimationDuration_completion___block_invoke;
  v19[3] = &unk_1E638B898;
  v19[4] = self;
  id v15 = v9;
  id v20 = v15;
  id v21 = v26;
  int v22 = v24;
  SEL v23 = a2;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__HUAnnouncementGlobeView__layoutPlaybackViewsWithAnimationDuration_completion___block_invoke_41;
  v17[3] = &unk_1E6385C20;
  v17[4] = self;
  id v16 = v7;
  id v18 = v16;
  [v14 animateWithDuration:v19 animations:v17 completion:a3];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

uint64_t __80__HUAnnouncementGlobeView__layoutPlaybackViewsWithAnimationDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) playImageView];
  [v2 setAlpha:0.0];

  unint64_t v3 = [*(id *)(a1 + 32) currentlyDisplayedAnnouncements];
  if ((unint64_t)[v3 count] <= 1)
  {
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 40) centerXConstraint];
    [v4 constant];
    double v6 = v5;

    if (v6 == 0.0)
    {
      id v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        double v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
        uint64_t v10 = *(void *)(a1 + 40);
        int v12 = 138412802;
        uint64_t v13 = v8;
        __int16 v14 = 2112;
        id v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v10;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating constraints for view [%@] to display in the first slot", (uint8_t *)&v12, 0x20u);
      }
      [*(id *)(a1 + 32) _updateLayoutAndAppearanceForPlaybackView:*(void *)(a1 + 40) atSlotPosition:1];
    }
  }
  [*(id *)(a1 + 40) setAlpha:1.0];
  [*(id *)(a1 + 32) _updateLayoutAndAppearanceForPlaybackView:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) atSlotPosition:2];
  [*(id *)(a1 + 32) _updateLayoutAndAppearanceForPlaybackView:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) atSlotPosition:3];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __80__HUAnnouncementGlobeView__layoutPlaybackViewsWithAnimationDuration_completion___block_invoke_41(uint64_t a1)
{
  v2 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStartPlayback_AX_Label_Title", @"HUAnnounceStartPlayback_AX_Label_Title", 1);
  unint64_t v3 = [*(id *)(a1 + 32) tappableCoverView];
  [v3 setAccessibilityLabel:v2];

  uint64_t v4 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStartPlayback_AX_Label_Hint", @"HUAnnounceStartPlayback_AX_Label_Hint", 1);
  double v5 = [*(id *)(a1 + 32) tappableCoverView];
  [v5 setAccessibilityHint:v4];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (unint64_t)_indexOfLatestCachedAnnouncementFromIDs:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ([v5 count]) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  __int16 v26 = self;
  id v7 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    uint64_t v11 = *MEMORY[0x1E4F4A4E8];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = [*(id *)(*((void *)&v27 + 1) + 8 * i) announcementInfo];
        __int16 v14 = [v13 objectForKeyedSubscript:v11];

        unint64_t v15 = [v4 indexOfObject:v14];
        if (v15 <= v6) {
          unint64_t v16 = v6;
        }
        else {
          unint64_t v16 = v15;
        }
        if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v6 = v16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  uint64_t v17 = [(HUAnnouncementGlobeView *)v26 visitedAnnouncements];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v19 = [(HUAnnouncementGlobeView *)v26 visitedAnnouncements];
    id v20 = [v19 lastObject];

    id v21 = [v20 announcementInfo];
    int v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];
    unint64_t v23 = [v4 indexOfObject:v22];

    if (v23 <= v6) {
      unint64_t v24 = v6;
    }
    else {
      unint64_t v24 = v23;
    }
    if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v6 = v24;
    }
  }
  return v6;
}

- (unint64_t)_numberOfSlotsAvailableForNewAnnouncements:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  uint64_t v6 = [v5 count];

  if (v6 == 3)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unint64_t v23 = self;
      uint64_t v10 = *(void *)v27;
      uint64_t v11 = *MEMORY[0x1E4F4A4E8];
      uint64_t v12 = 3;
      while (2)
      {
        uint64_t v13 = 0;
        uint64_t v25 = v12;
        uint64_t v24 = v12 - v9;
        do
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          __int16 v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
          unint64_t v15 = [v14 announcementInfo];
          unint64_t v16 = [v15 objectForKeyedSubscript:v11];
          uint64_t v17 = [v4 indexOfObject:v16];

          if (!v17)
          {
            uint64_t v19 = [(HUAnnouncementGlobeView *)v23 currentlyDisplayedAnnouncements];
            id v20 = [v19 objectAtIndexedSubscript:0];
            unint64_t v18 = v25 - v13;
            if ([v20 isEqual:v14])
            {
              BOOL v21 = [(HUAnnouncementGlobeView *)v23 hasActivePlaybackSession];

              if (v21) {
                unint64_t v18 = 0;
              }
            }
            else
            {
            }
            goto LABEL_18;
          }
          ++v13;
        }
        while (v9 != v13);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
        unint64_t v18 = v24;
        uint64_t v12 = v24;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v18 = 3;
    }
LABEL_18:
  }
  else
  {
    unint64_t v18 = 3 - v6;
  }

  return v18;
}

- (void)_addOrInsertAnnouncementsFromIDs:(id)a3 withInfo:(id)a4 withinRange:(_NSRange)a5 inFreeSlots:(unint64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v43 = a4;
  uint64_t v11 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  uint64_t v12 = [v11 objectAtIndexedSubscript:0];

  uint64_t v13 = [v12 announcementInfo];
  __int16 v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];
  uint64_t v15 = [v10 indexOfObject:v14];

  v36 = v12;
  if (v15) {
    int v16 = 0;
  }
  else {
    int v16 = [v12 fullyPlayed];
  }
  NSUInteger v17 = location + 1;
  NSUInteger v42 = location + length;
  if (location + 1 <= location + length)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    unint64_t v37 = a6 - 3;
    unint64_t v38 = a6 - 2;
    id v39 = v10;
    do
    {
      uint64_t v24 = [v10 objectAtIndexedSubscript:v17 + v19];
      uint64_t v25 = -[HUAnnouncementPlaybackView initWithFrame:]([HUAnnouncementPlaybackView alloc], "initWithFrame:", v20, v21, v22, v23);
      long long v26 = [v43 objectForKeyedSubscript:v24];
      [(HUAnnouncementPlaybackView *)v25 setAnnouncementInfo:v26];

      [(HUAnnouncementPlaybackView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(HUAnnouncementPlaybackView *)v25 setUserInteractionEnabled:0];
      long long v27 = [(HUAnnouncementGlobeView *)self backgroundView];
      long long v28 = [v27 contentView];
      [v28 addSubview:v25];

      [(HUAnnouncementPlaybackView *)v25 setAlpha:0.0];
      if (v16)
      {
        if (length + v18 <= 1) {
          goto LABEL_15;
        }
        long long v29 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
        uint64_t v30 = [v29 count] - 1;

        if ((v30 & 0x8000000000000000) == 0) {
          goto LABEL_16;
        }
      }
      else
      {
        if (length - 1 == v19 && v38 == v19)
        {
          uint64_t v30 = 1;
LABEL_16:
          uint64_t v31 = HFLogForCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v32 = NSStringFromSelector(a2);
            *(_DWORD *)buf = 138413314;
            id v45 = self;
            __int16 v46 = 2112;
            v47 = v32;
            __int16 v48 = 1024;
            *(_DWORD *)unint64_t v49 = v16;
            *(_WORD *)&v49[4] = 2112;
            *(void *)&v49[6] = v25;
            __int16 v50 = 2048;
            uint64_t v51 = v30;
            _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ [Insert-Operation-DM] InsertInFirstSlot = [%d] Inserting [%@] at index = [%ld]", buf, 0x30u);

            id v10 = v39;
          }

          v33 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
          [v33 insertObject:v25 atIndex:v30];
          goto LABEL_22;
        }
        if (length != v19 && v37 == v19)
        {
LABEL_15:
          uint64_t v30 = 0;
          goto LABEL_16;
        }
      }
      char v34 = HFLogForCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        id v45 = self;
        __int16 v46 = 2112;
        v47 = v35;
        __int16 v48 = 2112;
        *(void *)unint64_t v49 = v25;
        _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "%@:%@ [Append-Operation-DM] Appending [%@] to displayed announcements", buf, 0x20u);

        id v10 = v39;
      }

      v33 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
      [v33 addObject:v25];
LABEL_22:

      ++v19;
      --v18;
    }
    while (v17 + v19 <= v42);
  }
}

- (void)_showVisitedAnnouncementsView
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__16;
  v54[4] = __Block_byref_object_dispose__16;
  id v4 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  id v55 = [v4 objectAtIndexedSubscript:0];

  double v5 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ((unint64_t)[v5 count] < 2)
  {
    uint64_t v6 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    [v6 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v6 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    [v6 objectAtIndexedSubscript:1];
  id v7 = };

  uint64_t v8 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ((unint64_t)[v8 count] < 3)
  {
  }
  else
  {
    uint64_t v9 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    id v10 = [v9 objectAtIndexedSubscript:2];

    if (v10) {
      goto LABEL_11;
    }
  }
  uint64_t v11 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  BOOL v12 = (unint64_t)[v11 count] > 1;

  if (v12)
  {
    uint64_t v13 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    id v10 = [v13 objectAtIndexedSubscript:0];
  }
  else
  {
    id v10 = 0;
  }
LABEL_11:
  __int16 v14 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ((unint64_t)[v14 count] < 3)
  {
    NSUInteger v17 = 0;
    goto LABEL_15;
  }
  uint64_t v15 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
  BOOL v16 = [v15 count] == 0;

  if (!v16)
  {
    __int16 v14 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
    NSUInteger v17 = [v14 objectAtIndexedSubscript:0];
LABEL_15:

    goto LABEL_16;
  }
  NSUInteger v17 = 0;
LABEL_16:
  uint64_t v18 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  [v18 removeAllObjects];

  uint64_t v19 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  objc_msgSend(v19, "na_safeAddObject:", v7);

  double v20 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  objc_msgSend(v20, "na_safeAddObject:", v10);

  double v21 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  objc_msgSend(v21, "na_safeAddObject:", v17);

  double v22 = HFLogForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    *(_DWORD *)buf = 138412802;
    SEL v57 = self;
    __int16 v58 = 2112;
    id v59 = v23;
    __int16 v60 = 2112;
    __int16 v61 = v24;
    _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_DEFAULT, "%@:%@ Updated data model to display announcements =  [%@]....", buf, 0x20u);
  }
  uint64_t v25 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    long long v27 = HFLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      long long v29 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
      uint64_t v30 = [v29 objectAtIndexedSubscript:0];
      *(_DWORD *)buf = 138412802;
      SEL v57 = self;
      __int16 v58 = 2112;
      id v59 = v28;
      __int16 v60 = 2112;
      __int16 v61 = v30;
      _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@:%@ Removing oldest visited announcement since we already pulled it in to display = %@.", buf, 0x20u);
    }
    uint64_t v31 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
    [v31 removeObjectAtIndex:0];
  }
  if (v17)
  {
    uint64_t v32 = [v17 superview];
    BOOL v33 = v32 == 0;

    if (v33)
    {
      char v34 = (void *)MEMORY[0x1E4F28DC8];
      v35 = [v17 constraints];
      [v34 deactivateConstraints:v35];

      v36 = [(HUAnnouncementGlobeView *)self backgroundView];
      unint64_t v37 = [v36 contentView];
      [v37 addSubview:v17];

      [v17 setAlpha:0.0];
      [(HUAnnouncementGlobeView *)self _setupConstraintsForPlaybackViewIfNeeded:v17 slotPosition:3];
    }
  }
  unint64_t v38 = HFLogForCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    id v39 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    SEL v57 = self;
    __int16 v58 = 2112;
    id v59 = v39;
    _os_log_impl(&dword_1BE345000, v38, OS_LOG_TYPE_DEFAULT, "%@:%@ Begin animating announcements", buf, 0x16u);
  }
  v40 = (void *)MEMORY[0x1E4F42FF0];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __56__HUAnnouncementGlobeView__showVisitedAnnouncementsView__block_invoke;
  v48[3] = &unk_1E638B8C0;
  id v41 = v10;
  id v49 = v41;
  __int16 v50 = self;
  id v51 = v7;
  id v42 = v17;
  id v52 = v42;
  v53 = v54;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __56__HUAnnouncementGlobeView__showVisitedAnnouncementsView__block_invoke_2;
  v44[3] = &unk_1E638B8E8;
  __int16 v46 = v54;
  SEL v47 = a2;
  v44[4] = self;
  id v43 = v51;
  id v45 = v43;
  [v40 animateWithDuration:v48 animations:v44 completion:0.25];

  _Block_object_dispose(v54, 8);
}

uint64_t __56__HUAnnouncementGlobeView__showVisitedAnnouncementsView__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) _updateLayoutAndAppearanceForPlaybackView:*(void *)(a1 + 48) atSlotPosition:1];
  }
  v2 = *(void **)(a1 + 48);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v11[0] = *MEMORY[0x1E4F1DAB8];
  v11[1] = v3;
  v11[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v11];
  [*(id *)(a1 + 48) setNeedsUpdateConstraints];
  [*(id *)(a1 + 48) setAlpha:0.5];
  [*(id *)(a1 + 40) _updateLayoutAndAppearanceForPlaybackView:*(void *)(a1 + 32) atSlotPosition:2];
  [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  [*(id *)(a1 + 32) setAlpha:0.5];
  id v4 = *(void **)(a1 + 56);
  if (v4)
  {
    [v4 alpha];
    if (v5 == 0.0)
    {
      CGAffineTransformMakeScale(&v10, 0.1, 0.1);
      uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      CGAffineTransform v9 = v10;
      [v6 setTransform:&v9];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setAlpha:0.0];
    }
  }
  [*(id *)(a1 + 40) _updateLayoutAndAppearanceForPlaybackView:*(void *)(a1 + 56) atSlotPosition:3];
  [*(id *)(a1 + 56) setAlpha:0.5];
  id v7 = [*(id *)(a1 + 40) playImageView];
  [v7 setAlpha:1.0];

  [*(id *)(a1 + 40) setLastPlayedAnnouncementID:0];
  return [*(id *)(a1 + 40) layoutIfNeeded];
}

void __56__HUAnnouncementGlobeView__showVisitedAnnouncementsView__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v3 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStartPlayback_AX_Label_Title", @"HUAnnounceStartPlayback_AX_Label_Title", 1);
    id v4 = [*(id *)(a1 + 32) tappableCoverView];
    [v4 setAccessibilityLabel:v3];

    double v5 = _HULocalizedStringWithDefaultValue(@"HUAnnounceResumePlayback_AX_Label_Hint", @"HUAnnounceResumePlayback_AX_Label_Hint", 1);
    uint64_t v6 = [*(id *)(a1 + 32) tappableCoverView];
    [v6 setAccessibilityHint:v5];

    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      CGAffineTransform v9 = NSStringFromSelector(*(SEL *)(a1 + 56));
      int v17 = 138412546;
      uint64_t v18 = v8;
      __int16 v19 = 2112;
      double v20 = v9;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Finished animating announcements.\nTearing down audio player. Updating UI state to playback stopped.", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 32) setAudioPlayer:0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) alpha];
    if (v10 == 0.0) {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeFromSuperview];
    }
    uint64_t v11 = [*(id *)(a1 + 32) globeViewDelegate];
    if (v11)
    {
      BOOL v12 = (void *)v11;
      uint64_t v13 = [*(id *)(a1 + 32) globeViewDelegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        uint64_t v15 = [*(id *)(a1 + 32) globeViewDelegate];
        BOOL v16 = [*(id *)(a1 + 40) announcementInfo];
        objc_msgSend(v15, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v16, objc_msgSend(*(id *)(a1 + 32), "totalNumberOfAnnouncements"));
      }
    }
  }
}

- (void)_layoutPlaybackViewCenteredIfNeeded:(id)a3
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 alpha];
    if (v7 == 0.0)
    {
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v6 setUserInteractionEnabled:0];
      uint64_t v8 = [(HUAnnouncementGlobeView *)self backgroundView];
      CGAffineTransform v9 = [v8 contentView];
      [v9 addSubview:v6];

      double v10 = [v6 centerXAnchor];
      uint64_t v11 = [(HUAnnouncementGlobeView *)self backgroundView];
      BOOL v12 = [v11 centerXAnchor];
      uint64_t v13 = [v10 constraintEqualToAnchor:v12 constant:0.0];
      [v6 setCenterXConstraint:v13];

      char v14 = [v6 centerYAnchor];
      uint64_t v15 = [(HUAnnouncementGlobeView *)self backgroundView];
      BOOL v16 = [v15 centerYAnchor];
      int v17 = [v14 constraintEqualToAnchor:v16 constant:0.0];
      [v6 setCenterYConstraint:v17];

      uint64_t v18 = [v6 heightAnchor];
      __int16 v19 = [v18 constraintEqualToConstant:120.0];
      [v6 setHeightConstraint:v19];

      double v20 = [v6 widthAnchor];
      uint64_t v21 = [v6 heightAnchor];
      double v22 = [v20 constraintEqualToAnchor:v21];
      [v6 setWidthConstraint:v22];

      id v23 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v24 = [v6 centerXConstraint];
      v37[0] = v24;
      uint64_t v25 = [v6 centerYConstraint];
      v37[1] = v25;
      uint64_t v26 = [v6 heightConstraint];
      v37[2] = v26;
      long long v27 = [v6 widthConstraint];
      v37[3] = v27;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
      [v23 activateConstraints:v28];

      [(HUAnnouncementGlobeView *)self layoutIfNeeded];
      long long v29 = HFLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = NSStringFromSelector(a2);
        int v31 = 138412802;
        uint64_t v32 = self;
        __int16 v33 = 2112;
        char v34 = v30;
        __int16 v35 = 2112;
        v36 = v6;
        _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "%@:%@ Playback View layout in center/default position complete for view [%@]", (uint8_t *)&v31, 0x20u);
      }
    }
  }
}

- (void)_setupConstraintsForPlaybackViewIfNeeded:(id)a3 slotPosition:(unint64_t)a4
{
  v45[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 alpha];
    if (v9 == 0.0)
    {
      [(HUAnnouncementGlobeView *)self _xCoordinateForPlaybackViewInSlotPosition:a4];
      double v11 = v10;
      [(HUAnnouncementGlobeView *)self _yCoordinateForPlaybackViewInSlotPosition:a4];
      double v13 = v12;
      [(HUAnnouncementGlobeView *)self _radiusOfPlaybackViewInSlotPosition:a4];
      double v15 = v14;
      BOOL v16 = [v8 centerXAnchor];
      int v17 = [(HUAnnouncementGlobeView *)self backgroundView];
      uint64_t v18 = [v17 centerXAnchor];
      __int16 v19 = [v16 constraintEqualToAnchor:v18 constant:v11];
      [v8 setCenterXConstraint:v19];

      double v20 = [v8 centerYAnchor];
      uint64_t v21 = [(HUAnnouncementGlobeView *)self backgroundView];
      double v22 = [v21 centerYAnchor];
      id v23 = [v20 constraintEqualToAnchor:v22 constant:v13];
      [v8 setCenterYConstraint:v23];

      uint64_t v24 = [v8 heightAnchor];
      uint64_t v25 = [v24 constraintEqualToConstant:v15 * 0.5];
      [v8 setHeightConstraint:v25];

      uint64_t v26 = [v8 widthAnchor];
      long long v27 = [v8 heightAnchor];
      id v28 = [v26 constraintEqualToAnchor:v27];
      [v8 setWidthConstraint:v28];

      long long v29 = (void *)MEMORY[0x1E4F28DC8];
      uint64_t v30 = [v8 centerXConstraint];
      v45[0] = v30;
      int v31 = [v8 centerYConstraint];
      v45[1] = v31;
      uint64_t v32 = [v8 heightConstraint];
      v45[2] = v32;
      __int16 v33 = [v8 widthConstraint];
      v45[3] = v33;
      char v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
      [v29 activateConstraints:v34];

      [v8 setNeedsUpdateConstraints];
      [(HUAnnouncementGlobeView *)self layoutIfNeeded];
      __int16 v35 = HFLogForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = NSStringFromSelector(a2);
        int v37 = 138413058;
        unint64_t v38 = self;
        __int16 v39 = 2112;
        v40 = v36;
        __int16 v41 = 2112;
        id v42 = v8;
        __int16 v43 = 2048;
        unint64_t v44 = a4;
        _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@ Setting up playback view [%@] to display in slot [%lu]", (uint8_t *)&v37, 0x2Au);
      }
    }
  }
}

- (void)_updateLayoutAndAppearanceForPlaybackView:(id)a3 atSlotPosition:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [(HUAnnouncementGlobeView *)self _xCoordinateForPlaybackViewInSlotPosition:a4];
  double v9 = v8;
  [(HUAnnouncementGlobeView *)self _yCoordinateForPlaybackViewInSlotPosition:a4];
  double v11 = v10;
  [(HUAnnouncementGlobeView *)self _radiusOfPlaybackViewInSlotPosition:a4];
  double v13 = v12;
  double v14 = [v7 centerXConstraint];
  [v14 setConstant:v9];

  double v15 = [v7 centerYConstraint];
  [v15 setConstant:v11];

  BOOL v16 = [v7 heightConstraint];
  [v16 setConstant:v13 + v13];

  int v17 = [v7 fullyPlayed];
  double v18 = 1.0;
  if (v17) {
    double v18 = 0.5;
  }
  [v7 setAlpha:v18];
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v22[0] = *MEMORY[0x1E4F1DAB8];
  v22[1] = v19;
  v22[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v7 setTransform:v22];
  double v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    uint64_t v24 = self;
    __int16 v25 = 2112;
    uint64_t v26 = v21;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2048;
    unint64_t v30 = a4;
    _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating constraints and alpha for playback view [%@] in Slot Position [%lu]", buf, 0x2Au);
  }
}

- (double)_xCoordinateForPlaybackViewInSlotPosition:(unint64_t)a3
{
  if (a3 == 3)
  {
    id v4 = [(HUAnnouncementGlobeView *)self backgroundView];
    [v4 bounds];
    double v6 = v8 * 0.5 + -49.6;
    double v7 = -0.0871557427;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    id v4 = [(HUAnnouncementGlobeView *)self backgroundView];
    [v4 bounds];
    double v6 = v9 * 0.5 + -44.0;
    double v7 = 0.965925826;
    goto LABEL_7;
  }
  double v3 = 0.0;
  if (a3 == 1)
  {
    id v4 = [(HUAnnouncementGlobeView *)self backgroundView];
    [v4 bounds];
    double v6 = v5 * 0.5 + -54.0;
    double v7 = -0.707106781;
LABEL_7:
    double v3 = v6 * v7;
  }
  return v3;
}

- (double)_yCoordinateForPlaybackViewInSlotPosition:(unint64_t)a3
{
  if (a3 == 3)
  {
    id v4 = [(HUAnnouncementGlobeView *)self backgroundView];
    [v4 bounds];
    double v6 = v8 * 0.5 + -49.6;
    double v7 = 0.996194698;
    goto LABEL_7;
  }
  if (a3 == 2)
  {
    id v4 = [(HUAnnouncementGlobeView *)self backgroundView];
    [v4 bounds];
    double v6 = v9 * 0.5 + -44.0;
    double v7 = 0.258819045;
    goto LABEL_7;
  }
  double v3 = 0.0;
  if (a3 == 1)
  {
    id v4 = [(HUAnnouncementGlobeView *)self backgroundView];
    [v4 bounds];
    double v6 = v5 * 0.5 + -54.0;
    double v7 = -0.707106781;
LABEL_7:
    double v3 = v6 * v7;
  }
  return v3;
}

- (double)_radiusOfPlaybackViewInSlotPosition:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 60.0;
  }
  else {
    return dbl_1BEA1A098[a3 - 1];
  }
}

- (id)_nextAnnouncementPlaybackView
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  double v3 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  id v4 = [v3 objectAtIndexedSubscript:0];

  double v5 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  double v6 = 0;
  if ((unint64_t)[v5 count] >= 2)
  {
    double v7 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    double v6 = [v7 objectAtIndexedSubscript:1];
  }
  double v8 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ((unint64_t)[v8 count] <= 2)
  {

    double v11 = 0;
    BOOL v12 = 0;
    double v10 = 0;
LABEL_9:
    int v13 = 0;
    goto LABEL_29;
  }
  double v9 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  double v10 = [v9 objectAtIndexedSubscript:2];

  if (!v10)
  {
    double v11 = 0;
    BOOL v12 = 0;
    goto LABEL_9;
  }
  if ([v10 fullyPlayed])
  {
    double v11 = 0;
    BOOL v12 = 0;
  }
  else
  {
    __int16 v48 = v6;
    id v49 = v4;
    double v14 = objc_opt_new();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    double v15 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v53;
      uint64_t v19 = *MEMORY[0x1E4F4A4E8];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v53 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v21 = [*(id *)(*((void *)&v52 + 1) + 8 * i) announcementInfo];
          double v22 = [v21 objectForKeyedSubscript:v19];

          [v14 addObject:v22];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v17);
    }

    id v23 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
    if ([v23 count])
    {
      uint64_t v24 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
      __int16 v25 = [v24 firstObject];
    }
    else
    {
      __int16 v25 = 0;
    }

    SEL v47 = v25;
    uint64_t v26 = [v25 announcementInfo];
    __int16 v27 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];

    double v11 = [(HUAnnouncementGlobeView *)self _onQueue_fetchNewAnnouncementInfo:v14 oldestVisitedAnnouncementID:v27];
    id v28 = HFLogForCategory();
    double v6 = v48;
    id v4 = v49;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      SEL v57 = self;
      __int16 v58 = 2112;
      id v59 = v29;
      __int16 v60 = 2112;
      __int16 v61 = v11;
      _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, "%@:%@ Next Announcement Info to bring into visibility = [%@]", buf, 0x20u);
    }
    BOOL v12 = v11 != 0;
    if (v11)
    {
      unint64_t v30 = [HUAnnouncementPlaybackView alloc];
      uint64_t v31 = -[HUAnnouncementPlaybackView initWithFrame:](v30, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(HUAnnouncementPlaybackView *)v31 setAnnouncementInfo:v11];
    }
    else
    {
      uint64_t v31 = 0;
    }

    if (v31)
    {
      if (!v11) {
        goto LABEL_45;
      }
      goto LABEL_34;
    }
  }
  int v13 = 1;
LABEL_29:
  uint64_t v32 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
  uint64_t v31 = (HUAnnouncementPlaybackView *)[v32 count];

  if (v31)
  {
    __int16 v33 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
    uint64_t v31 = [v33 objectAtIndexedSubscript:0];

    char v34 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
    [v34 removeObjectAtIndex:0];

    __int16 v35 = HFLogForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      SEL v57 = self;
      __int16 v58 = 2112;
      id v59 = v36;
      __int16 v60 = 2112;
      __int16 v61 = v31;
      _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%@:%@ No, new announcements found. Removing the oldest visited announcement [%@]", buf, 0x20u);
    }
    if (([v4 isEqual:v31] & 1) == 0)
    {
      [(HUAnnouncementPlaybackView *)v31 setAlpha:0.0];
      if (v6) {
        int v38 = 1;
      }
      else {
        int v38 = v13;
      }
      if (v10 == 0 && v6 != 0) {
        uint64_t v37 = 2;
      }
      else {
        uint64_t v37 = 3;
      }
      if (((v12 | v38) & 1) == 0) {
        goto LABEL_45;
      }
      goto LABEL_42;
    }
  }
  if (!v12) {
    goto LABEL_45;
  }
LABEL_34:
  uint64_t v37 = 3;
LABEL_42:
  __int16 v39 = HFLogForCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    SEL v57 = self;
    __int16 v58 = 2112;
    id v59 = v40;
    __int16 v60 = 2048;
    __int16 v61 = (HUAnnouncementPlaybackView *)v37;
    _os_log_impl(&dword_1BE345000, v39, OS_LOG_TYPE_DEFAULT, "%@:%@ Now displaying the next announcement in slot position [%lu]", buf, 0x20u);
  }
  __int16 v41 = (void *)MEMORY[0x1E4F28DC8];
  id v42 = [(HUAnnouncementPlaybackView *)v31 constraints];
  [v41 deactivateConstraints:v42];

  [(HUAnnouncementPlaybackView *)v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(HUAnnouncementPlaybackView *)v31 setUserInteractionEnabled:0];
  __int16 v43 = [(HUAnnouncementGlobeView *)self backgroundView];
  unint64_t v44 = [v43 contentView];
  [v44 addSubview:v31];

  [(HUAnnouncementPlaybackView *)v31 setAlpha:0.0];
  long long v45 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v51[0] = *MEMORY[0x1E4F1DAB8];
  v51[1] = v45;
  v51[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(HUAnnouncementPlaybackView *)v31 setTransform:v51];
  [(HUAnnouncementGlobeView *)self _setupConstraintsForPlaybackViewIfNeeded:v31 slotPosition:v37];
LABEL_45:

  return v31;
}

- (void)_togglePlayback:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HUAnnouncementGlobeView *)self audioPlayer];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(HUAnnouncementGlobeView *)self audioPlayer];
    char v8 = [v7 isPlaying];

    if (v8)
    {
      if (a3)
      {
        double v9 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
        double v10 = [v9 objectAtIndexedSubscript:0];

        double v11 = [v10 announcementInfo];
        BOOL v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];

        [(HUAnnouncementGlobeView *)self _submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:1 forAnnouncementID:v12 interruptedByUser:1];
      }
      [(HUAnnouncementGlobeView *)self stopPlayback];
      return;
    }
  }
  int v13 = [(HUAnnouncementGlobeView *)self lastPlayedAnnouncementID];
  if (v13)
  {
    double v14 = [(HUAnnouncementGlobeView *)self announcementsInfo];
    double v15 = [(HUAnnouncementGlobeView *)self lastPlayedAnnouncementID];
    [v14 objectForKeyedSubscript:v15];
  }
  else
  {
    double v14 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    double v15 = [v14 objectAtIndexedSubscript:0];
    [v15 announcementInfo];
  uint64_t v16 = };

  uint64_t v17 = [(HUAnnouncementGlobeView *)self audioPlayer];

  if (!v17)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v19 = [v16 objectForKeyedSubscript:*MEMORY[0x1E4F4A568]];
    double v20 = [v18 fileURLWithPath:v19];

    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4F68F20]) initWithAudioFileURL:v20 audioSessionOptions:2 delegate:self];
    [(HUAnnouncementGlobeView *)self setAudioPlayer:v21];
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  double v22 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v22);
        }
        __int16 v27 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v28 = [(HUAnnouncementGlobeView *)self lastPlayedAnnouncementID];

        if (v28)
        {
          if ([v27 fullyPlayed]) {
            double v29 = 0.5;
          }
          else {
            double v29 = 1.0;
          }
        }
        else
        {
          if (!a3) {
            continue;
          }
          [v27 setFullyPlayed:0];
          double v29 = 1.0;
        }
        [v27 setAlpha:v29];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v24);
  }

  unint64_t v30 = [(HUAnnouncementGlobeView *)self lastPlayedAnnouncementID];

  if (!v30)
  {
    uint64_t v31 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
    [v31 makeObjectsPerformSelector:sel_setFullyPlayed_ withObject:MEMORY[0x1E4F1CC28]];
  }
  uint64_t v32 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  __int16 v33 = [v32 objectAtIndexedSubscript:0];

  int v34 = [v33 fullyPlayed];
  double v35 = 1.0;
  if (v34) {
    double v35 = 0.5;
  }
  [v33 setAlpha:v35];
  [(HUAnnouncementGlobeView *)self _playAnnouncementWithInfo:v16];
  v36 = [(HUAnnouncementGlobeView *)self playImageView];
  [v36 setAlpha:0.0];

  uint64_t v37 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopPlayback_AX_Label_Title", @"HUAnnounceStopPlayback_AX_Label_Title", 1);
  int v38 = [(HUAnnouncementGlobeView *)self tappableCoverView];
  [v38 setAccessibilityLabel:v37];

  __int16 v39 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopPlayback_AX_Label_Hint", @"HUAnnounceStopPlayback_AX_Label_Hint", 1);
  v40 = [(HUAnnouncementGlobeView *)self tappableCoverView];
  [v40 setAccessibilityHint:v39];

  uint64_t v41 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
  if (v41)
  {
    id v42 = (void *)v41;
    __int16 v43 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
    char v44 = objc_opt_respondsToSelector();

    if (v44)
    {
      long long v45 = [(HUAnnouncementGlobeView *)self globeViewDelegate];
      objc_msgSend(v45, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v16, -[HUAnnouncementGlobeView totalNumberOfAnnouncements](self, "totalNumberOfAnnouncements"));
    }
  }
}

- (void)_playRecentlyAddedAnnouncements
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HUAnnouncementGlobeView *)self audioPlayer];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [(HUAnnouncementGlobeView *)self audioPlayer],
        double v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isPlaying],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    char v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v28 = self;
      __int16 v29 = 2112;
      unint64_t v30 = v9;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@ Not playing the next announcement since audio player is busy playing", buf, 0x16u);
    }
  }
  else
  {
    double v10 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    double v11 = [v10 objectAtIndexedSubscript:0];
    id v26 = [v11 announcementInfo];

    BOOL v12 = [(HUAnnouncementGlobeView *)self audioPlayer];

    if (!v12)
    {
      int v13 = (void *)MEMORY[0x1E4F1CB10];
      double v14 = [v26 objectForKeyedSubscript:*MEMORY[0x1E4F4A568]];
      double v15 = [v13 fileURLWithPath:v14];

      uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F68F20]) initWithAudioFileURL:v15 audioSessionOptions:2 delegate:self];
      [(HUAnnouncementGlobeView *)self setAudioPlayer:v16];
    }
    uint64_t v17 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    uint64_t v18 = [v17 objectAtIndexedSubscript:0];

    int v19 = [v18 fullyPlayed];
    double v20 = 1.0;
    if (v19) {
      double v20 = 0.5;
    }
    [v18 setAlpha:v20];
    [(HUAnnouncementGlobeView *)self _playAnnouncementWithInfo:v26];
    uint64_t v21 = [(HUAnnouncementGlobeView *)self playImageView];
    [v21 setAlpha:0.0];

    double v22 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopPlayback_AX_Label_Title", @"HUAnnounceStopPlayback_AX_Label_Title", 1);
    uint64_t v23 = [(HUAnnouncementGlobeView *)self tappableCoverView];
    [v23 setAccessibilityLabel:v22];

    uint64_t v24 = _HULocalizedStringWithDefaultValue(@"HUAnnounceStopPlayback_AX_Label_Hint", @"HUAnnounceStopPlayback_AX_Label_Hint", 1);
    uint64_t v25 = [(HUAnnouncementGlobeView *)self tappableCoverView];
    [v25 setAccessibilityHint:v24];
  }
}

- (void)_playAnnouncementWithInfo:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  char v7 = [v6 objectAtIndexedSubscript:0];

  char v8 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
  double v9 = [v8 lastObject];
  char v10 = [v9 isEqual:v7];

  if ((v10 & 1) == 0)
  {
    double v11 = [(HUAnnouncementGlobeView *)self visitedAnnouncements];
    [v11 addObject:v7];

    BOOL v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      __int16 v29 = self;
      __int16 v30 = 2112;
      id v31 = v13;
      __int16 v32 = 2112;
      __int16 v33 = v7;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Adding and Playing announcement to visited list [%@]", buf, 0x20u);
    }
  }
  double v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v7 announcementInfo];
    *(_DWORD *)buf = 138412802;
    __int16 v29 = self;
    __int16 v30 = 2112;
    id v31 = v15;
    __int16 v32 = 2112;
    __int16 v33 = v16;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ Now Playing announcement with Info [%@]", buf, 0x20u);
  }
  uint64_t v17 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v18 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4A568]];
  int v19 = [v17 fileURLWithPath:v18];

  double v20 = [(HUAnnouncementGlobeView *)self audioPlayer];
  [v20 updateAudioFileURL:v19];

  uint64_t v21 = [(HUAnnouncementGlobeView *)self audioPlayer];
  id v27 = 0;
  [v21 prepareToPlay:&v27];
  id v22 = v27;

  if (v22)
  {
    uint64_t v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v29 = v19;
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "Audio Player Failed to prepare for announcement URL [%@] with reason[%@]", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v24 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];
    [(HUAnnouncementGlobeView *)self setLastPlayedAnnouncementID:v24];

    uint64_t v25 = [(HUAnnouncementGlobeView *)self audioPlayer];
    [v25 play];

    uint64_t v23 = [(HUAnnouncementGlobeView *)self announceRemotePlaybackSession];
    id v26 = [(HUAnnouncementGlobeView *)self lastPlayedAnnouncementID];
    [v23 setPlaybackStartedForAnnouncement:v26];
  }
}

- (void)_playNextAnnouncement
{
  double v3 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  if ((unint64_t)[v3 count] >= 2
    && [(HUAnnouncementGlobeView *)self _numberOfUnplayedAnnouncements])
  {
    BOOL v4 = [(HUAnnouncementGlobeView *)self _isNextAnnouncementTheOldest];

    if (!v4)
    {
      id v5 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
      double v6 = [v5 objectAtIndexedSubscript:0];

      char v7 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
      char v8 = 0;
      if ((unint64_t)[v7 count] >= 2)
      {
        double v9 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
        char v8 = [v9 objectAtIndexedSubscript:1];
      }
      char v10 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
      if ((unint64_t)[v10 count] < 3)
      {
        BOOL v12 = 0;
      }
      else
      {
        double v11 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
        BOOL v12 = [v11 objectAtIndexedSubscript:2];
      }
      int v13 = [(HUAnnouncementGlobeView *)self _nextAnnouncementPlaybackView];
      double v14 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
      [v14 addObject:v13];

      double v15 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
      [v15 removeObjectAtIndex:0];

      uint64_t v16 = (void *)MEMORY[0x1E4F42FF0];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __48__HUAnnouncementGlobeView__playNextAnnouncement__block_invoke;
      v25[3] = &unk_1E638B910;
      v25[4] = self;
      id v26 = v8;
      id v27 = v13;
      id v28 = v6;
      id v29 = v12;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __48__HUAnnouncementGlobeView__playNextAnnouncement__block_invoke_2;
      v21[3] = &unk_1E6386368;
      id v22 = v28;
      uint64_t v23 = self;
      id v24 = v26;
      id v17 = v26;
      id v18 = v28;
      id v19 = v12;
      id v20 = v13;
      [v16 animateWithDuration:v25 animations:v21 completion:0.5];

      return;
    }
  }
  else
  {
  }

  [(HUAnnouncementGlobeView *)self _showVisitedAnnouncementsView];
}

uint64_t __48__HUAnnouncementGlobeView__playNextAnnouncement__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLayoutAndAppearanceForPlaybackView:*(void *)(a1 + 40) atSlotPosition:1];
  if ([*(id *)(a1 + 48) isEqual:*(void *)(a1 + 56)])
  {
    if (*(void *)(a1 + 64)) {
      uint64_t v2 = 3;
    }
    else {
      uint64_t v2 = 2;
    }
    [*(id *)(a1 + 32) _updateLayoutAndAppearanceForPlaybackView:*(void *)(a1 + 48) atSlotPosition:v2];
    CGAffineTransformMakeScale(&v19, 1.0, 1.0);
    double v3 = *(void **)(a1 + 48);
    CGAffineTransform v18 = v19;
    BOOL v4 = &v18;
  }
  else
  {
    [*(id *)(a1 + 56) setAlpha:0.0];
    CGAffineTransformMakeScale(&v17, 0.1, 0.1);
    id v5 = *(void **)(a1 + 56);
    CGAffineTransform v16 = v17;
    [v5 setTransform:&v16];
    double v6 = [*(id *)(a1 + 48) heightConstraint];
    [v6 setConstant:35.2];

    char v7 = *(void **)(a1 + 48);
    int v8 = [v7 fullyPlayed];
    double v9 = 1.0;
    if (v8) {
      double v9 = 0.5;
    }
    [v7 setAlpha:v9];
    CGAffineTransformMakeScale(&v15, 1.0, 1.0);
    double v3 = *(void **)(a1 + 48);
    CGAffineTransform v14 = v15;
    BOOL v4 = &v14;
  }
  objc_msgSend(v3, "setTransform:", v4, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
  [*(id *)(a1 + 32) _updateLayoutAndAppearanceForPlaybackView:*(void *)(a1 + 64) atSlotPosition:2];
  char v10 = *(void **)(a1 + 40);
  int v11 = [v10 fullyPlayed];
  double v12 = 1.0;
  if (v11) {
    double v12 = 0.5;
  }
  [v10 setAlpha:v12];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __48__HUAnnouncementGlobeView__playNextAnnouncement__block_invoke_2(id *a1, int a2)
{
  if (a2)
  {
    [a1[4] alpha];
    if (v3 == 0.0) {
      [a1[4] removeFromSuperview];
    }
    uint64_t v4 = [a1[5] globeViewDelegate];
    if (v4)
    {
      id v5 = (void *)v4;
      double v6 = [a1[5] globeViewDelegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        int v8 = [a1[5] globeViewDelegate];
        double v9 = [a1[6] announcementInfo];
        objc_msgSend(v8, "didSelectItemWithInfo:totalNumberOfAnnouncements:", v9, objc_msgSend(a1[5], "totalNumberOfAnnouncements"));
      }
    }
    id v10 = a1[5];
    id v11 = [a1[6] announcementInfo];
    [v10 _playAnnouncementWithInfo:v11];
  }
}

- (unint64_t)_numberOfUnplayedAnnouncements
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (v8) {
          v5 += [v8 fullyPlayed] ^ 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)_isNextAnnouncementTheOldest
{
  uint64_t v3 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  unint64_t v4 = [v3 count];

  if (v4 < 2) {
    return 1;
  }
  unint64_t v5 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  uint64_t v6 = [v5 objectAtIndexedSubscript:1];
  char v7 = [v6 announcementInfo];

  int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F4A788]];
  uint64_t v9 = [v8 unsignedIntegerValue];

  BOOL v10 = v9 == 0;
  return v10;
}

- (id)_onQueue_fetchNewAnnouncementInfo:(id)a3 oldestVisitedAnnouncementID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__16;
  uint64_t v23 = __Block_byref_object_dispose__16;
  id v24 = 0;
  uint64_t v9 = [(HUAnnouncementGlobeView *)self dataSourceUpdateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HUAnnouncementGlobeView__onQueue_fetchNewAnnouncementInfo_oldestVisitedAnnouncementID___block_invoke;
  block[3] = &unk_1E638B938;
  block[4] = self;
  id v15 = v7;
  CGAffineTransform v17 = &v19;
  SEL v18 = a2;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(v9, block);

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __89__HUAnnouncementGlobeView__onQueue_fetchNewAnnouncementInfo_oldestVisitedAnnouncementID___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) announcementIDs];
  uint64_t v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:0];
  unint64_t v4 = [v2 indexOfObject:v3];

  unint64_t v5 = [*(id *)(a1 + 32) announcementIDs];
  uint64_t v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:1];
  uint64_t v7 = [v5 indexOfObject:v6];

  id v8 = [*(id *)(a1 + 32) announcementIDs];
  uint64_t v9 = [*(id *)(a1 + 40) objectAtIndexedSubscript:2];
  unint64_t v10 = [v8 indexOfObject:v9];

  if (*(void *)(a1 + 48))
  {
    id v11 = [*(id *)(a1 + 32) announcementIDs];
    uint64_t v12 = [v11 indexOfObject:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v12 = 0;
  }
  long long v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = NSStringFromSelector(*(SEL *)(a1 + 64));
    int v25 = 138413570;
    uint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2048;
    unint64_t v30 = v4;
    __int16 v31 = 2048;
    uint64_t v32 = v7;
    __int16 v33 = 2048;
    unint64_t v34 = v10;
    __int16 v35 = 2048;
    uint64_t v36 = v12;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ Displayed announcement indexes = [%lu, %lu, %lu] & Oldest Visited Index = %lu", (uint8_t *)&v25, 0x3Eu);
  }
  if (v4 <= v10) {
    unint64_t v16 = v10;
  }
  else {
    unint64_t v16 = v4;
  }
  unint64_t v17 = v16 + 1;
  if (v16 + 1 != v12 && (v17 != v10 && v4 >= v10 && v17 != v7 || v10 >= v4 && v17 != v4 && v17 != v7))
  {
    SEL v18 = [*(id *)(a1 + 32) announcementIDs];
    if ([v18 count] > v17)
    {
      uint64_t v19 = [*(id *)(a1 + 32) announcementIDs];
      uint64_t v20 = [v19 objectAtIndexedSubscript:v17];

      if (!v20) {
        return;
      }
      uint64_t v21 = [*(id *)(a1 + 32) announcementsInfo];
      uint64_t v22 = [v21 objectForKeyedSubscript:v20];
      uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
      id v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;

      SEL v18 = (void *)v20;
    }
  }
}

- (id)_blurEffectForCurrentInterfaceStyle
{
  uint64_t v2 = [(HUAnnouncementGlobeView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  unint64_t v5 = (void *)MEMORY[0x1E4F427D8];

  return (id)[v5 effectWithStyle:v4];
}

- (void)audioPlayer:(id)a3 didUpdateAveragePower:(double)a4
{
  if ([a3 isPlaying])
  {
    uint64_t v6 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
    id v7 = [v6 objectAtIndexedSubscript:0];

    [v7 didUpdateAveragePower:a4];
  }
}

- (void)audioPlayer:(id)a3 didPausePlaybackWithReason:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSStringFromSelector(a2);
    int v13 = 138412802;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    unint64_t v16 = v8;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Playback paused with reason [%@]", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v9 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  unint64_t v10 = [v9 objectAtIndexedSubscript:0];

  id v11 = [v10 announcementInfo];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];

  [(HUAnnouncementGlobeView *)self _submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:1 forAnnouncementID:v12 interruptedByUser:0];
  [(HUAnnouncementGlobeView *)self stopPlayback];
}

- (void)audioPlayerDidFinishPlayback:(id)a3 withError:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HUAnnouncementGlobeView *)self currentlyDisplayedAnnouncements];
  id v8 = [v7 objectAtIndexedSubscript:0];

  [v8 setFullyPlayed:1];
  [v8 playbackStopped];
  uint64_t v9 = [v8 announcementInfo];
  unint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F4A4E8]];

  id v11 = [(HUAnnouncementGlobeView *)self announceRemotePlaybackSession];
  [v11 setPlaybackStoppedForAnnouncement:v10];

  uint64_t v12 = HFLogForCategory();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v13)
    {
      uint64_t v14 = NSStringFromSelector(a2);
      int v18 = 138413058;
      uint64_t v19 = self;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      __int16 v24 = 2112;
      id v25 = v6;
      __int16 v15 = "%@:%@ Error finishing playing announcement [%@] - Error %@";
      unint64_t v16 = v12;
      uint32_t v17 = 42;
LABEL_6:
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v18, v17);
    }
  }
  else if (v13)
  {
    uint64_t v14 = NSStringFromSelector(a2);
    int v18 = 138412802;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v14;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    __int16 v15 = "%@:%@ Successfully Finished playing announcement [%@]";
    unint64_t v16 = v12;
    uint32_t v17 = 32;
    goto LABEL_6;
  }

  [(HUAnnouncementGlobeView *)self _submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:v6 == 0 forAnnouncementID:v10 interruptedByUser:0];
  [(HUAnnouncementGlobeView *)self _playNextAnnouncement];
}

- (void)_submitAnalyticsForAnnouncePlaybackCompletedSuccessfully:(BOOL)a3 forAnnouncementID:(id)a4 interruptedByUser:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v9 = [(HUAnnouncementGlobeView *)self audioPlayer];
  uint64_t v10 = [v9 playerStopSource];

  id v11 = [(HUAnnouncementGlobeView *)self audioPlayer];
  [v11 duration];
  double v13 = v12;

  id v26 = (id)objc_opt_new();
  uint64_t v14 = [NSNumber numberWithDouble:v13];
  [v26 setObject:v14 forKey:*MEMORY[0x1E4F68080]];

  __int16 v15 = [NSNumber numberWithInt:!v6];
  [v26 setObject:v15 forKey:*MEMORY[0x1E4F68088]];

  [v26 setObject:v8 forKey:*MEMORY[0x1E4F68078]];
  unint64_t v16 = [NSNumber numberWithBool:v5];
  [v26 setObject:v16 forKey:*MEMORY[0x1E4F680A0]];

  uint32_t v17 = [NSNumber numberWithInt:(v10 & 0xFFFFFFFFFFFFFFFELL) == 2];
  [v26 setObject:v17 forKey:*MEMORY[0x1E4F68098]];

  int v18 = [NSNumber numberWithInt:v10 == 4];
  [v26 setObject:v18 forKey:*MEMORY[0x1E4F68090]];

  uint64_t v19 = [(HUAnnouncementGlobeView *)self audioPlayer];
  __int16 v20 = [v19 routeChangeReason];

  if (v20)
  {
    uint64_t v21 = [(HUAnnouncementGlobeView *)self audioPlayer];
    __int16 v22 = [v21 routeChangeReason];
    [v26 setObject:v22 forKey:*MEMORY[0x1E4F682C8]];
  }
  uint64_t v23 = [NSNumber numberWithUnsignedChar:_AXSShowAudioTranscriptions()];
  [v26 setObject:v23 forKey:*MEMORY[0x1E4F68130]];

  __int16 v24 = (void *)MEMORY[0x1E4F68EE0];
  id v25 = (void *)[v26 copy];
  [v24 sendEvent:19 withData:v25];
}

- (NSString)selectedAnnouncementID
{
  return self->_selectedAnnouncementID;
}

- (void)setSelectedAnnouncementID:(id)a3
{
}

- (CGSize)playbackBoundingBoxSize
{
  double width = self->_playbackBoundingBoxSize.width;
  double height = self->_playbackBoundingBoxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPlaybackBoundingBoxSize:(CGSize)a3
{
  self->_playbackBoundingBoxSize = a3;
}

- (void)setHasActivePlaybackSession:(BOOL)a3
{
  self->_hasActivePlaybackSession = a3;
}

- (NSMutableDictionary)announcementsInfo
{
  return self->_announcementsInfo;
}

- (void)setAnnouncementsInfo:(id)a3
{
}

- (NSMutableArray)announcementIDs
{
  return self->_announcementIDs;
}

- (void)setAnnouncementIDs:(id)a3
{
}

- (NSMutableArray)currentlyDisplayedAnnouncements
{
  return self->_currentlyDisplayedAnnouncements;
}

- (void)setCurrentlyDisplayedAnnouncements:(id)a3
{
}

- (NSMutableArray)visitedAnnouncements
{
  return self->_visitedAnnouncements;
}

- (void)setVisitedAnnouncements:(id)a3
{
}

- (NSString)announcementGroupID
{
  return self->_announcementGroupID;
}

- (void)setAnnouncementGroupID:(id)a3
{
}

- (ANRemotePlaybackSession)announceRemotePlaybackSession
{
  return self->_announceRemotePlaybackSession;
}

- (void)setAnnounceRemotePlaybackSession:(id)a3
{
}

- (OS_dispatch_queue)dataSourceUpdateQueue
{
  return self->_dataSourceUpdateQueue;
}

- (void)setDataSourceUpdateQueue:(id)a3
{
}

- (HUAnnouncementsGlobeViewDelegate)globeViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_globeViewDelegate);

  return (HUAnnouncementsGlobeViewDelegate *)WeakRetained;
}

- (void)setGlobeViewDelegate:(id)a3
{
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (NSString)lastPlayedAnnouncementID
{
  return self->_lastPlayedAnnouncementID;
}

- (void)setLastPlayedAnnouncementID:(id)a3
{
}

- (HFAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)tappableCoverView
{
  return self->_tappableCoverView;
}

- (void)setTappableCoverView:(id)a3
{
}

- (UIImageView)playImageView
{
  return self->_playImageView;
}

- (void)setPlayImageView:(id)a3
{
}

- (UILabel)announcementsProgressLabel
{
  return self->_announcementsProgressLabel;
}

- (void)setAnnouncementsProgressLabel:(id)a3
{
}

- (unint64_t)totalNumberOfAnnouncements
{
  return self->_totalNumberOfAnnouncements;
}

- (void)setTotalNumberOfAnnouncements:(unint64_t)a3
{
  self->_totalNumberOfAnnouncements = a3;
}

- (int64_t)seedOnceToken
{
  return self->_seedOnceToken;
}

- (void)setSeedOnceToken:(int64_t)a3
{
  self->_int64_t seedOnceToken = a3;
}

- (int64_t)displayVisitedOnceToken
{
  return self->_displayVisitedOnceToken;
}

- (void)setDisplayVisitedOnceToken:(int64_t)a3
{
  self->_displayVisitedOnceToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_announcementsProgressLabel, 0);
  objc_storeStrong((id *)&self->_playImageView, 0);
  objc_storeStrong((id *)&self->_tappableCoverView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_lastPlayedAnnouncementID, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_globeViewDelegate);
  objc_storeStrong((id *)&self->_dataSourceUpdateQueue, 0);
  objc_storeStrong((id *)&self->_announceRemotePlaybackSession, 0);
  objc_storeStrong((id *)&self->_announcementGroupID, 0);
  objc_storeStrong((id *)&self->_visitedAnnouncements, 0);
  objc_storeStrong((id *)&self->_currentlyDisplayedAnnouncements, 0);
  objc_storeStrong((id *)&self->_announcementIDs, 0);
  objc_storeStrong((id *)&self->_announcementsInfo, 0);

  objc_storeStrong((id *)&self->_selectedAnnouncementID, 0);
}

@end
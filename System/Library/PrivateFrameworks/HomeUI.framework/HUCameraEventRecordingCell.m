@interface HUCameraEventRecordingCell
+ (id)backgroundColor;
- (BOOL)hasFamiliarFaces;
- (BOOL)portraitMode;
- (CALayer)badgeLayer;
- (CALayer)debugMarkerLayer;
- (HMCameraClip)recordingEvent;
- (HUCameraEventRecordingCell)initWithFrame:(CGRect)a3;
- (HUClipScrubberTimeController)timeController;
- (HURecordingEventCellFamiliarFacesView)familiarFacesView;
- (UIView)dayBoundaryView;
- (UIView)posterFramesContainerView;
- (id)_badgeImageForSignificantEventReasons:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)displayMode;
- (unint64_t)numberOfFramesNeeded;
- (void)_updateBadgeLayerWithImage:(id)a3 inRect:(CGRect)a4;
- (void)addDayBoundaryIfNeeded;
- (void)addDebugMarker;
- (void)addPosterFrameViews;
- (void)dealloc;
- (void)displayReachabilityErrorUI;
- (void)drawEventMarkers;
- (void)hideFamiliarFaces;
- (void)prepareForReuse;
- (void)preparePosterFrameViewsForReuse;
- (void)setBadgeLayer:(id)a3;
- (void)setDayBoundaryView:(id)a3;
- (void)setDebugMarkerLayer:(id)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setFamiliarFacesView:(id)a3;
- (void)setHasFamiliarFaces:(BOOL)a3;
- (void)setPortraitMode:(BOOL)a3;
- (void)setPosterFramesContainerView:(id)a3;
- (void)setRecordingEvent:(id)a3;
- (void)setTimeController:(id)a3;
- (void)showFamiliarFacesWithMaxWidth:(double)a3;
- (void)updateBadgeLayerWithEvents:(id)a3 inRect:(CGRect)a4;
- (void)updateFamiliarFaces;
- (void)updateVideoCacheMarker;
- (void)updateWithCameraClipEvent:(id)a3 mode:(unint64_t)a4 portraitMode:(BOOL)a5 timeController:(id)a6;
- (void)videoCacheDidAddVideo:(id)a3;
- (void)videoCacheDidRemoveVideo:(id)a3;
@end

@implementation HUCameraEventRecordingCell

- (HUCameraEventRecordingCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HUCameraEventRecordingCell;
  v3 = -[HUCameraEventRecordingCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(HUCameraEventRecordingCell *)v3 posterFramesContainerView];
    [(HUCameraEventRecordingCell *)v4 addSubview:v5];

    v6 = [(HUCameraEventRecordingCell *)v4 dayBoundaryView];
    [(HUCameraEventRecordingCell *)v4 addSubview:v6];

    v7 = [(HUCameraEventRecordingCell *)v4 layer];
    [v7 setCornerRadius:8.0];

    [(HUCameraEventRecordingCell *)v4 setOpaque:0];
    v8 = [(HUCameraEventRecordingCell *)v4 familiarFacesView];
    [(HUCameraEventRecordingCell *)v4 addSubview:v8];

    if ([MEMORY[0x1E4F68FF8] markCachedVideoAsGreenInTimeline])
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:v4 selector:sel_videoCacheDidAddVideo_ name:*MEMORY[0x1E4F68390] object:0];

      v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:v4 selector:sel_videoCacheDidRemoveVideo_ name:*MEMORY[0x1E4F68398] object:0];
    }
  }
  return v4;
}

- (void)dealloc
{
  if ([MEMORY[0x1E4F68FF8] markCachedVideoAsGreenInTimeline])
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)HUCameraEventRecordingCell;
  [(HUCameraEventRecordingCell *)&v4 dealloc];
}

- (void)videoCacheDidAddVideo:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
  v6 = [(HUCameraEventRecordingCell *)self recordingEvent];
  v7 = [v6 uniqueIdentifier];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__HUCameraEventRecordingCell_videoCacheDidAddVideo___block_invoke;
    block[3] = &unk_1E6386018;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __52__HUCameraEventRecordingCell_videoCacheDidAddVideo___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) debugMarkerLayer];
  [v1 setHidden:0];
}

- (void)videoCacheDidRemoveVideo:(id)a3
{
  objc_super v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"uniqueIdentifier"];
  v6 = [(HUCameraEventRecordingCell *)self recordingEvent];
  v7 = [v6 uniqueIdentifier];
  int v8 = [v5 isEqual:v7];

  if (v8)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__HUCameraEventRecordingCell_videoCacheDidRemoveVideo___block_invoke;
    block[3] = &unk_1E6386018;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __55__HUCameraEventRecordingCell_videoCacheDidRemoveVideo___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) debugMarkerLayer];
  [v1 setHidden:1];
}

- (HURecordingEventCellFamiliarFacesView)familiarFacesView
{
  familiarFacesView = self->_familiarFacesView;
  if (!familiarFacesView)
  {
    objc_super v4 = -[HURecordingEventCellFamiliarFacesView initWithFrame:]([HURecordingEventCellFamiliarFacesView alloc], "initWithFrame:", -38.0, -40.0, 118.0, 40.0);
    v5 = self->_familiarFacesView;
    self->_familiarFacesView = v4;

    v6 = [(HURecordingEventCellFamiliarFacesView *)self->_familiarFacesView layer];
    [v6 setOpacity:0.0];

    familiarFacesView = self->_familiarFacesView;
  }

  return familiarFacesView;
}

- (void)updateBadgeLayerWithEvents:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v10 = [(HUCameraEventRecordingCell *)self timeController];
  [v10 posterFrameWidth];
  long double v12 = v11;

  v13 = [(HUCameraEventRecordingCell *)self timeController];
  [v13 timeScale];
  uint64_t v15 = v14;

  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x2020000000;
  if (fmod(width, v12) < 18.0) {
    int v16 = (int)(width / v12);
  }
  else {
    int v16 = (int)(width / v12) + 1;
  }
  int v61 = v16;
  BOOL v17 = v16 == 1;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__10;
  v58[4] = __Block_byref_object_dispose__10;
  v18 = [(HUCameraEventRecordingCell *)self recordingEvent];
  id v59 = [v18 dateOfOccurrence];

  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  char v57 = 1;
  uint64_t v48 = 0;
  v49 = (CGFloat *)&v48;
  uint64_t v50 = 0x4010000000;
  v51 = &unk_1BEACB3BA;
  uint64_t v52 = 0;
  double v53 = height * 0.5 + -9.0;
  long double v54 = v12;
  uint64_t v55 = 0x4040800000000000;
  v19 = [MEMORY[0x1E4F1CA80] set];
  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", width, height);
  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __64__HUCameraEventRecordingCell_updateBadgeLayerWithEvents_inRect___block_invoke;
  v37 = &unk_1E6389A60;
  v41 = v60;
  id v21 = v9;
  BOOL v47 = v17;
  id v38 = v21;
  v42 = v58;
  uint64_t v45 = v15;
  id v22 = v19;
  id v39 = v22;
  v40 = self;
  v43 = v56;
  v44 = &v48;
  long double v46 = v12;
  v23 = [v20 imageWithActions:&v34];
  v24 = v49;
  v49[6] = width;
  v24[7] = height;
  v24[4] = x + -9.0;
  v24[5] = y;
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", v34, v35, v36, v37);
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  double v25 = v49[4];
  double v26 = v49[5];
  double v27 = v49[6];
  double v28 = v49[7];
  v29 = [(HUCameraEventRecordingCell *)self badgeLayer];
  objc_msgSend(v29, "setFrame:", v25, v26, v27, v28);

  id v30 = v23;
  uint64_t v31 = [v30 CGImage];
  v32 = [(HUCameraEventRecordingCell *)self badgeLayer];
  [v32 setContents:v31];

  v33 = [(HUCameraEventRecordingCell *)self badgeLayer];
  [v33 setHidden:0];

  [MEMORY[0x1E4F39CF8] commit];
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(v60, 8);
}

void __64__HUCameraEventRecordingCell_updateBadgeLayerWithEvents_inRect___block_invoke(uint64_t a1, __n128 a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (*(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= 1)
  {
    a2.n128_u64[0] = 138412802;
    __n128 v18 = a2;
    do
    {
      v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", *(_OWORD *)&v18);
      objc_super v4 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __64__HUCameraEventRecordingCell_updateBadgeLayerWithEvents_inRect___block_invoke_2;
      v19[3] = &unk_1E6389A38;
      char v24 = *(unsigned char *)(a1 + 104);
      id v5 = v3;
      uint64_t v6 = *(void *)(a1 + 64);
      id v20 = v5;
      uint64_t v22 = v6;
      uint64_t v23 = *(void *)(a1 + 88);
      id v21 = *(id *)(a1 + 40);
      [v4 enumerateObjectsUsingBlock:v19];
      v7 = HFLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        id v9 = [*(id *)(a1 + 48) recordingEvent];
        v10 = [v9 uniqueIdentifier];
        *(_DWORD *)buf = v18.n128_u32[0];
        id v26 = v5;
        __int16 v27 = 1024;
        int v28 = v8;
        __int16 v29 = 2112;
        id v30 = v10;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "Rendering image for reasons:%@ badge count %d for clip:%@", buf, 0x1Cu);
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) || [v5 count])
      {
        double v11 = [*(id *)(a1 + 48) _badgeImageForSignificantEventReasons:v5];
        [v11 size];
        uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
        *(void *)(v12 + 48) = v13;
        *(void *)(v12 + 56) = v14;
        objc_msgSend(v11, "drawInRect:", *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 56));
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
      *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = *(double *)(a1 + 96)
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 80) + 8)
                                                                              + 32);
      uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) dateByAddingTimeInterval:*(double *)(a1 + 88)];
      uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
      BOOL v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      --*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    }
    while (*(int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > 0);
  }
}

void __64__HUCameraEventRecordingCell_updateBadgeLayerWithEvents_inRect___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v17 = v6;
  if (*(unsigned char *)(a1 + 64))
  {
    if ([v6 confidenceLevel] != 100) {
      goto LABEL_12;
    }
    v7 = *(void **)(a1 + 32);
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "reason"));
    goto LABEL_4;
  }
  v10 = [v6 dateOfOccurrence];
  [v10 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  double v12 = v11;

  if (v12 >= 0.0 && v12 <= *(double *)(a1 + 56) && [v17 confidenceLevel] == 100)
  {
    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = [v17 uniqueIdentifier];
    LOBYTE(v13) = [v13 containsObject:v14];

    if ((v13 & 1) == 0)
    {
      uint64_t v15 = *(void **)(a1 + 32);
      uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "reason"));
      [v15 addObject:v16];

      v7 = *(void **)(a1 + 40);
      uint64_t v8 = [v17 uniqueIdentifier];
LABEL_4:
      id v9 = (void *)v8;
      [v7 addObject:v8];
    }
  }
  else if (v12 > *(double *)(a1 + 56))
  {
    *a4 = 1;
  }
LABEL_12:
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 4) {
    *a4 = 1;
  }
}

- (void)_updateBadgeLayerWithImage:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double x = a4.origin.x;
  id v7 = a3;
  [v7 size];
  double v9 = v8;
  [v7 size];
  double v11 = v10;
  double v12 = [(HUCameraEventRecordingCell *)self badgeLayer];
  objc_msgSend(v12, "setFrame:", x + -9.0, height * 0.5 + -9.0, v9, v11);

  id v13 = v7;
  uint64_t v14 = [v13 CGImage];

  uint64_t v15 = [(HUCameraEventRecordingCell *)self badgeLayer];
  [v15 setContents:v14];

  id v16 = [(HUCameraEventRecordingCell *)self badgeLayer];
  [v16 setHidden:0];
}

- (id)_badgeImageForSignificantEventReasons:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)[@"CameraEventMarker" mutableCopy];
  if ([v3 containsObject:&unk_1F19B41D8])
  {
    id v5 = @"_InsufficientAnalysis";
LABEL_11:
    [v4 appendString:v5];
    goto LABEL_12;
  }
  if ([v3 containsObject:&unk_1F19B41F0]) {
    [v4 appendString:@"_Person"];
  }
  if ([v3 containsObject:&unk_1F19B4208]) {
    [v4 appendString:@"_Animal"];
  }
  if ([v3 containsObject:&unk_1F19B4220]) {
    [v4 appendString:@"_Vehicle"];
  }
  if ([v3 containsObject:&unk_1F19B4238])
  {
    id v5 = @"_Package";
    goto LABEL_11;
  }
LABEL_12:
  id v6 = HUImageNamed(v4);

  return v6;
}

+ (id)backgroundColor
{
  return (id)[MEMORY[0x1E4F428B8] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.22];
}

- (void)updateWithCameraClipEvent:(id)a3 mode:(unint64_t)a4 portraitMode:(BOOL)a5 timeController:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a3;
  [(HUCameraEventRecordingCell *)self setDisplayMode:a4];
  [(HUCameraEventRecordingCell *)self setRecordingEvent:v11];

  [(HUCameraEventRecordingCell *)self setPortraitMode:v6];
  [(HUCameraEventRecordingCell *)self setTimeController:v10];

  double v12 = [(HUCameraEventRecordingCell *)self recordingEvent];
  if (objc_msgSend(v12, "hf_isPlayable")) {
    [(id)objc_opt_class() backgroundColor];
  }
  else {
  id v13 = [MEMORY[0x1E4F428B8] systemRedColor];
  }
  uint64_t v14 = [(HUCameraEventRecordingCell *)self posterFramesContainerView];
  [v14 setBackgroundColor:v13];

  [(HUCameraEventRecordingCell *)self addPosterFrameViews];
  [(HUCameraEventRecordingCell *)self addDayBoundaryIfNeeded];
  [(HUCameraEventRecordingCell *)self drawEventMarkers];
  [(HUCameraEventRecordingCell *)self updateFamiliarFaces];

  [(HUCameraEventRecordingCell *)self addDebugMarker];
}

- (unint64_t)numberOfFramesNeeded
{
  id v3 = [(HUCameraEventRecordingCell *)self timeController];
  [v3 posterFrameWidth];
  double v5 = v4;

  [(HUCameraEventRecordingCell *)self frame];
  return (int)vcvtpd_s64_f64(v6 / v5);
}

- (void)addPosterFrameViews
{
  id v3 = [(HUCameraEventRecordingCell *)self timeController];
  [v3 posterFrameWidth];
  double v5 = v4;

  unint64_t v6 = [(HUCameraEventRecordingCell *)self numberOfFramesNeeded];
  if (v6)
  {
    unint64_t v7 = v6;
    double v8 = 0.0;
    double v9 = 0.0;
    do
    {
      id v10 = +[HUPosterFrameViewCache dequeuePosterFrameViewForWidth:v5];
      objc_msgSend(v10, "setFrame:", v9, 0.0, v5, 33.0);
      id v11 = [(HUCameraEventRecordingCell *)self posterFramesContainerView];
      [v11 addSubview:v10];

      double v12 = [(HUCameraEventRecordingCell *)self recordingEvent];
      [v10 displayImageForClip:v12 atTimeOffset:v8];

      [v10 setShouldShowLineSeparator:--v7 != 0];
      double v9 = v5 + v9;
      id v13 = [(HUCameraEventRecordingCell *)self timeController];
      [v13 timeScale];
      double v8 = v8 + v14;
    }
    while (v7);
  }
}

- (void)addDayBoundaryIfNeeded
{
  id v3 = (void *)MEMORY[0x1E4F68FF8];
  double v4 = [(HUCameraEventRecordingCell *)self recordingEvent];
  id v18 = [v3 percentageOfDurationUntilNextDayForEvent:v4];

  if (v18
    || ([(HUCameraEventRecordingCell *)self recordingEvent],
        double v5 = objc_claimAutoreleasedReturnValue(),
        [v5 dateOfOccurrence],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "hf_isMidnight"),
        v6,
        v5,
        v7))
  {
    [(HUCameraEventRecordingCell *)self bounds];
    double v9 = v8;
    [v18 floatValue];
    double v11 = v9 * v10;
    [(HUCameraEventRecordingCell *)self bounds];
    double v13 = v12 + -14.0;
    double v14 = [(HUCameraEventRecordingCell *)self dayBoundaryView];
    objc_msgSend(v14, "setFrame:", v11, 7.0, 1.0, v13);

    uint64_t v15 = [(HUCameraEventRecordingCell *)self dayBoundaryView];
    id v16 = v15;
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v15 = [(HUCameraEventRecordingCell *)self dayBoundaryView];
    id v16 = v15;
    uint64_t v17 = 1;
  }
  [v15 setHidden:v17];
}

- (void)displayReachabilityErrorUI
{
  HUImageNamed(@"CameraEventMarkerCameraOffline");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(HUCameraEventRecordingCell *)self bounds];
  -[HUCameraEventRecordingCell _updateBadgeLayerWithImage:inRect:](self, "_updateBadgeLayerWithImage:inRect:", v3);
}

- (void)drawEventMarkers
{
  id v3 = [(HUCameraEventRecordingCell *)self recordingEvent];

  if (v3)
  {
    id v6 = [(HUCameraEventRecordingCell *)self recordingEvent];
    double v4 = objc_msgSend(v6, "hf_sortedSignificantEvents");
    [(HUCameraEventRecordingCell *)self bounds];
    -[HUCameraEventRecordingCell updateBadgeLayerWithEvents:inRect:](self, "updateBadgeLayerWithEvents:inRect:", v4);
  }
  else
  {
    double v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v5, OS_LOG_TYPE_ERROR, "Attempting to display a cell without a recording event.", buf, 2u);
    }

    [(HUCameraEventRecordingCell *)self displayReachabilityErrorUI];
  }
}

- (void)addDebugMarker
{
  if ([MEMORY[0x1E4F68FF8] markCachedVideoAsGreenInTimeline])
  {
    id v3 = [(HUCameraEventRecordingCell *)self posterFramesContainerView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    double v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    debugMarkerLayer = self->_debugMarkerLayer;
    self->_debugMarkerLayer = v8;

    -[CALayer setFrame:](self->_debugMarkerLayer, "setFrame:", v5, 0.0, v7, 4.0);
    id v10 = [MEMORY[0x1E4F428B8] systemGreenColor];
    -[CALayer setBackgroundColor:](self->_debugMarkerLayer, "setBackgroundColor:", [v10 CGColor]);

    [(CALayer *)self->_debugMarkerLayer setHidden:1];
    id v12 = [(HUCameraEventRecordingCell *)self posterFramesContainerView];
    double v11 = [v12 layer];
    [v11 addSublayer:self->_debugMarkerLayer];
  }
}

- (void)updateFamiliarFaces
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(HUCameraEventRecordingCell *)self recordingEvent];
  double v4 = objc_msgSend(v3, "hf_allEventsContainingPeopleInClip");

  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    double v9 = [(HUCameraEventRecordingCell *)self recordingEvent];
    id v10 = [(HUCameraEventRecordingCell *)self recordingEvent];
    double v11 = objc_msgSend(v10, "hf_sortedSignificantEvents");
    int v12 = 138412802;
    double v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v11;
    _os_log_debug_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEBUG, "PersonEvents:%@ for clip:%@, with events:%@", (uint8_t *)&v12, 0x20u);
  }
  uint64_t v6 = [v4 count];
  if (v6)
  {
    double v7 = [(HUCameraEventRecordingCell *)self familiarFacesView];
    double v8 = [(HUCameraEventRecordingCell *)self recordingEvent];
    [v7 updateWithPersonEvents:v4 forCameraClip:v8];
  }
  [(HUCameraEventRecordingCell *)self setHasFamiliarFaces:v6 != 0];
}

- (void)showFamiliarFacesWithMaxWidth:(double)a3
{
  BOOL v5 = [(HUCameraEventRecordingCell *)self hasFamiliarFaces];
  id v9 = [(HUCameraEventRecordingCell *)self familiarFacesView];
  uint64_t v6 = [v9 layer];
  double v8 = v6;
  if (v5)
  {
    LODWORD(v7) = 1.0;
    [v6 setOpacity:v7];

    id v9 = [(HUCameraEventRecordingCell *)self familiarFacesView];
    [v9 resizeWithMaxWidth:a3];
  }
  else
  {
    [v6 setOpacity:0.0];
  }
}

- (void)hideFamiliarFaces
{
  id v3 = [(HUCameraEventRecordingCell *)self familiarFacesView];
  v2 = [v3 layer];
  [v2 setOpacity:0.0];
}

- (void)preparePosterFrameViewsForReuse
{
  id v3 = [(HUCameraEventRecordingCell *)self posterFramesContainerView];
  double v4 = [v3 subviews];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_84];

  id v6 = [(HUCameraEventRecordingCell *)self posterFramesContainerView];
  BOOL v5 = [v6 subviews];
  [v5 makeObjectsPerformSelector:sel_removeFromSuperview];
}

uint64_t __61__HUCameraEventRecordingCell_preparePosterFrameViewsForReuse__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HUPosterFrameViewCache enqueuePosterFrameView:a2];
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)HUCameraEventRecordingCell;
  [(HUCameraEventRecordingCell *)&v6 prepareForReuse];
  [(HUCameraEventRecordingCell *)self preparePosterFrameViewsForReuse];
  id v3 = [(HUCameraEventRecordingCell *)self familiarFacesView];
  double v4 = [v3 layer];
  [v4 setOpacity:0.0];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  BOOL v5 = [(HUCameraEventRecordingCell *)self badgeLayer];
  [v5 setContents:0];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)updateVideoCacheMarker
{
  if ([MEMORY[0x1E4F68FF8] markCachedVideoAsGreenInTimeline])
  {
    id v3 = (void *)MEMORY[0x1E4F68FF8];
    double v4 = [(HUCameraEventRecordingCell *)self recordingEvent];
    id v7 = [v3 videoDestinationURLForCameraClip:v4];

    uint64_t v5 = [v7 checkResourceIsReachableAndReturnError:0] ^ 1;
    objc_super v6 = [(HUCameraEventRecordingCell *)self debugMarkerLayer];
    [v6 setHidden:v5];
  }
}

- (id)accessibilityLabel
{
  if ([MEMORY[0x1E4F69758] isInternalInstall])
  {
    id v3 = NSString;
    double v4 = [(HUCameraEventRecordingCell *)self recordingEvent];
    uint64_t v5 = [v4 uniqueIdentifier];
    objc_super v6 = [(HUCameraEventRecordingCell *)self recordingEvent];
    id v7 = [v6 dateOfOccurrence];
    double v8 = [v3 stringWithFormat:@"Recording Event UUID:%@ Date:%@", v5, v7];
  }
  else
  {
    double v4 = [(HUCameraEventRecordingCell *)self recordingEvent];
    double v8 = objc_msgSend(v4, "hu_accessibilityStringForSignificantEvents");
  }

  return v8;
}

- (CALayer)badgeLayer
{
  badgeLayer = self->_badgeLayer;
  if (!badgeLayer)
  {
    double v4 = [MEMORY[0x1E4F39BE8] layer];
    id v5 = [MEMORY[0x1E4F428B8] clearColor];
    -[CALayer setBackgroundColor:](v4, "setBackgroundColor:", [v5 CGColor]);

    [(CALayer *)v4 setCornerRadius:9.0];
    [(CALayer *)v4 setOpaque:0];
    objc_super v6 = [(HUCameraEventRecordingCell *)self layer];
    [v6 addSublayer:v4];

    id v7 = self->_badgeLayer;
    self->_badgeLayer = v4;

    badgeLayer = self->_badgeLayer;
  }

  return badgeLayer;
}

- (UIView)posterFramesContainerView
{
  posterFramesContainerView = self->_posterFramesContainerView;
  if (!posterFramesContainerView)
  {
    [(HUCameraEventRecordingCell *)self bounds];
    objc_super v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, 7.0, v5, 33.0);
    [(UIView *)v6 setAutoresizingMask:18];
    id v7 = [(id)objc_opt_class() backgroundColor];
    [(UIView *)v6 setBackgroundColor:v7];

    [(UIView *)v6 setClipsToBounds:1];
    double v8 = [(UIView *)v6 layer];
    [v8 setCornerRadius:8.0];

    id v9 = self->_posterFramesContainerView;
    self->_posterFramesContainerView = v6;

    posterFramesContainerView = self->_posterFramesContainerView;
  }

  return posterFramesContainerView;
}

- (UIView)dayBoundaryView
{
  dayBoundaryView = self->_dayBoundaryView;
  if (!dayBoundaryView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HUCameraEventRecordingCell *)self bounds];
    double v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    objc_super v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UIView *)v5 setBackgroundColor:v6];

    id v7 = [(UIView *)v5 layer];
    [v7 setCornerRadius:2.0];

    double v8 = self->_dayBoundaryView;
    self->_dayBoundaryView = v5;

    dayBoundaryView = self->_dayBoundaryView;
  }

  return dayBoundaryView;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (HMCameraClip)recordingEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingEvent);

  return (HMCameraClip *)WeakRetained;
}

- (void)setRecordingEvent:(id)a3
{
}

- (void)setBadgeLayer:(id)a3
{
}

- (void)setPosterFramesContainerView:(id)a3
{
}

- (void)setDayBoundaryView:(id)a3
{
}

- (BOOL)portraitMode
{
  return self->_portraitMode;
}

- (void)setPortraitMode:(BOOL)a3
{
  self->_portraitMode = a3;
}

- (HUClipScrubberTimeController)timeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timeController);

  return (HUClipScrubberTimeController *)WeakRetained;
}

- (void)setTimeController:(id)a3
{
}

- (void)setFamiliarFacesView:(id)a3
{
}

- (BOOL)hasFamiliarFaces
{
  return self->_hasFamiliarFaces;
}

- (void)setHasFamiliarFaces:(BOOL)a3
{
  self->_hasFamiliarFaces = a3;
}

- (CALayer)debugMarkerLayer
{
  return self->_debugMarkerLayer;
}

- (void)setDebugMarkerLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugMarkerLayer, 0);
  objc_storeStrong((id *)&self->_familiarFacesView, 0);
  objc_destroyWeak((id *)&self->_timeController);
  objc_storeStrong((id *)&self->_dayBoundaryView, 0);
  objc_storeStrong((id *)&self->_posterFramesContainerView, 0);
  objc_storeStrong((id *)&self->_badgeLayer, 0);

  objc_destroyWeak((id *)&self->_recordingEvent);
}

@end
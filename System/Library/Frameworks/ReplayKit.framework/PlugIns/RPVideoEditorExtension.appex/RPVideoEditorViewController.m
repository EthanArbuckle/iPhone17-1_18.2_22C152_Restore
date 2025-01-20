@interface RPVideoEditorViewController
- (AVAssetExportSession)exportSession;
- (AVAssetImageGenerator)thumbnailGenerator;
- (AVPlayer)avPlayer;
- (AVPlayerItem)avPlayerItem;
- (AVPlayerLayer)avPlayerLayer;
- (AVURLAsset)avAsset;
- (BOOL)canBecomeFirstResponder;
- (BOOL)currentItemLoaded;
- (BOOL)deviceHasHomeButton;
- (BOOL)hasEdit;
- (BOOL)hasHomeButton;
- (BOOL)isExporting;
- (BOOL)isIntroMode;
- (BOOL)isPadMode;
- (BOOL)isScrubbing;
- (BOOL)isShareSheetUp;
- (BOOL)isTrimming;
- (BOOL)isUIHidden;
- (BOOL)shouldApplyPadUILayout;
- (CGSize)getThumbnailSize;
- (CGSize)getVideoSize;
- (NSMutableArray)activityTypes;
- (NSMutableDictionary)cachedTimeStamps;
- (NSObject)playbackTimeObserver;
- (NSString)applicationName;
- (NSString)bundleIdentifier;
- (NSString)overrideShareMessage;
- (NSURL)fileAttachmentURL;
- (NSURL)originalVideoURL;
- (NSURL)trimFilePath;
- (NSURL)videoURL;
- (RPVideoEditorViewController)initWithBundleIdentifier:(id)a3 URL:(id)a4 applicationName:(id)a5;
- (RPVideoEditorViewController)initWithBundleIdentifier:(id)a3 URL:(id)a4 applicationName:(id)a5 overrideTintColor:(id)a6 size:(CGRect)a7;
- (RPVideoOverlayButton)videoOverlayPlayButton;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)cancelTrimButton;
- (UIBarButtonItem)doneButton;
- (UIBarButtonItem)fixSpace;
- (UIBarButtonItem)flexSpace;
- (UIBarButtonItem)pauseButton;
- (UIBarButtonItem)playButton;
- (UIBarButtonItem)saveButton;
- (UIBarButtonItem)shareButton;
- (UIBarButtonItem)titleButton;
- (UIBarButtonItem)trimButton;
- (UIBarButtonItem)undoButton;
- (UILabel)titleLabel;
- (UIMovieScrubber)avTrimmer;
- (UIToolbar)bottomToolBar;
- (UIToolbar)topToolBar;
- (UIView)scrubberContainterView;
- (UIView)videoOverlay;
- (double)editEndTime;
- (double)editStartTime;
- (double)getPlayerDuration;
- (double)movieScrubberThumbnailAspectRatio:(id)a3;
- (id)delegate;
- (id)movieScrubber:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6;
- (id)timeObserver;
- (id)trimFileURL;
- (int)currentOrientation;
- (void)applyPadConstraints;
- (void)applyPadUILayout;
- (void)applyPhoneConstraints;
- (void)applyPhoneUILayout;
- (void)configureReplayUIHidden;
- (void)dealloc;
- (void)displayShareSheetWithVideoURL:(id)a3;
- (void)doneAction;
- (void)editMode;
- (void)handleSingleTap:(id)a3;
- (void)hideUI;
- (void)itemDidFinishPlaying:(id)a3;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)movieScrubber:(id)a3 editingEndValueDidChange:(double)a4;
- (void)movieScrubber:(id)a3 editingStartValueDidChange:(double)a4;
- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4;
- (void)movieScrubber:(id)a3 valueDidChange:(double)a4;
- (void)movieScrubberDidBeginEditing:(id)a3;
- (void)movieScrubberDidBeginScrubbing:(id)a3 withHandle:(int)a4;
- (void)movieScrubberDidCancelEditing:(id)a3;
- (void)movieScrubberDidEndScrubbing:(id)a3 withHandle:(int)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseAction;
- (void)playAction;
- (void)previewMode;
- (void)refreshAVRotation;
- (void)reloadAVLayerWithURL:(id)a3;
- (void)saveAction;
- (void)setActivityTypes:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setAvAsset:(id)a3;
- (void)setAvPlayer:(id)a3;
- (void)setAvPlayerItem:(id)a3;
- (void)setAvPlayerLayer:(id)a3;
- (void)setAvTrimmer:(id)a3;
- (void)setBottomToolBar:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCachedTimeStamps:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCancelTrimButton:(id)a3;
- (void)setCurrentItemLoaded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEditEndTime:(double)a3;
- (void)setEditStartTime:(double)a3;
- (void)setExportSession:(id)a3;
- (void)setExporting:(BOOL)a3;
- (void)setFileAttachmentURL:(id)a3;
- (void)setFixSpace:(id)a3;
- (void)setFlexSpace:(id)a3;
- (void)setHasEdit:(BOOL)a3;
- (void)setHasHomeButton:(BOOL)a3;
- (void)setIntroMode:(BOOL)a3;
- (void)setOriginalVideoURL:(id)a3;
- (void)setOverrideShareMessage:(id)a3;
- (void)setPadMode:(BOOL)a3;
- (void)setPauseButton:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setPlaybackTimeObserver:(id)a3;
- (void)setSaveButton:(id)a3;
- (void)setScrubberContainterView:(id)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setShareButton:(id)a3;
- (void)setShareSheetUp:(BOOL)a3;
- (void)setThumbnailFromCacheWithTimeStamp:(id)a3;
- (void)setThumbnailGenerator:(id)a3;
- (void)setTimeObserver:(id)a3;
- (void)setTitleButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopToolBar:(id)a3;
- (void)setTrimButton:(id)a3;
- (void)setTrimFilePath:(id)a3;
- (void)setTrimming:(BOOL)a3;
- (void)setUiHidden:(BOOL)a3;
- (void)setUndoButton:(id)a3;
- (void)setVideoOverlay:(id)a3;
- (void)setVideoOverlayPlayButton:(id)a3;
- (void)setVideoURL:(id)a3;
- (void)shareAction;
- (void)showUI;
- (void)trimVideo;
- (void)undoAction;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation RPVideoEditorViewController

- (RPVideoEditorViewController)initWithBundleIdentifier:(id)a3 URL:(id)a4 applicationName:(id)a5
{
  return -[RPVideoEditorViewController initWithBundleIdentifier:URL:applicationName:overrideTintColor:size:](self, "initWithBundleIdentifier:URL:applicationName:overrideTintColor:size:", a3, a4, a5, 0, CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
}

- (BOOL)deviceHasHomeButton
{
  if (qword_10001F500 != -1) {
    dispatch_once(&qword_10001F500, &stru_100018528);
  }
  return byte_10001F138;
}

- (RPVideoEditorViewController)initWithBundleIdentifier:(id)a3 URL:(id)a4 applicationName:(id)a5 overrideTintColor:(id)a6 size:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v175 = a6;
  v181.receiver = self;
  v181.super_class = (Class)RPVideoEditorViewController;
  v18 = [(RPVideoEditorViewController *)&v181 init];
  if (!v18) {
    goto LABEL_21;
  }
  id v174 = v17;
  v182.origin.double x = x;
  v182.origin.double y = y;
  v182.size.double width = width;
  v182.size.double height = height;
  if (!CGRectIsEmpty(v182))
  {
    v19 = [(RPVideoEditorViewController *)v18 view];
    objc_msgSend(v19, "setFrame:", x, y, width, height);
  }
  v20 = +[NSMutableArray array];
  [(RPVideoEditorViewController *)v18 setActivityTypes:v20];

  [(RPVideoEditorViewController *)v18 setHasEdit:0];
  [(RPVideoEditorViewController *)v18 setHasHomeButton:[(RPVideoEditorViewController *)v18 deviceHasHomeButton]];
  [(RPVideoEditorViewController *)v18 setShareSheetUp:0];
  id v21 = objc_alloc_init((Class)UIView);
  [(RPVideoEditorViewController *)v18 setVideoOverlay:v21];

  v22 = [(RPVideoEditorViewController *)v18 view];
  [v22 bounds];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  v31 = [(RPVideoEditorViewController *)v18 videoOverlay];
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  [(RPVideoEditorViewController *)v18 setUiHidden:0];
  id v32 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v18 action:"handleSingleTap:"];
  v33 = [(RPVideoEditorViewController *)v18 videoOverlay];
  v173 = v32;
  [v33 addGestureRecognizer:v32];

  v34 = +[UIView _srVideoOverlayButtonWithStyle:0];
  [(RPVideoEditorViewController *)v18 setVideoOverlayPlayButton:v34];

  v35 = +[UIScreen mainScreen];
  [v35 bounds];
  double v37 = v36 * 0.5;
  v38 = [(RPVideoEditorViewController *)v18 videoOverlayPlayButton];
  [v38 frame];
  double v40 = v37 - v39 * 0.5;
  v41 = +[UIScreen mainScreen];
  [v41 bounds];
  double v43 = v42 * 0.5;
  v44 = [(RPVideoEditorViewController *)v18 videoOverlayPlayButton];
  [v44 frame];
  double v46 = v43 - v45 * 0.5;
  v47 = [(RPVideoEditorViewController *)v18 videoOverlayPlayButton];
  [v47 frame];
  double v49 = v48;
  v50 = [(RPVideoEditorViewController *)v18 videoOverlayPlayButton];
  [v50 frame];
  double v52 = v51;
  v53 = [(RPVideoEditorViewController *)v18 videoOverlayPlayButton];
  objc_msgSend(v53, "setFrame:", v40, v46, v49, v52);

  v54 = [(RPVideoEditorViewController *)v18 videoOverlayPlayButton];
  [v54 setTarget:v18 action:"playAction"];

  [(RPVideoEditorViewController *)v18 setIntroMode:1];
  [(RPVideoEditorViewController *)v18 setOriginalVideoURL:v16];
  [(RPVideoEditorViewController *)v18 setVideoURL:v16];
  [(RPVideoEditorViewController *)v18 setApplicationName:v174];
  [(RPVideoEditorViewController *)v18 setBundleIdentifier:v15];
  id v55 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, 120.0, 17.0);
  [(RPVideoEditorViewController *)v18 setTitleLabel:v55];

  v56 = [(RPVideoEditorViewController *)v18 titleLabel];
  v57 = +[UIFont systemFontOfSize:15.0];
  [v56 setFont:v57];

  v58 = [(RPVideoEditorViewController *)v18 titleLabel];
  v59 = +[UIColor clearColor];
  [v58 setBackgroundColor:v59];

  v60 = [(RPVideoEditorViewController *)v18 traitCollection];
  id v61 = [v60 userInterfaceStyle];

  if (v61 == (id)2)
  {
    v62 = [(RPVideoEditorViewController *)v18 titleLabel];
    uint64_t v63 = +[UIColor whiteColor];
LABEL_8:
    v66 = (void *)v63;
    [v62 setTextColor:v63];

    goto LABEL_9;
  }
  v64 = [(RPVideoEditorViewController *)v18 traitCollection];
  id v65 = [v64 userInterfaceStyle];

  if (v65 == (id)1)
  {
    v62 = [(RPVideoEditorViewController *)v18 titleLabel];
    uint64_t v63 = +[UIColor blackColor];
    goto LABEL_8;
  }
LABEL_9:
  v67 = [(RPVideoEditorViewController *)v18 titleLabel];
  v68 = [(RPVideoEditorViewController *)v18 applicationName];
  [v67 setText:v68];

  v69 = [(RPVideoEditorViewController *)v18 titleLabel];
  [v69 setTextAlignment:1];

  v70 = [(RPVideoEditorViewController *)v18 titleLabel];
  [v70 setClipsToBounds:0];

  id v71 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 17.0, 120.0, 17.0);
  v72 = +[UIColor clearColor];
  [v71 setBackgroundColor:v72];

  v73 = +[UIFont systemFontOfSize:10.0];
  [v71 setFont:v73];

  [v71 setTextAlignment:1];
  v74 = +[NSFileManager defaultManager];
  uint64_t v75 = [v74 _srGetCreationDateForFile:v16];

  v172 = (void *)v75;
  v76 = +[NSDate _srGetStringFromDate:v75];
  [v71 setText:v76];

  v77 = [(RPVideoEditorViewController *)v18 titleLabel];
  [v77 addSubview:v71];

  id v78 = objc_alloc((Class)UIBarButtonItem);
  v79 = [(RPVideoEditorViewController *)v18 titleLabel];
  id v80 = [v78 initWithCustomView:v79];
  [(RPVideoEditorViewController *)v18 setTitleButton:v80];

  v81 = [(RPVideoEditorViewController *)v18 trimFileURL];
  [(RPVideoEditorViewController *)v18 setTrimFilePath:v81];

  [(RPVideoEditorViewController *)v18 setTrimming:0];
  [(RPVideoEditorViewController *)v18 setExporting:0];
  id v82 = [objc_alloc((Class)AVURLAsset) initWithURL:v16 options:0];
  [(RPVideoEditorViewController *)v18 setAvAsset:v82];

  id v83 = objc_alloc((Class)AVPlayerItem);
  v84 = [(RPVideoEditorViewController *)v18 avAsset];
  id v85 = [v83 initWithAsset:v84];
  [(RPVideoEditorViewController *)v18 setAvPlayerItem:v85];

  id v86 = objc_alloc((Class)AVPlayer);
  v87 = [(RPVideoEditorViewController *)v18 avPlayerItem];
  id v88 = [v86 initWithPlayerItem:v87];
  [(RPVideoEditorViewController *)v18 setAvPlayer:v88];

  v89 = [(RPVideoEditorViewController *)v18 avPlayer];
  CMTime v180 = kCMTimeZero;
  [v89 seekToTime:&v180];

  v90 = +[NSNotificationCenter defaultCenter];
  v91 = [(RPVideoEditorViewController *)v18 avPlayerItem];
  [v90 addObserver:v18 selector:"itemDidFinishPlaying:" name:AVPlayerItemDidPlayToEndTimeNotification object:v91];

  id v92 = objc_alloc_init((Class)AVPlayerLayer);
  [(RPVideoEditorViewController *)v18 setAvPlayerLayer:v92];

  v93 = [(RPVideoEditorViewController *)v18 avPlayer];
  v94 = [(RPVideoEditorViewController *)v18 avPlayerLayer];
  [v94 setPlayer:v93];

  v95 = [(RPVideoEditorViewController *)v18 avPlayer];
  v96 = [v95 currentItem];
  [v96 addObserver:v18 forKeyPath:@"status" options:0 context:0];

  v97 = [(RPVideoEditorViewController *)v18 avPlayer];
  v98 = [v97 currentItem];
  [v98 addObserver:v18 forKeyPath:@"duration" options:0 context:0];

  [(RPVideoEditorViewController *)v18 setCurrentItemLoaded:0];
  id v99 = objc_msgSend(objc_alloc((Class)_UIBackdropView), "initWithFrame:privateStyle:", 2010, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(RPVideoEditorViewController *)v18 setScrubberContainterView:v99];

  v100 = [(RPVideoEditorViewController *)v18 scrubberContainterView];
  [v100 setUserInteractionEnabled:1];

  v101 = [(RPVideoEditorViewController *)v18 scrubberContainterView];
  [v101 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v102 = objc_alloc_init((Class)UIMovieScrubber);
  [(RPVideoEditorViewController *)v18 setAvTrimmer:v102];

  v103 = [(RPVideoEditorViewController *)v18 avTrimmer];
  [v103 setAutoresizingMask:2];

  v104 = [(RPVideoEditorViewController *)v18 avTrimmer];
  [v104 setMinimumTrimLength:1.0];

  v105 = [(RPVideoEditorViewController *)v18 avTrimmer];
  [v105 setEditable:1];

  v106 = [(RPVideoEditorViewController *)v18 avTrimmer];
  [v106 setZoomDelay:0.5];

  v107 = [(RPVideoEditorViewController *)v18 avTrimmer];
  [v107 setEdgeInset:10.0];

  [(RPVideoEditorViewController *)v18 setScrubbing:0];
  memset(&v180, 0, sizeof(v180));
  CMTimeMakeWithSeconds(&v180, 0.0333333333, 1000000000);
  objc_initWeak(&location, v18);
  v108 = [(RPVideoEditorViewController *)v18 avPlayer];
  v177[0] = _NSConcreteStackBlock;
  v177[1] = 3221225472;
  v177[2] = sub_100006E48;
  v177[3] = &unk_100018550;
  objc_copyWeak(&v178, &location);
  CMTime v176 = v180;
  v109 = [v108 addPeriodicTimeObserverForInterval:&v176 queue:0 usingBlock:v177];
  [(RPVideoEditorViewController *)v18 setPlaybackTimeObserver:v109];

  id v110 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:9 target:v18 action:"shareAction"];
  [(RPVideoEditorViewController *)v18 setShareButton:v110];

  id v111 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:21 target:v18 action:"undoAction"];
  [(RPVideoEditorViewController *)v18 setUndoButton:v111];

  id v112 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:18 target:v18 action:"pauseAction"];
  [(RPVideoEditorViewController *)v18 setPauseButton:v112];

  id v113 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:17 target:v18 action:"playAction"];
  [(RPVideoEditorViewController *)v18 setPlayButton:v113];

  id v114 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v18 action:"doneAction"];
  [(RPVideoEditorViewController *)v18 setDoneButton:v114];

  id v115 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:v18 action:"saveAction"];
  [(RPVideoEditorViewController *)v18 setSaveButton:v115];

  id v116 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v18 action:"doneAction"];
  [(RPVideoEditorViewController *)v18 setCancelButton:v116];

  id v117 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v18 action:"undoAction"];
  [(RPVideoEditorViewController *)v18 setCancelTrimButton:v117];

  id v118 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v18 action:"saveAction"];
  [(RPVideoEditorViewController *)v18 setTrimButton:v118];

  id v119 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  [(RPVideoEditorViewController *)v18 setFlexSpace:v119];

  id v120 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
  [(RPVideoEditorViewController *)v18 setFixSpace:v120];

  v121 = [(RPVideoEditorViewController *)v18 view];
  [v121 frame];
  double v123 = v122;
  v124 = [(RPVideoEditorViewController *)v18 fixSpace];
  [v124 setWidth:v123 * 0.005];

  id v125 = objc_alloc_init((Class)UIToolbar);
  [(RPVideoEditorViewController *)v18 setTopToolBar:v125];

  if ([(RPVideoEditorViewController *)v18 hasHomeButton])
  {
    v126 = [(RPVideoEditorViewController *)v18 view];
    [v126 bounds];
    double v128 = v127;
    double v129 = 60.0;
  }
  else
  {
    v126 = [(RPVideoEditorViewController *)v18 view];
    [v126 bounds];
    double v128 = v130;
    double v129 = 85.0;
  }
  v131 = [(RPVideoEditorViewController *)v18 topToolBar];
  objc_msgSend(v131, "setFrame:", 0.0, 0.0, v128, v129);

  v132 = [(RPVideoEditorViewController *)v18 topToolBar];
  [v132 setAutoresizingMask:2];

  v133 = [(RPVideoEditorViewController *)v18 topToolBar];
  [v133 setDelegate:v18];

  if (v175)
  {
    v134 = [(RPVideoEditorViewController *)v18 topToolBar];
    [v134 setTintColor:v175];
  }
  id v135 = objc_alloc_init((Class)UIToolbar);
  [(RPVideoEditorViewController *)v18 setBottomToolBar:v135];

  if ([(RPVideoEditorViewController *)v18 hasHomeButton])
  {
    v136 = [(RPVideoEditorViewController *)v18 view];
    [v136 bounds];
    double v138 = v137;
    v139 = [(RPVideoEditorViewController *)v18 view];
    [v139 bounds];
    double v141 = v140;
    double v142 = v138 + -44.0;
    *(double *)&uint64_t v143 = 44.0;
  }
  else
  {
    v136 = [(RPVideoEditorViewController *)v18 view];
    [v136 bounds];
    double v145 = v144;
    v139 = [(RPVideoEditorViewController *)v18 view];
    [v139 bounds];
    double v141 = v146;
    double v142 = v145 + -64.0;
    *(double *)&uint64_t v143 = 64.0;
  }
  double v147 = *(double *)&v143;
  v148 = [(RPVideoEditorViewController *)v18 bottomToolBar];
  objc_msgSend(v148, "setFrame:", 0.0, v142, v141, v147);

  v149 = [(RPVideoEditorViewController *)v18 bottomToolBar];
  [v149 setAutoresizingMask:2];

  v150 = [(RPVideoEditorViewController *)v18 bottomToolBar];
  [v150 setDelegate:v18];

  id v151 = objc_alloc((Class)UIView);
  v152 = [(RPVideoEditorViewController *)v18 view];
  [v152 frame];
  id v153 = objc_msgSend(v151, "initWithFrame:");

  v154 = +[UIColor blackColor];
  [v153 setBackgroundColor:v154];

  v155 = [(RPVideoEditorViewController *)v18 view];
  [v155 addSubview:v153];

  v156 = [(RPVideoEditorViewController *)v18 view];
  v157 = [v156 layer];
  v158 = [(RPVideoEditorViewController *)v18 avPlayerLayer];
  [v157 addSublayer:v158];

  v159 = [(RPVideoEditorViewController *)v18 view];
  v160 = [(RPVideoEditorViewController *)v18 videoOverlay];
  [v159 addSubview:v160];

  v161 = [(RPVideoEditorViewController *)v18 view];
  v162 = [(RPVideoEditorViewController *)v18 bottomToolBar];
  [v161 addSubview:v162];

  v163 = [(RPVideoEditorViewController *)v18 view];
  v164 = [(RPVideoEditorViewController *)v18 topToolBar];
  [v163 addSubview:v164];

  v165 = [(RPVideoEditorViewController *)v18 view];
  v166 = [(RPVideoEditorViewController *)v18 scrubberContainterView];
  [v165 addSubview:v166];

  v167 = [(RPVideoEditorViewController *)v18 scrubberContainterView];
  v168 = [(RPVideoEditorViewController *)v18 avTrimmer];
  [v167 addSubview:v168];

  v169 = [(RPVideoEditorViewController *)v18 view];
  v170 = [(RPVideoEditorViewController *)v18 videoOverlayPlayButton];
  [v169 addSubview:v170];

  if ([(RPVideoEditorViewController *)v18 shouldApplyPadUILayout]) {
    [(RPVideoEditorViewController *)v18 applyPadUILayout];
  }
  else {
    [(RPVideoEditorViewController *)v18 applyPhoneUILayout];
  }

  objc_destroyWeak(&v178);
  objc_destroyWeak(&location);

  id v17 = v174;
LABEL_21:

  return v18;
}

- (BOOL)shouldApplyPadUILayout
{
  if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = +[UIDevice currentDevice];
    int v8 = 136446722;
    v9 = "-[RPVideoEditorViewController shouldApplyPadUILayout]";
    __int16 v10 = 1024;
    int v11 = 324;
    __int16 v12 = 2048;
    id v13 = [v3 userInterfaceIdiom];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d userInterfaceIdiom=%ld", (uint8_t *)&v8, 0x1Cu);
  }
  v4 = +[UIDevice currentDevice];
  if ([v4 userInterfaceIdiom] == (id)6)
  {
    BOOL v5 = 1;
  }
  else
  {
    v6 = +[UIDevice currentDevice];
    BOOL v5 = [v6 userInterfaceIdiom] == (id)1
      || [(RPVideoEditorViewController *)self currentOrientation] == 1;
  }
  return v5;
}

- (void)applyPhoneUILayout
{
  if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v31 = "-[RPVideoEditorViewController applyPhoneUILayout]";
    __int16 v32 = 1024;
    int v33 = 330;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v3 = [(RPVideoEditorViewController *)self playButton];
  objc_msgSend(v3, "setImageInsets:", 0.0, 0.0, -0.0, 0.0);

  v4 = [(RPVideoEditorViewController *)self pauseButton];
  objc_msgSend(v4, "setImageInsets:", 0.0, 0.0, -0.0, 0.0);

  BOOL v5 = [(RPVideoEditorViewController *)self shareButton];
  objc_msgSend(v5, "setImageInsets:", 0.0, 0.0, -0.0, 0.0);

  if ([(RPVideoEditorViewController *)self isTrimming])
  {
    v6 = [(RPVideoEditorViewController *)self topToolBar];
    v7 = [(RPVideoEditorViewController *)self cancelTrimButton];
    int v8 = [(RPVideoEditorViewController *)self flexSpace];
    v9 = [(RPVideoEditorViewController *)self titleButton];
    __int16 v10 = [(RPVideoEditorViewController *)self flexSpace];
    int v11 = [(RPVideoEditorViewController *)self trimButton];
    __int16 v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, v9, v10, v11, 0);
    [v6 setItems:v12];

    id v13 = [(RPVideoEditorViewController *)self bottomToolBar];
    v14 = [(RPVideoEditorViewController *)self flexSpace];
    id v15 = [(RPVideoEditorViewController *)self playButton];
    id v16 = [(RPVideoEditorViewController *)self flexSpace];
    id v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v14, v15, v16, 0);
    [v13 setItems:v17];
  }
  else
  {
    unsigned int v18 = [(RPVideoEditorViewController *)self isIntroMode];
    v19 = [(RPVideoEditorViewController *)self bottomToolBar];
    v20 = [(RPVideoEditorViewController *)self shareButton];
    uint64_t v21 = [(RPVideoEditorViewController *)self flexSpace];
    v22 = (void *)v21;
    if (v18)
    {
      double v23 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v21, 0);
      [v19 setItems:v23];
    }
    else
    {
      double v23 = [(RPVideoEditorViewController *)self playButton];
      double v24 = [(RPVideoEditorViewController *)self flexSpace];
      double v25 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v20, v22, v23, v24, 0);
      [v19 setItems:v25];
    }
    id v13 = [(RPVideoEditorViewController *)self topToolBar];
    v14 = [(RPVideoEditorViewController *)self cancelButton];
    id v15 = [(RPVideoEditorViewController *)self flexSpace];
    id v16 = [(RPVideoEditorViewController *)self titleButton];
    id v17 = [(RPVideoEditorViewController *)self flexSpace];
    double v26 = [(RPVideoEditorViewController *)self saveButton];
    double v27 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v14, v15, v16, v17, v26, 0);
    [v13 setItems:v27];
  }
  double v28 = [(RPVideoEditorViewController *)self view];
  double v29 = [(RPVideoEditorViewController *)self bottomToolBar];
  [v28 addSubview:v29];

  [(RPVideoEditorViewController *)self applyPhoneConstraints];
  [(RPVideoEditorViewController *)self setPadMode:0];
}

- (void)applyPadUILayout
{
  if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    double v26 = "-[RPVideoEditorViewController applyPadUILayout]";
    __int16 v27 = 1024;
    int v28 = 366;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v3 = [(RPVideoEditorViewController *)self playButton];
  objc_msgSend(v3, "setImageInsets:", 8.0, 0.0, -8.0, 0.0);

  v4 = [(RPVideoEditorViewController *)self pauseButton];
  objc_msgSend(v4, "setImageInsets:", 8.0, 0.0, -8.0, 0.0);

  BOOL v5 = [(RPVideoEditorViewController *)self shareButton];
  objc_msgSend(v5, "setImageInsets:", 5.0, 0.0, -5.0, 0.0);

  if ([(RPVideoEditorViewController *)self isTrimming])
  {
    v6 = [(RPVideoEditorViewController *)self topToolBar];
    v7 = [(RPVideoEditorViewController *)self cancelTrimButton];
    int v8 = [(RPVideoEditorViewController *)self flexSpace];
    v9 = [(RPVideoEditorViewController *)self titleButton];
    __int16 v10 = [(RPVideoEditorViewController *)self flexSpace];
    int v11 = [(RPVideoEditorViewController *)self playButton];
    __int16 v12 = [(RPVideoEditorViewController *)self fixSpace];
    uint64_t v13 = [(RPVideoEditorViewController *)self trimButton];
  }
  else
  {
    unsigned int v14 = [(RPVideoEditorViewController *)self isIntroMode];
    v6 = [(RPVideoEditorViewController *)self topToolBar];
    v7 = [(RPVideoEditorViewController *)self cancelButton];
    int v8 = [(RPVideoEditorViewController *)self flexSpace];
    v9 = [(RPVideoEditorViewController *)self titleButton];
    __int16 v10 = [(RPVideoEditorViewController *)self flexSpace];
    if (!v14)
    {
      int v11 = [(RPVideoEditorViewController *)self playButton];
      __int16 v12 = [(RPVideoEditorViewController *)self fixSpace];
      id v15 = [(RPVideoEditorViewController *)self shareButton];
      id v16 = [(RPVideoEditorViewController *)self fixSpace];
      double v23 = [(RPVideoEditorViewController *)self saveButton];
      double v24 = v6;
      +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, v9, v10, v11, v12, v15, v16, v23, 0);
      id v17 = v10;
      unsigned int v18 = v9;
      v19 = v8;
      uint64_t v21 = v20 = v7;
      [v24 setItems:v21];

      v7 = v20;
      int v8 = v19;
      v9 = v18;
      __int16 v10 = v17;

      v6 = v24;
      goto LABEL_10;
    }
    int v11 = [(RPVideoEditorViewController *)self shareButton];
    __int16 v12 = [(RPVideoEditorViewController *)self fixSpace];
    uint64_t v13 = [(RPVideoEditorViewController *)self saveButton];
  }
  id v15 = (void *)v13;
  id v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, v8, v9, v10, v11, v12, v13, 0);
  [v6 setItems:v16];
LABEL_10:

  v22 = [(RPVideoEditorViewController *)self bottomToolBar];
  [v22 removeFromSuperview];

  [(RPVideoEditorViewController *)self applyPadConstraints];
  [(RPVideoEditorViewController *)self setPadMode:1];
}

- (void)applyPhoneConstraints
{
  v3 = [(RPVideoEditorViewController *)self view];
  v4 = [(RPVideoEditorViewController *)self scrubberContainterView];
  BOOL v5 = [(RPVideoEditorViewController *)self view];
  v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:5 relatedBy:0 toItem:v5 attribute:5 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v6];

  v7 = [(RPVideoEditorViewController *)self view];
  int v8 = [(RPVideoEditorViewController *)self scrubberContainterView];
  v9 = [(RPVideoEditorViewController *)self view];
  __int16 v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:6 relatedBy:0 toItem:v9 attribute:6 multiplier:1.0 constant:0.0];
  [v7 addConstraint:v10];

  int v11 = [(RPVideoEditorViewController *)self view];
  __int16 v12 = [(RPVideoEditorViewController *)self scrubberContainterView];
  uint64_t v13 = [(RPVideoEditorViewController *)self bottomToolBar];
  unsigned int v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:4 relatedBy:0 toItem:v13 attribute:3 multiplier:1.0 constant:0.0];
  [v11 addConstraint:v14];

  id v17 = [(RPVideoEditorViewController *)self view];
  id v15 = [(RPVideoEditorViewController *)self scrubberContainterView];
  id v16 = +[NSLayoutConstraint constraintWithItem:v15 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:38.0];
  [v17 addConstraint:v16];
}

- (void)applyPadConstraints
{
  v3 = [(RPVideoEditorViewController *)self view];
  v4 = [(RPVideoEditorViewController *)self scrubberContainterView];
  BOOL v5 = [(RPVideoEditorViewController *)self view];
  v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:5 relatedBy:0 toItem:v5 attribute:5 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v6];

  v7 = [(RPVideoEditorViewController *)self view];
  int v8 = [(RPVideoEditorViewController *)self scrubberContainterView];
  v9 = [(RPVideoEditorViewController *)self view];
  __int16 v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:6 relatedBy:0 toItem:v9 attribute:6 multiplier:1.0 constant:0.0];
  [v7 addConstraint:v10];

  int v11 = [(RPVideoEditorViewController *)self view];
  __int16 v12 = [(RPVideoEditorViewController *)self scrubberContainterView];
  uint64_t v13 = [(RPVideoEditorViewController *)self view];
  unsigned int v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:4 relatedBy:0 toItem:v13 attribute:4 multiplier:1.0 constant:0.0];
  [v11 addConstraint:v14];

  id v17 = [(RPVideoEditorViewController *)self view];
  id v15 = [(RPVideoEditorViewController *)self scrubberContainterView];
  id v16 = +[NSLayoutConstraint constraintWithItem:v15 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:38.0];
  [v17 addConstraint:v16];
}

- (id)trimFileURL
{
  v3 = +[NSFileManager defaultManager];
  v4 = [v3 _srTempPath];
  BOOL v5 = [(RPVideoEditorViewController *)self applicationName];
  v6 = +[NSString stringWithFormat:@"%@/%@_", v4, v5];

  v7 = +[NSDate date];
  [v7 timeIntervalSince1970];
  v9 = +[NSString stringWithFormat:@"%ld", (uint64_t)v8];

  __int16 v10 = +[NSString stringWithFormat:@"%@%@%@", v6, v9, @".mp4"];
  int v11 = +[NSURL fileURLWithPath:v10];

  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = [(RPVideoEditorViewController *)self avPlayer];
  id v11 = [v10 currentItem];
  if (v11 == v9)
  {
    if ([v8 isEqualToString:@"status"])
    {
    }
    else
    {
      unsigned __int8 v12 = [v8 isEqualToString:@"duration"];

      if ((v12 & 1) == 0) {
        goto LABEL_15;
      }
    }
    uint64_t v13 = [(RPVideoEditorViewController *)self avPlayer];
    unsigned int v14 = [v13 currentItem];
    if ([v14 status] == (id)1)
    {
      id v15 = [(RPVideoEditorViewController *)self avPlayer];
      id v16 = [v15 currentItem];
      id v17 = v16;
      if (v16)
      {
        [v16 duration];

        if ((v22 & 0x1D) == 1)
        {
          if ([(RPVideoEditorViewController *)self currentItemLoaded]) {
            goto LABEL_15;
          }
          [(RPVideoEditorViewController *)self setCurrentItemLoaded:1];
          [(RPVideoEditorViewController *)self setThumbnailGenerator:0];
          [(RPVideoEditorViewController *)self setCachedTimeStamps:0];
          unsigned int v18 = [(RPVideoEditorViewController *)self avTrimmer];
          [v18 setDelegate:self];

          v19 = [(RPVideoEditorViewController *)self avTrimmer];
          [v19 setDataSource:self];

          [(RPVideoEditorViewController *)self setEditStartTime:0.0];
          [(RPVideoEditorViewController *)self getPlayerDuration];
          -[RPVideoEditorViewController setEditEndTime:](self, "setEditEndTime:");
          v20 = [(RPVideoEditorViewController *)self avTrimmer];
          [v20 reloadData];
LABEL_14:

          goto LABEL_15;
        }
LABEL_13:
        v20 = [(RPVideoEditorViewController *)self avPlayer];
        uint64_t v21 = [v20 currentItem];
        [v21 status];

        goto LABEL_14;
      }
    }
    goto LABEL_13;
  }

LABEL_15:
}

- (void)itemDidFinishPlaying:(id)a3
{
  [(RPVideoEditorViewController *)self pauseAction];
  if ([(RPVideoEditorViewController *)self isUIHidden]) {
    [(RPVideoEditorViewController *)self showUI];
  }
  v4 = [(RPVideoEditorViewController *)self avPlayer];
  long long v5 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v4 seekToTime:&v5];
}

- (void)handleSingleTap:(id)a3
{
}

- (void)configureReplayUIHidden
{
  if ([(RPVideoEditorViewController *)self isUIHidden])
  {
    [(RPVideoEditorViewController *)self showUI];
  }
  else
  {
    [(RPVideoEditorViewController *)self hideUI];
  }
}

- (void)showUI
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000081B8;
  v3[3] = &unk_100018578;
  v3[4] = self;
  +[UIView animateWithDuration:v3 animations:0.25];
  [(RPVideoEditorViewController *)self setUiHidden:0];
}

- (void)hideUI
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000082D4;
  v3[3] = &unk_100018578;
  v3[4] = self;
  +[UIView animateWithDuration:v3 animations:0.25];
  [(RPVideoEditorViewController *)self setUiHidden:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(RPVideoEditorViewController *)self becomeFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)RPVideoEditorViewController;
  [(RPVideoEditorViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RPVideoEditorViewController;
  [(RPVideoEditorViewController *)&v6 viewDidAppear:a3];
  [(RPVideoEditorViewController *)self getPlayerDuration];
  if (__RPLogLevel <= 1)
  {
    uint64_t v5 = v4;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      id v8 = "-[RPVideoEditorViewController viewDidAppear:]";
      __int16 v9 = 1024;
      int v10 = 515;
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Start video duration: %lf", buf, 0x1Cu);
    }
  }
}

- (void)viewDidLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)RPVideoEditorViewController;
  [(RPVideoEditorViewController *)&v10 viewDidLayoutSubviews];
  BOOL v3 = [(RPVideoEditorViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  objc_super v6 = [(RPVideoEditorViewController *)self view];
  [v6 bounds];
  double v8 = v7;
  __int16 v9 = [(RPVideoEditorViewController *)self avPlayerLayer];
  objc_msgSend(v9, "setFrame:", 0.0, 0.0, v5, v8);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(RPVideoEditorViewController *)self resignFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)RPVideoEditorViewController;
  [(RPVideoEditorViewController *)&v5 viewWillDisappear:v3];
}

- (void)dealloc
{
  BOOL v3 = [(RPVideoEditorViewController *)self avPlayer];
  [v3 removeTimeObserver:self->_playbackTimeObserver];

  double v4 = [(RPVideoEditorViewController *)self avPlayer];
  objc_super v5 = [v4 currentItem];
  [v5 removeObserver:self forKeyPath:@"status"];

  objc_super v6 = [(RPVideoEditorViewController *)self avPlayer];
  double v7 = [v6 currentItem];
  [v7 removeObserver:self forKeyPath:@"duration"];

  double v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self];

  __int16 v9 = +[NSFileManager defaultManager];
  [v9 _srDeleteAllTempFiles];

  v10.receiver = self;
  v10.super_class = (Class)RPVideoEditorViewController;
  [(RPVideoEditorViewController *)&v10 dealloc];
}

- (int)currentOrientation
{
  BOOL v3 = [(RPVideoEditorViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  objc_super v6 = [(RPVideoEditorViewController *)self view];
  [v6 bounds];
  BOOL v8 = v5 > v7;

  return v8;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)RPVideoEditorViewController;
  id v7 = a4;
  -[RPVideoEditorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008810;
  v8[3] = &unk_1000185A0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&stru_1000185E0];
}

- (void)refreshAVRotation
{
  BOOL v3 = [(RPVideoEditorViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [(RPVideoEditorViewController *)self avPlayerLayer];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  LODWORD(v3) = [(RPVideoEditorViewController *)self hasHomeButton];
  uint64_t v13 = [(RPVideoEditorViewController *)self view];
  [v13 bounds];
  double v15 = v14;
  if (v3) {
    double v16 = 60.0;
  }
  else {
    double v16 = 85.0;
  }
  id v17 = [(RPVideoEditorViewController *)self topToolBar];
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v15, v16);

  LODWORD(v17) = [(RPVideoEditorViewController *)self hasHomeButton];
  unsigned int v18 = [(RPVideoEditorViewController *)self view];
  [v18 bounds];
  double v20 = v19;
  uint64_t v21 = [(RPVideoEditorViewController *)self view];
  char v22 = v21;
  double v23 = -64.0;
  if (v17)
  {
    double v23 = -44.0;
    double v24 = 44.0;
  }
  else
  {
    double v24 = 64.0;
  }
  double v25 = v20 + v23;
  [v21 bounds];
  double v27 = v26;
  int v28 = [(RPVideoEditorViewController *)self bottomToolBar];
  objc_msgSend(v28, "setFrame:", 0.0, v25, v27, v24);

  [(RPVideoEditorViewController *)self setThumbnailGenerator:0];
  [(RPVideoEditorViewController *)self setCachedTimeStamps:0];
  id v29 = [(RPVideoEditorViewController *)self avTrimmer];
  [v29 reloadData];
}

- (void)undoAction
{
  if (![(RPVideoEditorViewController *)self isExporting])
  {
    id v5 = [(RPVideoEditorViewController *)self avTrimmer];
    BOOL v3 = [v5 delegate];
    double v4 = [(RPVideoEditorViewController *)self avTrimmer];
    [v3 movieScrubberDidCancelEditing:v4];
  }
}

- (void)playAction
{
  unsigned int v3 = [(RPVideoEditorViewController *)self isTrimming];
  double v4 = [(RPVideoEditorViewController *)self avPlayer];
  id v5 = v4;
  if (v3)
  {
    [(RPVideoEditorViewController *)self editStartTime];
    Float64 v7 = v6;
    double v8 = [(RPVideoEditorViewController *)self avPlayer];
    double v9 = v8;
    if (v8)
    {
      [v8 currentTime];
      int32_t v10 = v43;
    }
    else
    {
      int32_t v10 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
    }
    CMTimeMakeWithSeconds(&v45, v7, v10);
    [v5 seekToTime:&v45];

    memset(&v41, 0, sizeof(v41));
    [(RPVideoEditorViewController *)self editEndTime];
    Float64 v12 = v11;
    uint64_t v13 = [(RPVideoEditorViewController *)self avPlayer];
    double v14 = v13;
    if (v13)
    {
      [v13 currentTime];
      int32_t v15 = v39;
    }
    else
    {
      int32_t v15 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
    }
    CMTimeMakeWithSeconds(&v41, v12, v15);

    CMTime location = v41;
    double v16 = +[NSValue valueWithCMTime:&location];
    objc_initWeak((id *)&location, self);
    id v17 = [(RPVideoEditorViewController *)self avPlayer];
    double v46 = v16;
    unsigned int v18 = +[NSArray arrayWithObjects:&v46 count:1];
    id v19 = &_dispatch_main_q;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000090C0;
    v35[3] = &unk_100018608;
    objc_copyWeak(&v36, (id *)&location);
    double v20 = [v17 addBoundaryTimeObserverForTimes:v18 queue:&_dispatch_main_q usingBlock:v35];
    [(RPVideoEditorViewController *)self setTimeObserver:v20];

    uint64_t v21 = [(RPVideoEditorViewController *)self avPlayer];
    [v21 play];

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    [v4 play];
  }
  if (![(RPVideoEditorViewController *)self isUIHidden]) {
    [(RPVideoEditorViewController *)self hideUI];
  }
  if ([(RPVideoEditorViewController *)self isIntroMode])
  {
    char v22 = [(RPVideoEditorViewController *)self videoOverlayPlayButton];
    [v22 removeFromSuperview];

    [(RPVideoEditorViewController *)self setIntroMode:0];
  }
  if ([(RPVideoEditorViewController *)self isPadMode])
  {
    unsigned int v23 = [(RPVideoEditorViewController *)self isTrimming];
    double v24 = [(RPVideoEditorViewController *)self topToolBar];
    if (v23)
    {
      double v25 = [(RPVideoEditorViewController *)self cancelTrimButton];
      double v26 = [(RPVideoEditorViewController *)self flexSpace];
      double v27 = [(RPVideoEditorViewController *)self titleButton];
      int v28 = [(RPVideoEditorViewController *)self flexSpace];
      id v29 = [(RPVideoEditorViewController *)self pauseButton];
      v34 = [(RPVideoEditorViewController *)self fixSpace];
      double v30 = [(RPVideoEditorViewController *)self shareButton];
      v31 = [(RPVideoEditorViewController *)self fixSpace];
      [(RPVideoEditorViewController *)self trimButton];
    }
    else
    {
      double v25 = [(RPVideoEditorViewController *)self cancelButton];
      double v26 = [(RPVideoEditorViewController *)self flexSpace];
      double v27 = [(RPVideoEditorViewController *)self titleButton];
      int v28 = [(RPVideoEditorViewController *)self flexSpace];
      id v29 = [(RPVideoEditorViewController *)self pauseButton];
      v34 = [(RPVideoEditorViewController *)self fixSpace];
      double v30 = [(RPVideoEditorViewController *)self shareButton];
      v31 = [(RPVideoEditorViewController *)self fixSpace];
      [(RPVideoEditorViewController *)self saveButton];
    __int16 v32 = };
    int v33 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v26, v27, v28, v29, v34, v30, v31, v32, 0);
    [v24 setItems:v33];
  }
  else
  {
    double v24 = [(RPVideoEditorViewController *)self bottomToolBar];
    double v25 = [(RPVideoEditorViewController *)self shareButton];
    double v26 = [(RPVideoEditorViewController *)self flexSpace];
    double v27 = [(RPVideoEditorViewController *)self pauseButton];
    int v28 = [(RPVideoEditorViewController *)self flexSpace];
    id v29 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v25, v26, v27, v28, 0);
    [v24 setItems:v29];
  }
}

- (void)pauseAction
{
  unsigned int v3 = [(RPVideoEditorViewController *)self avPlayer];
  [v3 pause];

  if ([(RPVideoEditorViewController *)self isPadMode])
  {
    unsigned int v4 = [(RPVideoEditorViewController *)self isTrimming];
    id v15 = [(RPVideoEditorViewController *)self topToolBar];
    if (v4)
    {
      id v5 = [(RPVideoEditorViewController *)self cancelTrimButton];
      double v6 = [(RPVideoEditorViewController *)self flexSpace];
      Float64 v7 = [(RPVideoEditorViewController *)self titleButton];
      double v8 = [(RPVideoEditorViewController *)self flexSpace];
      double v9 = [(RPVideoEditorViewController *)self playButton];
      int32_t v10 = [(RPVideoEditorViewController *)self fixSpace];
      double v11 = [(RPVideoEditorViewController *)self shareButton];
      Float64 v12 = [(RPVideoEditorViewController *)self fixSpace];
      [(RPVideoEditorViewController *)self trimButton];
    }
    else
    {
      id v5 = [(RPVideoEditorViewController *)self cancelButton];
      double v6 = [(RPVideoEditorViewController *)self flexSpace];
      Float64 v7 = [(RPVideoEditorViewController *)self titleButton];
      double v8 = [(RPVideoEditorViewController *)self flexSpace];
      double v9 = [(RPVideoEditorViewController *)self playButton];
      int32_t v10 = [(RPVideoEditorViewController *)self fixSpace];
      double v11 = [(RPVideoEditorViewController *)self shareButton];
      Float64 v12 = [(RPVideoEditorViewController *)self fixSpace];
      [(RPVideoEditorViewController *)self saveButton];
    uint64_t v13 = };
    double v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, v13, 0);
    [v15 setItems:v14];
  }
  else
  {
    id v15 = [(RPVideoEditorViewController *)self bottomToolBar];
    id v5 = [(RPVideoEditorViewController *)self shareButton];
    double v6 = [(RPVideoEditorViewController *)self flexSpace];
    Float64 v7 = [(RPVideoEditorViewController *)self playButton];
    double v8 = [(RPVideoEditorViewController *)self flexSpace];
    double v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v6, v7, v8, 0);
    [v15 setItems:v9];
  }
}

- (void)doneAction
{
  if (![(RPVideoEditorViewController *)self isShareSheetUp])
  {
    unsigned int v3 = [(RPVideoEditorViewController *)self avPlayer];
    [v3 pause];

    id v5 = [(RPVideoEditorViewController *)self delegate];
    unsigned int v4 = [(RPVideoEditorViewController *)self activityTypes];
    [v5 videoEditor:self didFinishWithActivityTypes:v4];
  }
}

- (void)saveAction
{
  if (![(RPVideoEditorViewController *)self isShareSheetUp])
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      double v8 = "-[RPVideoEditorViewController saveAction]";
      __int16 v9 = 1024;
      int v10 = 693;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
    }
    unsigned int v3 = [(RPVideoEditorViewController *)self activityTypes];
    [v3 addObject:UIActivityTypeSaveToCameraRoll];

    if ([(RPVideoEditorViewController *)self isTrimming])
    {
      [(RPVideoEditorViewController *)self trimVideo];
    }
    else
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        [(RPVideoEditorViewController *)self getPlayerDuration];
        *(_DWORD *)buf = 136446722;
        double v8 = "-[RPVideoEditorViewController saveAction]";
        __int16 v9 = 1024;
        int v10 = 703;
        __int16 v11 = 2048;
        uint64_t v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Final video duration: %lf", buf, 0x1Cu);
      }
      id v5 = [(RPVideoEditorViewController *)self videoURL];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100009650;
      v6[3] = &unk_1000186C0;
      v6[4] = self;
      +[RPAudioMixUtility mixAudioForMovie:v5 withCompletionHandler:v6];
    }
  }
}

- (void)shareAction
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000099B4;
  block[3] = &unk_100018578;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)trimVideo
{
  if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    [(RPVideoEditorViewController *)self editStartTime];
    CMTimeEpoch v4 = v3;
    [(RPVideoEditorViewController *)self editEndTime];
    CMTimeValue v6 = v5;
    [(RPVideoEditorViewController *)self editEndTime];
    double v8 = v7;
    [(RPVideoEditorViewController *)self editStartTime];
    LODWORD(buf.start.value) = 136447234;
    *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)"-[RPVideoEditorViewController trimVideo]";
    LOWORD(buf.start.flags) = 1024;
    *(CMTimeFlags *)((char *)&buf.start.flags + 2) = 759;
    WORD1(buf.start.epoch) = 2048;
    *(CMTimeEpoch *)((char *)&buf.start.epoch + 4) = v4;
    WORD2(buf.duration.value) = 2048;
    *(CMTimeValue *)((char *)&buf.duration.value + 6) = v6;
    HIWORD(buf.duration.flags) = 2048;
    *(double *)&buf.duration.CMTimeEpoch epoch = v8 - v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Trimming video to start time:%lf end time:%lf duration:%lf", (uint8_t *)&buf, 0x30u);
  }
  [(RPVideoEditorViewController *)self setExporting:1];
  int v10 = [(RPVideoEditorViewController *)self videoURL];
  __int16 v11 = +[AVAsset assetWithURL:v10];

  id v12 = [objc_alloc((Class)AVAssetExportSession) initWithAsset:v11 presetName:AVAssetExportPresetHighestQuality];
  [(RPVideoEditorViewController *)self setExportSession:v12];

  uint64_t v13 = [(RPVideoEditorViewController *)self trimFileURL];
  double v14 = [(RPVideoEditorViewController *)self exportSession];
  [v14 setOutputURL:v13];

  id v15 = [(RPVideoEditorViewController *)self exportSession];
  [v15 setOutputFileType:AVFileTypeMPEG4];

  memset(&v38, 0, sizeof(v38));
  [(RPVideoEditorViewController *)self editStartTime];
  Float64 v17 = v16;
  unsigned int v18 = [(RPVideoEditorViewController *)self avPlayer];
  id v19 = v18;
  if (v18)
  {
    [v18 currentTime];
    LODWORD(v18) = v36;
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
  }
  CMTimeMakeWithSeconds(&v38, v17, (int32_t)v18);

  memset(&v34, 0, sizeof(v34));
  [(RPVideoEditorViewController *)self editEndTime];
  Float64 v21 = v20;
  char v22 = [(RPVideoEditorViewController *)self avPlayer];
  unsigned int v23 = v22;
  if (v22)
  {
    [v22 currentTime];
    LODWORD(v22) = v32;
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }
  CMTimeMakeWithSeconds(&v34, v21, (int32_t)v22);

  memset(&buf, 0, sizeof(buf));
  CMTime start = v38;
  CMTime duration = v34;
  CMTimeRangeMake(&buf, &start, &duration);
  CMTimeRange v28 = buf;
  double v24 = [(RPVideoEditorViewController *)self exportSession];
  CMTimeRange v27 = v28;
  [v24 setTimeRange:&v27];

  double v25 = [(RPVideoEditorViewController *)self exportSession];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100009FBC;
  v26[3] = &unk_100018578;
  v26[4] = self;
  [v25 exportAsynchronouslyWithCompletionHandler:v26];
}

- (void)reloadAVLayerWithURL:(id)a3
{
  id v4 = a3;
  if ([(RPVideoEditorViewController *)self isTrimming])
  {
    CMTimeValue v5 = [(RPVideoEditorViewController *)self avTrimmer];
    CMTimeValue v6 = [v5 delegate];
    double v7 = [(RPVideoEditorViewController *)self avTrimmer];
    [v6 movieScrubberDidCancelEditing:v7];
  }
  [(RPVideoEditorViewController *)self setVideoURL:v4];
  double v8 = [(RPVideoEditorViewController *)self avPlayer];
  double v9 = [v8 currentItem];
  [v9 removeObserver:self forKeyPath:@"status"];

  int v10 = [(RPVideoEditorViewController *)self avPlayer];
  __int16 v11 = [v10 currentItem];
  [v11 removeObserver:self forKeyPath:@"duration"];

  id v12 = [objc_alloc((Class)AVURLAsset) initWithURL:v4 options:0];
  [(RPVideoEditorViewController *)self setAvAsset:v12];

  id v13 = objc_alloc((Class)AVPlayerItem);
  double v14 = [(RPVideoEditorViewController *)self avAsset];
  id v15 = [v13 initWithAsset:v14];
  [(RPVideoEditorViewController *)self setAvPlayerItem:v15];

  id v16 = objc_alloc((Class)AVPlayer);
  Float64 v17 = [(RPVideoEditorViewController *)self avPlayerItem];
  id v18 = [v16 initWithPlayerItem:v17];
  [(RPVideoEditorViewController *)self setAvPlayer:v18];

  id v19 = [(RPVideoEditorViewController *)self avPlayer];
  [v19 setActionAtItemEnd:1];

  double v20 = [(RPVideoEditorViewController *)self avPlayer];
  CMTime v33 = kCMTimeZero;
  [v20 seekToTime:&v33];

  Float64 v21 = [(RPVideoEditorViewController *)self avPlayer];
  char v22 = [(RPVideoEditorViewController *)self avPlayerLayer];
  [v22 setPlayer:v21];

  unsigned int v23 = [(RPVideoEditorViewController *)self avPlayer];
  double v24 = [v23 currentItem];
  [v24 addObserver:self forKeyPath:@"status" options:0 context:0];

  double v25 = [(RPVideoEditorViewController *)self avPlayer];
  double v26 = [v25 currentItem];
  [v26 addObserver:self forKeyPath:@"duration" options:0 context:0];

  [(RPVideoEditorViewController *)self setCurrentItemLoaded:0];
  [(RPVideoEditorViewController *)self setScrubbing:0];
  memset(&v33, 0, sizeof(v33));
  CMTimeMakeWithSeconds(&v33, 0.0333333333, 1000000000);
  objc_initWeak(&location, self);
  CMTimeRange v27 = [(RPVideoEditorViewController *)self avPlayer];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000A758;
  v30[3] = &unk_100018550;
  objc_copyWeak(&v31, &location);
  CMTime v29 = v33;
  CMTimeRange v28 = [v27 addPeriodicTimeObserverForInterval:&v29 queue:0 usingBlock:v30];
  [(RPVideoEditorViewController *)self setPlaybackTimeObserver:v28];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)displayShareSheetWithVideoURL:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTimeRange buf = 136446466;
    __int16 v11 = "-[RPVideoEditorViewController displayShareSheetWithVideoURL:]";
    __int16 v12 = 1024;
    int v13 = 874;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  CMTimeValue v5 = +[RPStoreManager sharedManager];
  CMTimeValue v6 = [(RPVideoEditorViewController *)self bundleIdentifier];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000A9A8;
  v8[3] = &unk_100018730;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 loadItemDetailsForBundleIdentifier:v6 completionHandler:v8];
}

- (void)editMode
{
  if ([(RPVideoEditorViewController *)self isPadMode])
  {
    CMTimeEpoch v3 = [(RPVideoEditorViewController *)self topToolBar];
    id v4 = [(RPVideoEditorViewController *)self cancelTrimButton];
    CMTimeValue v5 = [(RPVideoEditorViewController *)self flexSpace];
    CMTimeValue v6 = [(RPVideoEditorViewController *)self titleButton];
    id v7 = [(RPVideoEditorViewController *)self flexSpace];
    double v8 = [(RPVideoEditorViewController *)self playButton];
    id v9 = [(RPVideoEditorViewController *)self fixSpace];
    int v10 = [(RPVideoEditorViewController *)self trimButton];
    __int16 v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v5, v6, v7, v8, v9, v10, 0);
    [v3 setItems:v11];
  }
  else
  {
    __int16 v12 = [(RPVideoEditorViewController *)self bottomToolBar];
    int v13 = [(RPVideoEditorViewController *)self flexSpace];
    double v14 = [(RPVideoEditorViewController *)self playButton];
    id v15 = [(RPVideoEditorViewController *)self flexSpace];
    id v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v13, v14, v15, 0);
    [v12 setItems:v16];

    CMTimeEpoch v3 = [(RPVideoEditorViewController *)self topToolBar];
    id v4 = [(RPVideoEditorViewController *)self cancelTrimButton];
    CMTimeValue v5 = [(RPVideoEditorViewController *)self flexSpace];
    CMTimeValue v6 = [(RPVideoEditorViewController *)self titleButton];
    id v7 = [(RPVideoEditorViewController *)self flexSpace];
    double v8 = [(RPVideoEditorViewController *)self trimButton];
    id v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v5, v6, v7, v8, 0);
    [v3 setItems:v9];
  }

  [(RPVideoEditorViewController *)self setHasEdit:1];
}

- (void)previewMode
{
  if ([(RPVideoEditorViewController *)self isPadMode])
  {
    unsigned int v3 = [(RPVideoEditorViewController *)self hasEdit];
    id v20 = [(RPVideoEditorViewController *)self topToolBar];
    if (v3) {
      [(RPVideoEditorViewController *)self doneButton];
    }
    else {
    int v10 = [(RPVideoEditorViewController *)self cancelButton];
    }
    __int16 v11 = [(RPVideoEditorViewController *)self flexSpace];
    __int16 v12 = [(RPVideoEditorViewController *)self titleButton];
    int v13 = [(RPVideoEditorViewController *)self flexSpace];
    double v14 = [(RPVideoEditorViewController *)self playButton];
    id v15 = [(RPVideoEditorViewController *)self fixSpace];
    id v16 = [(RPVideoEditorViewController *)self shareButton];
    Float64 v17 = [(RPVideoEditorViewController *)self fixSpace];
    id v18 = [(RPVideoEditorViewController *)self saveButton];
    id v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v11, v12, v13, v14, v15, v16, v17, v18, 0);
    [v20 setItems:v19];
  }
  else
  {
    id v4 = [(RPVideoEditorViewController *)self bottomToolBar];
    CMTimeValue v5 = [(RPVideoEditorViewController *)self shareButton];
    CMTimeValue v6 = [(RPVideoEditorViewController *)self flexSpace];
    id v7 = [(RPVideoEditorViewController *)self playButton];
    double v8 = [(RPVideoEditorViewController *)self flexSpace];
    id v9 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v5, v6, v7, v8, 0);
    [v4 setItems:v9];

    LODWORD(v4) = [(RPVideoEditorViewController *)self hasEdit];
    id v20 = [(RPVideoEditorViewController *)self topToolBar];
    if (v4) {
      [(RPVideoEditorViewController *)self doneButton];
    }
    else {
    int v10 = [(RPVideoEditorViewController *)self cancelButton];
    }
    __int16 v11 = [(RPVideoEditorViewController *)self flexSpace];
    __int16 v12 = [(RPVideoEditorViewController *)self titleButton];
    int v13 = [(RPVideoEditorViewController *)self flexSpace];
    double v14 = [(RPVideoEditorViewController *)self saveButton];
    id v15 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v11, v12, v13, v14, 0);
    [v20 setItems:v15];
  }
}

- (void)movieScrubber:(id)a3 valueDidChange:(double)a4
{
  CMTimeValue v6 = [(RPVideoEditorViewController *)self avPlayer];
  id v7 = [(RPVideoEditorViewController *)self avPlayer];
  double v8 = v7;
  if (v7)
  {
    [v7 currentTime];
    LODWORD(v7) = v9;
  }
  CMTimeMakeWithSeconds(&v10, a4, (int32_t)v7);
  [v6 seekToTime:&v10];
}

- (void)movieScrubberDidBeginScrubbing:(id)a3 withHandle:(int)a4
{
  -[RPVideoEditorViewController setScrubbing:](self, "setScrubbing:", 1, *(void *)&a4);

  [(RPVideoEditorViewController *)self pauseAction];
}

- (void)movieScrubberDidEndScrubbing:(id)a3 withHandle:(int)a4
{
  id v5 = a3;
  CMTimeValue v6 = [(RPVideoEditorViewController *)self avPlayer];
  [v5 value];
  Float64 v8 = v7;

  int v9 = [(RPVideoEditorViewController *)self avPlayer];
  CMTime v10 = v9;
  if (v9)
  {
    [v9 currentTime];
    LODWORD(v9) = v11;
  }
  CMTimeMakeWithSeconds(&v12, v8, (int32_t)v9);
  [v6 seekToTime:&v12];

  [(RPVideoEditorViewController *)self setScrubbing:0];
}

- (void)movieScrubber:(id)a3 editingStartValueDidChange:(double)a4
{
  CMTimeValue v6 = [(RPVideoEditorViewController *)self avPlayer];
  [v6 pause];

  [(RPVideoEditorViewController *)self setEditStartTime:a4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B64C;
  v7[3] = &unk_100018758;
  v7[4] = self;
  *(double *)&v7[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  [(RPVideoEditorViewController *)self setTrimming:1];
}

- (void)movieScrubber:(id)a3 editingEndValueDidChange:(double)a4
{
  CMTimeValue v6 = [(RPVideoEditorViewController *)self avPlayer];
  [v6 pause];

  [(RPVideoEditorViewController *)self setEditEndTime:a4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B79C;
  v7[3] = &unk_100018758;
  v7[4] = self;
  *(double *)&v7[5] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  [(RPVideoEditorViewController *)self setTrimming:1];
}

- (void)movieScrubberDidBeginEditing:(id)a3
{
  [(RPVideoEditorViewController *)self editMode];

  [(RPVideoEditorViewController *)self setTrimming:1];
}

- (void)movieScrubberDidCancelEditing:(id)a3
{
  id v4 = [(RPVideoEditorViewController *)self avTrimmer];
  [v4 setEditing:0 animated:1];

  [(RPVideoEditorViewController *)self previewMode];

  [(RPVideoEditorViewController *)self setTrimming:0];
}

- (id)movieScrubber:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  [v10 doubleValue];
  if (v11 == 0.0) {
    goto LABEL_10;
  }
  CMTime v12 = +[NSMutableArray arrayWithCapacity:a4];
  [(RPVideoEditorViewController *)self getPlayerDuration];
  double v14 = v13;
  [v9 doubleValue];
  double v16 = v15;
  [v10 doubleValue];
  int v18 = a4 - 1;
  if (a4 >= 1)
  {
    double v19 = (v17 - v16) / (double)a4;
    do
    {
      id v20 = +[NSNumber numberWithDouble:v16];
      [v12 addObject:v20];

      double v16 = v19 + v16;
    }
    while (v16 <= v14 && v18-- != 0);
  }
  if (!v12)
  {
LABEL_10:
    char v22 = +[NSNumber numberWithDouble:0.0];
    CMTime v12 = +[NSArray arrayWithObject:v22];
  }

  return v12;
}

- (double)movieScrubberThumbnailAspectRatio:(id)a3
{
  unsigned int v3 = [(RPVideoEditorViewController *)self avPlayer];
  id v4 = [v3 currentItem];
  id v5 = [v4 asset];
  CMTimeValue v6 = [v5 tracksWithMediaType:AVMediaTypeVideo];

  if ([v6 count])
  {
    double v7 = [v6 objectAtIndex:0];
    [v7 naturalSize];
    if (v7)
    {
      double v21 = v9;
      double v22 = v8;
      [v7 preferredTransform];

      float64x2_t v11 = v24;
      float64x2_t v10 = v23;
      double v9 = v21;
      double v8 = v22;
      unsigned int v12 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    [0 naturalSize];
  }
  float64x2_t v10 = 0uLL;
  unsigned int v12 = 1;
  float64x2_t v11 = 0uLL;
LABEL_6:
  float64x2_t v13 = vmlaq_n_f64(vmulq_n_f64(v11, v9), v10, v8);
  int32x2_t v14 = vdup_n_s32(v12);
  v15.i64[0] = v14.u32[0];
  v15.i64[1] = v14.u32[1];
  int8x16_t v16 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v15, 0x3FuLL)), (int8x16_t)CGSizeZero, vbslq_s8((int8x16_t)vcltzq_f64(v13), (int8x16_t)vnegq_f64(v13), (int8x16_t)v13));
  BOOL v17 = *(double *)&v16.i64[1] <= 0.0 || *(double *)v16.i64 <= 0.0;
  double v18 = *(double *)v16.i64 / *(double *)&v16.i64[1];
  if (v17) {
    double v19 = 1.0;
  }
  else {
    double v19 = v18;
  }

  return v19;
}

- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4
{
  id v5 = a4;
  CMTimeValue v6 = [(RPVideoEditorViewController *)self thumbnailGenerator];

  if (!v6)
  {
    id v7 = objc_alloc((Class)AVAssetImageGenerator);
    double v8 = [(RPVideoEditorViewController *)self avPlayer];
    double v9 = [v8 currentItem];
    float64x2_t v10 = [v9 asset];
    id v11 = [v7 initWithAsset:v10];
    [(RPVideoEditorViewController *)self setThumbnailGenerator:v11];

    [(RPVideoEditorViewController *)self getThumbnailSize];
    double v13 = v12;
    double v15 = v14;
    int8x16_t v16 = [(RPVideoEditorViewController *)self thumbnailGenerator];
    objc_msgSend(v16, "setMaximumSize:", v13, v15);
  }
  BOOL v17 = [(RPVideoEditorViewController *)self cachedTimeStamps];

  if (!v17)
  {
    double v18 = objc_opt_new();
    [(RPVideoEditorViewController *)self setCachedTimeStamps:v18];
  }
  double v19 = [(RPVideoEditorViewController *)self cachedTimeStamps];
  id v20 = [v19 objectForKey:v5];

  if (v20)
  {
    [(RPVideoEditorViewController *)self setThumbnailFromCacheWithTimeStamp:v5];
  }
  else
  {
    double v21 = [(RPVideoEditorViewController *)self thumbnailGenerator];
    id v25 = v5;
    double v22 = +[NSArray arrayWithObjects:&v25 count:1];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000BD8C;
    v23[3] = &unk_100018780;
    v23[4] = self;
    id v24 = v5;
    [v21 generateCGImagesAsynchronouslyForTimes:v22 completionHandler:v23];
  }
}

- (void)setThumbnailFromCacheWithTimeStamp:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000BE8C;
  v4[3] = &unk_100018670;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (CGSize)getVideoSize
{
  v2 = [(RPVideoEditorViewController *)self avPlayer];
  id v3 = [v2 currentItem];
  id v4 = [v3 asset];
  id v5 = [v4 tracksWithMediaType:AVMediaTypeVideo];

  if (![v5 count])
  {
    [0 naturalSize];
    goto LABEL_5;
  }
  CMTimeValue v6 = [v5 objectAtIndex:0];
  [v6 naturalSize];
  if (!v6)
  {
LABEL_5:
    float64x2_t v9 = 0uLL;
    unsigned int v11 = 1;
    float64x2_t v10 = 0uLL;
    goto LABEL_6;
  }
  double v17 = v8;
  double v18 = v7;
  [v6 preferredTransform];

  float64x2_t v10 = v21;
  float64x2_t v9 = v20;
  double v8 = v17;
  double v7 = v18;
  unsigned int v11 = 0;
LABEL_6:
  float64x2_t v12 = vmlaq_n_f64(vmulq_n_f64(v10, v8), v9, v7);
  int32x2_t v13 = vdup_n_s32(v11);
  v14.i64[0] = v13.u32[0];
  v14.i64[1] = v13.u32[1];
  int8x16_t v19 = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v14, 0x3FuLL)), (int8x16_t)CGSizeZero, vbslq_s8((int8x16_t)vcltzq_f64(v12), (int8x16_t)vnegq_f64(v12), (int8x16_t)v12));

  double v16 = *(double *)&v19.i64[1];
  double v15 = *(double *)v19.i64;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (double)getPlayerDuration
{
  id v3 = [(RPVideoEditorViewController *)self avPlayer];
  id v4 = [v3 currentItem];
  id v5 = [v4 status];

  if (v5 == (id)1)
  {
    CMTimeValue v6 = [(RPVideoEditorViewController *)self avPlayer];
    double v7 = [v6 currentItem];
    double v8 = v7;
    if (v7) {
      [v7 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    CMTime v11 = kCMTimeInvalid;
    return CMTimeGetSeconds(&v11);
  }
  return Seconds;
}

- (CGSize)getThumbnailSize
{
  [(RPVideoEditorViewController *)self getVideoSize];
  float v4 = v2 / v3;
  id v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v7 = v6 * 38.0;

  float v8 = v7 * v4;
  double v9 = rintf(v8);
  float64x2_t v10 = +[UIScreen mainScreen];
  [v10 scale];
  double v12 = v11 * v9;

  double v13 = v12;
  double v14 = v7;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  if ([v6 subtype] == (id)1
    && [(RPVideoEditorViewController *)self isTrimming]
    && ![(RPVideoEditorViewController *)self isExporting])
  {
    [(RPVideoEditorViewController *)self undoAction];
  }
  v8.receiver = self;
  v8.super_class = (Class)RPVideoEditorViewController;
  if ([(RPVideoEditorViewController *)&v8 respondsToSelector:"motionEnded:withEvent:"])
  {
    v7.receiver = self;
    v7.super_class = (Class)RPVideoEditorViewController;
    [(RPVideoEditorViewController *)&v7 motionEnded:a3 withEvent:v6];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)fileAttachmentURL
{
  return self->_fileAttachmentURL;
}

- (void)setFileAttachmentURL:(id)a3
{
}

- (NSString)overrideShareMessage
{
  return self->_overrideShareMessage;
}

- (void)setOverrideShareMessage:(id)a3
{
}

- (NSURL)videoURL
{
  return self->_videoURL;
}

- (void)setVideoURL:(id)a3
{
}

- (AVPlayer)avPlayer
{
  return self->_avPlayer;
}

- (void)setAvPlayer:(id)a3
{
}

- (AVPlayerLayer)avPlayerLayer
{
  return self->_avPlayerLayer;
}

- (void)setAvPlayerLayer:(id)a3
{
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (void)setAvPlayerItem:(id)a3
{
}

- (AVURLAsset)avAsset
{
  return self->_avAsset;
}

- (void)setAvAsset:(id)a3
{
}

- (BOOL)currentItemLoaded
{
  return self->_currentItemLoaded;
}

- (void)setCurrentItemLoaded:(BOOL)a3
{
  self->_currentItemLoaded = a3;
}

- (UIView)scrubberContainterView
{
  return self->_scrubberContainterView;
}

- (void)setScrubberContainterView:(id)a3
{
}

- (NSObject)playbackTimeObserver
{
  return self->_playbackTimeObserver;
}

- (void)setPlaybackTimeObserver:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (id)timeObserver
{
  return self->_timeObserver;
}

- (void)setTimeObserver:(id)a3
{
}

- (BOOL)isExporting
{
  return self->_exporting;
}

- (void)setExporting:(BOOL)a3
{
  self->_exporting = a3;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (BOOL)isTrimming
{
  return self->_trimming;
}

- (void)setTrimming:(BOOL)a3
{
  self->_trimming = a3;
}

- (BOOL)isPadMode
{
  return self->_padMode;
}

- (void)setPadMode:(BOOL)a3
{
  self->_padMode = a3;
}

- (BOOL)isIntroMode
{
  return self->_introMode;
}

- (void)setIntroMode:(BOOL)a3
{
  self->_introMode = a3;
}

- (BOOL)isUIHidden
{
  return self->_uiHidden;
}

- (void)setUiHidden:(BOOL)a3
{
  self->_uiHidden = a3;
}

- (BOOL)isShareSheetUp
{
  return self->_shareSheetUp;
}

- (void)setShareSheetUp:(BOOL)a3
{
  self->_shareSheetUp = a3;
}

- (UIToolbar)bottomToolBar
{
  return self->_bottomToolBar;
}

- (void)setBottomToolBar:(id)a3
{
}

- (UIToolbar)topToolBar
{
  return self->_topToolBar;
}

- (void)setTopToolBar:(id)a3
{
}

- (UIBarButtonItem)shareButton
{
  return self->_shareButton;
}

- (void)setShareButton:(id)a3
{
}

- (UIBarButtonItem)pauseButton
{
  return self->_pauseButton;
}

- (void)setPauseButton:(id)a3
{
}

- (UIBarButtonItem)saveButton
{
  return self->_saveButton;
}

- (void)setSaveButton:(id)a3
{
}

- (UIBarButtonItem)flexSpace
{
  return self->_flexSpace;
}

- (void)setFlexSpace:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)cancelTrimButton
{
  return self->_cancelTrimButton;
}

- (void)setCancelTrimButton:(id)a3
{
}

- (UIBarButtonItem)trimButton
{
  return self->_trimButton;
}

- (void)setTrimButton:(id)a3
{
}

- (UIBarButtonItem)undoButton
{
  return self->_undoButton;
}

- (void)setUndoButton:(id)a3
{
}

- (UIBarButtonItem)titleButton
{
  return self->_titleButton;
}

- (void)setTitleButton:(id)a3
{
}

- (UIBarButtonItem)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (UIBarButtonItem)fixSpace
{
  return self->_fixSpace;
}

- (void)setFixSpace:(id)a3
{
}

- (RPVideoOverlayButton)videoOverlayPlayButton
{
  return self->_videoOverlayPlayButton;
}

- (void)setVideoOverlayPlayButton:(id)a3
{
}

- (UIView)videoOverlay
{
  return self->_videoOverlay;
}

- (void)setVideoOverlay:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (double)editStartTime
{
  return self->_editStartTime;
}

- (void)setEditStartTime:(double)a3
{
  self->_editStartTime = a3;
}

- (double)editEndTime
{
  return self->_editEndTime;
}

- (void)setEditEndTime:(double)a3
{
  self->_editEndTime = a3;
}

- (NSURL)trimFilePath
{
  return self->_trimFilePath;
}

- (void)setTrimFilePath:(id)a3
{
}

- (NSURL)originalVideoURL
{
  return self->_originalVideoURL;
}

- (void)setOriginalVideoURL:(id)a3
{
}

- (AVAssetExportSession)exportSession
{
  return self->_exportSession;
}

- (void)setExportSession:(id)a3
{
}

- (UIMovieScrubber)avTrimmer
{
  return self->_avTrimmer;
}

- (void)setAvTrimmer:(id)a3
{
}

- (AVAssetImageGenerator)thumbnailGenerator
{
  return self->_thumbnailGenerator;
}

- (void)setThumbnailGenerator:(id)a3
{
}

- (NSMutableDictionary)cachedTimeStamps
{
  return self->_cachedTimeStamps;
}

- (void)setCachedTimeStamps:(id)a3
{
}

- (NSMutableArray)activityTypes
{
  return self->_activityTypes;
}

- (void)setActivityTypes:(id)a3
{
}

- (BOOL)hasEdit
{
  return self->_hasEdit;
}

- (void)setHasEdit:(BOOL)a3
{
  self->_hasEdit = a3;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypes, 0);
  objc_storeStrong((id *)&self->_cachedTimeStamps, 0);
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_avTrimmer, 0);
  objc_storeStrong((id *)&self->_exportSession, 0);
  objc_storeStrong((id *)&self->_originalVideoURL, 0);
  objc_storeStrong((id *)&self->_trimFilePath, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_videoOverlay, 0);
  objc_storeStrong((id *)&self->_videoOverlayPlayButton, 0);
  objc_storeStrong((id *)&self->_fixSpace, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_titleButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_trimButton, 0);
  objc_storeStrong((id *)&self->_cancelTrimButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_flexSpace, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_pauseButton, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_topToolBar, 0);
  objc_storeStrong((id *)&self->_bottomToolBar, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_playbackTimeObserver, 0);
  objc_storeStrong((id *)&self->_scrubberContainterView, 0);
  objc_storeStrong((id *)&self->_avAsset, 0);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);
  objc_storeStrong((id *)&self->_avPlayerLayer, 0);
  objc_storeStrong((id *)&self->_avPlayer, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_overrideShareMessage, 0);
  objc_storeStrong((id *)&self->_fileAttachmentURL, 0);

  objc_destroyWeak(&self->_delegate);
}

@end
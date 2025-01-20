@interface AVPictureInPictureSampleBufferDisplayLayerView
- (AVObservationController)observationController;
- (AVPictureInPictureIndicatorLayer)placeholderLayer;
- (AVPictureInPictureSampleBufferDisplayLayerHostView)sbdlHostView;
- (AVPictureInPictureSampleBufferDisplayLayerView)initWithSourceLayer:(id)a3 playerController:(id)a4;
- (AVSampleBufferDisplayLayer)sourceLayer;
- (AVSampleBufferDisplayLayerPlayerController)playerController;
- (BOOL)isPIPModeEnabled;
- (CALayerHost)sourceLayerHost;
- (CGSize)imageQueueSize;
- (CGSize)lastKnownRenderSize;
- (id)_makePictureInPicturePlatformAdapterContentPlaceholderLayer;
- (unsigned)sourceContextId;
- (void)_updateGeometry;
- (void)_updateSourceLayerHost;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setImageQueueSize:(CGSize)a3;
- (void)setLastKnownRenderSize:(CGSize)a3;
- (void)setObservationController:(id)a3;
- (void)setPIPModeEnabled:(BOOL)a3;
- (void)setPlaceholderLayer:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setSbdlHostView:(id)a3;
- (void)setSourceContextId:(unsigned int)a3;
- (void)setSourceLayerHost:(id)a3;
@end

@implementation AVPictureInPictureSampleBufferDisplayLayerView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sourceLayerHost);
  objc_storeStrong((id *)&self->_sbdlHostView, 0);
  objc_storeStrong((id *)&self->_placeholderLayer, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);

  objc_storeStrong((id *)&self->_sourceLayer, 0);
}

- (void)setImageQueueSize:(CGSize)a3
{
  self->_imageQueueSize = a3;
}

- (CGSize)imageQueueSize
{
  double width = self->_imageQueueSize.width;
  double height = self->_imageQueueSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)lastKnownRenderSize
{
  double width = self->_lastKnownRenderSize.width;
  double height = self->_lastKnownRenderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSourceContextId:(unsigned int)a3
{
  self->_sourceContextId = a3;
}

- (unsigned)sourceContextId
{
  return self->_sourceContextId;
}

- (void)setSourceLayerHost:(id)a3
{
}

- (CALayerHost)sourceLayerHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceLayerHost);

  return (CALayerHost *)WeakRetained;
}

- (void)setSbdlHostView:(id)a3
{
}

- (AVPictureInPictureSampleBufferDisplayLayerHostView)sbdlHostView
{
  return self->_sbdlHostView;
}

- (void)setPlaceholderLayer:(id)a3
{
}

- (AVPictureInPictureIndicatorLayer)placeholderLayer
{
  return self->_placeholderLayer;
}

- (void)setPlayerController:(id)a3
{
}

- (AVSampleBufferDisplayLayerPlayerController)playerController
{
  return self->_playerController;
}

- (void)setObservationController:(id)a3
{
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (BOOL)isPIPModeEnabled
{
  return self->_PIPModeEnabled;
}

- (AVSampleBufferDisplayLayer)sourceLayer
{
  return self->_sourceLayer;
}

- (id)_makePictureInPicturePlatformAdapterContentPlaceholderLayer
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  v4 = (void *)MEMORY[0x1E4FB1830];
  v5 = [MEMORY[0x1E4FB08E0] systemFontOfSize:100.0];
  v6 = [v4 configurationWithFont:v5];
  v7 = [v3 systemImageNamed:@"pip" withConfiguration:v6];
  v8 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
  v9 = [v7 _flatImageWithColor:v8];

  v10 = [AVPictureInPictureIndicatorLayer alloc];
  v11 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
  v12 = objc_msgSend(v11, "avkit_window");
  v13 = [v12 traitCollection];
  [v13 displayScale];
  double v15 = v14;
  id v16 = v9;
  uint64_t v17 = [v16 CGImage];
  double v18 = *MEMORY[0x1E4F1DAD8];
  double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v20 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self playerController];
  [v20 contentDimensions];
  v23 = -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](v10, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", v17, 0, v15, v18, v19, v21, v22);

  return v23;
}

- (void)_updateGeometry
{
  v3 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self playerController];
  [v3 contentDimensions];
  CGFloat v5 = v4;
  CGFloat v7 = v6;

  v8 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self playerController];
  [v8 contentDimensions];
  uint64_t v11 = v10;
  unint64_t v12 = v10 - 1;
  unint64_t v13 = ((v10 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  BOOL v16 = ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v9 >= 0
     || (unint64_t)(v9 - 1) < 0xFFFFFFFFFFFFFLL;

  [(AVPictureInPictureSampleBufferDisplayLayerView *)self imageQueueSize];
  BOOL v21 = ((v17 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v17 >= 0
     || (unint64_t)(v17 - 1) < 0xFFFFFFFFFFFFFLL;
  BOOL v24 = ((v18 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v18 >= 0
     || (unint64_t)(v18 - 1) < 0xFFFFFFFFFFFFFLL;
  BOOL v26 = (v11 < 0 || v13 > 0x3FE) && v12 > 0xFFFFFFFFFFFFELL;
  if (!v26
    && v16
    && v21
    && v24
    && [(AVPictureInPictureSampleBufferDisplayLayerView *)self isPIPModeEnabled])
  {
    v27 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
    [v27 setHidden:0];

    v28 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
    [(AVPictureInPictureSampleBufferDisplayLayerView *)self bounds];
    objc_msgSend(v28, "setFrame:contentDimensions:imageQueueSize:");

    [(AVPictureInPictureSampleBufferDisplayLayerView *)self frame];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    v44.double width = v5;
    v44.double height = v7;
    v45.origin.x = v30;
    v45.origin.y = v32;
    v45.size.double width = v34;
    v45.size.double height = v36;
    AVMakeRectWithAspectRatioInsideRect(v44, v45);
    v37 = self;
    UIPointRoundToViewScale();
    UISizeRoundToViewScale();
    double v39 = v38;
    double v41 = v40;
  }
  else
  {
    v42 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
    [v42 setHidden:1];

    double v39 = *MEMORY[0x1E4F1DB30];
    double v41 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  -[AVPictureInPictureSampleBufferDisplayLayerView setLastKnownRenderSize:](self, "setLastKnownRenderSize:", v39, v41);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerView;
  [(AVPictureInPictureSampleBufferDisplayLayerView *)&v3 layoutSubviews];
  [(AVPictureInPictureSampleBufferDisplayLayerView *)self _updateGeometry];
}

- (void)setLastKnownRenderSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width != self->_lastKnownRenderSize.width || a3.height != self->_lastKnownRenderSize.height)
  {
    self->_lastKnownRenderSize = a3;
    CGFloat v7 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self playerController];
    v8 = [v7 pictureInPictureController];
    uint64_t v9 = [v8 contentSource];
    id v12 = [v9 sampleBufferPlaybackDelegate];

    uint64_t v10 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self playerController];
    uint64_t v11 = [v10 pictureInPictureController];
    [v12 pictureInPictureController:v11 didTransitionToRenderSize:(int)width | ((unint64_t)(int)height << 32)];
  }
}

- (void)setPIPModeEnabled:(BOOL)a3
{
  v68[1] = *MEMORY[0x1E4F143B8];
  if (self->_PIPModeEnabled != a3)
  {
    BOOL v3 = a3;
    self->_PIPModeEnabled = a3;
    CGFloat v5 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self observationController];
    [v5 stopAllObservation];

    double v6 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];

    if (!v6)
    {
      CGFloat v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v67 = 0;
        _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "Expected a source layer.", v67, 2u);
      }
    }
    v8 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self playerController];

    if (v8)
    {
      if (!v3)
      {
LABEL_16:
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        double v14 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
        [v14 setHidden:1];

        double v15 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
        [v15 removeFromSuperview];

        [(AVPictureInPictureSampleBufferDisplayLayerView *)self setSbdlHostView:0];
        uint64_t v16 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceContextId];
        uint64_t v17 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];
        [v17 setContextId:v16];

        uint64_t v18 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
        [v18 setContextId:0];

        [(AVPictureInPictureSampleBufferDisplayLayerView *)self setSourceContextId:0];
        [(AVPictureInPictureSampleBufferDisplayLayerView *)self setSourceLayerHost:0];
        [MEMORY[0x1E4F39CF8] commit];
        double v19 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self placeholderLayer];
        [v19 removeFromSuperlayer];

        [(AVPictureInPictureSampleBufferDisplayLayerView *)self setPlaceholderLayer:0];
        return;
      }
    }
    else
    {
      uint64_t v9 = _AVLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v67 = 0;
        _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "Expected a player controller.", v67, 2u);
      }

      if (!v3) {
        goto LABEL_16;
      }
    }
    uint64_t v10 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
    if (!v10) {
      goto LABEL_16;
    }
    uint64_t v11 = (void *)v10;
    id v12 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self playerController];

    if (!v12) {
      goto LABEL_16;
    }
    unint64_t v13 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self observationController];
    if (v13)
    {
      [(AVPictureInPictureSampleBufferDisplayLayerView *)self setObservationController:v13];
    }
    else
    {
      v20 = [[AVObservationController alloc] initWithOwner:self];
      [(AVPictureInPictureSampleBufferDisplayLayerView *)self setObservationController:v20];
    }
    BOOL v21 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self placeholderLayer];
    if (v21)
    {
      [(AVPictureInPictureSampleBufferDisplayLayerView *)self setPlaceholderLayer:v21];
    }
    else
    {
      double v22 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self _makePictureInPicturePlatformAdapterContentPlaceholderLayer];
      [(AVPictureInPictureSampleBufferDisplayLayerView *)self setPlaceholderLayer:v22];
    }
    v23 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];

    if (!v23)
    {
      BOOL v24 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
      v25 = objc_msgSend(v24, "avkit_sbdlpip_findFirstCALayerHost");
      [(AVPictureInPictureSampleBufferDisplayLayerView *)self setSourceLayerHost:v25];

      BOOL v26 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];
      -[AVPictureInPictureSampleBufferDisplayLayerView setSourceContextId:](self, "setSourceContextId:", [v26 contextId]);

      v27 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];
      [v27 setContextId:0];
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    v28 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
    if (v28)
    {
      [(AVPictureInPictureSampleBufferDisplayLayerView *)self setSbdlHostView:v28];
    }
    else
    {
      double v29 = [AVPictureInPictureSampleBufferDisplayLayerHostView alloc];
      [(AVPictureInPictureSampleBufferDisplayLayerView *)self bounds];
      CGFloat v30 = -[AVPictureInPictureSampleBufferDisplayLayerHostView initWithFrame:](v29, "initWithFrame:");
      [(AVPictureInPictureSampleBufferDisplayLayerView *)self setSbdlHostView:v30];
    }
    double v31 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];
    [v31 beginTime];
    double v33 = v32;
    CGFloat v34 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
    [v34 setBeginTime:v33];

    uint64_t v35 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceContextId];
    CGFloat v36 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
    [v36 setContextId:v35];

    v37 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
    [(AVPictureInPictureSampleBufferDisplayLayerView *)self addSubview:v37];

    double v38 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
    double v39 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self placeholderLayer];
    [v38 addSublayer:v39];

    double v40 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
    [v40 bounds];
    -[AVPictureInPictureSampleBufferDisplayLayerView setImageQueueSize:](self, "setImageQueueSize:", v41, v42);

    v43 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
    [v43 bounds];
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    v52 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self placeholderLayer];
    objc_msgSend(v52, "setBounds:", v45, v47, v49, v51);

    v53 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
    [v53 bounds];
    UIRectGetCenter();
    double v55 = v54;
    double v57 = v56;
    v58 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self placeholderLayer];
    objc_msgSend(v58, "setPosition:", v55, v57);

    [(AVPictureInPictureSampleBufferDisplayLayerView *)self _updateGeometry];
    [MEMORY[0x1E4F39CF8] commit];
    v59 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self observationController];
    v60 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self playerController];
    v68[0] = @"contentDimensions";
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
    id v62 = (id)[v59 startObserving:v60 keyPaths:v61 includeInitialValue:0 observationHandler:&__block_literal_global_16_22092];

    v63 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self observationController];
    v64 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
    id v65 = (id)[v63 startObserving:v64 keyPath:@"bounds" includeInitialValue:0 observationHandler:&__block_literal_global_21_22094];

    v66 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self observationController];
    [v66 startObservingNotificationForName:@"VideoQueue_CAContextIDDidChange" object:0 notificationCenter:0 observationHandler:&__block_literal_global_27_22096];
  }
}

uint64_t __68__AVPictureInPictureSampleBufferDisplayLayerView_setPIPModeEnabled___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _updateSourceLayerHost];
}

void __68__AVPictureInPictureSampleBufferDisplayLayerView_setPIPModeEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v21 = a2;
  v2 = [v21 sourceLayer];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [v21 placeholderLayer];
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);

  id v12 = [v21 sourceLayer];
  [v12 bounds];
  UIRectGetCenter();
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v21 placeholderLayer];
  objc_msgSend(v17, "setPosition:", v14, v16);

  uint64_t v18 = [v21 sourceLayer];
  [v18 bounds];
  objc_msgSend(v21, "setImageQueueSize:", v19, v20);

  [v21 _updateGeometry];
}

uint64_t __68__AVPictureInPictureSampleBufferDisplayLayerView_setPIPModeEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateGeometry];
}

- (void)_updateSourceLayerHost
{
  double v3 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayer];
  objc_msgSend(v3, "avkit_sbdlpip_findFirstCALayerHost");
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  int v4 = [v17 contextId];
  id v5 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];
  if (v5 != v17)
  {

LABEL_3:
    double v6 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];

    if (v6)
    {
      double v7 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self observationController];
      double v8 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];
      [v7 stopObserving:v8];
    }
    [(AVPictureInPictureSampleBufferDisplayLayerView *)self setSourceLayerHost:v17];
    double v9 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];
    -[AVPictureInPictureSampleBufferDisplayLayerView setSourceContextId:](self, "setSourceContextId:", [v9 contextId]);

    double v10 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self observationController];
    uint64_t v11 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceLayerHost];
    id v12 = (id)[v10 startObserving:v11 keyPath:@"beginTime" includeInitialValue:1 observationHandler:&__block_literal_global_22109];

    uint64_t v13 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceContextId];
    double v14 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sbdlHostView];
    [v14 setContextId:v13];

    [v17 setContextId:0];
    goto LABEL_6;
  }
  if (!v4)
  {

    goto LABEL_6;
  }
  unsigned int v15 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self sourceContextId];
  int v16 = [v17 contextId];

  if (v15 != v16) {
    goto LABEL_3;
  }
LABEL_6:
}

void __72__AVPictureInPictureSampleBufferDisplayLayerView__updateSourceLayerHost__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  [a3 beginTime];
  double v6 = v5;
  id v7 = [v4 sbdlHostView];

  [v7 setBeginTime:v6];
}

- (void)dealloc
{
  double v3 = [(AVPictureInPictureSampleBufferDisplayLayerView *)self observationController];
  [v3 stopAllObservation];

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerView;
  [(AVPictureInPictureSampleBufferDisplayLayerView *)&v4 dealloc];
}

- (AVPictureInPictureSampleBufferDisplayLayerView)initWithSourceLayer:(id)a3 playerController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVPictureInPictureSampleBufferDisplayLayerView;
  double v9 = -[AVPictureInPictureSampleBufferDisplayLayerView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceLayer, a3);
    objc_storeStrong((id *)&v10->_playerController, a4);
  }

  return v10;
}

@end
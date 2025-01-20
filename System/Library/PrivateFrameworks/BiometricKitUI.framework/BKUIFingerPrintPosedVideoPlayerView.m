@interface BKUIFingerPrintPosedVideoPlayerView
+ (Class)layerClass;
- (AVPlayerLayer)playerLayer;
- (AVQueuePlayer)videoPlayer;
- (BKUIFingerPrintPosedVideoPlayerView)initWithAssetName:(id)a3 subdirectory:(id)a4;
- (NSDictionary)assetnameForAssetLengthDict;
- (NSString)assetName;
- (NSString)subDirectory;
- (UIImage)horizontalPosedImage;
- (UIImage)verticalPosedImage;
- (UIImageView)portraitImageView;
- (id)_devicePrefix;
- (id)_filters;
- (void)_setFilters:(id)a3;
- (void)_updateImageForOrientation:(int64_t)a3;
- (void)hideVideoPlayer;
- (void)itemDidFinishPlaying:(id)a3;
- (void)layoutSubviews;
- (void)load;
- (void)setAssetName:(id)a3;
- (void)setAssetnameForAssetLengthDict:(id)a3;
- (void)setHorizontalPosedImage:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setPortraitImageView:(id)a3;
- (void)setSubDirectory:(id)a3;
- (void)setVerticalPosedImage:(id)a3;
- (void)setVideoPlayer:(id)a3;
- (void)showVideoPlayer;
- (void)transitionToOrientation:(int64_t)a3;
@end

@implementation BKUIFingerPrintPosedVideoPlayerView

- (BKUIFingerPrintPosedVideoPlayerView)initWithAssetName:(id)a3 subdirectory:(id)a4
{
  v51[4] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)BKUIFingerPrintPosedVideoPlayerView;
  double v9 = *MEMORY[0x1E4F1DB28];
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v13 = -[BKUIFingerPrintPosedVideoPlayerView initWithFrame:](&v50, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v10, v11, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_assetName, a3);
    objc_storeStrong((id *)&v14->_subDirectory, a4);
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v9, v10, v11, v12);
    id v49 = v7;
    portraitImageView = v14->_portraitImageView;
    v14->_portraitImageView = (UIImageView *)v15;

    [(UIImageView *)v14->_portraitImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v14->_portraitImageView setAlpha:0.0];
    [(BKUIFingerPrintPosedVideoPlayerView *)v14 addSubview:v14->_portraitImageView];
    v43 = (void *)MEMORY[0x1E4F28DC8];
    v47 = [(UIImageView *)v14->_portraitImageView leadingAnchor];
    v46 = [(BKUIFingerPrintPosedVideoPlayerView *)v14 leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v51[0] = v45;
    v44 = [(UIImageView *)v14->_portraitImageView trailingAnchor];
    v17 = [(BKUIFingerPrintPosedVideoPlayerView *)v14 trailingAnchor];
    v18 = [v44 constraintEqualToAnchor:v17];
    v51[1] = v18;
    v19 = [(UIImageView *)v14->_portraitImageView topAnchor];
    v20 = [(BKUIFingerPrintPosedVideoPlayerView *)v14 topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v51[2] = v21;
    v22 = [(UIImageView *)v14->_portraitImageView bottomAnchor];
    [(BKUIFingerPrintPosedVideoPlayerView *)v14 bottomAnchor];
    v23 = id v48 = v8;
    v24 = [v22 constraintEqualToAnchor:v23];
    v51[3] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
    [v43 activateConstraints:v25];

    v26 = (void *)MEMORY[0x1E4F42A80];
    v27 = [(BKUIFingerPrintPosedVideoPlayerView *)v14 _devicePrefix];
    v28 = [v27 stringByAppendingString:@"_H"];
    v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v30 = [v26 imageNamed:v28 inBundle:v29 withConfiguration:0];
    horizontalPosedImage = v14->_horizontalPosedImage;
    v14->_horizontalPosedImage = (UIImage *)v30;

    v32 = (void *)MEMORY[0x1E4F42A80];
    v33 = [(BKUIFingerPrintPosedVideoPlayerView *)v14 _devicePrefix];
    v34 = [v33 stringByAppendingString:@"_V"];
    v35 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v36 = [v32 imageNamed:v34 inBundle:v35 withConfiguration:0];
    verticalPosedImage = v14->_verticalPosedImage;
    v14->_verticalPosedImage = (UIImage *)v36;

    id v8 = v48;
    id v7 = v49;

    uint64_t v38 = [MEMORY[0x1E4F16650] playerLayerWithPlayer:0];
    playerLayer = v14->_playerLayer;
    v14->_playerLayer = (AVPlayerLayer *)v38;

    v40 = [(BKUIFingerPrintPosedVideoPlayerView *)v14 layer];
    [v40 addSublayer:v14->_playerLayer];

    assetnameForAssetLengthDict = v14->_assetnameForAssetLengthDict;
    v14->_assetnameForAssetLengthDict = (NSDictionary *)&unk_1F40949E8;
  }
  return v14;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)_setFilters:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIFingerPrintPosedVideoPlayerView *)self layer];
  [v5 setFilters:v4];
}

- (void)load
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 assetName];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_fault_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_FAULT, "Defaulting to no tutorial video; unable to find one for %@",
    (uint8_t *)&v4,
    0xCu);
}

- (void)itemDidFinishPlaying:(id)a3
{
  int v4 = [(BKUIFingerPrintPosedVideoPlayerView *)self videoPlayer];
  [v4 setActionAtItemEnd:1];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)BKUIFingerPrintPosedVideoPlayerView;
  [(BKUIFingerPrintPosedVideoPlayerView *)&v14 layoutSubviews];
  [(BKUIFingerPrintPosedVideoPlayerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(BKUIFingerPrintPosedVideoPlayerView *)self playerLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  uint64_t v12 = *MEMORY[0x1E4F15AF8];
  v13 = [(BKUIFingerPrintPosedVideoPlayerView *)self playerLayer];
  [v13 setVideoGravity:v12];
}

- (id)_filters
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BKUIFingerPrintPosedVideoPlayerView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    float v4 = 0.9;
  }
  else {
    float v4 = 1.0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F39BC0]);
  double v6 = (void *)[v5 initWithType:*MEMORY[0x1E4F3A038]];
  float v10 = v4;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 4);
  int v12 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 20);
  float v13 = v4;
  long long v14 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 28);
  int v15 = *(_DWORD *)(MEMORY[0x1E4F39AD8] + 44);
  float v16 = v4;
  *(_OWORD *)v17 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 52);
  *(_OWORD *)&v17[12] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
  double v7 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v10];
  [v6 setValue:v7 forKey:@"inputColorMatrix"];

  v18[0] = v6;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];

  return v8;
}

- (void)showVideoPlayer
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__BKUIFingerPrintPosedVideoPlayerView_showVideoPlayer__block_invoke;
  v2[3] = &unk_1E6EA20C0;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:0.15];
}

void __54__BKUIFingerPrintPosedVideoPlayerView_showVideoPlayer__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) portraitImageView];
  [v2 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) playerLayer];
  LODWORD(v3) = 1.0;
  [v4 setOpacity:v3];
}

- (void)hideVideoPlayer
{
  double v3 = [(BKUIFingerPrintPosedVideoPlayerView *)self portraitImageView];
  [v3 setAlpha:0.0];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__BKUIFingerPrintPosedVideoPlayerView_hideVideoPlayer__block_invoke;
  v4[3] = &unk_1E6EA20C0;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.15];
}

void __54__BKUIFingerPrintPosedVideoPlayerView_hideVideoPlayer__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) portraitImageView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) playerLayer];
  [v3 setOpacity:0.0];
}

- (void)_updateImageForOrientation:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) > 1) {
    [(BKUIFingerPrintPosedVideoPlayerView *)self verticalPosedImage];
  }
  else {
  id v5 = [(BKUIFingerPrintPosedVideoPlayerView *)self horizontalPosedImage];
  }
  id v4 = [(BKUIFingerPrintPosedVideoPlayerView *)self portraitImageView];
  [v4 setImage:v5];
}

- (void)transitionToOrientation:(int64_t)a3
{
  id v5 = [(BKUIFingerPrintPosedVideoPlayerView *)self assetName];
  double v6 = [(BKUIFingerPrintPosedVideoPlayerView *)self _devicePrefix];
  double v7 = [v6 stringByAppendingString:@"_H"];
  if ([v5 isEqualToString:v7])
  {

LABEL_4:
    unint64_t v12 = a3 - 1;
    goto LABEL_6;
  }
  double v8 = [(BKUIFingerPrintPosedVideoPlayerView *)self assetName];
  double v9 = [(BKUIFingerPrintPosedVideoPlayerView *)self _devicePrefix];
  float v10 = [v9 stringByAppendingString:@"_V_rotate"];
  int v11 = [v8 isEqualToString:v10];

  if (v11) {
    goto LABEL_4;
  }
  unint64_t v12 = a3 - 3;
LABEL_6:
  if (v12 > 1)
  {
    [(BKUIFingerPrintPosedVideoPlayerView *)self showVideoPlayer];
  }
  else
  {
    [(BKUIFingerPrintPosedVideoPlayerView *)self _updateImageForOrientation:a3];
    [(BKUIFingerPrintPosedVideoPlayerView *)self hideVideoPlayer];
  }
}

- (id)_devicePrefix
{
  v2 = @"iPadMini2021";
  uint64_t v3 = MGGetProductType();
  if (v3 > 2903084587)
  {
    if (v3 == 2903084588 || v3 == 2959111092) {
      return v2;
    }
    if (v3 != 4242862982) {
      return @"J307";
    }
    return @"iPadEDU2022";
  }
  if (v3 == 1878257790) {
    return @"iPadEDU2022";
  }
  if (v3 != 1895344378 && v3 != 2566016329) {
    return @"J307";
  }
  return v2;
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
}

- (NSString)subDirectory
{
  return self->_subDirectory;
}

- (void)setSubDirectory:(id)a3
{
}

- (AVQueuePlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (void)setVideoPlayer:(id)a3
{
}

- (UIImageView)portraitImageView
{
  return self->_portraitImageView;
}

- (void)setPortraitImageView:(id)a3
{
}

- (UIImage)horizontalPosedImage
{
  return self->_horizontalPosedImage;
}

- (void)setHorizontalPosedImage:(id)a3
{
}

- (UIImage)verticalPosedImage
{
  return self->_verticalPosedImage;
}

- (void)setVerticalPosedImage:(id)a3
{
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
}

- (NSDictionary)assetnameForAssetLengthDict
{
  return self->_assetnameForAssetLengthDict;
}

- (void)setAssetnameForAssetLengthDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetnameForAssetLengthDict, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_verticalPosedImage, 0);
  objc_storeStrong((id *)&self->_horizontalPosedImage, 0);
  objc_storeStrong((id *)&self->_portraitImageView, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_subDirectory, 0);

  objc_storeStrong((id *)&self->_assetName, 0);
}

@end
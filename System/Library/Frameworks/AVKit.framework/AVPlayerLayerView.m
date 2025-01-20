@interface AVPlayerLayerView
@end

@implementation AVPlayerLayerView

void __73____AVPlayerLayerView_startRoutingVideoToPictureInPicturePlayerLayerView__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4FB08E0] systemFontOfSize:140.0 weight:*MEMORY[0x1E4FB09E8]];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73____AVPlayerLayerView_startRoutingVideoToPictureInPicturePlayerLayerView__block_invoke_2;
  v3[3] = &unk_1E5FC2050;
  v3[4] = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4FB1818], "avkit_imageWithSymbolNamed:font:completion:", @"pip", v2, v3);
}

void __73____AVPlayerLayerView_startRoutingVideoToPictureInPicturePlayerLayerView__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4FB1618];
  id v4 = a2;
  v5 = objc_msgSend(v3, "AV_indicatorForegroundColor");
  v6 = [v4 _flatImageWithColor:v5];

  v7 = [*(id *)(a1 + 32) playerLayer];
  v8 = [AVPictureInPictureIndicatorLayer alloc];
  v9 = [*(id *)(a1 + 32) traitCollection];
  [v9 displayScale];
  double v11 = v10;
  id v18 = v6;
  uint64_t v12 = [v18 CGImage];
  [*(id *)(a1 + 32) videoBounds];
  v17 = -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](v8, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", v12, 0, v11, v13, v14, v15, v16);
  [v7 setPlaceholderContentLayerDuringPIPMode:v17];
}

@end
@interface AVTStickerRecentsOverlayViewLayout
+ (id)buttonsLandscapeLayout;
+ (id)buttonsPortraitLayout;
+ (id)standardLandscapeLayout;
+ (id)standardPortraitLayout;
- (AVTStickerRecentsOverlayViewLayout)initWithImageToTopPadding:(double)a3 imageToTitlePadding:(double)a4 titleToSubtitlePadding:(double)a5 subtitleToButtonPadding:(double)a6 imageHeight:(double)a7 horizontalEdgePadding:(double)a8;
- (double)horizontalEdgePadding;
- (double)imageHeight;
- (double)imageToTitlePadding;
- (double)imageToTopPadding;
- (double)subtitleToButtonPadding;
- (double)titleToSubtitlePadding;
@end

@implementation AVTStickerRecentsOverlayViewLayout

+ (id)standardPortraitLayout
{
  v2 = (void *)[objc_alloc((Class)a1) initWithImageToTopPadding:24.0 imageToTitlePadding:12.0 titleToSubtitlePadding:4.0 subtitleToButtonPadding:0.0 imageHeight:40.0 horizontalEdgePadding:16.0];
  return v2;
}

+ (id)standardLandscapeLayout
{
  v2 = (void *)[objc_alloc((Class)a1) initWithImageToTopPadding:12.0 imageToTitlePadding:4.0 titleToSubtitlePadding:2.0 subtitleToButtonPadding:0.0 imageHeight:38.0 horizontalEdgePadding:16.0];
  return v2;
}

+ (id)buttonsPortraitLayout
{
  v2 = (void *)[objc_alloc((Class)a1) initWithImageToTopPadding:4.0 imageToTitlePadding:12.0 titleToSubtitlePadding:4.0 subtitleToButtonPadding:16.0 imageHeight:40.0 horizontalEdgePadding:16.0];
  return v2;
}

+ (id)buttonsLandscapeLayout
{
  v2 = (void *)[objc_alloc((Class)a1) initWithImageToTopPadding:0.0 imageToTitlePadding:4.0 titleToSubtitlePadding:2.0 subtitleToButtonPadding:0.0 imageHeight:38.0 horizontalEdgePadding:16.0];
  return v2;
}

- (AVTStickerRecentsOverlayViewLayout)initWithImageToTopPadding:(double)a3 imageToTitlePadding:(double)a4 titleToSubtitlePadding:(double)a5 subtitleToButtonPadding:(double)a6 imageHeight:(double)a7 horizontalEdgePadding:(double)a8
{
  v18.receiver = self;
  v18.super_class = (Class)AVTStickerRecentsOverlayViewLayout;
  v14 = [(AVTStickerRecentsOverlayViewLayout *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_imageToTopPadding = a3;
    v14->_imageToTitlePadding = a4;
    v14->_titleToSubtitlePadding = a5;
    v14->_subtitleToButtonPadding = a6;
    v14->_imageHeight = a7;
    v14->_horizontalEdgePadding = a8;
    v16 = v14;
  }

  return v15;
}

- (double)imageToTopPadding
{
  return self->_imageToTopPadding;
}

- (double)imageToTitlePadding
{
  return self->_imageToTitlePadding;
}

- (double)titleToSubtitlePadding
{
  return self->_titleToSubtitlePadding;
}

- (double)subtitleToButtonPadding
{
  return self->_subtitleToButtonPadding;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (double)horizontalEdgePadding
{
  return self->_horizontalEdgePadding;
}

@end
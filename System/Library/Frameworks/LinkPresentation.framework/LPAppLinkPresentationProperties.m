@interface LPAppLinkPresentationProperties
- (LPCaptionBarPresentationProperties)captionBar;
- (LPCaptionBarPresentationProperties)mediaBottomCaptionBar;
- (LPCaptionBarPresentationProperties)mediaTopCaptionBar;
- (LPImage)icon;
- (LPImage)image;
- (LPVideo)video;
- (NSString)bottomCaption;
- (NSString)mediaBottomCaption;
- (NSString)mediaTopCaption;
- (NSString)topCaption;
- (NSString)trailingBottomCaption;
- (NSString)trailingTopCaption;
- (UIColor)backgroundColor;
- (int64_t)style;
- (void)setBackgroundColor:(id)a3;
- (void)setBottomCaption:(id)a3;
- (void)setCaptionBar:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
- (void)setMediaBottomCaption:(id)a3;
- (void)setMediaBottomCaptionBar:(id)a3;
- (void)setMediaTopCaption:(id)a3;
- (void)setMediaTopCaptionBar:(id)a3;
- (void)setTopCaption:(id)a3;
- (void)setTrailingBottomCaption:(id)a3;
- (void)setTrailingTopCaption:(id)a3;
- (void)setVideo:(id)a3;
@end

@implementation LPAppLinkPresentationProperties

- (int64_t)style
{
  return 26;
}

- (LPCaptionBarPresentationProperties)captionBar
{
  return self->_captionBar;
}

- (void)setCaptionBar:(id)a3
{
}

- (LPCaptionBarPresentationProperties)mediaTopCaptionBar
{
  return self->_mediaTopCaptionBar;
}

- (void)setMediaTopCaptionBar:(id)a3
{
}

- (LPCaptionBarPresentationProperties)mediaBottomCaptionBar
{
  return self->_mediaBottomCaptionBar;
}

- (void)setMediaBottomCaptionBar:(id)a3
{
}

- (NSString)topCaption
{
  return self->_topCaption;
}

- (void)setTopCaption:(id)a3
{
}

- (NSString)bottomCaption
{
  return self->_bottomCaption;
}

- (void)setBottomCaption:(id)a3
{
}

- (NSString)trailingTopCaption
{
  return self->_trailingTopCaption;
}

- (void)setTrailingTopCaption:(id)a3
{
}

- (NSString)trailingBottomCaption
{
  return self->_trailingBottomCaption;
}

- (void)setTrailingBottomCaption:(id)a3
{
}

- (NSString)mediaTopCaption
{
  return self->_mediaTopCaption;
}

- (void)setMediaTopCaption:(id)a3
{
}

- (NSString)mediaBottomCaption
{
  return self->_mediaBottomCaption;
}

- (void)setMediaBottomCaption:(id)a3
{
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (LPImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (LPVideo)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaption, 0);
  objc_storeStrong((id *)&self->_mediaTopCaption, 0);
  objc_storeStrong((id *)&self->_trailingBottomCaption, 0);
  objc_storeStrong((id *)&self->_trailingTopCaption, 0);
  objc_storeStrong((id *)&self->_bottomCaption, 0);
  objc_storeStrong((id *)&self->_topCaption, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);

  objc_storeStrong((id *)&self->_captionBar, 0);
}

@end
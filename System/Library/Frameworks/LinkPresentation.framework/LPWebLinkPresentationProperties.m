@interface LPWebLinkPresentationProperties
- (BOOL)isPreliminary;
- (LPARAsset)arAsset;
- (LPAudio)audio;
- (LPCaptionBarPresentationProperties)captionBar;
- (LPCaptionBarPresentationProperties)mediaBottomCaptionBar;
- (LPCaptionBarPresentationProperties)mediaTopCaptionBar;
- (LPImage)backgroundImage;
- (LPImage)image;
- (LPImagePresentationProperties)backgroundImageProperties;
- (LPImagePresentationProperties)imageProperties;
- (LPIndeterminateProgressSpinnerPresentationProperties)progressSpinner;
- (LPInlineMediaPlaybackInformation)inlinePlaybackInformation;
- (LPVideo)video;
- (NSArray)alternateImages;
- (NSNumber)minimumHeight;
- (NSNumber)overrideAllowOpeningSensitiveURLs;
- (NSString)domainNameForIndicator;
- (NSString)quotedText;
- (NSURL)overrideURL;
- (UIColor)backgroundColor;
- (UIColor)dominantImageBackgroundColor;
- (int64_t)style;
- (void)setAlternateImages:(id)a3;
- (void)setArAsset:(id)a3;
- (void)setAudio:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageProperties:(id)a3;
- (void)setCaptionBar:(id)a3;
- (void)setDomainNameForIndicator:(id)a3;
- (void)setDominantImageBackgroundColor:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageProperties:(id)a3;
- (void)setInlinePlaybackInformation:(id)a3;
- (void)setMediaBottomCaptionBar:(id)a3;
- (void)setMediaTopCaptionBar:(id)a3;
- (void)setMinimumHeight:(id)a3;
- (void)setOverrideAllowOpeningSensitiveURLs:(id)a3;
- (void)setOverrideURL:(id)a3;
- (void)setPreliminary:(BOOL)a3;
- (void)setProgressSpinner:(id)a3;
- (void)setQuotedText:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setVideo:(id)a3;
@end

@implementation LPWebLinkPresentationProperties

- (BOOL)isPreliminary
{
  return self->_preliminary;
}

- (void)setPreliminary:(BOOL)a3
{
  self->_preliminary = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
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

- (NSString)quotedText
{
  return self->_quotedText;
}

- (void)setQuotedText:(id)a3
{
}

- (LPImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (LPImagePresentationProperties)imageProperties
{
  return self->_imageProperties;
}

- (void)setImageProperties:(id)a3
{
}

- (NSArray)alternateImages
{
  return self->_alternateImages;
}

- (void)setAlternateImages:(id)a3
{
}

- (LPVideo)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
}

- (LPAudio)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
}

- (LPARAsset)arAsset
{
  return self->_arAsset;
}

- (void)setArAsset:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (UIColor)dominantImageBackgroundColor
{
  return self->_dominantImageBackgroundColor;
}

- (void)setDominantImageBackgroundColor:(id)a3
{
}

- (LPImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (LPImagePresentationProperties)backgroundImageProperties
{
  return self->_backgroundImageProperties;
}

- (void)setBackgroundImageProperties:(id)a3
{
}

- (NSNumber)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(id)a3
{
}

- (LPInlineMediaPlaybackInformation)inlinePlaybackInformation
{
  return self->_inlinePlaybackInformation;
}

- (void)setInlinePlaybackInformation:(id)a3
{
}

- (NSString)domainNameForIndicator
{
  return self->_domainNameForIndicator;
}

- (void)setDomainNameForIndicator:(id)a3
{
}

- (NSURL)overrideURL
{
  return self->_overrideURL;
}

- (void)setOverrideURL:(id)a3
{
}

- (NSNumber)overrideAllowOpeningSensitiveURLs
{
  return self->_overrideAllowOpeningSensitiveURLs;
}

- (void)setOverrideAllowOpeningSensitiveURLs:(id)a3
{
}

- (LPIndeterminateProgressSpinnerPresentationProperties)progressSpinner
{
  return self->_progressSpinner;
}

- (void)setProgressSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_overrideAllowOpeningSensitiveURLs, 0);
  objc_storeStrong((id *)&self->_overrideURL, 0);
  objc_storeStrong((id *)&self->_domainNameForIndicator, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackInformation, 0);
  objc_storeStrong((id *)&self->_minimumHeight, 0);
  objc_storeStrong((id *)&self->_backgroundImageProperties, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_dominantImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_arAsset, 0);
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_video, 0);
  objc_storeStrong((id *)&self->_alternateImages, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_quotedText, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);

  objc_storeStrong((id *)&self->_captionBar, 0);
}

@end
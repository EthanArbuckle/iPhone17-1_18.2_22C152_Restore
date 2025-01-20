@interface LPLinkViewComponents
- (LPBackgroundColorView)mediaBackground;
- (LPCaptionBarView)captionBar;
- (LPCaptionBarView)mediaBottomCaptionBar;
- (LPCaptionBarView)mediaTopCaptionBar;
- (LPComponentView)media;
- (LPComponentView)progressSpinner;
- (LPContactsBadgeView)contactsBadge;
- (LPDomainNameIndicator)domainNameIndicator;
- (LPImageView)backgroundImage;
- (LPQuoteView)quote;
- (void)applyToAllViews:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setCaptionBar:(id)a3;
- (void)setContactsBadge:(id)a3;
- (void)setDomainNameIndicator:(id)a3;
- (void)setMedia:(id)a3;
- (void)setMediaBackground:(id)a3;
- (void)setMediaBottomCaptionBar:(id)a3;
- (void)setMediaTopCaptionBar:(id)a3;
- (void)setProgressSpinner:(id)a3;
- (void)setQuote:(id)a3;
@end

@implementation LPLinkViewComponents

- (void)applyToAllViews:(id)a3
{
  v4 = (void (**)(id, LPCaptionBarView *))a3;
  v4[2](v4, self->_captionBar);
  v4[2](v4, (LPCaptionBarView *)self->_media);
  v4[2](v4, (LPCaptionBarView *)self->_mediaBackground);
  v4[2](v4, self->_mediaTopCaptionBar);
  v4[2](v4, self->_mediaBottomCaptionBar);
  v4[2](v4, (LPCaptionBarView *)self->_quote);
  v4[2](v4, (LPCaptionBarView *)self->_backgroundImage);
  v4[2](v4, (LPCaptionBarView *)self->_contactsBadge);
  v4[2](v4, (LPCaptionBarView *)self->_domainNameIndicator);
}

- (LPCaptionBarView)captionBar
{
  return self->_captionBar;
}

- (void)setCaptionBar:(id)a3
{
}

- (LPComponentView)media
{
  return self->_media;
}

- (void)setMedia:(id)a3
{
}

- (LPBackgroundColorView)mediaBackground
{
  return self->_mediaBackground;
}

- (void)setMediaBackground:(id)a3
{
}

- (LPCaptionBarView)mediaTopCaptionBar
{
  return self->_mediaTopCaptionBar;
}

- (void)setMediaTopCaptionBar:(id)a3
{
}

- (LPCaptionBarView)mediaBottomCaptionBar
{
  return self->_mediaBottomCaptionBar;
}

- (void)setMediaBottomCaptionBar:(id)a3
{
}

- (LPQuoteView)quote
{
  return self->_quote;
}

- (void)setQuote:(id)a3
{
}

- (LPImageView)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (LPComponentView)progressSpinner
{
  return self->_progressSpinner;
}

- (void)setProgressSpinner:(id)a3
{
}

- (LPDomainNameIndicator)domainNameIndicator
{
  return self->_domainNameIndicator;
}

- (void)setDomainNameIndicator:(id)a3
{
}

- (LPContactsBadgeView)contactsBadge
{
  return self->_contactsBadge;
}

- (void)setContactsBadge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactsBadge, 0);
  objc_storeStrong((id *)&self->_domainNameIndicator, 0);
  objc_storeStrong((id *)&self->_progressSpinner, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_quote, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaBackground, 0);
  objc_storeStrong((id *)&self->_media, 0);

  objc_storeStrong((id *)&self->_captionBar, 0);
}

@end
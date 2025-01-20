@interface APUIActionCardViewConfig
- (APUIActionCardViewConfig)init;
- (BOOL)fallbackToCustomResponseString;
- (BOOL)showActionButton;
- (BOOL)showAppFootnote;
- (BOOL)showAppFootnoteIcon;
- (BOOL)showThumbnailImage;
- (BOOL)useAppIconAsThumbnail;
- (BOOL)useTinyIconVariant;
- (NSString)bundleId;
- (int64_t)maxLinesForFootnote;
- (int64_t)maxLinesForSubtitle;
- (int64_t)maxLinesForTitle;
- (unint64_t)style;
- (void)setBundleId:(id)a3;
- (void)setFallbackToCustomResponseString:(BOOL)a3;
- (void)setMaxLinesForFootnote:(int64_t)a3;
- (void)setMaxLinesForSubtitle:(int64_t)a3;
- (void)setMaxLinesForTitle:(int64_t)a3;
- (void)setShowActionButton:(BOOL)a3;
- (void)setShowAppFootnote:(BOOL)a3;
- (void)setShowAppFootnoteIcon:(BOOL)a3;
- (void)setShowThumbnailImage:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setUseAppIconAsThumbnail:(BOOL)a3;
- (void)setUseTinyIconVariant:(BOOL)a3;
@end

@implementation APUIActionCardViewConfig

- (APUIActionCardViewConfig)init
{
  v5.receiver = self;
  v5.super_class = (Class)APUIActionCardViewConfig;
  v2 = [(APUIActionCardViewConfig *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(APUIActionCardViewConfig *)v2 setMaxLinesForTitle:2];
    [(APUIActionCardViewConfig *)v3 setMaxLinesForSubtitle:2];
    [(APUIActionCardViewConfig *)v3 setMaxLinesForFootnote:1];
  }
  return v3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (BOOL)showThumbnailImage
{
  return self->_showThumbnailImage;
}

- (void)setShowThumbnailImage:(BOOL)a3
{
  self->_showThumbnailImage = a3;
}

- (BOOL)useAppIconAsThumbnail
{
  return self->_useAppIconAsThumbnail;
}

- (void)setUseAppIconAsThumbnail:(BOOL)a3
{
  self->_useAppIconAsThumbnail = a3;
}

- (BOOL)showActionButton
{
  return self->_showActionButton;
}

- (void)setShowActionButton:(BOOL)a3
{
  self->_showActionButton = a3;
}

- (BOOL)showAppFootnote
{
  return self->_showAppFootnote;
}

- (void)setShowAppFootnote:(BOOL)a3
{
  self->_showAppFootnote = a3;
}

- (BOOL)showAppFootnoteIcon
{
  return self->_showAppFootnoteIcon;
}

- (void)setShowAppFootnoteIcon:(BOOL)a3
{
  self->_showAppFootnoteIcon = a3;
}

- (BOOL)useTinyIconVariant
{
  return self->_useTinyIconVariant;
}

- (void)setUseTinyIconVariant:(BOOL)a3
{
  self->_useTinyIconVariant = a3;
}

- (int64_t)maxLinesForTitle
{
  return self->_maxLinesForTitle;
}

- (void)setMaxLinesForTitle:(int64_t)a3
{
  self->_maxLinesForTitle = a3;
}

- (int64_t)maxLinesForSubtitle
{
  return self->_maxLinesForSubtitle;
}

- (void)setMaxLinesForSubtitle:(int64_t)a3
{
  self->_maxLinesForSubtitle = a3;
}

- (int64_t)maxLinesForFootnote
{
  return self->_maxLinesForFootnote;
}

- (void)setMaxLinesForFootnote:(int64_t)a3
{
  self->_maxLinesForFootnote = a3;
}

- (BOOL)fallbackToCustomResponseString
{
  return self->_fallbackToCustomResponseString;
}

- (void)setFallbackToCustomResponseString:(BOOL)a3
{
  self->_fallbackToCustomResponseString = a3;
}

- (void).cxx_destruct
{
}

@end
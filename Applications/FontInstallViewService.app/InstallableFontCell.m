@interface InstallableFontCell
- (NSMutableDictionary)font;
- (UIImageView)providerIcon;
- (UILabel)fontName;
- (UILabel)providerCount;
- (UILabel)providerName;
- (void)setFont:(id)a3;
- (void)setFontName:(id)a3;
- (void)setProviderCount:(id)a3;
- (void)setProviderIcon:(id)a3;
- (void)setProviderName:(id)a3;
@end

@implementation InstallableFontCell

- (UILabel)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
}

- (UILabel)providerName
{
  return self->_providerName;
}

- (void)setProviderName:(id)a3
{
}

- (UIImageView)providerIcon
{
  return self->_providerIcon;
}

- (void)setProviderIcon:(id)a3
{
}

- (NSMutableDictionary)font
{
  return self->font;
}

- (void)setFont:(id)a3
{
}

- (UILabel)providerCount
{
  return self->_providerCount;
}

- (void)setProviderCount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface AVTSplashScreenConfiguration
- (AVPlayerItem)primaryPlayerItem;
- (AVPlayerItem)secondaryPlayerItem;
- (NSString)buttonString;
- (NSString)subTitleString;
- (NSString)titleString;
- (void)setButtonString:(id)a3;
- (void)setPrimaryPlayerItem:(id)a3;
- (void)setSecondaryPlayerItem:(id)a3;
- (void)setSubTitleString:(id)a3;
- (void)setTitleString:(id)a3;
@end

@implementation AVTSplashScreenConfiguration

- (AVPlayerItem)primaryPlayerItem
{
  return self->_primaryPlayerItem;
}

- (void)setPrimaryPlayerItem:(id)a3
{
}

- (AVPlayerItem)secondaryPlayerItem
{
  return self->_secondaryPlayerItem;
}

- (void)setSecondaryPlayerItem:(id)a3
{
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (NSString)subTitleString
{
  return self->_subTitleString;
}

- (void)setSubTitleString:(id)a3
{
}

- (NSString)buttonString
{
  return self->_buttonString;
}

- (void)setButtonString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonString, 0);
  objc_storeStrong((id *)&self->_subTitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_secondaryPlayerItem, 0);
  objc_storeStrong((id *)&self->_primaryPlayerItem, 0);
}

@end
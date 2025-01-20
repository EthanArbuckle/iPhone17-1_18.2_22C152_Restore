@interface _APUIActionCardInfo
- (NSString)appTitle;
- (NSString)bundleId;
- (NSString)footnote;
- (NSString)subtitle;
- (NSString)title;
- (SFActionItem)actionItem;
- (SFImage)image;
- (SFPunchout)actionPunchout;
- (void)setActionItem:(id)a3;
- (void)setActionPunchout:(id)a3;
- (void)setAppTitle:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation _APUIActionCardInfo

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)appTitle
{
  return self->_appTitle;
}

- (void)setAppTitle:(id)a3
{
}

- (SFImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (SFActionItem)actionItem
{
  return self->_actionItem;
}

- (void)setActionItem:(id)a3
{
}

- (SFPunchout)actionPunchout
{
  return self->_actionPunchout;
}

- (void)setActionPunchout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionPunchout, 0);
  objc_storeStrong((id *)&self->_actionItem, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_appTitle, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
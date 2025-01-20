@interface LPCollaborationFooterPresentationProperties
- (NSPersonNameComponents)initiatorNameComponents;
- (NSString)initiatorName;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)glyphAttachmentImage;
- (id)action;
- (void)setAction:(id)a3;
- (void)setGlyphAttachmentImage:(id)a3;
- (void)setInitiatorName:(id)a3;
- (void)setInitiatorNameComponents:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation LPCollaborationFooterPresentationProperties

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

- (NSString)initiatorName
{
  return self->_initiatorName;
}

- (void)setInitiatorName:(id)a3
{
}

- (NSPersonNameComponents)initiatorNameComponents
{
  return self->_initiatorNameComponents;
}

- (void)setInitiatorNameComponents:(id)a3
{
}

- (UIImage)glyphAttachmentImage
{
  return self->_glyphAttachmentImage;
}

- (void)setGlyphAttachmentImage:(id)a3
{
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_glyphAttachmentImage, 0);
  objc_storeStrong((id *)&self->_initiatorNameComponents, 0);
  objc_storeStrong((id *)&self->_initiatorName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end
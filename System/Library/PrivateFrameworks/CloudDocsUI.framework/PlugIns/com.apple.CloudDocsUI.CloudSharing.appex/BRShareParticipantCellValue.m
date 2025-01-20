@interface BRShareParticipantCellValue
- (BOOL)grayedOut;
- (BOOL)isOrgAdmin;
- (CNContact)contact;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)participantColor;
- (void)setContact:(id)a3;
- (void)setGrayedOut:(BOOL)a3;
- (void)setIsOrgAdmin:(BOOL)a3;
- (void)setParticipantColor:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BRShareParticipantCellValue

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

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

- (BOOL)grayedOut
{
  return self->_grayedOut;
}

- (void)setGrayedOut:(BOOL)a3
{
  self->_grayedOut = a3;
}

- (BOOL)isOrgAdmin
{
  return self->_isOrgAdmin;
}

- (void)setIsOrgAdmin:(BOOL)a3
{
  self->_isOrgAdmin = a3;
}

- (UIColor)participantColor
{
  return self->_participantColor;
}

- (void)setParticipantColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantColor, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end
@interface AAUIOBTrustedContactInviteMessageModel
- (AAUIOBTrustedContactInviteMessageModel)initWithModel:(id)a3;
- (NSString)description;
- (UIImage)image;
- (UIView)contentView;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (void)setContentView:(id)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
@end

@implementation AAUIOBTrustedContactInviteMessageModel

- (AAUIOBTrustedContactInviteMessageModel)initWithModel:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F258F8];
  v6 = [v4 recipientHandle];
  v7 = [v5 contactInfoForHandle:v6];

  v8 = [MEMORY[0x263F258F8] firstNameForLocalContactInfo:v7];
  v21.receiver = self;
  v21.super_class = (Class)AAUIOBTrustedContactInviteMessageModel;
  v9 = [(AAUIOBTrustedContactInviteMessageModel *)&v21 init];
  if (v9)
  {
    v10 = NSString;
    v11 = [v4 detailText];
    v12 = objc_msgSend(v10, "stringWithFormat:", v11, v8);
    [(AAOBTrustedContactInviteMessageModel *)v9 setDetailText:v12];

    v13 = [v4 title];
    [(AAOBTrustedContactInviteMessageModel *)v9 setTitle:v13];

    v14 = [v4 primaryButton];
    [(AAOBTrustedContactInviteMessageModel *)v9 setPrimaryButton:v14];

    v15 = [v4 secondaryButton];
    [(AAOBTrustedContactInviteMessageModel *)v9 setSecondaryButton:v15];

    v16 = [v4 recipientHandle];
    [(AAOBTrustedContactInviteMessageModel *)v9 setRecipientHandle:v16];

    if ([v4 conformsToProtocol:&unk_26BD9AE58])
    {
      v17 = [v4 bubbleText];
    }
    else
    {
      v17 = 0;
    }
    v18 = [[AAUIMessageBubbleView alloc] initWithText:v17];
    contentView = v9->_contentView;
    v9->_contentView = &v18->super;

    v9->_contentViewLayout = 2;
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(AAOBTrustedContactInviteMessageModel *)self imageName];
  v5 = [(AAOBTrustedContactInviteMessageModel *)self title];
  v6 = [(AAOBTrustedContactInviteMessageModel *)self detailText];
  v7 = [(AAOBTrustedContactInviteMessageModel *)self primaryButton];
  v8 = [(AAOBTrustedContactInviteMessageModel *)self secondaryButton];
  v9 = [(AAOBTrustedContactInviteMessageModel *)self helpLinkURL];
  v10 = [(AAOBTrustedContactInviteMessageModel *)self helpLinkTitle];
  v11 = [(AAOBTrustedContactInviteMessageModel *)self ownerHandle];
  v12 = [(AAOBTrustedContactInviteMessageModel *)self recipientHandle];
  v13 = [v3 stringWithFormat:@"imageName: %@\title: %@\ndetailText: %@\nprimaryButton: %@\nsecondaryButton: %@\nhelpLinkTitle: %@\nhelpLinkURL: %@\nownerHandle: %@\nrecipientHandle: %@\n", v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
@interface AAUIInviteLinkMetadata
- (AAMessagesInviteContext)context;
- (AAUIInviteLinkMetadata)initWithContext:(id)a3;
- (LPImage)icon;
- (LPImage)image;
- (LPLinkMetadata)bubbleMetadata;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation AAUIInviteLinkMetadata

- (AAUIInviteLinkMetadata)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIInviteLinkMetadata;
  v6 = [(AAUIInviteLinkMetadata *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (LPLinkMetadata)bubbleMetadata
{
  id v3 = objc_alloc_init(MEMORY[0x263F103D8]);
  v4 = [(AAUIInviteLinkMetadata *)self context];
  id v5 = [v4 title];
  [v3 setTitle:v5];

  v6 = [(AAUIInviteLinkMetadata *)self image];
  [v3 setImage:v6];

  v7 = [(AAUIInviteLinkMetadata *)self context];
  v8 = [v7 action];
  [v3 setSummary:v8];

  objc_super v9 = [(AAUIInviteLinkMetadata *)self context];
  v10 = [v9 inviteURL];
  [v3 setOriginalURL:v10];

  v11 = [(AAUIInviteLinkMetadata *)self context];
  v12 = [v11 inviteURL];
  [v3 setURL:v12];

  id v13 = objc_alloc_init(MEMORY[0x263F10418]);
  v14 = [(AAUIInviteLinkMetadata *)self context];
  v15 = [v14 title];
  [v13 setTitle:v15];

  v16 = [(AAUIInviteLinkMetadata *)self context];
  v17 = [v16 subtitle];
  [v13 setSubtitle:v17];

  v18 = [(AAUIInviteLinkMetadata *)self context];
  v19 = [v18 action];
  [v13 setAction:v19];

  v20 = [v3 image];
  [v13 setImage:v20];

  v21 = [(AAUIInviteLinkMetadata *)self icon];
  [v13 setIcon:v21];

  v22 = [(AAUIInviteLinkMetadata *)self context];
  v23 = [v22 secondaryTitle];
  [v13 setKind:v23];

  [v3 setSpecialization:v13];
  return (LPLinkMetadata *)v3;
}

- (AAMessagesInviteContext)context
{
  return self->_context;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
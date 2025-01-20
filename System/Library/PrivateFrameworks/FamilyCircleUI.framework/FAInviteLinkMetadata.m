@interface FAInviteLinkMetadata
- (FAInviteContext)context;
- (LPImage)icon;
- (LPImage)image;
- (LPLinkMetadata)bubbleMetadata;
- (LPLinkMetadata)mailMetadata;
- (void)setContext:(id)a3;
- (void)setIcon:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation FAInviteLinkMetadata

- (LPLinkMetadata)mailMetadata
{
  id v3 = objc_alloc_init(MEMORY[0x263F103D8]);
  v4 = [(FAInviteContext *)self->_context inviteURL];
  [v3 setOriginalURL:v4];

  v5 = [(FAInviteContext *)self->_context inviteURL];
  [v3 setURL:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F10420]);
  v7 = [(FAInviteContext *)self->_context mailLinkTitle];
  if (v7)
  {
    [v6 setTitle:v7];
  }
  else
  {
    v8 = [(FAInviteContext *)self->_context title];
    [v6 setTitle:v8];
  }
  v9 = [(FAInviteLinkMetadata *)self icon];
  [v6 setIcon:v9];

  v10 = [(FAInviteContext *)self->_context mailLinkSubtitle];
  if (v10)
  {
    [v6 setApplication:v10];
  }
  else
  {
    v11 = [(FAInviteContext *)self->_context secondaryTitle];
    [v6 setApplication:v11];
  }
  [v3 setSpecialization:v6];

  return (LPLinkMetadata *)v3;
}

- (LPLinkMetadata)bubbleMetadata
{
  id v3 = objc_alloc_init(MEMORY[0x263F103D8]);
  v4 = [(FAInviteContext *)self->_context title];
  [v3 setTitle:v4];

  v5 = [(FAInviteLinkMetadata *)self image];
  [v3 setImage:v5];

  id v6 = [(FAInviteContext *)self->_context action];
  [v3 setSummary:v6];

  v7 = [(FAInviteContext *)self->_context inviteURL];
  [v3 setOriginalURL:v7];

  v8 = [(FAInviteContext *)self->_context inviteURL];
  [v3 setURL:v8];

  v9 = [(FAInviteContext *)self->_context eventType];
  if ([v9 isEqualToString:*MEMORY[0x263F3BE00]])
  {
  }
  else
  {
    v10 = [(FAInviteContext *)self->_context messageBubbleTitle];

    if (!v10) {
      goto LABEL_5;
    }
  }
  id v11 = objc_alloc_init(MEMORY[0x263F10418]);
  v12 = [(FAInviteContext *)self->_context title];
  [v11 setTitle:v12];

  v13 = [(FAInviteContext *)self->_context subtitle];
  [v11 setSubtitle:v13];

  v14 = [(FAInviteContext *)self->_context action];
  [v11 setAction:v14];

  v15 = [v3 image];
  [v11 setImage:v15];

  v16 = [(FAInviteLinkMetadata *)self icon];
  [v11 setIcon:v16];

  v17 = [(FAInviteContext *)self->_context secondaryTitle];
  [v11 setKind:v17];

  [v3 setSpecialization:v11];
LABEL_5:
  return (LPLinkMetadata *)v3;
}

- (FAInviteContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
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
@interface AAUIInviteLinkMetadataProvider
- (AAUIInviteLinkMetadataProvider)initWithContext:(id)a3;
- (id)_defaultBackgroundImage;
- (id)_lpImageWithImage:(id)a3;
- (void)loadMetadataWithImage:(id)a3 completion:(id)a4;
@end

@implementation AAUIInviteLinkMetadataProvider

- (AAUIInviteLinkMetadataProvider)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIInviteLinkMetadataProvider;
  v6 = [(AAUIInviteLinkMetadataProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (void)loadMetadataWithImage:(id)a3 completion:(id)a4
{
  id v9 = a3;
  v6 = (void (**)(id, AAUIInviteLinkMetadata *, void))a4;
  v7 = [[AAUIInviteLinkMetadata alloc] initWithContext:self->_context];
  if (v9) {
    [(AAUIInviteLinkMetadataProvider *)self _lpImageWithImage:v9];
  }
  else {
  v8 = [(AAUIInviteLinkMetadataProvider *)self _defaultBackgroundImage];
  }
  [(AAUIInviteLinkMetadata *)v7 setImage:v8];

  v6[2](v6, v7, 0);
}

- (id)_lpImageWithImage:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F103C0];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithPlatformImage:v4];

  return v5;
}

- (id)_defaultBackgroundImage
{
  v3 = (void *)MEMORY[0x263F827E8];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v3 imageNamed:@"message_invite_background" inBundle:v4];

  v6 = [(AAUIInviteLinkMetadataProvider *)self _lpImageWithImage:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end
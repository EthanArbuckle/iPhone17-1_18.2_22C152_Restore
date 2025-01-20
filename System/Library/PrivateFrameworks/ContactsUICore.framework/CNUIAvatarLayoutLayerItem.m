@interface CNUIAvatarLayoutLayerItem
- (CALayer)layer;
- (CNCancelable)avatarImageRendererToken;
- (CNUIAvatarLayoutLayerItem)initWithLayer:(id)a3;
- (NSString)identifier;
- (void)resetToken;
- (void)setAvatarImageRendererToken:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLayer:(id)a3;
@end

@implementation CNUIAvatarLayoutLayerItem

- (CNUIAvatarLayoutLayerItem)initWithLayer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUIAvatarLayoutLayerItem;
  v6 = [(CNUIAvatarLayoutLayerItem *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layer, a3);
    v8 = v7;
  }

  return v7;
}

- (void)resetToken
{
  v3 = [(CNUIAvatarLayoutLayerItem *)self avatarImageRendererToken];
  [v3 cancel];

  [(CNUIAvatarLayoutLayerItem *)self setAvatarImageRendererToken:0];
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
}

- (CNCancelable)avatarImageRendererToken
{
  return self->_avatarImageRendererToken;
}

- (void)setAvatarImageRendererToken:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_avatarImageRendererToken, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
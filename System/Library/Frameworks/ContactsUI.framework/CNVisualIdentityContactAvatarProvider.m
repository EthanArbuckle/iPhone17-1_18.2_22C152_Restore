@interface CNVisualIdentityContactAvatarProvider
+ (id)descriptorForRequiredKeys;
- (CNAvatarImageRenderer)avatarImageRenderer;
- (CNAvatarImageRenderingScope)renderingScope;
- (CNVisualIdentityContactAvatarProvider)init;
- (CNVisualIdentityContactAvatarProvider)initWithSettings:(id)a3;
- (id)avatarImageForContact:(id)a3 withSize:(CGSize)a4 includePlaceholder:(BOOL)a5 imageHandler:(id)a6;
- (id)imageForAvatarAccessoryView:(id)a3 withSize:(CGSize)a4;
- (void)setAvatarImageRenderer:(id)a3;
- (void)setRenderingScope:(id)a3;
@end

@implementation CNVisualIdentityContactAvatarProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScope, 0);

  objc_storeStrong((id *)&self->_avatarImageRenderer, 0);
}

- (void)setRenderingScope:(id)a3
{
}

- (CNAvatarImageRenderingScope)renderingScope
{
  return self->_renderingScope;
}

- (void)setAvatarImageRenderer:(id)a3
{
}

- (CNAvatarImageRenderer)avatarImageRenderer
{
  return self->_avatarImageRenderer;
}

- (id)imageForAvatarAccessoryView:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v7 = (void *)MEMORY[0x1E4FB1BA8];
  id v8 = a3;
  v9 = [v7 mainScreen];
  [v9 scale];
  v11 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:", 0, 0, 0, width, height, v10, 0.0);

  v12 = [(CNVisualIdentityContactAvatarProvider *)self avatarImageRenderer];
  v13 = [v12 imageForAvatarAccessoryView:v8 scope:v11];

  return v13;
}

- (id)avatarImageForContact:(id)a3 withSize:(CGSize)a4 includePlaceholder:(BOOL)a5 imageHandler:(id)a6
{
  BOOL v6 = a5;
  double height = a4.height;
  double width = a4.width;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  v12 = (void *)MEMORY[0x1E4FB1BA8];
  id v13 = a3;
  v14 = [v12 mainScreen];
  [v14 scale];
  double v16 = v15;

  v17 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:strokeWidth:strokeColor:rightToLeft:style:", 0, 0, 0, width, height, v16, 0.0);
  v18 = [(CNVisualIdentityContactAvatarProvider *)self avatarImageRenderer];
  v25[0] = v13;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__CNVisualIdentityContactAvatarProvider_avatarImageForContact_withSize_includePlaceholder_imageHandler___block_invoke;
  v23[3] = &unk_1E5499AB0;
  id v24 = v11;
  id v20 = v11;
  v21 = [v18 renderAvatarsForContacts:v19 scope:v17 includePlaceholder:v6 imageHandler:v23];

  return v21;
}

uint64_t __104__CNVisualIdentityContactAvatarProvider_avatarImageForContact_withSize_includePlaceholder_imageHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CNVisualIdentityContactAvatarProvider)initWithSettings:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CNVisualIdentityContactAvatarProvider;
  v5 = [(CNVisualIdentityContactAvatarProvider *)&v16 init];
  if (v5)
  {
    BOOL v6 = (CNAvatarImageRendererSettings *)v4;
    if (!v6)
    {
      v7 = +[CNUIContactsEnvironment currentEnvironment];
      id v8 = [CNAvatarImageRendererSettings alloc];
      v9 = [v7 cachingLikenessResolver];
      double v10 = [v7 cachingLikenessRenderer];
      id v11 = [v7 defaultSchedulerProvider];
      BOOL v6 = [(CNAvatarImageRendererSettings *)v8 initWithLikenessResolver:v9 likenessRenderer:v10 schedulerProvider:v11];
    }
    v12 = [[CNAvatarImageRenderer alloc] initWithSettings:v6];
    avatarImageRenderer = v5->_avatarImageRenderer;
    v5->_avatarImageRenderer = v12;

    v14 = v5;
  }

  return v5;
}

- (CNVisualIdentityContactAvatarProvider)init
{
  return [(CNVisualIdentityContactAvatarProvider *)self initWithSettings:0];
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1_43029 != -1) {
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1_43029, &__block_literal_global_43030);
  }
  v2 = (void *)descriptorForRequiredKeys_cn_once_object_1_43031;

  return v2;
}

void __66__CNVisualIdentityContactAvatarProvider_descriptorForRequiredKeys__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1B8F8];
  v1 = +[CNAvatarImageRenderer descriptorForRequiredKeys];
  v6[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v3 = [NSString stringWithUTF8String:"+[CNVisualIdentityContactAvatarProvider descriptorForRequiredKeys]_block_invoke"];
  uint64_t v4 = [v0 descriptorWithKeyDescriptors:v2 description:v3];
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_1_43031;
  descriptorForRequiredKeys_cn_once_object_1_43031 = v4;
}

@end
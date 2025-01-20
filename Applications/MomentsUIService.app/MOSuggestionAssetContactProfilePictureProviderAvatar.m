@interface MOSuggestionAssetContactProfilePictureProviderAvatar
- (MOSuggestionAssetContactProfilePictureProviderAvatar)init;
- (id)avatarForContact:(id)a3 size:(CGSize)a4;
- (void)avatarForContact:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)genericAvatarFor:(id)a3 pointSize:(CGSize)a4 completion:(id)a5;
@end

@implementation MOSuggestionAssetContactProfilePictureProviderAvatar

- (MOSuggestionAssetContactProfilePictureProviderAvatar)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOSuggestionAssetContactProfilePictureProviderAvatar;
  v2 = [(MOSuggestionAssetContactProfilePictureProviderAvatar *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    renderer = v2->_renderer;
    v2->_renderer = (CNAvatarImageRenderer *)v3;
  }
  return v2;
}

- (void)genericAvatarFor:(id)a3 pointSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = a5;
  v10 = +[NSCharacterSet whitespaceCharacterSet];
  v11 = [v8 componentsSeparatedByCharactersInSet:v10];

  id v12 = [v11 count];
  uint64_t v13 = 2;
  if ((unint64_t)v12 < 2) {
    uint64_t v13 = (uint64_t)v12;
  }
  if (v13)
  {
    unint64_t v14 = 0;
    v15 = &stru_100229C18;
    do
    {
      v16 = [v11 objectAtIndexedSubscript:v14];
      if ([v16 length])
      {
        v17 = [v16 substringWithRange:0, 1];
        uint64_t v18 = [(__CFString *)v15 stringByAppendingString:v17];

        v15 = (__CFString *)v18;
      }

      ++v14;
      id v19 = [v11 count];
      if ((unint64_t)v19 >= 2) {
        unint64_t v20 = 2;
      }
      else {
        unint64_t v20 = (unint64_t)v19;
      }
    }
    while (v14 < v20);
  }
  else
  {
    v15 = &stru_100229C18;
  }
  if ([(__CFString *)v15 length])
  {
    v21 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, width, height, 1.0);
    id v22 = objc_alloc_init((Class)CNAvatarImageRenderer);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __94__MOSuggestionAssetContactProfilePictureProviderAvatar_genericAvatarFor_pointSize_completion___block_invoke;
    v24[3] = &unk_10021FA58;
    id v25 = v9;
    id v23 = [v22 renderMonogramForString:v15 scope:v21 imageHandler:v24];
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __94__MOSuggestionAssetContactProfilePictureProviderAvatar_genericAvatarFor_pointSize_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)avatarForContact:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  id v10 = a3;
  v11 = +[UIApplication sharedApplication];
  BOOL v12 = [v11 userInterfaceLayoutDirection] == (id)1;

  uint64_t v13 = +[UIScreen mainScreen];
  [v13 scale];
  v15 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v12, 0, width, height, v14);

  renderer = self->_renderer;
  id v22 = v10;
  v17 = +[NSArray arrayWithObjects:&v22 count:1];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __89__MOSuggestionAssetContactProfilePictureProviderAvatar_avatarForContact_size_completion___block_invoke;
  v20[3] = &unk_10021FA58;
  id v21 = v9;
  id v18 = v9;
  id v19 = [(CNAvatarImageRenderer *)renderer renderAvatarsForContacts:v17 scope:v15 imageHandler:v20];
}

uint64_t __89__MOSuggestionAssetContactProfilePictureProviderAvatar_avatarForContact_size_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)avatarForContact:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = +[UIApplication sharedApplication];
  BOOL v9 = [v8 userInterfaceLayoutDirection] == (id)1;

  id v10 = +[UIScreen mainScreen];
  [v10 scale];
  BOOL v12 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v9, 0, width, height, v11);

  renderer = self->_renderer;
  id v17 = v7;
  double v14 = +[NSArray arrayWithObjects:&v17 count:1];
  v15 = [(CNAvatarImageRenderer *)renderer avatarImageForContacts:v14 scope:v12];

  return v15;
}

- (void).cxx_destruct
{
}

@end
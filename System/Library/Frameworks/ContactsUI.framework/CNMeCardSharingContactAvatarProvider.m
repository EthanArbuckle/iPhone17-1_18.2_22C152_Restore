@interface CNMeCardSharingContactAvatarProvider
- (CGRect)cropRect;
- (CNAvatarImageRenderer)renderer;
- (CNContact)contact;
- (CNMeCardSharingContactAvatarProvider)initWithContact:(id)a3;
- (CNMeCardSharingContactAvatarProvider)initWithContact:(id)a3 renderer:(id)a4;
- (CNWallpaper)wallpaper;
- (NSData)imageData;
- (NSData)thumbnailImageData;
- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4;
- (void)generatePosterAnimationControllerWithWindowScene:(id)a3 imageHandler:(id)a4;
- (void)generatePosterImageWithWindowScene:(id)a3 imageHandler:(id)a4;
@end

@implementation CNMeCardSharingContactAvatarProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (CNAvatarImageRenderer)renderer
{
  return self->_renderer;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)generatePosterAnimationControllerWithWindowScene:(id)a3 imageHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CNMeCardSharingContactAvatarProvider *)self contact];
  BOOL v9 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__CNMeCardSharingContactAvatarProvider_generatePosterAnimationControllerWithWindowScene_imageHandler___block_invoke;
  v11[3] = &unk_1E5497D08;
  id v12 = v6;
  id v10 = v6;
  +[CNPosterOnboardingSettingsAnimationViewController controllerFor:v8 isRTL:v9 windowScene:v7 shouldDefaultToCleanState:1 completion:v11];
}

uint64_t __102__CNMeCardSharingContactAvatarProvider_generatePosterAnimationControllerWithWindowScene_imageHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)generatePosterImageWithWindowScene:(id)a3 imageHandler:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F5A268];
  v8 = [(CNContact *)self->_contact wallpaper];
  BOOL v9 = [v8 posterArchiveData];
  LOBYTE(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  if (v7)
  {
    +[CNIncomingCallSnapshotViewController incomingCallPlaceholderSnapshotForContact:self->_contact windowScene:v12 completionBlock:v6];
  }
  else
  {
    id v10 = [(CNContact *)self->_contact wallpaper];
    v11 = [v10 posterArchiveData];
    +[CNIncomingCallSnapshotViewController incomingCallSnapshotForPosterArchiveData:v11 contact:self->_contact includingCallButtons:1 windowScene:v12 completionBlock:v6];
  }
}

- (void)generateAvatarImageOfSize:(CGSize)a3 imageHandler:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  contact = self->_contact;
  if (!contact) {
    goto LABEL_7;
  }
  BOOL v9 = [(CNContact *)contact imageData];
  if (!v9)
  {
    uint64_t v16 = [(CNContact *)self->_contact givenName];
    if (v16)
    {
      v17 = (void *)v16;
      v18 = [(CNContact *)self->_contact familyName];

      if (v18) {
        goto LABEL_4;
      }
    }
LABEL_7:
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    goto LABEL_8;
  }

LABEL_4:
  id v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 scale];
  id v12 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, width, height, v11);

  renderer = self->_renderer;
  v19[0] = self->_contact;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v15 = [(CNAvatarImageRenderer *)renderer avatarImageForContacts:v14 scope:v12];

  (*((void (**)(id, void *, void))v7 + 2))(v7, v15, 0);
LABEL_8:
}

- (CNWallpaper)wallpaper
{
  return (CNWallpaper *)[(CNContact *)self->_contact wallpaper];
}

- (NSData)thumbnailImageData
{
  return [(CNContact *)self->_contact thumbnailImageData];
}

- (CGRect)cropRect
{
  [(CNContact *)self->_contact cropRect];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSData)imageData
{
  return [(CNContact *)self->_contact imageData];
}

- (CNMeCardSharingContactAvatarProvider)initWithContact:(id)a3 renderer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNMeCardSharingContactAvatarProvider;
  BOOL v9 = [(CNMeCardSharingContactAvatarProvider *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contact, a3);
    objc_storeStrong((id *)&v10->_renderer, a4);
    double v11 = v10;
  }

  return v10;
}

- (CNMeCardSharingContactAvatarProvider)initWithContact:(id)a3
{
  id v4 = a3;
  double v5 = +[CNAvatarImageRendererSettings defaultSettings];
  id v6 = [[CNAvatarImageRenderer alloc] initWithSettings:v5];
  id v7 = [(CNMeCardSharingContactAvatarProvider *)self initWithContact:v4 renderer:v6];

  return v7;
}

@end
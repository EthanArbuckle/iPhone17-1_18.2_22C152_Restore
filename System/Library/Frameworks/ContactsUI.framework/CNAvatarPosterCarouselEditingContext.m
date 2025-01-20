@interface CNAvatarPosterCarouselEditingContext
+ (CNAvatarPosterCarouselEditingContext)contextWithExistingPoster:(id)a3 existingAvatar:(id)a4;
+ (id)contextForCreateNew;
- (BOOL)isEditingExisting;
- (CNAvatarPosterCarouselEditingContext)initWithExistingPoster:(id)a3 existingAvatar:(id)a4;
- (CNAvatarPosterCarouselPendingPosterEdit)pendingPosterEdit;
- (CNContactImage)existingAvatar;
- (CNContactImage)updatedAvatar;
- (CNContactPoster)existingPoster;
- (CNFuture)pendingWallpaperFuture;
- (void)setExistingAvatar:(id)a3;
- (void)setExistingPoster:(id)a3;
- (void)setPendingPosterEdit:(id)a3;
- (void)setPendingWallpaperFuture:(id)a3;
- (void)setUpdatedAvatar:(id)a3;
@end

@implementation CNAvatarPosterCarouselEditingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAvatar, 0);
  objc_storeStrong((id *)&self->_existingAvatar, 0);
  objc_storeStrong((id *)&self->_pendingWallpaperFuture, 0);
  objc_storeStrong((id *)&self->_pendingPosterEdit, 0);

  objc_storeStrong((id *)&self->_existingPoster, 0);
}

- (void)setUpdatedAvatar:(id)a3
{
}

- (CNContactImage)updatedAvatar
{
  return self->_updatedAvatar;
}

- (void)setExistingAvatar:(id)a3
{
}

- (CNContactImage)existingAvatar
{
  return self->_existingAvatar;
}

- (void)setPendingWallpaperFuture:(id)a3
{
}

- (CNFuture)pendingWallpaperFuture
{
  return self->_pendingWallpaperFuture;
}

- (CNAvatarPosterCarouselPendingPosterEdit)pendingPosterEdit
{
  return self->_pendingPosterEdit;
}

- (void)setExistingPoster:(id)a3
{
}

- (CNContactPoster)existingPoster
{
  return self->_existingPoster;
}

- (BOOL)isEditingExisting
{
  return self->_isEditingExisting;
}

- (void)setPendingPosterEdit:(id)a3
{
  v7 = (CNAvatarPosterCarouselPendingPosterEdit *)a3;
  if (self->_pendingPosterEdit != v7)
  {
    objc_storeStrong((id *)&self->_pendingPosterEdit, a3);
    v5 = [(CNAvatarPosterCarouselPendingPosterEdit *)v7 pendingWallpaper];
    pendingWallpaperFuture = self->_pendingWallpaperFuture;
    self->_pendingWallpaperFuture = v5;
  }
}

- (CNAvatarPosterCarouselEditingContext)initWithExistingPoster:(id)a3 existingAvatar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarPosterCarouselEditingContext;
  v9 = [(CNAvatarPosterCarouselEditingContext *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_isEditingExisting = 1;
    objc_storeStrong((id *)&v9->_existingAvatar, a4);
    objc_storeStrong((id *)&v10->_existingPoster, a3);
    v11 = v10;
  }

  return v10;
}

+ (id)contextForCreateNew
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (CNAvatarPosterCarouselEditingContext)contextWithExistingPoster:(id)a3 existingAvatar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithExistingPoster:v7 existingAvatar:v6];

  return (CNAvatarPosterCarouselEditingContext *)v8;
}

@end
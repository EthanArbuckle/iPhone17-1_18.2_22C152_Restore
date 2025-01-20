@interface AVTAvatarListRecordItem
- (AVTAvatarListRecordItem)initWithAvatar:(id)a3;
- (AVTAvatarRecord)avatar;
- (BOOL)isEqual:(id)a3;
- (UIImage)cachedImage;
- (unint64_t)hash;
- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5;
- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4;
- (void)setCachedImage:(id)a3;
@end

@implementation AVTAvatarListRecordItem

- (AVTAvatarListRecordItem)initWithAvatar:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarListRecordItem;
  v6 = [(AVTAvatarListRecordItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_avatar, a3);
  }

  return v7;
}

- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4
{
}

- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5
{
  if (a3) {
    (*((void (**)(id, AVTAvatarListRecordItem *))a3 + 2))(a3, self);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v4 format];
    }
    id v5 = [v4 avatar];
    v6 = [(AVTAvatarListRecordItem *)self avatar];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(AVTAvatarListRecordItem *)self avatar];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (AVTAvatarRecord)avatar
{
  return self->_avatar;
}

- (UIImage)cachedImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cachedImage);
  return (UIImage *)WeakRetained;
}

- (void)setCachedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cachedImage);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end
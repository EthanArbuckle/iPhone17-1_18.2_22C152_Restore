@interface AVTAvatarListImageItem
- (AVTAvatarListImageItem)initWithImage:(id)a3 title:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (UIImage)image;
- (unint64_t)hash;
- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5;
- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4;
@end

@implementation AVTAvatarListImageItem

- (AVTAvatarListImageItem)initWithImage:(id)a3 title:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarListImageItem;
  v9 = [(AVTAvatarListImageItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_image, a3);
    objc_storeStrong((id *)&v10->_title, a4);
  }

  return v10;
}

- (void)downcastWithRecordHandler:(id)a3 viewHandler:(id)a4
{
}

- (void)downcastWithRecordHandler:(id)a3 imageHandler:(id)a4 viewHandler:(id)a5
{
  if (a4) {
    (*((void (**)(id, AVTAvatarListImageItem *))a4 + 2))(a4, self);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v5 format];
    }
    id v6 = v5;
    id v7 = [v6 image];
    if (v7
      || ([(AVTAvatarListImageItem *)self image], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = [v6 image];
      v9 = [(AVTAvatarListImageItem *)self image];
      int v10 = [v8 isEqual:v9];

      if (v7)
      {

        if (v10) {
          goto LABEL_8;
        }
      }
      else
      {

        if (v10) {
          goto LABEL_8;
        }
      }
      char v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_8:
    v11 = [v6 title];
    if (v11
      || ([(AVTAvatarListImageItem *)self title], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_super v12 = [v6 title];
      v13 = [(AVTAvatarListImageItem *)self title];
      char v14 = [v12 isEqual:v13];

      if (v11)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      char v14 = 1;
    }

    goto LABEL_17;
  }
  char v14 = 0;
LABEL_19:

  return v14;
}

- (unint64_t)hash
{
  v3 = [(AVTAvatarListImageItem *)self image];
  uint64_t v4 = [v3 hash];
  id v5 = [(AVTAvatarListImageItem *)self image];
  *((void *)&v6 + 1) = v4;
  *(void *)&long long v6 = [v5 hash];
  id v7 = [(AVTAvatarListImageItem *)self title];
  unint64_t v8 = [v7 hash] ^ (v6 >> 32);

  return v8;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
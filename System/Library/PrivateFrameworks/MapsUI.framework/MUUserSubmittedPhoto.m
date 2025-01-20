@interface MUUserSubmittedPhoto
- (MUUserSubmittedPhoto)initWithPhotoURL:(id)a3;
- (NSString)photoID;
- (NSString)title;
- (void)configureWithSize:(CGSize)a3 imageProvider:(id)a4;
- (void)setPhotoID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MUUserSubmittedPhoto

- (MUUserSubmittedPhoto)initWithPhotoURL:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MUUserSubmittedPhoto;
    v6 = [(MUUserSubmittedPhoto *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_photoURL, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)configureWithSize:(CGSize)a3 imageProvider:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F31038] sharedInstance];
  [v8 screenScale];
  uint64_t v10 = v9;

  v11 = [MEMORY[0x1E4F30E38] sharedImageManager];
  photoURL = self->_photoURL;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__MUUserSubmittedPhoto_configureWithSize_imageProvider___block_invoke;
  v14[3] = &unk_1E574F678;
  id v15 = v7;
  CGFloat v16 = width;
  CGFloat v17 = height;
  uint64_t v18 = v10;
  id v13 = v7;
  [v11 loadAppImageAtURL:photoURL completionHandler:v14];
}

void __56__MUUserSubmittedPhoto_configureWithSize_imageProvider___block_invoke(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  if (!a2 || a5)
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v10();
  }
  else
  {
    double v8 = *(double *)(a1 + 56);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__MUUserSubmittedPhoto_configureWithSize_imageProvider___block_invoke_2;
    v11[3] = &unk_1E5750288;
    id v9 = *(id *)(a1 + 32);
    id v12 = 0;
    id v13 = v9;
    char v14 = a3;
    +[MapsUIUtilities resizeImageIfNeeded:toFrameSize:displayScale:completion:](MapsUIUtilities, "resizeImageIfNeeded:toFrameSize:displayScale:completion:", a2, v11, *(double *)(a1 + 40), *(double *)(a1 + 48), v8);
  }
}

uint64_t __56__MUUserSubmittedPhoto_configureWithSize_imageProvider___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)photoID
{
  return self->_photoID;
}

- (void)setPhotoID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_photoURL, 0);
}

@end
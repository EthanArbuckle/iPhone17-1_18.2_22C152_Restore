@interface MUPlaceReviewAvatarGenerator
- (CNAvatarImageRenderer)monogrammer;
- (MUPlaceReviewAvatarGenerator)init;
- (void)avatarForReview:(id)a3 pointSize:(CGSize)a4 completion:(id)a5;
- (void)monogramForReviewerName:(id)a3 pointSize:(CGSize)a4 completion:(id)a5;
- (void)setMonogrammer:(id)a3;
@end

@implementation MUPlaceReviewAvatarGenerator

- (MUPlaceReviewAvatarGenerator)init
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceReviewAvatarGenerator;
  v2 = [(MUPlaceReviewAvatarGenerator *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.MapsUI.monogram", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)monogramForReviewerName:(id)a3 pointSize:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  v11 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v12 = [v9 componentsSeparatedByCharactersInSet:v11];

  unint64_t v13 = [v12 count];
  uint64_t v14 = 2;
  if (v13 < 2) {
    uint64_t v14 = v13;
  }
  if (v14)
  {
    uint64_t v15 = 0;
    v16 = &stru_1EE3BF360;
    do
    {
      v17 = [v12 objectAtIndexedSubscript:v15];
      if ([v17 length])
      {
        v18 = objc_msgSend(v17, "substringWithRange:", 0, 1);
        uint64_t v19 = [(__CFString *)v16 stringByAppendingString:v18];

        v16 = (__CFString *)v19;
      }

      unint64_t v20 = v15 + 1;
      unint64_t v21 = [v12 count];
      if (v21 >= 2) {
        unint64_t v22 = 2;
      }
      else {
        unint64_t v22 = v21;
      }
      uint64_t v15 = 1;
    }
    while (v20 < v22);
  }
  else
  {
    v16 = &stru_1EE3BF360;
  }
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__MUPlaceReviewAvatarGenerator_monogramForReviewerName_pointSize_completion___block_invoke;
  v26[3] = &unk_1E5750CC8;
  objc_copyWeak(v29, &location);
  v29[1] = *(id *)&width;
  v29[2] = *(id *)&height;
  v27 = v16;
  id v28 = v10;
  id v24 = v10;
  v25 = v16;
  dispatch_async(workQueue, v26);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
}

void __77__MUPlaceReviewAvatarGenerator_monogramForReviewerName_pointSize_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  dispatch_queue_t v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained monogrammer];

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1BB20]);
      [v3 setMonogrammer:v5];
    }
    if ([*(id *)(a1 + 32) length])
    {
      objc_super v6 = (void *)MEMORY[0x1E4F1BB30];
      v7 = [MEMORY[0x1E4F31038] sharedInstance];
      [v7 screenScale];
      id v9 = objc_msgSend(v6, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, *(double *)(a1 + 56), *(double *)(a1 + 64), v8);

      id v10 = [v3 monogrammer];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __77__MUPlaceReviewAvatarGenerator_monogramForReviewerName_pointSize_completion___block_invoke_2;
      v17[3] = &unk_1E5750CA0;
      uint64_t v11 = *(void *)(a1 + 32);
      id v18 = *(id *)(a1 + 40);
      id v12 = (id)[v10 renderMonogramForString:v11 scope:v9 imageHandler:v17];
    }
    else
    {
      unint64_t v13 = [v3 monogrammer];
      uint64_t v14 = [v13 placeholderImageProvider];
      uint64_t v15 = [MEMORY[0x1E4F31038] sharedInstance];
      [v15 screenScale];
      id v9 = objc_msgSend(v14, "imageForSize:scale:", *(double *)(a1 + 56), *(double *)(a1 + 64), v16);

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __77__MUPlaceReviewAvatarGenerator_monogramForReviewerName_pointSize_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)avatarForReview:(id)a3 pointSize:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [v9 _reviewerImageURL];
  if (v11)
  {
    objc_initWeak(&location, self);
    id v12 = [MEMORY[0x1E4F30E38] sharedImageManager];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __69__MUPlaceReviewAvatarGenerator_avatarForReview_pointSize_completion___block_invoke;
    v14[3] = &unk_1E5750CF0;
    objc_copyWeak(v17, &location);
    id v15 = v9;
    v17[1] = *(id *)&width;
    v17[2] = *(id *)&height;
    id v16 = v10;
    [v12 loadAppImageAtURL:v11 completionHandler:v14];

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }
  else
  {
    unint64_t v13 = [v9 _reviewerName];
    -[MUPlaceReviewAvatarGenerator monogramForReviewerName:pointSize:completion:](self, "monogramForReviewerName:pointSize:completion:", v13, v10, width, height);
  }
}

void __69__MUPlaceReviewAvatarGenerator_avatarForReview_pointSize_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v9 || a5)
    {
      double v8 = [*(id *)(a1 + 32) _reviewerName];
      objc_msgSend(WeakRetained, "monogramForReviewerName:pointSize:completion:", v8, *(void *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (CNAvatarImageRenderer)monogrammer
{
  return self->_monogrammer;
}

- (void)setMonogrammer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogrammer, 0);
  objc_storeStrong((id *)&self->_cachedMaskedImages, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
@interface CKSharedLocationCollectionViewCell
+ (id)reuseIdentifier;
- (void)configureWithAttachmentItem:(id)a3;
@end

@implementation CKSharedLocationCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKSharedLocationCollectionViewCell_reuseIdentifier";
}

- (void)configureWithAttachmentItem:(id)a3
{
  id v4 = a3;
  v5 = [(CKSharedAssetCollectionViewCell *)self previewTitleLabel];
  v6 = [v4 locationTitle];
  v7 = [(CKSharedAssetCollectionViewCell *)self formattedTitleFromPreviewTitle:v6];
  [v5 setAttributedText:v7];

  v8 = +[CKPreviewDispatchCache detailsPreviewCache];
  [v8 resume];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__CKSharedLocationCollectionViewCell_configureWithAttachmentItem___block_invoke;
  v9[3] = &unk_1E5625990;
  v9[4] = self;
  [v4 generatePreviewWithCompletion:v9];
}

void __66__CKSharedLocationCollectionViewCell_configureWithAttachmentItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 previewView];
  id v7 = [v4 layer];

  id v5 = v3;
  uint64_t v6 = [v5 CGImage];

  [v7 setContents:v6];
  [v7 setContentsGravity:*MEMORY[0x1E4F3A3E0]];
  [v7 setMasksToBounds:1];
}

@end
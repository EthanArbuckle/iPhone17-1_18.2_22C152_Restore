@interface CKReviewLargeAttachmentsTableViewCell
+ (CGSize)leftHandSideViewSize;
+ (double)requestedHeight;
- (CKAttachmentItem)attachmentItem;
- (UIImageView)previewView;
- (id)leftHandSideView;
- (void)_updateImageViewForAttachmentItem;
- (void)prepareForReuse;
- (void)setAttachmentItem:(id)a3;
- (void)setModelObject:(id)a3;
- (void)setPreviewView:(id)a3;
@end

@implementation CKReviewLargeAttachmentsTableViewCell

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKReviewLargeAttachmentsTableViewCell;
  [(CKAbstractReviewTableViewCell *)&v4 prepareForReuse];
  v3 = [(CKReviewLargeAttachmentsTableViewCell *)self previewView];
  [v3 setImage:0];

  [(CKReviewLargeAttachmentsTableViewCell *)self setAttachmentItem:0];
}

+ (double)requestedHeight
{
  return 58.0;
}

+ (CGSize)leftHandSideViewSize
{
  double v2 = 56.0;
  double v3 = 56.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)leftHandSideView
{
  double v3 = [(CKReviewLargeAttachmentsTableViewCell *)self previewView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v5 setContentMode:2];
    [v5 setClipsToBounds:1];
    [(CKReviewLargeAttachmentsTableViewCell *)self setPreviewView:v5];
    [(CKReviewLargeAttachmentsTableViewCell *)self _updateImageViewForAttachmentItem];
  }

  return [(CKReviewLargeAttachmentsTableViewCell *)self previewView];
}

- (void)setModelObject:(id)a3
{
  id v4 = a3;
  id v17 = v4;
  if (v4)
  {
    v5 = [v4 objectForKeyedSubscript:@"guid"];
    v6 = [v17 objectForKeyedSubscript:@"filename"];
    v7 = objc_msgSend(v6, "__ck_stringByExpandingTildeInPath");

    v8 = [v17 objectForKeyedSubscript:@"date"];
    if (v8)
    {
      v9 = [MEMORY[0x1E4F28C10] localizedStringFromDate:v8 dateStyle:2 timeStyle:0];
      [(CKAbstractReviewTableViewCell *)self setMainText:v9];
    }
    else
    {
      [(CKAbstractReviewTableViewCell *)self setMainText:0];
    }
    v10 = [v17 objectForKeyedSubscript:@"size"];
    v11 = v10;
    if (v10) {
      uint64_t v12 = [v10 unsignedLongLongValue];
    }
    else {
      uint64_t v12 = 0;
    }
    [(CKAbstractReviewTableViewCell *)self setSize:v12];
    v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    v14 = +[CKAttachmentItemManager attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:](CKAttachmentItemManager, "attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v13, v5, v5, v8, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [(CKReviewLargeAttachmentsTableViewCell *)self setAttachmentItem:v14];

    v15 = [(CKReviewLargeAttachmentsTableViewCell *)self attachmentItem];

    if (v15)
    {
      v16 = [(CKReviewLargeAttachmentsTableViewCell *)self attachmentItem];
      [v16 setShowDocumentIcon:0];

      [(CKReviewLargeAttachmentsTableViewCell *)self _updateImageViewForAttachmentItem];
    }
    else
    {
      [(CKAbstractReviewTableViewCell *)self setMainText:0];
      [(CKAbstractReviewTableViewCell *)self setSize:0];
      [(CKReviewLargeAttachmentsTableViewCell *)self setAttachmentItem:0];
    }
  }
  else
  {
    [(CKAbstractReviewTableViewCell *)self setMainText:0];
    [(CKAbstractReviewTableViewCell *)self setSize:0];
    [(CKReviewLargeAttachmentsTableViewCell *)self setAttachmentItem:0];
  }
}

- (void)_updateImageViewForAttachmentItem
{
  uint64_t v3 = [(CKReviewLargeAttachmentsTableViewCell *)self previewView];
  if (v3
    && (id v4 = (void *)v3,
        [(CKReviewLargeAttachmentsTableViewCell *)self attachmentItem],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = [(CKReviewLargeAttachmentsTableViewCell *)self attachmentItem];
    v7 = [v6 cachedPreview];

    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 image];
      }
      else
      {
        id v8 = v7;
      }
      uint64_t v12 = v8;
      v13 = [(CKReviewLargeAttachmentsTableViewCell *)self previewView];
      [v13 setImage:v12];
    }
    else
    {
      id location = 0;
      v9 = [(CKReviewLargeAttachmentsTableViewCell *)self attachmentItem];
      objc_initWeak(&location, v9);

      id from = 0;
      objc_initWeak(&from, self);
      v10 = +[CKPreviewDispatchCache detailsPreviewCache];
      [v10 resume];

      v11 = [(CKReviewLargeAttachmentsTableViewCell *)self attachmentItem];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __74__CKReviewLargeAttachmentsTableViewCell__updateImageViewForAttachmentItem__block_invoke;
      v15[3] = &unk_1E5620DC0;
      objc_copyWeak(&v16, &location);
      objc_copyWeak(&v17, &from);
      v15[4] = self;
      [v11 generatePreviewWithCompletion:v15];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v14 = [(CKReviewLargeAttachmentsTableViewCell *)self previewView];
    [v14 setImage:0];
  }
}

void __74__CKReviewLargeAttachmentsTableViewCell__updateImageViewForAttachmentItem__block_invoke(id *a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v4 = objc_loadWeakRetained(a1 + 6);
  v5 = v4;
  if (WeakRetained)
  {
    if (v4)
    {
      id v6 = [v4 attachmentItem];

      if (v6 == WeakRetained)
      {
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v8 = [a1[4] previewView];
            [v8 setImage:v10];
            goto LABEL_10;
          }
          uint64_t v7 = [v10 image];
        }
        else
        {
          uint64_t v7 = [WeakRetained fileIcon];
        }
        id v8 = (void *)v7;
        v9 = [a1[4] previewView];
        [v9 setImage:v8];

LABEL_10:
      }
    }
  }
}

- (UIImageView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (CKAttachmentItem)attachmentItem
{
  return self->_attachmentItem;
}

- (void)setAttachmentItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentItem, 0);

  objc_storeStrong((id *)&self->_previewView, 0);
}

@end
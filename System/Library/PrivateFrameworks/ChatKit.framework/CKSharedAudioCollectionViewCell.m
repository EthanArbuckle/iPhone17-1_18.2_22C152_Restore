@interface CKSharedAudioCollectionViewCell
+ (id)reuseIdentifier;
- (CKAudioProgressView)audioPlaybackView;
- (id)formattedCreatedDateTextFromDate:(id)a3;
- (id)formattedDurationTextForAsset:(id)a3;
- (void)configureWithAttachmentItem:(id)a3;
- (void)layoutSubviews;
- (void)setAudioPlaybackView:(id)a3;
@end

@implementation CKSharedAudioCollectionViewCell

+ (id)reuseIdentifier
{
  return @"CKSharedAudioCollectionViewCell_reuseIdentifier";
}

- (void)configureWithAttachmentItem:(id)a3
{
  id v4 = a3;
  id v13 = [v4 fileURL];
  v5 = CKAVURLAssetForURL(v13);
  v6 = NSString;
  v7 = [(CKSharedAudioCollectionViewCell *)self formattedDurationTextForAsset:v5];
  v8 = [v4 createdDate];

  v9 = [(CKSharedAudioCollectionViewCell *)self formattedCreatedDateTextFromDate:v8];
  v10 = [v6 stringWithFormat:@"%@\n%@", v7, v9];

  v11 = [(CKSharedAssetCollectionViewCell *)self previewTitleLabel];
  v12 = [(CKSharedAssetCollectionViewCell *)self formattedTitleFromPreviewTitle:v10];
  [v11 setAttributedText:v12];

  [(CKSharedAudioCollectionViewCell *)self setNeedsLayout];
  [(CKSharedAudioCollectionViewCell *)self layoutIfNeeded];
}

- (id)formattedDurationTextForAsset:(id)a3
{
  id v3 = a3;
  if (formattedDurationTextForAsset___pred_CMTimeGetSecondsCoreMedia != -1) {
    dispatch_once(&formattedDurationTextForAsset___pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_193);
  }
  id v4 = (double (*)(void *))formattedDurationTextForAsset___CMTimeGetSeconds;
  if (v3) {
    [v3 duration];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  double v5 = v4(v8);
  v6 = CKLocalizedStringForDuration(v5);

  return v6;
}

void *__65__CKSharedAudioCollectionViewCell_formattedDurationTextForAsset___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CMTimeGetSeconds", @"CoreMedia");
  formattedDurationTextForAsset___CMTimeGetSeconds = result;
  return result;
}

- (id)formattedCreatedDateTextFromDate:(id)a3
{
  return (id)[MEMORY[0x1E4F28C10] localizedStringFromDate:a3 dateStyle:1 timeStyle:0];
}

- (CKAudioProgressView)audioPlaybackView
{
  audioPlaybackView = self->_audioPlaybackView;
  if (!audioPlaybackView)
  {
    id v4 = objc_alloc_init(CKAudioProgressView);
    double v5 = self->_audioPlaybackView;
    self->_audioPlaybackView = v4;

    [(CKAudioProgressView *)self->_audioPlaybackView setColor:0xFFFFFFFFLL];
    v6 = [(CKSharedAssetCollectionViewCell *)self previewView];
    [v6 addSubview:self->_audioPlaybackView];

    audioPlaybackView = self->_audioPlaybackView;
  }

  return audioPlaybackView;
}

- (void)layoutSubviews
{
  *(void *)&rect.origin.y = self;
  *(void *)&rect.size.width = CKSharedAudioCollectionViewCell;
  [(CGFloat *)(objc_super *)&rect.origin.y layoutSubviews];
  id v3 = [(CKSharedAssetCollectionViewCell *)self previewView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(CKSharedAudioCollectionViewCell *)self audioPlaybackView];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v20.origin.x = v5;
  v20.origin.y = v7;
  v20.size.width = v9;
  v20.size.height = v11;
  CGFloat v14 = CGRectGetWidth(v20) * 0.5;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGFloat v15 = CGRectGetHeight(v21) * 0.5;
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  CGFloat v16 = CGRectGetWidth(v22) * 0.5;
  v23.origin.x = rect.origin.x;
  v23.origin.y = v13;
  v23.size.width = v14;
  v23.size.height = v15;
  CGFloat v17 = v16 - CGRectGetWidth(v23) * 0.5;
  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGFloat v18 = CGRectGetHeight(v24) * 0.5;
  v25.origin.x = v17;
  v25.origin.y = v13;
  v25.size.width = v14;
  v25.size.height = v15;
  objc_msgSend(v12, "setFrame:", v17, v18 - CGRectGetHeight(v25) * 0.5, v14, v15);
  [v12 prepareForDisplayIfNeeded];
}

- (void)setAudioPlaybackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
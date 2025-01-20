@interface CKInlineReplyGradientReferenceView
- (CKTranscriptCollectionView)collectionView;
- (void)layoutSubviews;
- (void)setCollectionView:(id)a3;
@end

@implementation CKInlineReplyGradientReferenceView

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CKInlineReplyGradientReferenceView;
  [(CKInlineReplyGradientReferenceView *)&v13 layoutSubviews];
  [(CKInlineReplyGradientReferenceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(CKInlineReplyGradientReferenceView *)self safeAreaInsets];
  double v10 = v9;
  double v11 = v8 - v9;
  v12 = [(CKInlineReplyGradientReferenceView *)self collectionView];
  objc_msgSend(v12, "setFrame:", v4, v10, v6, v11);
}

- (CKTranscriptCollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
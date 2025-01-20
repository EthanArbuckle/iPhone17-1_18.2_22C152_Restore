@interface CKLegacyTranscriptLayoutEnvironment
- (CKChatItem)previousItem;
- (CKConversation)conversation;
- (CKLegacyTranscriptLayoutEnvironment)init;
- (NSCollectionLayoutEnvironment)collectionLayoutEnvironment;
- (UICollectionView)collectionView;
- (UIEdgeInsets)marginInsets;
- (int64_t)layoutContext;
- (void)setCollectionLayoutEnvironment:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setConversation:(id)a3;
- (void)setLayoutContext:(int64_t)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setPreviousItem:(id)a3;
@end

@implementation CKLegacyTranscriptLayoutEnvironment

- (CKLegacyTranscriptLayoutEnvironment)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKLegacyTranscriptLayoutEnvironment;
  v2 = [(CKLegacyTranscriptLayoutEnvironment *)&v5 init];
  v3 = v2;
  if (v2)
  {
    -[CKLegacyTranscriptLayoutEnvironment setMarginInsets:](v2, "setMarginInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    [(CKLegacyTranscriptLayoutEnvironment *)v3 setLayoutContext:0];
  }
  return v3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (NSCollectionLayoutEnvironment)collectionLayoutEnvironment
{
  return self->_collectionLayoutEnvironment;
}

- (void)setCollectionLayoutEnvironment:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->_marginInsets = a3;
}

- (int64_t)layoutContext
{
  return self->_layoutContext;
}

- (void)setLayoutContext:(int64_t)a3
{
  self->_layoutContext = a3;
}

- (CKChatItem)previousItem
{
  return self->_previousItem;
}

- (void)setPreviousItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousItem, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_collectionLayoutEnvironment, 0);

  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
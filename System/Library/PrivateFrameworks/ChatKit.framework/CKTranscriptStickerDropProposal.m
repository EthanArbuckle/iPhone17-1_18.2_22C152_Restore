@interface CKTranscriptStickerDropProposal
- (CGPoint)previewCenter;
- (CKTranscriptStickerDropProposal)initWithDragItem:(id)a3 previewCenter:(CGPoint)a4 targetBalloonIndex:(id)a5;
- (NSIndexPath)targetBalloonIndex;
- (UIDragItem)dragItem;
- (void)setDragItem:(id)a3;
- (void)setPreviewCenter:(CGPoint)a3;
- (void)setTargetBalloonIndex:(id)a3;
@end

@implementation CKTranscriptStickerDropProposal

- (CKTranscriptStickerDropProposal)initWithDragItem:(id)a3 previewCenter:(CGPoint)a4 targetBalloonIndex:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CKTranscriptStickerDropProposal;
  v12 = [(CKTranscriptStickerDropProposal *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dragItem, a3);
    v13->_previewCenter.CGFloat x = x;
    v13->_previewCenter.CGFloat y = y;
    objc_storeStrong((id *)&v13->_targetBalloonIndex, a5);
  }

  return v13;
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
}

- (CGPoint)previewCenter
{
  double x = self->_previewCenter.x;
  double y = self->_previewCenter.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPreviewCenter:(CGPoint)a3
{
  self->_previewCenter = a3;
}

- (NSIndexPath)targetBalloonIndex
{
  return self->_targetBalloonIndex;
}

- (void)setTargetBalloonIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetBalloonIndex, 0);

  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end
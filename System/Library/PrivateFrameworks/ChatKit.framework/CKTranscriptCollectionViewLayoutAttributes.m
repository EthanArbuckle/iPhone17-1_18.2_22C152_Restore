@interface CKTranscriptCollectionViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)isInsertingReply;
- (CATransform3D)contentTransform3D;
- (CGSize)parentChatItemSize;
- (CKChatItem)chatItem;
- (CKTranscriptCollectionViewLayoutAttributes)init;
- (CKTranscriptCollectionViewLayoutAttributes)initWithLayoutAttributes:(id)a3;
- (double)parentRotationOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setChatItem:(id)a3;
- (void)setInsertingReply:(BOOL)a3;
- (void)setParentChatItemSize:(CGSize)a3;
- (void)setParentRotationOffset:(double)a3;
@end

@implementation CKTranscriptCollectionViewLayoutAttributes

- (CKTranscriptCollectionViewLayoutAttributes)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptCollectionViewLayoutAttributes;
  result = [(UICollectionViewLayoutAttributes *)&v8 init];
  if (result)
  {
    v3 = (_OWORD *)MEMORY[0x1E4F39B10];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    *(_OWORD *)&result->_contentTransform3D.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    *(_OWORD *)&result->_contentTransform3D.m43 = v4;
    long long v5 = v3[5];
    *(_OWORD *)&result->_contentTransform3D.m31 = v3[4];
    *(_OWORD *)&result->_contentTransform3D.m33 = v5;
    long long v6 = v3[1];
    *(_OWORD *)&result->_contentTransform3D.m11 = *v3;
    *(_OWORD *)&result->_contentTransform3D.m13 = v6;
    long long v7 = v3[3];
    *(_OWORD *)&result->_contentTransform3D.m21 = v3[2];
    *(_OWORD *)&result->_contentTransform3D.m23 = v7;
    result->_insertingReply = 0;
  }
  return result;
}

- (CKTranscriptCollectionViewLayoutAttributes)initWithLayoutAttributes:(id)a3
{
  id v4 = a3;
  long long v5 = [(CKTranscriptCollectionViewLayoutAttributes *)self init];
  if (v5)
  {
    [v4 frame];
    -[UICollectionViewLayoutAttributes setFrame:](v5, "setFrame:");
    [v4 center];
    -[UICollectionViewLayoutAttributes setCenter:](v5, "setCenter:");
    [v4 size];
    -[UICollectionViewLayoutAttributes setSize:](v5, "setSize:");
    if (v4)
    {
      [v4 transform3D];
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
    }
    v12[4] = v17;
    v12[5] = v18;
    v12[6] = v19;
    v12[7] = v20;
    v12[0] = v13;
    v12[1] = v14;
    v12[2] = v15;
    v12[3] = v16;
    [(UICollectionViewLayoutAttributes *)v5 setTransform3D:v12];
    [v4 bounds];
    -[UICollectionViewLayoutAttributes setBounds:](v5, "setBounds:");
    if (v4)
    {
      [v4 transform];
    }
    else
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v9 = 0u;
    }
    v8[0] = v9;
    v8[1] = v10;
    v8[2] = v11;
    [(UICollectionViewLayoutAttributes *)v5 setTransform:v8];
    [v4 alpha];
    -[UICollectionViewLayoutAttributes setAlpha:](v5, "setAlpha:");
    -[UICollectionViewLayoutAttributes setZIndex:](v5, "setZIndex:", [v4 zIndex]);
    long long v6 = [v4 indexPath];
    [(UICollectionViewLayoutAttributes *)v5 setIndexPath:v6];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v20.receiver = self;
  v20.super_class = (Class)CKTranscriptCollectionViewLayoutAttributes;
  long long v5 = -[UICollectionViewLayoutAttributes copyWithZone:](&v20, sel_copyWithZone_);
  objc_storeStrong((id *)v5 + 82, self->_chatItem);
  CGSize size = self->_targetFrame.size;
  *((_OWORD *)v5 + 22) = self->_targetFrame.origin;
  *((CGSize *)v5 + 23) = size;
  long long v7 = *(_OWORD *)&self->_contentTransform3D.m11;
  long long v9 = *(_OWORD *)&self->_contentTransform3D.m21;
  long long v8 = *(_OWORD *)&self->_contentTransform3D.m23;
  *(_OWORD *)(v5 + 472) = *(_OWORD *)&self->_contentTransform3D.m13;
  *(_OWORD *)(v5 + 488) = v9;
  *(_OWORD *)(v5 + 456) = v7;
  long long v10 = *(_OWORD *)&self->_contentTransform3D.m31;
  long long v12 = *(_OWORD *)&self->_contentTransform3D.m41;
  long long v11 = *(_OWORD *)&self->_contentTransform3D.m43;
  *(_OWORD *)(v5 + 536) = *(_OWORD *)&self->_contentTransform3D.m33;
  *(_OWORD *)(v5 + 552) = v12;
  *(_OWORD *)(v5 + 504) = v8;
  *(_OWORD *)(v5 + 520) = v10;
  *(_OWORD *)(v5 + 568) = v11;
  *(CGSize *)(v5 + 680) = self->_parentChatItemSize;
  *((void *)v5 + 84) = *(void *)&self->_parentRotationOffset;
  *((void *)v5 + 78) = *(void *)&self->_associatedVerticalShift;
  uint64_t v13 = [(NSMutableArray *)self->_associatedLayoutAttributes mutableCopyWithZone:a3];
  long long v14 = (void *)*((void *)v5 + 79);
  *((void *)v5 + 79) = v13;

  uint64_t v15 = [(CKTranscriptCollectionViewLayoutAttributes *)self->_initialParentLayoutAttributes copy];
  long long v16 = (void *)*((void *)v5 + 80);
  *((void *)v5 + 80) = v15;

  uint64_t v17 = [(NSArray *)self->_threadGroupLayoutAttributes copy];
  long long v18 = (void *)*((void *)v5 + 81);
  *((void *)v5 + 81) = v17;

  v5[664] = self->_insertingReply;
  *((void *)v5 + 55) = *(void *)&self->_initialBalloonOffsetX;
  *((void *)v5 + 56) = *(void *)&self->_currentBalloonOffsetX;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKTranscriptCollectionViewLayoutAttributes *)a3;
  if (v4 == self)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v5 = v4;
      long long v6 = *(_OWORD *)&v5->_contentTransform3D.m11;
      long long v7 = *(_OWORD *)&v5->_contentTransform3D.m13;
      long long v8 = *(_OWORD *)&v5->_contentTransform3D.m23;
      *(_OWORD *)&a.m21 = *(_OWORD *)&v5->_contentTransform3D.m21;
      *(_OWORD *)&a.m23 = v8;
      *(_OWORD *)&a.m11 = v6;
      *(_OWORD *)&a.m13 = v7;
      long long v9 = *(_OWORD *)&v5->_contentTransform3D.m31;
      long long v10 = *(_OWORD *)&v5->_contentTransform3D.m33;
      long long v11 = *(_OWORD *)&v5->_contentTransform3D.m43;
      *(_OWORD *)&a.m41 = *(_OWORD *)&v5->_contentTransform3D.m41;
      *(_OWORD *)&a.m43 = v11;
      *(_OWORD *)&a.m31 = v9;
      *(_OWORD *)&a.m33 = v10;
      long long v12 = *(_OWORD *)&self->_contentTransform3D.m33;
      *(_OWORD *)&b.m31 = *(_OWORD *)&self->_contentTransform3D.m31;
      *(_OWORD *)&b.m33 = v12;
      long long v13 = *(_OWORD *)&self->_contentTransform3D.m43;
      *(_OWORD *)&b.m41 = *(_OWORD *)&self->_contentTransform3D.m41;
      *(_OWORD *)&b.m43 = v13;
      long long v14 = *(_OWORD *)&self->_contentTransform3D.m13;
      *(_OWORD *)&b.m11 = *(_OWORD *)&self->_contentTransform3D.m11;
      *(_OWORD *)&b.m13 = v14;
      long long v15 = *(_OWORD *)&self->_contentTransform3D.m23;
      *(_OWORD *)&b.m21 = *(_OWORD *)&self->_contentTransform3D.m21;
      *(_OWORD *)&b.m23 = v15;
      if (!CATransform3DEqualToTransform(&a, &b)) {
        goto LABEL_16;
      }
      BOOL v16 = 0;
      if (v5->_parentChatItemSize.width != self->_parentChatItemSize.width
        || v5->_parentChatItemSize.height != self->_parentChatItemSize.height)
      {
        goto LABEL_17;
      }
      if (v5->_parentRotationOffset == self->_parentRotationOffset
        && v5->_associatedVerticalShift == self->_associatedVerticalShift
        && ((initialParentLayoutAttributes = v5->_initialParentLayoutAttributes,
             initialParentLayoutAttributes == self->_initialParentLayoutAttributes)
         || -[CKTranscriptCollectionViewLayoutAttributes isEqual:](initialParentLayoutAttributes, "isEqual:"))
        && v5->_threadGroupLayoutAttributes == self->_threadGroupLayoutAttributes
        && v5->_insertingReply == self->_insertingReply
        && v5->_currentBalloonOffsetX == self->_currentBalloonOffsetX)
      {
        v19.receiver = self;
        v19.super_class = (Class)CKTranscriptCollectionViewLayoutAttributes;
        BOOL v16 = [(UICollectionViewLayoutAttributes *)&v19 isEqual:v5];
      }
      else
      {
LABEL_16:
        BOOL v16 = 0;
      }
LABEL_17:

      goto LABEL_18;
    }
    BOOL v16 = 0;
  }
LABEL_18:

  return v16;
}

- (CATransform3D)contentTransform3D
{
  long long v3 = *(_OWORD *)&self[4].m14;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[4].m12;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[4].m24;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[4].m22;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[3].m34;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[3].m32;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[3].m44;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[3].m42;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (CKChatItem)chatItem
{
  return self->_chatItem;
}

- (void)setChatItem:(id)a3
{
}

- (CGSize)parentChatItemSize
{
  double width = self->_parentChatItemSize.width;
  double height = self->_parentChatItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setParentChatItemSize:(CGSize)a3
{
  self->_parentChatItemSize = a3;
}

- (double)parentRotationOffset
{
  return self->_parentRotationOffset;
}

- (void)setParentRotationOffset:(double)a3
{
  self->_parentRotationOffset = a3;
}

- (BOOL)isInsertingReply
{
  return self->_insertingReply;
}

- (void)setInsertingReply:(BOOL)a3
{
  self->_insertingReply = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_storeStrong((id *)&self->_threadGroupLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_initialParentLayoutAttributes, 0);

  objc_storeStrong((id *)&self->_associatedLayoutAttributes, 0);
}

@end
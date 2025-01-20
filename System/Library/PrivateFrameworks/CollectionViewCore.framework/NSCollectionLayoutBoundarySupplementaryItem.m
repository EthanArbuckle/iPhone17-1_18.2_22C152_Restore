@interface NSCollectionLayoutBoundarySupplementaryItem
+ (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind alignment:(NSRectAlignment)alignment;
+ (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind alignment:(NSRectAlignment)alignment absoluteOffset:(CGPoint)absoluteOffset;
+ (NSCollectionLayoutBoundarySupplementaryItem)itemWithLayoutSize:(id)a3;
+ (NSCollectionLayoutBoundarySupplementaryItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4;
- (BOOL)extendsBoundary;
- (BOOL)isEqual:(id)a3;
- (BOOL)pinToVisibleBounds;
- (CGPoint)offset;
- (NSCollectionLayoutBoundarySupplementaryItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 elementKind:(id)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8 alignment:(int64_t)a9 offset:(CGPoint)a10 extendsBoundary:(BOOL)a11 pinToVisibleBounds:(BOOL)a12;
- (NSRectAlignment)alignment;
- (id)copyWithContainerAnchor:(id)a3 itemAnchor:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_pinningZIndex;
- (void)_setPinningZIndex:(int64_t)a3;
- (void)setExtendsBoundary:(BOOL)extendsBoundary;
- (void)setPinToVisibleBounds:(BOOL)pinToVisibleBounds;
- (void)setPinningZIndex:(int64_t)a3;
@end

@implementation NSCollectionLayoutBoundarySupplementaryItem

- (NSCollectionLayoutBoundarySupplementaryItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 elementKind:(id)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8 alignment:(int64_t)a9 offset:(CGPoint)a10 extendsBoundary:(BOOL)a11 pinToVisibleBounds:(BOOL)a12
{
  CGFloat y = a10.y;
  CGFloat x = a10.x;
  v16.receiver = self;
  v16.super_class = (Class)NSCollectionLayoutBoundarySupplementaryItem;
  result = -[NSCollectionLayoutSupplementaryItem initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:](&v16, sel_initWithSize_contentInsets_elementKind_containerAnchor_itemAnchor_zIndex_, a3, a5, a6, a7, a8, a4.top, a4.leading, a4.bottom, a4.trailing);
  if (result)
  {
    result->_alignment = a9;
    result->_offset.CGFloat x = x;
    result->_offset.CGFloat y = y;
    result->_extendsBoundarCGFloat y = a11;
    result->_pinToVisibleBounds = a12;
    result->_pinningZIndeCGFloat x = 0x8000000000000001;
  }
  return result;
}

+ (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind alignment:(NSRectAlignment)alignment absoluteOffset:(CGPoint)absoluteOffset
{
  double y = absoluteOffset.y;
  double x = absoluteOffset.x;
  v10 = elementKind;
  v11 = layoutSize;
  LOWORD(v14) = 1;
  v12 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:alignment:offset:extendsBoundary:pinToVisibleBounds:", v11, v10, 0, 0, 1, alignment, 0.0, 0.0, 0.0, 0.0, x, y, v14);

  return (NSCollectionLayoutBoundarySupplementaryItem *)v12;
}

- (id)copyWithContainerAnchor:(id)a3 itemAnchor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[(NSCollectionLayoutBoundarySupplementaryItem *)self copy];
  [v8 setContainerAnchor:v7];

  [v8 setItemAnchor:v6];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSCollectionLayoutBoundarySupplementaryItem *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  NSRectAlignment v5 = [(NSCollectionLayoutBoundarySupplementaryItem *)self alignment];
  if (v5 != [(NSCollectionLayoutBoundarySupplementaryItem *)v4 alignment]) {
    goto LABEL_10;
  }
  [(NSCollectionLayoutBoundarySupplementaryItem *)self offset];
  double v7 = v6;
  double v9 = v8;
  [(NSCollectionLayoutBoundarySupplementaryItem *)v4 offset];
  BOOL v11 = 0;
  if (v7 == v12 && v9 == v10)
  {
    BOOL v13 = [(NSCollectionLayoutBoundarySupplementaryItem *)self extendsBoundary];
    if (v13 == [(NSCollectionLayoutBoundarySupplementaryItem *)v4 extendsBoundary])
    {
      BOOL v14 = [(NSCollectionLayoutBoundarySupplementaryItem *)self pinToVisibleBounds];
      if (v14 == [(NSCollectionLayoutBoundarySupplementaryItem *)v4 pinToVisibleBounds])
      {
        int64_t v15 = [(NSCollectionLayoutBoundarySupplementaryItem *)self _pinningZIndex];
        if (v15 == [(NSCollectionLayoutBoundarySupplementaryItem *)v4 _pinningZIndex])
        {
          v17.receiver = self;
          v17.super_class = (Class)NSCollectionLayoutBoundarySupplementaryItem;
          BOOL v11 = [(NSCollectionLayoutSupplementaryItem *)&v17 isEqual:v4];
          goto LABEL_12;
        }
      }
    }
LABEL_10:
    BOOL v11 = 0;
  }
LABEL_12:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  NSRectAlignment v5 = [(NSCollectionLayoutItem *)self size];
  [(NSCollectionLayoutItem *)self contentInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  BOOL v14 = [(NSCollectionLayoutSupplementaryItem *)self elementKind];
  int64_t v15 = [(NSCollectionLayoutSupplementaryItem *)self containerAnchor];
  objc_super v16 = [(NSCollectionLayoutSupplementaryItem *)self itemAnchor];
  NSInteger v17 = [(NSCollectionLayoutSupplementaryItem *)self zIndex];
  NSRectAlignment v18 = [(NSCollectionLayoutBoundarySupplementaryItem *)self alignment];
  [(NSCollectionLayoutBoundarySupplementaryItem *)self offset];
  double v20 = v19;
  double v22 = v21;
  BOOL v23 = [(NSCollectionLayoutBoundarySupplementaryItem *)self extendsBoundary];
  BYTE1(v26) = [(NSCollectionLayoutBoundarySupplementaryItem *)self pinToVisibleBounds];
  LOBYTE(v26) = v23;
  v24 = objc_msgSend(v4, "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:alignment:offset:extendsBoundary:pinToVisibleBounds:", v5, v14, v15, v16, v17, v18, v7, v9, v11, v13, v20, v22, v26);

  v24[19] = self->_pinningZIndex;
  return v24;
}

- (BOOL)extendsBoundary
{
  return self->_extendsBoundary;
}

- (NSRectAlignment)alignment
{
  return self->_alignment;
}

- (BOOL)pinToVisibleBounds
{
  return self->_pinToVisibleBounds;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)_pinningZIndex
{
  if (self->_pinningZIndex == 0x8000000000000001) {
    return [(NSCollectionLayoutSupplementaryItem *)self zIndex];
  }
  else {
    return self->_pinningZIndex;
  }
}

+ (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind alignment:(NSRectAlignment)alignment
{
  return (NSCollectionLayoutBoundarySupplementaryItem *)objc_msgSend(a1, "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", layoutSize, elementKind, alignment, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
}

- (void)setPinToVisibleBounds:(BOOL)pinToVisibleBounds
{
  self->_pinToVisibleBounds = pinToVisibleBounds;
}

- (void)setExtendsBoundary:(BOOL)extendsBoundary
{
  self->_extendsBoundardouble y = extendsBoundary;
}

- (void)_setPinningZIndex:(int64_t)a3
{
  self->_pinningZIndedouble x = a3;
}

+ (NSCollectionLayoutBoundarySupplementaryItem)itemWithLayoutSize:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"NSCollectionLayoutBoundarySupplementaryItem must be initialized with an initializer accepting an element kind" userInfo:0];
  objc_exception_throw(v4);
}

+ (NSCollectionLayoutBoundarySupplementaryItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"NSCollectionLayoutBoundarySupplementaryItem must be initialized with an initializer accepting an element kind" userInfo:0];
  objc_exception_throw(v7);
}

- (void)setPinningZIndex:(int64_t)a3
{
  self->_pinningZIndedouble x = a3;
}

@end
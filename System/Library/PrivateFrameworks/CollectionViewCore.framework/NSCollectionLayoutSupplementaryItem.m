@interface NSCollectionLayoutSupplementaryItem
+ (NSCollectionLayoutSupplementaryItem)itemWithLayoutSize:(id)a3;
+ (NSCollectionLayoutSupplementaryItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4;
+ (NSCollectionLayoutSupplementaryItem)supplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind containerAnchor:(NSCollectionLayoutAnchor *)containerAnchor;
+ (NSCollectionLayoutSupplementaryItem)supplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind containerAnchor:(NSCollectionLayoutAnchor *)containerAnchor itemAnchor:(NSCollectionLayoutAnchor *)itemAnchor;
- (BOOL)canAdjustContentSize;
- (BOOL)isEqual:(id)a3;
- (CVCDirectionalEdgeInsets)_effectiveContentInsets;
- (NSCollectionLayoutAnchor)containerAnchor;
- (NSCollectionLayoutAnchor)itemAnchor;
- (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItem;
- (NSCollectionLayoutDecorationItem)decorationItem;
- (NSCollectionLayoutSupplementaryItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 elementKind:(id)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8;
- (NSCollectionLayoutSupplementaryItem)supplementaryItem;
- (NSInteger)zIndex;
- (NSString)elementKind;
- (id)_externalDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCanAdjustContentSize:(BOOL)a3;
- (void)setContainerAnchor:(id)a3;
- (void)setElementKind:(id)a3;
- (void)setItemAnchor:(id)a3;
- (void)setZIndex:(NSInteger)zIndex;
@end

@implementation NSCollectionLayoutSupplementaryItem

- (NSCollectionLayoutSupplementaryItem)initWithSize:(id)a3 contentInsets:(CVCDirectionalEdgeInsets)a4 elementKind:(id)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8
{
  double trailing = a4.trailing;
  double bottom = a4.bottom;
  double leading = a4.leading;
  double top = a4.top;
  id v25 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a3;
  v20 = +[NSCollectionLayoutEdgeSpacing defaultSpacing];
  v21 = [MEMORY[0x263F08C38] UUID];
  v26.receiver = self;
  v26.super_class = (Class)NSCollectionLayoutSupplementaryItem;
  v22 = -[NSCollectionLayoutItem initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:](&v26, sel_initWithSize_contentInsets_edgeSpacing_supplementaryItems_decorationItems_name_identifier_, v19, v20, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], 0, v21, top, leading, bottom, trailing);

  if (v22)
  {
    objc_storeStrong((id *)&v22->_elementKind, a5);
    objc_storeStrong((id *)&v22->_containerAnchor, a6);
    objc_storeStrong((id *)&v22->_itemAnchor, a7);
    v22->_zIndex = a8;
  }

  return v22;
}

- (NSCollectionLayoutDecorationItem)decorationItem
{
  return 0;
}

- (void)setItemAnchor:(id)a3
{
}

- (void)setContainerAnchor:(id)a3
{
}

- (NSString)elementKind
{
  return self->_elementKind;
}

- (NSInteger)zIndex
{
  return self->_zIndex;
}

- (NSCollectionLayoutAnchor)itemAnchor
{
  return self->_itemAnchor;
}

- (NSCollectionLayoutAnchor)containerAnchor
{
  return self->_containerAnchor;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSCollectionLayoutSupplementaryItem *)a3;
  if (self == v4)
  {
    BOOL v20 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  NSInteger v5 = [(NSCollectionLayoutSupplementaryItem *)self zIndex];
  if (v5 != [(NSCollectionLayoutSupplementaryItem *)v4 zIndex]) {
    goto LABEL_12;
  }
  v6 = [(NSCollectionLayoutSupplementaryItem *)self elementKind];
  v7 = [(NSCollectionLayoutSupplementaryItem *)v4 elementKind];
  int v8 = [v6 isEqualToString:v7];

  if (!v8) {
    goto LABEL_12;
  }
  [(NSCollectionLayoutItem *)self contentInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(NSCollectionLayoutItem *)v4 contentInsets];
  BOOL v20 = 0;
  if (v12 == v21 && v10 == v17 && v16 == v19 && v14 == v18)
  {
    v22 = [(NSCollectionLayoutSupplementaryItem *)self containerAnchor];
    v23 = [(NSCollectionLayoutSupplementaryItem *)v4 containerAnchor];
    int v24 = __objectEqual(v22, v23);

    if (v24)
    {
      id v25 = [(NSCollectionLayoutSupplementaryItem *)self itemAnchor];
      objc_super v26 = [(NSCollectionLayoutSupplementaryItem *)v4 itemAnchor];
      int v27 = __objectEqual(v25, v26);

      if (v27)
      {
        v29.receiver = self;
        v29.super_class = (Class)NSCollectionLayoutSupplementaryItem;
        BOOL v20 = [(NSCollectionLayoutItem *)&v29 isEqual:v4];
        goto LABEL_14;
      }
    }
LABEL_12:
    BOOL v20 = 0;
  }
LABEL_14:

  return v20;
}

- (CVCDirectionalEdgeInsets)_effectiveContentInsets
{
  v6.receiver = self;
  v6.super_class = (Class)NSCollectionLayoutSupplementaryItem;
  [(NSCollectionLayoutItem *)&v6 _effectiveContentInsets];
  result.double trailing = v5;
  result.double bottom = v4;
  result.double leading = v3;
  result.double top = v2;
  return result;
}

- (void)setZIndex:(NSInteger)zIndex
{
  self->_zIndex = zIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAnchor, 0);
  objc_storeStrong((id *)&self->_containerAnchor, 0);
  objc_storeStrong((id *)&self->_elementKind, 0);
}

+ (NSCollectionLayoutSupplementaryItem)supplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind containerAnchor:(NSCollectionLayoutAnchor *)containerAnchor
{
  int v8 = containerAnchor;
  double v9 = elementKind;
  double v10 = layoutSize;
  double v11 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:", v10, v9, v8, 0, 1, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutSupplementaryItem *)v11;
}

+ (NSCollectionLayoutSupplementaryItem)supplementaryItemWithLayoutSize:(NSCollectionLayoutSize *)layoutSize elementKind:(NSString *)elementKind containerAnchor:(NSCollectionLayoutAnchor *)containerAnchor itemAnchor:(NSCollectionLayoutAnchor *)itemAnchor
{
  double v10 = itemAnchor;
  double v11 = containerAnchor;
  double v12 = elementKind;
  double v13 = layoutSize;
  double v14 = objc_msgSend(objc_alloc((Class)a1), "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:", v13, v12, v11, v10, 1, 0.0, 0.0, 0.0, 0.0);

  return (NSCollectionLayoutSupplementaryItem *)v14;
}

+ (NSCollectionLayoutSupplementaryItem)itemWithLayoutSize:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"NSCollectionLayoutSupplementaryItem must be initialized with an initializer accepting an element kind" userInfo:0];
  objc_exception_throw(v4);
}

+ (NSCollectionLayoutSupplementaryItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"NSCollectionLayoutSupplementaryItem must be initialized with an initializer accepting an element kind" userInfo:0];
  objc_exception_throw(v7);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NSCollectionLayoutItem *)self size];
  [(NSCollectionLayoutItem *)self contentInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(NSCollectionLayoutSupplementaryItem *)self elementKind];
  double v15 = [(NSCollectionLayoutSupplementaryItem *)self containerAnchor];
  double v16 = [(NSCollectionLayoutSupplementaryItem *)self itemAnchor];
  double v17 = objc_msgSend(v4, "initWithSize:contentInsets:elementKind:containerAnchor:itemAnchor:zIndex:", v5, v14, v15, v16, -[NSCollectionLayoutSupplementaryItem zIndex](self, "zIndex"), v7, v9, v11, v13);

  return v17;
}

- (id)_externalDescription
{
  id v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSCollectionLayoutItem *)self layoutSize];
  double v6 = [(NSCollectionLayoutSupplementaryItem *)self elementKind];
  double v7 = [v3 stringWithFormat:@"<%@ %p size: %@; elementKind: \"%@\";", v4, self, v5, v6];

  [(NSCollectionLayoutItem *)self contentInsets];
  if (v11 != 0.0 || v8 != 0.0 || v10 != 0.0 || v9 != 0.0)
  {
    [(NSCollectionLayoutItem *)self contentInsets];
    double v16 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%.*g, %.*g, %.*g, %.*g}", 17, v12, 17, v13, 17, v14, 17, v15);
    [v7 appendFormat:@"\n\tcontentInsets=%@", v16];
  }
  double v17 = [(NSCollectionLayoutSupplementaryItem *)self containerAnchor];

  if (v17)
  {
    double v18 = [(NSCollectionLayoutSupplementaryItem *)self containerAnchor];
    [v7 appendFormat:@"\n\tcontainerAnchor=%@", v18];
  }
  double v19 = [(NSCollectionLayoutSupplementaryItem *)self itemAnchor];

  if (v19)
  {
    BOOL v20 = [(NSCollectionLayoutSupplementaryItem *)self itemAnchor];
    [v7 appendFormat:@"\n\titemAnchor=%@", v20];
  }
  [v7 appendString:@">"];
  return v7;
}

- (NSCollectionLayoutSupplementaryItem)supplementaryItem
{
  if ([(NSCollectionLayoutSupplementaryItem *)self isMemberOfClass:objc_opt_class()]) {
    id v3 = self;
  }
  else {
    id v3 = 0;
  }
  return v3;
}

- (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItem
{
  return 0;
}

- (void)setElementKind:(id)a3
{
}

- (BOOL)canAdjustContentSize
{
  return self->_canAdjustContentSize;
}

- (void)setCanAdjustContentSize:(BOOL)a3
{
  self->_canAdjustContentSize = a3;
}

@end
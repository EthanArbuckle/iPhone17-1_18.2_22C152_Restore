@interface NSCollectionLayoutDecorationItem
+ (NSCollectionLayoutDecorationItem)backgroundDecorationItemWithElementKind:(NSString *)elementKind;
+ (NSCollectionLayoutDecorationItem)decorationItemWithSize:(id)a3 elementKind:(id)a4 containerAnchor:(id)a5;
+ (NSCollectionLayoutDecorationItem)itemWithLayoutSize:(id)a3;
+ (NSCollectionLayoutDecorationItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4;
- (BOOL)isBackgroundDecoration;
- (BOOL)isEqual:(id)a3;
- (CVCDirectionalEdgeInsets)_effectiveContentInsets;
- (Class)_registrationViewClass;
- (NSCollectionLayoutAnchor)containerAnchor;
- (NSCollectionLayoutAnchor)itemAnchor;
- (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItem;
- (NSCollectionLayoutDecorationItem)initWithElementKind:(id)a3 size:(id)a4 contentInsets:(CVCDirectionalEdgeInsets)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8 registrationViewClass:(Class)a9 isBackgroundDecoration:(BOOL)a10;
- (NSCollectionLayoutSupplementaryItem)supplementaryItem;
- (NSInteger)zIndex;
- (NSString)elementKind;
- (id)_externalDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setRegistrationViewClass:(Class)a3;
- (void)setContainerAnchor:(id)a3;
- (void)setElementKind:(id)a3;
- (void)setIsBackgroundDecoration:(BOOL)a3;
- (void)setItemAnchor:(id)a3;
- (void)setZIndex:(NSInteger)zIndex;
@end

@implementation NSCollectionLayoutDecorationItem

- (NSCollectionLayoutBoundarySupplementaryItem)boundarySupplementaryItem
{
  return 0;
}

- (CVCDirectionalEdgeInsets)_effectiveContentInsets
{
  v6.receiver = self;
  v6.super_class = (Class)NSCollectionLayoutDecorationItem;
  [(NSCollectionLayoutItem *)&v6 _effectiveContentInsets];
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__registrationViewClass, 0);
  objc_storeStrong((id *)&self->_itemAnchor, 0);
  objc_storeStrong((id *)&self->_containerAnchor, 0);
  objc_storeStrong((id *)&self->_elementKind, 0);
}

- (Class)_registrationViewClass
{
  return self->__registrationViewClass;
}

- (void)setZIndex:(NSInteger)zIndex
{
  self->_zIndex = zIndex;
}

- (void)_setRegistrationViewClass:(Class)a3
{
}

+ (NSCollectionLayoutDecorationItem)backgroundDecorationItemWithElementKind:(NSString *)elementKind
{
  double v4 = elementKind;
  id v5 = objc_alloc((Class)a1);
  objc_super v6 = +[NSCollectionLayoutSize sizeWithContainerSize];
  LOBYTE(v9) = 1;
  v7 = objc_msgSend(v5, "initWithElementKind:size:contentInsets:containerAnchor:itemAnchor:zIndex:registrationViewClass:isBackgroundDecoration:", v4, v6, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, v9);

  return (NSCollectionLayoutDecorationItem *)v7;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (NSCollectionLayoutDecorationItem *)a3;
  if (self == v4)
  {
    BOOL v20 = 1;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  int64_t zIndex = self->_zIndex;
  if (zIndex != [(NSCollectionLayoutDecorationItem *)v4 zIndex]) {
    goto LABEL_13;
  }
  objc_super v6 = [(NSCollectionLayoutDecorationItem *)self elementKind];
  v7 = [(NSCollectionLayoutDecorationItem *)v4 elementKind];
  int v8 = [v6 isEqualToString:v7];

  if (!v8) {
    goto LABEL_13;
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
    BOOL v22 = [(NSCollectionLayoutDecorationItem *)self isBackgroundDecoration];
    if (v22 == [(NSCollectionLayoutDecorationItem *)v4 isBackgroundDecoration])
    {
      v23 = [(NSCollectionLayoutDecorationItem *)self containerAnchor];
      v24 = [(NSCollectionLayoutDecorationItem *)v4 containerAnchor];
      int v25 = __objectEqual(v23, v24);

      if (v25)
      {
        v26 = [(NSCollectionLayoutDecorationItem *)self itemAnchor];
        v27 = [(NSCollectionLayoutDecorationItem *)v4 itemAnchor];
        int v28 = __objectEqual(v26, v27);

        if (v28)
        {
          v30.receiver = self;
          v30.super_class = (Class)NSCollectionLayoutDecorationItem;
          BOOL v20 = [(NSCollectionLayoutItem *)&v30 isEqual:v4];
          goto LABEL_15;
        }
      }
    }
LABEL_13:
    BOOL v20 = 0;
  }
LABEL_15:

  return v20;
}

- (NSString)elementKind
{
  return self->_elementKind;
}

- (BOOL)isBackgroundDecoration
{
  return self->_isBackgroundDecoration;
}

- (NSCollectionLayoutAnchor)itemAnchor
{
  return self->_itemAnchor;
}

- (NSCollectionLayoutAnchor)containerAnchor
{
  return self->_containerAnchor;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(NSCollectionLayoutDecorationItem *)self elementKind];
  objc_super v6 = [(NSCollectionLayoutItem *)self size];
  [(NSCollectionLayoutItem *)self contentInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(NSCollectionLayoutDecorationItem *)self containerAnchor];
  double v16 = [(NSCollectionLayoutDecorationItem *)self itemAnchor];
  NSInteger v17 = [(NSCollectionLayoutDecorationItem *)self zIndex];
  double v18 = [(NSCollectionLayoutDecorationItem *)self _registrationViewClass];
  LOBYTE(v21) = [(NSCollectionLayoutDecorationItem *)self isBackgroundDecoration];
  double v19 = objc_msgSend(v4, "initWithElementKind:size:contentInsets:containerAnchor:itemAnchor:zIndex:registrationViewClass:isBackgroundDecoration:", v5, v6, v15, v16, v17, v18, v8, v10, v12, v14, v21);

  return v19;
}

- (NSInteger)zIndex
{
  return self->_zIndex;
}

+ (NSCollectionLayoutDecorationItem)decorationItemWithSize:(id)a3 elementKind:(id)a4 containerAnchor:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  LOBYTE(v13) = 0;
  double v11 = objc_msgSend(objc_alloc((Class)a1), "initWithElementKind:size:contentInsets:containerAnchor:itemAnchor:zIndex:registrationViewClass:isBackgroundDecoration:", v9, v10, v8, 0, 1, 0, 0.0, 0.0, 0.0, 0.0, v13);

  return (NSCollectionLayoutDecorationItem *)v11;
}

- (NSCollectionLayoutDecorationItem)initWithElementKind:(id)a3 size:(id)a4 contentInsets:(CVCDirectionalEdgeInsets)a5 containerAnchor:(id)a6 itemAnchor:(id)a7 zIndex:(int64_t)a8 registrationViewClass:(Class)a9 isBackgroundDecoration:(BOOL)a10
{
  double trailing = a5.trailing;
  double bottom = a5.bottom;
  double leading = a5.leading;
  double top = a5.top;
  id v20 = a3;
  id v21 = a6;
  id v22 = a7;
  v23 = (void *)MEMORY[0x263F08C38];
  id v24 = a4;
  int v25 = [v23 UUID];
  v34.receiver = self;
  v34.super_class = (Class)NSCollectionLayoutDecorationItem;
  v26 = -[NSCollectionLayoutItem initWithSize:contentInsets:edgeSpacing:supplementaryItems:decorationItems:name:identifier:](&v34, sel_initWithSize_contentInsets_edgeSpacing_supplementaryItems_decorationItems_name_identifier_, v24, 0, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], 0, v25, top, leading, bottom, trailing);

  if (v26)
  {
    uint64_t v27 = [v20 copy];
    elementKind = v26->_elementKind;
    v26->_elementKind = (NSString *)v27;

    uint64_t v29 = [v21 copy];
    containerAnchor = v26->_containerAnchor;
    v26->_containerAnchor = (NSCollectionLayoutAnchor *)v29;

    uint64_t v31 = [v22 copy];
    itemAnchor = v26->_itemAnchor;
    v26->_itemAnchor = (NSCollectionLayoutAnchor *)v31;

    v26->_int64_t zIndex = a8;
    v26->_isBackgroundDecoration = a10;
    objc_storeStrong((id *)&v26->__registrationViewClass, a9);
  }

  return v26;
}

+ (NSCollectionLayoutDecorationItem)itemWithLayoutSize:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"NSCollectionLayoutDecorationItem must be initialized with the .background(elementKind:)/+backgroundDecorationItemWithElementKind: initializer" userInfo:0];
  objc_exception_throw(v4);
}

+ (NSCollectionLayoutDecorationItem)itemWithLayoutSize:(id)a3 supplementaryItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"NSCollectionLayoutDecorationItem must be initialized with the .background(elementKind:)/+backgroundDecorationItemWithElementKind: initializer" userInfo:0];
  objc_exception_throw(v7);
}

- (id)_externalDescription
{
  id v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = objc_opt_class();
  id v5 = [(NSCollectionLayoutItem *)self layoutSize];
  id v6 = [(NSCollectionLayoutDecorationItem *)self elementKind];
  id v7 = [v3 stringWithFormat:@"<%@ %p size: %@; elementKind: \"%@\";", v4, self, v5, v6];

  [(NSCollectionLayoutItem *)self contentInsets];
  if (v11 != 0.0 || v8 != 0.0 || v10 != 0.0 || v9 != 0.0)
  {
    [(NSCollectionLayoutItem *)self contentInsets];
    double v16 = (__CFString *)CFStringCreateWithFormat(0, 0, @"{%.*g, %.*g, %.*g, %.*g}", 17, v12, 17, v13, 17, v14, 17, v15);
    [v7 appendFormat:@"\n\tcontentInsets=%@", v16];
  }
  NSInteger v17 = [(NSCollectionLayoutDecorationItem *)self containerAnchor];

  if (v17)
  {
    double v18 = [(NSCollectionLayoutDecorationItem *)self containerAnchor];
    [v7 appendFormat:@"\n\tcontainerAnchor=%@", v18];
  }
  double v19 = [(NSCollectionLayoutDecorationItem *)self itemAnchor];

  if (v19)
  {
    id v20 = [(NSCollectionLayoutDecorationItem *)self itemAnchor];
    [v7 appendFormat:@"\n\titemAnchor=%@", v20];
  }
  [v7 appendString:@">"];
  return v7;
}

- (NSCollectionLayoutSupplementaryItem)supplementaryItem
{
  return 0;
}

- (void)setElementKind:(id)a3
{
}

- (void)setContainerAnchor:(id)a3
{
}

- (void)setItemAnchor:(id)a3
{
}

- (void)setIsBackgroundDecoration:(BOOL)a3
{
  self->_isBackgroundDecoration = a3;
}

@end
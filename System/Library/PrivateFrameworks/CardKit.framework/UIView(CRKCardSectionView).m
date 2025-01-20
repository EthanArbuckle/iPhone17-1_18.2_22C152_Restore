@interface UIView(CRKCardSectionView)
+ (double)sizeThatFitsCardSection:()CRKCardSectionView boundingSize:;
- (id)cardSectionViewIdentifier;
- (id)composedSuperview;
- (void)removeFromComposedSuperview;
- (void)setCardSectionViewIdentifier:()CRKCardSectionView;
- (void)setComposedSuperview:()CRKCardSectionView;
@end

@implementation UIView(CRKCardSectionView)

- (void)setCardSectionViewIdentifier:()CRKCardSectionView
{
}

- (id)cardSectionViewIdentifier
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = objc_getAssociatedObject(a1, sel_cardSectionViewIdentifier);
  if (!v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    v2 = [v3 UUIDString];

    v4 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      v8 = a1;
      __int16 v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_224F73000, v4, OS_LOG_TYPE_INFO, "Card section view %@ does not have a card section view identifier. This is a requirement. Category CRKCardSectionView on CRKUINSView is setting one (%@) via an objc associated object on the client's behalf as a workaround", (uint8_t *)&v7, 0x16u);
    }
    [a1 setCardSectionViewIdentifier:v2];
  }
  id v5 = v2;

  return v5;
}

- (void)setComposedSuperview:()CRKCardSectionView
{
}

- (id)composedSuperview
{
  v2 = objc_getAssociatedObject(a1, sel_composedSuperview);
  v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    objc_setAssociatedObject(a1, sel_composedSuperview, 0, 0);
  }

  return v3;
}

- (void)removeFromComposedSuperview
{
  id v2 = [a1 composedSuperview];
  [v2 cardSectionSubviewWantsToBeRemovedFromHierarchy:a1];
}

+ (double)sizeThatFitsCardSection:()CRKCardSectionView boundingSize:
{
  id v5 = objc_alloc_init(a1);
  objc_msgSend(v5, "sizeThatFits:", a2, a3);
  double v7 = v6;

  return v7;
}

@end
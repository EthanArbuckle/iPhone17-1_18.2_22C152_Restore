@interface AVPlayerItem(MPAVItemAdditions)
- (id)MPAVItem;
- (void)setMPAVItem:()MPAVItemAdditions;
@end

@implementation AVPlayerItem(MPAVItemAdditions)

- (void)setMPAVItem:()MPAVItemAdditions
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__AVPlayerItem_MPAVItemAdditions__setMPAVItem___block_invoke;
  v6[3] = &unk_1E57EE058;
  objc_copyWeak(&v7, &location);
  v5 = (void *)MEMORY[0x19971E0F0](v6);
  objc_setAssociatedObject(a1, 0, v5, (void *)1);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)MPAVItem
{
  uint64_t v1 = objc_getAssociatedObject(a1, 0);
  v2 = (void *)v1;
  if (v1)
  {
    v3 = (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
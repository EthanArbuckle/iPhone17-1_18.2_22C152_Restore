@interface SendMenuDismissingCollectionViewLayout
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
@end

@implementation SendMenuDismissingCollectionViewLayout

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return sub_18F4CFE70(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18F4CFC88);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  return sub_18F4D0978(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t (*)(double, double, double, double))sub_18F4CFF78);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_18F7B6410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B63E0();
  v8 = self;
  v9 = (void *)sub_18F7B63D0();
  id v10 = [(SendMenuDismissingCollectionViewLayout *)v8 layoutAttributesForItemAtIndexPath:v9];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v10;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v3 = sub_18F7B6410();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B63E0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return 0;
}

@end
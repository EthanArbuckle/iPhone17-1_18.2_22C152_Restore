@interface GKMultiplayerViewControllerLayout
+ (UIEdgeInsets)minimumContentInsetIn:(id)a3;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC12GameCenterUI33GKMultiplayerViewControllerLayout)init;
- (_TtC12GameCenterUI33GKMultiplayerViewControllerLayout)initWithCoder:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (int64_t)cellLayoutMode;
- (void)prepareLayout;
@end

@implementation GKMultiplayerViewControllerLayout

- (_TtC12GameCenterUI33GKMultiplayerViewControllerLayout)init
{
  return (_TtC12GameCenterUI33GKMultiplayerViewControllerLayout *)GKMultiplayerViewControllerLayout.init()();
}

- (_TtC12GameCenterUI33GKMultiplayerViewControllerLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF461CF0();
}

- (void)prepareLayout
{
  v2 = self;
  sub_1AF461D80();
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_1AF4620EC();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (int64_t)cellLayoutMode
{
  v2 = self;
  int64_t v3 = sub_1AF46226C();

  return v3;
}

+ (UIEdgeInsets)minimumContentInsetIn:(id)a3
{
  id v3 = a3;
  double v4 = static GKMultiplayerViewControllerLayout.minimumContentInset(in:)(v3);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  char v8 = sub_1AF4624BC(x, y, width, height);

  return v8 & 1;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_1AF7A9A60();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  char v8 = self;
  id v9 = sub_1AF4625EC();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

@end
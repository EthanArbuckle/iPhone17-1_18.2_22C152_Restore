@interface CollectionViewLayoutContainer
- (CGSize)contentSize;
- (CGSize)effectiveContentSize;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSDirectionalEdgeInsets)effectiveContentInsets;
- (_TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94429CollectionViewLayoutContainer)init;
- (void)setContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setEffectiveContentInsets:(NSDirectionalEdgeInsets)a3;
@end

@implementation CollectionViewLayoutContainer

- (CGSize)contentSize
{
  double v2 = sub_1AF537D8C();
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
}

- (CGSize)effectiveContentSize
{
  double v2 = self;
  sub_1AF537E1C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double v2 = sub_1AF537E68();
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
}

- (NSDirectionalEdgeInsets)effectiveContentInsets
{
  double v2 = sub_1AF537EC8();
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setEffectiveContentInsets:(NSDirectionalEdgeInsets)a3
{
}

- (_TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94429CollectionViewLayoutContainer)init
{
}

@end
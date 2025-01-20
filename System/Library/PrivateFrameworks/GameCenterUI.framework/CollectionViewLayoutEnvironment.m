@interface CollectionViewLayoutEnvironment
- (NSCollectionLayoutContainer)container;
- (UITraitCollection)traitCollection;
- (_TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94431CollectionViewLayoutEnvironment)init;
- (void)setContainer:(id)a3;
- (void)setTraitCollection:(id)a3;
@end

@implementation CollectionViewLayoutEnvironment

- (NSCollectionLayoutContainer)container
{
  v2 = (void *)sub_1AF537A54();

  return (NSCollectionLayoutContainer *)v2;
}

- (void)setContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AF537AC4((uint64_t)a3);
}

- (UITraitCollection)traitCollection
{
  id v2 = sub_1AF537B10();

  return (UITraitCollection *)v2;
}

- (void)setTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF537B7C((uint64_t)v4);
}

- (_TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94431CollectionViewLayoutEnvironment)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12GameCenterUIP33_70BCE0F81E66D9FA90EE8BB9B414A94431CollectionViewLayoutEnvironment_traitCollection);
}

@end
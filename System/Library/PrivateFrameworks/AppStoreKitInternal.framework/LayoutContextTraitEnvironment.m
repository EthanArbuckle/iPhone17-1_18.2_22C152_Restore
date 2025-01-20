@interface LayoutContextTraitEnvironment
- (UITraitCollection)traitCollection;
- (_TtC19AppStoreKitInternal29LayoutContextTraitEnvironment)init;
@end

@implementation LayoutContextTraitEnvironment

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal29LayoutContextTraitEnvironment_traitCollection));
}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC19AppStoreKitInternal29LayoutContextTraitEnvironment_traitCollection));
}

- (_TtC19AppStoreKitInternal29LayoutContextTraitEnvironment)init
{
  result = (_TtC19AppStoreKitInternal29LayoutContextTraitEnvironment *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
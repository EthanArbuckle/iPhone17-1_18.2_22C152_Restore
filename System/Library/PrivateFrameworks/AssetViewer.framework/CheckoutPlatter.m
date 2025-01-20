@interface CheckoutPlatter
- (void)applePayButtonPressed;
- (void)contentSizeCategoryDidChange;
@end

@implementation CheckoutPlatter

- (void)applePayButtonPressed
{
  if (MEMORY[0x1E4E5FA30]((char *)self + OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_delegate, a2))
  {
    swift_retain();
    sub_1E28DE6EC();
    swift_release();
    swift_unknownObjectRelease();
  }
}

- (void)contentSizeCategoryDidChange
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11AssetViewer15CheckoutPlatter_traitManager);
  v3 = self;
  swift_retain();
  id v4 = objc_msgSend(v3, sel_currentTraitCollection);
  id v5 = objc_msgSend(v4, sel_preferredContentSizeCategory);

  v6 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = v5;

  sub_1E297DA6C();
  swift_release();
}

@end
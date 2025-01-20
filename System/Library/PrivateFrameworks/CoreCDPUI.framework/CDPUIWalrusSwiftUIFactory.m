@interface CDPUIWalrusSwiftUIFactory
- (CDPUIWalrusSwiftUIFactory)init;
- (id)makeSwiftUIViewWithCdpContext:(id)a3 advancedDataProtectionViewModelDelegate:(id)a4 presentingViewController:(id)a5;
- (void)makeSwiftUIUpsellViewWithCDPContext:(id)a3 urlBag:(id)a4 networkObserver:(id)a5 viewModelDelegate:(id)a6 completion:(id)a7;
@end

@implementation CDPUIWalrusSwiftUIFactory

- (id)makeSwiftUIViewWithCdpContext:(id)a3 advancedDataProtectionViewModelDelegate:(id)a4 presentingViewController:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  v11 = (void *)sub_21880DF98(v8, a4, v9);

  swift_unknownObjectRelease();

  return v11;
}

- (void)makeSwiftUIUpsellViewWithCDPContext:(id)a3 urlBag:(id)a4 networkObserver:(id)a5 viewModelDelegate:(id)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  swift_unknownObjectRetain();
  v17 = self;
  sub_21880E364(v14, v15, v16, (uint64_t)a6, (uint64_t)sub_21880DC98, v13);

  swift_unknownObjectRelease();

  swift_release();
}

- (CDPUIWalrusSwiftUIFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)CDPUIWalrusSwiftUIFactory;
  return [(CDPUIWalrusSwiftUIFactory *)&v3 init];
}

@end
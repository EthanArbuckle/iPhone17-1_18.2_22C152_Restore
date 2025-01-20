@interface AMSUIMessagePalette
- (AMSUIMessagePalette)initWithContentView:(id)a3;
- (AMSUIMessagePalette)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (AMSUIMessagePalette)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 account:(id)a6 context:(id)a7;
- (id)widthProvider;
- (void)enqueueImpressionMetrics;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)setWidthProvider:(id)a3;
@end

@implementation AMSUIMessagePalette

- (AMSUIMessagePalette)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  return (AMSUIMessagePalette *)UIMessagePalette.init(request:bag:account:)(v7, (uint64_t)a4, a5);
}

- (AMSUIMessagePalette)initWithServiceType:(id)a3 placement:(id)a4 bag:(id)a5 account:(id)a6 context:(id)a7
{
  uint64_t v10 = sub_21C2BF2C0();
  uint64_t v12 = v11;
  uint64_t v13 = sub_21C2BF2C0();
  uint64_t v15 = v14;
  if (a7) {
    a7 = (id)sub_21C2BF220();
  }
  swift_unknownObjectRetain();
  id v16 = a6;
  return (AMSUIMessagePalette *)UIMessagePalette.init(serviceType:placement:bag:account:context:)(v10, v12, v13, v15, (uint64_t)a5, a6, (uint64_t)a7);
}

- (id)widthProvider
{
  uint64_t v2 = sub_21C2113E0();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1107296256;
    v6[2] = sub_21C211428;
    v6[3] = &block_descriptor_9;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setWidthProvider:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_21C212534;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_21C211518((uint64_t)v4, v5);
}

- (void)enqueueImpressionMetrics
{
  uint64_t v2 = self;
  sub_21C2116C8();
}

- (AMSUIMessagePalette)initWithContentView:(id)a3
{
  id v3 = a3;
  UIMessagePalette.init(contentView:)();
}

- (void).cxx_destruct
{
  sub_21C21255C((uint64_t)self + OBJC_IVAR___AMSUIMessagePalette_delegate);

  sub_21C20D5FC(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___AMSUIMessagePalette_widthProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___AMSUIMessagePalette_inlineDialogController));
  swift_unknownObjectRelease();
}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  UIMessagePalette.messageViewController(_:didLoad:)((uint64_t)v6, (uint64_t)v7);
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = self;
  UIMessagePalette.messageViewController(_:didUpdate:)((uint64_t)v7, width, height);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  UIMessagePalette.messageViewController(_:didSelectActionWith:)((uint64_t)v6, (uint64_t)v7);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  UIMessagePalette.messageViewController(_:didFailWithError:)((uint64_t)v6, a4);
}

@end
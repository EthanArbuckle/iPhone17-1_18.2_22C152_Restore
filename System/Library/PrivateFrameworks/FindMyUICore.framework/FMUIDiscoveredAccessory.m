@interface FMUIDiscoveredAccessory
- (FMUIDiscoveredAccessory)init;
- (FMUIDiscoveredAccessory)initWithIdentifier:(id)a3 productType:(int64_t)a4 productImage:(id)a5;
@end

@implementation FMUIDiscoveredAccessory

- (FMUIDiscoveredAccessory)initWithIdentifier:(id)a3 productType:(int64_t)a4 productImage:(id)a5
{
  uint64_t v7 = sub_24E861758();
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24E861738();
  id v10 = a5;
  v11 = (FMUIDiscoveredAccessory *)sub_24E6F8950((uint64_t)v9, a4, a5);

  return v11;
}

- (FMUIDiscoveredAccessory)init
{
  result = (FMUIDiscoveredAccessory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___FMUIDiscoveredAccessory_identifier;
  uint64_t v4 = sub_24E861758();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FMUIDiscoveredAccessory_productImage);
}

@end
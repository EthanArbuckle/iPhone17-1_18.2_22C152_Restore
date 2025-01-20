@interface NTKParmesanPigmentProviderCoordinator
- (BOOL)hasAddableCollectionsForSlot:(id)a3;
- (NTKParmesanPigmentProviderCoordinator)init;
- (NTKParmesanPigmentProviderCoordinator)initWithDomain:(id)a3 bundle:(id)a4;
- (NTKParmesanPigmentProviderCoordinator)initWithFace:(id)a3;
- (NTKParmesanPigmentProviderCoordinator)initWithSelectedStyle:(unint64_t)a3;
- (NTKPigmentEditOptionProvider)duotonePigmentProvider;
- (NTKPigmentEditOptionProvider)plainPigmentProvider;
- (NTKPigmentEditOptionProvider)regularPigmentProvider;
- (NTKPigmentEditOptionProvider)timePigmentProvider;
- (NTKPigmentEditOptionProvider)tritonePigmentProvider;
- (id)availableColorsForSlot:(id)a3;
- (id)defaultColorOptionForSlot:(id)a3;
- (id)fulfilledOptionForOption:(id)a3 slot:(id)a4;
- (id)migratedOptionForInvalidOption:(id)a3 slot:(id)a4;
- (id)optionAtIndex:(unint64_t)a3 slot:(id)a4;
- (id)providerForSlot:(id)a3 style:(unint64_t)a4;
- (unint64_t)indexOfOption:(id)a3 slot:(id)a4;
- (unint64_t)numberOfOptionsForSlot:(id)a3;
- (unint64_t)selectedStyle;
- (void)setDuotonePigmentProvider:(id)a3;
- (void)setPlainPigmentProvider:(id)a3;
- (void)setRegularPigmentProvider:(id)a3;
- (void)setSelectedStyle:(unint64_t)a3;
- (void)setTimePigmentProvider:(id)a3;
- (void)setTritonePigmentProvider:(id)a3;
@end

@implementation NTKParmesanPigmentProviderCoordinator

- (unint64_t)selectedStyle
{
  return *(unint64_t *)((char *)&self->super.super.isa
                             + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator_selectedStyle);
}

- (void)setSelectedStyle:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator_selectedStyle) = (Class)a3;
}

- (NTKParmesanPigmentProviderCoordinator)initWithSelectedStyle:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___timePigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___plainPigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___regularPigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___duotonePigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___tritonePigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator_selectedStyle) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ParmesanPigmentProviderCoordinator();
  return [(NTKParmesanPigmentProviderCoordinator *)&v4 init];
}

- (NTKParmesanPigmentProviderCoordinator)initWithFace:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___timePigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___plainPigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___regularPigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___duotonePigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___tritonePigmentProvider) = 0;
  id v4 = a3;

  result = (NTKParmesanPigmentProviderCoordinator *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (NTKParmesanPigmentProviderCoordinator)initWithDomain:(id)a3 bundle:(id)a4
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___timePigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___plainPigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___regularPigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___duotonePigmentProvider) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___tritonePigmentProvider) = 0;
  id v5 = a4;

  result = (NTKParmesanPigmentProviderCoordinator *)sub_246C2D3A8();
  __break(1u);
  return result;
}

- (id)providerForSlot:(id)a3 style:(unint64_t)a4
{
  if (a3)
  {
    uint64_t v6 = sub_246C2CC48();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  v9 = self;
  id v10 = sub_246B997EC(v6, v8, a4);

  swift_bridgeObjectRelease();

  return v10;
}

- (id)defaultColorOptionForSlot:(id)a3
{
  return sub_246B99DDC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_defaultColorOptionForSlot_);
}

- (unint64_t)numberOfOptionsForSlot:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_246C2CC48();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  unint64_t v7 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator_selectedStyle);
  uint64_t v8 = self;
  id v9 = sub_246B997EC(v4, v6, v7);
  if (v6) {
    id v10 = (void *)sub_246C2CC08();
  }
  else {
    id v10 = 0;
  }
  id v11 = objc_msgSend(v9, sel_numberOfOptionsForSlot_, v10);

  swift_bridgeObjectRelease();
  return (unint64_t)v11;
}

- (unint64_t)indexOfOption:(id)a3 slot:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_246C2CC48();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  unint64_t v9 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator_selectedStyle);
  id v10 = a3;
  id v11 = self;
  id v12 = sub_246B997EC(v6, v8, v9);
  if (v8) {
    v13 = (void *)sub_246C2CC08();
  }
  else {
    v13 = 0;
  }
  id v14 = objc_msgSend(v12, sel_indexOfOption_slot_, v10, v13);

  swift_bridgeObjectRelease();
  return (unint64_t)v14;
}

- (id)optionAtIndex:(unint64_t)a3 slot:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_246C2CC48();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  unint64_t v9 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator_selectedStyle);
  id v10 = self;
  id v11 = sub_246B997EC(v6, v8, v9);
  if (v8) {
    id v12 = (void *)sub_246C2CC08();
  }
  else {
    id v12 = 0;
  }
  id v13 = objc_msgSend(v11, sel_optionAtIndex_slot_, a3, v12);

  swift_bridgeObjectRelease();

  return v13;
}

- (id)migratedOptionForInvalidOption:(id)a3 slot:(id)a4
{
  return 0;
}

- (id)availableColorsForSlot:(id)a3
{
  return sub_246B99DDC((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_availableColorsForSlot_);
}

- (id)fulfilledOptionForOption:(id)a3 slot:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_246C2CC48();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  unint64_t v9 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator_selectedStyle);
  id v10 = a3;
  id v11 = self;
  id v12 = sub_246B997EC(v6, v8, v9);
  if (v8) {
    id v13 = (void *)sub_246C2CC08();
  }
  else {
    id v13 = 0;
  }
  id v14 = objc_msgSend(v12, sel_fulfilledOptionForOption_slot_, v10, v13);

  swift_bridgeObjectRelease();

  return v14;
}

- (BOOL)hasAddableCollectionsForSlot:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_246C2CC48();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  unint64_t v7 = *(unint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator_selectedStyle);
  uint64_t v8 = self;
  id v9 = sub_246B997EC(v4, v6, v7);
  if (v6) {
    id v10 = (void *)sub_246C2CC08();
  }
  else {
    id v10 = 0;
  }
  unsigned __int8 v11 = objc_msgSend(v9, sel_hasAddableCollectionsForSlot_, v10);

  swift_bridgeObjectRelease();
  return v11;
}

- (NTKPigmentEditOptionProvider)timePigmentProvider
{
  v2 = self;
  id v3 = sub_246B9A0B0();

  return (NTKPigmentEditOptionProvider *)v3;
}

- (void)setTimePigmentProvider:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___timePigmentProvider);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___timePigmentProvider) = (Class)a3;
  id v3 = a3;
}

- (NTKPigmentEditOptionProvider)plainPigmentProvider
{
  v2 = self;
  id v3 = sub_246B9A150();

  return (NTKPigmentEditOptionProvider *)v3;
}

- (void)setPlainPigmentProvider:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___plainPigmentProvider);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___plainPigmentProvider) = (Class)a3;
  id v3 = a3;
}

- (NTKPigmentEditOptionProvider)regularPigmentProvider
{
  v2 = self;
  id v3 = sub_246B9A250();

  return (NTKPigmentEditOptionProvider *)v3;
}

- (void)setRegularPigmentProvider:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___regularPigmentProvider);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___regularPigmentProvider) = (Class)a3;
  id v3 = a3;
}

- (NTKPigmentEditOptionProvider)duotonePigmentProvider
{
  v2 = self;
  id v3 = sub_246B9A2F0();

  return (NTKPigmentEditOptionProvider *)v3;
}

- (void)setDuotonePigmentProvider:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___duotonePigmentProvider);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___duotonePigmentProvider) = (Class)a3;
  id v3 = a3;
}

- (NTKPigmentEditOptionProvider)tritonePigmentProvider
{
  v2 = self;
  id v3 = sub_246B9A390();

  return (NTKPigmentEditOptionProvider *)v3;
}

- (void)setTritonePigmentProvider:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___tritonePigmentProvider);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___tritonePigmentProvider) = (Class)a3;
  id v3 = a3;
}

- (NTKParmesanPigmentProviderCoordinator)init
{
  result = (NTKParmesanPigmentProviderCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___timePigmentProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___plainPigmentProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___regularPigmentProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___duotonePigmentProvider));
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR___NTKParmesanPigmentProviderCoordinator____lazy_storage___tritonePigmentProvider);
}

@end
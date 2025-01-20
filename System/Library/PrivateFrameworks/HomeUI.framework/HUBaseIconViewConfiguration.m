@interface HUBaseIconViewConfiguration
- (HUBaseIconViewConfiguration)init;
- (HUBaseIconViewConfiguration)initWithItem:(id)a3 appearance:(int64_t)a4;
- (id)copyWithIconDescriptor:(id)a3;
- (int64_t)appearance;
- (int64_t)viewType;
- (void)setAppearance:(int64_t)a3;
@end

@implementation HUBaseIconViewConfiguration

- (int64_t)appearance
{
  return *(void *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 16];
}

- (void)setAppearance:(int64_t)a3
{
  v4 = self;
  BaseIconView.__Configuration.appearance.setter(a3);
}

- (int64_t)viewType
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___HUBaseIconViewConfiguration_configuration);
}

- (HUBaseIconViewConfiguration)initWithItem:(id)a3 appearance:(int64_t)a4
{
  return (HUBaseIconViewConfiguration *)BaseIconView.__Configuration.init(item:appearance:)(a3, a4);
}

- (id)copyWithIconDescriptor:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = BaseIconView.__Configuration.copy(with:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (HUBaseIconViewConfiguration)init
{
  result = (HUBaseIconViewConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v2 = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 104];
  v6[6] = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 88];
  v6[7] = v2;
  uint64_t v7 = *(void *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 120];
  long long v3 = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 40];
  v6[2] = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 24];
  v6[3] = v3;
  long long v4 = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 72];
  v6[4] = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 56];
  v6[5] = v4;
  long long v5 = *(_OWORD *)&self->configuration[OBJC_IVAR___HUBaseIconViewConfiguration_configuration + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___HUBaseIconViewConfiguration_configuration);
  v6[1] = v5;
  sub_1BE498534(v6);
}

@end
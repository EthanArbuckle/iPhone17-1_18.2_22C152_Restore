@interface HUTileCellContentConfiguration
- (BOOL)descriptionHidden;
- (BOOL)prefixHidden;
- (BOOL)titleHidden;
- (HUTileCellContentConfiguration)init;
- (id)updatedForItem:(id)a3;
- (void)setDescriptionHidden:(BOOL)a3;
- (void)setPrefixHidden:(BOOL)a3;
- (void)setTitleHidden:(BOOL)a3;
@end

@implementation HUTileCellContentConfiguration

- (BOOL)prefixHidden
{
  v2 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  return v2[32];
}

- (void)setPrefixHidden:(BOOL)a3
{
  v4 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  v4[32] = a3;
}

- (BOOL)titleHidden
{
  v2 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  return v2[104];
}

- (void)setTitleHidden:(BOOL)a3
{
  v4 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  v4[104] = a3;
}

- (BOOL)descriptionHidden
{
  v2 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  return v2[176];
}

- (void)setDescriptionHidden:(BOOL)a3
{
  v4 = (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration;
  swift_beginAccess();
  v4[176] = a3;
}

- (HUTileCellContentConfiguration)init
{
  sub_1BE502C04((uint64_t)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for __TileCellContentConfiguration();
  return [(HUTileCellContentConfiguration *)&v4 init];
}

- (id)updatedForItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_1BE507660(v4);

  return v6;
}

- (void).cxx_destruct
{
  memcpy(__dst, (char *)self + OBJC_IVAR___HUTileCellContentConfiguration_configuration, sizeof(__dst));
  sub_1BE3B1F80((uint64_t)__dst);
}

@end
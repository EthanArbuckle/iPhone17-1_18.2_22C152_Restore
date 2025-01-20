@interface AXAudioEffectConfiguration
- (BOOL)enabled;
- (NSDictionary)parameters;
- (NSDictionary)properties;
- (NSString)effectName;
- (NSUUID)identifier;
- (void)setEffectName:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setParameters:(id)a3;
- (void)setProperties:(id)a3;
@end

@implementation AXAudioEffectConfiguration

- (NSUUID)identifier
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AXAudioEffectConfiguration_identifier);
  swift_beginAccess();
  return (NSUUID *)*v2;
}

- (void)setIdentifier:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AXAudioEffectConfiguration_identifier);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSString)effectName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_18FD02120();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setEffectName:(id)a3
{
  uint64_t v4 = sub_18FD02150();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___AXAudioEffectConfiguration_effectName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)enabled
{
  v2 = (BOOL *)self + OBJC_IVAR___AXAudioEffectConfiguration_enabled;
  swift_beginAccess();
  return *v2;
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___AXAudioEffectConfiguration_enabled;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSDictionary)properties
{
  return (NSDictionary *)sub_18FCE03A8();
}

- (void)setProperties:(id)a3
{
}

- (NSDictionary)parameters
{
  return (NSDictionary *)sub_18FCE03A8();
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
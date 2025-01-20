@interface BlastDoorAPSQuickRelayPluginRequest
- (BOOL)has_pluginDevMode;
- (BOOL)has_pluginStream;
- (BOOL)pluginDevMode;
- (BlastDoorAPSQuickRelayPluginRequest)init;
- (NSString)description;
- (NSString)pluginConfig;
- (NSString)pluginName;
- (int64_t)pluginStream;
@end

@implementation BlastDoorAPSQuickRelayPluginRequest

- (NSString)description
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1B196A850();
  v2 = (void *)sub_1B196A7E0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)pluginName
{
  return (NSString *)sub_1B17AD0C8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest);
}

- (NSString)pluginConfig
{
  return (NSString *)sub_1B17AD14C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest);
}

- (BOOL)has_pluginStream
{
  return (self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest
                                         + 32] & 1) == 0;
}

- (int64_t)pluginStream
{
  if (self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest + 32]) {
    return 0;
  }
  else {
    return *(void *)&self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest
  }
                                                      + 24];
}

- (BOOL)has_pluginDevMode
{
  return self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest
                                        + 33] != 2;
}

- (BOOL)pluginDevMode
{
  return self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest
                                        + 33] & 1;
}

- (BlastDoorAPSQuickRelayPluginRequest)init
{
  result = (BlastDoorAPSQuickRelayPluginRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end
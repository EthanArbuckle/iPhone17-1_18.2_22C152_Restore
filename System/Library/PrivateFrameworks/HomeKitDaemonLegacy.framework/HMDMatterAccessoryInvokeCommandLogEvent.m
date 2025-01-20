@interface HMDMatterAccessoryInvokeCommandLogEvent
- (HMDMatterAccessoryInvokeCommandLogEvent)initWithHome:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 commandId:(id)a7 fields:(id)a8 source:(unint64_t)a9;
- (HMDMatterAccessoryInvokeCommandLogEvent)initWithHomeUUID:(id)a3;
- (HMDMatterAccessoryInvokeCommandLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)clusterId;
- (NSNumber)commandId;
- (NSNumber)endpointId;
- (NSObject)fields;
- (NSString)coreAnalyticsEventName;
- (id)biomeEventsRepresentationForLogObserver:(id)a3;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)nodeId;
- (unint64_t)source;
@end

@implementation HMDMatterAccessoryInvokeCommandLogEvent

- (id)biomeEventsRepresentationForLogObserver:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s19HomeKitDaemonLegacy36MatterAccessoryInvokeCommandLogEventC25biomeEventsRepresentation03forI8ObserverSaySo11BMStoreData_pGSo08HMDBiomeijO0C_tF_0();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA70F920);
  v6 = (void *)sub_1D5459C48();
  swift_bridgeObjectRelease();
  return v6;
}

- (unint64_t)nodeId
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_nodeId);
}

- (NSNumber)endpointId
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_endpointId));
}

- (NSNumber)clusterId
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_clusterId));
}

- (NSNumber)commandId
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_commandId));
}

- (NSObject)fields
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_fields));
}

- (unint64_t)source
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_source);
}

- (HMDMatterAccessoryInvokeCommandLogEvent)initWithHome:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 commandId:(id)a7 fields:(id)a8 source:(unint64_t)a9
{
  return (HMDMatterAccessoryInvokeCommandLogEvent *)MatterAccessoryInvokeCommandLogEvent.init(home:nodeId:endpointId:clusterId:commandId:fields:source:)(a3, (void *)a4, a5, a6, a7, a8, (void *)a9);
}

- (NSString)coreAnalyticsEventName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D5459BC8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  MatterAccessoryInvokeCommandLogEvent.coreAnalyticsEventDictionary.getter();

  sub_1D4A5D5CC();
  v3 = (void *)sub_1D5459B88();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMDMatterAccessoryInvokeCommandLogEvent)initWithHomeUUID:(id)a3
{
  uint64_t v3 = sub_1D5459878();
  MEMORY[0x1F4188790](v3 - 8);
  sub_1D5459858();
  result = (HMDMatterAccessoryInvokeCommandLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HMDMatterAccessoryInvokeCommandLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  uint64_t v4 = sub_1D5459878();
  MEMORY[0x1F4188790](v4 - 8);
  sub_1D5459858();
  result = (HMDMatterAccessoryInvokeCommandLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_endpointId));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_clusterId));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_commandId));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryInvokeCommandLogEvent_fields));
  swift_bridgeObjectRelease();
}

@end
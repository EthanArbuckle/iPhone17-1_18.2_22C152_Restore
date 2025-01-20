@interface HMDMatterAccessoryWriteAttributeLogEvent
- (HMDMatterAccessoryWriteAttributeLogEvent)initWithHome:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 value:(id)a8 timedWriteTimeout:(id)a9;
- (HMDMatterAccessoryWriteAttributeLogEvent)initWithHomeUUID:(id)a3;
- (HMDMatterAccessoryWriteAttributeLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)attributeId;
- (NSNumber)clusterId;
- (NSNumber)endpointId;
- (NSNumber)timedWriteTimeout;
- (NSObject)value;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)nodeId;
@end

@implementation HMDMatterAccessoryWriteAttributeLogEvent

- (unint64_t)nodeId
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_nodeId);
}

- (NSNumber)endpointId
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_endpointId));
}

- (NSNumber)clusterId
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_clusterId));
}

- (NSNumber)attributeId
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_attributeId));
}

- (NSObject)value
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_value));
}

- (NSNumber)timedWriteTimeout
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_timedWriteTimeout));
}

- (HMDMatterAccessoryWriteAttributeLogEvent)initWithHome:(id)a3 nodeId:(unint64_t)a4 endpointId:(id)a5 clusterId:(id)a6 attributeId:(id)a7 value:(id)a8 timedWriteTimeout:(id)a9
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  return (HMDMatterAccessoryWriteAttributeLogEvent *)MatterAccessoryWriteAttributeLogEvent.init(home:nodeId:endpointId:clusterId:attributeId:value:timedWriteTimeout:)(v14, (void *)a4, v15, v16, v17, v18, a9);
}

- (NSString)coreAnalyticsEventName
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2302DDB90();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  MatterAccessoryWriteAttributeLogEvent.coreAnalyticsEventDictionary.getter();

  sub_22F5357F8();
  v3 = (void *)sub_2302DDAE0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (HMDMatterAccessoryWriteAttributeLogEvent)initWithHomeUUID:(id)a3
{
  sub_2302DD2B0();
  MEMORY[0x270FA5388]();
  sub_2302DD270();
  result = (HMDMatterAccessoryWriteAttributeLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HMDMatterAccessoryWriteAttributeLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  sub_2302DD2B0();
  MEMORY[0x270FA5388]();
  sub_2302DD270();
  result = (HMDMatterAccessoryWriteAttributeLogEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_endpointId));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_clusterId));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_attributeId));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_value));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___HMDMatterAccessoryWriteAttributeLogEvent_timedWriteTimeout));
  swift_bridgeObjectRelease();
}

@end
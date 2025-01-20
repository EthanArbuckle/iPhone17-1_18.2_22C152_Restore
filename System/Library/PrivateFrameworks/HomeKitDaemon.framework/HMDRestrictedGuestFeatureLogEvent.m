@interface HMDRestrictedGuestFeatureLogEvent
- (BOOL)hasRGSupportedAccessory;
- (BOOL)isHH2Enabled;
- (HMDRestrictedGuestFeatureLogEvent)initWithHomeUUID:(id)a3;
- (HMDRestrictedGuestFeatureLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (int64_t)numEnabledResidentsInHome;
- (int64_t)numberOfRGs;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setCoreAnalyticsEventName:(id)a3;
- (void)setCoreAnalyticsEventOptions:(unint64_t)a3;
- (void)setHasRGSupportedAccessory:(BOOL)a3;
- (void)setIsHH2Enabled:(BOOL)a3;
- (void)setNumEnabledResidentsInHome:(int64_t)a3;
- (void)setNumberOfRGs:(int64_t)a3;
@end

@implementation HMDRestrictedGuestFeatureLogEvent

- (BOOL)hasRGSupportedAccessory
{
  v2 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_hasRGSupportedAccessory;
  swift_beginAccess();
  return *v2;
}

- (void)setHasRGSupportedAccessory:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_hasRGSupportedAccessory;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isHH2Enabled
{
  v2 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_isHH2Enabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsHH2Enabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_isHH2Enabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (int64_t)numberOfRGs
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_numberOfRGs);
  swift_beginAccess();
  return *v2;
}

- (void)setNumberOfRGs:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_numberOfRGs);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)numEnabledResidentsInHome
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_numEnabledResidentsInHome);
  swift_beginAccess();
  return *v2;
}

- (void)setNumEnabledResidentsInHome:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_numEnabledResidentsInHome);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSString)coreAnalyticsEventName
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2302DDB90();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setCoreAnalyticsEventName:(id)a3
{
  uint64_t v4 = sub_2302DDBB0();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_coreAnalyticsEventName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  RestrictedGuestFeatureLogEvent.coreAnalyticsEventDictionary.getter();

  sub_22F5357F8();
  v3 = (void *)sub_2302DDAE0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_coreAnalyticsEventOptions);
  swift_beginAccess();
  return *v2;
}

- (void)setCoreAnalyticsEventOptions:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_coreAnalyticsEventOptions);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (HMDRestrictedGuestFeatureLogEvent)initWithHomeUUID:(id)a3
{
  uint64_t v4 = sub_2302DD2B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DD270();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_hasRGSupportedAccessory) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_isHH2Enabled) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_numberOfRGs) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_numEnabledResidentsInHome) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_coreAnalyticsEventName);
  void *v8 = 0xD000000000000028;
  v8[1] = 0x800000023035DDE0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_coreAnalyticsEventOptions) = (Class)2;
  v9 = (void *)sub_2302DD250();
  v10 = (objc_class *)type metadata accessor for RestrictedGuestFeatureLogEvent();
  v13.receiver = self;
  v13.super_class = v10;
  v11 = [(HMMHomeLogEvent *)&v13 initWithHomeUUID:v9];

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (HMDRestrictedGuestFeatureLogEvent)initWithStartTime:(double)a3 homeUUID:(id)a4
{
  uint64_t v6 = sub_2302DD2B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2302DD270();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_hasRGSupportedAccessory) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_isHH2Enabled) = 1;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_numberOfRGs) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_numEnabledResidentsInHome) = 0;
  v10 = (Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_coreAnalyticsEventName);
  void *v10 = 0xD000000000000028;
  v10[1] = 0x800000023035DDE0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___HMDRestrictedGuestFeatureLogEvent_coreAnalyticsEventOptions) = (Class)2;
  v11 = (void *)sub_2302DD250();
  v12 = (objc_class *)type metadata accessor for RestrictedGuestFeatureLogEvent();
  v15.receiver = self;
  v15.super_class = v12;
  objc_super v13 = [(HMMHomeLogEvent *)&v15 initWithStartTime:v11 homeUUID:a3];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v13;
}

- (void).cxx_destruct
{
}

@end
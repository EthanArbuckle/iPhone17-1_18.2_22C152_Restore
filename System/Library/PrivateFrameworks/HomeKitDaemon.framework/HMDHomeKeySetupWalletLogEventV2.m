@interface HMDHomeKeySetupWalletLogEventV2
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (_TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2)init;
- (_TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2)initWithStartTime:(double)a3;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setCoreAnalyticsEventName:(id)a3;
- (void)setCoreAnalyticsEventOptions:(unint64_t)a3;
@end

@implementation HMDHomeKeySetupWalletLogEventV2

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventName);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v2 = self;
  HMDHomeKeySetupWalletLogEventV2.coreAnalyticsEventDictionary.getter();

  sub_22F5357F8();
  v3 = (void *)sub_2302DDAE0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (unint64_t)coreAnalyticsEventOptions
{
  v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventOptions);
  swift_beginAccess();
  return *v2;
}

- (void)setCoreAnalyticsEventOptions:(unint64_t)a3
{
  uint64_t v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventOptions);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (_TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2)init
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_success) = 0;
  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventName);
  void *v2 = 0xD000000000000026;
  v2[1] = 0x800000023035DD40;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventOptions) = (Class)1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for HMDHomeKeySetupWalletLogEventV2();
  return [(HMMLogEvent *)&v4 init];
}

- (_TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2)initWithStartTime:(double)a3
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_success) = 0;
  objc_super v4 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventName);
  *objc_super v4 = 0xD000000000000026;
  v4[1] = 0x800000023035DD40;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC13HomeKitDaemon31HMDHomeKeySetupWalletLogEventV2_coreAnalyticsEventOptions) = (Class)1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HMDHomeKeySetupWalletLogEventV2();
  return [(HMMLogEvent *)&v6 initWithStartTime:a3];
}

- (void).cxx_destruct
{
}

@end
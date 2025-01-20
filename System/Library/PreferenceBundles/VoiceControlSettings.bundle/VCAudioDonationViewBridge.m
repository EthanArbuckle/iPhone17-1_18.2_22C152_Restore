@interface VCAudioDonationViewBridge
+ (id)makeViewController;
- (_TtC20VoiceControlSettings25VCAudioDonationViewBridge)init;
@end

@implementation VCAudioDonationViewBridge

+ (id)makeViewController
{
  uint64_t v2 = type metadata accessor for VCAudioDonationView();
  uint64_t v3 = v2 - 8;
  uint64_t v4 = __chkstk_darwin(v2);
  v6 = (uint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  v8 = (char *)&v14 - v7;
  uint64_t *v6 = swift_getKeyPath();
  sub_22BC4(&qword_53DE0);
  swift_storeEnumTagMultiPayload();
  v9 = (uint64_t *)((char *)v6 + *(int *)(v3 + 28));
  void *v9 = 0xD000000000000024;
  v9[1] = 0x8000000000043D70;
  uint64_t v10 = *(int *)(v3 + 32);
  *(uint64_t *)((char *)v6 + v10) = (uint64_t)[objc_allocWithZone((Class)UIViewController) init];
  sub_2B61C((uint64_t)v6, (uint64_t)v8);
  id v11 = objc_allocWithZone((Class)sub_22BC4(&qword_54518));
  v12 = (void *)sub_38970();

  return v12;
}

- (_TtC20VoiceControlSettings25VCAudioDonationViewBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VCAudioDonationViewBridge();
  return [(VCAudioDonationViewBridge *)&v3 init];
}

@end
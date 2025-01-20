@interface ScreenSharingAnnotationUIService
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(int64_t)a3;
- (ScreenSharingAnnotationUIService)init;
- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6;
- (void)dealloc;
@end

@implementation ScreenSharingAnnotationUIService

- (ScreenSharingAnnotationUIService)init
{
  return (ScreenSharingAnnotationUIService *)ScreenSharingAnnotationUIService.init()();
}

- (void)dealloc
{
  v2 = self;
  ScreenSharingAnnotationUIService.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_65AC((uint64_t)self + OBJC_IVAR___ScreenSharingAnnotationUIService____lazy_storage___coordinator, &qword_C6A8);
  sub_65AC((uint64_t)self + OBJC_IVAR___ScreenSharingAnnotationUIService_processMessageContinuation, &qword_C6F0);

  swift_release();
}

- (id)processMessage:(id)a3 withIdentifier:(int64_t)a4 fromClientWithIdentifier:(id)a5 error:(id *)a6
{
  if (a3) {
    unint64_t v8 = sub_6810();
  }
  else {
    unint64_t v8 = 0;
  }
  uint64_t v9 = sub_6840();
  v11 = v10;
  v12 = self;
  ScreenSharingAnnotationUIService.processMessage(_:withIdentifier:fromClientWithIdentifier:)(v8, a4, v9, v11);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v13.super.isa = sub_6800().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(int64_t)a3
{
  _s32ScreenSharingAccessibilityServer0aB19AnnotationUIServiceC39requiredEntitlementForProcessingMessage14withIdentifierSSSgSi_tFZ_0();
  NSString v3 = sub_6830();
  swift_bridgeObjectRelease();

  return v3;
}

@end
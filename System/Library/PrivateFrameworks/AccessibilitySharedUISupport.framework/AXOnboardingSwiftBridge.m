@interface AXOnboardingSwiftBridge
+ (id)viewControllerForType:(int64_t)a3 dismiss:(id)a4;
- (_TtC28AccessibilitySharedUISupport23AXOnboardingSwiftBridge)init;
@end

@implementation AXOnboardingSwiftBridge

+ (id)viewControllerForType:(int64_t)a3 dismiss:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  id v7 = objc_allocWithZone((Class)type metadata accessor for ViewController());
  swift_retain();
  v8 = sub_228D86554(a3, (uint64_t)sub_228D878A8, v6);
  swift_release();
  return v8;
}

- (_TtC28AccessibilitySharedUISupport23AXOnboardingSwiftBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AXOnboardingSwiftBridge();
  return [(AXOnboardingSwiftBridge *)&v3 init];
}

@end
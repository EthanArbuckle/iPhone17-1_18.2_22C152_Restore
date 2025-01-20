@interface VoiceOverActivityViewBridge
+ (id)makeViewControllerWithGet:(id)a3 set:(id)a4;
- (_TtC21AccessibilitySettings27VoiceOverActivityViewBridge)init;
@end

@implementation VoiceOverActivityViewBridge

+ (id)makeViewControllerWithGet:(id)a3 set:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2664C0);
  __chkstk_darwin(v6 - 8);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for VoiceOverActivityVoiceSelectionView();
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a3);
  v13 = _Block_copy(a4);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = sub_1548FC;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = sub_154904;
  v17[5] = v15;
  sub_169AE0();
  swift_retain();
  swift_retain();
  sub_169680();
  sub_151A6C((uint64_t)v8, (uint64_t)v11);
  id v18 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2664C8));
  v19 = (void *)sub_169380();
  swift_release();
  swift_release();

  return v19;
}

- (_TtC21AccessibilitySettings27VoiceOverActivityViewBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoiceOverActivityViewBridge();
  return [(VoiceOverActivityViewBridge *)&v3 init];
}

@end
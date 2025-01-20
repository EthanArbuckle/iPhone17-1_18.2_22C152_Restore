@interface __EntityAccessibilityWrapper
- (BOOL)entitySupportsAccessibilityActivateAction;
- (BOOL)isEntityAccessible;
- (BOOL)isEntityActive;
- (BOOL)isEntityRoot;
- (CGRect)calculateScreenBoundingRectIn:(id)a3;
- (NSArray)entityAccessibilityCustomActions;
- (NSArray)entityAccessibilityCustomContent;
- (NSArray)entityAccessibilityCustomRotors;
- (NSString)entityDescription;
- (NSString)entityLabel;
- (NSString)entityValue;
- (_TtC10RealityKit28__EntityAccessibilityWrapper)init;
- (_TtC10RealityKit28__EntityAccessibilityWrapper)rootEntityWrapper;
- (unint64_t)entityAccessibilityTraits;
- (unint64_t)identifier;
- (void)entityPerformAccessibilityActivate;
- (void)entityPerformAccessibilityDecrement;
- (void)entityPerformAccessibilityIncrement;
@end

@implementation __EntityAccessibilityWrapper

- (_TtC10RealityKit28__EntityAccessibilityWrapper)rootEntityWrapper
{
  return (_TtC10RealityKit28__EntityAccessibilityWrapper *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC10RealityKit28__EntityAccessibilityWrapper_rootEntityWrapper);
}

- (unint64_t)identifier
{
  unint64_t result = swift_weakLoadStrong();
  if (result)
  {
    v4 = self;
    unint64_t v5 = Entity.id.getter();

    swift_release();
    return v5;
  }
  return result;
}

- (CGRect)calculateScreenBoundingRectIn:(id)a3
{
  if (swift_weakLoadStrong())
  {
    unint64_t v5 = (char *)a3;
    v6 = self;
    Entity.__calculateScreenBoundingRect(in:)(v5);
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    swift_release();
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB20];
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (BOOL)isEntityRoot
{
  return @objc __EntityAccessibilityWrapper.isEntityRoot.getter(self, (uint64_t)a2, MEMORY[0x1E4F3AAA8]);
}

- (BOOL)isEntityAccessible
{
  return @objc __EntityAccessibilityWrapper.isEntityRoot.getter(self, (uint64_t)a2, MEMORY[0x1E4F3AAB0]);
}

- (NSString)entityLabel
{
  return (NSString *)@objc __EntityAccessibilityWrapper.entityLabel.getter(self, (uint64_t)a2, __EntityAccessibilityWrapper.entityLabel.getter);
}

- (NSString)entityDescription
{
  Strong = (void *)swift_weakLoadStrong();
  if (Strong)
  {
    v4 = self;
    uint64_t v5 = Entity.__accessibilityDescription.getter();
    uint64_t v7 = v6;

    swift_release();
    if (v7)
    {
      Strong = (void *)MEMORY[0x1E4E62C20](v5, v7);
      swift_bridgeObjectRelease();
    }
    else
    {
      Strong = 0;
    }
  }

  return (NSString *)Strong;
}

- (NSString)entityValue
{
  return (NSString *)@objc __EntityAccessibilityWrapper.entityLabel.getter(self, (uint64_t)a2, __EntityAccessibilityWrapper.entityValue.getter);
}

- (BOOL)isEntityActive
{
  return @objc __EntityAccessibilityWrapper.isEntityRoot.getter(self, (uint64_t)a2, MEMORY[0x1E4F3AAB8]);
}

- (unint64_t)entityAccessibilityTraits
{
  uint64_t v3 = type metadata accessor for AccessibilityComponent();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!swift_weakLoadStrong()) {
    return 0;
  }
  uint64_t v7 = self;
  Entity.accessibilityComponent.getter((uint64_t)v6);
  unint64_t v8 = AccessibilityComponent.traitsRawValue.getter();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  swift_release();
  return v8;
}

- (NSArray)entityAccessibilityCustomRotors
{
  uint64_t v3 = type metadata accessor for AccessibilityComponent();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v12[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (swift_weakLoadStrong())
  {
    uint64_t v7 = self;
    Entity.accessibilityComponent.getter((uint64_t)v6);
    unint64_t v8 = AccessibilityComponent.customRotors.getter();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    swift_release();
    double v9 = v7;
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay17RealityFoundation22AccessibilityComponentV0D3KitE9RotorTypeOG_So021UIAccessibilityCustomI0Cs5NeverOTg504_s10d13Kit28__Entityf19WrapperC06entityD12l14RotorsSaySo015k2G5i23CGvgAF0A10Foundation0D9g7VAAE0J4J6OXEfU_AI02__pfQ0CTf1cn_nTf4ng_n(v8, v9);
    swift_bridgeObjectRelease();
  }
  type metadata accessor for ARReferenceObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomRotor);
  v10.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v10.super.isa;
}

- (NSArray)entityAccessibilityCustomActions
{
  uint64_t v3 = type metadata accessor for AccessibilityComponent();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    double v9 = self;
    Entity.accessibilityComponent.getter((uint64_t)v6);
    uint64_t v10 = AccessibilityComponent.customActions.getter();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    swift_retain();
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSay10Foundation23LocalizedStringResourceVG_So27UIAccessibilityCustomActionCs5NeverOTg5056_s10RealityKit28__EntityAccessibilityWrapperC06entityD13i15ActionsSaySo015h2G6j20CGvgAF10Foundation23efG6VXEfU_0M3Kit0O0CTf1cn_nTf4ng_n(v10, v8);

    swift_bridgeObjectRelease();
    swift_release_n();
  }
  type metadata accessor for ARReferenceObject(0, &lazy cache variable for type metadata for UIAccessibilityCustomAction);
  v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v11.super.isa;
}

- (NSArray)entityAccessibilityCustomContent
{
  v2 = self;
  __EntityAccessibilityWrapper.entityAccessibilityCustomContent.getter();

  type metadata accessor for ARReferenceObject(0, &lazy cache variable for type metadata for AXCustomContent);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)entitySupportsAccessibilityActivateAction
{
  v2 = self;
  char v3 = __EntityAccessibilityWrapper.entitySupportsAccessibilityActivateAction.getter();

  return v3 & 1;
}

- (void)entityPerformAccessibilityActivate
{
}

- (void)entityPerformAccessibilityIncrement
{
}

- (void)entityPerformAccessibilityDecrement
{
}

- (_TtC10RealityKit28__EntityAccessibilityWrapper)init
{
  CGRect result = (_TtC10RealityKit28__EntityAccessibilityWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  char v3 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC10RealityKit28__EntityAccessibilityWrapper_rootEntityWrapper);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10RealityKit28__EntityAccessibilityWrapper_rootEntityWrapper) = 0;
  if (v3)
  {
    while (1)
    {
      uint64_t v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      uint64_t v4 = *(char **)&v6[OBJC_IVAR____TtC10RealityKit28__EntityAccessibilityWrapper_rootEntityWrapper];
      uint64_t v5 = v4;

      char v3 = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    char v3 = v6;
  }
LABEL_6:
}

@end
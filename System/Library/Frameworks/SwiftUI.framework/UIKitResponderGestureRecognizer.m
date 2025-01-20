@interface UIKitResponderGestureRecognizer
- (BOOL)_gestureRecognizer:(id)a3 canBeCancelledByGestureRecognizer:(id)a4;
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (NSString)name;
- (_TtC7SwiftUI31UIKitResponderGestureRecognizer)init;
- (_TtC7SwiftUI31UIKitResponderGestureRecognizer)initWithCoder:(id)a3;
- (int64_t)buttonMaskRequired;
- (unint64_t)numberOfTapsRequired;
- (unint64_t)numberOfTouchesRequired;
- (void)setName:(id)a3;
@end

@implementation UIKitResponderGestureRecognizer

- (NSString)name
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for Any?(0, (unint64_t *)&lazy cache variable for type metadata for String?, MEMORY[0x1E4FBB1A0], MEMORY[0x1E4FBB718]);
  v4 = self;
  static Update.ensure<A>(_:)();
  uint64_t v5 = v14;
  if (v14)
  {
    uint64_t v6 = v13;

LABEL_5:
    v10 = (void *)MEMORY[0x18C115780](v6, v5);
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
  v12.receiver = v4;
  v12.super_class = ObjectType;
  v7 = [(UIKitResponderGestureRecognizer *)&v12 name];
  if (v7)
  {
    v8 = v7;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = v9;

    goto LABEL_5;
  }

  v10 = 0;
LABEL_6:

  return (NSString *)v10;
}

- (void)setName:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    uint64_t v9 = self;
    a3 = (id)MEMORY[0x18C115780](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = self;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  [(UIKitResponderGestureRecognizer *)&v11 setName:a3];
}

- (_TtC7SwiftUI31UIKitResponderGestureRecognizer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)((char *)&self->super.super._gestureFlags
            + OBJC_IVAR____TtC7SwiftUI31UIKitResponderGestureRecognizer_responder) = 0;
  *(void *)(swift_weakInit() + 8) = 0;
  swift_weakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = [(UIKitGestureRecognizer *)&v6 init];
  [(UIKitResponderGestureRecognizer *)v4 setDelegate:v4];
  return v4;
}

- (_TtC7SwiftUI31UIKitResponderGestureRecognizer)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._gestureFlags
            + OBJC_IVAR____TtC7SwiftUI31UIKitResponderGestureRecognizer_responder) = 0;
  swift_weakInit();
  id v5 = a3;

  result = (_TtC7SwiftUI31UIKitResponderGestureRecognizer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isKindOfClass:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  id v5 = self;
  LOBYTE(ObjCClassMetadata) = UIKitResponderGestureRecognizer.isKind(of:)(ObjCClassMetadata);

  return ObjCClassMetadata & 1;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  BOOL result = 0;
  if (!a3)
  {
    if (swift_weakLoadStrong())
    {
      id v5 = self;
      AnyGestureResponder.requiredTapCount.getter();
      char v7 = v6;

      swift_release();
      if ((v7 & 1) == 0) {
        return 1;
      }
    }
  }
  return result;
}

- (unint64_t)numberOfTapsRequired
{
  v2 = self;
  Swift::UInt v3 = UIKitResponderGestureRecognizer.numberOfTapsRequired()();

  return v3;
}

- (unint64_t)numberOfTouchesRequired
{
  return 1;
}

- (int64_t)buttonMaskRequired
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  v4 = (UIGestureRecognizer *)a3;
  id v5 = self;
  LOBYTE(self) = UIKitResponderGestureRecognizer.canPrevent(_:)(v4);

  return self & 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  v4 = (UIGestureRecognizer *)a3;
  id v5 = self;
  LOBYTE(self) = UIKitResponderGestureRecognizer.canBePrevented(by:)(v4);

  return self & 1;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  v4 = (UIGestureRecognizer *)a3;
  id v5 = self;
  LOBYTE(self) = UIKitResponderGestureRecognizer.shouldRequireFailure(of:)(v4);

  return self & 1;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  v4 = (UIGestureRecognizer *)a3;
  id v5 = self;
  LOBYTE(self) = UIKitResponderGestureRecognizer.shouldBeRequiredToFail(by:)(v4);

  return self & 1;
}

- (BOOL)_gestureRecognizer:(id)a3 canBeCancelledByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  BOOL v9 = specialized UIKitResponderGestureRecognizer._gestureRecognizer(_:canBeCancelledBy:)(v7);

  return v9;
}

- (void).cxx_destruct
{
}

@end
@interface AmbientAnimationCoordinator
+ (void)hide:(id)a3 completion:(id)a4;
+ (void)show:(id)a3 completion:(id)a4;
+ (void)transitionFrom:(id)a3 to:(id)a4 allowRoll:(BOOL)a5 completion:(id)a6;
- (_TtC13InCallService27AmbientAnimationCoordinator)init;
@end

@implementation AmbientAnimationCoordinator

+ (void)transitionFrom:(id)a3 to:(id)a4 allowRoll:(BOOL)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  sub_1001B23F4(a3, a4, a5, (uint64_t)sub_1001B3F50, v10);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

+ (void)show:(id)a3 completion:(id)a4
{
  v4 = (uint64_t (*)())_Block_copy(a4);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v4 = sub_1001B3F50;
  }
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  sub_1001B32BC();
  sub_100142E2C((uint64_t)v4);

  swift_unknownObjectRelease();
}

+ (void)hide:(id)a3 completion:(id)a4
{
  v4 = _Block_copy(a4);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v4 = sub_1001B371C;
  }
  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  sub_1001B3478();
  sub_100142E2C((uint64_t)v4);

  swift_unknownObjectRelease();
}

- (_TtC13InCallService27AmbientAnimationCoordinator)init
{
  return (_TtC13InCallService27AmbientAnimationCoordinator *)sub_1001B3634();
}

@end
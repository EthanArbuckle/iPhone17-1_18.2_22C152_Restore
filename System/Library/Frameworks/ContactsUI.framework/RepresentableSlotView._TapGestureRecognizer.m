@interface RepresentableSlotView._TapGestureRecognizer
- (_TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation RepresentableSlotView._TapGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_18B6C2714();
  sub_18B6C2754();
  uint64_t v6 = sub_18B986108();
  id v7 = a4;
  v8 = self;
  sub_18B6BF680(v6, v7);

  swift_bridgeObjectRelease();
}

- (_TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_18B986518();
    swift_unknownObjectRelease();
  }
  result = (_TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCV10ContactsUI21RepresentableSlotView21_TapGestureRecognizer_approvalCallback);

  sub_18B663E90(v3);
}

@end
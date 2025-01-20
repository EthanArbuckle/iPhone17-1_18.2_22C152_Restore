@interface LockupViewTapGestureRecognizer
- (_TtC12GameCenterUIP33_64554770326E76789B08F6F30099D03930LockupViewTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)execute;
@end

@implementation LockupViewTapGestureRecognizer

- (void)execute
{
  v2 = self;
  sub_1AF62212C();
}

- (_TtC12GameCenterUIP33_64554770326E76789B08F6F30099D03930LockupViewTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  sub_1AF622564();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_64554770326E76789B08F6F30099D03930LockupViewTapGestureRecognizer_adamId));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUIP33_64554770326E76789B08F6F30099D03930LockupViewTapGestureRecognizer_lockupView));

  swift_release();
}

@end
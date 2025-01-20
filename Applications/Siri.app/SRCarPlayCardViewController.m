@interface SRCarPlayCardViewController
- (BOOL)shouldHandleCardSectionEngagement:(id)a3;
- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLoad;
@end

@implementation SRCarPlayCardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10007C5C8();
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v4 = qword_100170448;
  id v5 = a3;
  v6 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for Logger();
  sub_10007DCA0(v7, (uint64_t)qword_100171AB0);
  os_log_type_t v8 = static os_log_type_t.info.getter();
  sub_1000B2FEC(v8, 0x10uLL, 0xD000000000000017, 0x80000001000FA770, 0xD000000000000036, 0x80000001000FA790);
  uint64_t v9 = *(void *)&v6->super.isRightHandDrive[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate];
  uint64_t ObjectType = swift_getObjectType();
  v11 = *(void (**)(_TtC4Siri27SRCarPlayCardViewController *, uint64_t, uint64_t))(v9 + 24);
  swift_unknownObjectRetain();
  v11(v6, ObjectType, v9);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardSnippet));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_widthConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_heightConstraint);
}

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  uint64_t v9 = self;
  sub_10007DA4C(width, height);
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10007CB1C(a3);

  return 0;
}

@end
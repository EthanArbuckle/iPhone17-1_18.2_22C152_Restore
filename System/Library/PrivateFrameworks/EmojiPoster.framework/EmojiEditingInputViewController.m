@interface EmojiEditingInputViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC11EmojiPoster31EmojiEditingInputViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster31EmojiEditingInputViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapCloseButton;
- (void)didTapDeleteButton;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EmojiEditingInputViewController

- (_TtC11EmojiPoster31EmojiEditingInputViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20B91BC90();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20B91859C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_20B91999C(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiEditingInputViewController();
  v4 = (char *)v5.receiver;
  [(EmojiEditingInputViewController *)&v5 viewIsAppearing:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_textField], sel_becomeFirstResponder, v5.receiver, v5.super_class);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_20B926948();
  id v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_20B91A1E8(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)didTapCloseButton
{
  BOOL v3 = (char *)self + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x21053B1C0](v3))
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    objc_super v5 = *(void (**)(void))(v4 + 24);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)didTapDeleteButton
{
  v2 = self;
  sub_20B91AA78();
}

- (_TtC11EmojiPoster31EmojiEditingInputViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11EmojiPoster31EmojiEditingInputViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_navBar));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_logger;
  uint64_t v4 = sub_20B9267F8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_emojiCountLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_keyboardVC));
  objc_super v5 = (char *)self + OBJC_IVAR____TtC11EmojiPoster31EmojiEditingInputViewController_delegate;
  sub_20B8F966C((uint64_t)v5);
}

@end
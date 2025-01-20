@interface EmojiViewController
- (_TtC22StickersUltraExtension19EmojiViewController)initWithCoder:(id)a3;
- (_TtC22StickersUltraExtension19EmojiViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)keyboardScroll:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation EmojiViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100031764();
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiViewController();
  id v2 = v5.receiver;
  [(EmojiViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [self activeInstance];
  if (v3)
  {
    v4 = v3;
    [v3 clearAnimations];
  }
  else
  {
    __break(1u);
  }
}

- (void)keyboardScroll:(id)a3
{
  uint64_t v4 = sub_100078EA0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100078E70();
  v8 = self;
  sub_1000323E0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC22StickersUltraExtension19EmojiViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10007A250();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22StickersUltraExtension19EmojiViewController *)sub_100032674(v5, v7, a4);
}

- (_TtC22StickersUltraExtension19EmojiViewController)initWithCoder:(id)a3
{
  return (_TtC22StickersUltraExtension19EmojiViewController *)sub_1000327A0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension19EmojiViewController_keyline));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension19EmojiViewController_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension19EmojiViewController_keyboardViewController));

  swift_unknownObjectRelease();
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100032904(v4);
}

@end
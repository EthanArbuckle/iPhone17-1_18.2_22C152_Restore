@interface StickerEditViewController
- (_TtC10StickerKit25StickerEditViewController)initWithCoder:(id)a3;
- (_TtC10StickerKit25StickerEditViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleDoneButton;
- (void)handleLiveButton;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation StickerEditViewController

- (_TtC10StickerKit25StickerEditViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2453B05AC();
}

- (void)loadView
{
  v2 = self;
  sub_2453ADDE4();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_2453AE99C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StickerEditViewController();
  v4 = v5.receiver;
  [(StickerEditViewController *)&v5 viewWillDisappear:v3];
  v4[OBJC_IVAR____TtC10StickerKit25StickerEditViewController_isPaused] = 1;
  sub_2453AC48C();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_2453AEB7C();
}

- (void)handleDoneButton
{
  v2 = self;
  sub_2453AEE4C();
}

- (void)handleLiveButton
{
  v2 = self;
  sub_2453AEFFC();
}

- (_TtC10StickerKit25StickerEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10StickerKit25StickerEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController_preLiveSickerEffect));
  sub_24520E4F4(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10StickerKit25StickerEditViewController__animatedData), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10StickerKit25StickerEditViewController__animatedData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController__image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController__effect));
  sub_245203A28((uint64_t)self + OBJC_IVAR____TtC10StickerKit25StickerEditViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___previewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___effectChooser));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___liveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___previewWidthConstraint));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___previewHeightConstraint);
}

@end
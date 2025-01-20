@interface EmojiCollectionViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC11EmojiPoster29EmojiCollectionViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster29EmojiCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC11EmojiPoster29EmojiCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation EmojiCollectionViewController

- (_TtC11EmojiPoster29EmojiCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster29EmojiCollectionViewController *)EmojiCollectionViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20B906FB8();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_20B926948();
  id v9 = a3;
  v10 = self;
  sub_20B907DCC(v9, location, length);

  swift_bridgeObjectRelease();
  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (_TtC11EmojiPoster29EmojiCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC11EmojiPoster29EmojiCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11EmojiPoster29EmojiCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11EmojiPoster29EmojiCollectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)((char *)&self->super.super._title
                 + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_configuration);
  v6[4] = *(_OWORD *)((char *)&self->super.super._navigationItem
                    + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_configuration);
  v6[5] = v3;
  v7[0] = *(_OWORD *)((char *)&self->super.super._nibBundle
                    + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_configuration);
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)&self->super.super._parentViewController
                                          + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_configuration
                                          + 1);
  long long v4 = *(_OWORD *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_configuration);
  v6[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_configuration);
  v6[1] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super._tab
                 + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_configuration);
  v6[2] = *(_OWORD *)((char *)&self->super.super._view
                    + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_configuration);
  v6[3] = v5;
  sub_20B8E79D8(v6);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster29EmojiCollectionViewController_hiddenEmojiField));
}

@end
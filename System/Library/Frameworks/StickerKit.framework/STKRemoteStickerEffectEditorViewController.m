@interface STKRemoteStickerEffectEditorViewController
- (STKRemoteStickerEffectEditorViewController)initWithCoder:(id)a3;
- (STKRemoteStickerEffectEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (STKRemoteStickerEffectEditorViewController)initWithStickerIdentifier:(id)a3;
- (STKStickerEffectEditorViewControllerDelegate)delegate;
- (id)activityType;
- (void)setDelegate:(id)a3;
- (void)showStickerEffectViewWithSourceRect:(CGRect)a3 showing:(BOOL)a4;
- (void)stickerEffectEditorViewControllerControllerDidTapDone;
@end

@implementation STKRemoteStickerEffectEditorViewController

- (id)activityType
{
  sub_2453FFB38();
  v2 = (void *)sub_2453FFB08();
  swift_bridgeObjectRelease();

  return v2;
}

- (STKRemoteStickerEffectEditorViewController)initWithStickerIdentifier:(id)a3
{
  uint64_t v4 = sub_2453FCCB8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCC98();
  v8 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_stickerIdentifier;
  v9 = self;
  sub_2453FCCA8();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(v8, v7, v4);
  swift_endAccess();

  v10 = (objc_class *)type metadata accessor for RemoteStickerEffectEditorViewController();
  v14.receiver = v9;
  v14.super_class = v10;
  v11 = [(RemoteBaseSceneHostingController *)&v14 initWithNibName:0 bundle:0];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (STKRemoteStickerEffectEditorViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  sub_2453FCCA8();
  swift_unknownObjectWeakInit();

  result = (STKRemoteStickerEffectEditorViewController *)sub_2454009B8();
  __break(1u);
  return result;
}

- (STKStickerEffectEditorViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x2456A0530](v2);

  return (STKStickerEffectEditorViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)stickerEffectEditorViewControllerControllerDidTapDone
{
  v3 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_delegate;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x2456A0530](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint64_t v6 = self;
    objc_msgSend(v5, sel_stickerEffectEditorViewControllerControllerDidTapDone);

    swift_unknownObjectRelease();
  }
}

- (void)showStickerEffectViewWithSourceRect:(CGRect)a3 showing:(BOOL)a4
{
  *(CGFloat *)&long long v7 = a3.origin.x;
  *((void *)&v7 + 1) = *(void *)&a3.origin.y;
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  BOOL v10 = a4;
  uint64_t v4 = self;
  id v5 = sub_245228E98(0, &v7, 0, 1);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_245400168();
  swift_release();
  swift_release();
  objc_msgSend(v6, sel_sendAction_, v5);
}

- (STKRemoteStickerEffectEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (STKRemoteStickerEffectEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_stickerIdentifier;
  uint64_t v4 = sub_2453FCCB8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_delegate;

  sub_245203A28((uint64_t)v5);
}

@end
@interface MOAngelRootViewController
- (_TtC16MomentsUIService25MOAngelRootViewController)initWithCoder:(id)a3;
- (_TtC16MomentsUIService25MOAngelRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3;
@end

@implementation MOAngelRootViewController

- (_TtC16MomentsUIService25MOAngelRootViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_presentedSheetController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_currentlyPresentedOptions) = 0;
  id v5 = a3;

  result = (_TtC16MomentsUIService25MOAngelRootViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOAngelRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_privacyBlur));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_presentedSheetController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService25MOAngelRootViewController_currentlyPresentedOptions);
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MOAngelRootViewController.sheetPresentationControllerDidChangeSelectedDetentIdentifier(_:)((UISheetPresentationController)v4);
}

@end
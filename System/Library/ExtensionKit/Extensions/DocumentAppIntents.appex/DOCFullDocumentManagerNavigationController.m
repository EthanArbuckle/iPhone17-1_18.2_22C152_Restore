@interface DOCFullDocumentManagerNavigationController
- (BOOL)chromelessAppearanceDisabled;
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (NSArray)viewControllers;
- (_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController)init;
- (_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController)initWithConfiguration:(id)a3;
- (_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController)initWithRootViewController:(id)a3;
- (void)setChromelessAppearanceDisabled:(BOOL)a3;
- (void)setViewControllers:(id)a3;
@end

@implementation DOCFullDocumentManagerNavigationController

- (_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController)initWithConfiguration:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController_chromelessAppearanceDisabled) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController_configuration) = (Class)a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCFullDocumentManagerNavigationController();
  id v4 = a3;
  v5 = [(DOCNavigationController *)&v9 init];
  v6 = *(Class *)((char *)&v5->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController_configuration);
  v7 = v5;
  objc_msgSend(v6, "isPickerUI", v9.receiver, v9.super_class);

  return v7;
}

- (NSArray)viewControllers
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCFullDocumentManagerNavigationController();
  id v2 = v6.receiver;
  v3 = [(DOCFullDocumentManagerNavigationController *)&v6 viewControllers];
  sub_1002F61DC();
  sub_1004F47F0();

  v4.super.isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v4.super.isa;
}

- (void)setViewControllers:(id)a3
{
  sub_1002F61DC();
  unint64_t v4 = sub_1004F47F0();
  v5 = self;
  sub_1002F5B14(v4);
}

- (BOOL)chromelessAppearanceDisabled
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController_chromelessAppearanceDisabled);
}

- (void)setChromelessAppearanceDisabled:(BOOL)a3
{
  unint64_t v4 = self;
  sub_1002F5F24(a3);
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  if (![(DOCFullDocumentManagerNavigationController *)v8 delegate])
  {

LABEL_6:
    unsigned __int8 v12 = 1;
    goto LABEL_7;
  }
  uint64_t v9 = swift_dynamicCastObjCProtocolConditional();
  if (!v9)
  {

    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  v10 = (void *)v9;
  id v11 = [(DOCFullDocumentManagerNavigationController *)v8 topViewController];
  unsigned __int8 v12 = [v10 navigationController:v8 canPop:v11];

  swift_unknownObjectRelease();
LABEL_7:

  return v12;
}

- (_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController)init
{
  result = (_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController_configuration));
}

@end
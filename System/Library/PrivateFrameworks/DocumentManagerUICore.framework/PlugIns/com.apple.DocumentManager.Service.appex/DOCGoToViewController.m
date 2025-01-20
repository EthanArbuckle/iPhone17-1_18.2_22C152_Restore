@interface DOCGoToViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC33com_apple_DocumentManager_Service21DOCGoToViewController)init;
- (void)didHitDirectionalArrow;
- (void)didReturn;
- (void)didTab;
- (void)goToLocation;
- (void)inputTextFieldDidChange:(id)a3;
- (void)loadView;
- (void)performDismiss:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DOCGoToViewController

- (void)performDismiss:(id)a3
{
}

- (void)loadView
{
  v2 = self;
  sub_10049E4C8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10049E5E0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10049F4A0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCGoToViewController();
  v4 = v5.receiver;
  [(DOCViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_initialSuggestionsToken] = 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCGoToViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCGoToViewController *)&v6 traitCollectionDidChange:v4];
  sub_1004A0B70();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCGoToViewController();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[DOCGoToViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  sub_1004A0B70();
  swift_unknownObjectRelease();
}

- (void)goToLocation
{
  v2 = self;
  sub_10049F760();
}

- (void)didHitDirectionalArrow
{
  v2 = self;
  sub_10049CFC8((uint64_t)&v3);
  if (v4)
  {
    sub_10003ABB8(&v3, (uint64_t)v5);
    sub_1004A107C(v5);
    sub_1000384F0((uint64_t)v5);
  }
  else
  {
    sub_10003B3B8((uint64_t)&v3, &qword_10063F940);
  }
}

- (void)didTab
{
  v2 = self;
  sub_10049CFC8((uint64_t)&v3);
  if (v4)
  {
    sub_10003ABB8(&v3, (uint64_t)v5);
    sub_1004A107C(v5);
    sub_1000384F0((uint64_t)v5);
  }
  else
  {
    sub_10003B3B8((uint64_t)&v3, &qword_10063F940);
  }
}

- (void)didReturn
{
  v2 = self;
  sub_10049F96C();
}

- (_TtC33com_apple_DocumentManager_Service21DOCGoToViewController)init
{
  result = (_TtC33com_apple_DocumentManager_Service21DOCGoToViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003EA7C((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_suggestionsTableViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_contentView));
  sub_1000384F0((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_initialCandidateSource);
  sub_10003B3B8((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_filteringSource, &qword_10063F948);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_scrollViewDidScrollObservation));
  sub_10003B3B8((uint64_t)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_currentGoToLocation, (uint64_t *)&unk_10063F930);
  long long v3 = (char *)self + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_requestID;
  uint64_t v4 = sub_1004CA5F0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController____lazy_storage___inputField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController____lazy_storage___goButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController____lazy_storage___noResultsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController____lazy_storage___suggestionsTableViewController));
  id v5 = *(void **)&self->filteringSource[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_metrics
                                      + 7];
  objc_release(*(id *)&self->initialCandidateSource[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController_metrics
                                                  + 39]);

  objc_super v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCGoToViewController____lazy_storage___closeBox);
  sub_100066700(v6);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10049F96C();

  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = sub_1004CD2F0();
  uint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1004A3434(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)inputTextFieldDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004A18B8(v4);
}

@end
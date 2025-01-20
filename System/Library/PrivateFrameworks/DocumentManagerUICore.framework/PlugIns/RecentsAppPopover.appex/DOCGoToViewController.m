@interface DOCGoToViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC17RecentsAppPopover21DOCGoToViewController)init;
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
  sub_1002DDBC4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002DDCDC();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1002DEB9C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCGoToViewController();
  v4 = v5.receiver;
  [(DOCViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_initialSuggestionsToken] = 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCGoToViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCGoToViewController *)&v6 traitCollectionDidChange:v4];
  sub_1002E026C();
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
  sub_1002E026C();
  swift_unknownObjectRelease();
}

- (void)goToLocation
{
  v2 = self;
  sub_1002DEE5C();
}

- (void)didHitDirectionalArrow
{
  v2 = self;
  sub_1002DC6C4((uint64_t)&v3);
  if (v4)
  {
    sub_100033054(&v3, (uint64_t)v5);
    sub_1002E0778(v5);
    sub_10003D0C0((uint64_t)v5);
  }
  else
  {
    sub_1000516C4((uint64_t)&v3, &qword_100623C70);
  }
}

- (void)didTab
{
  v2 = self;
  sub_1002DC6C4((uint64_t)&v3);
  if (v4)
  {
    sub_100033054(&v3, (uint64_t)v5);
    sub_1002E0778(v5);
    sub_10003D0C0((uint64_t)v5);
  }
  else
  {
    sub_1000516C4((uint64_t)&v3, &qword_100623C70);
  }
}

- (void)didReturn
{
  v2 = self;
  sub_1002DF068();
}

- (_TtC17RecentsAppPopover21DOCGoToViewController)init
{
  result = (_TtC17RecentsAppPopover21DOCGoToViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003CC04((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_suggestionsTableViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_contentView));
  sub_10003D0C0((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_initialCandidateSource);
  sub_1000516C4((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_filteringSource, &qword_100623C78);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_scrollViewDidScrollObservation));
  sub_1000516C4((uint64_t)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_currentGoToLocation, (uint64_t *)&unk_100623C60);
  long long v3 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_requestID;
  uint64_t v4 = sub_1004BBE30();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController____lazy_storage___inputField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController____lazy_storage___goButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController____lazy_storage___noResultsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController____lazy_storage___suggestionsTableViewController));
  id v5 = *(void **)&self->filteringSource[OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_metrics + 7];
  objc_release(*(id *)&self->initialCandidateSource[OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController_metrics
                                                  + 39]);

  objc_super v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover21DOCGoToViewController____lazy_storage___closeBox);
  sub_100062738(v6);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002DF068();

  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = sub_1004BEB10();
  uint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1002E2B54(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)inputTextFieldDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1002E0FB4(v4);
}

@end
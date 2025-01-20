@interface DOCGoToViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC14RecentsAvocado21DOCGoToViewController)init;
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

- (void)loadView
{
  v2 = self;
  sub_1003F8544();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1003F865C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1003F951C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCGoToViewController();
  v4 = v5.receiver;
  [(DOCViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_initialSuggestionsToken] = 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCGoToViewController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCGoToViewController *)&v6 traitCollectionDidChange:v4];
  sub_1003FABEC();
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
  sub_1003FABEC();
  swift_unknownObjectRelease();
}

- (void)goToLocation
{
  v2 = self;
  sub_1003F97DC();
}

- (void)didHitDirectionalArrow
{
  v2 = self;
  sub_1003F7044((uint64_t)&v3);
  if (v4)
  {
    sub_100033120(&v3, (uint64_t)v5);
    sub_1003FB0F8(v5);
    sub_100039184((uint64_t)v5);
  }
  else
  {
    sub_100049B74((uint64_t)&v3, &qword_100637E10);
  }
}

- (void)didTab
{
  v2 = self;
  sub_1003F7044((uint64_t)&v3);
  if (v4)
  {
    sub_100033120(&v3, (uint64_t)v5);
    sub_1003FB0F8(v5);
    sub_100039184((uint64_t)v5);
  }
  else
  {
    sub_100049B74((uint64_t)&v3, &qword_100637E10);
  }
}

- (void)didReturn
{
  v2 = self;
  sub_1003F99E8();
}

- (_TtC14RecentsAvocado21DOCGoToViewController)init
{
  result = (_TtC14RecentsAvocado21DOCGoToViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_suggestionsTableViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_contentView));
  sub_100039184((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_initialCandidateSource);
  sub_100049B74((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_filteringSource, &qword_100639D28);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_scrollViewDidScrollObservation));
  sub_100049B74((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_currentGoToLocation, &qword_100639D20);
  long long v3 = (char *)self + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_requestID;
  uint64_t v4 = sub_1004CADE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController____lazy_storage___inputField));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController____lazy_storage___goButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController____lazy_storage___separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController____lazy_storage___noResultsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController____lazy_storage___suggestionsTableViewController));
  id v5 = *(void **)&self->filteringSource[OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController_metrics + 7];

  objc_super v6 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado21DOCGoToViewController____lazy_storage___closeBox);
  sub_10005AC04(v6);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003F99E8();

  return 0;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = sub_1004CDB50();
  uint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_1003FD4B0(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)inputTextFieldDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003FB934(v4);
}

- (void)performDismiss:(id)a3
{
}

@end
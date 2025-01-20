@interface DOCSearchController
- (BOOL)searchBarShouldBeginEditing:(id)a3;
- (UISearchControllerDelegate)delegate;
- (UISearchResultsUpdating)searchResultsUpdater;
- (UITraitCollection)traitCollection;
- (UIViewController)searchResultsController;
- (_TtC11SaveToFiles12DOCSearchBar)searchBar;
- (_TtC11SaveToFiles19DOCSearchController)initWithCoder:(id)a3;
- (_TtC11SaveToFiles19DOCSearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11SaveToFiles19DOCSearchController)initWithSearchResultsController:(id)a3;
- (_TtC11SaveToFiles31DOCItemCollectionViewController)resultCollectionViewController;
- (_TtP11SaveToFiles39DOCSearchControllerPresentationDelegate_)presentationDelegate;
- (void)deactivateAlongsideContainingTransitionCoordinator:(id)a3;
- (void)didDismissSearchController:(id)a3;
- (void)didPresentSearchController:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleSuggestionsTypingTimeout;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)searchController:(id)a3 didChangeFromSearchBarPlacement:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setSearchResultsUpdater:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation DOCSearchController

- (_TtC11SaveToFiles31DOCItemCollectionViewController)resultCollectionViewController
{
  return (_TtC11SaveToFiles31DOCItemCollectionViewController *)*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_resultCollectionViewController);
}

- (_TtP11SaveToFiles39DOCSearchControllerPresentationDelegate_)presentationDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  return (_TtP11SaveToFiles39DOCSearchControllerPresentationDelegate_ *)Strong;
}

- (void)setPresentationDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1004813D8();

  swift_unknownObjectRelease();
}

- (UISearchControllerDelegate)delegate
{
  return (UISearchControllerDelegate *)sub_100479F4C(self, (uint64_t)a2, (SEL *)&selRef_delegate);
}

- (void)setDelegate:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSearchController();
  [(DOCSearchController *)&v4 setDelegate:a3];
}

- (UIViewController)searchResultsController
{
  return (UIViewController *)sub_100479F4C(self, (uint64_t)a2, (SEL *)&selRef_searchResultsController);
}

- (UISearchResultsUpdating)searchResultsUpdater
{
  return (UISearchResultsUpdating *)sub_100479F4C(self, (uint64_t)a2, (SEL *)&selRef_searchResultsUpdater);
}

- (void)setSearchResultsUpdater:(id)a3
{
  if (a3 && a3 == self)
  {
    v4.receiver = a3;
    v4.super_class = (Class)type metadata accessor for DOCSearchController();
    [(DOCSearchController *)&v4 setSearchResultsUpdater:a3];
  }
  else
  {
    sub_1004D2DC0();
    __break(1u);
  }
}

- (_TtC11SaveToFiles19DOCSearchController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004814A0();
}

- (_TtC11SaveToFiles19DOCSearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_1004814A0();
}

- (_TtC11SaveToFiles12DOCSearchBar)searchBar
{
  return (_TtC11SaveToFiles12DOCSearchBar *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController__searchBar));
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100478A58();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100478E68();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCSearchController();
  id v6 = v8.receiver;
  id v7 = a3;
  [(DOCSearchController *)&v8 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  if (v7)
  {
    sub_100479E3C();
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCSearchController();
  id v4 = v6.receiver;
  [(DOCSearchController *)&v6 viewWillAppear:v3];
  id v5 = sub_10047728C();
  sub_10047E2B0();

  sub_10047A22C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCSearchController();
  id v4 = a3;
  id v5 = v6.receiver;
  [(DOCSearchController *)&v6 traitCollectionDidChange:v4];
  sub_100479FA4(0);
  sub_10047911C(a3);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  objc_super v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    objc_super v8 = sub_100322310;
  }
  else
  {
    objc_super v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  if ([(DOCSearchController *)v9 isActive])
  {
    sub_100479200((uint64_t (*)(id))v8, v7, a3);
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    v8();
  }
  sub_10003B980((uint64_t)v8);
LABEL_9:
}

- (void)deactivateAlongsideContainingTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_1004796D8(a3);
  swift_unknownObjectRelease();
}

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)sub_100479F4C(self, (uint64_t)a2, (SEL *)&selRef_traitCollection);
}

- (void)searchController:(id)a3 didChangeFromSearchBarPlacement:(int64_t)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_10047A22C();
}

- (void)willPresentSearchController:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v6 = Strong;
    if ([Strong respondsToSelector:"willPresentSearchController:"])
    {
      id v7 = a3;
      objc_super v8 = self;
      [v6 willPresentSearchController:v8];
    }
    swift_unknownObjectRelease();
  }
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  id v7 = self;
  sub_100479FA4(0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    objc_super v6 = Strong;
    if ([Strong respondsToSelector:"didPresentSearchController:"]) {
      [v6 didPresentSearchController:v7];
    }
    swift_unknownObjectRelease();
  }
  sub_10047B5BC();
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100481694();
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100481770();
}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.super.isa
        + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_activationTemporilyDisabled) & 1) != 0)
    return 0;
  else {
    return [a3 isEnabled];
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10047A6A8(v4);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1004812A8(v5);
}

- (void)handleSuggestionsTypingTimeout
{
  v2 = self;
  sub_10047B0F0();
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_selectedScopeIndex) = (Class)a4;
  id v5 = a3;
  objc_super v6 = self;
  sub_100477EC0();
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1004818A4();
}

- (void)updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_100481EE0(a4);

  swift_unknownObjectRelease();
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100481FC0();
}

- (_TtC11SaveToFiles19DOCSearchController)initWithSearchResultsController:(id)a3
{
  id v3 = a3;
  result = (_TtC11SaveToFiles19DOCSearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_resultCollectionViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_cachedSearchQuery));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController__suggesterManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_suggestionsTableViewContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_suggestionsTableViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController____lazy_storage___stackedSearchLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController____lazy_storage___suggestionsTableViewController));
  swift_release();
  swift_unknownObjectWeakDestroy();
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_searchDelegate);
  sub_10003BA48((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_presentationDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController__searchBar));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_suggestionsTypingTimeoutTimer));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles19DOCSearchController_selectedSuggestion);
}

@end
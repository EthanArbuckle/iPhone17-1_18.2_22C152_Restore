@interface SwiftUISearchController
+ (BOOL)_isFromSwiftUI;
- (BOOL)_canShowWhileLocked;
- (UISearchBar)searchBar;
- (_TtC7SwiftUI23SwiftUISearchController)init;
- (_TtC7SwiftUI23SwiftUISearchController)initWithCoder:(id)a3;
- (_TtC7SwiftUI23SwiftUISearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7SwiftUI23SwiftUISearchController)initWithSearchResultsController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)handleCustomAccessoryRecoveryGesture;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)searchController:(id)a3 willChangeToSearchBarPlacement:(int64_t)a4;
- (void)updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewIsAppearing:(BOOL)a3;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation SwiftUISearchController

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI23SwiftUISearchController)init
{
  return (_TtC7SwiftUI23SwiftUISearchController *)SwiftUISearchController.init()();
}

- (UISearchBar)searchBar
{
  v2 = self;
  id v3 = SwiftUISearchController._searchBar.getter();

  return (UISearchBar *)v3;
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)handleCustomAccessoryRecoveryGesture
{
  v2 = self;
  SwiftUISearchController.handleCustomAccessoryRecoveryGesture()();
}

- (BOOL)_canShowWhileLocked
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_allowsSecureDrawing);
}

- (void)viewIsAppearing:(BOOL)a3
{
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  SwiftUISearchController.viewDidLayoutSubviews()();
}

- (void)searchController:(id)a3 willChangeToSearchBarPlacement:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  specialized SwiftUISearchController.searchController(_:willChangeTo:)(a4);
}

- (void)willPresentSearchController:(id)a3
{
  v4 = (UISearchController *)a3;
  v5 = self;
  SwiftUISearchController.willPresentSearchController(_:)(v4);
}

- (void)willDismissSearchController:(id)a3
{
  id v7 = a3;
  v4 = self;
  v5 = SwiftUISearchController._searchBar.getter();
  int v6 = v5[OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_isActive];
  v5[OBJC_IVAR____TtC7SwiftUI14UIKitSearchBar_isActive] = 0;
  if (v6 == 1) {
    UIKitSearchBar.updateCustomScopeBarIsActive(_:isAnimated:)(0, 1);
  }
}

- (void)updateSearchResultsForSearchController:(id)a3 selectingSearchSuggestion:(id)a4
{
  type metadata accessor for UIKitSearchSuggestion(0);
  int v6 = *(void (**)(uint64_t))(swift_dynamicCastClassUnconditional()
                                      + OBJC_IVAR____TtC7SwiftUI21UIKitSearchSuggestion_platformItem
                                      + 408);
  if (!v6)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v6 == (void (*)(uint64_t))1)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v7 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  uint64_t v8 = outlined copy of AppIntentExecutor?((uint64_t)v6);
  v6(v8);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?((uint64_t)v6);

  swift_unknownObjectRelease();
}

- (_TtC7SwiftUI23SwiftUISearchController)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SwiftUISearchController.init(coder:)();
}

- (_TtC7SwiftUI23SwiftUISearchController)initWithSearchResultsController:(id)a3
{
  id v3 = a3;
  result = (_TtC7SwiftUI23SwiftUISearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUI23SwiftUISearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7SwiftUI23SwiftUISearchController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = MEMORY[0x1E4FBB718];
  outlined destroy of Toolbar.UpdateContext?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_searchItem, (uint64_t)&lazy cache variable for type metadata for ToolbarStorage.SearchItem?, (uint64_t)type metadata accessor for ToolbarStorage.SearchItem, MEMORY[0x1E4FBB718], (uint64_t (*)(void))type metadata accessor for ToolbarStorage.SearchItem?);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController____lazy_storage____searchBar));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_coordinator));
  outlined consume of PlatformItemCollection?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_suggestions), *((unsigned char *)&self->super.super.super._responderFlags + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_suggestions));
  outlined destroy of Toolbar.UpdateContext?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_configuration, (uint64_t)&lazy cache variable for type metadata for SearchFieldConfiguration?, (uint64_t)type metadata accessor for SearchFieldConfiguration, v3, (uint64_t (*)(void))type metadata accessor for ToolbarStorage.SearchItem?);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryRecoveryGesture));
  outlined consume of BoundInputsView?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent), *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent), *(void **)((char *)&self->super.super._view+ OBJC_IVAR____TtC7SwiftUI23SwiftUISearchController_customAccessoryContent));
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  SwiftUISearchController.presentationControllerWillDismiss(_:)((UIPresentationController)v4);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end
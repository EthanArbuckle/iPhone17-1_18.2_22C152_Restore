@interface UIKitSearchBarCoordinator
- (BOOL)searchBarShouldClear:(id)a3;
- (_TtC7SwiftUI25UIKitSearchBarCoordinator)init;
- (void)primaryActionTriggered:(id)a3;
- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3;
@end

@implementation UIKitSearchBarCoordinator

- (_TtC7SwiftUI25UIKitSearchBarCoordinator)init
{
  return (_TtC7SwiftUI25UIKitSearchBarCoordinator *)UIKitSearchBarCoordinator.init()();
}

- (void)primaryActionTriggered:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized UIKitSearchBarCoordinator.primaryActionTriggered(_:)((uint64_t)v5);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_isViewUpdating) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    MEMORY[0x1F4188790](v6);
    MEMORY[0x1F4188790](v7);
    id v8 = a3;
    v9 = self;
    static Update.dispatchImmediately<A>(_:)();

    swift_bridgeObjectRelease();
  }
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = (UISearchBar *)a3;
  v5 = self;
  UIKitSearchBarCoordinator.searchBarTextDidBeginEditing(_:)(v4);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized UIKitSearchBarCoordinator.searchBarTextDidEndEditing(_:)();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  swift_allocObject();
  swift_unknownObjectWeakInit();
  id v5 = a3;
  uint64_t v6 = self;
  swift_retain();
  static Update.enqueueAction(_:)();

  swift_release_n();
}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  specialized UIKitSearchScopeCoordinating<>.onChange(selectedScope:)(a4);
}

- (BOOL)searchBarShouldClear:(id)a3
{
  type metadata accessor for AccessibilityValueStorage?(0, (unint64_t *)&lazy cache variable for type metadata for ()?);
  id v5 = a3;
  id v6 = self;
  static Update.ensure<A>(_:)();

  return 1;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4 = (UITextField *)a3;
  id v5 = self;
  UIKitSearchBarCoordinator.textFieldDidChangeSelection(_:)(v4);
}

- (void).cxx_destruct
{
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_triggerSubmission));
  outlined consume of (@escaping @callee_guaranteed (@guaranteed NSFileWrapper?) -> (@owned NSFileWrapper, @error @owned Error))?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_clearAction));
  outlined destroy of PlatformItemList.Item((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_configuration, (uint64_t (*)(void))type metadata accessor for SearchFieldConfiguration?);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of BoundInputsView?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar), *(void *)&self->triggerSubmission[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar], *(void *)&self->triggerSubmission[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar + 8], *(void *)&self->clearAction[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar], *(void **)&self->clearAction[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_customScopeBar + 8]);
  outlined destroy of PlatformItemList.Item((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_selection, (uint64_t (*)(void))type metadata accessor for Binding<(TextSelection?, VersionSeed)>?);
  outlined destroy of weak FallbackResponderProvider?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_delegate);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_oldSuffix);
  uint64_t v4 = *(void *)&self->triggerSubmission[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_oldSuffix];
  uint64_t v5 = *(void *)&self->triggerSubmission[OBJC_IVAR____TtC7SwiftUI25UIKitSearchBarCoordinator_oldSuffix + 8];

  outlined consume of Text.Suffix.Storage(v3, v4, v5);
}

@end
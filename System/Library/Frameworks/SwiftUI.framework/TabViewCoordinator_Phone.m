@interface TabViewCoordinator_Phone
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (_TtC7SwiftUI24TabViewCoordinator_Phone)init;
- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5;
- (id)_tabBarController:(id)a3 sidebar:(id)a4 leadingSwipeActionsConfigurationForTab:(id)a5;
- (id)_tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5;
- (unint64_t)_uip_tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5;
- (void)_tabBarController:(id)a3 sidebar:(id)a4 visibilityDidChangeForTabs:(id)a5;
- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4;
- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4;
- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4;
- (void)_uip_tabBarController:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationTab:(id)a5;
- (void)_uip_tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
- (void)tabBarControllerDidEndEditing:(id)a3;
@end

@implementation TabViewCoordinator_Phone

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = objc_msgSend(v6, sel_selectedViewController);
  swift_unknownObjectWeakAssign();

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = (UITabBarController *)a3;
  id v7 = (UIViewController *)a4;
  v8 = self;
  TabViewCoordinator_Phone.tabBarController(_:didSelect:)(v6, v7);
}

- (unint64_t)_uip_tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5
{
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_tabCache);
  swift_bridgeObjectRetain();
  id v9 = a3;
  id v10 = a4;
  swift_unknownObjectRetain();
  v11 = self;
  unint64_t v12 = specialized TabViewCoordinator_Phone.operationToAcceptDropItems(from:onto:tabCache:)(v10, v8);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (void)_uip_tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5
{
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_tabCache);
  swift_bridgeObjectRetain();
  id v10 = a3;
  id v11 = a4;
  swift_unknownObjectRetain();
  unint64_t v12 = self;
  TabViewCoordinator_Phone.acceptDropItems(from:onto:tabCache:)((uint64_t)a5, v11, v9);

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)_uip_tabBarController:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationTab:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  uint64_t v9 = self;
  specialized TabViewCoordinator_Phone._uip_tabBarController(_:dropSessionDidUpdate:withDestinationTab:)(a5);

  swift_unknownObjectRelease();
}

- (void)tabBarControllerDidEndEditing:(id)a3
{
  v4 = (UITabBarController *)a3;
  v5 = self;
  TabViewCoordinator_Phone.tabBarControllerDidEndEditing(_:)(v4);
}

- (void)_tabElementGroup:(id)a3 didSelectElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  specialized TabViewCoordinator_Phone._tabElementGroup(_:didSelect:)(v7);
}

- (void)_tabElementGroup:(id)a3 didCustomizeDisplayOrder:(id)a4
{
  uint64_t v6 = MEMORY[0x1E4FBB718];
  type metadata accessor for Binding<TabViewCustomization>?(0, &lazy cache variable for type metadata for Binding<TabViewCustomization>?, (uint64_t (*)(uint64_t))type metadata accessor for Binding<TabViewCustomization>, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v15 - v8;
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = (char *)self + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_customization;
  swift_beginAccess();
  outlined init with copy of Binding<TabViewCustomization>?((uint64_t)v11, (uint64_t)v9, &lazy cache variable for type metadata for Binding<TabViewCustomization>?, (uint64_t (*)(uint64_t))type metadata accessor for Binding<TabViewCustomization>);
  uint64_t v12 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_tabCache);
  swift_bridgeObjectRetain();
  id v13 = a3;
  v14 = self;
  specialized TabViewCoordinator_Phone.updatedOrder(within:newOrder:customization:tabCache:)(v13, v10, (uint64_t)v9, v12);
  swift_bridgeObjectRelease();
  outlined destroy of Binding<AnyHashable>((uint64_t)v9, (uint64_t)&lazy cache variable for type metadata for Binding<TabViewCustomization>?, (uint64_t)type metadata accessor for Binding<TabViewCustomization>, v6, (uint64_t (*)(void))type metadata accessor for Binding<TabViewCustomization>?);

  swift_bridgeObjectRelease();
}

- (void)_tabBarController:(id)a3 sidebarVisibilityDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  specialized TabViewCoordinator_Phone._tabBarController(_:sidebarVisibilityDidChange:)(v7);
}

- (void)_tabBarController:(id)a3 sidebar:(id)a4 visibilityDidChangeForTabs:(id)a5
{
  uint64_t v8 = MEMORY[0x1E4FBB718];
  type metadata accessor for Binding<TabViewCustomization>?(0, &lazy cache variable for type metadata for Binding<TabViewCustomization>?, (uint64_t (*)(uint64_t))type metadata accessor for Binding<TabViewCustomization>, MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v9 - 8);
  id v11 = (char *)&v18 - v10;
  type metadata accessor for NSObject(0, &lazy cache variable for type metadata for _UITab);
  lazy protocol witness table accessor for type _UITab and conformance NSObject();
  uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v13 = (char *)self + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_customization;
  swift_beginAccess();
  outlined init with copy of Binding<TabViewCustomization>?((uint64_t)v13, (uint64_t)v11, &lazy cache variable for type metadata for Binding<TabViewCustomization>?, (uint64_t (*)(uint64_t))type metadata accessor for Binding<TabViewCustomization>);
  uint64_t v14 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_tabCache);
  swift_bridgeObjectRetain();
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  specialized TabViewCoordinator_Phone.updatedSidebarVisibility(for:customization:tabCache:)(v12, (uint64_t)v11, v14);
  swift_bridgeObjectRelease();
  outlined destroy of Binding<AnyHashable>((uint64_t)v11, (uint64_t)&lazy cache variable for type metadata for Binding<TabViewCustomization>?, (uint64_t)type metadata accessor for Binding<TabViewCustomization>, v8, (uint64_t (*)(void))type metadata accessor for Binding<TabViewCustomization>?);

  swift_bridgeObjectRelease();
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 leadingSwipeActionsConfigurationForTab:(id)a5
{
  return @objc TabViewCoordinator_Phone._tabBarController(_:sidebar:leadingSwipeActionsConfigurationFor:)((char *)self, (uint64_t)a2, a3, a4, a5, 0);
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 trailingSwipeActionsConfigurationForTab:(id)a5
{
  return @objc TabViewCoordinator_Phone._tabBarController(_:sidebar:leadingSwipeActionsConfigurationFor:)((char *)self, (uint64_t)a2, a3, a4, a5, 1);
}

- (id)_tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_tabCache);
  swift_bridgeObjectRetain();
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = self;
  uint64_t v14 = (void *)TabViewCoordinator_Phone.contextMenu(for:tabCache:)(v12, v9);

  swift_bridgeObjectRelease();

  return v14;
}

- (_TtC7SwiftUI24TabViewCoordinator_Phone)init
{
  result = (_TtC7SwiftUI24TabViewCoordinator_Phone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectWeakDestroy();
  outlined consume of TabSidebarConfiguration?(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration), *(void *)&self->tabs[OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration], *(void *)&self->tabCache[OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration], *(void *)&self->selectionCache[OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration], *(void *)&self->viewControllers[OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration], *(void *)&self->groupHostCache[OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration], *(void *)&self->currentTabIdentifiers[OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration], *(void *)&self->selected[OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration], *(_WORD *)&self->selected[OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_sidebarConfiguration + 8]);
  uint64_t v3 = MEMORY[0x1E4FBB718];
  outlined destroy of Binding<AnyHashable>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_customization, (uint64_t)&lazy cache variable for type metadata for Binding<TabViewCustomization>?, (uint64_t)type metadata accessor for Binding<TabViewCustomization>, MEMORY[0x1E4FBB718], (uint64_t (*)(void))type metadata accessor for Binding<TabViewCustomization>?);
  swift_unknownObjectWeakDestroy();
  outlined destroy of Binding<AnyHashable>((uint64_t)self + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_searchState, (uint64_t)&lazy cache variable for type metadata for Binding<SearchFieldState>?, (uint64_t)type metadata accessor for Binding<SearchFieldState>, v3, (uint64_t (*)(void))type metadata accessor for Binding<TabViewCustomization>?);
  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7SwiftUI24TabViewCoordinator_Phone_currentTabDropTarget);
}

@end
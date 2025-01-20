@interface AvailableAppsView.SearchBar.Coordinator
- (BOOL)textFieldShouldClear:(id)a3;
- (_TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator)init;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation AvailableAppsView.SearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_220D81AC0(v5);
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
}

- (void)searchBarTextDidEndEditing:(id)a3
{
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_sharedApplication);
  objc_msgSend(v8, sel_sendAction_to_from_forEvent_, sel_resignFirstResponder, 0, 0, 0);
}

- (BOOL)textFieldShouldClear:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_220D81C34();

  return self & 1;
}

- (_TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator)init
{
  result = (_TtCVV15FocusSettingsUI17AvailableAppsView9SearchBar11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
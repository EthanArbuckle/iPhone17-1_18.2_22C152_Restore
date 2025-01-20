@interface SearchBar.Coordinator
- (_TtCV15ShazamEventsApp9SearchBar11Coordinator)init;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
@end

@implementation SearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  v5 = self;
  v9[4] = sub_10006BAA0;
  v9[5] = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10013B904;
  v9[3] = &unk_100190F20;
  v6 = _Block_copy(v9);
  id v7 = a3;
  v8 = self;
  [v5 animateWithDuration:0 delay:v6 options:0 animations:0.3 completion:0.0];
  _Block_release(v6);
}

- (_TtCV15ShazamEventsApp9SearchBar11Coordinator)init
{
  result = (_TtCV15ShazamEventsApp9SearchBar11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
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
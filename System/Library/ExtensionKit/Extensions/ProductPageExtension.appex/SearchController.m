@interface SearchController
- (BOOL)searchBarShouldClear:(id)a3;
- (NSArray)keyCommands;
- (UISearchBar)searchBar;
- (_TtC20ProductPageExtension16SearchController)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension16SearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC20ProductPageExtension16SearchController)initWithSearchResultsController:(id)a3;
- (void)_searchBarWillLayoutSubviews:(id)a3 inSearchFieldContainer:(id)a4 searchTextFieldFrame:(CGRect)a5 cancelButtonFrame:(CGRect)a6;
- (void)handleCancelKeyCommandWithCommand:(id)a3;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SearchController

- (UISearchBar)searchBar
{
  v2 = self;
  id v3 = sub_1001A65C4();

  return (UISearchBar *)v3;
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for SearchController();
  [(SearchController *)&v2 viewWillLayoutSubviews];
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = [(SearchController *)v5 searchBar];
  [(UISearchBar *)v6 _setDisableDictationButton:0];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001A784C();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension16SearchController_filterButton);
  id v5 = a3;
  v12 = self;
  [v4 setEnabled:0];
  id v6 = [(SearchController *)v12 delegate];
  if (v6)
  {
    id v7 = v6;
    swift_getObjectType();
    uint64_t v8 = swift_conformsToProtocol2();
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v8) {
      id v10 = v7;
    }
    else {
      id v10 = 0;
    }
    if (v10)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(ObjectType, v9);
    }
    swift_unknownObjectRelease();
  }
  [(SearchController *)v12 setActive:0];
}

- (BOOL)searchBarShouldClear:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id v6 = [(SearchController *)v4 delegate];
  if (v6)
  {
    id v7 = v6;
    swift_getObjectType();
    uint64_t v8 = swift_conformsToProtocol2();
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    if (v8) {
      id v10 = v7;
    }
    else {
      id v10 = 0;
    }
    if (v10)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(ObjectType, v9);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
  return 1;
}

- (void)_searchBarWillLayoutSubviews:(id)a3 inSearchFieldContainer:(id)a4 searchTextFieldFrame:(CGRect)a5 cancelButtonFrame:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v10 = a5.size.height;
  CGFloat v11 = a5.size.width;
  CGFloat v12 = a5.origin.y;
  CGFloat v13 = a5.origin.x;
  id v16 = a3;
  id v17 = a4;
  v18 = self;
  sub_1001A7D90(a4, v13, v12, v11, v10, x, y, width, height);
}

- (NSArray)keyCommands
{
  objc_super v2 = self;
  unint64_t v3 = sub_1001A7134();

  if (v3)
  {
    sub_100019840(0, (unint64_t *)&qword_10094C750);
    v4.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)handleCancelKeyCommandWithCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1001A824C();
}

- (_TtC20ProductPageExtension16SearchController)initWithSearchResultsController:(id)a3
{
  id v4 = a3;
  id v5 = (_TtC20ProductPageExtension16SearchController *)sub_1001A8350((uint64_t)a3);

  return v5;
}

- (_TtC20ProductPageExtension16SearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10077BCB0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC20ProductPageExtension16SearchController *)sub_1001A7380(v5, v7, a4);
}

- (_TtC20ProductPageExtension16SearchController)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtension16SearchController *)sub_1001A7508(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16SearchController_searchTextInput));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16SearchController____lazy_storage____searchBar));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension16SearchController_filterButtonHandler));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension16SearchController_filterButton);
}

@end
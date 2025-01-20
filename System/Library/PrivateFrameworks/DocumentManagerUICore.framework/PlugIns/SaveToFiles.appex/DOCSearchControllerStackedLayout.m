@interface DOCSearchControllerStackedLayout
- (_TtC11SaveToFiles32DOCSearchControllerStackedLayout)init;
- (void)_searchBarWillLayoutSubviews:(id)a3 inSearchFieldContainer:(id)a4 searchTextFieldFrame:(CGRect)a5 cancelButtonFrame:(CGRect)a6;
@end

@implementation DOCSearchControllerStackedLayout

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
  id v17 = a3;
  id v18 = a4;
  v19 = self;
  sub_10047E7E4(a3, a4, v13, v12, v11, v10, x, y, width, height);
}

- (_TtC11SaveToFiles32DOCSearchControllerStackedLayout)init
{
  result = (_TtC11SaveToFiles32DOCSearchControllerStackedLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11SaveToFiles32DOCSearchControllerStackedLayout_appMenuButton);
}

@end
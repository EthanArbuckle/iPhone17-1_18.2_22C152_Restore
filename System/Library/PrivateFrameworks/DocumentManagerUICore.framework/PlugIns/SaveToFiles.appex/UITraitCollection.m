@interface UITraitCollection
- (_TtC11SaveToFiles21DOCNavigationBarStyle)preferredNavigationBarStyle_objc;
- (int64_t)sourceListPresentationContext;
- (int64_t)sourceOutlineStyle;
@end

@implementation UITraitCollection

- (int64_t)sourceOutlineStyle
{
  v2 = self;
  unint64_t v3 = [(UITraitCollection *)v2 sourceListPresentationContext];
  if (v3 >= 2)
  {
    int64_t result = sub_1004D2FF0();
    __break(1u);
  }
  else
  {

    return v3;
  }
  return result;
}

- (int64_t)sourceListPresentationContext
{
  return [(UITraitCollection *)self _splitViewControllerContext] == 0;
}

- (_TtC11SaveToFiles21DOCNavigationBarStyle)preferredNavigationBarStyle_objc
{
  v2 = self;
  BOOL v3 = DOCUsePadIdiomForTraits()
    && (id)[(UITraitCollection *)v2 horizontalSizeClass] == (id)2;
  v4 = (objc_class *)type metadata accessor for DOCNavigationBarStyle();
  v5 = objc_allocWithZone(v4);
  v5[OBJC_IVAR____TtC11SaveToFiles21DOCNavigationBarStyle_style] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = [(UITraitCollection *)&v8 init];

  return (_TtC11SaveToFiles21DOCNavigationBarStyle *)v6;
}

@end
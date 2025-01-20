@interface CKMonoskiBadgeViewFactory
+ (id)badgeViewWithSupportsGradient:(BOOL)a3;
- (_TtC7ChatKit25CKMonoskiBadgeViewFactory)init;
@end

@implementation CKMonoskiBadgeViewFactory

+ (id)badgeViewWithSupportsGradient:(BOOL)a3
{
  id v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1E923D3D0));
  v4 = (void *)sub_18F7B7D30();
  id v5 = objc_msgSend(v4, sel_view);

  if (v5)
  {
    id v7 = objc_msgSend(self, sel_clearColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v7);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC7ChatKit25CKMonoskiBadgeViewFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKMonoskiBadgeViewFactory();
  return [(CKMonoskiBadgeViewFactory *)&v3 init];
}

@end
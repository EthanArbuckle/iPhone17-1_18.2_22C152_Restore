@interface CheckboxComponent
- (_TtC19CoreDynamicUIPlugin17CheckboxComponent)init;
- (_TtC19CoreDynamicUIPlugin17CheckboxComponent)initWithFrame:(CGRect)a3;
- (void)handleTap;
- (void)prepareForReuse;
@end

@implementation CheckboxComponent

- (_TtC19CoreDynamicUIPlugin17CheckboxComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin17CheckboxComponent *)sub_2707C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_27368();
}

- (void)handleTap
{
  v2 = self;
  sub_27BFC();
}

- (_TtC19CoreDynamicUIPlugin17CheckboxComponent)init
{
}

- (void).cxx_destruct
{
  swift_release();
  sub_EF88((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin17CheckboxComponent_checkedSegue], &qword_BAAD0);
  sub_EF88((uint64_t)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin17CheckboxComponent_uncheckedSegue], &qword_BAAD0);
  v3 = *(void **)&self->AMSUICommonCollectionViewCell_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin17CheckboxComponent_checkboxImageView];
}

@end
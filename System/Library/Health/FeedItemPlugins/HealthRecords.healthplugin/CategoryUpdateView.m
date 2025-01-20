@interface CategoryUpdateView
- (_TtC13HealthRecords18CategoryUpdateView)initWithCoder:(id)a3;
- (_TtC13HealthRecords18CategoryUpdateView)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation CategoryUpdateView

- (_TtC13HealthRecords18CategoryUpdateView)initWithFrame:(CGRect)a3
{
  return (_TtC13HealthRecords18CategoryUpdateView *)sub_2408BB85C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13HealthRecords18CategoryUpdateView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView____lazy_storage___countLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView____lazy_storage___descriptionLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView____lazy_storage___actionLabel) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView_viewData);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  id v5 = a3;

  result = (_TtC13HealthRecords18CategoryUpdateView *)sub_2409553A8();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CategoryUpdateView();
  id v2 = v5.receiver;
  [(CategoryUpdateView *)&v5 tintColorDidChange];
  id v3 = sub_2408BB6BC();
  id v4 = objc_msgSend(v2, sel_tintColor, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setTextColor_, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView____lazy_storage___countLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView____lazy_storage___descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView____lazy_storage___actionLabel));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView_viewData);
  uint64_t v4 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC13HealthRecords18CategoryUpdateView_viewData);

  sub_2408BF0B8(v3, v4);
}

@end
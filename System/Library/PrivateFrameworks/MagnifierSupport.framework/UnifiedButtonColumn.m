@interface UnifiedButtonColumn
- (void)layoutSubviews;
@end

@implementation UnifiedButtonColumn

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(UnifiedButtonColumn *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MagnifierSupport19UnifiedButtonColumn_buttonView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
  sub_235829148();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19UnifiedButtonColumn_buttonView));
}

@end
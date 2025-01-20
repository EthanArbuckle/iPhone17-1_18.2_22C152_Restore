@interface DOCCircularProgressView
- (_TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DOCCircularProgressView

- (_TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001E6CEC();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularProgressView();
  id v2 = v3.receiver;
  [(DOCCircularProgressView *)&v3 tintColorDidChange];
  sub_1001E4FB4();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001E50F4(v4);
}

- (_TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView_indeterminateLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView_progressBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView_progressFillColor));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_9D896252D4D900374D69BC6DA758948223DOCCircularProgressView_progressBackgroundColor);
}

@end
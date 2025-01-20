@interface DOCCircularProgressView
- (_TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)tintColorDidChange;
@end

@implementation DOCCircularProgressView

- (_TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100124CD0();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularProgressView();
  id v2 = v3.receiver;
  [(DOCCircularProgressView *)&v3 tintColorDidChange];
  sub_100122F98();
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1001230D8(v4);
}

- (_TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView_borderLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView_progressLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView_indeterminateLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView_progressBorderColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView_progressFillColor));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntentsP33_C76C042F41B899848F1EB7271CEEF98223DOCCircularProgressView_progressBackgroundColor);
}

@end
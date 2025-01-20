@interface InputAccessoryGenerator.RootUIView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView)initWithCoder:(id)a3;
- (_TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InputAccessoryGenerator.RootUIView

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host);
  if (v2)
  {
    objc_msgSend(v2, sel_intrinsicContentSize);
  }
  else
  {
    double v3 = 0.0;
    double v4 = 0.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(InputAccessoryGenerator.RootUIView *)&v5 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host];
  if (v3)
  {
    double v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

    v2 = v4;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host);
  if (v3)
  {
    objc_msgSend(v3, sel_sizeThatFits_, a3.width, a3.height);
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[InputAccessoryGenerator.RootUIView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(InputAccessoryGenerator.RootUIView *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC7SwiftUI23InputAccessoryGeneratorP33_5C36F4A49E2E2562B910FE6399D2C51E10RootUIView_host));
}

@end
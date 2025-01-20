@interface MFSecureWindow
+ (BOOL)_isSecure;
- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithCoder:(id)a3;
- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithFrame:(CGRect)a3;
- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithWindowScene:(id)a3;
@end

@implementation MFSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithWindowScene:(id)a3
{
  return (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow *)sub_2358BFF30(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for MFSecureWindow, (SEL *)&selRef_initWithWindowScene_);
}

- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MFSecureWindow();
  return -[MFSecureWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow *)sub_2358C0018(self, (uint64_t)a2, (uint64_t)a3, 0, (uint64_t (*)(uint64_t))type metadata accessor for MFSecureWindow);
}

- (_TtC16MagnifierSupportP33_5ED5CD080D73374E7AF8ACA82011EE8D14MFSecureWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MFSecureWindow();
  return -[MFSecureWindow initWithContentRect:](&v8, sel_initWithContentRect_, x, y, width, height);
}

@end
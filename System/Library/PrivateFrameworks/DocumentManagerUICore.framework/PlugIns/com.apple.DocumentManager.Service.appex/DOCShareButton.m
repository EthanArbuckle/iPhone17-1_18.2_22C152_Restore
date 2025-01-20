@interface DOCShareButton
- (_TtC33com_apple_DocumentManager_ServiceP33_D1F8631902FAEB4BA7726F23C817A13614DOCShareButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
- (void)updateConfiguration;
@end

@implementation DOCShareButton

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(DOCShareButton *)&v3 tintColorDidChange];
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);
}

- (void)updateConfiguration
{
  id v2 = self;
  sub_1000897CC();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(DOCShareButton *)&v4 layoutSubviews];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  [v2 _setContinuousCornerRadius:v3 * 0.5];
}

- (_TtC33com_apple_DocumentManager_ServiceP33_D1F8631902FAEB4BA7726F23C817A13614DOCShareButton)initWithFrame:(CGRect)a3
{
}

@end
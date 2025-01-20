@interface DOCShareButton
- (_TtC11SaveToFilesP33_8867B9CF0B52115FD9A7DF2785A02EB614DOCShareButton)initWithFrame:(CGRect)a3;
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
  sub_100412920();
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

- (_TtC11SaveToFilesP33_8867B9CF0B52115FD9A7DF2785A02EB614DOCShareButton)initWithFrame:(CGRect)a3
{
}

@end
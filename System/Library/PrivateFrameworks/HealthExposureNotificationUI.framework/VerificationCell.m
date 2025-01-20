@interface VerificationCell
- (_TtC28HealthExposureNotificationUI16VerificationCell)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI16VerificationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation VerificationCell

- (_TtC28HealthExposureNotificationUI16VerificationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC28HealthExposureNotificationUI16VerificationCell *)sub_229414794((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_229413E4C);
}

- (_TtC28HealthExposureNotificationUI16VerificationCell)initWithCoder:(id)a3
{
  result = (_TtC28HealthExposureNotificationUI16VerificationCell *)sub_2294195F8();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for VerificationCell();
  id v2 = v5.receiver;
  [(VerificationCell *)&v5 layoutSubviews];
  objc_msgSend(v2, sel_layoutMargins, v5.receiver, v5.super_class);
  double v4 = v3;
  objc_msgSend(v2, sel_layoutMargins);
  objc_msgSend(v2, sel_setSeparatorInset_, 0.0, v4, 0.0);
}

@end
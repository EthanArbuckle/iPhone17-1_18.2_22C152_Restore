@interface VerificationCheckmarkCell
- (BOOL)isChecked;
- (UILabel)label;
- (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setIsChecked:(BOOL)a3;
@end

@implementation VerificationCheckmarkCell

- (UILabel)label
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_label));
}

- (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell *)sub_229414794((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_22941410C);
}

- (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_label;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_accessoryImageView;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F82828]), sel_init);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_isChecked) = 0;

  result = (_TtC28HealthExposureNotificationUI25VerificationCheckmarkCell *)sub_2294195F8();
  __break(1u);
  return result;
}

- (BOOL)isChecked
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_isChecked);
}

- (void)setIsChecked:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_isChecked) = a3;
  [(VerificationCheckmarkCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2294148E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_label));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI25VerificationCheckmarkCell_accessoryImageView);
}

@end
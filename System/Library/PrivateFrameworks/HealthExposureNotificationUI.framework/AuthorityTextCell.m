@interface AuthorityTextCell
- (_TtC28HealthExposureNotificationUI17AuthorityTextCell)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI17AuthorityTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation AuthorityTextCell

- (_TtC28HealthExposureNotificationUI17AuthorityTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC28HealthExposureNotificationUI17AuthorityTextCell *)sub_229414794((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2294138E8);
}

- (_TtC28HealthExposureNotificationUI17AuthorityTextCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC28HealthExposureNotificationUI17AuthorityTextCell_authorityTextView) = 0;
  id v4 = a3;

  result = (_TtC28HealthExposureNotificationUI17AuthorityTextCell *)sub_2294195F8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI17AuthorityTextCell_authorityTextView));
}

@end
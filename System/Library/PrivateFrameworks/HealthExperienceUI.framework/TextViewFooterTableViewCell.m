@interface TextViewFooterTableViewCell
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC18HealthExperienceUI27TextViewFooterTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27TextViewFooterTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TextViewFooterTableViewCell

- (_TtC18HealthExperienceUI27TextViewFooterTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)_sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC18HealthExperienceUI27TextViewFooterTableViewCell *)TextViewFooterTableViewCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI27TextViewFooterTableViewCell)initWithCoder:(id)a3
{
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return sub_1AD5E1DF4(self, (uint64_t)a2, a3, (uint64_t)a4, a5.location, a5.length, a6, &OBJC_IVAR____TtC18HealthExperienceUI27TextViewFooterTableViewCell_parentViewController, &OBJC_IVAR____TtC18HealthExperienceUI27TextViewFooterTableViewCell_item);
}

- (void).cxx_destruct
{
}

@end
@interface TextViewCollectionReusableView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC18HealthExperienceUI30TextViewCollectionReusableView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI30TextViewCollectionReusableView)initWithFrame:(CGRect)a3;
@end

@implementation TextViewCollectionReusableView

- (_TtC18HealthExperienceUI30TextViewCollectionReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI30TextViewCollectionReusableView *)TextViewCollectionReusableView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI30TextViewCollectionReusableView)initWithCoder:(id)a3
{
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return sub_1AD5E1DF4(self, (uint64_t)a2, a3, (uint64_t)a4, a5.location, a5.length, a6, &OBJC_IVAR____TtC18HealthExperienceUI30TextViewCollectionReusableView_parentViewController, &OBJC_IVAR____TtC18HealthExperienceUI30TextViewCollectionReusableView_item);
}

- (void).cxx_destruct
{
}

@end
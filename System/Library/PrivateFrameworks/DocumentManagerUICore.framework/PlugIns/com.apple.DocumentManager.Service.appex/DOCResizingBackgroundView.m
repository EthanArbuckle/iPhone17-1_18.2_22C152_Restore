@interface DOCResizingBackgroundView
- (CGSize)intrinsicContentSize;
- (_TtC33com_apple_DocumentManager_ServiceP33_6AD551560F1E7E475E2775CEA101CAEE25DOCResizingBackgroundView)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_ServiceP33_6AD551560F1E7E475E2775CEA101CAEE25DOCResizingBackgroundView)initWithFrame:(CGRect)a3;
@end

@implementation DOCResizingBackgroundView

- (CGSize)intrinsicContentSize
{
  double v2 = UIViewNoIntrinsicMetric;
  double v3 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_6AD551560F1E7E475E2775CEA101CAEE25DOCResizingBackgroundView_preferredHeight);
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC33com_apple_DocumentManager_ServiceP33_6AD551560F1E7E475E2775CEA101CAEE25DOCResizingBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_6AD551560F1E7E475E2775CEA101CAEE25DOCResizingBackgroundView_preferredHeight) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[DOCResizingBackgroundView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC33com_apple_DocumentManager_ServiceP33_6AD551560F1E7E475E2775CEA101CAEE25DOCResizingBackgroundView)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC33com_apple_DocumentManager_ServiceP33_6AD551560F1E7E475E2775CEA101CAEE25DOCResizingBackgroundView_preferredHeight) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(DOCResizingBackgroundView *)&v7 initWithCoder:a3];
}

@end
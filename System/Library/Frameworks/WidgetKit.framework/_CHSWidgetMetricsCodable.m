@interface _CHSWidgetMetricsCodable
- (_CHSWidgetMetricsCodable)initWithCoder:(id)a3;
- (_CHSWidgetMetricsCodable)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8 widgetGroupMargins:(id)a9 nestedContentMetrics:(id)a10;
@end

@implementation _CHSWidgetMetricsCodable

- (_CHSWidgetMetricsCodable)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CHSWidgetMetricsCodable();
  return [(CHSWidgetMetrics *)&v5 initWithCoder:a3];
}

- (_CHSWidgetMetricsCodable)initWithSize:(CGSize)a3 cornerRadius:(double)a4 scaleFactor:(double)a5 fontStyle:(int64_t)a6 margins:(id)a7 supportsDynamicText:(unint64_t)a8 widgetGroupMargins:(id)a9 nestedContentMetrics:(id)a10
{
  v10 = a10;
  double height = a3.height;
  double width = a3.width;
  if (a10)
  {
    sub_191B016E0(0, &qword_1E92E3080);
    sub_191B016E0(0, (unint64_t *)&qword_1EB44C010);
    sub_191C67924((unint64_t *)&qword_1E92E4A20, &qword_1E92E3080);
    sub_191CF5248();
    id v20 = a7;
    id v21 = a9;
    v10 = (void *)sub_191CF5238();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v22 = a7;
    id v23 = a9;
  }
  v26.receiver = self;
  v26.super_class = (Class)type metadata accessor for CHSWidgetMetricsCodable();
  v24 = -[CHSWidgetMetrics initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:widgetGroupMargins:nestedContentMetrics:](&v26, sel_initWithSize_cornerRadius_scaleFactor_fontStyle_margins_supportsDynamicText_widgetGroupMargins_nestedContentMetrics_, a6, a7, a8, a9, v10, width, height, a4, a5);

  return v24;
}

@end
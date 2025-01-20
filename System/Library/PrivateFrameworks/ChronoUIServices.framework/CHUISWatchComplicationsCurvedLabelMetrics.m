@interface CHUISWatchComplicationsCurvedLabelMetrics
- (CHUISWatchComplicationsCurvedLabelMetrics)initWithInterior:(BOOL)a3 tracking:(double)a4 circleCenter:(CGPoint)a5 circleRadius:(double)a6 maximumAngularWidth:(double)a7 centerAngle:(double)a8 fontSize:(double)a9 textColor:(id)a10 accessoryPlacement:(unint64_t)a11 accessoryPadding:(double)a12 accessoryMaxSize:(CGSize)a13;
- (CHUISWatchComplicationsCurvedLabelMetrics)initWithPath:(id)a3 fontSize:(double)a4 textColor:(id)a5 accessoryPlacement:(unint64_t)a6 accessoryPadding:(double)a7 accessoryMaxSize:(CGSize)a8;
@end

@implementation CHUISWatchComplicationsCurvedLabelMetrics

- (CHUISWatchComplicationsCurvedLabelMetrics)initWithInterior:(BOOL)a3 tracking:(double)a4 circleCenter:(CGPoint)a5 circleRadius:(double)a6 maximumAngularWidth:(double)a7 centerAngle:(double)a8 fontSize:(double)a9 textColor:(id)a10 accessoryPlacement:(unint64_t)a11 accessoryPadding:(double)a12 accessoryMaxSize:(CGSize)a13
{
  double y = a5.y;
  double x = a5.x;
  BOOL v22 = a3;
  id v24 = a10;
  v28.receiver = self;
  v28.super_class = (Class)CHUISWatchComplicationsCurvedLabelMetrics;
  v25 = [(CHSWatchComplicationsCurvedLabelMetrics *)&v28 init];
  v26 = v25;
  if (v25)
  {
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v25 setInterior:v22];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setTracking:a4];
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setCircleCenter:](v26, "setCircleCenter:", x, y);
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setCircleRadius:a6];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setMaximumAngularWidth:a7];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setCenterAngle:a8];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setBezierPath:0];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setFontSize:a9];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setTextColor:v24];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setAccessoryPlacement:a11];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v26 setAccessoryPadding:a12];
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setAccessoryMaxSize:](v26, "setAccessoryMaxSize:", v29, v30);
  }

  return v26;
}

- (CHUISWatchComplicationsCurvedLabelMetrics)initWithPath:(id)a3 fontSize:(double)a4 textColor:(id)a5 accessoryPlacement:(unint64_t)a6 accessoryPadding:(double)a7 accessoryMaxSize:(CGSize)a8
{
  double height = a8.height;
  double width = a8.width;
  id v15 = a3;
  id v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHUISWatchComplicationsCurvedLabelMetrics;
  v17 = [(CHSWatchComplicationsCurvedLabelMetrics *)&v21 init];
  v18 = v17;
  if (v17)
  {
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v17 setInterior:0];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v18 setTracking:0.0];
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F58C28]), "initWithCGPath:", objc_msgSend(v15, "CGPath"));
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v18 setBezierPath:v19];

    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v18 setFontSize:a4];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v18 setTextColor:v16];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v18 setAccessoryPlacement:a6];
    [(CHSMutableWatchComplicationsCurvedLabelMetrics *)v18 setAccessoryPadding:a7];
    -[CHSMutableWatchComplicationsCurvedLabelMetrics setAccessoryMaxSize:](v18, "setAccessoryMaxSize:", width, height);
  }

  return v18;
}

@end
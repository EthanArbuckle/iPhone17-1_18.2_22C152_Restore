@interface PDFCycleTrackingPage
- (_TtC24MenstrualCyclesAppPlugin20PDFCycleTrackingPage)init;
- (_TtC24MenstrualCyclesAppPlugin20PDFCycleTrackingPage)initWithImage:(id)a3 options:(id)a4;
- (void)drawWithBox:(int64_t)a3 toContext:(CGContext *)a4;
@end

@implementation PDFCycleTrackingPage

- (void)drawWithBox:(int64_t)a3 toContext:(CGContext *)a4
{
  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType();
  v6 = a4;
  id v7 = v16.receiver;
  [(PDFCycleTrackingPage *)&v16 drawWithBox:a3 toContext:v6];
  UIGraphicsPushContext(v6);
  CGContextSaveGState(v6);
  objc_msgSend(v7, sel_boundsForBox_, a3, v16.receiver, v16.super_class);
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGContextTranslateCTM(v6, 0.0, v14);
  CGContextScaleCTM(v6, 1.0, -1.0);
  sub_2415B055C(v9, v11, v13, v15);
  CGContextRestoreGState(v6);
  UIGraphicsPopContext();
}

- (_TtC24MenstrualCyclesAppPlugin20PDFCycleTrackingPage)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PDFCycleTrackingPage *)&v3 init];
}

- (_TtC24MenstrualCyclesAppPlugin20PDFCycleTrackingPage)initWithImage:(id)a3 options:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for ImageInitializationOption(0);
  sub_2415B076C(&qword_268CFA0B0, type metadata accessor for ImageInitializationOption);
  sub_241631B38();
  id v7 = a3;
  double v8 = (void *)sub_241631B18();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = ObjectType;
  CGFloat v9 = [(PDFCycleTrackingPage *)&v12 initWithImage:v7 options:v8];

  double v10 = v9;
  if (v10) {

  }
  return v10;
}

@end
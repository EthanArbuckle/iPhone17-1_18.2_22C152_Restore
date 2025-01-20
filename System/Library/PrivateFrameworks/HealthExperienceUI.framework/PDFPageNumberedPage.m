@interface PDFPageNumberedPage
- (_TtC18HealthExperienceUI19PDFPageNumberedPage)init;
- (_TtC18HealthExperienceUI19PDFPageNumberedPage)initWithImage:(id)a3 options:(id)a4;
@end

@implementation PDFPageNumberedPage

- (_TtC18HealthExperienceUI19PDFPageNumberedPage)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PDFWithCustomFooterTextPage *)&v3 init];
}

- (_TtC18HealthExperienceUI19PDFPageNumberedPage)initWithImage:(id)a3 options:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for ImageInitializationOption(0);
  sub_1AD6EF9A0(&qword_1E9A2A2E0, type metadata accessor for ImageInitializationOption);
  sub_1AD73F030();
  id v7 = a3;
  v8 = (void *)sub_1AD73F020();
  swift_bridgeObjectRelease();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v9 = [(PDFWithCustomFooterTextPage *)&v12 initWithImage:v7 options:v8];

  v10 = v9;
  if (v10) {

  }
  return v10;
}

@end
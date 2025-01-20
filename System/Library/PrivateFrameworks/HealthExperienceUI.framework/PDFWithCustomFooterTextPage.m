@interface PDFWithCustomFooterTextPage
- (_TtC18HealthExperienceUI27PDFWithCustomFooterTextPage)init;
- (_TtC18HealthExperienceUI27PDFWithCustomFooterTextPage)initWithImage:(id)a3 options:(id)a4;
- (void)drawWithBox:(int64_t)a3 toContext:(CGContext *)a4;
@end

@implementation PDFWithCustomFooterTextPage

- (void)drawWithBox:(int64_t)a3 toContext:(CGContext *)a4
{
  v6 = a4;
  v7 = self;
  sub_1AD6EE2E0(a3, v6);
}

- (_TtC18HealthExperienceUI27PDFWithCustomFooterTextPage)init
{
  return (_TtC18HealthExperienceUI27PDFWithCustomFooterTextPage *)sub_1AD6EF8D8(self, (uint64_t)a2, type metadata accessor for PDFWithCustomFooterTextPage);
}

- (_TtC18HealthExperienceUI27PDFWithCustomFooterTextPage)initWithImage:(id)a3 options:(id)a4
{
  return (_TtC18HealthExperienceUI27PDFWithCustomFooterTextPage *)sub_1AD6EF020(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))type metadata accessor for PDFWithCustomFooterTextPage);
}

@end
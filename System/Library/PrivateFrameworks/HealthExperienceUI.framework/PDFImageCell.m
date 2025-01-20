@interface PDFImageCell
- (_TtC18HealthExperienceUI12PDFImageCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI12PDFImageCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation PDFImageCell

- (_TtC18HealthExperienceUI12PDFImageCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI12PDFImageCell *)sub_1AD27A980(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI12PDFImageCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD27BD5C();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PDFImageCell();
  v2 = (char *)v3.receiver;
  [(PDFImageCell *)&v3 prepareForReuse];
  ++*(void *)&v2[OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_lastRequestedPreviewImageId];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_imageView], sel_setImage_, 0, v3.receiver, v3.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_label], sel_setText_, 0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_paginationView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI12PDFImageCell_label);
}

@end
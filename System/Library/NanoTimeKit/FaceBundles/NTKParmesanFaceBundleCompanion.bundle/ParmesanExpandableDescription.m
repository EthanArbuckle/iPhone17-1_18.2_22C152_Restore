@interface ParmesanExpandableDescription
- (NSString)text;
- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription)initWithFrame:(CGRect)a3;
- (void)moreLessButtonTapped:(id)a3;
- (void)setText:(id)a3;
@end

@implementation ParmesanExpandableDescription

- (NSString)text
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription_descriptionLabel);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_text);
  if (v4)
  {
    v5 = v4;
    sub_246C2CC48();

    v6 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    sub_246C2CC48();
    v3 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription_descriptionLabel);
    id v4 = self;
    v5 = (void *)sub_246C2CC08();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription_descriptionLabel);
    v6 = self;
    v5 = 0;
  }
  objc_msgSend(v3, sel_setText_, v5);

  sub_246BE5820();
}

- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription *)sub_246BE54C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_246BE6400();
}

- (void)moreLessButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_246C2D1F8();
  swift_unknownObjectRelease();
  *((unsigned char *)&v4->super.super.super.isa
  + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription_expanded) = (*((unsigned char *)&v4->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription_expanded) & 1) == 0;
  sub_246BE5820();

  sub_246B8EB94((uint64_t)&v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription_descriptionLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription_moreLessButton);
}

@end
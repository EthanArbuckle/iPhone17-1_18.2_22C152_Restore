@interface MapItemDetailView.Coordinator
- (_TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator)init;
- (void)mapItemDetailViewControllerDidFinish:(id)a3;
@end

@implementation MapItemDetailView.Coordinator

- (void)mapItemDetailViewControllerDidFinish:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator_didRequestDismissal);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_228AD2688((uint64_t)v3);
    v3(v6);
    sub_228AD2678((uint64_t)v3);
  }
}

- (_TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator_didRequestDismissal);
  v4 = (objc_class *)type metadata accessor for MapItemDetailView.Coordinator();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(MapItemDetailView.Coordinator *)&v6 init];
}

- (void).cxx_destruct
{
  sub_228AD2678(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV15_MapKit_SwiftUIP33_88864655A4452E6E3BB4AF822A3E769217MapItemDetailView11Coordinator_didRequestDismissal));
}

@end
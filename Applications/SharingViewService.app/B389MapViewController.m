@interface B389MapViewController
- (_TtC18SharingViewService21B389MapViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService21B389MapViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewTapped:(id)a3;
@end

@implementation B389MapViewController

- (_TtC18SharingViewService21B389MapViewController)initWithCoder:(id)a3
{
  v4 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_tapHandler);
  uint64_t *v4 = 0;
  v4[1] = 0;
  uint64_t v5 = OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapView;
  id v6 = objc_allocWithZone((Class)MKMapView);
  v7 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  sub_100017C38(*v4);
  v8 = *(Class *)((char *)&self->super.super.super.isa + v5);

  type metadata accessor for B389MapViewController();
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)loadView
{
  v2 = self;
  sub_1000B17AC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for B389MapViewController();
  v4 = (char *)v7.receiver;
  [(B389MapViewController *)&v7 viewDidAppear:v3];
  uint64_t v5 = *(void **)&v4[OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapView];
  uint64_t v6 = *(void *)&v4[OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapAnnotation];
  [v5 addAnnotation:v6];
  [v5 selectAnnotation:v6 animated:v3];
}

- (void)viewTapped:(id)a3
{
  BOOL v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_tapHandler);
  if (v3)
  {
    id v6 = a3;
    objc_super v7 = self;
    sub_100029198((uint64_t)v3);
    v3(a3);
    sub_100017C38((uint64_t)v3);
  }
}

- (_TtC18SharingViewService21B389MapViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18SharingViewService21B389MapViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapAnnotation));
  sub_100017C38(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_tapHandler));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18SharingViewService21B389MapViewController_mapView);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  id v6 = self;
  objc_super v7 = sub_1000B1C5C(v5);

  swift_unknownObjectRelease();

  return v7;
}

@end
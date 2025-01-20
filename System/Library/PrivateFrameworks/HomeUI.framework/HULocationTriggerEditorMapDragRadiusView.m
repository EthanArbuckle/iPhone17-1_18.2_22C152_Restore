@interface HULocationTriggerEditorMapDragRadiusView
- (HULocationTriggerEditorMapDragRadiusView)initWithCoder:(id)a3;
- (HULocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3;
- (HULocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3 radiusInMeters:(double)a4 delegate:(id)a5;
- (HULocationTriggerEditorMapDragRadiusViewDelegate)delegate;
- (MKMapView)mapView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)mapView:(id)a3 viewForAnnotation:(id)a4;
- (unint64_t)proximity;
- (void)dragHandleDidMove:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setMapView:(id)a3;
- (void)setProximity:(unint64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HULocationTriggerEditorMapDragRadiusView

- (MKMapView)mapView
{
  return (MKMapView *)sub_1BE37FDD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_mapView);
}

- (void)setMapView:(id)a3
{
}

- (HULocationTriggerEditorMapDragRadiusViewDelegate)delegate
{
  return (HULocationTriggerEditorMapDragRadiusViewDelegate *)sub_1BE37FDD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)proximity
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_proximity);
  swift_beginAccess();
  return *v2;
}

- (void)setProximity:(unint64_t)a3
{
  v4 = self;
  LocationTriggerEditorMapDragRadiusView.proximity.setter(a3);
}

- (HULocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3 radiusInMeters:(double)a4 delegate:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectRetain();
  return (HULocationTriggerEditorMapDragRadiusView *)LocationTriggerEditorMapDragRadiusView.init(frame:radiusInMeters:delegate:)(x, y, width, height, a4);
}

- (HULocationTriggerEditorMapDragRadiusView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s6HomeUI38LocationTriggerEditorMapDragRadiusViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (HULocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3
{
  result = (HULocationTriggerEditorMapDragRadiusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1BE37E904((uint64_t)self + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_radiusSlider));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_radiusLabel);
}

- (void)dragHandleDidMove:(id)a3
{
  if (a3)
  {
    v6 = self;
    id v4 = a3;
    objc_msgSend(v4, sel_value);
    *(double *)((char *)&v6->super.super.super.isa
              + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_normalizedSliderValue) = v5;
    sub_1BE522CC4();
  }
}

- (void)drawRect:(CGRect)a3
{
  id v3 = self;
  _s6HomeUI38LocationTriggerEditorMapDragRadiusViewC4drawyySo6CGRectVF_0();
}

- (void)traitCollectionDidChange:(id)a3
{
  if (a3)
  {
    float v5 = self;
    id v4 = a3;
    sub_1BE522A98((uint64_t)objc_msgSend(v4, sel_userInterfaceStyle));
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_radiusSlider));
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_1BE523A8C((uint64_t)a4);

  swift_unknownObjectRelease();

  return v8;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
}

@end
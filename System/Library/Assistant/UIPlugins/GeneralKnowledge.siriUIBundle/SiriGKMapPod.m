@interface SiriGKMapPod
- (SiriGKMapPod)initWithMapPod:(id)a3 snippetTitle:(id)a4 mapHeight:(double)a5;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)keylineType;
- (int64_t)viewCount;
@end

@implementation SiriGKMapPod

- (SiriGKMapPod)initWithMapPod:(id)a3 snippetTitle:(id)a4 mapHeight:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)SiriGKMapPod;
  v10 = [(SiriGKMapPod *)&v29 init];
  if (v10)
  {
    v11 = [v8 location];
    uint64_t v12 = [v11 latitude];
    [(id)v12 doubleValue];
    double v14 = v13;
    v15 = [v8 location];
    v16 = [v15 longitude];
    [v16 doubleValue];
    double v18 = v17;

    v19 = [v8 zoomLevel];
    [v19 doubleValue];
    double v21 = v20;

    v22 = [v8 showButton];
    LOBYTE(v12) = [v22 BOOLValue];

    if (v12)
    {
      v23 = -[SiriGKMapButtonView initWithCoordinate:mapSpan:mapTitle:]([SiriGKMapButtonView alloc], "initWithCoordinate:mapSpan:mapTitle:", v9, v14, v18, v21);
      uint64_t v24 = 16;
    }
    else
    {
      v23 = -[SiriGKMapView initWithCoordinate:mapSpan:mapHeight:calloutTitle:]([SiriGKMapView alloc], "initWithCoordinate:mapSpan:mapHeight:calloutTitle:", v9, v14, v18, v21, a5);
      uint64_t v24 = 8;
    }
    v25 = *(Class *)((char *)&v10->super.super.isa + v24);
    *(Class *)((char *)&v10->super.super.isa + v24) = (Class)v23;

    v26 = *(Class *)((char *)&v10->super.super.isa + v24);
    v27 = [v8 punchOut];
    [v26 setCommand:v27];
  }
  return v10;
}

- (int64_t)viewCount
{
  return 1;
}

- (id)viewAtIndex:(int64_t)a3
{
  mapView = self->_mapView;
  if (!mapView) {
    mapView = self->_mapButtonView;
  }
  return mapView;
}

- (int64_t)keylineType
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapButtonView, 0);

  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
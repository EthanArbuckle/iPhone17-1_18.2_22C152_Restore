@interface FUPlaneTrackerAnnotationView
+ (Class)layerClass;
+ (id)defaultAnotation;
- (CLLocationCoordinate2D)coordinate;
- (CLLocationCoordinate2D)currentLocation;
- (CLLocationCoordinate2D)endLocation;
- (CLLocationCoordinate2D)startLocation;
- (FUPlaneTrackerAnnotationView)init;
- (NSMutableArray)viewAddedBlock;
- (double)currentProgress;
- (void)didMoveToSuperview;
- (void)notifyWhenIsVisibleWithBlock:(id)a3;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setCurrentProgress:(double)a3;
- (void)setEndLocation:(CLLocationCoordinate2D)a3;
- (void)setPlaneImage:(id)a3;
- (void)setShowsPlane:(BOOL)a3;
- (void)setStartLatitude:(double)a3 startLongitude:(double)a4 endLatitude:(double)a5 endLongitude:(double)a6;
- (void)setStartLocation:(CLLocationCoordinate2D)a3;
- (void)setViewAddedBlock:(id)a3;
@end

@implementation FUPlaneTrackerAnnotationView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setCurrentProgress:(double)a3
{
  id v4 = [(FUPlaneTrackerAnnotationView *)self planeLayer];
  [v4 updatePlaneStateForProgress:a3];
}

- (void)setStartLocation:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = [(FUPlaneTrackerAnnotationView *)self planeLayer];
  objc_msgSend(v5, "setStartLocation:", latitude, longitude);
}

- (void)setEndLocation:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v5 = [(FUPlaneTrackerAnnotationView *)self planeLayer];
  objc_msgSend(v5, "setEndLocation:", latitude, longitude);
}

- (CLLocationCoordinate2D)startLocation
{
  v2 = [(FUPlaneTrackerAnnotationView *)self planeLayer];
  [v2 startLocation];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double longitude = v8;
  result.double latitude = v7;
  return result;
}

- (CLLocationCoordinate2D)endLocation
{
  v2 = [(FUPlaneTrackerAnnotationView *)self planeLayer];
  [v2 endLocation];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double longitude = v8;
  result.double latitude = v7;
  return result;
}

- (double)currentProgress
{
  v2 = [(FUPlaneTrackerAnnotationView *)self planeLayer];
  [v2 currentProgress];
  double v4 = v3;

  return v4;
}

- (CLLocationCoordinate2D)currentLocation
{
  v2 = [(FUPlaneTrackerAnnotationView *)self planeLayer];
  [v2 currentLocation];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double longitude = v8;
  result.double latitude = v7;
  return result;
}

- (void)setStartLatitude:(double)a3 startLongitude:(double)a4 endLatitude:(double)a5 endLongitude:(double)a6
{
  -[FUPlaneTrackerAnnotationView setStartLocation:](self, "setStartLocation:", a3, a4);
  -[FUPlaneTrackerAnnotationView setEndLocation:](self, "setEndLocation:", a5, a6);
  id v9 = [(FUPlaneTrackerAnnotationView *)self layer];
  [v9 updatePlaneStateForProgress:0.0];
}

- (FUPlaneTrackerAnnotationView)init
{
  v13.receiver = self;
  v13.super_class = (Class)FUPlaneTrackerAnnotationView;
  v2 = [(FUPlaneTrackerAnnotationView *)&v13 init];
  double v3 = v2;
  if (v2)
  {
    double v4 = [(FUPlaneTrackerAnnotationView *)v2 layer];
    objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

    id v5 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v6 = [v5 CGColor];
    double v7 = [(FUPlaneTrackerAnnotationView *)v3 layer];
    [v7 setShadowColor:v6];

    double v8 = [(FUPlaneTrackerAnnotationView *)v3 layer];
    LODWORD(v9) = 1061997773;
    [v8 setShadowOpacity:v9];

    v10 = [(FUPlaneTrackerAnnotationView *)v3 layer];
    [v10 setShadowRadius:2.0];

    v11 = [(FUPlaneTrackerAnnotationView *)v3 layer];
    objc_msgSend(v11, "setShadowOffset:", 0.0, 0.0);
  }
  return v3;
}

+ (id)defaultAnotation
{
  v2 = objc_alloc_init(FUPlaneTrackerAnnotationView);

  return v2;
}

- (void)setShowsPlane:(BOOL)a3
{
  if (self->_showsPlane != a3)
  {
    self->_showsPlane = a3;
    if (a3)
    {
      id v4 = [MEMORY[0x263F1C6B0] systemImageNamed:@"airplane"];
      [(FUPlaneTrackerAnnotationView *)self setPlaneImage:v4];
    }
    else
    {
      [(FUPlaneTrackerAnnotationView *)self setPlaneImage:0];
    }
  }
}

- (void)setPlaneImage:(id)a3
{
  id v4 = a3;
  id v5 = [(FUPlaneTrackerAnnotationView *)self planeLayer];
  [v5 setPlaneImage:v4];

  id v6 = [(FUPlaneTrackerAnnotationView *)self layer];
  [v6 bounds];
  -[FUPlaneTrackerAnnotationView setFrame:](self, "setFrame:");
}

- (void)didMoveToSuperview
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)FUPlaneTrackerAnnotationView;
  [(MKAnnotationView *)&v12 didMoveToSuperview];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  double v3 = [(FUPlaneTrackerAnnotationView *)self viewAddedBlock];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }

  [(FUPlaneTrackerAnnotationView *)self setViewAddedBlock:0];
}

- (void)notifyWhenIsVisibleWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FUPlaneTrackerAnnotationView *)self viewAddedBlock];

  if (!v5)
  {
    uint64_t v6 = objc_opt_new();
    [(FUPlaneTrackerAnnotationView *)self setViewAddedBlock:v6];
  }
  id v8 = [(FUPlaneTrackerAnnotationView *)self viewAddedBlock];
  uint64_t v7 = (void *)MEMORY[0x237DB8400](v4);

  [v8 addObject:v7];
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

- (NSMutableArray)viewAddedBlock
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setViewAddedBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
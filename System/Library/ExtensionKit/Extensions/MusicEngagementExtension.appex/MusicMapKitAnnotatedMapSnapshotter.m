@interface MusicMapKitAnnotatedMapSnapshotter
- (MKAnnotatedMapSnapshotter)mapShapshotter;
- (MusicMapKitAnnotatedMapSnapshotter)initWithMapItems:(id)a3 mapSize:(CGSize)a4 distance:(double)a5;
- (void)setMapShapshotter:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation MusicMapKitAnnotatedMapSnapshotter

- (MusicMapKitAnnotatedMapSnapshotter)initWithMapItems:(id)a3 mapSize:(CGSize)a4 distance:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  v14.receiver = self;
  v14.super_class = (Class)MusicMapKitAnnotatedMapSnapshotter;
  id v8 = a3;
  v9 = [(MusicMapKitAnnotatedMapSnapshotter *)&v14 init];
  id v10 = objc_alloc((Class)MKAnnotatedMapSnapshotter);
  id v11 = objc_msgSend(v10, "initWithMapItems:mapSize:useSnapshotService:", v8, 0, width, height, v14.receiver, v14.super_class);

  v12 = [v11 camera];
  [v12 setCenterCoordinateDistance:a5];

  [(MusicMapKitAnnotatedMapSnapshotter *)v9 setMapShapshotter:v11];
  return v9;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MusicMapKitAnnotatedMapSnapshotter *)self mapShapshotter];
  [v5 startWithCompletionHandler:v4];
}

- (MKAnnotatedMapSnapshotter)mapShapshotter
{
  return self->_mapShapshotter;
}

- (void)setMapShapshotter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
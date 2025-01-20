@interface NTKSiderealWaypointsView
- (NTKSiderealWaypointsView)initWithFrame:(CGRect)a3 orbitDiameter:(double)a4 dialDiameter:(double)a5 waypoints:(id)a6;
- (id)_newSeparatorLineForWaypoint:(id)a3;
- (id)_newWaypointView;
- (void)_updateSeparatorLines;
- (void)setWaypoints:(id)a3;
@end

@implementation NTKSiderealWaypointsView

- (NTKSiderealWaypointsView)initWithFrame:(CGRect)a3 orbitDiameter:(double)a4 dialDiameter:(double)a5 waypoints:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)NTKSiderealWaypointsView;
  v14 = -[NTKSiderealWaypointsView initWithFrame:](&v39, "initWithFrame:", x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_orbitDiameter = a4;
    v14->_dialDiameter = a5;
    v14->_waypointDiameter = 3.5;
    id v16 = objc_alloc((Class)UIView);
    [(NTKSiderealWaypointsView *)v15 bounds];
    v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
    orbitContainerView = v15->_orbitContainerView;
    v15->_orbitContainerView = v17;

    [(UIView *)v15->_orbitContainerView setAlpha:0.25];
    [(UIView *)v15->_orbitContainerView setOpaque:0];
    [(UIView *)v15->_orbitContainerView setUserInteractionEnabled:0];
    v19 = [(UIView *)v15->_orbitContainerView layer];
    [v19 setAllowsGroupOpacity:1];

    v20 = [(UIView *)v15->_orbitContainerView layer];
    [v20 setAllowsGroupBlending:1];

    v21 = [(UIView *)v15->_orbitContainerView layer];
    [v21 setCompositingFilter:kCAFilterScreenBlendMode];

    [(NTKSiderealWaypointsView *)v15 addSubview:v15->_orbitContainerView];
    id v22 = objc_msgSend(objc_alloc((Class)NTKBezierPathView), "initWithFrame:", 0.0, 0.0, a4, a4);
    [v22 bounds];
    v23 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
    [v23 setLineWidth:1.0];
    [v22 setPath:v23];
    v24 = +[UIColor colorWithRed:0.8 green:0.941176471 blue:1.0 alpha:1.0];
    [v22 setPathColor:v24];

    [(NTKSiderealWaypointsView *)v15 bounds];
    CLKRectGetCenter();
    objc_msgSend(v22, "setCenter:");
    [(UIView *)v15->_orbitContainerView addSubview:v22];
    uint64_t v25 = +[NSMutableArray array];
    separatorLines = v15->_separatorLines;
    v15->_separatorLines = (NSMutableArray *)v25;

    id v27 = objc_alloc((Class)UIView);
    [(NTKSiderealWaypointsView *)v15 bounds];
    v28 = (UIView *)objc_msgSend(v27, "initWithFrame:");
    separatorLinesContainer = v15->_separatorLinesContainer;
    v15->_separatorLinesContainer = v28;

    v30 = v15->_separatorLinesContainer;
    [(UIView *)v15->_orbitContainerView center];
    -[UIView setCenter:](v30, "setCenter:");
    CGAffineTransformMakeRotation(&v38, 1.57079633);
    v31 = v15->_separatorLinesContainer;
    CGAffineTransform v37 = v38;
    [(UIView *)v31 setTransform:&v37];
    [(UIView *)v15->_orbitContainerView addSubview:v15->_separatorLinesContainer];
    id v32 = objc_alloc((Class)UIView);
    [(NTKSiderealWaypointsView *)v15 bounds];
    v33 = (UIView *)objc_msgSend(v32, "initWithFrame:");
    waypointContainerView = v15->_waypointContainerView;
    v15->_waypointContainerView = v33;

    v35 = v15->_waypointContainerView;
    [(UIView *)v15->_orbitContainerView center];
    -[UIView setCenter:](v35, "setCenter:");
    [(UIView *)v15->_orbitContainerView addSubview:v15->_waypointContainerView];
    [(NTKSiderealWaypointsView *)v15 setWaypoints:v13];
  }
  return v15;
}

- (void)setWaypoints:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_waypoints, a3);
  v5 = [(UIView *)self->_waypointContainerView subviews];
  [v5 makeObjectsPerformSelector:"removeFromSuperview"];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self->_waypoints;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v10);
        id v12 = [(NTKSiderealWaypointsView *)self _newWaypointView];
        [(NTKSiderealWaypointsView *)self bounds];
        CLKRectGetCenter();
        [v11 degree];
        CLKDegreesToRadians();
        NTKPointOnCircle();
        objc_msgSend(v12, "setCenter:");
        [(UIView *)self->_waypointContainerView addSubview:v12];

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(NTKSiderealWaypointsView *)self _updateSeparatorLines];
}

- (void)_updateSeparatorLines
{
  [(NSMutableArray *)self->_separatorLines enumerateObjectsUsingBlock:&stru_2C898];
  [(NSMutableArray *)self->_separatorLines removeAllObjects];
  waypoints = self->_waypoints;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4E04;
  v15[3] = &unk_2C8C0;
  long long v16 = &off_2DF20;
  v4 = [(NSArray *)waypoints indexesOfObjectsPassingTest:v15];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = -[NSArray objectsAtIndexes:](self->_waypoints, "objectsAtIndexes:", v4, 0);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [(NTKSiderealWaypointsView *)self _newSeparatorLineForWaypoint:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9)];
        [(NSMutableArray *)self->_separatorLines addObject:v10];
        [(UIView *)self->_separatorLinesContainer addSubview:v10];

        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v7);
  }
}

- (id)_newWaypointView
{
  id v3 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, self->_waypointDiameter, self->_waypointDiameter);
  v4 = [v3 layer];
  [v4 setCornerRadius:self->_waypointDiameter * 0.5];

  v5 = +[UIColor colorWithRed:0.8 green:0.941176471 blue:1.0 alpha:1.0];
  [v3 setBackgroundColor:v5];

  return v3;
}

- (id)_newSeparatorLineForWaypoint:(id)a3
{
  id v4 = a3;
  v5 = +[UIBezierPath bezierPath];
  [(NTKSiderealWaypointsView *)self bounds];
  CLKRectGetCenter();
  objc_msgSend(v5, "moveToPoint:");
  [(NTKSiderealWaypointsView *)self bounds];
  CLKRectGetCenter();
  [v4 degree];

  CLKDegreesToRadians();
  NTKPointOnCircle();
  objc_msgSend(v5, "addLineToPoint:");
  id v6 = +[CLKDevice currentDevice];
  [v6 screenScale];
  [v5 setLineWidth:1.0 / v7];

  id v8 = objc_alloc((Class)NTKBezierPathView);
  [(NTKSiderealWaypointsView *)self bounds];
  id v9 = objc_msgSend(v8, "initWithFrame:");
  [v9 setPath:v5];
  id v10 = +[UIColor colorWithRed:0.8 green:0.941176471 blue:1.0 alpha:0.25];
  [v9 setPathColor:v10];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorLines, 0);
  objc_storeStrong((id *)&self->_separatorLinesContainer, 0);
  objc_storeStrong((id *)&self->_waypointContainerView, 0);
  objc_storeStrong((id *)&self->_orbitContainerView, 0);

  objc_storeStrong((id *)&self->_waypoints, 0);
}

@end
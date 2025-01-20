@interface _FEFocusMapRect
- (BOOL)intersectsRect:(CGRect)a3;
- (BOOL)intersectsRegion:(id)a3 inSnapshot:(id)a4;
- (CGRect)frame;
- (NSString)description;
- (_FECoordinateSpace)coordinateSpace;
- (_FEFocusMapRect)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (id)intersectionWithRegion:(id)a3 inSnapshot:(id)a4;
@end

@implementation _FEFocusMapRect

- (_FEFocusMapRect)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_FEFocusMapRect;
  v10 = [(_FEFocusMapRect *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_frame.origin.CGFloat x = x;
    v10->_frame.origin.CGFloat y = y;
    v10->_frame.size.CGFloat width = width;
    v10->_frame.size.CGFloat height = height;
    objc_storeWeak((id *)&v10->_coordinateSpace, v9);
  }

  return v11;
}

- (BOOL)intersectsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(_FEFocusMapRect *)self frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  if (CGRectIsNull(v32)) {
    return 0;
  }
  v33.origin.CGFloat x = v8;
  v33.origin.CGFloat y = v10;
  v33.size.CGFloat width = v12;
  v33.size.CGFloat height = v14;
  if (CGRectIsNull(v33)) {
    return 0;
  }
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRect v35 = CGRectStandardize(v34);
  CGFloat v16 = v35.origin.x;
  CGFloat v17 = v35.origin.y;
  CGFloat v18 = v35.size.width;
  CGFloat v19 = v35.size.height;
  v35.origin.CGFloat x = v8;
  v35.origin.CGFloat y = v10;
  v35.size.CGFloat width = v12;
  v35.size.CGFloat height = v14;
  CGRect v36 = CGRectStandardize(v35);
  CGFloat v20 = v36.origin.x;
  CGFloat v21 = v36.origin.y;
  CGFloat v22 = v36.size.width;
  CGFloat v23 = v36.size.height;
  CGFloat v30 = v17;
  CGFloat v31 = v16;
  v36.origin.CGFloat x = v16;
  v36.origin.CGFloat y = v17;
  v36.size.CGFloat width = v18;
  v36.size.CGFloat height = v19;
  CGFloat v24 = CGRectGetMinX(v36) + 0.0001;
  v37.origin.CGFloat x = v20;
  v37.origin.CGFloat y = v21;
  v37.size.CGFloat width = v22;
  v37.size.CGFloat height = v23;
  if (v24 <= CGRectGetMaxX(v37))
  {
    v38.origin.CGFloat y = v30;
    v38.origin.CGFloat x = v16;
    v38.size.CGFloat width = v18;
    v38.size.CGFloat height = v19;
    CGFloat v26 = CGRectGetMaxX(v38) + -0.0001;
    v39.origin.CGFloat x = v20;
    v39.origin.CGFloat y = v21;
    v39.size.CGFloat width = v22;
    v39.size.CGFloat height = v23;
    BOOL v25 = v26 >= CGRectGetMinX(v39);
  }
  else
  {
    BOOL v25 = 0;
  }
  v40.origin.CGFloat x = v16;
  v40.origin.CGFloat y = v30;
  v40.size.CGFloat width = v18;
  v40.size.CGFloat height = v19;
  CGFloat v27 = CGRectGetMinY(v40) + 0.0001;
  v41.origin.CGFloat x = v20;
  v41.origin.CGFloat y = v21;
  v41.size.CGFloat width = v22;
  v41.size.CGFloat height = v23;
  if (v27 <= CGRectGetMaxY(v41))
  {
    v42.origin.CGFloat x = v31;
    v42.origin.CGFloat y = v30;
    v42.size.CGFloat width = v18;
    v42.size.CGFloat height = v19;
    CGFloat v29 = CGRectGetMaxY(v42) + -0.0001;
    v43.origin.CGFloat x = v20;
    v43.origin.CGFloat y = v21;
    v43.size.CGFloat width = v22;
    v43.size.CGFloat height = v23;
    BOOL v28 = v29 >= CGRectGetMinY(v43);
  }
  else
  {
    BOOL v28 = 0;
  }
  return v25 && v28;
}

- (BOOL)intersectsRegion:(id)a3 inSnapshot:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [v8 coordinateSpace];
  CGFloat v10 = [(_FEFocusMapRect *)self coordinateSpace];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0)
  {
    CGFloat v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"_FEFocusMapArea.m" lineNumber:40 description:@"Focus: unable to compare intersecting regions from a snapshot using a different coordinate space than the map area's coordinate space. This is a UIKit bug."];
  }
  [v8 snapshotFrameForRegion:v7];
  BOOL v12 = -[_FEFocusMapRect intersectsRect:](self, "intersectsRect:");

  return v12;
}

- (id)intersectionWithRegion:(id)a3 inSnapshot:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 snapshotFrameForRegion:v6];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(_FEFocusMapRect *)self frame];
  v33.origin.double x = v16;
  v33.origin.double y = v17;
  v33.size.double width = v18;
  v33.size.double height = v19;
  v28.origin.double x = v9;
  v28.origin.double y = v11;
  v28.size.double width = v13;
  v28.size.double height = v15;
  CGRect v29 = CGRectIntersection(v28, v33);
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  v29.origin.double x = v9;
  v29.origin.double y = v11;
  v29.size.double width = v13;
  v29.size.double height = v15;
  v34.origin.double x = x;
  v34.origin.double y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  if (CGRectEqualToRect(v29, v34))
  {
    id v24 = v6;
LABEL_3:
    BOOL v25 = v24;
    goto LABEL_8;
  }
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  if (!CGRectIsNull(v30))
  {
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    if (fabs(CGRectGetWidth(v31)) >= 0.0001)
    {
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      if (fabs(CGRectGetHeight(v32)) >= 0.0001)
      {
        +[_FEFocusRegionEvaluator subregionFromRegion:withSnapshotFrame:inSnapshot:](_FEFocusRegionEvaluator, "subregionFromRegion:withSnapshotFrame:inSnapshot:", v6, v7, x, y, width, height);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
    }
  }
  BOOL v25 = 0;
LABEL_8:

  return v25;
}

- (NSString)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F29C40]) initWithObject:self];
  v4 = _FEStringFromCGRect(self->_frame.origin.x, self->_frame.origin.y, self->_frame.size.width, self->_frame.size.height);
  id v5 = (id)[v3 appendObject:v4 withName:@"frame"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  id v7 = (id)[v3 appendObject:WeakRetained withName:@"coordinateSpace"];

  double v8 = [v3 build];

  return (NSString *)v8;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (_FECoordinateSpace)coordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  return (_FECoordinateSpace *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end
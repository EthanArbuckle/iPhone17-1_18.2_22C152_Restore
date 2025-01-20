@interface UILayoutGuide
- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 priority:(float)a4;
- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 priority:(float)a4;
- (id)_maps_layoutGuideInsideEdgesWithPriority:(float)a3;
- (id)_maps_layoutGuidePinnedToEdgesWithRelation:(int64_t)a3 withPriority:(float)a4;
@end

@implementation UILayoutGuide

- (id)_maps_layoutGuideInsideEdgesWithPriority:(float)a3
{
  v5 = [(UILayoutGuide *)self owningView];
  if (v5)
  {
    id v6 = objc_alloc_init((Class)UILayoutGuide);
    [v5 addLayoutGuide:v6];
    if (a3 > 0.0)
    {
      *(float *)&double v7 = a3;
      v8 = [(UILayoutGuide *)self _maps_constraintsEqualToEdgesOfLayoutGuide:v6 priority:v7];
      v9 = [v8 allConstraints];
      [v5 addConstraints:v9];
    }
    v27 = [v6 topAnchor];
    v26 = [(UILayoutGuide *)self topAnchor];
    LODWORD(v10) = 1148846080;
    v25 = [v27 constraintGreaterThanOrEqualToAnchor:v26 constant:0.0 priority:v10];
    v28[0] = v25;
    v24 = [v6 leadingAnchor];
    v23 = [(UILayoutGuide *)self leadingAnchor];
    LODWORD(v11) = 1148846080;
    v12 = [v24 constraintGreaterThanOrEqualToAnchor:v23 constant:0.0 priority:v11];
    v28[1] = v12;
    v13 = [v6 bottomAnchor];
    v14 = [(UILayoutGuide *)self bottomAnchor];
    LODWORD(v15) = 1148846080;
    v16 = [v13 constraintLessThanOrEqualToAnchor:v14 constant:0.0 priority:v15];
    v28[2] = v16;
    v17 = [v6 trailingAnchor];
    v18 = [(UILayoutGuide *)self trailingAnchor];
    LODWORD(v19) = 1148846080;
    v20 = [v17 constraintLessThanOrEqualToAnchor:v18 constant:0.0 priority:v19];
    v28[3] = v20;
    v21 = +[NSArray arrayWithObjects:v28 count:4];
    [v5 addConstraints:v21];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_maps_layoutGuidePinnedToEdgesWithRelation:(int64_t)a3 withPriority:(float)a4
{
  id v6 = [(UILayoutGuide *)self owningView];
  if (v6)
  {
    id v7 = objc_alloc_init((Class)UILayoutGuide);
    [v6 addLayoutGuide:v7];
    v25 = [v7 topAnchor];
    v24 = [(UILayoutGuide *)self topAnchor];
    *(float *)&double v8 = a4;
    v23 = [v25 constraintEqualToAnchor:v24 constant:0.0 priority:v8];
    v26[0] = v23;
    v22 = [v7 leadingAnchor];
    v21 = [(UILayoutGuide *)self leadingAnchor];
    *(float *)&double v9 = a4;
    double v10 = [v22 constraintEqualToAnchor:v21 constant:0.0 priority:v9];
    v26[1] = v10;
    double v11 = [v7 bottomAnchor];
    v12 = [(UILayoutGuide *)self bottomAnchor];
    *(float *)&double v13 = a4;
    v14 = [v11 constraintEqualToAnchor:v12 constant:0.0 priority:v13];
    v26[2] = v14;
    double v15 = [v7 trailingAnchor];
    v16 = [(UILayoutGuide *)self trailingAnchor];
    *(float *)&double v17 = a4;
    v18 = [v15 constraintEqualToAnchor:v16 constant:0.0 priority:v17];
    v26[3] = v18;
    double v19 = +[NSArray arrayWithObjects:v26 count:4];
    [v6 addConstraints:v19];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_maps_constraintsEqualToEdgesOfView:(id)a3 priority:(float)a4
{
  if (a3)
  {
    id v6 = a3;
    v24 = [(UILayoutGuide *)self topAnchor];
    v23 = [v6 topAnchor];
    *(float *)&double v7 = a4;
    double v8 = [v24 constraintEqualToAnchor:v23 constant:0.0 priority:v7];
    v22 = [(UILayoutGuide *)self leadingAnchor];
    double v9 = [v6 leadingAnchor];
    *(float *)&double v10 = a4;
    double v11 = [v22 constraintEqualToAnchor:v9 constant:0.0 priority:v10];
    v12 = [(UILayoutGuide *)self bottomAnchor];
    double v13 = [v6 bottomAnchor];
    *(float *)&double v14 = a4;
    double v15 = [v12 constraintEqualToAnchor:v13 constant:0.0 priority:v14];
    v16 = [(UILayoutGuide *)self trailingAnchor];
    double v17 = [v6 trailingAnchor];

    *(float *)&double v18 = a4;
    double v19 = [v16 constraintEqualToAnchor:v17 constant:0.0 priority:v18];
    v20 = +[MapsEdgeConstraints edgeConstraintsWithTop:v8 leading:v11 bottom:v15 trailing:v19];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)_maps_constraintsEqualToEdgesOfLayoutGuide:(id)a3 priority:(float)a4
{
  if (a3)
  {
    id v6 = a3;
    v24 = [(UILayoutGuide *)self topAnchor];
    v23 = [v6 topAnchor];
    *(float *)&double v7 = a4;
    double v8 = [v24 constraintEqualToAnchor:v23 constant:0.0 priority:v7];
    v22 = [(UILayoutGuide *)self leadingAnchor];
    double v9 = [v6 leadingAnchor];
    *(float *)&double v10 = a4;
    double v11 = [v22 constraintEqualToAnchor:v9 constant:0.0 priority:v10];
    v12 = [(UILayoutGuide *)self bottomAnchor];
    double v13 = [v6 bottomAnchor];
    *(float *)&double v14 = a4;
    double v15 = [v12 constraintEqualToAnchor:v13 constant:0.0 priority:v14];
    v16 = [(UILayoutGuide *)self trailingAnchor];
    double v17 = [v6 trailingAnchor];

    *(float *)&double v18 = a4;
    double v19 = [v16 constraintEqualToAnchor:v17 constant:0.0 priority:v18];
    v20 = +[MapsEdgeConstraints edgeConstraintsWithTop:v8 leading:v11 bottom:v15 trailing:v19];
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

@end
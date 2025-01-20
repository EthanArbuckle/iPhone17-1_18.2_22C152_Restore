@interface FRCBodyBoundingBoxDetector
- (id)createBodyRectanglesWithObservation:(id)a3 frameAspectRatio:(float)a4;
@end

@implementation FRCBodyBoundingBoxDetector

- (id)createBodyRectanglesWithObservation:(id)a3 frameAspectRatio:(float)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F45CF0];
    uint64_t v64 = 0;
    v8 = [v5 recognizedPointsForGroupKey:v7 error:&v64];
    v9 = objc_alloc_init(BodyPoint);
    v10 = objc_alloc_init(BodyPoint);
    v11 = objc_alloc_init(BodyPoint);
    v63 = objc_alloc_init(BodyPoint);
    v12 = objc_alloc_init(BodyPoint);
    v13 = objc_alloc_init(BodyPoint);
    v62 = objc_alloc_init(BodyPoint);
    v61 = objc_alloc_init(BodyPoint);
    v14 = [v8 objectForKeyedSubscript:@"left_hand_joint"];
    v15 = v14;
    if (v14)
    {
      [v14 location];
      -[BodyPoint setLocation:](v9, "setLocation:");
      [v15 confidence];
      -[BodyPoint setScore:](v9, "setScore:");
    }
    v16 = [v8 objectForKeyedSubscript:@"right_hand_joint"];

    if (v16)
    {
      [v16 location];
      -[BodyPoint setLocation:](v10, "setLocation:");
      [v16 confidence];
      -[BodyPoint setScore:](v10, "setScore:");
    }
    v17 = [v8 objectForKeyedSubscript:@"left_forearm_joint"];

    if (v17)
    {
      [v17 location];
      -[BodyPoint setLocation:](v11, "setLocation:");
      [v17 confidence];
      -[BodyPoint setScore:](v11, "setScore:");
    }
    v18 = [v8 objectForKeyedSubscript:@"right_forearm_joint"];

    if (v18)
    {
      [v18 location];
      -[BodyPoint setLocation:](v63, "setLocation:");
      [v18 confidence];
      -[BodyPoint setScore:](v63, "setScore:");
    }
    v19 = [v8 objectForKeyedSubscript:@"left_foot_joint"];

    if (v19)
    {
      [v19 location];
      -[BodyPoint setLocation:](v12, "setLocation:");
      [v19 confidence];
      -[BodyPoint setScore:](v12, "setScore:");
    }
    v20 = [v8 objectForKeyedSubscript:@"right_foot_joint"];

    if (v20)
    {
      [v20 location];
      -[BodyPoint setLocation:](v13, "setLocation:");
      [v20 confidence];
      -[BodyPoint setScore:](v13, "setScore:");
    }
    v21 = [v8 objectForKeyedSubscript:@"left_leg_joint"];

    if (v21)
    {
      [v21 location];
      -[BodyPoint setLocation:](v62, "setLocation:");
      [v21 confidence];
      -[BodyPoint setScore:](v62, "setScore:");
    }
    v22 = [v8 objectForKeyedSubscript:@"right_leg_joint"];

    if (v22)
    {
      [v22 location];
      -[BodyPoint setLocation:](v61, "setLocation:");
      [v22 confidence];
      -[BodyPoint setScore:](v61, "setScore:");
    }
    [(BodyPoint *)v9 score];
    if (v23 > 0.5)
    {
      [(BodyPoint *)v9 location];
      double v25 = v24;
      double v27 = v26;
      [(BodyPoint *)v11 location];
      *(float *)&double v28 = a4;
      v31 = +[FRCFaceHandLegRectangle bodyRectangleWithCenter:tip:category:frameAspectRatio:](FRCFaceHandLegRectangle, "bodyRectangleWithCenter:tip:category:frameAspectRatio:", 2, v25, v27, v29, v30, v28);
      [v6 addObject:v31];
    }
    [(BodyPoint *)v10 score];
    if (v32 > 0.5)
    {
      [(BodyPoint *)v10 location];
      double v34 = v33;
      double v36 = v35;
      [(BodyPoint *)v63 location];
      *(float *)&double v37 = a4;
      v40 = +[FRCFaceHandLegRectangle bodyRectangleWithCenter:tip:category:frameAspectRatio:](FRCFaceHandLegRectangle, "bodyRectangleWithCenter:tip:category:frameAspectRatio:", 2, v34, v36, v38, v39, v37);
      [v6 addObject:v40];
    }
    [(BodyPoint *)v12 score];
    if (v41 > 0.5)
    {
      [(BodyPoint *)v12 location];
      double v43 = v42;
      double v45 = v44;
      [(BodyPoint *)v62 location];
      *(float *)&double v46 = a4;
      v49 = +[FRCFaceHandLegRectangle bodyRectangleWithCenter:tip:category:frameAspectRatio:](FRCFaceHandLegRectangle, "bodyRectangleWithCenter:tip:category:frameAspectRatio:", 3, v43, v45, v47, v48, v46);
      [v6 addObject:v49];
    }
    [(BodyPoint *)v13 score];
    if (v50 > 0.5)
    {
      [(BodyPoint *)v13 location];
      double v52 = v51;
      double v54 = v53;
      [(BodyPoint *)v61 location];
      *(float *)&double v55 = a4;
      v58 = +[FRCFaceHandLegRectangle bodyRectangleWithCenter:tip:category:frameAspectRatio:](FRCFaceHandLegRectangle, "bodyRectangleWithCenter:tip:category:frameAspectRatio:", 3, v52, v54, v56, v57, v55);
      [v6 addObject:v58];
    }
    id v59 = v6;
  }
  return v6;
}

@end
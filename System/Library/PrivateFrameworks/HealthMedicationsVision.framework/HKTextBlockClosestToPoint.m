@interface HKTextBlockClosestToPoint
@end

@implementation HKTextBlockClosestToPoint

uint64_t ___HKTextBlockClosestToPoint_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  [v6 boundingBox];
  double MidX = CGRectGetMidX(v32);
  [v6 boundingBox];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  double MidY = CGRectGetMidY(v33);
  [v5 boundingBox];
  double v17 = CGRectGetMidX(v34);
  [v5 boundingBox];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v35.origin.x = v19;
  v35.origin.y = v21;
  v35.size.width = v23;
  v35.size.height = v25;
  CGFloat v26 = CGRectGetMidY(v35);
  double v27 = *(double *)(a1 + 32);
  double v28 = *(double *)(a1 + 40);
  double v29 = (MidY - v28) * (MidY - v28) + (MidX - v27) * (MidX - v27);
  double v30 = (v26 - v28) * (v26 - v28) + (v17 - v27) * (v17 - v27);
  if (v29 < v30) {
    return -1;
  }
  else {
    return v30 < v29;
  }
}

@end
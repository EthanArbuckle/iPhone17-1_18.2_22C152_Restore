@interface AXMLayoutItem
+ (CGRect)boundingFrameForItems:(id)a3;
+ (CGRect)normalizedBoundingFrameForItem:(id)a3;
+ (CGRect)normalizedBoundingFrameForItems:(id)a3;
- (BOOL)metric:(int64_t)a3 inProximityOfMetric:(int64_t)a4 item:(id)a5 threshold:(double)a6;
- (CGRect)_rectValueForMetric:(int64_t)a3;
- (double)_floatValueForMetric:(int64_t)a3;
- (double)bottom;
- (double)height;
- (double)right;
- (double)top;
- (double)width;
- (id)description;
- (int64_t)_metricTypeForMetric:(int64_t)a3;
@end

@implementation AXMLayoutItem

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(AXMLayoutItem *)self width];
  uint64_t v7 = v6;
  [(AXMLayoutItem *)self height];
  uint64_t v9 = v8;
  [(AXMLayoutItem *)self left];
  uint64_t v11 = v10;
  [(AXMLayoutItem *)self top];
  uint64_t v13 = v12;
  [(AXMLayoutItem *)self right];
  uint64_t v15 = v14;
  [(AXMLayoutItem *)self bottom];
  v17 = [v3 stringWithFormat:@"%@ [W:%.2f H:%.2f] [L:%.2f T:%.2f R:%.2f B:%.2f]", v5, v7, v9, v11, v13, v15, v16];

  return v17;
}

- (double)height
{
  [(AXMLayoutItem *)self frame];
  return v2;
}

- (double)top
{
  [(AXMLayoutItem *)self frame];
  return v2;
}

- (double)bottom
{
  [(AXMLayoutItem *)self top];
  double v4 = v3;
  [(AXMLayoutItem *)self height];
  return v4 + v5;
}

- (double)width
{
  [(AXMLayoutItem *)self frame];
  return v2;
}

- (double)right
{
  [(AXMLayoutItem *)self left];
  double v4 = v3;
  [(AXMLayoutItem *)self width];
  return v4 + v5;
}

- (BOOL)metric:(int64_t)a3 inProximityOfMetric:(int64_t)a4 item:(id)a5 threshold:(double)a6
{
  id v11 = a5;
  int64_t v12 = [(AXMLayoutItem *)self _metricTypeForMetric:a3];
  if (v12 == [(AXMLayoutItem *)self _metricTypeForMetric:a4])
  {
    if (v12 == 1)
    {
      [(AXMLayoutItem *)self _rectValueForMetric:a3];
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      [v11 _rectValueForMetric:a4];
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat rect2 = v31;
      v34.origin.x = v18;
      v34.origin.y = v20;
      v34.size.width = v22;
      v34.size.height = v24;
      CGRect v35 = CGRectInset(v34, -a6, -a6);
      v36.origin.x = v26;
      v36.origin.y = v28;
      v36.size.width = v30;
      v36.size.height = rect2;
      BOOL v6 = CGRectIntersectsRect(v35, v36);
    }
    else if (!v12)
    {
      [(AXMLayoutItem *)self _floatValueForMetric:a3];
      double v14 = v13;
      [v11 _floatValueForMetric:a4];
      BOOL v6 = vabdd_f64(v14, v15) <= a6;
    }
  }
  else
  {
    uint64_t v16 = AXMediaLogTextLayout();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[AXMLayoutItem metric:inProximityOfMetric:item:threshold:]();
    }

    BOOL v6 = 0;
  }

  return v6;
}

- (int64_t)_metricTypeForMetric:(int64_t)a3
{
  return a3 == 6;
}

- (double)_floatValueForMetric:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      [(AXMLayoutItem *)self height];
      break;
    case 1:
      [(AXMLayoutItem *)self top];
      break;
    case 2:
      [(AXMLayoutItem *)self bottom];
      break;
    case 3:
      [(AXMLayoutItem *)self width];
      break;
    case 4:
      [(AXMLayoutItem *)self left];
      break;
    case 5:
      [(AXMLayoutItem *)self right];
      break;
    default:
      double v4 = AXMediaLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        -[AXMLayoutItem _floatValueForMetric:]();
      }

      double result = 0.0;
      break;
  }
  return result;
}

- (CGRect)_rectValueForMetric:(int64_t)a3
{
  if (a3 == 6)
  {
    [(AXMLayoutItem *)self frame];
  }
  else
  {
    uint64_t v7 = AXMediaLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[AXMLayoutItem _rectValueForMetric:]();
    }

    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (CGRect)boundingFrameForItems:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CGFloat v4 = *MEMORY[0x1E4F1DB20];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v3);
        }
        int64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
        v32.origin.x = v4;
        v32.origin.y = v5;
        v32.size.width = v6;
        v32.size.height = v7;
        BOOL IsNull = CGRectIsNull(v32);
        [v12 frame];
        CGFloat v18 = v14;
        double v19 = v15;
        double v20 = v16;
        double v21 = v17;
        if (!IsNull)
        {
          v33.origin.x = v4;
          v33.origin.y = v5;
          v33.size.width = v6;
          v33.size.height = v7;
          *(CGRect *)&CGFloat v14 = CGRectUnion(v33, *(CGRect *)&v18);
        }
        CGFloat v4 = v14;
        CGFloat v5 = v15;
        CGFloat v6 = v16;
        CGFloat v7 = v17;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  double v22 = v4;
  double v23 = v5;
  double v24 = v6;
  double v25 = v7;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGRect)normalizedBoundingFrameForItems:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  CGFloat v4 = *MEMORY[0x1E4F1DB20];
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v3);
        }
        int64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
        v32.origin.x = v4;
        v32.origin.y = v5;
        v32.size.width = v6;
        v32.size.height = v7;
        BOOL IsNull = CGRectIsNull(v32);
        [v12 normalizedFrame];
        CGFloat v18 = v14;
        double v19 = v15;
        double v20 = v16;
        double v21 = v17;
        if (!IsNull)
        {
          v33.origin.x = v4;
          v33.origin.y = v5;
          v33.size.width = v6;
          v33.size.height = v7;
          *(CGRect *)&CGFloat v14 = CGRectUnion(v33, *(CGRect *)&v18);
        }
        CGFloat v4 = v14;
        CGFloat v5 = v15;
        CGFloat v6 = v16;
        CGFloat v7 = v17;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  double v22 = v4;
  double v23 = v5;
  double v24 = v6;
  double v25 = v7;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

+ (CGRect)normalizedBoundingFrameForItem:(id)a3
{
  CGFloat v3 = *MEMORY[0x1E4F1DB20];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v7 = a3;
  v21.origin.CGFloat x = v3;
  v21.origin.CGFloat y = v4;
  v21.size.CGFloat width = v5;
  v21.size.CGFloat height = v6;
  BOOL IsNull = CGRectIsNull(v21);
  [v7 normalizedFrame];
  CGFloat x = v9;
  CGFloat y = v11;
  CGFloat width = v13;
  CGFloat height = v15;

  if (!IsNull)
  {
    v22.origin.CGFloat x = v3;
    v22.origin.CGFloat y = v4;
    v22.size.CGFloat width = v5;
    v22.size.CGFloat height = v6;
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    CGRect v23 = CGRectUnion(v22, v25);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }
  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (void)metric:inProximityOfMetric:item:threshold:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1B57D5000, v1, OS_LOG_TYPE_ERROR, "Metric types are not compatible '%ld' and '%ld'", v2, 0x16u);
}

- (void)_floatValueForMetric:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_FAULT, "metric does not support float values: '%ld'", v1, 0xCu);
}

- (void)_rectValueForMetric:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_FAULT, "metric does not support frame values: '%ld'", v1, 0xCu);
}

@end
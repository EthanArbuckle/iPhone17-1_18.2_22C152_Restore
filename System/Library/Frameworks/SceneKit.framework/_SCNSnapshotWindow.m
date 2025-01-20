@interface _SCNSnapshotWindow
- (BOOL)_canBecomeKeyWindow;
- (BOOL)_isSettingFirstResponder;
- (CGPoint)_warpPoint:(CGPoint)a3 outOfBounds:(BOOL *)a4;
- (CGPoint)warpPoint:(CGPoint)a3;
- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5;
- (id)scnView;
- (void)dealloc;
@end

@implementation _SCNSnapshotWindow

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)_SCNSnapshotWindow;
  [(_SCNSnapshotWindow *)&v2 dealloc];
}

- (BOOL)_isSettingFirstResponder
{
  return 0;
}

- (BOOL)_canBecomeKeyWindow
{
  return 0;
}

- (id)scnView
{
  return (id)gCurrentSCNViewEvent;
}

- (id)_hitTest:(CGPoint)a3 withEvent:(id)a4 windowServerHitTestWindow:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  if ([(_SCNSnapshotWindow *)self scnView])
  {
    objc_msgSend((id)-[_SCNSnapshotWindow layer](self, "layer"), "convertPoint:toLayer:", 0, x, y);
    char v13 = 0;
    -[_SCNSnapshotWindow _warpPoint:outOfBounds:](self, "_warpPoint:outOfBounds:", &v13);
    id result = 0;
    if (!v13)
    {
      v12.receiver = self;
      v12.super_class = (Class)_SCNSnapshotWindow;
      for (i = (_SCNSnapshotWindow *)-[_SCNSnapshotWindow hitTest:withEvent:](&v12, sel_hitTest_withEvent_, a4);
            i;
            i = (_SCNSnapshotWindow *)[(_SCNSnapshotWindow *)i superview])
      {
        if (objc_msgSend((id)-[_SCNSnapshotWindow gestureRecognizers](i, "gestureRecognizers"), "count")) {
          break;
        }
        if ([(_SCNSnapshotWindow *)i isMultipleTouchEnabled]) {
          break;
        }
        if ([(_SCNSnapshotWindow *)i canBecomeFirstResponder]) {
          break;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
      }
      if (i == self) {
        return 0;
      }
      else {
        return i;
      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_SCNSnapshotWindow;
    return -[_SCNSnapshotWindow hitTest:withEvent:](&v11, sel_hitTest_withEvent_, a4, x, y);
  }
  return result;
}

- (CGPoint)_warpPoint:(CGPoint)a3 outOfBounds:(BOOL *)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(_SCNSnapshotWindow *)self scnView];
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "convertPoint:fromView:", 0, x, y);
    v10 = objc_msgSend(v9, "hitTest:options:", 0);
    if ([v10 count]
      && ((objc_super v11 = (void *)[v10 objectAtIndexedSubscript:0],
           objc_super v12 = objc_msgSend((id)objc_msgSend(v11, "node"), "geometry"),
           !objc_msgSend((id)objc_msgSend(v12, "materials"), "count"))
        ? (char v13 = 0)
        : (char v13 = objc_msgSend((id)objc_msgSend(v12, "materials"), "objectAtIndexedSubscript:", objc_msgSend(v11, "geometryIndex")% (unint64_t)objc_msgSend((id)objc_msgSend(v12, "materials"), "count"))), objc_msgSend((id)-[_SCNSnapshotWindow subviews](self, "subviews"), "count")&& (v14 = objc_msgSend((id)objc_msgSend(v13, "diffuse"), "contents"), v14 == objc_msgSend((id)-[_SCNSnapshotWindow subviews](self, "subviews"), "objectAtIndexedSubscript:", 0))))
    {
      [v11 textureCoordinatesWithMappingChannel:0];
      double v16 = v15;
      double v18 = v17;
      float32x4_t v30 = 0u;
      float32x4_t v31 = 0u;
      float32x4_t v28 = 0u;
      float32x4_t v29 = 0u;
      v19 = (void *)[v13 diffuse];
      if (v19)
      {
        [v19 contentsTransform];
      }
      else
      {
        float32x4_t v30 = 0u;
        float32x4_t v31 = 0u;
        float32x4_t v28 = 0u;
        float32x4_t v29 = 0u;
      }
      *(float32x4_t *)&v27.m11 = v28;
      *(float32x4_t *)&v27.m21 = v29;
      *(float32x4_t *)&v27.m31 = v30;
      *(float32x4_t *)&v27.m41 = v31;
      if (!SCNMatrix4IsIdentity(&v27))
      {
        float v20 = v16;
        float v21 = v18;
        unint64_t v22 = vaddq_f32(vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v28, v20), v29, v21), (float32x4_t)0, v30), v31).u64[0];
        double v16 = *(float *)&v22;
        double v18 = *((float *)&v22 + 1);
      }
      [(_SCNSnapshotWindow *)self bounds];
      double x = v16 * v23;
      [(_SCNSnapshotWindow *)self bounds];
      double y = v18 * v24;
    }
    else if (a4)
    {
      *a4 = 1;
    }
  }
  double v25 = x;
  double v26 = y;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (CGPoint)warpPoint:(CGPoint)a3
{
  objc_msgSend((id)-[_SCNSnapshotWindow layer](self, "layer"), "convertPoint:toLayer:", 0, a3.x, a3.y);

  -[_SCNSnapshotWindow _warpPoint:outOfBounds:](self, "_warpPoint:outOfBounds:", 0);
  result.double y = v5;
  result.double x = v4;
  return result;
}

@end
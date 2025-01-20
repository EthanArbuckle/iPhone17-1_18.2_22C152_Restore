@interface CHStrokePointsVisualization
- (void)drawStrokesFromStrokeProvider:(id)a3 inRect:(CGRect)a4 context:(CGContext *)a5;
@end

@implementation CHStrokePointsVisualization

- (void)drawStrokesFromStrokeProvider:(id)a3 inRect:(CGRect)a4 context:(CGContext *)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  color = CGColorCreate(DeviceRGB, dbl_1C4C3B2B0);
  v33 = CGColorCreate(DeviceRGB, dbl_1C4C3B2D0);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v17 = objc_msgSend_orderedStrokes(v10, v12, v13, v14, v15, v16);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v37, (uint64_t)v41, 16, v19);
  if (v20)
  {
    uint64_t v26 = v20;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v17);
        }
        v29 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        objc_msgSend_bounds(v29, v21, v22, v23, v24, v25);
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.CGFloat width = width;
        v44.size.CGFloat height = height;
        if (CGRectIntersectsRect(v43, v44))
        {
          Mutable = CGPathCreateMutable();
          v36[0] = MEMORY[0x1E4F143A8];
          v36[1] = 3221225472;
          v36[2] = sub_1C4A6DE4C;
          v36[3] = &unk_1E64E2D40;
          v36[4] = Mutable;
          objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v31, (uint64_t)v29, 1, 1, (uint64_t)v36);
          CGContextSetStrokeColorWithColor(a5, color);
          CGContextSetLineWidth(a5, 5.0);
          CGContextAddPath(a5, Mutable);
          CGContextStrokePath(a5);
          CGPathRelease(Mutable);
          CGContextSetFillColorWithColor(a5, v33);
          v35[0] = MEMORY[0x1E4F143A8];
          v35[1] = 3221225472;
          v35[2] = sub_1C4A6DECC;
          v35[3] = &unk_1E64E2FF0;
          v35[4] = 0x4000000000000000;
          v35[5] = a5;
          objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(CHStrokeUtilities, v32, (uint64_t)v29, 0, 1, (uint64_t)v35);
        }
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v21, (uint64_t)&v37, (uint64_t)v41, 16, v25);
    }
    while (v26);
  }

  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(color);
  CGColorRelease(v33);
}

@end
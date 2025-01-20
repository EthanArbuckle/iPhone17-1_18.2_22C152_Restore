@interface AutoCropper
- (AutoCropper)init;
- (BOOL)shouldFavorBottom;
- (BOOL)shouldFavorTop;
- (CGRect)computeClippingWithinSize:(CGSize)a3 andImportantRect:(CGRect)a4;
- (CGRect)computeClippingWithinSize:(CGSize)a3 andImportantRects:(id)a4;
- (CGRect)computeClippingWithinSize:(CGSize)a3 forImportantRect:(CGRect)a4 andType:(int)a5 restrictRect:(CGRect)a6;
- (CGRect)computeClippingWithinSize:(CGSize)a3 forMultipleRects:(id)a4;
- (CGRect)expandRect:(CGRect)result toContainRect:(CGRect)a4;
- (CGRect)rectContainingRect:(CGRect)result andOtherRect:(CGRect)a4;
- (CGRect)rectWithSize:(CGSize)a3 andPoint:(CGPoint)a4 inPosition:(int)a5 fromOriginalSize:(CGSize)a6;
- (CGRect)scaleRect:(CGRect)a3 byScale:(double)a4;
- (CGRect)scaleRect:(CGRect)a3 toFitSize:(CGSize)a4 withAnchorPoint:(CGPoint)a5;
- (CGSize)originalImageSize;
- (id)clusterRects:(id)a3;
- (int)determineBestPositionWithinSize:(CGSize)a3 forImportantRect:(CGRect)a4 restrictRect:(CGRect)a5;
- (int)getRatioOfSize:(CGSize)a3;
- (void)setOriginalImageSize:(CGSize)a3;
- (void)setShouldFavorBottom:(BOOL)a3;
- (void)setShouldFavorTop:(BOOL)a3;
@end

@implementation AutoCropper

- (AutoCropper)init
{
  v5.receiver = self;
  v5.super_class = (Class)AutoCropper;
  v2 = [(AutoCropper *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AutoCropper *)v2 setShouldFavorTop:0];
    [(AutoCropper *)v3 setShouldFavorBottom:0];
    v3->originalImageSize.width = 0.0;
    v3->originalImageSize.height = 0.0;
  }
  return v3;
}

- (CGRect)scaleRect:(CGRect)a3 byScale:(double)a4
{
  CGFloat v4 = a3.origin.x + a3.size.width * 0.5;
  CGFloat v5 = a3.origin.y + a3.size.height * 0.5;
  double v6 = a3.size.height * a4;
  double v7 = a3.size.width * a4;
  double v8 = v4 - v7 * 0.5;
  double v9 = v5 - v6 * 0.5;
  result.size.height = v6;
  result.size.width = v7;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)expandRect:(CGRect)result toContainRect:(CGRect)a4
{
  double v4 = a4.origin.y + a4.size.height;
  double v5 = a4.origin.x + a4.size.width;
  if (result.origin.y + result.size.height < v4) {
    result.size.height = v4 - result.origin.y;
  }
  if (result.origin.x + result.size.width < v5) {
    result.size.width = v5 - result.origin.x;
  }
  double v6 = result.origin.y - a4.origin.y;
  if (result.origin.y <= a4.origin.y) {
    double v6 = -0.0;
  }
  double v7 = v6 + result.size.height;
  if (result.origin.y > a4.origin.y) {
    result.origin.y = a4.origin.y;
  }
  double v8 = result.origin.x - a4.origin.x;
  if (result.origin.x <= a4.origin.x) {
    double v8 = -0.0;
  }
  double v9 = v8 + result.size.width;
  if (result.origin.x > a4.origin.x) {
    result.origin.x = a4.origin.x;
  }
  result.size.height = v7;
  result.size.width = v9;
  return result;
}

- (CGRect)computeClippingWithinSize:(CGSize)a3 andImportantRect:(CGRect)a4
{
  double height = a3.height;
  double v5 = a4.origin.x + a4.size.width * 0.5;
  double v6 = a4.origin.y + a4.size.height * 0.5;
  if (v6 >= height * 0.5)
  {
    if (v6 > (height + height) / 3.0)
    {
      if (!self->shouldFavorBottom)
      {
        double v11 = (height - v6) * 3.0;
        double v10 = height - v11;
        double height = v11;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
    BOOL shouldFavorTop = self->shouldFavorTop;
    double v7 = 1.5;
LABEL_11:
    double v13 = v6 * v7;
    if (!shouldFavorTop) {
      double height = v13;
    }
LABEL_13:
    double v10 = 0.0;
    goto LABEL_14;
  }
  double v7 = 3.0;
  if (v6 <= height / 3.0)
  {
    BOOL shouldFavorTop = self->shouldFavorTop;
    goto LABEL_11;
  }
  double v8 = (height - v6) * 1.5;
  double v9 = height - v8;
  if (self->shouldFavorBottom)
  {
    double v10 = 0.0;
  }
  else
  {
    double height = v8;
    double v10 = v9;
  }
LABEL_14:
  if (v5 >= a3.width * 0.5)
  {
    double v15 = 3.0;
    if (v5 > (a3.width + a3.width) / 3.0)
    {
      double v14 = a3.width - v5;
      goto LABEL_19;
    }
    double v16 = v5 * 1.5;
LABEL_22:
    double v17 = 0.0;
    goto LABEL_23;
  }
  if (v5 <= a3.width / 3.0)
  {
    double v16 = v5 * 3.0;
    goto LABEL_22;
  }
  double v14 = a3.width - v5;
  double v15 = 1.5;
LABEL_19:
  double v16 = v14 * v15;
  double v17 = a3.width - v16;
LABEL_23:
  double v18 = height;
  result.size.double height = v18;
  result.size.width = v16;
  result.origin.y = v10;
  result.origin.x = v17;
  return result;
}

- (int)getRatioOfSize:(CGSize)a3
{
  if (a3.height * 4.0 == a3.width * 3.0) {
    return 1;
  }
  if (a3.height * 3.0 == a3.width + a3.width) {
    return 2;
  }
  if (a3.height * 16.0 == a3.width * 9.0) {
    return 3;
  }
  if (a3.height == a3.width) {
    return 4;
  }
  double v4 = a3.height * 5.0;
  if (v4 == a3.width * 3.0) {
    return 5;
  }
  if (v4 == a3.width * 4.0) {
    return 6;
  }
  return 7;
}

- (CGRect)scaleRect:(CGRect)a3 toFitSize:(CGSize)a4 withAnchorPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double height = a4.height;
  double width = a4.width;
  double v15 = a3.size.height;
  double v16 = a3.size.width;
  double v17 = a3.origin.y;
  double v18 = a3.origin.x;
  acLog("scaleRect:inner=(%.3f,%.3f,%.3f,%.3f), size=(%.3f,%.3f), anchor=(%.3f,%.3f)\n", (uint64_t)a2, v5, v6, v7, v8, v9, v10, SLOBYTE(a3.origin.x));
  if (v18 + v16 >= x && v17 + v16 >= y && v17 <= y && v18 <= x)
  {
    double v29 = v15 - (y - v17);
    double v30 = x - v18;
    double v31 = v16 - (x - v18);
    double v32 = y / (y - v17);
    if ((height - y) / v29 < v32) {
      double v32 = (height - y) / v29;
    }
    if (x / v30 < v32) {
      double v32 = x / v30;
    }
    if ((width - x) / v31 < v32) {
      double v32 = (width - x) / v31;
    }
    double v33 = (y - v17) * v32;
    double v34 = v30 * v32;
    double v18 = x - v34;
    double v17 = y - v33;
    double v16 = v34 + v31 * v32;
    double v15 = v33 + v29 * v32;
  }
  else
  {
    acLog("ERROR <AutoCropper>: Point should be within rect", v19, v20, v21, v22, v23, v24, v25, v39);
  }
  double v35 = v18;
  double v36 = v17;
  double v37 = v16;
  double v38 = v15;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (CGRect)rectWithSize:(CGSize)a3 andPoint:(CGPoint)a4 inPosition:(int)a5 fromOriginalSize:(CGSize)a6
{
  double x = a4.x;
  double height = a3.height;
  double width = a3.width;
  double v9 = 0.0;
  if (a5 > 0xD)
  {
    double v10 = 0.0;
    goto LABEL_15;
  }
  if (((1 << a5) & 0x854) != 0)
  {
    double v12 = (a3.width - x) * 0.5;
    if (x < v12) {
      double v12 = x;
    }
    double v10 = x - v12;
    goto LABEL_14;
  }
  if (((1 << a5) & 0x10A8) != 0)
  {
    double v12 = a3.width - x;
    if (a3.width - x >= x * 0.5) {
      double v12 = x * 0.5;
    }
    double v10 = x + v12 * -2.0;
LABEL_14:
    double width = v12 * 3.0;
    goto LABEL_15;
  }
  double v10 = 0.0;
  if (((1 << a5) & 0x2700) != 0)
  {
    double v11 = a3.width - x;
    if (x < a3.width - x) {
      double v11 = x;
    }
    double v10 = x - v11;
    double width = v11 + v11;
  }
LABEL_15:
  if (a5 > 0xE)
  {
    double v13 = height;
    goto LABEL_31;
  }
  if (((1 << a5) & 0x231) != 0)
  {
    if (a4.y >= (height - a4.y) * 0.5) {
      double y = (height - a4.y) * 0.5;
    }
    else {
      double y = a4.y;
    }
    double v9 = a4.y - y;
LABEL_30:
    double v13 = y * 3.0;
    goto LABEL_31;
  }
  if (((1 << a5) & 0x4C2) != 0)
  {
    double y = a4.y * 0.5;
    if (height - a4.y < a4.y * 0.5) {
      double y = height - a4.y;
    }
    double v9 = a4.y + y * -2.0;
    goto LABEL_30;
  }
  double v13 = height;
  if (((1 << a5) & 0x5900) != 0)
  {
    if (a4.y >= height - a4.y) {
      double v14 = height - a4.y;
    }
    else {
      double v14 = a4.y;
    }
    double v9 = a4.y - v14;
    double v13 = v14 + v14;
  }
LABEL_31:
  double v16 = height / a3.width;
  if (v13 / width >= v16)
  {
    if (v13 / width > v16)
    {
      CGFloat v18 = -(a4.y - v9) / v13;
      double v13 = v16 * width;
      double v9 = a4.y + v18 * (v16 * width);
    }
  }
  else
  {
    double v17 = v13 / v16;
    double v10 = x + -(x - v10) / width * v17;
    double width = v17;
  }
  double v19 = v10;
  double v20 = v13;
  result.size.double height = v20;
  result.size.double width = width;
  result.origin.double y = v9;
  result.origin.double x = v19;
  return result;
}

- (CGRect)rectContainingRect:(CGRect)result andOtherRect:(CGRect)a4
{
  double v4 = result.origin.x + result.size.width;
  double v5 = a4.origin.x + a4.size.width;
  if (v4 <= v5) {
    double v4 = v5;
  }
  double v6 = result.origin.y + result.size.height;
  if (v6 <= a4.origin.y + a4.size.height) {
    double v6 = a4.origin.y + a4.size.height;
  }
  if (result.origin.x >= a4.origin.x) {
    result.origin.double x = a4.origin.x;
  }
  double v7 = v4 - result.origin.x;
  if (result.origin.y >= a4.origin.y) {
    result.origin.double y = a4.origin.y;
  }
  double v8 = v6 - result.origin.y;
  result.size.double height = v8;
  result.size.double width = v7;
  return result;
}

- (id)clusterRects:(id)a3
{
  id i = a3;
  if ([a3 count] != 1)
  {
    for (id i = (id)[MEMORY[0x1E4F1CA48] arrayWithArray:i];
          [i count] != 1;
          [i removeObjectAtIndex:v13])
    {
      int v6 = [i count];
      long long v20 = 0u;
      long long v21 = 0u;
      if (v6 < 2) {
        break;
      }
      uint64_t v7 = 0;
      uint64_t v8 = (v6 - 1);
      uint64_t v9 = v6;
      uint64_t v10 = v6;
      for (uint64_t j = 1; ; ++j)
      {
        memset(&v19, 0, sizeof(v19));
        objc_msgSend((id)objc_msgSend(i, "objectAtIndex:", v7), "getValue:", &v19);
        uint64_t v12 = v7 + 1;
        if (v7 + 1 < v9) {
          break;
        }
LABEL_10:
        ++v7;
        if (v12 == v8) {
          return i;
        }
      }
      uint64_t v13 = j;
      while (1)
      {
        objc_msgSend((id)objc_msgSend(i, "objectAtIndex:", v13, 0, 0, 0, 0), "getValue:", &v18);
        if (CGRectIntersectsRect(v19, v18)) {
          break;
        }
        if (v10 == ++v13) {
          goto LABEL_10;
        }
      }
      -[AutoCropper rectContainingRect:andOtherRect:](self, "rectContainingRect:andOtherRect:", *(_OWORD *)&v18.origin, *(_OWORD *)&v18.size, *(_OWORD *)&v19.origin, *(_OWORD *)&v19.size);
      *(void *)&long long v20 = v14;
      *((void *)&v20 + 1) = v15;
      *(void *)&long long v21 = v16;
      *((void *)&v21 + 1) = v17;
      objc_msgSend(i, "replaceObjectAtIndex:withObject:", v7, objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v20, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
    }
  }
  return i;
}

- (CGRect)computeClippingWithinSize:(CGSize)a3 andImportantRects:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend((id)objc_msgSend(v8, "valueForKey:", @"AspectRatioCutoff"), "floatValue");
  float v61 = v9;
  objc_msgSend((id)objc_msgSend(v8, "valueForKey:", @"MinimumCroppedArea"), "floatValue");
  float v59 = v10;
  objc_msgSend((id)objc_msgSend(v8, "valueForKey:", @"ProximityToCenter"), "floatValue");
  float v65 = v11;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v12 = [a4 countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v12)
  {
    uint64_t v20 = v12;
    uint64_t v21 = *(void *)v71;
    double v22 = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    double v25 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v71 != v21) {
          objc_enumerationMutation(a4);
        }
        v27 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        long long v68 = 0u;
        long long v69 = 0u;
        [v27 getValue:&v68];
        if (*((double *)&v69 + 1) * *(double *)&v69 > v22 * v23)
        {
          double v24 = *((double *)&v68 + 1);
          double v25 = *(double *)&v68;
          double v22 = *((double *)&v69 + 1);
          double v23 = *(double *)&v69;
        }
      }
      uint64_t v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v70, v74, 16, *((double *)&v69 + 1), *(double *)&v69, *((double *)&v69 + 1) * *(double *)&v69);
    }
    while (v20);
  }
  else
  {
    double v22 = 0.0;
    double v23 = 0.0;
    double v24 = 0.0;
    double v25 = 0.0;
  }
  double v28 = v23 * 0.5 + v25;
  double v29 = v22 * 0.5 + v24;
  double v30 = v22 * v23;
  acLog("Face area is %f, Total is %f\n", v13, v14, v15, v16, v17, v18, v19, SLOBYTE(v30));
  double v67 = width * height;
  if (v30 * 1.1 < width * height / 9.0
    || (acLog("Large Face!\n", v31, v32, v33, v34, v35, v36, v37, v58),
        double v38 = 0.0,
        (height * height + width * width) * v65 <= (v29 - height * 0.5) * (v29 - height * 0.5)
                                                 + (v28 - width * 0.5) * (v28 - width * 0.5)))
  {
    int v40 = 0;
    double v62 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v63 = *MEMORY[0x1E4F1DB28];
    double v64 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v66 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v60 = v59;
    int v41 = 7;
    double v42 = width * height;
    do
    {
      double v43 = width;
      double v44 = height;
      switch(v40)
      {
        case 0:
          break;
        case 1:
          double v44 = 9.0;
          double v43 = 12.0;
          break;
        case 2:
          double v44 = 6.0;
          double v43 = 9.0;
          break;
        case 3:
          double v44 = 27.0;
          double v43 = 48.0;
          break;
        case 4:
          double v43 = 20.0;
          double v44 = 20.0;
          break;
        case 5:
          double v44 = 9.0;
          goto LABEL_24;
        case 6:
          double v44 = 12.0;
LABEL_24:
          double v43 = 15.0;
          break;
        default:
          acLog("ERROR <AutoCropper>: unrecognized aspect ratio\n", v31, v32, v33, v34, v35, v36, v37, v58);
          double v43 = 0.0;
          double v44 = 0.0;
          break;
      }
      uint64_t v45 = 4;
      do
      {
        -[AutoCropper rectWithSize:andPoint:inPosition:fromOriginalSize:](self, "rectWithSize:andPoint:inPosition:fromOriginalSize:", v45, v43, v44, v28, v29, width, height);
        -[AutoCropper scaleRect:toFitSize:withAnchorPoint:](self, "scaleRect:toFitSize:withAnchorPoint:");
        if ((v67 - v48 * v49) * (float)(v61 + 1.0) < v42 || v41 == 7)
        {
          double v62 = v47;
          double v63 = v46;
          double v64 = v49;
          double v66 = v48;
          double v42 = v67 - v48 * v49;
          int v41 = v40;
        }
        uint64_t v45 = (v45 + 1);
      }
      while (v45 != 8);
      ++v40;
    }
    while (v40 != 7);
    double v51 = v66;
    double v52 = v64;
    if (v66 * v64 >= v67 * v60)
    {
      v53 = "Clipping to original aspect ratio\n";
      double v39 = v62;
      double v38 = v63;
      switch(v41)
      {
        case 0:
          break;
        case 1:
          v53 = "Clipping to aspect ratio 4:3\n";
          break;
        case 2:
          v53 = "Clipping to aspect ratio 3:2\n";
          break;
        case 3:
          v53 = "Clipping to aspect ratio 16:9\n";
          break;
        case 4:
          v53 = "Clipping to square\n";
          break;
        case 5:
          v53 = "Clipping to aspect ratio 5:3\n";
          break;
        case 6:
          v53 = "Clipping to aspect ratio 5:4\n";
          break;
        default:
          v53 = "ERROR <AutoCropper>: unrecognized aspect ratio\n";
          double v39 = v62;
          double v38 = v63;
          break;
      }
    }
    else
    {
      double v38 = 0.0;
      v53 = "No Crop. Reduces area too much\n";
      double v39 = 0.0;
      double v51 = width;
      double v52 = height;
    }
    acLog(v53, v31, v32, v33, v34, v35, v36, v37, v58);
    double width = v51;
    double height = v52;
  }
  else
  {
    double v39 = 0.0;
  }
  double v54 = v38;
  double v55 = v39;
  double v56 = width;
  double v57 = height;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.double y = v55;
  result.origin.double x = v54;
  return result;
}

- (int)determineBestPositionWithinSize:(CGSize)a3 forImportantRect:(CGRect)a4 restrictRect:(CGRect)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  double v8 = a4.origin.x + a4.size.width * 0.5;
  double v9 = a4.origin.y + a4.size.height * 0.5;
  double v10 = (float)((float)(int)getCFPreferenceNumber(@"MinCropPercentage", @"com.apple.mobileslideshow", 75)
              / 100.0);
  acLog("determineBestPositionWithinSize:size=%.3f,%.3f, center=%.3f,%.3f, minPercentage=%.3f, restrict=%.3f,%.3f,%.3f,%.3f\n", v11, v12, v13, v14, v15, v16, v17, SLOBYTE(width));
  if (self->originalImageSize.height * self->originalImageSize.width == 0.0) {
    double v25 = height * width;
  }
  else {
    double v25 = self->originalImageSize.height * self->originalImageSize.width;
  }
  acLog("originalArea = %.2f\n", v18, v19, v20, v21, v22, v23, v24, SLOBYTE(v25));
  uint64_t v26 = 0;
  double v27 = 0.0;
  int v28 = 15;
  do
  {
    -[AutoCropper rectWithSize:andPoint:inPosition:fromOriginalSize:](self, "rectWithSize:andPoint:inPosition:fromOriginalSize:", v26, width, height, v8, v9, width, height);
    double v31 = v30 * v29;
    acLog("pos = %d, rect=(%.2f,%.2f,%.2f,%.2f), area=%.2f\n", v32, v33, v34, v35, v36, v37, v38, v26);
    v78[v26] = v31;
    if (v31 > v27)
    {
      double v27 = v31;
      int v28 = v26;
    }
    ++v26;
  }
  while (v26 != 15);
  if (v27 / v25 < v10) {
    return 15;
  }
  double v47 = v25 * v10;
  switch(v28)
  {
    case 0:
      double v48 = v79;
      double v49 = v80;
      double v50 = v84;
      if (v79 <= v80)
      {
        if (v80 > v84) {
          goto LABEL_45;
        }
      }
      else if (v79 > v84)
      {
        double v63 = v79 / v25;
        acLog("    topleft=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v63));
        if (v48 > v47) {
          return 4;
        }
        return v28;
      }
      double v68 = v84 / v25;
      acLog("    topcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v68));
      if (v50 > v47) {
        return 9;
      }
      return v28;
    case 1:
      double v51 = v81;
      double v52 = v82;
      double v53 = v85;
      if (v81 <= v82)
      {
        if (v82 > v85)
        {
          double v69 = v82 / v25;
          acLog("    bottomright=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v69));
          if (v52 > v47) {
            return 7;
          }
          return v28;
        }
      }
      else if (v81 > v85)
      {
        goto LABEL_21;
      }
      double v75 = v85 / v25;
      acLog("    bottomcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v75));
      if (v53 > v47) {
        return 10;
      }
      return v28;
    case 2:
      double v51 = v81;
      double v54 = v79;
      double v55 = v86;
      if (v81 <= v79)
      {
        if (v79 > v86)
        {
          double v70 = v79 / v25;
          acLog("    topleft=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v70));
          if (v54 > v47) {
            return 4;
          }
          return v28;
        }
      }
      else if (v81 > v86)
      {
LABEL_21:
        double v64 = v51 / v25;
        acLog("    bottomleft=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v64));
        if (v51 > v47) {
          return 6;
        }
        return v28;
      }
      double v76 = v86 / v25;
      acLog("    leftcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v76));
      if (v55 > v47) {
        return 11;
      }
      return v28;
    case 3:
      double v56 = v82;
      double v49 = v80;
      double v57 = v87;
      if (v82 <= v80)
      {
        if (v80 > v87)
        {
LABEL_45:
          double v71 = v49 / v25;
          acLog("    topright=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v71));
          if (v49 > v47) {
            return 5;
          }
          return v28;
        }
      }
      else if (v82 > v87)
      {
        double v65 = v82 / v25;
        acLog("    bottomright=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v65));
        if (v56 > v47) {
          return 7;
        }
        return v28;
      }
      double v77 = v87 / v25;
      acLog("    rightcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v77));
      if (v57 > v47) {
        return 12;
      }
      return v28;
    case 13:
      double v59 = v84;
      double v58 = v85;
      double v60 = v83;
      if (v85 <= v84)
      {
        if (v84 <= v83) {
          goto LABEL_53;
        }
        double v72 = v84 / v25;
        acLog("    topcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v72));
        if (v59 > v47) {
          return 9;
        }
      }
      else
      {
        if (v85 <= v83) {
          goto LABEL_53;
        }
        double v66 = v85 / v25;
        acLog("    bottomcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v66));
        if (v58 > v47) {
          return 10;
        }
      }
      return v28;
    case 14:
      double v62 = v86;
      double v61 = v87;
      double v60 = v83;
      if (v86 > v87)
      {
        if (v86 > v83)
        {
          double v67 = v86 / v25;
          acLog("    leftcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v67));
          if (v62 > v47) {
            return 11;
          }
          return v28;
        }
LABEL_53:
        double v74 = v60 / v25;
        acLog("    center=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v74));
        if (v60 > v47) {
          return 8;
        }
        return v28;
      }
      if (v87 <= v83) {
        goto LABEL_53;
      }
      double v73 = v87 / v25;
      acLog("    rightcenter=%.2f\n", v39, v40, v41, v42, v43, v44, v45, SLOBYTE(v73));
      if (v61 > v47) {
        return 12;
      }
      return v28;
    default:
      return v28;
  }
}

- (CGRect)computeClippingWithinSize:(CGSize)a3 forImportantRect:(CGRect)a4 andType:(int)a5 restrictRect:(CGRect)a6
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v9 = a4.origin.x + a4.size.width * 0.5;
  CGFloat v10 = a4.origin.y + a4.size.height * 0.5;
  uint64_t v11 = -[AutoCropper determineBestPositionWithinSize:forImportantRect:restrictRect:](self, "determineBestPositionWithinSize:forImportantRect:restrictRect:", *(void *)&a5, a3.width, a3.height, *(void *)&a6.origin.x, *(void *)&a6.origin.y, *(void *)&a6.size.width, *(void *)&a6.size.height);
  acLog("Best is %d\n", v12, v13, v14, v15, v16, v17, v18, v11);
  -[AutoCropper rectWithSize:andPoint:inPosition:fromOriginalSize:](self, "rectWithSize:andPoint:inPosition:fromOriginalSize:", v11, width, height, v9, v10, width, height);

  -[AutoCropper scaleRect:toFitSize:withAnchorPoint:](self, "scaleRect:toFitSize:withAnchorPoint:");
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)computeClippingWithinSize:(CGSize)a3 forMultipleRects:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v39 = 0u;
  long long v40 = 0u;
  float v7 = a3.height;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v8 = [a4 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v8)
  {
    uint64_t v16 = v8;
    uint64_t v17 = *(void *)v40;
    float v18 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(a4);
        }
        double v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v37 = 0u;
        long long v38 = 0u;
        [v20 getValue:&v37];
        if (*((double *)&v37 + 1) < v7) {
          float v7 = *((double *)&v37 + 1);
        }
        if (*((double *)&v37 + 1) + *((double *)&v38 + 1) > v18) {
          float v18 = *((double *)&v37 + 1) + *((double *)&v38 + 1);
        }
      }
      uint64_t v16 = [a4 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v16);
  }
  else
  {
    float v18 = 0.0;
  }
  if (v18 <= v7)
  {
    double v28 = 0.0;
    goto LABEL_24;
  }
  float v21 = height / 3.0;
  float v22 = height * 0.5;
  float v24 = (float)(v7 + v18) * 0.5;
  float v25 = vabds_f32(v21, v24);
  float v26 = vabds_f32(v22, v24);
  float v27 = vabds_f32(v21 + v21, v24);
  double v28 = 0.0;
  if (v25 >= v26)
  {
    if (v26 < v27)
    {
LABEL_22:
      double v32 = 0.0;
      double v33 = width;
      double v31 = height;
      goto LABEL_23;
    }
LABEL_21:
    acLog("Want bottom\n", v9, v10, v11, v12, v13, v14, v15, v37);
    double v28 = 0.0;
    goto LABEL_22;
  }
  if (v25 >= v27) {
    goto LABEL_21;
  }
  float v29 = width / height;
  if (v24 <= v21)
  {
    float v36 = v24 * 3.0;
    double v33 = (float)((float)(v24 * 3.0) * v29);
    double v31 = v36;
    double v28 = 0.0;
    double v32 = 0.0;
  }
  else
  {
    float v30 = (height - v24) * 3.0 * 0.5;
    double v31 = v30;
    double v32 = height - v30;
    double v33 = (float)(v29 * v30);
    double v28 = 0.0;
  }
LABEL_23:
  float v23 = width * height;
  if (v33 * v31 / v23 >= 0.8)
  {
    double height = v31;
    double width = v33;
    goto LABEL_26;
  }
LABEL_24:
  double v32 = 0.0;
LABEL_26:
  double v34 = width;
  double v35 = height;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v32;
  result.origin.double x = v28;
  return result;
}

- (BOOL)shouldFavorTop
{
  return self->shouldFavorTop;
}

- (void)setShouldFavorTop:(BOOL)a3
{
  self->BOOL shouldFavorTop = a3;
}

- (BOOL)shouldFavorBottom
{
  return self->shouldFavorBottom;
}

- (void)setShouldFavorBottom:(BOOL)a3
{
  self->shouldFavorBottom = a3;
}

- (CGSize)originalImageSize
{
  double width = self->originalImageSize.width;
  double height = self->originalImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOriginalImageSize:(CGSize)a3
{
  self->originalImageSize = a3;
}

@end
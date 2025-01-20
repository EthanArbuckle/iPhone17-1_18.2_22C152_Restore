@interface HUMosaicLayoutHelper
+ (HUGridSize)gridSizeForGeometry:(id)a3 withEmptyCells:(int64_t)a4;
+ (id)fakeFramesForGeometry:(id)a3 inBounds:(CGRect)a4;
+ (id)framesForSizes:(id)a3 withGeometry:(id)a4 inBounds:(CGRect)a5;
@end

@implementation HUMosaicLayoutHelper

+ (id)fakeFramesForGeometry:(id)a3 inBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  v9 = [MEMORY[0x1E4F1CA48] array];
  int v10 = [v8 isPortrait];
  v11 = +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:2];
  [v9 addObject:v11];

  v12 = +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:2];
  [v9 addObject:v12];

  v13 = +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:1];
  [v9 addObject:v13];

  v14 = +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:1];
  [v9 addObject:v14];

  if (v10)
  {
    v15 = +[HUMosaicCellSize createMosaicCellSizeForSizeDescription:2];
    [v9 addObject:v15];
  }
  v16 = +[HUMosaicLayoutHelper framesForSizes:withGeometry:inBounds:](HUMosaicLayoutHelper, "framesForSizes:withGeometry:inBounds:", v9, v8, x, y, width, height);

  return v16;
}

+ (id)framesForSizes:(id)a3 withGeometry:(id)a4 inBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  if ((int)[v6 count] >= 1)
  {
    uint64_t v9 = 0;
    LOBYTE(v10) = 1;
    double v11 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v41 = 0.0;
    double v14 = 0.0;
    while (1)
    {
      v15 = [v6 objectAtIndexedSubscript:v9];
      unint64_t v16 = [v15 numRows];
      unint64_t v17 = [v15 numCols];
      [v7 cellSize];
      double v19 = v18;
      [v7 cellSpacing];
      double v21 = v20 * (double)(v17 - 1) + v19 * (double)v17;
      [v7 cellSize];
      double v23 = v22;
      [v7 cellSpacing];
      double v25 = v24;
      double v26 = v11 + v21 - width;
      if (v26 > 0.00000011920929)
      {
        [v7 cellSpacing];
        double v12 = v14 + v27;
        double v28 = v41;
        double v29 = v14 + v27 - v41;
        if (v29 > 0.00000011920929) {
          double v28 = 0.0;
        }
        double v41 = v28;
        if (v29 > 0.00000011920929) {
          double v13 = 0.0;
        }
        double v11 = v13;
      }
      int v10 = (v9 == 0) & v10;
      double v30 = v25 * (double)(v16 - 1) + v23 * (double)v16;
      if (v26 > 0.00000011920929) {
        int v31 = 1;
      }
      else {
        int v31 = v10;
      }
      if (v16 >= 2 && v31)
      {
        [v7 cellSpacing];
        double v13 = v21 + v11 + v32;
        double v41 = v30 + v12;
      }
      double v33 = v30;
      if ((v31 & 1) == 0)
      {
        [v7 cellSize];
        double v33 = v34;
      }
      [v7 cellSpacing];
      if (v21 - width > 0.00000011920929 || v30 + v12 - height > 0.00000011920929) {
        break;
      }
      double v14 = v12 + v33;
      double v37 = v11 + v21 + v35;
      v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v11, v12, v21, v30);
      [v8 addObject:v38];

      ++v9;
      double v11 = v37;
      if (v9 >= (int)[v6 count]) {
        goto LABEL_23;
      }
    }
  }
LABEL_23:

  return v8;
}

+ (HUGridSize)gridSizeForGeometry:(id)a3 withEmptyCells:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 gridSize];
  [v5 gridSize];
  unint64_t v8 = v7 * v6 - a4;
  [v5 gridSize];
  unint64_t v10 = v8 / v9;
  if (v8 / v9 <= 1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v8 / v9;
  }
  if (([v5 isPortrait] & 1) == 0 && v10 <= 1)
  {
    [v5 gridSize];
    if (v8 == v12 + 1) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
  }
  [v5 gridSize];
  int64_t v14 = v13;

  int64_t v15 = v11;
  int64_t v16 = v14;
  result.columnsAcross = v16;
  result.rowsDown = v15;
  return result;
}

@end
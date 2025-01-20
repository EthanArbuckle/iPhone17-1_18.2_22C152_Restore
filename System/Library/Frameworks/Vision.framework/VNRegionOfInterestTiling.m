@interface VNRegionOfInterestTiling
+ (id)tilingForRegionOfInterest:(CGRect)a3 inPixelBounds:(CGRect)a4 tileAspectRatio:(double)a5 options:(id)a6;
+ (id)tilingForRegionOfInterest:(CGRect)a3 inPixelWidth:(unint64_t)a4 height:(unint64_t)a5 tileAspectRatio:(double)a6 options:(id)a7;
- (CGRect)pixelBounds;
- (CGRect)pixelRegionOfInterest;
- (CGRect)regionOfInterest;
- (NSArray)tiles;
- (id)_initWithPixelOriginX:(unint64_t)a3 Y:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 regionOfInterest:(CGRect)a7;
- (unint64_t)pixelHeight;
- (unint64_t)pixelWidth;
- (unint64_t)tileColumnsCount;
- (unint64_t)tileCount;
- (unint64_t)tileRowsCount;
- (void)_calculateTilesHorizontally:(BOOL)a3 vertically:(BOOL)a4 tileAspectRatio:(double)a5 overlapPercentage:(double)a6 tileOverflowCount:(unint64_t)a7 addTileBlock:(id)a8 columnCount:(unint64_t *)a9 rowCount:(unint64_t *)a10;
- (void)_calculateTilesWithAspectRatio:(double)a3 options:(id)a4;
- (void)enumerateTilesUsingBlock:(id)a3;
@end

@implementation VNRegionOfInterestTiling

- (void).cxx_destruct
{
}

- (NSArray)tiles
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (unint64_t)tileColumnsCount
{
  return self->_columnCount;
}

- (unint64_t)tileRowsCount
{
  return self->_rowCount;
}

- (CGRect)pixelRegionOfInterest
{
  objc_copyStruct(v6, &self->_pixelRegionOfInterest, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)regionOfInterest
{
  objc_copyStruct(v6, &self->_regionOfInterest, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (unint64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (void)enumerateTilesUsingBlock:(id)a3
{
}

- (unint64_t)tileCount
{
  return [(NSArray *)self->_tiles count];
}

- (CGRect)pixelBounds
{
  double pixelOriginX = (double)self->_pixelOriginX;
  double pixelOriginY = (double)self->_pixelOriginY;
  double pixelWidth = (double)self->_pixelWidth;
  double pixelHeight = (double)self->_pixelHeight;
  result.size.height = pixelHeight;
  result.size.width = pixelWidth;
  result.origin.y = pixelOriginY;
  result.origin.x = pixelOriginX;
  return result;
}

- (void)_calculateTilesWithAspectRatio:(double)a3 options:(id)a4
{
  v6 = (VNRegionOfInterestTilingOptions *)a4;
  v7 = v6;
  if (self->_pixelRegionOfInterest.size.width >= 1.0 && self->_pixelRegionOfInterest.size.height >= 1.0)
  {
    if (!v6) {
      v7 = objc_alloc_init(VNRegionOfInterestTilingOptions);
    }
    [(VNRegionOfInterestTilingOptions *)v7 regionOfInterestAspectRatioThreshold];
    double v9 = self->_pixelRegionOfInterest.size.width / self->_pixelRegionOfInterest.size.height;
    BOOL v10 = v9 < v8 && v9 <= 1.0 / v8;
    BOOL v11 = v9 >= v8;
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__VNRegionOfInterestTiling__calculateTilesWithAspectRatio_options___block_invoke;
    aBlock[3] = &unk_1E5B1E710;
    float64x2_t v23 = vcvtq_f64_u64(*(uint64x2_t *)&self->_pixelOriginX);
    aBlock[4] = self;
    id v22 = v12;
    id v13 = v12;
    v14 = _Block_copy(aBlock);
    unint64_t v19 = 0;
    unint64_t v20 = 0;
    [(VNRegionOfInterestTilingOptions *)v7 tileOverlapPercentage];
    [(VNRegionOfInterestTiling *)self _calculateTilesHorizontally:v11 vertically:v10 tileAspectRatio:[(VNRegionOfInterestTilingOptions *)v7 tileOverflowCount] overlapPercentage:v14 tileOverflowCount:&v20 addTileBlock:&v19 columnCount:a3 rowCount:v15];
    v16 = (NSArray *)[v13 copy];
    tiles = self->_tiles;
    self->_tiles = v16;

    unint64_t v18 = v19;
    self->_columnCount = v20;
    self->_rowCount = v18;
  }
}

void __67__VNRegionOfInterestTiling__calculateTilesWithAspectRatio_options___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  CGRect v8 = CGRectOffset(*(CGRect *)&a2, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  v6 = -[VNRegionOfInterestTile initWithTiling:pixelCropRect:]([VNRegionOfInterestTile alloc], "initWithTiling:pixelCropRect:", *(void *)(a1 + 32), v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  [*(id *)(a1 + 40) addObject:v6];
}

- (void)_calculateTilesHorizontally:(BOOL)a3 vertically:(BOOL)a4 tileAspectRatio:(double)a5 overlapPercentage:(double)a6 tileOverflowCount:(unint64_t)a7 addTileBlock:(id)a8 columnCount:(unint64_t *)a9 rowCount:(unint64_t *)a10
{
  BOOL v15 = a4;
  BOOL v16 = a3;
  unint64_t v18 = (void (**)(__n128, __n128, __n128, __n128))a8;
  *a9 = 0;
  *a10 = 0;
  double width = self->_pixelRegionOfInterest.size.width;
  if (width >= 1.0)
  {
    double height = self->_pixelRegionOfInterest.size.height;
    if (height >= 1.0)
    {
      unint64_t v21 = (unint64_t)width;
      unint64_t v22 = (unint64_t)height;
      if (v16)
      {
        double v23 = (double)v22;
        unint64_t v24 = v22 - (unint64_t)((double)v22 * a6);
        unint64_t v25 = (v21 + v24 - 1) / v24;
        if (v25 > a7) {
          goto LABEL_26;
        }
        v44 = a10;
        double width = trunc(height * a5);
        double v26 = (double)v24;
        unint64_t v27 = 1;
      }
      else
      {
        if (!v15) {
          goto LABEL_26;
        }
        double v26 = (double)v21;
        unint64_t v28 = v21 - (unint64_t)((double)v21 * a6);
        unint64_t v27 = (v28 + v22 - 1) / v28;
        if (v27 > a7) {
          goto LABEL_26;
        }
        v44 = a10;
        double height = trunc(width / a5);
        double v23 = (double)v28;
        unint64_t v25 = 1;
      }
      uint64_t v29 = 0;
      unint64_t v30 = (v25 >> 1) + 1;
      unint64_t v31 = v27 >> 1;
      double y = self->_pixelRegionOfInterest.origin.y;
      v45 = v18;
      do
      {
        double x = self->_pixelRegionOfInterest.origin.x;
        uint64_t v34 = (v25 >> 1) + 1;
        do
        {
          v47.origin.double x = x;
          v47.origin.double y = y;
          v47.size.double width = width;
          v47.size.double height = height;
          CGRect v48 = CGRectIntersection(v47, self->_pixelRegionOfInterest);
          v45[2]((__n128)v48.origin, *(__n128 *)&v48.origin.y, (__n128)v48.size, *(__n128 *)&v48.size.height);
          double x = x + v26;
          --v34;
        }
        while (v34);
        if (v30 < v25)
        {
          double v35 = self->_pixelRegionOfInterest.origin.x + self->_pixelRegionOfInterest.size.width - width;
          unint64_t v36 = ~(v25 >> 1) + v25;
          do
          {
            v49.origin.double x = v35;
            v49.origin.double y = y;
            v49.size.double width = width;
            v49.size.double height = height;
            CGRect v50 = CGRectIntersection(v49, self->_pixelRegionOfInterest);
            v45[2]((__n128)v50.origin, *(__n128 *)&v50.origin.y, (__n128)v50.size, *(__n128 *)&v50.size.height);
            double v35 = v35 - v26;
            --v36;
          }
          while (v36);
        }
        double y = y + v23;
      }
      while (v29++ != v31);
      unint64_t v38 = v31 + 1;
      if (v31 + 1 < v27)
      {
        double v39 = self->_pixelRegionOfInterest.origin.y + self->_pixelRegionOfInterest.size.height;
        do
        {
          double v39 = v39 - v23;
          double v40 = self->_pixelRegionOfInterest.origin.x;
          uint64_t v41 = (v25 >> 1) + 1;
          do
          {
            v51.origin.double x = v40;
            v51.origin.double y = v39;
            v51.size.double width = width;
            v51.size.double height = height;
            CGRect v52 = CGRectIntersection(v51, self->_pixelRegionOfInterest);
            v45[2]((__n128)v52.origin, *(__n128 *)&v52.origin.y, (__n128)v52.size, *(__n128 *)&v52.size.height);
            double v40 = v40 + v26;
            --v41;
          }
          while (v41);
          if (v30 < v25)
          {
            double v42 = self->_pixelRegionOfInterest.origin.x + self->_pixelRegionOfInterest.size.width - height;
            unint64_t v43 = ~(v25 >> 1) + v25;
            do
            {
              v53.origin.double x = v42;
              v53.origin.double y = v39;
              v53.size.double width = width;
              v53.size.double height = height;
              CGRect v54 = CGRectIntersection(v53, self->_pixelRegionOfInterest);
              v45[2]((__n128)v54.origin, *(__n128 *)&v54.origin.y, (__n128)v54.size, *(__n128 *)&v54.size.height);
              double v42 = v42 - v26;
              --v43;
            }
            while (v43);
          }
          ++v38;
        }
        while (v38 != v27);
      }
      *a9 = v25;
      unint64_t v18 = v45;
      unint64_t *v44 = v27;
    }
  }
LABEL_26:
}

- (id)_initWithPixelOriginX:(unint64_t)a3 Y:(unint64_t)a4 width:(unint64_t)a5 height:(unint64_t)a6 regionOfInterest:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)VNRegionOfInterestTiling;
  id result = [(VNRegionOfInterestTiling *)&v16 init];
  if (result)
  {
    *((void *)result + 1) = a3;
    *((void *)result + 2) = a4;
    *((void *)result + 3) = a5;
    *((void *)result + 4) = a6;
    *((double *)result + 5) = x;
    *((double *)result + 6) = y;
    *((double *)result + 7) = width;
    *((double *)result + 8) = height;
    *((double *)result + 9) = x * (double)a5;
    *((double *)result + 10) = y * (double)a6;
    *((double *)result + 11) = width * (double)a5;
    *((double *)result + 12) = height * (double)a6;
  }
  return result;
}

+ (id)tilingForRegionOfInterest:(CGRect)a3 inPixelWidth:(unint64_t)a4 height:(unint64_t)a5 tileAspectRatio:(double)a6 options:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a7;
  objc_super v16 = objc_msgSend(objc_alloc((Class)a1), "_initWithPixelOriginX:Y:width:height:regionOfInterest:", 0, 0, a4, a5, x, y, width, height);
  [v16 _calculateTilesWithAspectRatio:v15 options:a6];

  return v16;
}

+ (id)tilingForRegionOfInterest:(CGRect)a3 inPixelBounds:(CGRect)a4 tileAspectRatio:(double)a5 options:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v10 = a3.size.height;
  double v11 = a3.size.width;
  double v12 = a3.origin.y;
  double v13 = a3.origin.x;
  id v15 = a6;
  objc_super v16 = objc_msgSend(objc_alloc((Class)a1), "_initWithPixelOriginX:Y:width:height:regionOfInterest:", (unint64_t)x, (unint64_t)y, (unint64_t)width, (unint64_t)height, v13, v12, v11, v10);
  [v16 _calculateTilesWithAspectRatio:v15 options:a5];

  return v16;
}

@end
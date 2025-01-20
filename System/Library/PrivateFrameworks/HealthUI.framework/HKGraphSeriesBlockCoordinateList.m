@interface HKGraphSeriesBlockCoordinateList
+ (id)coordinateListByCombiningSubCoordinates:(id)a3 chartableValueRange:(id)a4;
+ (id)coordinateListWithCoordinates:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4;
- (HKGraphSeriesDataBlockPath)blockPathEnd;
- (HKGraphSeriesDataBlockPath)blockPathStart;
- (NSArray)coordinates;
- (id)_coordinatesInChartableRange:(id)a3;
- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4;
- (int64_t)_numCoordinatesInChartableRange:(id)a3;
- (int64_t)numCoordinates;
- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6;
- (void)enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4 block:(id)a5;
@end

@implementation HKGraphSeriesBlockCoordinateList

+ (id)coordinateListByCombiningSubCoordinates:(id)a3 chartableValueRange:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[_HKCompoundBlockCoordinateList alloc] initWithSubCoordinates:v6 chartableValueRange:v5];

  return v7;
}

+ (id)coordinateListWithCoordinates:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4
{
  id v5 = a3;
  id v6 = [_HKBaseBlockCoordinateList alloc];
  HKGraphSeriesDataBlockPath v9 = *a4;
  v7 = [(_HKBaseBlockCoordinateList *)v6 initWithCoordinates:v5 blockPath:&v9];

  return v7;
}

- (void)enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4 block:(id)a5
{
  long long v5 = *(_OWORD *)&a3->c;
  v6[0] = *(_OWORD *)&a3->a;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a3->tx;
  [(HKGraphSeriesBlockCoordinateList *)self _enumerateCoordinatesWithTransform:v6 chartableValueRange:0 roundToViewScale:a4 block:a5];
}

- (NSArray)coordinates
{
  return 0;
}

- (int64_t)numCoordinates
{
  return 0;
}

- (HKGraphSeriesDataBlockPath)blockPathStart
{
  objc_opt_class();
  result = (HKGraphSeriesDataBlockPath *)OUTLINED_FUNCTION_0_9();
  retstr->index = 0;
  retstr->zoom = 0;
  retstr->resolution = 0;
  return result;
}

- (HKGraphSeriesDataBlockPath)blockPathEnd
{
  objc_opt_class();
  result = (HKGraphSeriesDataBlockPath *)OUTLINED_FUNCTION_0_9();
  retstr->index = 0;
  retstr->zoom = 0;
  retstr->resolution = 0;
  return result;
}

- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6
{
  OUTLINED_FUNCTION_1_4();
  NSRequestConcreteImplementation();
}

- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  return 0;
}

- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  return 0;
}

- (id)_coordinatesInChartableRange:(id)a3
{
  return 0;
}

- (int64_t)_numCoordinatesInChartableRange:(id)a3
{
  return 0;
}

@end
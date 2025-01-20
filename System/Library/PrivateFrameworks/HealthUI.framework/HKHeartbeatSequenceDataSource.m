@interface HKHeartbeatSequenceDataSource
- (CGRect)unionWithExtent:(CGRect)a3;
- (HKGraphSeriesDataBlock)dataBlock;
- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5;
- (HKHeartbeatSequenceDataSource)init;
- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4;
- (void)setHeartbeatSequencePoints:(id)a3;
@end

@implementation HKHeartbeatSequenceDataSource

- (HKHeartbeatSequenceDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)HKHeartbeatSequenceDataSource;
  v2 = [(HKGraphSeriesDataSource *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(HKGraphSeriesDataBlock);
    dataBlock = v2->_dataBlock;
    v2->_dataBlock = v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F1C978]);
    [(HKGraphSeriesDataBlock *)v2->_dataBlock setChartPoints:v5];
  }
  return v2;
}

- (void)setHeartbeatSequencePoints:(id)a3
{
  [(HKGraphSeriesDataBlock *)self->_dataBlock setChartPoints:a3];
  id v4 = [(HKGraphSeriesDataSource *)self delegate];
  [v4 dataSourceDidUpdateCache:self];
}

- (HKGraphSeriesDataBlockPath)blockPathForX:(SEL)a3 zoom:(id)a4 resolution:(int64_t)a5
{
  *(_OWORD *)&retstr->index = xmmword_1E0F05870;
  retstr->resolution = a6;
  return self;
}

- (id)cachedBlockForPath:(HKGraphSeriesDataBlockPath *)a3 context:(id)a4
{
  if (a3->index)
  {
    id v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    [(HKGraphSeriesDataBlock *)v4 setChartPoints:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v4 = self->_dataBlock;
  }
  return v4;
}

- (CGRect)unionWithExtent:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  objc_super v7 = [(HKGraphSeriesDataBlock *)self->_dataBlock chartPoints];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      uint64_t v11 = 0;
      double v12 = x;
      double v13 = y;
      do
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        v14 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
        v15 = [v14 xValueAsGenericType];
        [v15 doubleValue];
        double v17 = v16;

        v18 = [v14 yValue];
        [v18 doubleValue];
        double v20 = v19;

        if (v12 >= v17) {
          double x = v17;
        }
        else {
          double x = v12;
        }
        if (v13 >= v20) {
          double y = v20;
        }
        else {
          double y = v13;
        }
        double v21 = v12 + width;
        if (v12 + width < v17) {
          double v21 = v17;
        }
        double v22 = v13 + height;
        if (v13 + height < v20) {
          double v22 = v20;
        }
        double width = v21 - x;
        double height = v22 - y;
        ++v11;
        double v12 = x;
        double v13 = y;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  double v23 = x;
  double v24 = y;
  double v25 = width;
  double v26 = height;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (HKGraphSeriesDataBlock)dataBlock
{
  return self->_dataBlock;
}

- (void).cxx_destruct
{
}

@end
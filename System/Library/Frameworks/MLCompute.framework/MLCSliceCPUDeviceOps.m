@interface MLCSliceCPUDeviceOps
+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10;
- (MLCSliceCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14;
- (NSArray)begin;
- (NSArray)count;
- (NSArray)stride;
- (unint64_t)beginOffset;
- (void)setBegin:(id)a3;
- (void)setBeginOffset:(unint64_t)a3;
- (void)setCount:(id)a3;
- (void)setStride:(id)a3;
@end

@implementation MLCSliceCPUDeviceOps

+ (id)deviceOpsWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  v24 = (void *)[objc_alloc((Class)a1) initWithType:v15 params:v23 inDeltaData:v22 outDeltaData:v21 weightsDeltaData:v20 biasDeltaData:v19 weightsMomentumData:v18 biasMomentumData:v17 betaDeltaData:0 gammaDeltaData:0 betaMomentumData:0 gammaMomentumData:0];

  return v24;
}

- (MLCSliceCPUDeviceOps)initWithType:(int)a3 params:(id)a4 inDeltaData:(id)a5 outDeltaData:(id)a6 weightsDeltaData:(id)a7 biasDeltaData:(id)a8 weightsMomentumData:(id)a9 biasMomentumData:(id)a10 betaDeltaData:(id)a11 gammaDeltaData:(id)a12 betaMomentumData:(id)a13 gammaMomentumData:(id)a14
{
  v24.receiver = self;
  v24.super_class = (Class)MLCSliceCPUDeviceOps;
  v14 = [(MLCCPUDeviceOps *)&v24 initWithType:*(void *)&a3 params:a4 inDeltaData:a5 outDeltaData:a6 weightsDeltaData:a7 biasDeltaData:a8 weightsMomentumData:a9 biasMomentumData:a10 betaDeltaData:0 gammaDeltaData:0 betaMomentumData:0 gammaMomentumData:0];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_beginOffset = 0;
    v16 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v17 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    begin = v15->_begin;
    v15->_begin = (NSArray *)v17;

    uint64_t v19 = [v16 mutableCopy];
    count = v15->_count;
    v15->_count = (NSArray *)v19;

    uint64_t v21 = [v16 mutableCopy];
    stride = v15->_stride;
    v15->_stride = (NSArray *)v21;
  }
  return v15;
}

- (unint64_t)beginOffset
{
  return self->_beginOffset;
}

- (void)setBeginOffset:(unint64_t)a3
{
  self->_beginOffset = a3;
}

- (NSArray)begin
{
  return self->_begin;
}

- (void)setBegin:(id)a3
{
}

- (NSArray)count
{
  return self->_count;
}

- (void)setCount:(id)a3
{
}

- (NSArray)stride
{
  return self->_stride;
}

- (void)setStride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stride, 0);
  objc_storeStrong((id *)&self->_count, 0);

  objc_storeStrong((id *)&self->_begin, 0);
}

@end
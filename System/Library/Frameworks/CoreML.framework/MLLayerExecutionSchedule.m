@interface MLLayerExecutionSchedule
- (MLLayerExecutionSchedule)initWithComputeUnits:(unint64_t)a3 layerName:(id)a4 layerError:(int64_t)a5 layerTypeName:(id)a6 supportedComputeUnits:(unint64_t)a7 layerIndex:(int64_t)a8;
- (MLLayerExecutionSchedule)initWithComputeUnits:(unint64_t)a3 layerName:(id)a4 layerError:(int64_t)a5 layerTypeName:(id)a6 supportedComputeUnits:(unint64_t)a7 layerIndex:(int64_t)a8 supportMessages:(id)a9 computeTimeRatio:(double)a10;
- (MLLayerExecutionSchedule)initWithLayerError:(int64_t)a3;
- (NSDictionary)supportMessagesPerComputeUnit;
- (NSString)layerName;
- (NSString)layerTypeName;
- (double)computeTimeRatio;
- (int64_t)layerError;
- (int64_t)layerIndex;
- (unint64_t)preferredComputeUnit;
- (unint64_t)supportedComputeUnits;
@end

@implementation MLLayerExecutionSchedule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportMessagesPerComputeUnit, 0);
  objc_storeStrong((id *)&self->_layerTypeName, 0);

  objc_storeStrong((id *)&self->_layerName, 0);
}

- (double)computeTimeRatio
{
  return self->_computeTimeRatio;
}

- (NSDictionary)supportMessagesPerComputeUnit
{
  return self->_supportMessagesPerComputeUnit;
}

- (int64_t)layerIndex
{
  return self->_layerIndex;
}

- (unint64_t)supportedComputeUnits
{
  return self->_supportedComputeUnits;
}

- (NSString)layerTypeName
{
  return self->_layerTypeName;
}

- (unint64_t)preferredComputeUnit
{
  return self->_preferredComputeUnit;
}

- (NSString)layerName
{
  return self->_layerName;
}

- (int64_t)layerError
{
  return self->_layerError;
}

- (MLLayerExecutionSchedule)initWithComputeUnits:(unint64_t)a3 layerName:(id)a4 layerError:(int64_t)a5 layerTypeName:(id)a6 supportedComputeUnits:(unint64_t)a7 layerIndex:(int64_t)a8 supportMessages:(id)a9 computeTimeRatio:(double)a10
{
  id v17 = a4;
  id v18 = a6;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)MLLayerExecutionSchedule;
  v20 = [(MLLayerExecutionSchedule *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_layerError = a5;
    v20->_preferredComputeUnit = a3;
    uint64_t v22 = [v17 copy];
    layerName = v21->_layerName;
    v21->_layerName = (NSString *)v22;

    uint64_t v24 = [v18 copy];
    layerTypeName = v21->_layerTypeName;
    v21->_layerTypeName = (NSString *)v24;

    v21->_supportedComputeUnits = a7;
    v21->_layerIndex = a8;
    objc_storeStrong((id *)&v21->_supportMessagesPerComputeUnit, a9);
    v21->_computeTimeRatio = a10;
  }

  return v21;
}

- (MLLayerExecutionSchedule)initWithComputeUnits:(unint64_t)a3 layerName:(id)a4 layerError:(int64_t)a5 layerTypeName:(id)a6 supportedComputeUnits:(unint64_t)a7 layerIndex:(int64_t)a8
{
  return [(MLLayerExecutionSchedule *)self initWithComputeUnits:a3 layerName:a4 layerError:a5 layerTypeName:a6 supportedComputeUnits:a7 layerIndex:a8 supportMessages:NAN computeTimeRatio:MEMORY[0x1E4F1CC08]];
}

- (MLLayerExecutionSchedule)initWithLayerError:(int64_t)a3
{
  return [(MLLayerExecutionSchedule *)self initWithComputeUnits:0 layerName:&stru_1EF0E81D0 layerError:a3 layerTypeName:&stru_1EF0E81D0 supportedComputeUnits:0 layerIndex:0 supportMessages:NAN computeTimeRatio:MEMORY[0x1E4F1CC08]];
}

@end
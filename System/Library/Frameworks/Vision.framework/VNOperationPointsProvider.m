@interface VNOperationPointsProvider
- (BOOL)isEqual:(id)a3;
- (VNOperationPointsProvider)initWithOperationPoints:(id)a3;
- (id)operationPointsAndReturnError:(id *)a3;
@end

@implementation VNOperationPointsProvider

- (void).cxx_destruct
{
}

- (id)operationPointsAndReturnError:(id *)a3
{
  return self->_operationPoints;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNOperationPointsProvider *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(VNOperationPointsProvider *)self operationPointsAndReturnError:0];
      v7 = [(VNOperationPointsProvider *)v5 operationPointsAndReturnError:0];

      char v8 = VisionCoreEqualOrNilObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (VNOperationPointsProvider)initWithOperationPoints:(id)a3
{
  id v5 = a3;
  +[VNError VNAssert:v5 != 0 log:@"operation points object must be allocated before calling this method"];
  v9.receiver = self;
  v9.super_class = (Class)VNOperationPointsProvider;
  v6 = [(VNOperationPointsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_operationPoints, a3);
  }

  return v7;
}

@end
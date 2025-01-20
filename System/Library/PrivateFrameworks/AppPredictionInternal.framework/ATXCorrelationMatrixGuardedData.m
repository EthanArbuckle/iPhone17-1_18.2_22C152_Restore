@interface ATXCorrelationMatrixGuardedData
- (ATXCorrelationMatrixGuardedData)init;
- (ATXCorrelationMatrixGuardedData)initWithCorrelationMatrix:(id)a3 locationTotals:(id)a4;
@end

@implementation ATXCorrelationMatrixGuardedData

- (ATXCorrelationMatrixGuardedData)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = [(ATXCorrelationMatrixGuardedData *)self initWithCorrelationMatrix:v3 locationTotals:v4];

  return v5;
}

- (ATXCorrelationMatrixGuardedData)initWithCorrelationMatrix:(id)a3 locationTotals:(id)a4
{
  id v7 = a3;
  v8 = (NSMutableDictionary *)a4;
  v16.receiver = self;
  v16.super_class = (Class)ATXCorrelationMatrixGuardedData;
  v9 = [(ATXCorrelationMatrixGuardedData *)&v16 init];
  v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      objc_storeStrong((id *)&v9->_correlationMatrix, a3);
      v11 = v8;
      v8 = v11;
    }
    else
    {

      uint64_t v12 = objc_opt_new();
      correlationMatrix = v10->_correlationMatrix;
      v10->_correlationMatrix = (NSMutableDictionary *)v12;

      v11 = (NSMutableDictionary *)objc_opt_new();
      id v7 = 0;
      v8 = 0;
    }
    locationTotals = v10->_locationTotals;
    v10->_locationTotals = v11;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationTotals, 0);
  objc_storeStrong((id *)&self->_correlationMatrix, 0);
}

@end
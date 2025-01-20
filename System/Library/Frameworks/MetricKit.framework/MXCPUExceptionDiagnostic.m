@interface MXCPUExceptionDiagnostic
+ (BOOL)supportsSecureCoding;
- (MXCPUExceptionDiagnostic)initWithCoder:(id)a3;
- (MXCPUExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 totalCpuTime:(id)a6 totalSampledTime:(id)a7;
- (MXCPUExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 totalCpuTime:(id)a8 totalSampledTime:(id)a9;
- (MXCallStackTree)callStackTree;
- (NSMeasurement)totalCPUTime;
- (NSMeasurement)totalSampledTime;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXCPUExceptionDiagnostic

- (MXCPUExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 totalCpuTime:(id)a8 totalSampledTime:(id)a9
{
  uint64_t v11 = *(void *)&a6;
  id v16 = a7;
  id v25 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MXCPUExceptionDiagnostic;
  v18 = [(MXDiagnostic *)&v26 initWithMetaData:a3 applicationVersion:a4 signpostData:a5 andPID:v11];
  if (v18)
  {
    if (!v16)
    {
      v23 = 0;
      goto LABEL_8;
    }
    v19 = v25;
    [v25 doubleValue];
    if (v20 <= 0.0)
    {
      v23 = 0;
      v21 = v17;
      goto LABEL_11;
    }
    v21 = v17;
    [v17 doubleValue];
    if (v22 <= 0.0)
    {
      v23 = 0;
      goto LABEL_11;
    }
    objc_storeStrong((id *)&v18->_callStackTree, a7);
    objc_storeStrong((id *)&v18->_totalCPUTime, a8);
    objc_storeStrong((id *)&v18->_totalSampledTime, a9);
  }
  v23 = v18;
LABEL_8:
  v21 = v17;
  v19 = v25;
LABEL_11:

  return v23;
}

- (MXCPUExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 totalCpuTime:(id)a6 totalSampledTime:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)MXCPUExceptionDiagnostic;
  id v16 = [(MXDiagnostic *)&v21 initWithMetaData:a3 applicationVersion:a4];
  if (v16)
  {
    if (!v13 || ([v14 doubleValue], v17 <= 0.0) || (objc_msgSend(v15, "doubleValue"), v18 <= 0.0))
    {
      v19 = 0;
      goto LABEL_8;
    }
    objc_storeStrong((id *)&v16->_callStackTree, a5);
    objc_storeStrong((id *)&v16->_totalCPUTime, a6);
    objc_storeStrong((id *)&v16->_totalSampledTime, a7);
  }
  v19 = v16;
LABEL_8:

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXCPUExceptionDiagnostic;
  id v4 = a3;
  [(MXDiagnostic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalCPUTime, @"totalCPUTime", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_callStackTree forKey:@"callStackTree"];
  [v4 encodeObject:self->_totalSampledTime forKey:@"totalSampledTime"];
}

- (MXCPUExceptionDiagnostic)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MXCPUExceptionDiagnostic;
  objc_super v5 = [(MXDiagnostic *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalCPUTime"];
    totalCPUTime = v5->_totalCPUTime;
    v5->_totalCPUTime = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callStackTree"];
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalSampledTime"];
    totalSampledTime = v5->_totalSampledTime;
    v5->_totalSampledTime = (NSMeasurement *)v10;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v15.receiver = self;
  v15.super_class = (Class)MXCPUExceptionDiagnostic;
  id v4 = [(MXDiagnostic *)&v15 toDictionary];
  [v3 addEntriesFromDictionary:v4];

  callStackTree = self->_callStackTree;
  if (callStackTree)
  {
    uint64_t v6 = [(MXCallStackTree *)callStackTree toDictionary];
    [v3 setObject:v6 forKey:@"callStackTree"];
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = [v3 objectForKeyedSubscript:@"diagnosticMetaData"];
  [v7 addEntriesFromDictionary:v8];

  if (self->_totalCPUTime)
  {
    v9 = [(MXDiagnostic *)self measurementFormatter];
    uint64_t v10 = [v9 stringFromMeasurement:self->_totalCPUTime];
    [v7 setObject:v10 forKey:@"totalCPUTime"];
  }
  if (self->_totalSampledTime)
  {
    uint64_t v11 = [(MXDiagnostic *)self measurementFormatter];
    v12 = [v11 stringFromMeasurement:self->_totalSampledTime];
    [v7 setObject:v12 forKey:@"totalSampledTime"];
  }
  if ([v7 count])
  {
    objc_super v13 = (void *)[v7 copy];
    [v3 setObject:v13 forKey:@"diagnosticMetaData"];
  }

  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)totalCPUTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (NSMeasurement)totalSampledTime
{
  return (NSMeasurement *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalSampledTime, 0);
  objc_storeStrong((id *)&self->_totalCPUTime, 0);

  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
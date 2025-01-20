@interface MXDiskWriteExceptionDiagnostic
+ (BOOL)supportsSecureCoding;
- (MXCallStackTree)callStackTree;
- (MXDiskWriteExceptionDiagnostic)initWithCoder:(id)a3;
- (MXDiskWriteExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 totalWritesCaused:(id)a7 stackTrace:(id)a8;
- (MXDiskWriteExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 totalWritesCaused:(id)a5 stackTrace:(id)a6;
- (NSMeasurement)totalWritesCaused;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXDiskWriteExceptionDiagnostic

- (MXDiskWriteExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 totalWritesCaused:(id)a7 stackTrace:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  v17 = [(MXDiagnostic *)&v21 initWithMetaData:a3 applicationVersion:a4 signpostData:a5 andPID:v10];
  if (!v17) {
    goto LABEL_5;
  }
  [v15 doubleValue];
  v19 = 0;
  if (v16 && v18 > 0.0)
  {
    objc_storeStrong((id *)&v17->_totalWritesCaused, a7);
    objc_storeStrong((id *)&v17->_callStackTree, a8);
LABEL_5:
    v19 = v17;
  }

  return v19;
}

- (MXDiskWriteExceptionDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 totalWritesCaused:(id)a5 stackTrace:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  v13 = [(MXDiagnostic *)&v17 initWithMetaData:a3 applicationVersion:a4];
  if (!v13) {
    goto LABEL_5;
  }
  [v11 doubleValue];
  id v15 = 0;
  if (v12 && v14 > 0.0)
  {
    objc_storeStrong((id *)&v13->_totalWritesCaused, a5);
    objc_storeStrong((id *)&v13->_callStackTree, a6);
LABEL_5:
    id v15 = v13;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  id v4 = a3;
  [(MXDiagnostic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_totalWritesCaused, @"writesCaused", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_callStackTree forKey:@"callStackTree"];
}

- (MXDiskWriteExceptionDiagnostic)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  objc_super v5 = [(MXDiagnostic *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"writesCaused"];
    totalWritesCaused = v5->_totalWritesCaused;
    v5->_totalWritesCaused = (NSMeasurement *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callStackTree"];
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v8;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v13.receiver = self;
  v13.super_class = (Class)MXDiskWriteExceptionDiagnostic;
  id v4 = [(MXDiagnostic *)&v13 toDictionary];
  [v3 addEntriesFromDictionary:v4];

  callStackTree = self->_callStackTree;
  if (callStackTree)
  {
    uint64_t v6 = [(MXCallStackTree *)callStackTree toDictionary];
    [v3 setValue:v6 forKey:@"callStackTree"];
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = [v3 objectForKeyedSubscript:@"diagnosticMetaData"];
  [v7 addEntriesFromDictionary:v8];

  if (self->_totalWritesCaused)
  {
    v9 = [(MXDiagnostic *)self measurementFormatter];
    uint64_t v10 = [v9 stringFromMeasurement:self->_totalWritesCaused];
    [v7 setValue:v10 forKey:@"writesCaused"];
  }
  if ([v7 count])
  {
    objc_super v11 = (void *)[v7 copy];
    [v3 setObject:v11 forKey:@"diagnosticMetaData"];
  }

  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)totalWritesCaused
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalWritesCaused, 0);

  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
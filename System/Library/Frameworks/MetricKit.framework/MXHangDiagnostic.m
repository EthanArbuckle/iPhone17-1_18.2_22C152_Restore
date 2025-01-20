@interface MXHangDiagnostic
+ (BOOL)supportsSecureCoding;
+ (int64_t)_hangTypeForHangTypeString:(id)a3;
- (MXCallStackTree)callStackTree;
- (MXHangDiagnostic)initWithCoder:(id)a3;
- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 hangDuration:(id)a6;
- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 hangDuration:(id)a8;
- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 hangDuration:(id)a8 hangType:(int64_t)a9;
- (NSMeasurement)hangDuration;
- (NSString)hangTypeString;
- (id)toDictionary;
- (int64_t)hangType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXHangDiagnostic

- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 hangDuration:(id)a8 hangType:(int64_t)a9
{
  uint64_t v11 = *(void *)&a6;
  id v16 = a7;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)MXHangDiagnostic;
  v18 = [(MXDiagnostic *)&v22 initWithMetaData:a3 applicationVersion:a4 signpostData:a5 andPID:v11];
  if (v18)
  {
    if (!v16 || ([v17 doubleValue], v19 <= 0.0))
    {
      v20 = 0;
      goto LABEL_7;
    }
    v18->_hangType = a9;
    objc_storeStrong((id *)&v18->_callStackTree, a7);
    objc_storeStrong((id *)&v18->_hangDuration, a8);
  }
  v20 = v18;
LABEL_7:

  return v20;
}

- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 hangDuration:(id)a8
{
  return [(MXHangDiagnostic *)self initWithMetaData:a3 applicationVersion:a4 signpostData:a5 pid:*(void *)&a6 callStack:a7 hangDuration:a8 hangType:1];
}

- (MXHangDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 hangDuration:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MXHangDiagnostic;
  v13 = [(MXDiagnostic *)&v17 initWithMetaData:a3 applicationVersion:a4];
  if (v13)
  {
    if (!v11 || ([v12 doubleValue], v14 <= 0.0))
    {
      v15 = 0;
      goto LABEL_7;
    }
    v13->_hangType = 1;
    objc_storeStrong((id *)&v13->_callStackTree, a5);
    objc_storeStrong((id *)&v13->_hangDuration, a6);
  }
  v15 = v13;
LABEL_7:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MXHangDiagnostic;
  id v4 = a3;
  [(MXDiagnostic *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_callStackTree, @"callStackTree", v6.receiver, v6.super_class);
  [v4 encodeObject:self->_hangDuration forKey:@"hangDuration"];
  v5 = [(MXHangDiagnostic *)self hangTypeString];
  [v4 encodeObject:v5 forKey:@"hangType"];
}

- (MXHangDiagnostic)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MXHangDiagnostic;
  v5 = [(MXDiagnostic *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callStackTree"];
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hangDuration"];
    hangDuration = v5->_hangDuration;
    v5->_hangDuration = (NSMeasurement *)v8;

    v10 = objc_opt_class();
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hangType"];
    v5->_hangType = [v10 _hangTypeForHangTypeString:v11];
  }
  return v5;
}

+ (int64_t)_hangTypeForHangTypeString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isEqualToString:@"Unknown"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"Main Runloop Hang"])
    {
      int64_t v5 = 1;
    }
    else if ([v4 isEqualToString:@"Compositor Client Hang"])
    {
      int64_t v5 = 2;
    }
    else
    {
      int64_t v5 = 0;
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (NSString)hangTypeString
{
  int64_t v2 = [(MXHangDiagnostic *)self hangType];
  id v3 = @"Unknown";
  if (v2 == 1) {
    id v3 = @"Main Runloop Hang";
  }
  if (v2 == 2) {
    return (NSString *)@"Compositor Client Hang";
  }
  else {
    return &v3->isa;
  }
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v14.receiver = self;
  v14.super_class = (Class)MXHangDiagnostic;
  id v4 = [(MXDiagnostic *)&v14 toDictionary];
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

  if (self->_hangDuration)
  {
    v9 = [(MXDiagnostic *)self measurementFormatter];
    v10 = [v9 stringFromMeasurement:self->_hangDuration];
    [v7 setObject:v10 forKey:@"hangDuration"];
  }
  if ([v7 count])
  {
    id v11 = (void *)[v7 copy];
    [v3 setObject:v11 forKey:@"diagnosticMetaData"];
  }
  id v12 = [(MXHangDiagnostic *)self hangTypeString];
  [v3 setObject:v12 forKeyedSubscript:@"hangType"];

  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)hangDuration
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (int64_t)hangType
{
  return self->_hangType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hangDuration, 0);

  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
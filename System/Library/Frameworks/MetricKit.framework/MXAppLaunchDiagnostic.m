@interface MXAppLaunchDiagnostic
+ (BOOL)supportsSecureCoding;
- (MXAppLaunchDiagnostic)initWithCoder:(id)a3;
- (MXAppLaunchDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 launchDuration:(id)a6;
- (MXAppLaunchDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 launchDuration:(id)a8;
- (MXCallStackTree)callStackTree;
- (NSMeasurement)launchDuration;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXAppLaunchDiagnostic

- (MXAppLaunchDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 callStack:(id)a7 launchDuration:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  id v15 = a7;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)MXAppLaunchDiagnostic;
  v17 = [(MXDiagnostic *)&v21 initWithMetaData:a3 applicationVersion:a4 signpostData:a5 andPID:v10];
  if (v17)
  {
    if (!v15 || ([v16 doubleValue], v18 <= 0.0))
    {
      v19 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v17->_callStackTree, a7);
    objc_storeStrong((id *)&v17->_launchDuration, a8);
  }
  v19 = v17;
LABEL_7:

  return v19;
}

- (MXAppLaunchDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 callStack:(id)a5 launchDuration:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MXAppLaunchDiagnostic;
  v13 = [(MXDiagnostic *)&v17 initWithMetaData:a3 applicationVersion:a4];
  if (v13)
  {
    if (!v11 || ([v12 doubleValue], v14 <= 0.0))
    {
      id v15 = 0;
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v13->_callStackTree, a5);
    objc_storeStrong((id *)&v13->_launchDuration, a6);
  }
  id v15 = v13;
LABEL_7:

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXAppLaunchDiagnostic;
  id v4 = a3;
  [(MXDiagnostic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_callStackTree, @"callStackTree", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_launchDuration forKey:@"launchDuration"];
}

- (MXAppLaunchDiagnostic)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXAppLaunchDiagnostic;
  objc_super v5 = [(MXDiagnostic *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callStackTree"];
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"launchDuration"];
    launchDuration = v5->_launchDuration;
    v5->_launchDuration = (NSMeasurement *)v8;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v16.receiver = self;
  v16.super_class = (Class)MXAppLaunchDiagnostic;
  id v4 = [(MXDiagnostic *)&v16 toDictionary];
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

  if (self->_launchDuration)
  {
    v9 = [(MXDiagnostic *)self measurementFormatter];
    launchDuration = self->_launchDuration;
    objc_super v11 = [MEMORY[0x263F08C98] milliseconds];
    id v12 = [(NSMeasurement *)launchDuration measurementByConvertingToUnit:v11];
    v13 = [v9 stringFromMeasurement:v12];
    [v7 setObject:v13 forKey:@"launchDuration"];
  }
  if ([v7 count])
  {
    double v14 = (void *)[v7 copy];
    [v3 setObject:v14 forKey:@"diagnosticMetaData"];
  }

  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSMeasurement)launchDuration
{
  return (NSMeasurement *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchDuration, 0);

  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
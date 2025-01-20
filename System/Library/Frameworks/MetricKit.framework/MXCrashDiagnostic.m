@interface MXCrashDiagnostic
+ (BOOL)supportsSecureCoding;
- (MXCallStackTree)callStackTree;
- (MXCrashDiagnostic)initWithCoder:(id)a3;
- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 terminationReason:(id)a7 applicationSpecificInfo:(id)a8 virtualMemoryRegionInfo:(id)a9 exceptionType:(id)a10 exceptionCode:(id)a11 exceptionReason:(id)a12 signal:(id)a13 stackTrace:(id)a14;
- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 terminationReason:(id)a7 applicationSpecificInfo:(id)a8 virtualMemoryRegionInfo:(id)a9 exceptionType:(id)a10 exceptionCode:(id)a11 signal:(id)a12 stackTrace:(id)a13;
- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 terminationReason:(id)a5 applicationSpecificInfo:(id)a6 virtualMemoryRegionInfo:(id)a7 exceptionType:(id)a8 exceptionCode:(id)a9 signal:(id)a10 stackTrace:(id)a11;
- (MXCrashDiagnosticObjectiveCExceptionReason)exceptionReason;
- (NSNumber)exceptionCode;
- (NSNumber)exceptionType;
- (NSNumber)signal;
- (NSString)terminationReason;
- (NSString)virtualMemoryRegionInfo;
- (id)toDictionary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MXCrashDiagnostic

- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 terminationReason:(id)a7 applicationSpecificInfo:(id)a8 virtualMemoryRegionInfo:(id)a9 exceptionType:(id)a10 exceptionCode:(id)a11 signal:(id)a12 stackTrace:(id)a13
{
  uint64_t v13 = *(void *)&a6;
  id v28 = a7;
  id v27 = a9;
  id v26 = a10;
  id v25 = a11;
  id v18 = a12;
  id v19 = a13;
  v29.receiver = self;
  v29.super_class = (Class)MXCrashDiagnostic;
  v20 = [(MXDiagnostic *)&v29 initWithMetaData:a3 applicationVersion:a4 signpostData:a5 andPID:v13];
  p_isa = (id *)&v20->super.super.isa;
  if (v20)
  {
    if (!v19)
    {
      v22 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v20->_terminationReason, a7);
    objc_storeStrong(p_isa + 8, a9);
    objc_storeStrong(p_isa + 9, a10);
    objc_storeStrong(p_isa + 10, a11);
    objc_storeStrong(p_isa + 11, a12);
    objc_storeStrong(p_isa + 6, a13);
  }
  v22 = p_isa;
LABEL_6:

  return v22;
}

- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 signpostData:(id)a5 pid:(int)a6 terminationReason:(id)a7 applicationSpecificInfo:(id)a8 virtualMemoryRegionInfo:(id)a9 exceptionType:(id)a10 exceptionCode:(id)a11 exceptionReason:(id)a12 signal:(id)a13 stackTrace:(id)a14
{
  id v30 = a7;
  id v29 = a9;
  id v28 = a10;
  id v27 = a11;
  id v26 = a12;
  id v25 = a13;
  id v18 = a14;
  v31.receiver = self;
  v31.super_class = (Class)MXCrashDiagnostic;
  id v19 = [(MXDiagnostic *)&v31 initWithMetaData:a3 applicationVersion:a4 signpostData:a5 andPID:a6];
  p_isa = (id *)&v19->super.super.isa;
  if (v19)
  {
    if (!v18)
    {
      v21 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v19->_terminationReason, a7);
    objc_storeStrong(p_isa + 8, a9);
    objc_storeStrong(p_isa + 9, a10);
    objc_storeStrong(p_isa + 10, a11);
    objc_storeStrong(p_isa + 11, a13);
    objc_storeStrong(p_isa + 6, a14);
    objc_storeStrong(p_isa + 12, a12);
  }
  v21 = p_isa;
LABEL_6:

  return v21;
}

- (MXCrashDiagnostic)initWithMetaData:(id)a3 applicationVersion:(id)a4 terminationReason:(id)a5 applicationSpecificInfo:(id)a6 virtualMemoryRegionInfo:(id)a7 exceptionType:(id)a8 exceptionCode:(id)a9 signal:(id)a10 stackTrace:(id)a11
{
  id v26 = a5;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v22 = a10;
  id v17 = a11;
  v27.receiver = self;
  v27.super_class = (Class)MXCrashDiagnostic;
  id v18 = [(MXDiagnostic *)&v27 initWithMetaData:a3 applicationVersion:a4];
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    if (!v17)
    {
      v20 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v18->_terminationReason, a5);
    objc_storeStrong(p_isa + 8, a7);
    objc_storeStrong(p_isa + 9, a8);
    objc_storeStrong(p_isa + 10, a9);
    objc_storeStrong(p_isa + 11, a10);
    objc_storeStrong(p_isa + 6, a11);
  }
  v20 = p_isa;
LABEL_6:

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MXCrashDiagnostic;
  id v4 = a3;
  [(MXDiagnostic *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_terminationReason, @"terminationReason", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_virtualMemoryRegionInfo forKey:@"virtualMemoryRegionInfo"];
  [v4 encodeObject:self->_exceptionType forKey:@"exceptionType"];
  [v4 encodeObject:self->_exceptionCode forKey:@"exceptionCode"];
  [v4 encodeObject:self->_exceptionReason forKey:@"objectiveCexceptionReason"];
  [v4 encodeObject:self->_signal forKey:@"signal"];
  [v4 encodeObject:self->_callStackTree forKey:@"callStackTree"];
}

- (MXCrashDiagnostic)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MXCrashDiagnostic;
  objc_super v5 = [(MXDiagnostic *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"terminationReason"];
    terminationReason = v5->_terminationReason;
    v5->_terminationReason = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"virtualMemoryRegionInfo"];
    virtualMemoryRegionInfo = v5->_virtualMemoryRegionInfo;
    v5->_virtualMemoryRegionInfo = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exceptionType"];
    exceptionType = v5->_exceptionType;
    v5->_exceptionType = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"exceptionCode"];
    exceptionCode = v5->_exceptionCode;
    v5->_exceptionCode = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectiveCexceptionReason"];
    exceptionReason = v5->_exceptionReason;
    v5->_exceptionReason = (MXCrashDiagnosticObjectiveCExceptionReason *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"signal"];
    signal = v5->_signal;
    v5->_signal = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callStackTree"];
    callStackTree = v5->_callStackTree;
    v5->_callStackTree = (MXCallStackTree *)v18;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v18.receiver = self;
  v18.super_class = (Class)MXCrashDiagnostic;
  id v4 = [(MXDiagnostic *)&v18 toDictionary];
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

  terminationReason = self->_terminationReason;
  if (terminationReason) {
    [v7 setValue:terminationReason forKey:@"terminationReason"];
  }
  virtualMemoryRegionInfo = self->_virtualMemoryRegionInfo;
  if (virtualMemoryRegionInfo) {
    [v7 setValue:virtualMemoryRegionInfo forKey:@"virtualMemoryRegionInfo"];
  }
  exceptionType = self->_exceptionType;
  if (exceptionType) {
    [v7 setValue:exceptionType forKey:@"exceptionType"];
  }
  exceptionCode = self->_exceptionCode;
  if (exceptionCode) {
    [v7 setValue:exceptionCode forKey:@"exceptionCode"];
  }
  exceptionReason = self->_exceptionReason;
  if (exceptionReason)
  {
    uint64_t v14 = [(MXCrashDiagnosticObjectiveCExceptionReason *)exceptionReason dictionaryRepresentation];
    [v7 setValue:v14 forKey:@"objectiveCexceptionReason"];
  }
  signal = self->_signal;
  if (signal) {
    [v7 setValue:signal forKey:@"signal"];
  }
  if ([v7 count])
  {
    uint64_t v16 = (void *)[v7 copy];
    [v3 setObject:v16 forKey:@"diagnosticMetaData"];
  }

  return v3;
}

- (MXCallStackTree)callStackTree
{
  return (MXCallStackTree *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)terminationReason
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)virtualMemoryRegionInfo
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)exceptionType
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (NSNumber)exceptionCode
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)signal
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (MXCrashDiagnosticObjectiveCExceptionReason)exceptionReason
{
  return (MXCrashDiagnosticObjectiveCExceptionReason *)objc_getProperty(self, a2, 96, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptionReason, 0);
  objc_storeStrong((id *)&self->_signal, 0);
  objc_storeStrong((id *)&self->_exceptionCode, 0);
  objc_storeStrong((id *)&self->_exceptionType, 0);
  objc_storeStrong((id *)&self->_virtualMemoryRegionInfo, 0);
  objc_storeStrong((id *)&self->_terminationReason, 0);

  objc_storeStrong((id *)&self->_callStackTree, 0);
}

@end
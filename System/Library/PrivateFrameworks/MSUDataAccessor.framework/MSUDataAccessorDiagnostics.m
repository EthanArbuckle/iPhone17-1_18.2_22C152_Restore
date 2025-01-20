@interface MSUDataAccessorDiagnostics
- (id)copyPathForPersistentData:(int)a3 error:(id *)a4;
- (id)returnDirectoryIfExistsForPath:(id)a3;
- (id)specialCaseFDRPathForDiagnostics;
@end

@implementation MSUDataAccessorDiagnostics

- (id)returnDirectoryIfExistsForPath:(id)a3
{
  id v3 = a3;
  char v9 = 0;
  id v4 = (id)[MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v9];

  if (v5) {
    BOOL v6 = v9 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v3;
  }

  return v7;
}

- (id)specialCaseFDRPathForDiagnostics
{
  return [(MSUDataAccessorDiagnostics *)self returnDirectoryIfExistsForPath:@"/private/var/hardware/FactoryData/System/Library/Caches/Repair"];
}

- (id)copyPathForPersistentData:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  if (a3 != 100
    || (id result = [(MSUDataAccessorDiagnostics *)self specialCaseFDRPathForDiagnostics]) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)MSUDataAccessorDiagnostics;
    return [(MSUDataAccessor *)&v8 copyPathForPersistentData:v5 error:a4];
  }
  return result;
}

@end
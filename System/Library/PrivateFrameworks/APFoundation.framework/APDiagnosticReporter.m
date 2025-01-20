@interface APDiagnosticReporter
- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7;
@end

@implementation APDiagnosticReporter

- (BOOL)snapshotWithSignature:(id)a3 duration:(double)a4 event:(id)a5 payload:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = (void *)MEMORY[0x1E4F28F80];
  v16 = (void (**)(id, void))a7;
  v17 = [v15 processInfo];
  int v18 = [v17 isRunningTests];

  if (v18)
  {
    v16[2](v16, MEMORY[0x1E4F1CC08]);
    BOOL v19 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)APDiagnosticReporter;
    BOOL v19 = [(SDRDiagnosticReporter *)&v21 snapshotWithSignature:v12 duration:v13 event:v14 payload:v16 reply:a4];
  }

  return v19;
}

@end
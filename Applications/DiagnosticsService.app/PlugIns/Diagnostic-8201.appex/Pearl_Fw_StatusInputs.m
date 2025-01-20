@interface Pearl_Fw_StatusInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (int)configurationTimeForStreamInSec;
- (int)diagnosticCasesMask;
- (int)preemtingWaitInMicroSec;
- (int)useADControl;
- (int)useHighPriority;
- (void)setConfigurationTimeForStreamInSec:(int)a3;
- (void)setDiagnosticCasesMask:(int)a3;
- (void)setPreemtingWaitInMicroSec:(int)a3;
- (void)setUseADControl:(int)a3;
- (void)setUseHighPriority:(int)a3;
@end

@implementation Pearl_Fw_StatusInputs

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"configurationTimeForStreamInSec"];
  v6 = v5;
  if (v5) {
    int v7 = [v5 intValue];
  }
  else {
    int v7 = -1;
  }
  self->_configurationTimeForStreamInSec = v7;
  v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"];
  v9 = [v8 lastPathComponent];
  v10 = +[NSString stringWithFormat:@"%@ = %d", @"configurationTimeForStreamInSec", self->_configurationTimeForStreamInSec];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v9, 37, v10);

  v11 = [v4 objectForKeyedSubscript:@"diagnosticCasesMask"];

  if (v11 && !objc_msgSend(v11, "compare:options:range:", @"0x", 1, 0, 2))
  {
    v12 = +[NSScanner scannerWithString:v11];
    int v32 = 0;
    [v12 scanHexInt:&v32];
    self->_diagnosticCasesMask = v32;
  }
  else
  {
    self->_diagnosticCasesMask = -1;
  }
  v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"];
  v14 = [v13 lastPathComponent];
  v15 = +[NSString stringWithFormat:@"%@ = %d", @"diagnosticCasesMask", self->_diagnosticCasesMask];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v14, 61, v15);

  v16 = [v4 objectForKeyedSubscript:@"preemtingWaitInMicroSec"];

  if (v16) {
    int v17 = [v16 intValue];
  }
  else {
    int v17 = 2000000;
  }
  self->_preemtingWaitInMicroSec = v17;
  v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"];
  v19 = [v18 lastPathComponent];
  v20 = +[NSString stringWithFormat:@"%@ = %d", @"diagnosticCasesMask", self->_preemtingWaitInMicroSec];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v19, 72, v20);

  v21 = [v4 objectForKeyedSubscript:@"useADControl"];

  if (v21) {
    int v22 = [v21 intValue];
  }
  else {
    int v22 = 1;
  }
  self->_useADControl = v22;
  v23 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"];
  v24 = [v23 lastPathComponent];
  v25 = +[NSString stringWithFormat:@"%@ = %d", @"useADControl", self->_useADControl];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v24, 83, v25);

  v26 = [v4 objectForKeyedSubscript:@"useHighPriority"];

  if (v26) {
    int v27 = [v26 intValue];
  }
  else {
    int v27 = 0;
  }
  self->_useHighPriority = v27;
  v28 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Diagnostic-8201/Pearl_Fw_StatusInputs.mm"];
  v29 = [v28 lastPathComponent];
  v30 = +[NSString stringWithFormat:@"%@ = %d", @"useHighPriority", self->_useHighPriority];
  NSLog(@"<%@: %@:%d> %@", @"Diagnostic_FW_Status_iOS", v29, 94, v30);

  return 1;
}

- (int)configurationTimeForStreamInSec
{
  return self->_configurationTimeForStreamInSec;
}

- (void)setConfigurationTimeForStreamInSec:(int)a3
{
  self->_configurationTimeForStreamInSec = a3;
}

- (int)diagnosticCasesMask
{
  return self->_diagnosticCasesMask;
}

- (void)setDiagnosticCasesMask:(int)a3
{
  self->_diagnosticCasesMask = a3;
}

- (int)useADControl
{
  return self->_useADControl;
}

- (void)setUseADControl:(int)a3
{
  self->_useADControl = a3;
}

- (int)preemtingWaitInMicroSec
{
  return self->_preemtingWaitInMicroSec;
}

- (void)setPreemtingWaitInMicroSec:(int)a3
{
  self->_preemtingWaitInMicroSec = a3;
}

- (int)useHighPriority
{
  return self->_useHighPriority;
}

- (void)setUseHighPriority:(int)a3
{
  self->_useHighPriority = a3;
}

@end
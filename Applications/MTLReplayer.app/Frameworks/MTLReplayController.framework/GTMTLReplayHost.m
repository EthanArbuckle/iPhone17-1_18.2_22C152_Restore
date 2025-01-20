@interface GTMTLReplayHost
@end

@implementation GTMTLReplayHost

void __GTMTLReplayHost_computeDerivedCountersFromData_block_invoke_2(id a1, JSContext *a2, JSValue *a3)
{
  v3 = a3;
  v4 = [(JSValue *)v3 toString];
  v5 = [(JSValue *)v3 toDictionary];

  v6 = +[NSString stringWithFormat:@"[DYJSScripting] %@ %@", v4, v5];

  v7 = __stdoutp;
  if (g_runningInCI) {
    v8 = "#CI_ERROR# ";
  }
  else {
    v8 = "";
  }
  id v9 = v6;
  fprintf(v7, "%s%s %u: %s\n", v8, "NSDictionary *GTMTLReplayHost_computeDerivedCountersFromData(NSArray *__strong, NSArray *__strong, NSArray *__strong, NSArray *__strong, NSArray *__strong, NSDictionary *__strong)_block_invoke_2", 103, (const char *)[v9 UTF8String]);
  id v10 = v9;
  GTMTLReplay_handleError(101, (uint64_t)[v10 UTF8String], "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/launcher/DYJavaScriptHelper.m", (uint64_t)"GTMTLReplayHost_computeDerivedCountersFromData_block_invoke_2", 103, 2);
}

void __GTMTLReplayHost_computeDerivedCountersFromData_block_invoke(id a1, NSString *a2)
{
  v2 = +[NSString stringWithFormat:@"%@", a2];
  v3 = __stdoutp;
  if (g_runningInCI) {
    v4 = "#CI_ERROR# ";
  }
  else {
    v4 = "";
  }
  id v5 = v2;
  fprintf(v3, "%s%s %u: %s\n", v4, "NSDictionary *GTMTLReplayHost_computeDerivedCountersFromData(NSArray *__strong, NSArray *__strong, NSArray *__strong, NSArray *__strong, NSArray *__strong, NSDictionary *__strong)_block_invoke", 99, (const char *)[v5 UTF8String]);
  id v6 = v5;
  GTMTLReplay_handleError(101, (uint64_t)[v6 UTF8String], "/Library/Caches/com.apple.xbs/Sources/GPUToolsDevice/GPUTools/GTMTLCapture/launcher/DYJavaScriptHelper.m", (uint64_t)"GTMTLReplayHost_computeDerivedCountersFromData_block_invoke", 99, 2);
}

@end
@interface NSKeyValueDebugger
@end

@implementation NSKeyValueDebugger

_NSKeyValueDebugging *___NSKeyValueDebugger_block_invoke()
{
  result = (_NSKeyValueDebugging *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSProcessInfo environment](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "environment"), "objectForKeyedSubscript:", @"_NSKeyValueDebugging"), "BOOLValue");
  if (result)
  {
    _MergedGlobals_132 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[NSProcessInfo environment](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "environment"), "objectForKeyedSubscript:", @"_NSKeyValueDebuggingUseNSLog"), "BOOLValue");
    result = objc_alloc_init(_NSKeyValueDebugging);
    qword_1EB1ED900 = (uint64_t)result;
  }
  return result;
}

@end
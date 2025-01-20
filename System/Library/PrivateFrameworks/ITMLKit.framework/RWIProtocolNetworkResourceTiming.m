@interface RWIProtocolNetworkResourceTiming
@end

@implementation RWIProtocolNetworkResourceTiming

double __103__RWIProtocolNetworkResourceTiming_IKJSInspector__ik_networkResourceTimingFromData_referenceStartDate___block_invoke(uint64_t a1, double a2)
{
  double v2 = 0.0;
  if (a2 > 0.0)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    [v4 timeIntervalSince1970];
    double v6 = v5;
    [*(id *)(a1 + 32) timeIntervalSince1970];
    double v2 = v6 - v7;
  }
  return v2;
}

double __103__RWIProtocolNetworkResourceTiming_IKJSInspector__ik_networkResourceTimingFromData_referenceStartDate___block_invoke_2(uint64_t a1, double a2)
{
  double v2 = 0.0;
  if (a2 > 0.0) {
    return (a2 - *(double *)(a1 + 32)) * 1000.0;
  }
  return v2;
}

@end
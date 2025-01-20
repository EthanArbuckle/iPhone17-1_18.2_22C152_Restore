@interface RWIProtocolNetworkResourceTiming(IKJSDependency)
+ (id)safe_initWithStartTime:()IKJSDependency redirectStart:redirectEnd:fetchStart:domainLookupStart:domainLookupEnd:connectStart:connectEnd:secureConnectionStart:requestStart:responseStart:responseEnd:;
@end

@implementation RWIProtocolNetworkResourceTiming(IKJSDependency)

+ (id)safe_initWithStartTime:()IKJSDependency redirectStart:redirectEnd:fetchStart:domainLookupStart:domainLookupEnd:connectStart:connectEnd:secureConnectionStart:requestStart:responseStart:responseEnd:
{
  v31[12] = *MEMORY[0x1E4F143B8];
  double v29 = a2;
  double v30 = a1;
  double v27 = a4;
  double v28 = a3;
  double v25 = a6;
  double v26 = a5;
  double v23 = a8;
  double v24 = a7;
  v31[0] = &v30;
  v31[1] = &v29;
  v31[2] = &v28;
  v31[3] = &v27;
  v31[4] = &v26;
  v31[5] = &v25;
  v31[6] = &v24;
  v31[7] = &v23;
  v31[8] = &a17;
  v31[9] = &a18;
  v31[10] = &a19;
  v31[11] = &a20;
  id v20 = objc_alloc(MEMORY[0x1E4FB6CC8]);
  v21 = objc_msgSend(v20, "ik_initWithSelectorString:arguments:", @"initWithStartTime:redirectStart:redirectEnd:fetchStart:domainLookupStart:domainLookupEnd:connectStart:connectEnd:secureConnectionStart:requestStart:responseStart:responseEnd:", v31);

  return v21;
}

@end
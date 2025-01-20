@interface RWIProtocolNetworkResourceTiming(IKJSInspector)
+ (id)ik_networkResourceTimingFromData:()IKJSInspector referenceStartDate:;
@end

@implementation RWIProtocolNetworkResourceTiming(IKJSInspector)

+ (id)ik_networkResourceTimingFromData:()IKJSInspector referenceStartDate:
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKey:@"IKJSNetworkRequestRecordStartTime"];
  [v7 doubleValue];
  double v9 = v8;

  v10 = [v5 objectForKey:@"IKJSNetworkRequestRecordRedirectStartTime"];
  [v10 doubleValue];
  double v12 = v11;

  v13 = [v5 objectForKey:@"IKJSNetworkRequestRecordRedirectEndTime"];
  [v13 doubleValue];
  double v15 = v14;

  if (v15 > 0.0) {
    double v16 = v15;
  }
  else {
    double v16 = v9;
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __103__RWIProtocolNetworkResourceTiming_IKJSInspector__ik_networkResourceTimingFromData_referenceStartDate___block_invoke;
  v44[3] = &unk_1E6DE3FA8;
  id v45 = v6;
  id v17 = v6;
  v18 = (double (**)(void, double))MEMORY[0x1E4E65800](v44);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __103__RWIProtocolNetworkResourceTiming_IKJSInspector__ik_networkResourceTimingFromData_referenceStartDate___block_invoke_2;
  v43[3] = &__block_descriptor_40_e8_d16__0d8l;
  *(double *)&v43[4] = v16;
  v19 = (double (**)(void))MEMORY[0x1E4E65800](v43);
  double v42 = v18[2](v18, v9);
  double v41 = v18[2](v18, v12);
  double v20 = v18[2](v18, v15);
  double v21 = v20;
  if (v15 <= 0.0)
  {
    v22 = [v5 objectForKey:@"_kCFNTimingDataFetchStart"];
    [v22 doubleValue];
    double v21 = v19[2](v19);
  }
  v23 = [v5 objectForKey:@"_kCFNTimingDataDomainLookupStart"];
  [v23 doubleValue];
  double v40 = v19[2](v19);

  v24 = [v5 objectForKey:@"_kCFNTimingDataDomainLookupEnd"];
  [v24 doubleValue];
  double v39 = v19[2](v19);

  v25 = [v5 objectForKey:@"_kCFNTimingDataConnectStart"];
  [v25 doubleValue];
  double v26 = v19[2](v19);

  v27 = [v5 objectForKey:@"_kCFNTimingDataSecureConnectionStart"];
  [v27 doubleValue];
  double v28 = v19[2](v19);

  v29 = [v5 objectForKey:@"_kCFNTimingDataConnectEnd"];
  [v29 doubleValue];
  double v30 = v19[2](v19);

  v31 = [v5 objectForKey:@"_kCFNTimingDataRequestStart"];
  [v31 doubleValue];
  double v32 = v19[2](v19);

  v33 = [v5 objectForKey:@"_kCFNTimingDataResponseStart"];
  [v33 doubleValue];
  double v34 = v19[2](v19);

  v35 = [v5 objectForKey:@"_kCFNTimingDataResponseEnd"];
  [v35 doubleValue];
  double v36 = v19[2](v19);

  v37 = objc_msgSend(MEMORY[0x1E4FB6CC8], "safe_initWithStartTime:redirectStart:redirectEnd:fetchStart:domainLookupStart:domainLookupEnd:connectStart:connectEnd:secureConnectionStart:requestStart:responseStart:responseEnd:", v42, v41, v20, v21, v40, v39, v26, v30, *(void *)&v28, *(void *)&v32, *(void *)&v34, *(void *)&v36);

  return v37;
}

@end
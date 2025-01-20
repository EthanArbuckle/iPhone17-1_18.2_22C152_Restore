@interface RWIProtocolNetworkMetrics(IKJSInspector)
+ (id)ik_networkMetricsFromURLRequest:()IKJSInspector response:responseBody:timingData:;
@end

@implementation RWIProtocolNetworkMetrics(IKJSInspector)

+ (id)ik_networkMetricsFromURLRequest:()IKJSInspector response:responseBody:timingData:
{
  id v7 = a6;
  v8 = (objc_class *)MEMORY[0x1E4FB6CB8];
  id v9 = a3;
  id v10 = objc_alloc_init(v8);
  v11 = [v7 objectForKey:@"_kCFNTimingDataNetworkProtocolName"];

  if (v11)
  {
    v12 = [v7 objectForKey:@"_kCFNTimingDataNetworkProtocolName"];
    [v10 setProtocol:v12];
  }
  v13 = [v7 objectForKey:@"_kCFNTimingDataRemoteAddressAndPort"];

  if (v13)
  {
    v14 = [v7 objectForKey:@"_kCFNTimingDataRemoteAddressAndPort"];
    [v10 setRemoteAddress:v14];
  }
  v15 = [v7 objectForKey:@"_kCFNTimingDataConnectionInterfaceIdentifier"];

  if (v15)
  {
    v16 = [v7 objectForKey:@"_kCFNTimingDataConnectionInterfaceIdentifier"];
    [v10 setConnectionIdentifier:v16];
  }
  v17 = [v7 objectForKey:@"_kCFNTimingDataResponseBodyBytesDecoded"];

  if (v17)
  {
    v18 = [v7 objectForKey:@"_kCFNTimingDataResponseBodyBytesDecoded"];
    [v18 doubleValue];
    objc_msgSend(v10, "setResponseBodyDecodedSize:");
  }
  v19 = [v7 objectForKey:@"_kCFNTimingDataResponseBodyBytesReceived"];

  if (v19)
  {
    v20 = [v7 objectForKey:@"_kCFNTimingDataResponseBodyBytesReceived"];
    [v20 doubleValue];
    objc_msgSend(v10, "setResponseBodyBytesReceived:");
  }
  v21 = [v7 objectForKey:@"_kCFNTimingDataRequestHeaderSize"];

  if (v21)
  {
    v22 = [v7 objectForKey:@"_kCFNTimingDataRequestHeaderSize"];
    [v22 doubleValue];
    objc_msgSend(v10, "setRequestHeaderBytesSent:");
  }
  v23 = [v9 HTTPBody];
  objc_msgSend(v10, "setRequestBodyBytesSent:", (double)(unint64_t)objc_msgSend(v23, "length"));

  v24 = (void *)MEMORY[0x1E4FB6CA8];
  v25 = [v9 allHTTPHeaderFields];

  v26 = objc_msgSend(v24, "ik_networkHeadersFromHTTPHeaderFields:", v25);

  [v10 setRequestHeaders:v26];
  return v10;
}

@end
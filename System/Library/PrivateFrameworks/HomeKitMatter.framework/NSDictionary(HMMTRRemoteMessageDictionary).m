@interface NSDictionary(HMMTRRemoteMessageDictionary)
- (id)CHIPReadParams;
- (id)CHIPRemoteResults;
- (id)CHIPSubscribeParams;
- (uint64_t)CHIPAttributeID;
- (uint64_t)CHIPClusterID;
- (uint64_t)CHIPCommandFields;
- (uint64_t)CHIPCommandID;
- (uint64_t)CHIPData;
- (uint64_t)CHIPDownloadLogType;
- (uint64_t)CHIPDownloadTimeout;
- (uint64_t)CHIPEndpointID;
- (uint64_t)CHIPMaxInterval;
- (uint64_t)CHIPMinInterval;
- (uint64_t)CHIPRemoteCommand;
- (uint64_t)CHIPRemoteMessageTimeout;
- (uint64_t)CHIPTimedInvokeTimeout;
- (uint64_t)CHIPTimedWriteTimeout;
@end

@implementation NSDictionary(HMMTRRemoteMessageDictionary)

- (id)CHIPRemoteResults
{
  v2 = [a1 objectForKeyedSubscript:@"results"];

  if (v2)
  {
    v3 = [a1 objectForKeyedSubscript:@"results"];
    v4 = decodeValues(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)CHIPRemoteCommand
{
  return [a1 objectForKeyedSubscript:@"command"];
}

- (id)CHIPSubscribeParams
{
  v1 = (void *)MEMORY[0x263F10DB0];
  v2 = [a1 objectForKeyedSubscript:@"params"];
  v3 = [v1 decodeXPCSubscribeParams:v2];

  return v3;
}

- (id)CHIPReadParams
{
  v1 = (void *)MEMORY[0x263F10DB0];
  v2 = [a1 objectForKeyedSubscript:@"params"];
  v3 = [v1 decodeXPCReadParams:v2];

  return v3;
}

- (uint64_t)CHIPDownloadTimeout
{
  return objc_msgSend(a1, "hmf_numberForKey:", @"timeout");
}

- (uint64_t)CHIPDownloadLogType
{
  return objc_msgSend(a1, "hmf_numberForKey:", @"logType");
}

- (uint64_t)CHIPRemoteMessageTimeout
{
  return objc_msgSend(a1, "hmf_numberForKey:", @"timeout");
}

- (uint64_t)CHIPTimedInvokeTimeout
{
  return [a1 objectForKeyedSubscript:@"timedInvokeTimeout"];
}

- (uint64_t)CHIPTimedWriteTimeout
{
  return [a1 objectForKeyedSubscript:@"timedWriteTimeout"];
}

- (uint64_t)CHIPMaxInterval
{
  return [a1 objectForKeyedSubscript:@"maxInterval"];
}

- (uint64_t)CHIPMinInterval
{
  return [a1 objectForKeyedSubscript:@"minInterval"];
}

- (uint64_t)CHIPCommandFields
{
  return [a1 objectForKeyedSubscript:@"fields"];
}

- (uint64_t)CHIPData
{
  return [a1 objectForKeyedSubscript:@"data"];
}

- (uint64_t)CHIPCommandID
{
  return [a1 objectForKeyedSubscript:@"commandId"];
}

- (uint64_t)CHIPAttributeID
{
  return [a1 objectForKeyedSubscript:@"attributeId"];
}

- (uint64_t)CHIPClusterID
{
  return [a1 objectForKeyedSubscript:@"clusterId"];
}

- (uint64_t)CHIPEndpointID
{
  return [a1 objectForKeyedSubscript:@"endpointId"];
}

@end
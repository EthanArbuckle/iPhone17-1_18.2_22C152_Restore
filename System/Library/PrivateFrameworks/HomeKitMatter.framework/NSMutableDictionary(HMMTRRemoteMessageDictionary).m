@interface NSMutableDictionary(HMMTRRemoteMessageDictionary)
- (uint64_t)setCHIPCommandFields:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPData:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPDownloadLogType:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPDownloadTimeout:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPMaxInterval:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPMinInterval:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPRemoteCommand:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPRemoteMessageTimeout:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPTimedInvokeTimeout:()HMMTRRemoteMessageDictionary;
- (uint64_t)setCHIPTimedWriteTimeout:()HMMTRRemoteMessageDictionary;
- (void)setCHIPEncodedParams:()HMMTRRemoteMessageDictionary;
- (void)setCHIPEndpointId:()HMMTRRemoteMessageDictionary clusterId:attributeId:;
- (void)setCHIPEndpointId:()HMMTRRemoteMessageDictionary clusterId:commandId:;
- (void)setCHIPReadParams:()HMMTRRemoteMessageDictionary;
- (void)setCHIPRemoteResults:()HMMTRRemoteMessageDictionary;
- (void)setCHIPSubscribeParams:()HMMTRRemoteMessageDictionary;
@end

@implementation NSMutableDictionary(HMMTRRemoteMessageDictionary)

- (void)setCHIPRemoteResults:()HMMTRRemoteMessageDictionary
{
  encodeValues(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v4 forKey:@"results"];
}

- (uint64_t)setCHIPRemoteCommand:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKey:@"command"];
}

- (void)setCHIPEncodedParams:()HMMTRRemoteMessageDictionary
{
  if (a3) {
    return (void *)[a1 setObject:a3 forKeyedSubscript:@"params"];
  }
  return a1;
}

- (void)setCHIPSubscribeParams:()HMMTRRemoteMessageDictionary
{
  objc_msgSend(MEMORY[0x263F10DB0], "encodeXPCSubscribeParams:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"params"];
}

- (uint64_t)setCHIPDownloadTimeout:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKeyedSubscript:@"logTimeout"];
}

- (uint64_t)setCHIPDownloadLogType:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKeyedSubscript:@"logType"];
}

- (uint64_t)setCHIPRemoteMessageTimeout:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKeyedSubscript:@"timeout"];
}

- (void)setCHIPReadParams:()HMMTRRemoteMessageDictionary
{
  objc_msgSend(MEMORY[0x263F10DB0], "encodeXPCReadParams:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setObject:v2 forKeyedSubscript:@"params"];
}

- (uint64_t)setCHIPTimedInvokeTimeout:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKeyedSubscript:@"timedInvokeTimeout"];
}

- (uint64_t)setCHIPTimedWriteTimeout:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKeyedSubscript:@"timedWriteTimeout"];
}

- (uint64_t)setCHIPMaxInterval:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKeyedSubscript:@"maxInterval"];
}

- (uint64_t)setCHIPMinInterval:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKeyedSubscript:@"minInterval"];
}

- (uint64_t)setCHIPCommandFields:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKey:@"fields"];
}

- (uint64_t)setCHIPData:()HMMTRRemoteMessageDictionary
{
  return [a1 setObject:a3 forKey:@"data"];
}

- (void)setCHIPEndpointId:()HMMTRRemoteMessageDictionary clusterId:commandId:
{
  id v9 = a5;
  id v8 = a4;
  [a1 setObject:a3 forKeyedSubscript:@"endpointId"];
  [a1 setObject:v8 forKeyedSubscript:@"clusterId"];

  [a1 setObject:v9 forKeyedSubscript:@"commandId"];
}

- (void)setCHIPEndpointId:()HMMTRRemoteMessageDictionary clusterId:attributeId:
{
  id v9 = a5;
  id v8 = a4;
  [a1 setObject:a3 forKeyedSubscript:@"endpointId"];
  [a1 setObject:v8 forKeyedSubscript:@"clusterId"];

  [a1 setObject:v9 forKeyedSubscript:@"attributeId"];
}

@end
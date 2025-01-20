@interface EscrowUpdateMetadataRequest
- (Class)responseClass;
- (id)bodyDictionary;
- (id)command;
- (void)performRequestWithHandler:(id)a3;
@end

@implementation EscrowUpdateMetadataRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)command
{
  return @"UPDATE_RECORD";
}

- (id)bodyDictionary
{
  v11.receiver = self;
  v11.super_class = (Class)EscrowUpdateMetadataRequest;
  v3 = [(EscrowGenericRequest *)&v11 bodyDictionary];
  v4 = [(EscrowGenericRequest *)self encodedMetadata];

  if (v4)
  {
    v5 = [(EscrowGenericRequest *)self encodedMetadata];
    [v3 setObject:v5 forKeyedSubscript:@"oldMetadata"];
  }
  v6 = [(EscrowGenericRequest *)self metadata];

  if (v6)
  {
    v7 = [(EscrowGenericRequest *)self metadata];
    v8 = [v7 base64EncodedStringFromDict];
    [v3 setObject:v8 forKeyedSubscript:@"newMetadata"];
  }
  if ([(EscrowGenericRequest *)self duplicate])
  {
    v9 = CloudServicesLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100049FFC();
    }
  }

  return v3;
}

@end
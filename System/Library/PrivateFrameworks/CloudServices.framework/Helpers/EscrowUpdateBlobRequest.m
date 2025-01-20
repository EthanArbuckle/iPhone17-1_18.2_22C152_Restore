@interface EscrowUpdateBlobRequest
- (Class)responseClass;
- (EscrowPrerecord)prerecord;
- (EscrowUpdateBlobRequest)initWithRequest:(id)a3;
- (id)bodyDictionary;
- (id)command;
- (id)urlString;
- (void)performRequestWithHandler:(id)a3;
- (void)setPrerecord:(id)a3;
@end

@implementation EscrowUpdateBlobRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (EscrowUpdateBlobRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EscrowUpdateBlobRequest;
  v5 = [(EscrowGenericRequest *)&v8 initWithRequest:v4];
  if (v5)
  {
    v6 = [v4 prerecord];
    [(EscrowUpdateBlobRequest *)v5 setPrerecord:v6];
  }
  return v5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  v2 = [(EscrowGenericRequest *)self baseURL];
  v3 = [v2 stringByAppendingString:@"/escrowproxy/api/update_blob"];

  return v3;
}

- (id)command
{
  return @"UPDATE_RECORD";
}

- (id)bodyDictionary
{
  v15.receiver = self;
  v15.super_class = (Class)EscrowUpdateBlobRequest;
  v3 = [(EscrowGenericRequest *)&v15 bodyDictionary];
  id v4 = [(EscrowGenericRequest *)self blob];
  v5 = [v4 base64EncodedStringWithOptions:0];
  [v3 setObject:v5 forKeyedSubscript:@"blob"];

  v6 = [(EscrowGenericRequest *)self blob];
  v7 = sub_10000EDEC(v6);
  [v3 setObject:v7 forKeyedSubscript:@"blobDigest"];

  if ([(EscrowGenericRequest *)self duplicate]) {
    [(EscrowGenericRequest *)self duplicateEncodedMetadata];
  }
  else {
  objc_super v8 = [(EscrowGenericRequest *)self encodedMetadata];
  }
  [v3 setObject:v8 forKeyedSubscript:@"oldMetadata"];

  unsigned int v9 = [(EscrowGenericRequest *)self duplicate];
  v10 = [(EscrowGenericRequest *)self metadata];
  if (v9)
  {
    uint64_t v11 = [(EscrowGenericRequest *)self _filteredMetadataForDoubleEnrollment:v10];

    v10 = (void *)v11;
  }
  v12 = [v10 base64EncodedStringFromDict];
  [v3 setObject:v12 forKeyedSubscript:@"newMetadata"];

  v13 = CloudServicesLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "EscrowUpdateBlobRequest: bodyDictionary: %@", buf, 0xCu);
  }

  return v3;
}

- (EscrowPrerecord)prerecord
{
  return self->_prerecord;
}

- (void)setPrerecord:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
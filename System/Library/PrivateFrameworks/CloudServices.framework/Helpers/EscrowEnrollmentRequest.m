@interface EscrowEnrollmentRequest
- (Class)responseClass;
- (EscrowEnrollmentRequest)initWithRequest:(id)a3;
- (EscrowPrerecord)prerecord;
- (id)bodyDictionary;
- (id)command;
- (id)validateInput;
- (void)performRequestWithHandler:(id)a3;
- (void)setPrerecord:(id)a3;
@end

@implementation EscrowEnrollmentRequest

- (void)performRequestWithHandler:(id)a3
{
}

- (EscrowEnrollmentRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EscrowEnrollmentRequest;
  v5 = [(EscrowGenericRequest *)&v8 initWithRequest:v4];
  if (v5)
  {
    v6 = [v4 prerecord];
    [(EscrowEnrollmentRequest *)v5 setPrerecord:v6];
  }
  return v5;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)command
{
  return @"ENROLL";
}

- (id)validateInput
{
  v14.receiver = self;
  v14.super_class = (Class)EscrowEnrollmentRequest;
  id v4 = [(EscrowPasswordAuthenticatedRequest *)&v14 validateInput];
  if (!v4)
  {
    v5 = [(EscrowEnrollmentRequest *)self prerecord];
    if (!v5)
    {
      v2 = [(EscrowGenericRequest *)self recoveryPassphrase];
      if (![v2 length]
        || ([(EscrowGenericRequest *)self escrowRecord], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
      {

        goto LABEL_11;
      }
      id v4 = (void *)v6;
    }
    if ([(EscrowGenericRequest *)self stingray] || [(EscrowGenericRequest *)self iCDP])
    {
      if (v5)
      {
        id v4 = 0;
      }
      else
      {

        id v4 = 0;
        v5 = v2;
      }
LABEL_17:

      goto LABEL_18;
    }
    v12 = [(EscrowGenericRequest *)self phoneNumber];
    id v13 = [v12 length];

    if (v5)
    {

      if (!v13)
      {
LABEL_11:
        id v4 = +[CloudServicesError errorWithCode:22 error:0 format:@"Missing required parameters"];
        v5 = CloudServicesLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v7 = [(EscrowGenericRequest *)self recoveryPassphrase];
          if ([v7 length]) {
            CFStringRef v8 = @"Yes";
          }
          else {
            CFStringRef v8 = @"No";
          }
          v9 = [(EscrowGenericRequest *)self escrowRecord];
          v10 = [(EscrowGenericRequest *)self phoneNumber];
          *(_DWORD *)buf = 138412802;
          CFStringRef v16 = v8;
          __int16 v17 = 2112;
          v18 = v9;
          __int16 v19 = 2112;
          v20 = v10;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Missing required parameters passphrase: %@\ndata: %@\nsms target: %@", buf, 0x20u);
        }
        goto LABEL_17;
      }
    }
    else
    {

      if (!v13) {
        goto LABEL_11;
      }
    }
    id v4 = 0;
  }
LABEL_18:

  return v4;
}

- (id)bodyDictionary
{
  v21.receiver = self;
  v21.super_class = (Class)EscrowEnrollmentRequest;
  v3 = [(EscrowGenericRequest *)&v21 bodyDictionary];
  id v4 = [(EscrowGenericRequest *)self phoneNumber];

  if (v4)
  {
    v5 = [(EscrowGenericRequest *)self phoneNumber];
    [v3 setObject:v5 forKeyedSubscript:@"phoneNumber"];
  }
  uint64_t v6 = [(EscrowGenericRequest *)self countryCode];

  if (v6)
  {
    v7 = [(EscrowGenericRequest *)self countryCode];
    [v3 setObject:v7 forKeyedSubscript:@"countryISOCode"];
  }
  CFStringRef v8 = [(EscrowGenericRequest *)self countryDialCode];

  if (v8)
  {
    v9 = [(EscrowGenericRequest *)self countryDialCode];
    [v3 setObject:v9 forKeyedSubscript:@"countryDialCode"];
  }
  v10 = [(EscrowGenericRequest *)self dsid];

  if (v10)
  {
    v11 = [(EscrowGenericRequest *)self dsid];
    [v3 setObject:v11 forKeyedSubscript:@"dsid"];
  }
  unsigned int v12 = [(EscrowGenericRequest *)self duplicate];
  id v13 = [(EscrowGenericRequest *)self metadata];
  if (v12)
  {
    uint64_t v14 = [(EscrowGenericRequest *)self _filteredMetadataForDoubleEnrollment:v13];

    id v13 = (void *)v14;
  }
  v15 = [v13 base64EncodedStringFromDict];
  [v3 setObject:v15 forKeyedSubscript:@"metadata"];

  CFStringRef v16 = [(EscrowGenericRequest *)self blob];
  __int16 v17 = [v16 base64EncodedStringWithOptions:0];
  [v3 setObject:v17 forKeyedSubscript:@"blob"];

  v18 = [(EscrowGenericRequest *)self blob];
  __int16 v19 = sub_10000EDEC(v18);
  [v3 setObject:v19 forKeyedSubscript:@"blobDigest"];

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
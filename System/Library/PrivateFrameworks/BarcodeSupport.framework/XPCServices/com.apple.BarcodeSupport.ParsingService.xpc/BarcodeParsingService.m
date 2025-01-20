@interface BarcodeParsingService
- (BOOL)_associatedDomainIsApprovedForURL:(id)a3 applicationIdentifier:(id)a4;
- (BarcodeParsingService)init;
- (id)_urlDecoderErrorWithCode:(int64_t)a3 description:(id)a4;
- (id)_urlDecoderWithVersion:(unint64_t)a3 error:(id *)a4;
- (void)decodeAppClipCodeURLWithEncodedData:(id)a3 codingVersion:(unint64_t)a4 requiresAuthorization:(BOOL)a5 withReply:(id)a6;
- (void)parseQRCodeFeature:(id)a3 withReply:(id)a4;
- (void)parseQRCodeMetadata:(id)a3 withReply:(id)a4;
- (void)parseQRCodeString:(id)a3 withReply:(id)a4;
- (void)setPreferredBundleIdentifier:(id)a3 forURL:(id)a4;
@end

@implementation BarcodeParsingService

- (BarcodeParsingService)init
{
  v8.receiver = self;
  v8.super_class = (Class)BarcodeParsingService;
  v2 = [(BarcodeParsingService *)&v8 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.BarcodeSupport.BarcodeParsingService.%@.%p", objc_opt_class(), v2];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    decodingQueue = v2->_decodingQueue;
    v2->_decodingQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)parseQRCodeString:(id)a3 withReply:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *, void))a4;
  BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v7) {
    sub_100002940(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = +[BCSParser parseString:v5];
  if (v15)
  {
    v6[2](v6, v15, 0);
  }
  else
  {
    v16 = +[NSError errorWithDomain:BCSErrorDomain code:3 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v16);
  }
}

- (void)parseQRCodeMetadata:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v8) {
    sub_10000297C(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = (void *)MRCDescriptorCreateWithAttributes();
  v17 = (void *)MRCDescriptorDecodePayload();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v19 = 138477827;
    v20 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "BarcodeParingService: string decoded from QR: %{private}@", (uint8_t *)&v19, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v17 length])
  {
    [(BarcodeParsingService *)self parseQRCodeString:v17 withReply:v7];
  }
  else
  {
    v18 = +[NSError errorWithDomain:BCSErrorDomain code:2 userInfo:0];
    v7[2](v7, 0, v18);
  }
}

- (void)parseQRCodeFeature:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v8) {
    sub_100002A00(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  v16 = [v6 messageString];
  if ([v16 length])
  {
    [(BarcodeParsingService *)self parseQRCodeString:v16 withReply:v7];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000029B8();
    }
    v17 = +[NSError errorWithDomain:BCSErrorDomain code:2 userInfo:0];
    v7[2](v7, 0, v17);
  }
}

- (id)_urlDecoderWithVersion:(unint64_t)a3 error:(id *)a4
{
  urlDecoder = self->_urlDecoder;
  if (urlDecoder && [(UCAppClipCodeURLDecoding *)urlDecoder codingVersion] == (id)a3) {
    goto LABEL_8;
  }
  if (a3 < 4)
  {
    uint64_t v10 = +[UCAppClipCodeURLDecoder decoderWithVersion:a3];
    uint64_t v11 = self->_urlDecoder;
    self->_urlDecoder = v10;

LABEL_8:
    uint64_t v9 = self->_urlDecoder;
    goto LABEL_9;
  }
  if (a4)
  {
    BOOL v8 = +[NSString stringWithFormat:@"The version of encoded URL is not supported. current version:%ld, max supported:%ld", a3, 3];
    *a4 = [(BarcodeParsingService *)self _urlDecoderErrorWithCode:1 description:v8];
  }
  uint64_t v9 = 0;
LABEL_9:
  return v9;
}

- (BOOL)_associatedDomainIsApprovedForURL:(id)a3 applicationIdentifier:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = +[NSURLComponents componentsWithURL:a3 resolvingAgainstBaseURL:1];
    BOOL v7 = [v6 host];
    if (v7)
    {
      id v8 = [objc_alloc((Class)_SWCServiceSpecifier) initWithServiceType:0 applicationIdentifier:v5 domain:0];
      +[_SWCServiceDetails serviceDetailsWithServiceSpecifier:v8 error:0];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if (objc_msgSend(v13, "isApproved", (void)v17))
            {
              uint64_t v14 = [v13 serviceSpecifier];
              unsigned __int8 v15 = [v14 domainEncompassesDomain:v7];

              if (v15)
              {
                LOBYTE(v10) = 1;
                goto LABEL_16;
              }
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (id)_urlDecoderErrorWithCode:(int64_t)a3 description:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
    id v11 = v5;
    BOOL v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  }
  else
  {
    BOOL v7 = 0;
  }
  id v8 = +[NSError errorWithDomain:BCSAppClipCodeURLDecoderErrorDomain code:a3 userInfo:v7];

  return v8;
}

- (void)decodeAppClipCodeURLWithEncodedData:(id)a3 codingVersion:(unint64_t)a4 requiresAuthorization:(BOOL)a5 withReply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = +[NSXPCConnection currentConnection];
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 auditToken];
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }

  uint64_t v14 = WBSApplicationIdentifierFromAuditToken();
  long long v26 = v28;
  long long v27 = v29;
  char HasEntitlement = WBSAuditTokenHasEntitlement();
  if (a5 || (HasEntitlement & 1) != 0)
  {
    decodingQueue = self->_decodingQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100002318;
    v18[3] = &unk_100004238;
    v18[4] = self;
    unint64_t v22 = a4;
    id v21 = v11;
    id v19 = v10;
    BOOL v25 = a5;
    long long v23 = v28;
    long long v24 = v29;
    id v20 = v14;
    dispatch_async((dispatch_queue_t)decodingQueue, v18);
  }
  else
  {
    v16 = [(BarcodeParsingService *)self _urlDecoderErrorWithCode:0 description:@"Process requires an entitlement for suppressing URL authorization check"];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v16);
  }
}

- (void)setPreferredBundleIdentifier:(id)a3 forURL:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessQueryService, 0);
  objc_storeStrong((id *)&self->_urlDecoder, 0);
  objc_storeStrong((id *)&self->_decodingQueue, 0);
}

@end
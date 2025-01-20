@interface NEFilterBrowserFlow
+ (BOOL)supportsSecureCoding;
- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7;
- (BOOL)createDropReply:(void *)a3 verdict:(void *)a4 context:;
- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6;
- (NEFilterBrowserFlow)initWithCoder:(id)a3;
- (NSURL)parentURL;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setParentURL:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
@end

@implementation NEFilterBrowserFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentURL, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setParentURL:(id)a3
{
}

- (NSURL)parentURL
{
  return (NSURL *)objc_getProperty(self, a2, 168, 1);
}

- (void)setResponse:(id)a3
{
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 160, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSURLRequest)request
{
  return (NSURLRequest *)objc_getProperty(self, a2, 152, 1);
}

- (BOOL)createDataCompleteReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if ([v13 drop])
  {
    id v15 = v13;
  }
  else
  {
    id v15 = +[NEFilterDataVerdict allowVerdict];
  }
  v16 = v15;
  BOOL v17 = [(NEFilterBrowserFlow *)self createDataReply:v12 controlSocket:v10 direction:a5 verdict:v15 context:v14];
  char v18 = [v16 drop] ^ 1 | v17;

  return v18;
}

- (BOOL)createDataReply:(id)a3 controlSocket:(int)a4 direction:(int64_t)a5 verdict:(id)a6 context:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  char v15 = -[NEFilterFlow updateCurrentVerdictFromDataVerdict:direction:](self, v12, a5);
  if (self) {
    id Property = objc_getProperty(self, v14, 112, 1);
  }
  else {
    id Property = 0;
  }
  if ([Property drop])
  {
    char v15 = -[NEFilterBrowserFlow createDropReply:verdict:context:]((BOOL)self, v11, v12, v13);
  }
  else
  {
    id v18 = v11;
    if (self)
    {
      id v19 = objc_getProperty(self, v17, 112, 1);
      if (a5 == 2)
      {
        xpc_dictionary_set_uint64(v18, "verdict-peek", [v19 inboundPeekOffset]);
        uint64_t v21 = objc_msgSend(objc_getProperty(self, v20, 112, 1), "inboundPassOffset");
      }
      else
      {
        xpc_dictionary_set_uint64(v18, "verdict-peek", [v19 outboundPeekOffset]);
        uint64_t v21 = objc_msgSend(objc_getProperty(self, v22, 112, 1), "outboundPassOffset");
      }
      xpc_dictionary_set_uint64(v18, "verdict-pass", v21);
    }
  }
  return v15;
}

- (BOOL)createDropReply:(void *)a3 verdict:(void *)a4 context:
{
  id v7 = a2;
  v8 = a3;
  id v9 = a4;
  if (a1)
  {
    xpc_dictionary_set_BOOL(v7, "verdict-drop", 1);
    uint64_t v10 = [v9 _principalObject];
    id v11 = [v10 filterConfiguration];
    id v12 = [v11 organization];

    if (v12)
    {
      id v14 = [v10 filterConfiguration];
      id v15 = [v14 organization];
      v16 = (const char *)[v15 UTF8String];

      if (v16) {
        xpc_dictionary_set_string(v7, "organization", v16);
      }
    }
    if (!v8 || (v8[11] & 1) == 0)
    {
      a1 = 1;
LABEL_56:

      goto LABEL_57;
    }
    BOOL v17 = objc_getProperty(v8, v13, 16, 1);
    int v18 = isa_nsstring(v17);

    if (!v18)
    {
      a1 = 0;
      v33 = "x-apple-content-filter://nefilter-unblock";
LABEL_42:
      v56 = objc_getProperty(v8, v19, 24, 1);
      int v57 = isa_nsstring(v56);

      if (v57)
      {
        v58 = [v9 remediationMap];
        v59 = [v58 objectForKeyedSubscript:NEFilterProviderRemediationMapRemediationButtonTexts];

        if (isa_nsdictionary(v59))
        {
          v61 = objc_getProperty(v8, v60, 24, 1);
          v62 = [v59 objectForKeyedSubscript:v61];

          id v63 = v62;
          if (isa_nsstring(v63))
          {
            v64 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
            v65 = [v63 stringByAddingPercentEncodingWithAllowedCharacters:v64];
            id v81 = [v65 stringByReplacingOccurrencesOfString:@"%20" withString:@" "];

            v66 = "Request Access";
            if (v81)
            {
              id v67 = v81;
              uint64_t v68 = [v67 UTF8String];
              if (v68) {
                v66 = (const char *)v68;
              }
            }
            else
            {
              id v67 = 0;
            }
          }
          else
          {

            id v67 = 0;
            v66 = "Request Access";
          }
        }
        else
        {
          v66 = "Request Access";
        }
      }
      else
      {
        v66 = "Request Access";
      }
      xpc_dictionary_set_string(v7, "remediation-url", v33);
      xpc_dictionary_set_string(v7, "remediation-button-text", v66);
      goto LABEL_56;
    }
    SEL v20 = [v9 remediationMap];
    uint64_t v21 = [v20 objectForKeyedSubscript:NEFilterProviderRemediationMapRemediationURLs];

    if (!isa_nsdictionary(v21))
    {
      a1 = 0;
      v33 = "x-apple-content-filter://nefilter-unblock";
LABEL_41:

      goto LABEL_42;
    }
    v23 = objc_getProperty(v8, v22, 16, 1);
    v24 = [v21 objectForKeyedSubscript:v23];

    v25 = [v10 filterConfiguration];
    id v26 = v24;
    id v27 = (id)a1;
    id v28 = v25;
    id v80 = v27;
    if (!isa_nsstring(v26))
    {
      id v34 = 0;
LABEL_35:

      v33 = "x-apple-content-filter://nefilter-unblock";
      if (v34)
      {
        uint64_t v55 = [v34 UTF8String];
        a1 = v55 != 0;
        if (v55) {
          v33 = (const char *)v55;
        }
      }
      else
      {
        a1 = 0;
      }

      goto LABEL_41;
    }
    v78 = v21;
    uint64_t v29 = [v26 mutableCopy];
    v30 = [v27 URL];
    v72 = (void *)v29;
    if (v30)
    {
      v31 = [v27 URL];
      v32 = [v31 absoluteString];
    }
    else
    {
      v32 = &stru_1EF054CB8;
    }

    v77 = v32;
    v35 = (void *)[(__CFString *)v32 mutableCopy];
    v36 = [v27 URL];
    v37 = [v36 scheme];
    objc_msgSend(v35, "replaceOccurrencesOfString:withString:options:range:", v37, &stru_1EF054CB8, 0, 0, objc_msgSend(v35, "length"));

    objc_msgSend(v35, "replaceOccurrencesOfString:withString:options:range:", @"://", &stru_1EF054CB8, 0, 0, objc_msgSend(v35, "length"));
    v76 = v35;
    objc_msgSend(v72, "replaceOccurrencesOfString:withString:options:range:", @"NE_FLOW_URL", v35, 0, 0, objc_msgSend(v72, "length"));
    v38 = [v27 URL];
    v39 = [v38 host];
    if (v39)
    {
      [v27 URL];
      v41 = id v40 = v28;
      v42 = [v41 host];

      id v28 = v40;
    }
    else
    {
      v42 = &stru_1EF054CB8;
    }

    objc_msgSend(v72, "replaceOccurrencesOfString:withString:options:range:", @"NE_FLOW_HOSTNAME", v42, 0, 0, objc_msgSend(v72, "length"));
    v43 = [v28 organization];
    if (v43)
    {
      v44 = [v28 organization];
    }
    else
    {
      v44 = &stru_1EF054CB8;
    }

    objc_msgSend(v72, "replaceOccurrencesOfString:withString:options:range:", @"NE_ORGANIZATION", v44, 0, 0, objc_msgSend(v72, "length"));
    v45 = [v28 username];
    id v79 = v28;
    v74 = v42;
    v75 = v44;
    if (v45)
    {
      v46 = [v28 username];
    }
    else
    {
      v46 = &stru_1EF054CB8;
    }

    v73 = v46;
    objc_msgSend(v72, "replaceOccurrencesOfString:withString:options:range:", @"NE_USERNAME", v46, 0, 0, objc_msgSend(v72, "length"));
    v47 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
    v48 = [v72 stringByAddingPercentEncodingWithAllowedCharacters:v47];

    v49 = [MEMORY[0x1E4F1CB10] URLWithString:v48];
    v50 = v49;
    if (v49)
    {
      v51 = [v49 scheme];
      v52 = [v51 lowercaseString];
      if ([v52 isEqualToString:@"http"])
      {

LABEL_30:
        id v34 = v48;
LABEL_34:

        id v28 = v79;
        uint64_t v21 = v78;
        goto LABEL_35;
      }
      v70 = [v50 scheme];
      v53 = [v70 lowercaseString];
      char v71 = [v53 isEqualToString:@"https"];

      if (v71) {
        goto LABEL_30;
      }
    }
    v54 = ne_log_obj();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v54, OS_LOG_TYPE_ERROR, "URL is not http or https", buf, 2u);
    }

    id v34 = 0;
    goto LABEL_34;
  }
LABEL_57:

  return a1;
}

- (BOOL)createNewFlowReply:(id)a3 controlSocket:(int)a4 verdict:(id)a5 context:(id)a6
{
  id v9 = a3;
  uint64_t v10 = a5;
  id v12 = a6;
  if (v10
    || (+[NEFilterNewFlowVerdict allowVerdict],
        (uint64_t v10 = (unsigned char *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (v10[12])
    {
      id v14 = objc_getProperty(v10, v11, 32, 1);
      int v15 = isa_nsstring(v14);

      if (v15)
      {
        v16 = [v12 URLAppendStringMap];
        id v18 = objc_getProperty(v10, v17, 32, 1);
        id v19 = [v16 objectForKeyedSubscript:v18];

        if (isa_nsstring(v19))
        {
          SEL v20 = (const char *)[v19 UTF8String];
          if (v20) {
            xpc_dictionary_set_string(v9, "url-append-string", v20);
          }
        }
      }
      xpc_dictionary_set_uint64(v9, "verdict-peek", 0);
      xpc_dictionary_set_uint64(v9, "verdict-pass", 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_12;
    }
  }
  if ([v10 drop])
  {
    BOOL v13 = -[NEFilterBrowserFlow createDropReply:verdict:context:]((BOOL)self, v9, v10, v12);
    goto LABEL_13;
  }
  xpc_dictionary_set_uint64(v9, "verdict-peek", [v10 peekInboundBytes]);
  xpc_dictionary_set_uint64(v9, "verdict-pass", [v10 filterInbound] - 1);
  if ([v10 filterOutbound])
  {
    SEL v22 = ne_log_obj();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_19DDAF000, v22, OS_LOG_TYPE_INFO, "Filtering outbound data is not currently supported for browser flows.", v25, 2u);
    }
  }
  if (![v10 filterInbound])
  {
LABEL_12:
    BOOL v13 = 1;
    goto LABEL_13;
  }
  v24 = -[NEFilterAbsoluteVerdict initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:]([NEFilterAbsoluteVerdict alloc], "initWithDrop:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:", 0, 0, [v10 peekInboundBytes], -1, 0);
  if (self) {
    objc_setProperty_atomic(self, v23, v24, 112);
  }

  BOOL v13 = 0;
LABEL_13:

  return v13;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v13.receiver = self;
  v13.super_class = (Class)NEFilterBrowserFlow;
  id v7 = -[NEFilterFlow descriptionWithIndent:options:](&v13, sel_descriptionWithIndent_options_);
  v8 = [(NEFilterBrowserFlow *)self parentURL];
  id v9 = [v8 host];
  a4 |= 1uLL;
  [v7 appendPrettyObject:v9 withName:@"parentHostname" andIndent:v5 options:a4];

  uint64_t v10 = [(NEFilterBrowserFlow *)self request];
  [v7 appendPrettyObject:v10 withName:@"request" andIndent:v5 options:a4];

  id v11 = [(NEFilterBrowserFlow *)self response];
  [v7 appendPrettyObject:v11 withName:@"response" andIndent:v5 options:a4];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NEFilterBrowserFlow;
  v4 = [(NEFilterFlow *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NEFilterBrowserFlow *)self parentURL];
  v6 = (void *)v4[21];
  v4[21] = v5;

  uint64_t v7 = [(NEFilterBrowserFlow *)self request];
  v8 = (void *)v4[19];
  v4[19] = v7;

  uint64_t v9 = [(NEFilterBrowserFlow *)self response];
  uint64_t v10 = (void *)v4[20];
  v4[20] = v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NEFilterBrowserFlow;
  id v4 = a3;
  [(NEFilterFlow *)&v8 encodeWithCoder:v4];
  uint64_t v5 = [(NEFilterBrowserFlow *)self parentURL];
  [v4 encodeObject:v5 forKey:@"ParentURL"];

  v6 = [(NEFilterBrowserFlow *)self request];
  [v4 encodeObject:v6 forKey:@"URLRequest"];

  uint64_t v7 = [(NEFilterBrowserFlow *)self response];
  [v4 encodeObject:v7 forKey:@"URLResponse"];
}

- (NEFilterBrowserFlow)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEFilterBrowserFlow;
  uint64_t v5 = [(NEFilterFlow *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ParentURL"];
    parentURL = v5->_parentURL;
    v5->_parentURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLRequest"];
    request = v5->_request;
    v5->_request = (NSURLRequest *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URLResponse"];
    response = v5->_response;
    v5->_response = (NSURLResponse *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
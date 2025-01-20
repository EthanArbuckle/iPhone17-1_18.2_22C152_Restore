@interface TMOAuth
+ (id)headerForURL:(id)a3 method:(id)a4 postParameters:(id)a5 nonce:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 token:(id)a9 tokenSecret:(id)a10;
- (NSString)baseString;
- (NSString)headerString;
- (TMOAuth)initWithURL:(id)a3 method:(id)a4 postParameters:(id)a5 nonce:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 token:(id)a9 tokenSecret:(id)a10;
@end

@implementation TMOAuth

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerString, 0);
  objc_storeStrong((id *)&self->_baseString, 0);
}

- (NSString)headerString
{
  return self->_headerString;
}

- (NSString)baseString
{
  return self->_baseString;
}

- (TMOAuth)initWithURL:(id)a3 method:(id)a4 postParameters:(id)a5 nonce:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 token:(id)a9 tokenSecret:(id)a10
{
  v76[5] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v23 = (__CFString *)a10;
  v73.receiver = self;
  v73.super_class = (Class)TMOAuth;
  v24 = [(TMOAuth *)&v73 init];
  if (v24)
  {
    v66 = v23;
    uint64_t v68 = (uint64_t)v21;
    id v25 = v20;
    id v26 = objc_alloc(MEMORY[0x263EFF9A0]);
    v75[0] = @"oauth_timestamp";
    v27 = [MEMORY[0x263EFF910] date];
    id v28 = v19;
    v29 = NSString;
    [v27 timeIntervalSince1970];
    objc_msgSend(v29, "stringWithFormat:", @"%f", round(v30));
    v31 = v67 = v22;
    v75[1] = @"oauth_nonce";
    v75[2] = @"oauth_version";
    v76[2] = @"1.0";
    v76[3] = @"HMAC-SHA1";
    v76[0] = v31;
    v76[1] = v28;
    v61 = v25;
    v62 = v28;
    v75[3] = @"oauth_signature_method";
    v75[4] = @"oauth_consumer_key";
    v76[4] = v25;
    v32 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:5];
    v33 = (void *)[v26 initWithDictionary:v32];

    if (v67 && [v67 length]) {
      [v33 setObject:v67 forKeyedSubscript:@"oauth_token"];
    }
    v34 = [v16 query];
    v35 = type metadata for some(v34);

    id v65 = v16;
    v36 = [v16 absoluteString];
    v37 = [v36 componentsSeparatedByString:@"?"];
    v38 = [v37 objectAtIndexedSubscript:0];

    v58 = v38;
    v59 = v35;
    id v63 = v18;
    id v64 = v17;
    v39 = generateBaseString(v38, v17, (uint64_t)v33, v35, v18);
    v60 = v24;
    objc_storeStrong((id *)&v24->_baseString, v39);
    v57 = v39;
    v40 = sign(v39, v68, v66);
    [v33 setObject:v40 forKeyedSubscript:@"oauth_signature"];

    v41 = [MEMORY[0x263EFF980] array];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v42 = v33;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v69 objects:v74 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v70 != v45) {
            objc_enumerationMutation(v42);
          }
          uint64_t v47 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          v48 = NSString;
          v49 = [v42 objectForKeyedSubscript:v47];
          v50 = TMURLEncode(v49);
          v51 = [v48 stringWithFormat:@"%@=\"%@\"", v47, v50, v57, v58, v59];
          [v41 addObject:v51];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v69 objects:v74 count:16];
      }
      while (v44);
    }

    v52 = NSString;
    v53 = [v41 componentsJoinedByString:@","];
    uint64_t v54 = [v52 stringWithFormat:@"OAuth %@", v53];
    v24 = v60;
    headerString = v60->_headerString;
    v60->_headerString = (NSString *)v54;

    id v17 = v64;
    id v16 = v65;
    id v19 = v62;
    id v18 = v63;
    id v20 = v61;
    id v22 = v67;
    id v21 = (id)v68;
    v23 = v66;
  }

  return v24;
}

+ (id)headerForURL:(id)a3 method:(id)a4 postParameters:(id)a5 nonce:(id)a6 consumerKey:(id)a7 consumerSecret:(id)a8 token:(id)a9 tokenSecret:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [[TMOAuth alloc] initWithURL:v23 method:v22 postParameters:v21 nonce:v20 consumerKey:v19 consumerSecret:v18 token:v17 tokenSecret:v16];

  id v25 = [(TMOAuth *)v24 headerString];

  return v25;
}

@end
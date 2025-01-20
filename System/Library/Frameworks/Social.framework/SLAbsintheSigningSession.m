@interface SLAbsintheSigningSession
- (BOOL)establish;
- (SLAbsintheSigningSession)initWithCertURL:(id)a3 sessionURL:(id)a4;
- (id)_urlEncodedString:(id)a3;
- (id)signatureForData:(id)a3;
- (void)dealloc;
@end

@implementation SLAbsintheSigningSession

- (SLAbsintheSigningSession)initWithCertURL:(id)a3 sessionURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLAbsintheSigningSession;
  v9 = [(SLAbsintheSigningSession *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_certURL, a3);
    objc_storeStrong((id *)&v10->_sessionURL, a4);
  }

  return v10;
}

- (void)dealloc
{
  IW1PcFszqNK((uint64_t)self->_context);
  v3.receiver = self;
  v3.super_class = (Class)SLAbsintheSigningSession;
  [(SLAbsintheSigningSession *)&v3 dealloc];
}

- (BOOL)establish
{
  v69[1] = *MEMORY[0x1E4F143B8];
  _SLLog(v2, 7, @"Fetching Absinthe cert.");
  v4 = [MEMORY[0x1E4F1CB10] URLWithString:self->_certURL];
  v5 = [MEMORY[0x1E4F290D0] requestWithURL:v4];
  id v61 = 0;
  id v62 = 0;
  v6 = [MEMORY[0x1E4F29090] sendSynchronousRequest:v5 returningResponse:&v62 error:&v61];
  id v7 = v62;
  id v8 = v61;
  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    uint64_t v44 = [v6 length];
    _SLLog(v2, 7, @"Got Absinthe cert: %d bytes.");
    uint64_t v60 = 0;
    unsigned int v59 = 0;
    _SLLog(v2, 7, @"Initializing Absinthe session.");
    id v11 = v6;
    KxmB0CKvgWt(objc_msgSend(v11, "bytes", v44), objc_msgSend(v11, "length"));
    if (v12)
    {
      _SLLog(v2, 3, @"NACInit failed, status: %d");
      v10 = 0;
      goto LABEL_8;
    }
    p_context = &self->_context;
    _SLLog(v2, 7, @"session info request: %p of size %lu");
    v15 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v60, v59, v60, v59);
    uint64_t v16 = [v15 base64Encoding];

    v68 = @"absinthe-operations";
    v66 = @"create-session-info";
    v63[0] = @"id";
    v63[1] = @"request";
    v64[0] = &unk_1F1E40D38;
    v64[1] = v16;
    v53 = (void *)v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];
    v65 = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    v67 = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
    v69[0] = v19;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];

    id v58 = 0;
    v54 = (void *)v20;
    uint64_t v21 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v20 options:0 error:&v58];
    id v22 = v58;
    v23 = (void *)v21;
    v24 = (void *)[[NSString alloc] initWithData:v21 encoding:4];
    v25 = [(SLAbsintheSigningSession *)self _urlEncodedString:v24];

    v52 = v25;
    if (v22)
    {
      _SLLog(v2, 3, @"Building Absinthe operation JSON failed: %@");
      v10 = 0;
      int v26 = 1;
      v27 = v23;
      v28 = v54;
LABEL_26:

      BOOL v13 = v26 == 0;
      goto LABEL_9;
    }
    v29 = (void *)MEMORY[0x1E4F28E88];
    v30 = [MEMORY[0x1E4F1CB10] URLWithString:self->_sessionURL];
    v31 = [v29 requestWithURL:v30];

    [v31 setHTTPMethod:@"POST"];
    v32 = [v25 dataUsingEncoding:4];
    [v31 setHTTPBody:v32];

    [v31 addValue:@"Absinthe/2.0 Thunderhill (com.apple.social.facebook)" forHTTPHeaderField:@"User-Agent"];
    id v56 = 0;
    id v57 = v7;
    uint64_t v33 = [MEMORY[0x1E4F29090] sendSynchronousRequest:v31 returningResponse:&v57 error:&v56];
    id v49 = v57;

    id v34 = v56;
    v10 = v34;
    v48 = (void *)v33;
    if (v34 || !v33)
    {
      v35 = [v34 localizedDescription];
      _SLLog(v2, 3, @"Could not connect to session URL: %@");
      id v22 = 0;
      int v26 = 1;
      v27 = v23;
      v28 = v54;
LABEL_25:

      id v7 = v49;
      goto LABEL_26;
    }
    v47 = v31;
    id v55 = 0;
    v35 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v33 options:0 error:&v55];
    id v36 = v55;
    id v22 = v36;
    v27 = v23;
    if (v36)
    {
      v37 = [v36 localizedDescription];
      _SLLog(v2, 3, @"JSON parsing failed: %@");
      int v26 = 1;
    }
    else
    {
      v45 = v35;
      v38 = [v35 objectForKey:@"absinthe-results"];
      v46 = [v38 objectForKey:@"create-session-info"];
      v39 = [v46 lastObject];
      v37 = [v39 objectForKey:@"session-info"];

      v28 = v54;
      if (!v37)
      {
        _SLLog(v2, 3, @"Could not get session info from server response.");
        int v26 = 1;
        v35 = v45;
LABEL_24:

        v31 = v47;
        goto LABEL_25;
      }
      v40 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64Encoding:v37];
      _SLLog(v2, 7, @"Initialized Absinthe session. Establishing key...");
      uint64_t v51 = (uint64_t)*p_context;
      id v41 = v40;
      nDYmeMqvWb(v51, [v41 bytes], objc_msgSend(v41, "length"));
      if (v42)
      {
        _SLLog(v2, 3, @"NACKeyEstablishment failed, status: %d");
        int v26 = 1;
      }
      else
      {
        int v26 = 0;
      }
      v35 = v45;
    }
    v28 = v54;
    goto LABEL_24;
  }
  v10 = v8;
  v43 = [v8 localizedDescription];
  _SLLog(v2, 3, @"Could not get Absinthe cert: %@");

LABEL_8:
  BOOL v13 = 0;
LABEL_9:

  return v13;
}

- (id)signatureForData:(id)a3
{
  if (self->_context)
  {
    uint64_t v12 = 0;
    id v5 = a3;
    _SLLog(v3, 7, @"Signing data.");
    context = self->_context;
    id v7 = v5;
    uint64_t v8 = [v7 bytes];
    uint64_t v9 = [v7 length];

    t1BoNctgaUu66((uint64_t)context, v8, v9, (uint64_t)&v12);
    if (v10) {
      _SLLog(v3, 3, @"NACSign failed, status: %d");
    }
  }

  return 0;
}

- (id)_urlEncodedString:(id)a3
{
  uint64_t v3 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)a3, 0, @":/?#[]@!$&‚Äö√Ñ√¥()*+,;='",
                       0x8000100u);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionURL, 0);

  objc_storeStrong((id *)&self->_certURL, 0);
}

@end
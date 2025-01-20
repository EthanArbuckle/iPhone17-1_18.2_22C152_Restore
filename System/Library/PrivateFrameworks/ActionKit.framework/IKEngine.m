@interface IKEngine
+ (void)setOAuthConsumerKey:(id)a3 andConsumerSecret:(id)a4;
- (IKEngine)init;
- (IKEngine)initWithDelegate:(id)a3;
- (IKEngineDelegate)delegate;
- (NSString)OAuthToken;
- (NSString)OAuthTokenSecret;
- (id)_signatureWithKey:(id)a3 baseString:(id)a4;
- (id)_startConnectionWithAPIPath:(id)a3 bodyArguments:(id)a4 type:(int)a5 userInfo:(id)a6 context:(id)a7;
- (id)addBookmarkWithURL:(id)a3 title:(id)a4 description:(id)a5 folder:(id)a6 resolveFinalURL:(BOOL)a7 userInfo:(id)a8;
- (id)addBookmarkWithURL:(id)a3 userInfo:(id)a4;
- (id)addFolderWithTitle:(id)a3 userInfo:(id)a4;
- (id)archiveBookmark:(id)a3 userInfo:(id)a4;
- (id)authTokenForUsername:(id)a3 password:(id)a4 userInfo:(id)a5;
- (id)bookmarksInFolder:(id)a3 limit:(unint64_t)a4 existingBookmarks:(id)a5 userInfo:(id)a6;
- (id)bookmarksWithUserInfo:(id)a3;
- (id)connectionForIdentifier:(id)a3;
- (id)deleteBookmark:(id)a3 userInfo:(id)a4;
- (id)deleteFolder:(id)a3 userInfo:(id)a4;
- (id)foldersWithUserInfo:(id)a3;
- (id)identifierForConnection:(id)a3;
- (id)moveBookmark:(id)a3 toFolder:(id)a4 userInfo:(id)a5;
- (id)orderFolders:(id)a3 userInfo:(id)a4;
- (id)starBookmark:(id)a3 userInfo:(id)a4;
- (id)textOfBookmark:(id)a3 userInfo:(id)a4;
- (id)unarchiveBookmark:(id)a3 userInfo:(id)a4;
- (id)unstarBookmark:(id)a3 userInfo:(id)a4;
- (id)updateReadProgressOfBookmark:(id)a3 toProgress:(double)a4 userInfo:(id)a5;
- (id)verifyCredentialsWithUserInfo:(id)a3;
- (unint64_t)numberOfConnections;
- (void)cancelAllConnections;
- (void)cancelConnection:(id)a3;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setOAuthToken:(id)a3;
- (void)setOAuthTokenSecret:(id)a3;
@end

@implementation IKEngine

- (void)setOAuthTokenSecret:(id)a3
{
}

- (NSString)OAuthTokenSecret
{
  return self->_OAuthTokenSecret;
}

- (void)setOAuthToken:(id)a3
{
}

- (NSString)OAuthToken
{
  return self->_OAuthToken;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (IKEngineDelegate *)a3;
}

- (IKEngineDelegate)delegate
{
  return self->_delegate;
}

- (id)_signatureWithKey:(id)a3 baseString:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v5 = (const char *)[a3 cStringUsingEncoding:1];
  v6 = (const char *)[a4 cStringUsingEncoding:1];
  size_t v7 = strlen(v5);
  size_t v8 = strlen(v6);
  CCHmac(0, v5, v7, v6, v8, macOut);
  v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:macOut length:20];
  v10 = (void *)[v9 base64EncodedStringWithOptions:0];

  return v10;
}

- (id)_startConnectionWithAPIPath:(id)a3 bodyArguments:(id)a4 type:(int)a5 userInfo:(id)a6 context:(id)a7
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  if (!_startConnectionWithAPIPath_bodyArguments_type_userInfo_context__baseURL) {
    _startConnectionWithAPIPath_bodyArguments_type_userInfo_context__baseURL = [objc_alloc(NSURL) initWithString:@"https://www.instapaper.com"];
  }
  uint64_t v13 = objc_msgSend(NSURL, "URLWithString:relativeToURL:", a3);
  if (!v13) {
    return 0;
  }
  v14 = (void *)v13;
  unsigned int v52 = a5;
  id v53 = a6;
  id v54 = a7;
  v55 = self;
  v15 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v16 = [a4 countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v70 != v18) {
          objc_enumerationMutation(a4);
        }
        v20 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend(v20, "ik_URLEncodedString");
        v22 = (void *)[a4 objectForKey:v20];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          v22 = (void *)[v22 stringValue];
        }
        objc_msgSend(v15, "setObject:forKey:", objc_msgSend(v22, "ik_URLEncodedString"), v21);
      }
      uint64_t v17 = [a4 countByEnumeratingWithState:&v69 objects:v76 count:16];
    }
    while (v17);
  }
  v56 = (void *)[MEMORY[0x263F089D8] string];
  if ([v15 count])
  {
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v23 = [v15 countByEnumeratingWithState:&v65 objects:v75 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v66 != v25) {
            objc_enumerationMutation(v15);
          }
          [v56 appendFormat:@"%@=%@&", *(void *)(*((void *)&v65 + 1) + 8 * j), objc_msgSend(v15, "objectForKey:", *(void *)(*((void *)&v65 + 1) + 8 * j))];
        }
        uint64_t v24 = [v15 countByEnumeratingWithState:&v65 objects:v75 count:16];
      }
      while (v24);
    }
    objc_msgSend(v56, "replaceCharactersInRange:withString:", objc_msgSend(v56, "length") - 1, 1, &stru_26F008428);
  }
  v51 = v14;
  uint64_t v27 = objc_msgSend((id)objc_msgSend(v14, "absoluteString"), "ik_URLEncodedString");
  uint64_t v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "globallyUniqueString");
  v29 = NSString;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
  uint64_t v31 = objc_msgSend(v29, "stringWithFormat:", @"%d", (int)v30);
  v32 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  [v32 setObject:v28 forKey:@"oauth_nonce"];
  [v32 setObject:@"HMAC-SHA1" forKey:@"oauth_signature_method"];
  [v32 setObject:v31 forKey:@"oauth_timestamp"];
  [v32 setObject:_OAuthConsumerKey forKey:@"oauth_consumer_key"];
  [v32 setObject:@"1.0" forKey:@"oauth_version"];
  if ([(IKEngine *)v55 OAuthToken]) {
    objc_msgSend(v32, "setObject:forKey:", -[IKEngine OAuthToken](v55, "OAuthToken"), @"oauth_token");
  }
  v33 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:v15];
  [v33 addEntriesFromDictionary:v32];
  v34 = objc_msgSend((id)objc_msgSend(v33, "allKeys"), "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v35 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"%@&%@&", @"POST", v27];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v62 != v38) {
          objc_enumerationMutation(v34);
        }
        [v35 appendFormat:@"%@%%3D%@%%26", objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * k), "ik_URLEncodedString"), objc_msgSend((id)objc_msgSend(v33, "objectForKey:", *(void *)(*((void *)&v61 + 1) + 8 * k)), "ik_URLEncodedString")];
      }
      uint64_t v37 = [v34 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v37);
  }
  objc_msgSend(v35, "replaceCharactersInRange:withString:", objc_msgSend(v35, "length") - 3, 3, &stru_26F008428);
  OAuthTokenSecret = (__CFString *)v55->_OAuthTokenSecret;
  if (!OAuthTokenSecret) {
    OAuthTokenSecret = &stru_26F008428;
  }
  [v32 setObject:-[IKEngine _signatureWithKey:baseString:](v55, "_signatureWithKey:baseString:", objc_msgSend(NSString, "stringWithFormat:", @"%@&%@", _OAuthConsumerSecret, OAuthTokenSecret), v35), @"oauth_signature" forKey];
  v41 = (void *)[MEMORY[0x263EFC5E8] requestWithURL:v51];
  [v41 _setNonAppInitiated:1];
  [v41 setHTTPMethod:@"POST"];
  objc_msgSend(v41, "setHTTPBody:", objc_msgSend(v56, "dataUsingEncoding:", 4));
  v42 = (void *)[MEMORY[0x263F089D8] stringWithString:@"OAuth "];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v43 = [v32 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v58 != v45) {
          objc_enumerationMutation(v32);
        }
        [v42 appendFormat:@"%@=\"%@\", ", *(void *)(*((void *)&v57 + 1) + 8 * m), objc_msgSend(v32, "objectForKey:", *(void *)(*((void *)&v57 + 1) + 8 * m))];
      }
      uint64_t v44 = [v32 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v44);
  }
  objc_msgSend(v42, "replaceCharactersInRange:withString:", objc_msgSend(v42, "length") - 2, 2, &stru_26F008428);
  [v41 setValue:v42 forHTTPHeaderField:@"Authorization"];
  v47 = [[IKURLConnection alloc] initWithRequest:v41 delegate:v55 startImmediately:0];
  [(IKURLConnection *)v47 _setType:v52];
  [(IKURLConnection *)v47 _setUserInfo:v53];
  [(IKURLConnection *)v47 _setContext:v54];
  v48 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "globallyUniqueString");
  [(NSMutableDictionary *)v55->_connections setObject:v47 forKey:v48];

  [(IKEngine *)v55 delegate];
  if (objc_opt_respondsToSelector()) {
    [(IKEngineDelegate *)[(IKEngine *)v55 delegate] engine:v55 willStartConnection:v47];
  }
  uint64_t v49 = [MEMORY[0x263EFF9F0] currentRunLoop];
  [(NSURLConnection *)v47 scheduleInRunLoop:v49 forMode:*MEMORY[0x263EFF588]];
  [(NSURLConnection *)v47 start];
  return v48;
}

- (void)dealloc
{
  self->_delegate = 0;
  [(IKEngine *)self cancelAllConnections];

  v3.receiver = self;
  v3.super_class = (Class)IKEngine;
  [(IKEngine *)&v3 dealloc];
}

- (void)connectionDidFinishLoading:(id)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v5 = (id)objc_msgSend([NSString alloc], "initWithData:encoding:", objc_msgSend(a3, "data"), 4);
  uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1011 userInfo:0];
  int v7 = [a3 type];
  if (v7 == 11)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "response"), "statusCode") == 200)
    {
      [(IKEngine *)self delegate];
      if (objc_opt_respondsToSelector()) {
        -[IKEngineDelegate engine:connection:didReceiveText:ofBookmarkWithBookmarkID:](-[IKEngine delegate](self, "delegate"), "engine:connection:didReceiveText:ofBookmarkWithBookmarkID:", self, a3, v5, objc_msgSend((id)objc_msgSend(a3, "_context"), "integerValue"));
      }
      goto LABEL_11;
    }
    id v20 = +[IKDeserializer objectFromJSONString:v5];
    if (v20)
    {
      v12 = v20;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_24:
        uint64_t v18 = self;
        id v19 = a3;
        uint64_t v17 = (uint64_t)v12;
        goto LABEL_84;
      }
    }
LABEL_83:
    uint64_t v18 = self;
    id v19 = a3;
    uint64_t v17 = v6;
    goto LABEL_84;
  }
  int v8 = v7;
  if (v7)
  {
    id v11 = +[IKDeserializer objectFromJSONString:v5];
    if (v11)
    {
      v12 = v11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        switch(v8)
        {
          case 1:
            uint64_t v13 = [v12 lastObject];
            if (!v13) {
              goto LABEL_83;
            }
            uint64_t v14 = v13;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didVerifyCredentialsForUser:v14];
            }
            break;
          case 2:
            uint64_t v21 = (void *)[MEMORY[0x263EFF980] array];
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            uint64_t v22 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = 0;
              uint64_t v25 = *(void *)v69;
              do
              {
                for (uint64_t i = 0; i != v23; ++i)
                {
                  if (*(void *)v69 != v25) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v27 = *(void *)(*((void *)&v68 + 1) + 8 * i);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v24 = v27;
                  }
                  else
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      [v21 addObject:v27];
                    }
                  }
                }
                uint64_t v23 = [v12 countByEnumeratingWithState:&v68 objects:v76 count:16];
              }
              while (v23);
            }
            else
            {
              uint64_t v24 = 0;
            }
            uint64_t v59 = [a3 _context];
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didReceiveBookmarks:v21 ofUser:v24 forFolder:v59];
            }
            break;
          case 3:
            uint64_t v28 = [v12 lastObject];
            if (!v28) {
              goto LABEL_83;
            }
            uint64_t v29 = v28;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didUpdateReadProgressOfBookmark:v29];
            }
            break;
          case 4:
            uint64_t v30 = [v12 lastObject];
            if (!v30) {
              goto LABEL_83;
            }
            uint64_t v31 = v30;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didAddBookmark:v31];
            }
            break;
          case 5:
            uint64_t v32 = objc_msgSend((id)objc_msgSend(a3, "_context"), "integerValue");
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didDeleteBookmarkWithBookmarkID:v32];
            }
            break;
          case 6:
            uint64_t v33 = [v12 lastObject];
            if (!v33) {
              goto LABEL_83;
            }
            uint64_t v34 = v33;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didStarBookmark:v34];
            }
            break;
          case 7:
            uint64_t v35 = [v12 lastObject];
            if (!v35) {
              goto LABEL_83;
            }
            uint64_t v36 = v35;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didUnstarBookmark:v36];
            }
            break;
          case 8:
            uint64_t v37 = [v12 lastObject];
            if (!v37) {
              goto LABEL_83;
            }
            uint64_t v38 = v37;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didArchiveBookmark:v38];
            }
            break;
          case 9:
            uint64_t v39 = [v12 lastObject];
            if (!v39) {
              goto LABEL_83;
            }
            uint64_t v40 = v39;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didUnarchiveBookmark:v40];
            }
            break;
          case 10:
            uint64_t v41 = [v12 lastObject];
            uint64_t v42 = objc_msgSend((id)objc_msgSend(a3, "_context"), "integerValue");
            if (!v41) {
              goto LABEL_83;
            }
            uint64_t v43 = v42;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didMoveBookmark:v41 toFolderWithFolderID:v43];
            }
            break;
          case 12:
            uint64_t v44 = (void *)[MEMORY[0x263EFF980] array];
            long long v64 = 0u;
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            uint64_t v45 = [v12 countByEnumeratingWithState:&v64 objects:v75 count:16];
            if (v45)
            {
              uint64_t v46 = v45;
              uint64_t v47 = *(void *)v65;
              do
              {
                for (uint64_t j = 0; j != v46; ++j)
                {
                  if (*(void *)v65 != v47) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v49 = *(void *)(*((void *)&v64 + 1) + 8 * j);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v44 addObject:v49];
                  }
                }
                uint64_t v46 = [v12 countByEnumeratingWithState:&v64 objects:v75 count:16];
              }
              while (v46);
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didReceiveFolders:v44];
            }
            break;
          case 13:
            uint64_t v50 = [v12 lastObject];
            if (!v50) {
              goto LABEL_83;
            }
            uint64_t v51 = v50;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_83;
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didAddFolder:v51];
            }
            break;
          case 14:
            uint64_t v52 = objc_msgSend((id)objc_msgSend(a3, "_context"), "integerValue");
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didDeleteFolderWithFolderID:v52];
            }
            break;
          case 15:
            id v53 = (void *)[MEMORY[0x263EFF980] array];
            long long v60 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            uint64_t v54 = [v12 countByEnumeratingWithState:&v60 objects:v74 count:16];
            if (v54)
            {
              uint64_t v55 = v54;
              uint64_t v56 = *(void *)v61;
              do
              {
                for (uint64_t k = 0; k != v55; ++k)
                {
                  if (*(void *)v61 != v56) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v58 = *(void *)(*((void *)&v60 + 1) + 8 * k);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v53 addObject:v58];
                  }
                }
                uint64_t v55 = [v12 countByEnumeratingWithState:&v60 objects:v74 count:16];
              }
              while (v55);
            }
            [(IKEngine *)self delegate];
            if (objc_opt_respondsToSelector()) {
              [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self connection:a3 didOrderFolders:v53];
            }
            break;
          default:
            break;
        }
LABEL_11:
        [(IKEngine *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self didFinishConnection:a3];
        }
        [(NSMutableDictionary *)self->_connections removeObjectForKey:[(IKEngine *)self identifierForConnection:a3]];
        return;
      }
      goto LABEL_24;
    }
    goto LABEL_83;
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "response"), "statusCode");
  if (v9 == 200)
  {
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    if (!+[IKDeserializer token:&v73 andTokenSecret:&v72 fromQlineString:v5])
    {
      [(IKEngine *)self connection:a3 didFailWithError:v6];
      return;
    }
    [(IKEngine *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      v10 = [(IKEngine *)self delegate];
      [(IKEngineDelegate *)v10 engine:self connection:a3 didReceiveAuthToken:v73 andTokenSecret:v72];
    }
    [(IKEngine *)self setOAuthToken:v73];
    [(IKEngine *)self setOAuthTokenSecret:v72];
    goto LABEL_11;
  }
  uint64_t v15 = v9;
  uint64_t v16 = [NSDictionary dictionaryWithObject:v5 forKey:@"message"];
  uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"com.matthiasplappert.InstapaperKit" code:v15 userInfo:v16];
  uint64_t v18 = self;
  id v19 = a3;
LABEL_84:
  [(IKEngine *)v18 connection:v19 didFailWithError:v17];
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  [(IKEngine *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self didFailConnection:a3 error:a4];
  }
  id v7 = [(IKEngine *)self identifierForConnection:a3];
  connections = self->_connections;
  [(NSMutableDictionary *)connections removeObjectForKey:v7];
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
}

- (void)cancelAllConnections
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[objc_alloc(NSDictionary) initWithDictionary:self->_connections];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[IKEngine cancelConnection:](self, "cancelConnection:", [v3 objectForKey:*(void *)(*((void *)&v8 + 1) + 8 * v7++)]);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)cancelConnection:(id)a3
{
  id v5 = -[IKEngine identifierForConnection:](self, "identifierForConnection:");
  if (v5)
  {
    id v6 = v5;
    [a3 cancel];
    [(IKEngine *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(IKEngineDelegate *)[(IKEngine *)self delegate] engine:self didCancelConnection:a3];
    }
    connections = self->_connections;
    [(NSMutableDictionary *)connections removeObjectForKey:v6];
  }
}

- (id)orderFolders:(id)a3 userInfo:(id)a4
{
  id result = (id)[a3 count];
  if (result)
  {
    long long v8 = (void *)[MEMORY[0x263F089D8] string];
    if ([a3 count])
    {
      unint64_t v9 = 0;
      do
      {
        objc_msgSend(v8, "appendFormat:", @"%ld:%lu,", objc_msgSend((id)objc_msgSend(a3, "objectAtIndex:", v9), "folderID"), v9);
        ++v9;
      }
      while (v9 < [a3 count]);
    }
    objc_msgSend(v8, "replaceCharactersInRange:withString:", objc_msgSend(v8, "length") - 1, 1, &stru_26F008428);
    uint64_t v10 = [NSDictionary dictionaryWithObject:v8 forKey:@"order"];
    return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/folders/set_order" bodyArguments:v10 type:15 userInfo:a4 context:0];
  }
  return result;
}

- (id)deleteFolder:(id)a3 userInfo:(id)a4
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "folderID"));
  uint64_t v7 = [NSDictionary dictionaryWithObject:v6 forKey:@"folder_id"];
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/folders/delete" bodyArguments:v7 type:14 userInfo:a4 context:v6];
}

- (id)addFolderWithTitle:(id)a3 userInfo:(id)a4
{
  uint64_t v6 = [NSDictionary dictionaryWithObject:a3 forKey:@"title"];
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/folders/add" bodyArguments:v6 type:13 userInfo:a4 context:0];
}

- (id)foldersWithUserInfo:(id)a3
{
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/folders/list" bodyArguments:0 type:12 userInfo:a3 context:0];
}

- (id)textOfBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  uint64_t v7 = [NSDictionary dictionaryWithObject:v6 forKey:@"bookmark_id"];
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/get_text" bodyArguments:v7 type:11 userInfo:a4 context:v6];
}

- (id)moveBookmark:(id)a3 toFolder:(id)a4 userInfo:(id)a5
{
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a4, "folderID"));
  uint64_t v10 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v8, @"bookmark_id", v9, @"folder_id", 0);
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/move" bodyArguments:v10 type:10 userInfo:a5 context:v9];
}

- (id)unarchiveBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  uint64_t v7 = [NSDictionary dictionaryWithObject:v6 forKey:@"bookmark_id"];
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/unarchive" bodyArguments:v7 type:9 userInfo:a4 context:0];
}

- (id)archiveBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  uint64_t v7 = [NSDictionary dictionaryWithObject:v6 forKey:@"bookmark_id"];
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/archive" bodyArguments:v7 type:8 userInfo:a4 context:0];
}

- (id)unstarBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  uint64_t v7 = [NSDictionary dictionaryWithObject:v6 forKey:@"bookmark_id"];
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/unstar" bodyArguments:v7 type:7 userInfo:a4 context:0];
}

- (id)starBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  uint64_t v7 = [NSDictionary dictionaryWithObject:v6 forKey:@"bookmark_id"];
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/star" bodyArguments:v7 type:6 userInfo:a4 context:0];
}

- (id)deleteBookmark:(id)a3 userInfo:(id)a4
{
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  uint64_t v7 = [NSDictionary dictionaryWithObject:v6 forKey:@"bookmark_id"];
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/delete" bodyArguments:v7 type:5 userInfo:a4 context:v6];
}

- (id)addBookmarkWithURL:(id)a3 title:(id)a4 description:(id)a5 folder:(id)a6 resolveFinalURL:(BOOL)a7 userInfo:(id)a8
{
  BOOL v9 = a7;
  uint64_t v15 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  objc_msgSend(v15, "setObject:forKey:", objc_msgSend(a3, "absoluteString"), @"url");
  if (a4) {
    [v15 setObject:a4 forKey:@"title"];
  }
  if (a5) {
    [v15 setObject:a5 forKey:@"description"];
  }
  if (a6) {
    objc_msgSend(v15, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a6, "folderID")), @"folder_id");
  }
  objc_msgSend(v15, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v9), @"resolve_final_url");
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/add" bodyArguments:v15 type:4 userInfo:a8 context:0];
}

- (id)addBookmarkWithURL:(id)a3 userInfo:(id)a4
{
  return [(IKEngine *)self addBookmarkWithURL:a3 title:0 description:0 folder:0 resolveFinalURL:1 userInfo:a4];
}

- (id)updateReadProgressOfBookmark:(id)a3 toProgress:(double)a4 userInfo:(id)a5
{
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a3, "bookmarkID"));
  *(float *)&double v9 = a4;
  uint64_t v10 = [NSNumber numberWithFloat:v9];
  long long v11 = NSNumber;
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFF910], "date"), "timeIntervalSince1970");
  uint64_t v13 = [v11 numberWithInteger:(uint64_t)v12];
  uint64_t v14 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v8, @"bookmark_id", v10, @"progress", v13, @"progress_timestamp", 0);
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/bookmarks/update_read_progress" bodyArguments:v14 type:3 userInfo:a5 context:0];
}

- (id)bookmarksInFolder:(id)a3 limit:(unint64_t)a4 existingBookmarks:(id)a5 userInfo:(id)a6
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:a4];
  unint64_t v11 = [a3 folderID];
  if (v11 <= 0xFFFFFFFFFFFFFFFCLL) {
    double v12 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%ld", objc_msgSend(a3, "folderID"));
  }
  else {
    double v12 = off_264E56E70[v11 + 3];
  }
  uint64_t v13 = (void *)[MEMORY[0x263F089D8] string];
  if ([a5 count])
  {
    uint64_t v24 = v12;
    uint64_t v25 = v10;
    v26 = self;
    id v27 = a6;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = [a5 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(a5);
          }
          uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_msgSend(v13, "appendFormat:", @"%ld", objc_msgSend(v18, "bookmarkID"));
          if ([v18 hashString]) {
            [v13 appendFormat:@":%@", objc_msgSend(v18, "hashString")];
          }
          if ([v18 progressDate])
          {
            [v18 progress];
            if (v19 != -1.0)
            {
              objc_msgSend((id)objc_msgSend(v18, "progressDate"), "timeIntervalSince1970");
              uint64_t v21 = (int)v20;
              [v18 progress];
              objc_msgSend(v13, "appendFormat:", @":%f:%d", v22, v21);
            }
          }
          [v13 appendFormat:@","];
        }
        uint64_t v15 = [a5 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }
    objc_msgSend(v13, "replaceCharactersInRange:withString:", objc_msgSend(v13, "length") - 1, 1, &stru_26F008428);
    a6 = v27;
    uint64_t v10 = v25;
    self = v26;
    double v12 = v24;
  }
  return -[IKEngine _startConnectionWithAPIPath:bodyArguments:type:userInfo:context:](self, "_startConnectionWithAPIPath:bodyArguments:type:userInfo:context:", @"/api/1/bookmarks/list", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v10, @"limit", v12, @"folder_id", v13, @"have", 0), 2, a6, a3);
}

- (id)bookmarksWithUserInfo:(id)a3
{
  id v5 = +[IKFolder unreadFolder];
  return [(IKEngine *)self bookmarksInFolder:v5 limit:25 existingBookmarks:0 userInfo:a3];
}

- (id)verifyCredentialsWithUserInfo:(id)a3
{
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/account/verify_credentials" bodyArguments:0 type:1 userInfo:a3 context:0];
}

- (id)authTokenForUsername:(id)a3 password:(id)a4 userInfo:(id)a5
{
  uint64_t v7 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, @"x_auth_username", a4, @"x_auth_password", @"client_auth", @"x_auth_mode", 0);
  return [(IKEngine *)self _startConnectionWithAPIPath:@"/api/1/oauth/access_token" bodyArguments:v7 type:0 userInfo:a5 context:0];
}

- (unint64_t)numberOfConnections
{
  return [(NSMutableDictionary *)self->_connections count];
}

- (id)identifierForConnection:(id)a3
{
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_connections allKeysForObject:a3];
  return (id)[v3 lastObject];
}

- (id)connectionForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_connections objectForKey:a3];
}

- (IKEngine)init
{
  return [(IKEngine *)self initWithDelegate:0];
}

- (IKEngine)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)IKEngine;
  uint64_t v4 = [(IKEngine *)&v7 init];
  id v5 = v4;
  if (v4)
  {
    v4->_OAuthToken = 0;
    v4->_OAuthTokenSecret = 0;
    v4->_delegate = (IKEngineDelegate *)a3;
    v4->_connections = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v5;
}

+ (void)setOAuthConsumerKey:(id)a3 andConsumerSecret:(id)a4
{
  _OAuthConsumerKey = [a3 copy];
  _OAuthConsumerSecret = [a4 copy];
}

@end
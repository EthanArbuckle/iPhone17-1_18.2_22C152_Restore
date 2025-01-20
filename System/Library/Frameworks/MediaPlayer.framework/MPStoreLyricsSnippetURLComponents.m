@interface MPStoreLyricsSnippetURLComponents
- (MPStoreLyricsSnippetURLComponents)initWithSong:(id)a3 language:(id)a4 startTime:(double)a5 endTime:(double)a6;
- (MPStoreLyricsSnippetURLComponents)initWithURL:(id)a3;
- (NSString)countryCode;
- (NSString)language;
- (NSString)signature;
- (double)endTime;
- (double)startTime;
- (id)signatureWithCountryCode:(id)a3 adamID:(id)a4 startTime:(id)a5 endTime:(id)a6 language:(id)a7;
- (int64_t)songAdamID;
- (void)URLWithAdditionalParameters:(id)a3 completion:(id)a4;
@end

@implementation MPStoreLyricsSnippetURLComponents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_language, 0);
}

- (NSString)signature
{
  return self->_signature;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)language
{
  return self->_language;
}

- (int64_t)songAdamID
{
  return self->_songAdamID;
}

- (double)endTime
{
  return self->_endTime;
}

- (double)startTime
{
  return self->_startTime;
}

- (id)signatureWithCountryCode:(id)a3 adamID:(id)a4 startTime:(id)a5 endTime:(id)a6 language:(id)a7
{
  v7 = [NSString stringWithFormat:@"lyrics%@%@%@%@%@", a3, a4, a5, a6, a7];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:20];
  id v9 = v7;
  v10 = (const void *)[v9 UTF8String];
  CC_LONG v11 = [v9 length];
  id v12 = v8;
  CC_SHA1(v10, v11, (unsigned __int8 *)[v12 mutableBytes]);
  [v12 setLength:16];
  id v13 = v12;
  fd3fa4R8(3, [v13 mutableBytes]);
  v14 = [v13 base64EncodedStringWithOptions:0];

  return v14;
}

- (void)URLWithAdditionalParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4FB8758]);
  id v9 = [MEMORY[0x1E4FB87B8] activeAccount];
  v10 = (void *)[v8 initWithIdentity:v9];

  CC_LONG v11 = [MEMORY[0x1E4FB8788] sharedBagProvider];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __76__MPStoreLyricsSnippetURLComponents_URLWithAdditionalParameters_completion___block_invoke;
  v14[3] = &unk_1E57F8258;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  id v12 = v6;
  id v13 = v7;
  [v11 getBagForRequestContext:v10 withCompletionHandler:v14];
}

void __76__MPStoreLyricsSnippetURLComponents_URLWithAdditionalParameters_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v70[0] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = [v5 stringForBagKey:*MEMORY[0x1E4FB8530]];
    if (v7)
    {
      id v8 = [v6 dictionaryForBagKey:*MEMORY[0x1E4FB8560]];
      v58 = v8;
      v59 = v6;
      if (v8)
      {
        uint64_t v9 = objc_msgSend(v8, "ic_stringValueForKey:", @"lyricsSnippetShareSignaturePrefix");
        v10 = (void *)v9;
        CC_LONG v11 = @"2.v1.";
        if (v9) {
          CC_LONG v11 = (__CFString *)v9;
        }
        v63 = v11;
      }
      else
      {
        v63 = &stru_1EE680640;
      }
      id v12 = objc_opt_new();
      [v12 setScheme:@"https"];
      [v12 setHost:@"music.apple.com"];
      v64 = v7;
      id v13 = [NSString stringWithFormat:@"/%@/lyrics/%lld", v7, objc_msgSend(*(id *)(a1 + 32), "songAdamID")];
      v57 = v12;
      [v12 setPath:v13];

      v14 = (void *)MEMORY[0x1E4F290C8];
      id v15 = NSString;
      [*(id *)(a1 + 32) startTime];
      v17 = objc_msgSend(v15, "stringWithFormat:", @"%.03f", v16);
      v62 = [v14 queryItemWithName:@"ts" value:v17];

      v18 = (void *)MEMORY[0x1E4F290C8];
      v19 = NSString;
      [*(id *)(a1 + 32) endTime];
      v21 = objc_msgSend(v19, "stringWithFormat:", @"%.03f", v20);
      v61 = [v18 queryItemWithName:@"te" value:v21];

      v22 = (void *)MEMORY[0x1E4F290C8];
      v23 = [*(id *)(a1 + 32) language];
      v60 = [v22 queryItemWithName:@"l" value:v23];

      v24 = *(void **)(a1 + 32);
      uint64_t quot = [v24 songAdamID];
      uint64_t v26 = quot;
      v27 = (char *)v70 + 1;
      do
      {
        lldiv_t v28 = lldiv(quot, 10);
        uint64_t quot = v28.quot;
        if (v28.rem >= 0) {
          LOBYTE(v29) = v28.rem;
        }
        else {
          uint64_t v29 = -v28.rem;
        }
        *(v27 - 2) = v29 + 48;
        v30 = (const UInt8 *)(v27 - 2);
        --v27;
      }
      while (v28.quot);
      if (v26 < 0)
      {
        *(v27 - 2) = 45;
        v30 = (const UInt8 *)(v27 - 2);
      }
      v31 = (__CFString *)CFStringCreateWithBytes(0, v30, (char *)v70 - (char *)v30, 0x8000100u, 0);
      v32 = [v62 value];
      v33 = [v61 value];
      v34 = [*(id *)(a1 + 32) language];
      v35 = [v24 signatureWithCountryCode:v64 adamID:v31 startTime:v32 endTime:v33 language:v34];

      v36 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
      v37 = (void *)[v36 mutableCopy];

      [v37 removeCharactersInString:@":/?#[]@!$&'()*+,;="];
      v56 = v37;
      uint64_t v38 = [v35 stringByAddingPercentEncodingWithAllowedCharacters:v37];

      v39 = (void *)MEMORY[0x1E4F290C8];
      v55 = (void *)v38;
      v40 = [NSString stringWithFormat:@"%@%@", v63, v38];
      uint64_t v41 = [v39 queryItemWithName:@"tk" value:v40];

      v42 = objc_opt_new();
      [v42 addObject:v62];
      [v42 addObject:v61];
      [v42 addObject:v60];
      v54 = (void *)v41;
      [v42 addObject:v41];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      v43 = [*(id *)(a1 + 40) keyEnumerator];
      uint64_t v44 = [v43 countByEnumeratingWithState:&v65 objects:v69 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v45; ++i)
          {
            if (*(void *)v66 != v46) {
              objc_enumerationMutation(v43);
            }
            uint64_t v48 = *(void *)(*((void *)&v65 + 1) + 8 * i);
            v49 = (void *)MEMORY[0x1E4F290C8];
            v50 = [*(id *)(a1 + 40) objectForKeyedSubscript:v48];
            v51 = [v49 queryItemWithName:v48 value:v50];

            [v42 addObject:v51];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v65 objects:v69 count:16];
        }
        while (v45);
      }

      [v57 setPercentEncodedQueryItems:v42];
      uint64_t v52 = *(void *)(a1 + 48);
      v53 = [v57 URL];
      (*(void (**)(uint64_t, void *))(v52 + 16))(v52, v53);

      id v6 = v59;
      id v7 = v64;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

- (MPStoreLyricsSnippetURLComponents)initWithSong:(id)a3 language:(id)a4 startTime:(double)a5 endTime:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MPStoreLyricsSnippetURLComponents;
  id v12 = [(MPStoreLyricsSnippetURLComponents *)&v18 init];
  id v13 = v12;
  if (!v12) {
    goto LABEL_3;
  }
  objc_storeStrong((id *)&v12->_language, a4);
  v13->_startTime = a5;
  v13->_endTime = a6;
  v14 = [v10 identifiers];
  id v15 = [v14 preferredStoreStringIdentifierForPersonID:0];
  v13->_songAdamID = [v15 integerValue];

  if (!v13->_songAdamID) {
    uint64_t v16 = 0;
  }
  else {
LABEL_3:
  }
    uint64_t v16 = v13;

  return v16;
}

- (MPStoreLyricsSnippetURLComponents)initWithURL:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)MPStoreLyricsSnippetURLComponents;
  id v5 = [(MPStoreLyricsSnippetURLComponents *)&v63 init];
  if (!v5)
  {
LABEL_37:
    v47 = v5;
    goto LABEL_38;
  }
  id v6 = [v4 absoluteString];
  id v7 = [NSString stringWithFormat:@"https?://%@/(?<countryCode>\\w{2})/lyrics/(?<adamID>[0-9]+)", @"music.apple.com"];
  int v8 = 1;
  uint64_t v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v7 options:1 error:0];
  id v10 = objc_msgSend(v9, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  id v11 = v10;
  if (!v10) {
    goto LABEL_35;
  }
  uint64_t v12 = [v10 rangeWithName:@"adamID"];
  uint64_t v14 = v13;
  uint64_t v15 = [v11 rangeWithName:@"countryCode"];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL || v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = 1;
    goto LABEL_35;
  }
  uint64_t v18 = v15;
  uint64_t v19 = v16;
  uint64_t v52 = v11;
  v53 = v9;
  v54 = v7;
  v56 = v5;
  v51 = objc_msgSend(v6, "substringWithRange:", v12, v14);
  v55 = v6;
  v50 = objc_msgSend(v6, "substringWithRange:", v18, v19);
  [MEMORY[0x1E4F29088] componentsWithURL:v4 resolvingAgainstBaseURL:0];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  v49 = long long v62 = 0u;
  uint64_t v20 = [v49 queryItems];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (!v21)
  {
    v23 = 0;
    v24 = 0;
    id obj = 0;
    v58 = 0;
    goto LABEL_27;
  }
  uint64_t v22 = v21;
  v23 = 0;
  v24 = 0;
  id obj = 0;
  v58 = 0;
  uint64_t v25 = *(void *)v60;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v60 != v25) {
        objc_enumerationMutation(v20);
      }
      v27 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      lldiv_t v28 = [v27 name];
      int v29 = [v28 isEqualToString:@"ts"];

      if (v29)
      {
        uint64_t v30 = [v27 value];
        v31 = v23;
        v23 = (void *)v30;
      }
      else
      {
        v32 = [v27 name];
        int v33 = [v32 isEqualToString:@"te"];

        if (v33)
        {
          uint64_t v34 = [v27 value];
          v31 = v24;
          v24 = (void *)v34;
        }
        else
        {
          v35 = [v27 name];
          int v36 = [v35 isEqualToString:@"l"];

          if (v36)
          {
            uint64_t v37 = [v27 value];
            v31 = v58;
            v58 = (void *)v37;
          }
          else
          {
            uint64_t v38 = [v27 name];
            int v39 = [v38 isEqualToString:@"tk"];

            if (!v39) {
              continue;
            }
            uint64_t v40 = [v27 value];
            v31 = obj;
            id obj = (id)v40;
          }
        }
      }
    }
    uint64_t v22 = [v20 countByEnumeratingWithState:&v59 objects:v64 count:16];
  }
  while (v22);
LABEL_27:

  int v8 = 1;
  id v7 = v54;
  if (!v23)
  {
    id v5 = v56;
    v42 = v50;
    uint64_t v41 = v51;
    v43 = v58;
    goto LABEL_33;
  }
  id v5 = v56;
  v42 = v50;
  uint64_t v41 = v51;
  v43 = v58;
  if (!v24)
  {
LABEL_33:
    uint64_t v44 = obj;
    goto LABEL_34;
  }
  uint64_t v44 = obj;
  if (v58 && obj)
  {
    [v23 doubleValue];
    v56->_startTime = v45;
    [v24 doubleValue];
    v56->_endTime = v46;
    v56->_songAdamID = [v51 integerValue];
    objc_storeStrong((id *)&v56->_language, v58);
    objc_storeStrong((id *)&v56->_signature, obj);
    objc_storeStrong((id *)&v56->_countryCode, v50);
    uint64_t v44 = obj;
    int v8 = 0;
  }
LABEL_34:

  id v6 = v55;
  id v11 = v52;
  uint64_t v9 = v53;
LABEL_35:

  if (!v8) {
    goto LABEL_37;
  }
  v47 = 0;
LABEL_38:

  return v47;
}

@end
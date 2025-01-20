@interface EMMailToURLComponents
+ (id)componentsWithURL:(id)a3;
- (EMMailToURLComponents)init;
- (EMMailToURLComponents)initWithURL:(id)a3;
- (NSArray)bccRecipients;
- (NSArray)ccRecipients;
- (NSArray)toRecipients;
- (NSString)body;
- (NSString)from;
- (NSString)subject;
- (void)_decomposeURL:(id)a3;
@end

@implementation EMMailToURLComponents

+ (id)componentsWithURL:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return v5;
}

- (EMMailToURLComponents)init
{
  return [(EMMailToURLComponents *)self initWithURL:0];
}

- (EMMailToURLComponents)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMMailToURLComponents;
  v5 = [(EMMailToURLComponents *)&v8 init];
  v6 = v5;
  if (v5) {
    [(EMMailToURLComponents *)v5 _decomposeURL:v4];
  }

  return v6;
}

- (void)_decomposeURL:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3) {
    goto LABEL_48;
  }
  id v50 = v3;
  v55 = [v3 absoluteString];
  uint64_t v5 = [v55 rangeOfString:@"mailto:" options:9];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_47;
  }
  uint64_t v6 = v4;
  context = (void *)MEMORY[0x1C18A1EF0]();
  v56 = [MEMORY[0x1E4F1CA48] array];
  v53 = [MEMORY[0x1E4F1CA48] array];
  v54 = [MEMORY[0x1E4F1CA48] array];
  v51 = [v55 substringFromIndex:v5 + v6];
  uint64_t v7 = [v51 rangeOfString:@"?"];
  uint64_t v9 = v7;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v45 = 0;
    v10 = v51;
  }
  else
  {
    v11 = [v51 substringFromIndex:v7 + v8];
    uint64_t v12 = [v51 substringToIndex:v9];

    v45 = [v11 componentsSeparatedByString:@"&"];

    v10 = (void *)v12;
  }
  v13 = (void *)MEMORY[0x1E4F605A8];
  v52 = v10;
  v14 = [v10 stringByRemovingPercentEncoding];
  v15 = [v13 addressListFromHeaderValue:v14];

  v49 = v15;
  if ([v15 count]) {
    [v56 addObjectsFromArray:v15];
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v45;
  uint64_t v16 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (!v16)
  {
    v59 = 0;
    v60 = 0;
    v58 = 0;
    goto LABEL_40;
  }
  v59 = 0;
  v60 = 0;
  v58 = 0;
  uint64_t v17 = *(void *)v63;
  uint64_t v48 = *MEMORY[0x1E4F60740];
  uint64_t v46 = *MEMORY[0x1E4F60650];
  uint64_t v47 = *MEMORY[0x1E4F60660];
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v63 != v17) {
        objc_enumerationMutation(obj);
      }
      v19 = *(void **)(*((void *)&v62 + 1) + 8 * v18);
      uint64_t v21 = [v19 rangeOfString:@"="];
      if (v21 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v22 = v20;
        v23 = [v19 substringToIndex:v21];
        v24 = [v23 lowercaseString];

        v25 = [v19 substringFromIndex:v21 + v22];
        if ([v24 length] && objc_msgSend(v25, "length"))
        {
          v26 = objc_msgSend(v25, "ef_stringByReplacingPercentEscapesUsingEncoding:", 4);

          if ([v24 isEqualToString:@"body"])
          {
            objc_msgSend(v26, "ef_stringByEscapingForMessageBody");
            v27 = v60;
            v60 = (NSString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }
          if ([v24 isEqualToString:@"subject"])
          {
            v27 = v59;
            v59 = v26;
            goto LABEL_23;
          }
          v28 = objc_msgSend(MEMORY[0x1E4F1CB10], "em_mailToFromQueryItemKey");
          int v29 = objc_msgSend(v24, "ef_caseInsensitiveIsEqualToString:", v28);

          if (v29)
          {
            v27 = v58;
            v58 = v26;
            goto LABEL_23;
          }
          if (([v24 isEqualToString:@"attachment"] & 1) == 0
            && ([v24 isEqualToString:@"attachdircontent"] & 1) == 0)
          {
            v30 = [MEMORY[0x1E4F605A8] addressListFromHeaderValue:v26];
            v27 = v30;
            if (v30 && [(NSString *)v30 count])
            {
              if ([v24 isEqualToString:v48]) {
                [v56 addObjectsFromArray:v27];
              }
              if ([v24 isEqualToString:v47]) {
                [v53 addObjectsFromArray:v27];
              }
              if ([v24 isEqualToString:v46]) {
                [v54 addObjectsFromArray:v27];
              }
            }
LABEL_23:
          }
        }
        else
        {
          v26 = v25;
        }
      }
      ++v18;
    }
    while (v16 != v18);
    uint64_t v31 = [obj countByEnumeratingWithState:&v62 objects:v66 count:16];
    uint64_t v16 = v31;
  }
  while (v31);
LABEL_40:

  if ([v56 count])
  {
    v32 = (NSArray *)[v56 copy];
    toRecipients = self->_toRecipients;
    self->_toRecipients = v32;
  }
  if ([v53 count])
  {
    v34 = (NSArray *)[v53 copy];
    ccRecipients = self->_ccRecipients;
    self->_ccRecipients = v34;
  }
  if ([v54 count])
  {
    v36 = (NSArray *)[v54 copy];
    bccRecipients = self->_bccRecipients;
    self->_bccRecipients = v36;
  }
  subject = self->_subject;
  self->_subject = v59;
  v39 = v59;

  body = self->_body;
  self->_body = v60;
  v41 = v60;

  from = self->_from;
  self->_from = v58;
  v43 = v58;

LABEL_47:

  id v3 = v50;
LABEL_48:
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (NSString)subject
{
  return self->_subject;
}

- (NSString)body
{
  return self->_body;
}

- (NSString)from
{
  return self->_from;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
}

@end
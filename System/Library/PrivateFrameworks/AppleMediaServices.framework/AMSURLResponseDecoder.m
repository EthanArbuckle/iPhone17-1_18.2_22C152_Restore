@interface AMSURLResponseDecoder
- (AMSURLResponseDecoder)init;
- (NSIndexSet)allowedStatusCodes;
- (NSSet)allowedContentTypes;
- (id)resultFromResult:(id)a3 error:(id *)a4;
- (void)setAllowedContentTypes:(id)a3;
- (void)setAllowedStatusCodes:(id)a3;
@end

@implementation AMSURLResponseDecoder

- (AMSURLResponseDecoder)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSURLResponseDecoder;
  v2 = [(AMSURLResponseDecoder *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 200, 100);
    allowedStatusCodes = v2->_allowedStatusCodes;
    v2->_allowedStatusCodes = (NSIndexSet *)v3;

    allowedContentTypes = v2->_allowedContentTypes;
    v2->_allowedContentTypes = 0;
  }
  return v2;
}

- (id)resultFromResult:(id)a3 error:(id *)a4
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_super v7 = [v6 response];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_14;
  }
  v9 = [v6 response];
  id v10 = [(AMSURLResponseDecoder *)self allowedStatusCodes];
  if (v10)
  {
    v11 = [(AMSURLResponseDecoder *)self allowedStatusCodes];
    char v12 = objc_msgSend(v11, "containsIndex:", objc_msgSend(v9, "statusCode"));

    if (v12)
    {
      id v10 = 0;
    }
    else
    {
      v33[0] = @"AMSStatusCode";
      v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v9, "statusCode"));
      v34[0] = v13;
      v33[1] = @"AMSURL";
      v14 = [v6 response];
      v15 = [v14 URL];
      v16 = AMSHashIfNeeded(v15);
      v34[1] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

      AMSCustomError(@"AMSErrorDomain", 301, @"Invalid Status Code", @"The response has an invalid status code", v17, 0);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v9, "ams_valueForHTTPHeaderField:", @"Content-Type");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [(AMSURLResponseDecoder *)self allowedContentTypes];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(AMSURLResponseDecoder *)self allowedContentTypes];
    char v22 = [v21 containsObject:v18];

    if ((v22 & 1) == 0)
    {
      v23 = &stru_1EDCA7308;
      if (v18) {
        v23 = v18;
      }
      v32[0] = v23;
      v31[0] = @"AMSContentType";
      v31[1] = @"AMSURL";
      v24 = [v6 response];
      v25 = [v24 URL];
      v26 = AMSHashIfNeeded(v25);
      v32[1] = v26;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

      uint64_t v28 = AMSCustomError(@"AMSErrorDomain", 301, @"Invalid Content Type", @"The response has an invalid content type", v27, 0);

      id v10 = (id)v28;
    }
  }

  if (v10)
  {
    if (a4)
    {
      id v10 = v10;
      id v29 = 0;
      *a4 = v10;
    }
    else
    {
      id v29 = 0;
    }
  }
  else
  {
LABEL_14:
    id v29 = v6;
    id v10 = 0;
  }

  return v29;
}

- (NSIndexSet)allowedStatusCodes
{
  return self->_allowedStatusCodes;
}

- (NSSet)allowedContentTypes
{
  return self->_allowedContentTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedContentTypes, 0);
  objc_storeStrong((id *)&self->_allowedStatusCodes, 0);
}

- (void)setAllowedStatusCodes:(id)a3
{
}

- (void)setAllowedContentTypes:(id)a3
{
}

@end
@interface APWebViewResourceLoadCAReporter
+ (BOOL)_isHTTPOrHTTPSURL:(id)a3;
+ (void)_parseResourceLoadResultForError:(id)a3 response:(id)a4 result:(int64_t *)a5 errorDomain:(id *)a6 errorCode:(int64_t *)a7;
@end

@implementation APWebViewResourceLoadCAReporter

+ (BOOL)_isHTTPOrHTTPSURL:(id)a3
{
  v3 = [a3 scheme];
  v4 = v3;
  if (v3)
  {
    if ([v3 caseInsensitiveCompare:@"http"]) {
      BOOL v5 = [v4 caseInsensitiveCompare:@"https"] == 0;
    }
    else {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (void)_parseResourceLoadResultForError:(id)a3 response:(id)a4 result:(int64_t *)a5 errorDomain:(id *)a6 errorCode:(int64_t *)a7
{
  id v19 = a3;
  id v11 = a4;
  *a5 = 0;
  *a6 = 0;
  *a7 = -1;
  if (v19)
  {
    v12 = [v19 domain];

    if (v12)
    {
      v13 = [v19 domain];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        v15 = [v19 domain];
        *a6 = (id)[v15 copy];

LABEL_12:
        *a7 = [v19 code];
LABEL_13:
        int64_t v18 = 2;
LABEL_14:
        *a5 = v18;
        goto LABEL_15;
      }
      v17 = @"AdEmptyDomainErrors";
    }
    else
    {
      v17 = @"AdNilDomainErrors";
    }
    *a6 = v17;
    goto LABEL_12;
  }
  if (!v11)
  {
    *a6 = @"AdWebViewErrors";
    *a7 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *a6 = @"AdWebViewErrors";
    *a7 = 0;
    goto LABEL_20;
  }
  int64_t v16 = [v11 statusCode];
  if ((unint64_t)(v16 - 600) <= 0xFFFFFFFFFFFFFE0BLL)
  {
    *a6 = @"AdWebViewErrors";
    *a7 = 2;
LABEL_20:
    int64_t v18 = 3;
    goto LABEL_14;
  }
  if ((unint64_t)(v16 - 200) <= 0x63)
  {
    int64_t v18 = 1;
    goto LABEL_14;
  }
  *a5 = 3;
  *a7 = v16;
  *a6 = @"AdHTTPErrors";
LABEL_15:
}

@end
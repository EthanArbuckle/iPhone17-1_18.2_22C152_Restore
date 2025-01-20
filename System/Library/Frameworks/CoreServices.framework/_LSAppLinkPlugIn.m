@interface _LSAppLinkPlugIn
+ (BOOL)canHandleURLComponents:(id)a3;
+ (id)plugInClasses;
- (NSURLComponents)URLComponents;
- (_LSAppLinkOpenState)state;
- (id)appLinksWithContext:(LSContext *)a3 error:(id *)a4;
- (unint64_t)limit;
- (void)setLimit:(unint64_t)a3;
- (void)setState:(id)a3;
- (void)setURLComponents:(id)a3;
@end

@implementation _LSAppLinkPlugIn

+ (id)plugInClasses
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)canHandleURLComponents:(id)a3
{
  id v4 = a3;
  if (v4 && (id)objc_opt_class() != a1)
  {
    v5 = [v4 scheme];
    v6 = [v4 host];
    if (v5)
    {
      BOOL v7 = 0;
      if (![v5 length] || !v6) {
        goto LABEL_17;
      }
      if ([v6 length])
      {
        uint64_t v8 = [v5 caseInsensitiveCompare:@"http"];
        BOOL v9 = v8 == 0;
        if (v8)
        {
          uint64_t v10 = [v5 caseInsensitiveCompare:@"https"];
          BOOL v11 = v10 == 0;
          BOOL v7 = v10 == 0;
        }
        else
        {
          BOOL v7 = 0;
          BOOL v11 = 1;
        }
        if (([v6 containsString:@"."] & v11) == 1)
        {
          v12 = [v4 port];
          v13 = v12;
          if (v12)
          {
            uint64_t v14 = [v12 unsignedIntegerValue];
            if (v14 == 80)
            {
              BOOL v7 = v9;
            }
            else if (v14 != 443)
            {
              BOOL v7 = 0;
            }
          }
          else
          {
            BOOL v7 = 1;
          }

          goto LABEL_17;
        }
      }
    }
    BOOL v7 = 0;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v7 = 0;
LABEL_18:

  return v7;
}

- (id)appLinksWithContext:(LSContext *)a3 error:(id *)a4
{
  if (a4)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E4F28760], -4, (uint64_t)"-[_LSAppLinkPlugIn appLinksWithContext:error:]", 134, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (NSURLComponents)URLComponents
{
  return (NSURLComponents *)objc_getProperty(self, a2, 8, 1);
}

- (void)setURLComponents:(id)a3
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (_LSAppLinkOpenState)state
{
  return (_LSAppLinkOpenState *)objc_getProperty(self, a2, 24, 1);
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);

  objc_storeStrong((id *)&self->_URLComponents, 0);
}

@end
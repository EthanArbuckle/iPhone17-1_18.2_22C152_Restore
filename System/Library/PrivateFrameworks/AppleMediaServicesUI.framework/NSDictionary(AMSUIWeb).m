@interface NSDictionary(AMSUIWeb)
- (id)ams_JSONStringWithError:()AMSUIWeb;
@end

@implementation NSDictionary(AMSUIWeb)

- (id)ams_JSONStringWithError:()AMSUIWeb
{
  if ([MEMORY[0x263F08900] isValidJSONObject:a1])
  {
    id v11 = 0;
    v5 = [MEMORY[0x263F08900] dataWithJSONObject:a1 options:0 error:&v11];
    id v6 = v11;
    if (v5)
    {
      uint64_t v7 = [[NSString alloc] initWithData:v5 encoding:4];
      if (v7)
      {
        v8 = (void *)v7;
        if (!v6) {
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      uint64_t v9 = AMSError();

      id v6 = (id)v9;
    }
    if (v6)
    {
      v8 = 0;
    }
    else
    {
      AMSError();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      if (!v6)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
LABEL_13:
    if (a3) {
      *a3 = v6;
    }

    v8 = 0;
    goto LABEL_16;
  }
  if (a3)
  {
    AMSError();
    v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_17:
  return v8;
}

@end
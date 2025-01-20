@interface NSURL
+ (id)bcs_templatedImageURLWithString:(void *)a3 imageSpecifier:;
- (id)URLByDeletingFragment;
@end

@implementation NSURL

+ (id)bcs_templatedImageURLWithString:(void *)a3 imageSpecifier:
{
  v20[4] = *MEMORY[0x263EF8340];
  id v4 = a2;
  self;
  if (v4)
  {
    v19[0] = @"{w}";
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", *a3);
    v20[0] = v5;
    v19[1] = @"{h}";
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3[1]);
    v20[1] = v6;
    v19[2] = @"{f}";
    v7 = [NSString stringWithUTF8String:a3[3]];
    v20[2] = v7;
    v19[3] = @"{c}";
    v8 = [NSString stringWithUTF8String:a3[2]];
    v20[3] = v8;
    v9 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__6;
    v17 = __Block_byref_object_dispose__6;
    id v18 = (id)[v4 copy];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __77__NSURL_BusinessChatService__bcs_templatedImageURLWithString_imageSpecifier___block_invoke;
    v12[3] = &unk_26424A268;
    v12[4] = &v13;
    [v9 enumerateKeysAndObjectsUsingBlock:v12];
    v10 = [NSURL URLWithString:v14[5]];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __77__NSURL_BusinessChatService__bcs_templatedImageURLWithString_imageSpecifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) stringByReplacingOccurrencesOfString:a2 withString:a3];

  return MEMORY[0x270F9A758]();
}

- (id)URLByDeletingFragment
{
  id v1 = a1;
  if (a1)
  {
    v2 = [a1 absoluteString];
    uint64_t v3 = [v2 rangeOfString:@"#" options:4];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v1 = v1;
    }
    else
    {
      id v4 = [v2 substringToIndex:v3];
      id v1 = [NSURL URLWithString:v4];
    }
  }

  return v1;
}

@end
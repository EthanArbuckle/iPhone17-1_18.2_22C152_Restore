@interface CNSocialProfileURLParser
+ (id)parseSocialProfileURL:(id)a3;
+ (id)parseURLStringByInference:(id)a3;
+ (id)parseURLStringWithRegularExpressions:(id)a3;
+ (id)servicesDictionary;
+ (void)enumerateMatchesWithRegexPattern:(id)a3 inString:(id)a4 withBlock:(id)a5;
+ (void)enumerateServiceMatchesForURLString:(id)a3 withBlock:(id)a4;
@end

@implementation CNSocialProfileURLParser

+ (id)parseSocialProfileURL:(id)a3
{
  id v4 = a3;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v4))
  {
    v5 = +[CNFoundationSocialProfile emptySocialProfile];
  }
  else
  {
    v5 = [a1 parseURLStringWithRegularExpressions:v4];
    if ([v5 isEmpty])
    {
      uint64_t v6 = [a1 parseURLStringByInference:v4];

      v5 = (void *)v6;
    }
  }

  return v5;
}

+ (id)parseURLStringWithRegularExpressions:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = +[CNFoundationSocialProfile emptySocialProfile];
  v7 = [v5 arrayWithObject:v6];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __65__CNSocialProfileURLParser_parseURLStringWithRegularExpressions___block_invoke;
  v15 = &unk_1E569FF30;
  id v16 = v4;
  id v17 = v7;
  id v8 = v7;
  id v9 = v4;
  [a1 enumerateServiceMatchesForURLString:v9 withBlock:&v12];
  v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", 0, v12, v13, v14, v15);

  return v10;
}

void __65__CNSocialProfileURLParser_parseURLStringWithRegularExpressions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = a2;
  if ((unint64_t)[v12 numberOfRanges] < 3)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v12 rangeAtIndex:2];
    id v9 = objc_msgSend(v6, "substringWithRange:", v7, v8);
    v10 = [v9 stringByRemovingPercentEncoding];
  }
  v11 = [[CNFoundationSocialProfile alloc] initWithUrlString:*(void *)(a1 + 32) username:v10 userIdentifier:0 service:v5 displayName:0];

  [*(id *)(a1 + 40) setObject:v11 atIndexedSubscript:0];
}

+ (void)enumerateServiceMatchesForURLString:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 servicesDictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__CNSocialProfileURLParser_enumerateServiceMatchesForURLString_withBlock___block_invoke;
  v11[3] = &unk_1E569FF80;
  id v13 = v7;
  id v14 = a1;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:v11];
}

void __74__CNSocialProfileURLParser_enumerateServiceMatchesForURLString_withBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__CNSocialProfileURLParser_enumerateServiceMatchesForURLString_withBlock___block_invoke_2;
  v10[3] = &unk_1E569FF58;
  id v7 = *(void **)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v8;
  id v9 = v5;
  [v7 enumerateMatchesWithRegexPattern:a2 inString:v6 withBlock:v10];
}

uint64_t __74__CNSocialProfileURLParser_enumerateServiceMatchesForURLString_withBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

+ (void)enumerateMatchesWithRegexPattern:(id)a3 inString:(id)a4 withBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 length];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__CNSocialProfileURLParser_enumerateMatchesWithRegexPattern_inString_withBlock___block_invoke;
  v12[3] = &unk_1E569FFA8;
  id v13 = v7;
  id v11 = v7;
  objc_msgSend(v9, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v10, v12);
}

uint64_t __80__CNSocialProfileURLParser_enumerateMatchesWithRegexPattern_inString_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)parseURLStringByInference:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  id v5 = [v4 scheme];
  id v6 = v3;
  if ([v5 isEqualToString:@"x-apple"])
  {
    id v7 = [v4 resourceSpecifier];
    id v8 = [v7 stringByRemovingPercentEncoding];

    id v9 = 0;
  }
  else
  {
    uint64_t v10 = [v5 length];
    if (v10) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    if (v10) {
      id v8 = 0;
    }
    else {
      id v8 = v6;
    }
  }
  id v11 = [v4 host];
  id v12 = v11;
  if (v11 && ![v11 rangeOfString:@"www."])
  {
    uint64_t v13 = [v12 substringFromIndex:4];

    id v12 = (void *)v13;
  }
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v12)) {
    id v14 = 0;
  }
  else {
    id v14 = v12;
  }
  id v15 = v14;

  id v16 = [[CNFoundationSocialProfile alloc] initWithUrlString:v9 username:v8 userIdentifier:0 service:v15 displayName:0];

  return v16;
}

+ (id)servicesDictionary
{
  if (servicesDictionary_cn_once_token_0 != -1) {
    dispatch_once(&servicesDictionary_cn_once_token_0, &__block_literal_global_17);
  }
  v2 = (void *)servicesDictionary_cn_once_object_0;

  return v2;
}

void __46__CNSocialProfileURLParser_servicesDictionary__block_invoke()
{
  v17[13] = *MEMORY[0x1E4F143B8];
  id v15 = sRE(@"https?://(?:www\\.)?(facebook\\.com)/profile\\.php\\?id=(?:\\d+)$");
  v16[0] = v15;
  v17[0] = @"Facebook";
  id v14 = sRE(@"https?://(?:www\\.)?(facebook\\.com)/([%\\w\\d\\.]+)$");
  v16[1] = v14;
  v17[1] = @"Facebook";
  uint64_t v13 = sRE(@"http://(?:www\\.)?(flickr\\.com)(?:/photos|profile)?/([%\\w\\d]+)/?$");
  v16[2] = v13;
  v17[2] = @"Flickr";
  id v12 = sRE(@"https?://(?:www\\.)?(linkedin\\.com)/in/([%\\w\\d]+)/?$");
  v16[3] = v12;
  v17[3] = @"LinkedIn";
  v0 = sRE(@"https?://(?:www\\.)?(linkedin\\.com)/pub/[%\\w\\d-]+/.+$");
  v16[4] = v0;
  v17[4] = @"LinkedIn";
  v1 = sRE(@"https?://(?:www\\.)?(linkedin\\.com)/profile/view\\?id=(?:\\d+).*");
  v16[5] = v1;
  v17[5] = @"LinkedIn";
  v2 = sRE(@"http://(?:www\\.)?(myspace\\.com)/([%\\w\\d]+)/?$");
  v16[6] = v2;
  v17[6] = @"MySpace";
  id v3 = sRE(@"https?://(?:www\\.)?(twitter\\.com)/(?:#!/)?([%\\w\\d]+)/?$");
  v16[7] = v3;
  v17[7] = @"Twitter";
  id v4 = sRE(@"https?://(?:www\\.)?(weibo\\.com)/u/(?:\\d+)/?$");
  v16[8] = v4;
  v17[8] = @"SinaWeibo";
  id v5 = sRE(@"https?://(?:www\\.)?(weibo\\.com)/(?:n/)?([%\\w\\d]+)/?$");
  v16[9] = v5;
  v17[9] = @"SinaWeibo";
  id v6 = sRE(@"https?://(?:www\\.)?(t\\.qq\\.com)/([%\\w\\d]+)/?$");
  v16[10] = v6;
  v17[10] = @"TencentWeibo";
  id v7 = sRE(@"https?://(?:www\\.)?(yelp\\.com)/biz/([-\\w\\d]+)/?$");
  v16[11] = v7;
  v17[11] = @"Yelp";
  id v8 = sRE(@"https?://(?:www\\.)?(yelp\\.com)/user_details\\?userid=(?:[\\w\\d_-]+)$");
  v16[12] = v8;
  v17[12] = @"Yelp";
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:13];
  uint64_t v10 = [v9 copy];
  id v11 = (void *)servicesDictionary_cn_once_object_0;
  servicesDictionary_cn_once_object_0 = v10;
}

@end
@interface FBKAnnouncement
+ (id)entityName;
- (NSString)cachedFullHTMLContent;
- (id)fullHTMLContent;
- (id)generateSearchText;
- (void)setCachedFullHTMLContent:(id)a3;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKAnnouncement

+ (id)entityName
{
  return @"Announcement";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v29 = a3;
  v4 = [v29 objectForKeyedSubscript:@"title"];
  v5 = FBKNilIfNSNull(v4);
  if (v5)
  {
    [(FBKAnnouncement *)self setTitle:v5];
  }
  else
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"AppleSeed Announcement" value:&stru_26DDF6A30 table:0];
    [(FBKAnnouncement *)self setTitle:v7];
  }
  v8 = [v29 objectForKeyedSubscript:@"type"];
  v9 = FBKNilIfNSNull(v8);
  [(FBKAnnouncement *)self setType:v9];

  v10 = [v29 objectForKeyedSubscript:@"created_at"];
  v11 = FBKNilIfNSNull(v10);

  if (v11)
  {
    v12 = FBKDateFromServerString(v11);
    [(FBKAnnouncement *)self setCreatedAt:v12];
  }
  else
  {
    [(FBKAnnouncement *)self setCreatedAt:0];
  }
  v13 = [v29 objectForKeyedSubscript:@"updated_at"];
  v14 = FBKNilIfNSNull(v13);

  if (v14)
  {
    v15 = FBKDateFromServerString(v14);
  }
  else
  {
    v15 = 0;
  }
  v16 = [v29 objectForKeyedSubscript:@"body"];
  v17 = FBKNilIfNSNull(v16);

  if (v17)
  {
    [(FBKAnnouncement *)self setBody:v17];
    v18 = self;
    uint64_t v19 = 0;
LABEL_21:
    [(FBKAnnouncement *)v18 setIsStub:v19];
    goto LABEL_22;
  }
  v20 = [(FBKAnnouncement *)self updatedAt];
  v21 = v20;
  if (!v20 || !v15)
  {

    goto LABEL_20;
  }
  v22 = [(FBKAnnouncement *)self body];

  if (!v22)
  {
LABEL_20:
    v18 = self;
    uint64_t v19 = 1;
    goto LABEL_21;
  }
  v23 = [(FBKAnnouncement *)self updatedAt];
  uint64_t v24 = [v15 compare:v23];
  unsigned int v25 = [(FBKAnnouncement *)self isStub];
  if (v24 == 1) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = v25;
  }
  [(FBKAnnouncement *)self setIsStub:v26];

LABEL_22:
  [(FBKAnnouncement *)self setUpdatedAt:v15];
  v27 = [v29 objectForKeyedSubscript:@"acknowledged?"];
  v28 = FBKNilIfNSNull(v27);

  if (v28) {
    -[FBKAnnouncement setUnread:](self, "setUnread:", [v28 BOOLValue] ^ 1);
  }
}

- (id)fullHTMLContent
{
  if (fullHTMLContent_onceToken != -1) {
    dispatch_once(&fullHTMLContent_onceToken, &__block_literal_global_3);
  }
  uint64_t v3 = [(FBKAnnouncement *)self cachedFullHTMLContent];
  if (!v3
    || (v4 = (void *)v3,
        [(FBKAnnouncement *)self cachedFullHTMLContent],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        !v6))
  {
    v7 = [(FBKAnnouncement *)self body];
    uint64_t v8 = [v7 rangeOfString:@"<html>" options:1];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)fullHTMLContent__announcementTemplate;
      v10 = [(FBKAnnouncement *)self body];
      v11 = [v9 stringByReplacingOccurrencesOfString:@"{{ANNOUNCEMENT_CONTENT}}" withString:v10];
      [(FBKAnnouncement *)self setCachedFullHTMLContent:v11];

      v12 = [(FBKAnnouncement *)self cachedFullHTMLContent];
      v13 = v12;
      v14 = @"target=\"_blank\"";
      v15 = &stru_26DDF6A30;
    }
    else
    {
      v12 = [(FBKAnnouncement *)self body];
      v13 = v12;
      v14 = @"<head>";
      v15 = @"<head>\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n";
    }
    v16 = [v12 stringByReplacingOccurrencesOfString:v14 withString:v15];
    [(FBKAnnouncement *)self setCachedFullHTMLContent:v16];
  }
  v17 = [(FBKAnnouncement *)self cachedFullHTMLContent];

  return v17;
}

void __34__FBKAnnouncement_fullHTMLContent__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 URLForResource:@"AnnouncementContent" withExtension:@"html"];

  id v7 = 0;
  uint64_t v2 = [NSString stringWithContentsOfURL:v1 encoding:4 error:&v7];
  id v3 = v7;
  v4 = (void *)fullHTMLContent__announcementTemplate;
  fullHTMLContent__announcementTemplate = v2;

  if (v3)
  {
    v5 = +[FBKLog appHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __34__FBKAnnouncement_fullHTMLContent__block_invoke_cold_1(v3, v5);
    }

    uint64_t v6 = (void *)fullHTMLContent__announcementTemplate;
    fullHTMLContent__announcementTemplate = (uint64_t)&stru_26DDF6A30;
  }
}

- (id)generateSearchText
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = [(FBKAnnouncement *)self body];

  if (v3)
  {
    v4 = [FBKXMLDocument alloc];
    v5 = [(FBKAnnouncement *)self fullHTMLContent];
    uint64_t v6 = [(FBKXMLDocument *)v4 initWithHTMLString:v5];

    id v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    uint64_t v8 = [(FBKXMLDocument *)v6 performXPathQuery:@"//body//*[not(self::style)]/text()"];
    if (v8)
    {
      v32 = v6;
      v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v8, "count"));
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v36 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            v16 = [v15 content];

            if (v16)
            {
              v17 = [v15 content];
              v18 = [v17 stringByTrimmingCharactersInSet:v7];

              if ([v18 length]) {
                [(__CFString *)v9 addObject:v18];
              }
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v12);
      }

      uint64_t v19 = [(__CFString *)v9 componentsJoinedByString:@" "];
      uint64_t v6 = v32;
    }
    else
    {
      v20 = [(FBKAnnouncement *)self body];
      v21 = (void *)[v20 mutableCopy];

      id v34 = 0;
      v22 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"<[^>]+>" options:0 error:&v34];
      id v23 = v34;
      id v33 = v23;
      uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"\\s+" options:0 error:&v33];
      id v25 = v33;

      if (!v25)
      {
        objc_msgSend(v22, "replaceMatchesInString:options:range:withTemplate:", v21, 0, 0, objc_msgSend(v21, "length"), &stru_26DDF6A30);
        objc_msgSend(v24, "replaceMatchesInString:options:range:withTemplate:", v21, 0, 0, objc_msgSend(v21, "length"), @" ");
      }
      v9 = v21;

      uint64_t v19 = v9;
    }
  }
  else
  {
    uint64_t v19 = &stru_26DDF6A30;
  }
  uint64_t v26 = [(FBKAnnouncement *)self title];
  v39[0] = v26;
  v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v28 = [v27 localizedStringForKey:@"ANNOUNCEMENT" value:&stru_26DDF6A30 table:@"CommonStrings"];
  v39[1] = v28;
  v39[2] = v19;
  id v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:3];
  v30 = [v29 componentsJoinedByString:@" "];

  return v30;
}

- (NSString)cachedFullHTMLContent
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCachedFullHTMLContent:(id)a3
{
}

- (void).cxx_destruct
{
}

void __34__FBKAnnouncement_fullHTMLContent__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 debugDescription];
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Failed to load AnnouncementContent with error [%{public}@]", (uint8_t *)&v4, 0xCu);
}

@end
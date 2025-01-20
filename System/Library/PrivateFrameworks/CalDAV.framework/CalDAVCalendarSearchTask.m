@interface CalDAVCalendarSearchTask
- (CalDAVCalendarSearchTask)initWithLanguages:(id)a3 location:(id)a4 calendarType:(id)a5 url:(id)a6;
- (NSDictionary)urlsToResults;
- (id)additionalHeaderValues;
- (id)copyDefaultParserForContentType:(id)a3;
- (id)httpMethod;
- (id)requestBody;
- (void)finishCoreDAVTaskWithError:(id)a3;
- (void)setAdditionalAuthenticationHeaders:(id)a3;
- (void)setLimit:(unint64_t)a3;
@end

@implementation CalDAVCalendarSearchTask

- (CalDAVCalendarSearchTask)initWithLanguages:(id)a3 location:(id)a4 calendarType:(id)a5 url:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CalDAVCalendarSearchTask;
  v14 = [(CalDAVCalendarSearchTask *)&v21 initWithURL:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_languages, a3);
    uint64_t v16 = [v12 copy];
    location = v15->_location;
    v15->_location = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    calendarType = v15->_calendarType;
    v15->_calendarType = (NSString *)v18;

    v15->_limit = 3;
  }

  return v15;
}

- (void)setLimit:(unint64_t)a3
{
  self->_limit = a3;
}

- (id)httpMethod
{
  return @"REPORT";
}

- (id)requestBody
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F34BB8]);
  NSUInteger v4 = [(NSArray *)self->_languages count];
  uint64_t v5 = *MEMORY[0x263F34CA8];
  uint64_t v6 = *MEMORY[0x263F34DA8];
  if (v4)
  {
    uint64_t v22 = *MEMORY[0x263F34CA8];
    objc_msgSend(v3, "startElement:inNamespace:withAttributeNamesAndValues:", v5, v6, *MEMORY[0x263F34CD0], *MEMORY[0x263F34C88], 0);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v24 = self;
    obj = self->_languages;
    uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v26;
      uint64_t v10 = *MEMORY[0x263F34D30];
      uint64_t v11 = *MEMORY[0x263F34D50];
      uint64_t v12 = *MEMORY[0x263F34D70];
      uint64_t v13 = *MEMORY[0x263F34DA0];
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          [v3 startElement:v10 inNamespace:v6 withAttributeNamesAndValues:0];
          [v3 appendElement:v11 inNamespace:v6 withStringContent:v15 withAttributeNamesAndValues:0];
          [v3 appendElement:v12 inNamespace:v6 withStringContent:v24->_location withAttributeNamesAndValues:0];
          [v3 appendElement:v13 inNamespace:v6 withStringContent:v24->_calendarType withAttributeNamesAndValues:0];
          [v3 endElement:v10 inNamespace:v6];
        }
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v8);
    }

    uint64_t v5 = v22;
    self = v24;
  }
  else
  {
    [v3 startElement:*MEMORY[0x263F34CA8] inNamespace:*MEMORY[0x263F34DA8] withAttributeNamesAndValues:0];
    uint64_t v16 = *MEMORY[0x263F34D30];
    [v3 startElement:*MEMORY[0x263F34D30] inNamespace:v6 withAttributeNamesAndValues:0];
    [v3 appendElement:*MEMORY[0x263F34DA0] inNamespace:v6 withStringContent:self->_calendarType withAttributeNamesAndValues:0];
    [v3 endElement:v16 inNamespace:v6];
  }
  if (self->_limit)
  {
    uint64_t v17 = *MEMORY[0x263F34CB8];
    [v3 startElement:*MEMORY[0x263F34CB8] inNamespace:v6 withAttributeNamesAndValues:0];
    uint64_t v18 = *MEMORY[0x263F34CC0];
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_limit);
    [v3 appendElement:v18 inNamespace:v6 withStringContent:v19 withAttributeNamesAndValues:0];

    [v3 endElement:v17 inNamespace:v6];
  }
  [v3 endElement:v5 inNamespace:v6];
  v20 = [v3 data];

  return v20;
}

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F34BC0]);
  uint64_t v5 = *MEMORY[0x263F34E10];
  uint64_t v6 = *MEMORY[0x263F34EB0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(CalDAVCalendarSearchTask *)self url];
  uint64_t v9 = (void *)[v4 initWithRootElementNameSpace:v5 name:v6 parseClass:v7 baseURL:v8];

  return v9;
}

- (void)finishCoreDAVTaskWithError:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v19 = a3;
  uint64_t v18 = [(CalDAVCalendarSearchTask *)self responseBodyParser];
  [v18 rootElement];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v17 = v24 = 0u;
  id v4 = [v17 responses];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v9 matchResults];

        if (v10)
        {
          uint64_t v11 = [v9 firstHref];
          uint64_t v12 = [v11 payloadAsFullURL];

          urlsToResults = self->_urlsToResults;
          if (!urlsToResults)
          {
            v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
            uint64_t v15 = self->_urlsToResults;
            self->_urlsToResults = v14;

            urlsToResults = self->_urlsToResults;
          }
          uint64_t v16 = [v9 matchResults];
          [(NSDictionary *)urlsToResults setObject:v16 forKey:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  v20.receiver = self;
  v20.super_class = (Class)CalDAVCalendarSearchTask;
  [(CalDAVCalendarSearchTask *)&v20 finishCoreDAVTaskWithError:v19];
}

- (id)additionalHeaderValues
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v7.receiver = self;
  v7.super_class = (Class)CalDAVCalendarSearchTask;
  id v4 = [(CalDAVCalendarSearchTask *)&v7 additionalHeaderValues];
  if ([v4 count]) {
    [v3 addEntriesFromDictionary:v4];
  }
  uint64_t v5 = (void *)MGGetStringAnswer();
  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:@"X-Request-Sku"];
  }
  if ([(NSDictionary *)self->_additionalAuthenticationHeaders count]) {
    [v3 addEntriesFromDictionary:self->_additionalAuthenticationHeaders];
  }

  return v3;
}

- (void)setAdditionalAuthenticationHeaders:(id)a3
{
  self->_additionalAuthenticationHeaders = (NSDictionary *)[a3 copy];
  MEMORY[0x270F9A758]();
}

- (NSDictionary)urlsToResults
{
  return self->_urlsToResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlsToResults, 0);
  objc_storeStrong((id *)&self->_additionalAuthenticationHeaders, 0);
  objc_storeStrong((id *)&self->_calendarType, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_languages, 0);
}

@end
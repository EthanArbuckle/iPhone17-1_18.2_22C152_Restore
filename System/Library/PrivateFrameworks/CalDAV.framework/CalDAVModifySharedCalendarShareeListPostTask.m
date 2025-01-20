@interface CalDAVModifySharedCalendarShareeListPostTask
- (id)copyDefaultParserForContentType:(id)a3;
@end

@implementation CalDAVModifySharedCalendarShareeListPostTask

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F34BC0]);
  uint64_t v5 = *MEMORY[0x263F34E10];
  uint64_t v6 = *MEMORY[0x263F34EB0];
  uint64_t v7 = objc_opt_class();
  v8 = [(CalDAVModifySharedCalendarShareeListPostTask *)self url];
  v9 = (void *)[v4 initWithRootElementNameSpace:v5 name:v6 parseClass:v7 baseURL:v8];

  return v9;
}

@end
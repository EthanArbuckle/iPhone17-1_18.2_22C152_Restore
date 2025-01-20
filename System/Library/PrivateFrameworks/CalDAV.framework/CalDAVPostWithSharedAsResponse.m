@interface CalDAVPostWithSharedAsResponse
- (id)copyDefaultParserForContentType:(id)a3;
@end

@implementation CalDAVPostWithSharedAsResponse

- (id)copyDefaultParserForContentType:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F34BC0]);
  uint64_t v5 = *MEMORY[0x263F34DA8];
  uint64_t v6 = objc_opt_class();
  v7 = [(CalDAVPostWithSharedAsResponse *)self url];
  v8 = (void *)[v4 initWithRootElementNameSpace:v5 name:@"shared-as" parseClass:v6 baseURL:v7];

  return v8;
}

@end
@interface NSURLComponents(ClipServicesExtras)
- (void)cps_addQueryItem:()ClipServicesExtras;
@end

@implementation NSURLComponents(ClipServicesExtras)

- (void)cps_addQueryItem:()ClipServicesExtras
{
  id v4 = a3;
  v5 = [a1 queryItems];
  v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF980] array];
  }
  id v9 = v8;

  [v9 addObject:v4];
  [a1 setQueryItems:v9];
}

@end
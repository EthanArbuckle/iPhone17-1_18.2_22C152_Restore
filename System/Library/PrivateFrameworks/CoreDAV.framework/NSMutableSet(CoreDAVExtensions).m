@interface NSMutableSet(CoreDAVExtensions)
- (void)CDVAddItemParserMappingWithNameSpace:()CoreDAVExtensions name:parseClass:;
@end

@implementation NSMutableSet(CoreDAVExtensions)

- (void)CDVAddItemParserMappingWithNameSpace:()CoreDAVExtensions name:parseClass:
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[CoreDAVItemParserMapping alloc] initWithNameSpace:v9 name:v8 parseClass:a5];

  [a1 addObject:v10];
}

@end
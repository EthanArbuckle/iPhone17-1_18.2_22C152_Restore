@interface NSString
@end

@implementation NSString

void __53__NSString_MSStringUtilities__MSTempFileOutFileName___block_invoke()
{
  NSTemporaryDirectory();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"asset-XXXXXX"];
  v1 = (void *)MSTempFileOutFileName__formatString;
  MSTempFileOutFileName__formatString = v0;
}

@end
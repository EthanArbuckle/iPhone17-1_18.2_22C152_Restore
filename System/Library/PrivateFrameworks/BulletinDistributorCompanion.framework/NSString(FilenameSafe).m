@interface NSString(FilenameSafe)
- (uint64_t)blt_filenameSafe;
@end

@implementation NSString(FilenameSafe)

- (uint64_t)blt_filenameSafe
{
  return [a1 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
}

@end
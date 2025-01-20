@interface TDThemeBitSource
- (id)fileURLWithDocument:(id)a3;
- (id)name;
@end

@implementation TDThemeBitSource

- (id)name
{
  v2 = (void *)[(TDThemeBitSource *)self path];

  return (id)[v2 lastPathComponent];
}

- (id)fileURLWithDocument:(id)a3
{
  v4 = (void *)[a3 rootPathForProductionData];
  v5 = (void *)[(TDThemeBitSource *)self path];
  if (v4) {
    v5 = (void *)[v4 stringByAppendingPathComponent:v5];
  }
  v6 = NSURL;
  uint64_t v7 = objc_msgSend(v5, "td_stringByStandardizingPath");

  return (id)[v6 fileURLWithPath:v7 isDirectory:0];
}

@end
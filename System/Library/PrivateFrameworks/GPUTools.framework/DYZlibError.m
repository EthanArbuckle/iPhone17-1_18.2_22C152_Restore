@interface DYZlibError
- (id)localizedDescription;
@end

@implementation DYZlibError

- (id)localizedDescription
{
  v3 = (void *)[(DYZlibError *)self userInfo];
  id result = (id)[v3 objectForKey:*MEMORY[0x263F08320]];
  if (!result)
  {
    unint64_t v5 = [(DYZlibError *)self code];
    if (v5 < 0xFFFFFFFFFFFFFFFALL) {
      return @"unknown zlib error";
    }
    else {
      return off_265333D10[v5 + 6];
    }
  }
  return result;
}

@end
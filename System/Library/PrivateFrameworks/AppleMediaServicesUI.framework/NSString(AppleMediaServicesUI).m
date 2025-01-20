@interface NSString(AppleMediaServicesUI)
- (uint64_t)ams_enumerateRangesOfString:()AppleMediaServicesUI usingBlock:;
- (void)ams_enumerateRangesOfString:()AppleMediaServicesUI options:usingBlock:;
@end

@implementation NSString(AppleMediaServicesUI)

- (uint64_t)ams_enumerateRangesOfString:()AppleMediaServicesUI usingBlock:
{
  return objc_msgSend(a1, "ams_enumerateRangesOfString:options:usingBlock:", a3, 0, a4);
}

- (void)ams_enumerateRangesOfString:()AppleMediaServicesUI options:usingBlock:
{
  id v8 = a3;
  v9 = a5;
  char v18 = 0;
  uint64_t v10 = [a1 length];
  uint64_t v11 = 0;
  uint64_t v12 = v10;
  do
  {
    uint64_t v13 = objc_msgSend(a1, "rangeOfString:options:range:", v8, a4, v11, v12);
    if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v15 = v13;
    uint64_t v16 = v14;
    v9[2](v9, v13, v14, &v18);
    uint64_t v11 = v15 + v16;
    uint64_t v12 = v10 - (v15 + v16);
  }
  while (!v18 && v10 != v15 + v16);
}

@end
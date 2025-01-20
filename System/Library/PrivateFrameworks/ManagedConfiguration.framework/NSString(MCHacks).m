@interface NSString(MCHacks)
- (id)MCAppendGreenteaSuffix;
- (uint64_t)MCRemoveAppExternalVersionIDParameter;
@end

@implementation NSString(MCHacks)

- (id)MCAppendGreenteaSuffix
{
  v2 = +[MCHacks sharedHacks];
  int v3 = [v2 isGreenTea];

  if (v3)
  {
    id v4 = [NSString stringWithFormat:@"%@_CH", a1];
  }
  else
  {
    id v4 = a1;
  }
  return v4;
}

- (uint64_t)MCRemoveAppExternalVersionIDParameter
{
  uint64_t v2 = [a1 length];
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", @"(?:^appExtVrsId=[^&]+&?|&appExtVrsId=[^&]+)", &stru_1EF4AAAF8, 1024, 0, v2);
}

@end
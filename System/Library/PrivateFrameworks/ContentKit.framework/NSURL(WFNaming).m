@interface NSURL(WFNaming)
- (id)wfName;
@end

@implementation NSURL(WFNaming)

- (id)wfName
{
  v1 = [a1 absoluteString];
  if ((unint64_t)[v1 length] <= 0x64)
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [v1 substringToIndex:100];
  }
  v3 = v2;

  return v3;
}

@end
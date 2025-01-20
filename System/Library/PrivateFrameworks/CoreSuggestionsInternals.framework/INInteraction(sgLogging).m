@interface INInteraction(sgLogging)
- (id)sg_LoggingIdentifier;
@end

@implementation INInteraction(sgLogging)

- (id)sg_LoggingIdentifier
{
  id v2 = [NSString alloc];
  v3 = [a1 identifier];
  v4 = objc_msgSend(v2, "initWithFormat:", @"%tu", objc_msgSend(v3, "hash"));

  if ((unint64_t)[v4 length] > 0xC)
  {
    objc_msgSend(v4, "substringWithRange:", 0, 12);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v4;
  }
  v6 = v5;

  return v6;
}

@end
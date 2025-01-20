@interface NSString(IDSDestinationParsing)
- (BOOL)fkMessageIsRawAddress;
- (id)fkMessageCanonicalRawAddress;
- (id)fkMessageIDSIdentifier;
- (id)fkMessageRawAddress;
- (uint64_t)fkMessageDestinationType;
- (uint64_t)fkMessageIsIDSIdentifier;
@end

@implementation NSString(IDSDestinationParsing)

- (uint64_t)fkMessageDestinationType
{
  if (([a1 containsString:@"@"] & 1) != 0
    || ([a1 containsString:@"mailto:"] & 1) != 0)
  {
    return 2;
  }
  if ([a1 containsString:@"tel:"]) {
    return 1;
  }
  v3 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  uint64_t v4 = [a1 rangeOfCharacterFromSet:v3];

  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)fkMessageIDSIdentifier
{
  if ([a1 fkMessageIsIDSIdentifier])
  {
    v2 = (void *)[a1 copy];
  }
  else
  {
    uint64_t v3 = [a1 fkMessageDestinationType];
    if (v3 == 2)
    {
      v2 = (void *)MEMORY[0x21D4B6FC0](a1);
    }
    else if (v3 == 1)
    {
      v2 = (void *)IDSCopyIDForPhoneNumber();
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

- (id)fkMessageRawAddress
{
  if ([a1 fkMessageIsRawAddress]) {
    v2 = (void *)[a1 copy];
  }
  else {
    v2 = (void *)IDSCopyRawAddressForDestination();
  }

  return v2;
}

- (BOOL)fkMessageIsRawAddress
{
  return ([a1 containsString:@"tel:"] & 1) == 0
      && ([a1 containsString:@"mailto:"] & 1) == 0
      && [a1 fkMessageDestinationType] != 0;
}

- (uint64_t)fkMessageIsIDSIdentifier
{
  if ([a1 containsString:@"tel:"]) {
    return 1;
  }

  return [a1 containsString:@"mailto:"];
}

- (id)fkMessageCanonicalRawAddress
{
  v2 = [a1 fkMessageRawAddress];
  if ([a1 fkMessageDestinationType] == 1)
  {
    uint64_t v4 = (void *)MEMORY[0x21D4B6FE0](v2, 0, 1);
    v5 = [v4 fkMessageRawAddress];

    id v3 = v5;
  }
  else
  {
    id v3 = v2;
  }

  return v3;
}

@end
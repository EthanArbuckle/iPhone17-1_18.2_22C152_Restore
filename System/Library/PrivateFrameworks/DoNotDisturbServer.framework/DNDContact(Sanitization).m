@interface DNDContact(Sanitization)
- (BOOL)needsSanitization;
@end

@implementation DNDContact(Sanitization)

- (BOOL)needsSanitization
{
  v2 = [a1 contactIdentifier];
  if (v2)
  {
    v3 = [a1 phoneNumbers];
    if ([v3 count])
    {
      v4 = [a1 emailAddresses];
      BOOL v5 = [v4 count] == 0;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end
@interface NSString(ECEmailAddressConvertible)
- (ECEmailAddress)emailAddressValue;
- (id)stringValue;
@end

@implementation NSString(ECEmailAddressConvertible)

- (id)stringValue
{
  v2 = [a1 emailAddressValue];
  v3 = [v2 stringValue];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = (void *)[a1 copy];
    id v5 = [v6 stringByReplacingOccurrencesOfString:&stru_1F1A642E8 withString:&stru_1F1A635E8];
  }
  return v5;
}

- (ECEmailAddress)emailAddressValue
{
  return +[ECEmailAddress emailAddressWithString:a1];
}

@end
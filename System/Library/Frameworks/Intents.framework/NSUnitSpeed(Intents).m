@interface NSUnitSpeed(Intents)
- (id)_intents_stringRepresentation;
@end

@implementation NSUnitSpeed(Intents)

- (id)_intents_stringRepresentation
{
  v2 = [MEMORY[0x1E4F29208] metersPerSecond];
  char v3 = [a1 isEqual:v2];

  if (v3)
  {
    v4 = @"metersPerSecond";
  }
  else
  {
    v5 = [MEMORY[0x1E4F29208] kilometersPerHour];
    char v6 = [a1 isEqual:v5];

    if (v6)
    {
      v4 = @"kilometersPerHour";
    }
    else
    {
      v7 = [MEMORY[0x1E4F29208] milesPerHour];
      char v8 = [a1 isEqual:v7];

      if (v8)
      {
        v4 = @"milesPerHour";
      }
      else
      {
        v9 = [MEMORY[0x1E4F29208] knots];
        char v10 = [a1 isEqual:v9];

        if ((v10 & 1) == 0)
        {
          v13 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v14 = *MEMORY[0x1E4F1C3B8];
          v15 = [NSString stringWithFormat:@"Unknown unit %@", a1];
          id v16 = [v13 exceptionWithName:v14 reason:v15 userInfo:0];

          objc_exception_throw(v16);
        }
        v4 = @"knots";
      }
    }
  }
  v11 = [(__CFString *)v4 if_ASCIIStringByUppercasingFirstCharacter];

  return v11;
}

@end
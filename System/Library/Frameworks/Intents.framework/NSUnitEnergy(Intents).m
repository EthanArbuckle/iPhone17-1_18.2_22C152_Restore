@interface NSUnitEnergy(Intents)
- (id)_intents_stringRepresentation;
@end

@implementation NSUnitEnergy(Intents)

- (id)_intents_stringRepresentation
{
  v2 = [MEMORY[0x1E4F291B0] kilojoules];
  char v3 = [a1 isEqual:v2];

  if (v3)
  {
    v4 = @"kilojoules";
  }
  else
  {
    v5 = [MEMORY[0x1E4F291B0] joules];
    char v6 = [a1 isEqual:v5];

    if (v6)
    {
      v4 = @"joules";
    }
    else
    {
      v7 = [MEMORY[0x1E4F291B0] kilocalories];
      char v8 = [a1 isEqual:v7];

      if (v8)
      {
        v4 = @"kilocalories";
      }
      else
      {
        v9 = [MEMORY[0x1E4F291B0] calories];
        char v10 = [a1 isEqual:v9];

        if (v10)
        {
          v4 = @"calories";
        }
        else
        {
          v11 = [MEMORY[0x1E4F291B0] kilowattHours];
          char v12 = [a1 isEqual:v11];

          if ((v12 & 1) == 0)
          {
            v15 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v16 = *MEMORY[0x1E4F1C3B8];
            v17 = [NSString stringWithFormat:@"Unknown unit %@", a1];
            id v18 = [v15 exceptionWithName:v16 reason:v17 userInfo:0];

            objc_exception_throw(v18);
          }
          v4 = @"kilowattHours";
        }
      }
    }
  }
  v13 = [(__CFString *)v4 if_ASCIIStringByUppercasingFirstCharacter];

  return v13;
}

@end
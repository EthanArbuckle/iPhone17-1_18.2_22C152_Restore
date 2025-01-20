@interface NSUnitTemperature(Intents)
- (id)_intents_stringRepresentation;
@end

@implementation NSUnitTemperature(Intents)

- (id)_intents_stringRepresentation
{
  v2 = [MEMORY[0x1E4F29218] kelvin];
  char v3 = [a1 isEqual:v2];

  if (v3)
  {
    v4 = @"kelvin";
  }
  else
  {
    v5 = [MEMORY[0x1E4F29218] celsius];
    char v6 = [a1 isEqual:v5];

    if (v6)
    {
      v4 = @"celsius";
    }
    else
    {
      v7 = [MEMORY[0x1E4F29218] fahrenheit];
      char v8 = [a1 isEqual:v7];

      if ((v8 & 1) == 0)
      {
        v11 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v12 = *MEMORY[0x1E4F1C3B8];
        v13 = [NSString stringWithFormat:@"Unknown unit %@", a1];
        id v14 = [v11 exceptionWithName:v12 reason:v13 userInfo:0];

        objc_exception_throw(v14);
      }
      v4 = @"fahrenheit";
    }
  }
  v9 = [(__CFString *)v4 if_ASCIIStringByUppercasingFirstCharacter];

  return v9;
}

@end
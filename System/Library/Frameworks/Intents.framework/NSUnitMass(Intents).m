@interface NSUnitMass(Intents)
- (id)_intents_stringRepresentation;
@end

@implementation NSUnitMass(Intents)

- (id)_intents_stringRepresentation
{
  v2 = [MEMORY[0x1E4F291E8] kilograms];
  char v3 = [a1 isEqual:v2];

  if (v3)
  {
    v4 = @"kilograms";
  }
  else
  {
    v5 = [MEMORY[0x1E4F291E8] grams];
    char v6 = [a1 isEqual:v5];

    if (v6)
    {
      v4 = @"grams";
    }
    else
    {
      v7 = [MEMORY[0x1E4F291E8] decigrams];
      char v8 = [a1 isEqual:v7];

      if (v8)
      {
        v4 = @"decigrams";
      }
      else
      {
        v9 = [MEMORY[0x1E4F291E8] centigrams];
        char v10 = [a1 isEqual:v9];

        if (v10)
        {
          v4 = @"centigrams";
        }
        else
        {
          v11 = [MEMORY[0x1E4F291E8] milligrams];
          char v12 = [a1 isEqual:v11];

          if (v12)
          {
            v4 = @"milligrams";
          }
          else
          {
            v13 = [MEMORY[0x1E4F291E8] micrograms];
            char v14 = [a1 isEqual:v13];

            if (v14)
            {
              v4 = @"micrograms";
            }
            else
            {
              v15 = [MEMORY[0x1E4F291E8] nanograms];
              char v16 = [a1 isEqual:v15];

              if (v16)
              {
                v4 = @"nanograms";
              }
              else
              {
                v17 = [MEMORY[0x1E4F291E8] picograms];
                char v18 = [a1 isEqual:v17];

                if (v18)
                {
                  v4 = @"picograms";
                }
                else
                {
                  v19 = [MEMORY[0x1E4F291E8] ounces];
                  char v20 = [a1 isEqual:v19];

                  if (v20)
                  {
                    v4 = @"ounces";
                  }
                  else
                  {
                    v21 = [MEMORY[0x1E4F291E8] poundsMass];
                    char v22 = [a1 isEqual:v21];

                    if (v22)
                    {
                      v4 = @"poundsMass";
                    }
                    else
                    {
                      v23 = [MEMORY[0x1E4F291E8] stones];
                      char v24 = [a1 isEqual:v23];

                      if (v24)
                      {
                        v4 = @"stones";
                      }
                      else
                      {
                        v25 = [MEMORY[0x1E4F291E8] metricTons];
                        char v26 = [a1 isEqual:v25];

                        if (v26)
                        {
                          v4 = @"metricTons";
                        }
                        else
                        {
                          v27 = [MEMORY[0x1E4F291E8] shortTons];
                          char v28 = [a1 isEqual:v27];

                          if (v28)
                          {
                            v4 = @"shortTons";
                          }
                          else
                          {
                            v29 = [MEMORY[0x1E4F291E8] carats];
                            char v30 = [a1 isEqual:v29];

                            if (v30)
                            {
                              v4 = @"carats";
                            }
                            else
                            {
                              v31 = [MEMORY[0x1E4F291E8] ouncesTroy];
                              char v32 = [a1 isEqual:v31];

                              if (v32)
                              {
                                v4 = @"ouncesTroy";
                              }
                              else
                              {
                                v33 = [MEMORY[0x1E4F291E8] slugs];
                                char v34 = [a1 isEqual:v33];

                                if ((v34 & 1) == 0)
                                {
                                  v37 = (void *)MEMORY[0x1E4F1CA00];
                                  uint64_t v38 = *MEMORY[0x1E4F1C3B8];
                                  v39 = [NSString stringWithFormat:@"Unknown unit %@", a1];
                                  id v40 = [v37 exceptionWithName:v38 reason:v39 userInfo:0];

                                  objc_exception_throw(v40);
                                }
                                v4 = @"slugs";
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v35 = [(__CFString *)v4 if_ASCIIStringByUppercasingFirstCharacter];

  return v35;
}

@end
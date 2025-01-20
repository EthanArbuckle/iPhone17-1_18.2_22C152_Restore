@interface NSUnitLength(Intents)
- (id)_intents_stringRepresentation;
@end

@implementation NSUnitLength(Intents)

- (id)_intents_stringRepresentation
{
  v2 = [MEMORY[0x1E4F291E0] megameters];
  char v3 = [a1 isEqual:v2];

  if (v3)
  {
    v4 = @"megameters";
  }
  else
  {
    v5 = [MEMORY[0x1E4F291E0] kilometers];
    char v6 = [a1 isEqual:v5];

    if (v6)
    {
      v4 = @"kilometers";
    }
    else
    {
      v7 = [MEMORY[0x1E4F291E0] hectometers];
      char v8 = [a1 isEqual:v7];

      if (v8)
      {
        v4 = @"hectometers";
      }
      else
      {
        v9 = [MEMORY[0x1E4F291E0] decameters];
        char v10 = [a1 isEqual:v9];

        if (v10)
        {
          v4 = @"decameters";
        }
        else
        {
          v11 = [MEMORY[0x1E4F291E0] meters];
          char v12 = [a1 isEqual:v11];

          if (v12)
          {
            v4 = @"meters";
          }
          else
          {
            v13 = [MEMORY[0x1E4F291E0] decimeters];
            char v14 = [a1 isEqual:v13];

            if (v14)
            {
              v4 = @"decimeters";
            }
            else
            {
              v15 = [MEMORY[0x1E4F291E0] centimeters];
              char v16 = [a1 isEqual:v15];

              if (v16)
              {
                v4 = @"centimeters";
              }
              else
              {
                v17 = [MEMORY[0x1E4F291E0] millimeters];
                char v18 = [a1 isEqual:v17];

                if (v18)
                {
                  v4 = @"millimeters";
                }
                else
                {
                  v19 = [MEMORY[0x1E4F291E0] micrometers];
                  char v20 = [a1 isEqual:v19];

                  if (v20)
                  {
                    v4 = @"micrometers";
                  }
                  else
                  {
                    v21 = [MEMORY[0x1E4F291E0] nanometers];
                    char v22 = [a1 isEqual:v21];

                    if (v22)
                    {
                      v4 = @"nanometers";
                    }
                    else
                    {
                      v23 = [MEMORY[0x1E4F291E0] picometers];
                      char v24 = [a1 isEqual:v23];

                      if (v24)
                      {
                        v4 = @"picometers";
                      }
                      else
                      {
                        v25 = [MEMORY[0x1E4F291E0] inches];
                        char v26 = [a1 isEqual:v25];

                        if (v26)
                        {
                          v4 = @"inches";
                        }
                        else
                        {
                          v27 = [MEMORY[0x1E4F291E0] feet];
                          char v28 = [a1 isEqual:v27];

                          if (v28)
                          {
                            v4 = @"feet";
                          }
                          else
                          {
                            v29 = [MEMORY[0x1E4F291E0] yards];
                            char v30 = [a1 isEqual:v29];

                            if (v30)
                            {
                              v4 = @"yards";
                            }
                            else
                            {
                              v31 = [MEMORY[0x1E4F291E0] miles];
                              char v32 = [a1 isEqual:v31];

                              if (v32)
                              {
                                v4 = @"miles";
                              }
                              else
                              {
                                v33 = [MEMORY[0x1E4F291E0] scandinavianMiles];
                                char v34 = [a1 isEqual:v33];

                                if (v34)
                                {
                                  v4 = @"scandinavianMiles";
                                }
                                else
                                {
                                  v35 = [MEMORY[0x1E4F291E0] lightyears];
                                  char v36 = [a1 isEqual:v35];

                                  if (v36)
                                  {
                                    v4 = @"lightyears";
                                  }
                                  else
                                  {
                                    v37 = [MEMORY[0x1E4F291E0] nauticalMiles];
                                    char v38 = [a1 isEqual:v37];

                                    if (v38)
                                    {
                                      v4 = @"nauticalMiles";
                                    }
                                    else
                                    {
                                      v39 = [MEMORY[0x1E4F291E0] fathoms];
                                      char v40 = [a1 isEqual:v39];

                                      if (v40)
                                      {
                                        v4 = @"fathoms";
                                      }
                                      else
                                      {
                                        v41 = [MEMORY[0x1E4F291E0] furlongs];
                                        char v42 = [a1 isEqual:v41];

                                        if (v42)
                                        {
                                          v4 = @"furlongs";
                                        }
                                        else
                                        {
                                          v43 = [MEMORY[0x1E4F291E0] astronomicalUnits];
                                          char v44 = [a1 isEqual:v43];

                                          if (v44)
                                          {
                                            v4 = @"astronomicalUnits";
                                          }
                                          else
                                          {
                                            v45 = [MEMORY[0x1E4F291E0] parsecs];
                                            char v46 = [a1 isEqual:v45];

                                            if ((v46 & 1) == 0)
                                            {
                                              v49 = (void *)MEMORY[0x1E4F1CA00];
                                              uint64_t v50 = *MEMORY[0x1E4F1C3B8];
                                              v51 = [NSString stringWithFormat:@"Unknown unit %@", a1];
                                              id v52 = [v49 exceptionWithName:v50 reason:v51 userInfo:0];

                                              objc_exception_throw(v52);
                                            }
                                            v4 = @"parsecs";
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
            }
          }
        }
      }
    }
  }
  v47 = [(__CFString *)v4 if_ASCIIStringByUppercasingFirstCharacter];

  return v47;
}

@end
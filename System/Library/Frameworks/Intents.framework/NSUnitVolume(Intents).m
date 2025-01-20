@interface NSUnitVolume(Intents)
- (id)_intents_stringRepresentation;
@end

@implementation NSUnitVolume(Intents)

- (id)_intents_stringRepresentation
{
  v2 = [MEMORY[0x1E4F29228] megaliters];
  char v3 = [a1 isEqual:v2];

  if (v3)
  {
    v4 = @"megaliters";
  }
  else
  {
    v5 = [MEMORY[0x1E4F29228] kiloliters];
    char v6 = [a1 isEqual:v5];

    if (v6)
    {
      v4 = @"kiloliters";
    }
    else
    {
      v7 = [MEMORY[0x1E4F29228] liters];
      char v8 = [a1 isEqual:v7];

      if (v8)
      {
        v4 = @"liters";
      }
      else
      {
        v9 = [MEMORY[0x1E4F29228] deciliters];
        char v10 = [a1 isEqual:v9];

        if (v10)
        {
          v4 = @"deciliters";
        }
        else
        {
          v11 = [MEMORY[0x1E4F29228] centiliters];
          char v12 = [a1 isEqual:v11];

          if (v12)
          {
            v4 = @"centiliters";
          }
          else
          {
            v13 = [MEMORY[0x1E4F29228] milliliters];
            char v14 = [a1 isEqual:v13];

            if (v14)
            {
              v4 = @"milliliters";
            }
            else
            {
              v15 = [MEMORY[0x1E4F29228] cubicKilometers];
              char v16 = [a1 isEqual:v15];

              if (v16)
              {
                v4 = @"cubicKilometers";
              }
              else
              {
                v17 = [MEMORY[0x1E4F29228] cubicMeters];
                char v18 = [a1 isEqual:v17];

                if (v18)
                {
                  v4 = @"cubicMeters";
                }
                else
                {
                  v19 = [MEMORY[0x1E4F29228] cubicDecimeters];
                  char v20 = [a1 isEqual:v19];

                  if (v20)
                  {
                    v4 = @"cubicDecimeters";
                  }
                  else
                  {
                    v21 = [MEMORY[0x1E4F29228] cubicCentimeters];
                    char v22 = [a1 isEqual:v21];

                    if (v22)
                    {
                      v4 = @"cubicCentimeters";
                    }
                    else
                    {
                      v23 = [MEMORY[0x1E4F29228] cubicMillimeters];
                      char v24 = [a1 isEqual:v23];

                      if (v24)
                      {
                        v4 = @"cubicMillimeters";
                      }
                      else
                      {
                        v25 = [MEMORY[0x1E4F29228] cubicInches];
                        char v26 = [a1 isEqual:v25];

                        if (v26)
                        {
                          v4 = @"cubicInches";
                        }
                        else
                        {
                          v27 = [MEMORY[0x1E4F29228] cubicFeet];
                          char v28 = [a1 isEqual:v27];

                          if (v28)
                          {
                            v4 = @"cubicFeet";
                          }
                          else
                          {
                            v29 = [MEMORY[0x1E4F29228] cubicYards];
                            char v30 = [a1 isEqual:v29];

                            if (v30)
                            {
                              v4 = @"cubicYards";
                            }
                            else
                            {
                              v31 = [MEMORY[0x1E4F29228] cubicMiles];
                              char v32 = [a1 isEqual:v31];

                              if (v32)
                              {
                                v4 = @"cubicMiles";
                              }
                              else
                              {
                                v33 = [MEMORY[0x1E4F29228] acreFeet];
                                char v34 = [a1 isEqual:v33];

                                if (v34)
                                {
                                  v4 = @"acreFeet";
                                }
                                else
                                {
                                  v35 = [MEMORY[0x1E4F29228] bushels];
                                  char v36 = [a1 isEqual:v35];

                                  if (v36)
                                  {
                                    v4 = @"bushels";
                                  }
                                  else
                                  {
                                    v37 = [MEMORY[0x1E4F29228] teaspoons];
                                    char v38 = [a1 isEqual:v37];

                                    if (v38)
                                    {
                                      v4 = @"teaspoons";
                                    }
                                    else
                                    {
                                      v39 = [MEMORY[0x1E4F29228] tablespoons];
                                      char v40 = [a1 isEqual:v39];

                                      if (v40)
                                      {
                                        v4 = @"tablespoons";
                                      }
                                      else
                                      {
                                        v41 = [MEMORY[0x1E4F29228] fluidOunces];
                                        char v42 = [a1 isEqual:v41];

                                        if (v42)
                                        {
                                          v4 = @"fluidOunces";
                                        }
                                        else
                                        {
                                          v43 = [MEMORY[0x1E4F29228] cups];
                                          char v44 = [a1 isEqual:v43];

                                          if (v44)
                                          {
                                            v4 = @"cups";
                                          }
                                          else
                                          {
                                            v45 = [MEMORY[0x1E4F29228] pints];
                                            char v46 = [a1 isEqual:v45];

                                            if (v46)
                                            {
                                              v4 = @"pints";
                                            }
                                            else
                                            {
                                              v47 = [MEMORY[0x1E4F29228] quarts];
                                              char v48 = [a1 isEqual:v47];

                                              if (v48)
                                              {
                                                v4 = @"quarts";
                                              }
                                              else
                                              {
                                                v49 = [MEMORY[0x1E4F29228] gallons];
                                                char v50 = [a1 isEqual:v49];

                                                if (v50)
                                                {
                                                  v4 = @"gallons";
                                                }
                                                else
                                                {
                                                  v51 = [MEMORY[0x1E4F29228] imperialTeaspoons];
                                                  char v52 = [a1 isEqual:v51];

                                                  if (v52)
                                                  {
                                                    v4 = @"imperialTeaspoons";
                                                  }
                                                  else
                                                  {
                                                    v53 = [MEMORY[0x1E4F29228] imperialTablespoons];
                                                    char v54 = [a1 isEqual:v53];

                                                    if (v54)
                                                    {
                                                      v4 = @"imperialTablespoons";
                                                    }
                                                    else
                                                    {
                                                      v55 = [MEMORY[0x1E4F29228] imperialFluidOunces];
                                                      char v56 = [a1 isEqual:v55];

                                                      if (v56)
                                                      {
                                                        v4 = @"imperialFluidOunces";
                                                      }
                                                      else
                                                      {
                                                        v57 = [MEMORY[0x1E4F29228] imperialPints];
                                                        char v58 = [a1 isEqual:v57];

                                                        if (v58)
                                                        {
                                                          v4 = @"imperialPints";
                                                        }
                                                        else
                                                        {
                                                          v59 = [MEMORY[0x1E4F29228] imperialQuarts];
                                                          char v60 = [a1 isEqual:v59];

                                                          if (v60)
                                                          {
                                                            v4 = @"imperialQuarts";
                                                          }
                                                          else
                                                          {
                                                            v61 = [MEMORY[0x1E4F29228] imperialGallons];
                                                            char v62 = [a1 isEqual:v61];

                                                            if (v62)
                                                            {
                                                              v4 = @"imperialGallons";
                                                            }
                                                            else
                                                            {
                                                              v63 = [MEMORY[0x1E4F29228] metricCups];
                                                              char v64 = [a1 isEqual:v63];

                                                              if ((v64 & 1) == 0)
                                                              {
                                                                v67 = (void *)MEMORY[0x1E4F1CA00];
                                                                uint64_t v68 = *MEMORY[0x1E4F1C3B8];
                                                                v69 = [NSString stringWithFormat:@"Unknown unit %@", a1];
                                                                id v70 = [v67 exceptionWithName:v68 reason:v69 userInfo:0];

                                                                objc_exception_throw(v70);
                                                              }
                                                              v4 = @"metricCups";
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
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v65 = [(__CFString *)v4 if_ASCIIStringByUppercasingFirstCharacter];

  return v65;
}

@end
@interface NSMeasurement(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation NSMeasurement(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  v132[2] = *MEMORY[0x1E4F143B8];
  v2 = [a1 unit];
  v3 = [MEMORY[0x1E4F291E0] meters];
  char v4 = [v2 isEqual:v3];

  if (v4)
  {
    v5 = @"meters";
  }
  else
  {
    v6 = [MEMORY[0x1E4F291E0] miles];
    char v7 = [v2 isEqual:v6];

    if (v7)
    {
      v5 = @"miles";
    }
    else
    {
      v8 = [MEMORY[0x1E4F291E0] centimeters];
      char v9 = [v2 isEqual:v8];

      if (v9)
      {
        v5 = @"centimeters";
      }
      else
      {
        v10 = [MEMORY[0x1E4F291E0] feet];
        char v11 = [v2 isEqual:v10];

        if (v11)
        {
          v5 = @"feet";
        }
        else
        {
          v12 = [MEMORY[0x1E4F291E0] inches];
          char v13 = [v2 isEqual:v12];

          if (v13)
          {
            v5 = @"inches";
          }
          else
          {
            v14 = [MEMORY[0x1E4F291E0] yards];
            char v15 = [v2 isEqual:v14];

            if (v15)
            {
              v5 = @"yards";
            }
            else
            {
              v16 = [MEMORY[0x1E4F291E0] kilometers];
              char v17 = [v2 isEqual:v16];

              if (v17)
              {
                v5 = @"kilometers";
              }
              else
              {
                v18 = [MEMORY[0x1E4F29218] celsius];
                char v19 = [v2 isEqual:v18];

                if (v19)
                {
                  v5 = @"celsius";
                }
                else
                {
                  v20 = [MEMORY[0x1E4F29218] fahrenheit];
                  char v21 = [v2 isEqual:v20];

                  if (v21)
                  {
                    v5 = @"fahrenheit";
                  }
                  else
                  {
                    v22 = [MEMORY[0x1E4F29218] kelvin];
                    char v23 = [v2 isEqual:v22];

                    if (v23)
                    {
                      v5 = @"kelvin";
                    }
                    else
                    {
                      v24 = [MEMORY[0x1E4F291E8] kilograms];
                      char v25 = [v2 isEqual:v24];

                      if (v25)
                      {
                        v5 = @"kilograms";
                      }
                      else
                      {
                        v26 = [MEMORY[0x1E4F291E8] grams];
                        char v27 = [v2 isEqual:v26];

                        if (v27)
                        {
                          v5 = @"grams";
                        }
                        else
                        {
                          v28 = [MEMORY[0x1E4F291E8] decigrams];
                          char v29 = [v2 isEqual:v28];

                          if (v29)
                          {
                            v5 = @"decigrams";
                          }
                          else
                          {
                            v30 = [MEMORY[0x1E4F291E8] centigrams];
                            char v31 = [v2 isEqual:v30];

                            if (v31)
                            {
                              v5 = @"centigrams";
                            }
                            else
                            {
                              v32 = [MEMORY[0x1E4F291E8] milligrams];
                              char v33 = [v2 isEqual:v32];

                              if (v33)
                              {
                                v5 = @"milligrams";
                              }
                              else
                              {
                                v34 = [MEMORY[0x1E4F291E8] micrograms];
                                char v35 = [v2 isEqual:v34];

                                if (v35)
                                {
                                  v5 = @"micrograms";
                                }
                                else
                                {
                                  v36 = [MEMORY[0x1E4F291E8] nanograms];
                                  char v37 = [v2 isEqual:v36];

                                  if (v37)
                                  {
                                    v5 = @"nanograms";
                                  }
                                  else
                                  {
                                    v38 = [MEMORY[0x1E4F291E8] picograms];
                                    char v39 = [v2 isEqual:v38];

                                    if (v39)
                                    {
                                      v5 = @"picograms";
                                    }
                                    else
                                    {
                                      v40 = [MEMORY[0x1E4F291E8] ounces];
                                      char v41 = [v2 isEqual:v40];

                                      if (v41)
                                      {
                                        v5 = @"ounces";
                                      }
                                      else
                                      {
                                        v42 = [MEMORY[0x1E4F291E8] poundsMass];
                                        char v43 = [v2 isEqual:v42];

                                        if (v43)
                                        {
                                          v5 = @"poundsMass";
                                        }
                                        else
                                        {
                                          v44 = [MEMORY[0x1E4F291E8] stones];
                                          char v45 = [v2 isEqual:v44];

                                          if (v45)
                                          {
                                            v5 = @"stones";
                                          }
                                          else
                                          {
                                            v46 = [MEMORY[0x1E4F291E8] metricTons];
                                            char v47 = [v2 isEqual:v46];

                                            if (v47)
                                            {
                                              v5 = @"metricTons";
                                            }
                                            else
                                            {
                                              v48 = [MEMORY[0x1E4F291E8] shortTons];
                                              char v49 = [v2 isEqual:v48];

                                              if (v49)
                                              {
                                                v5 = @"shortTons";
                                              }
                                              else
                                              {
                                                v50 = [MEMORY[0x1E4F291E8] carats];
                                                char v51 = [v2 isEqual:v50];

                                                if (v51)
                                                {
                                                  v5 = @"carats";
                                                }
                                                else
                                                {
                                                  v52 = [MEMORY[0x1E4F291E8] ouncesTroy];
                                                  char v53 = [v2 isEqual:v52];

                                                  if (v53)
                                                  {
                                                    v5 = @"ouncesTroy";
                                                  }
                                                  else
                                                  {
                                                    v54 = [MEMORY[0x1E4F291E8] slugs];
                                                    char v55 = [v2 isEqual:v54];

                                                    if (v55)
                                                    {
                                                      v5 = @"slugs";
                                                    }
                                                    else
                                                    {
                                                      v56 = [MEMORY[0x1E4F29228] megaliters];
                                                      char v57 = [v2 isEqual:v56];

                                                      if (v57)
                                                      {
                                                        v5 = @"megaliters";
                                                      }
                                                      else
                                                      {
                                                        v58 = [MEMORY[0x1E4F29228] kiloliters];
                                                        char v59 = [v2 isEqual:v58];

                                                        if (v59)
                                                        {
                                                          v5 = @"kiloliters";
                                                        }
                                                        else
                                                        {
                                                          v60 = [MEMORY[0x1E4F29228] liters];
                                                          char v61 = [v2 isEqual:v60];

                                                          if (v61)
                                                          {
                                                            v5 = @"liters";
                                                          }
                                                          else
                                                          {
                                                            v62 = [MEMORY[0x1E4F29228] deciliters];
                                                            char v63 = [v2 isEqual:v62];

                                                            if (v63)
                                                            {
                                                              v5 = @"deciliters";
                                                            }
                                                            else
                                                            {
                                                              v64 = [MEMORY[0x1E4F29228] centiliters];
                                                              char v65 = [v2 isEqual:v64];

                                                              if (v65)
                                                              {
                                                                v5 = @"centiliters";
                                                              }
                                                              else
                                                              {
                                                                v66 = [MEMORY[0x1E4F29228] milliliters];
                                                                char v67 = [v2 isEqual:v66];

                                                                if (v67)
                                                                {
                                                                  v5 = @"milliliters";
                                                                }
                                                                else
                                                                {
                                                                  v68 = [MEMORY[0x1E4F29228] cubicKilometers];
                                                                  char v69 = [v2 isEqual:v68];

                                                                  if (v69)
                                                                  {
                                                                    v5 = @"cubicKilometers";
                                                                  }
                                                                  else
                                                                  {
                                                                    v70 = [MEMORY[0x1E4F29228] cubicDecimeters];
                                                                    char v71 = [v2 isEqual:v70];

                                                                    if (v71)
                                                                    {
                                                                      v5 = @"cubicDecimeters";
                                                                    }
                                                                    else
                                                                    {
                                                                      v72 = [MEMORY[0x1E4F29228] cubicMillimeters];
                                                                      char v73 = [v2 isEqual:v72];

                                                                      if (v73)
                                                                      {
                                                                        v5 = @"cubicMillimeters";
                                                                      }
                                                                      else
                                                                      {
                                                                        v74 = [MEMORY[0x1E4F29228] cubicInches];
                                                                        char v75 = [v2 isEqual:v74];

                                                                        if (v75)
                                                                        {
                                                                          v5 = @"cubicInches";
                                                                        }
                                                                        else
                                                                        {
                                                                          v76 = [MEMORY[0x1E4F29228] cubicFeet];
                                                                          char v77 = [v2 isEqual:v76];

                                                                          if (v77)
                                                                          {
                                                                            v5 = @"cubicFeet";
                                                                          }
                                                                          else
                                                                          {
                                                                            v78 = [MEMORY[0x1E4F29228] cubicYards];
                                                                            char v79 = [v2 isEqual:v78];

                                                                            if (v79)
                                                                            {
                                                                              v5 = @"cubicYards";
                                                                            }
                                                                            else
                                                                            {
                                                                              v80 = [MEMORY[0x1E4F29228] cubicMiles];
                                                                              char v81 = [v2 isEqual:v80];

                                                                              if (v81)
                                                                              {
                                                                                v5 = @"cubicMiles";
                                                                              }
                                                                              else
                                                                              {
                                                                                v82 = [MEMORY[0x1E4F29228] acreFeet];
                                                                                char v83 = [v2 isEqual:v82];

                                                                                if (v83)
                                                                                {
                                                                                  v5 = @"acreFeet";
                                                                                }
                                                                                else
                                                                                {
                                                                                  v84 = [MEMORY[0x1E4F29228] bushels];
                                                                                  char v85 = [v2 isEqual:v84];

                                                                                  if (v85)
                                                                                  {
                                                                                    v5 = @"bushels";
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    v86 = [MEMORY[0x1E4F29228] teaspoons];
                                                                                    char v87 = [v2 isEqual:v86];

                                                                                    if (v87)
                                                                                    {
                                                                                      v5 = @"teaspoons";
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v88 = [MEMORY[0x1E4F29228] tablespoons];
                                                                                      char v89 = [v2 isEqual:v88];

                                                                                      if (v89)
                                                                                      {
                                                                                        v5 = @"tablespoons";
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        v90 = [MEMORY[0x1E4F29228] fluidOunces];
                                                                                        char v91 = [v2 isEqual:v90];

                                                                                        if (v91)
                                                                                        {
                                                                                          v5 = @"fluidOunces";
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v92 = [MEMORY[0x1E4F29228] cups];
                                                                                          char v93 = [v2 isEqual:v92];

                                                                                          if (v93)
                                                                                          {
                                                                                            v5 = @"cups";
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v94 = [MEMORY[0x1E4F29228] pints];
                                                                                            char v95 = [v2 isEqual:v94];

                                                                                            if (v95)
                                                                                            {
                                                                                              v5 = @"pints";
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                              v96 = [MEMORY[0x1E4F29228] quarts];
                                                                                              char v97 = [v2 isEqual:v96];

                                                                                              if (v97)
                                                                                              {
                                                                                                v5 = @"quarts";
                                                                                              }
                                                                                              else
                                                                                              {
                                                                                                v98 = [MEMORY[0x1E4F29228] gallons];
                                                                                                char v99 = [v2 isEqual:v98];

                                                                                                if (v99)
                                                                                                {
                                                                                                  v5 = @"gallons";
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                  v100 = [MEMORY[0x1E4F29228] imperialTeaspoons];
                                                                                                  char v101 = [v2 isEqual:v100];

                                                                                                  if (v101)
                                                                                                  {
                                                                                                    v5 = @"imperialTeaspoons";
                                                                                                  }
                                                                                                  else
                                                                                                  {
                                                                                                    v102 = [MEMORY[0x1E4F29228] imperialQuarts];
                                                                                                    char v103 = [v2 isEqual:v102];

                                                                                                    if (v103)
                                                                                                    {
                                                                                                      v5 = @"imperialQuarts";
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                      v104 = [MEMORY[0x1E4F29228] imperialGallons];
                                                                                                      char v105 = [v2 isEqual:v104];

                                                                                                      if (v105)
                                                                                                      {
                                                                                                        v5 = @"imperialGallons";
                                                                                                      }
                                                                                                      else
                                                                                                      {
                                                                                                        v106 = [MEMORY[0x1E4F29228] metricCups];
                                                                                                        char v107 = [v2 isEqual:v106];

                                                                                                        if (v107)
                                                                                                        {
                                                                                                          v5 = @"metricCups";
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                          v108 = [MEMORY[0x1E4F29208] metersPerSecond];
                                                                                                          char v109 = [v2 isEqual:v108];

                                                                                                          if (v109)
                                                                                                          {
                                                                                                            v5 = @"metersPerSecond";
                                                                                                          }
                                                                                                          else
                                                                                                          {
                                                                                                            v110 = [MEMORY[0x1E4F29208] kilometersPerHour];
                                                                                                            char v111 = [v2 isEqual:v110];

                                                                                                            if (v111)
                                                                                                            {
                                                                                                              v5 = @"kilometersPerHour";
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                              v112 = [MEMORY[0x1E4F29208] milesPerHour];
                                                                                                              char v113 = [v2 isEqual:v112];

                                                                                                              if (v113)
                                                                                                              {
                                                                                                                v5 = @"milesPerHour";
                                                                                                              }
                                                                                                              else
                                                                                                              {
                                                                                                                v114 = [MEMORY[0x1E4F29208] knots];
                                                                                                                char v115 = [v2 isEqual:v114];

                                                                                                                if (v115)
                                                                                                                {
                                                                                                                  v5 = @"knots";
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                  v116 = [MEMORY[0x1E4F291B0] kilojoules];
                                                                                                                  char v117 = [v2 isEqual:v116];

                                                                                                                  if (v117)
                                                                                                                  {
                                                                                                                    v5 = @"kilojoules";
                                                                                                                  }
                                                                                                                  else
                                                                                                                  {
                                                                                                                    v118 = [MEMORY[0x1E4F291B0] joules];
                                                                                                                    char v119 = [v2 isEqual:v118];

                                                                                                                    if (v119)
                                                                                                                    {
                                                                                                                      v5 = @"joules";
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                      v120 = [MEMORY[0x1E4F291B0] kilocalories];
                                                                                                                      char v121 = [v2 isEqual:v120];

                                                                                                                      if (v121)
                                                                                                                      {
                                                                                                                        v5 = @"kilocalories";
                                                                                                                      }
                                                                                                                      else
                                                                                                                      {
                                                                                                                        v122 = [MEMORY[0x1E4F291B0] calories];
                                                                                                                        char v123 = [v2 isEqual:v122];

                                                                                                                        if (v123)
                                                                                                                        {
                                                                                                                          v5 = @"calories";
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                          v124 = [MEMORY[0x1E4F291B0] kilowattHours];
                                                                                                                          int v125 = [v2 isEqual:v124];

                                                                                                                          v5 = &stru_1EDA6DB28;
                                                                                                                          if (v125) {
                                                                                                                            v5 = @"kilowattHours";
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
  }
  v132[0] = v5;
  v131[0] = @"unit";
  v131[1] = @"doubleValue";
  v126 = NSNumber;
  [a1 doubleValue];
  v127 = objc_msgSend(v126, "numberWithDouble:");
  v132[1] = v127;
  v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:2];
  v129 = objc_msgSend(v128, "if_dictionaryWithNonEmptyValues");

  return v129;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v15 = 0;
    goto LABEL_130;
  }
  v10 = [v9 objectForKeyedSubscript:@"doubleValue"];
  [v10 doubleValue];
  double v12 = v11;

  char v13 = [v9 objectForKeyedSubscript:@"unit"];
  if ([v13 isEqualToString:@"meters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E0] meters];
  }
  else if ([v13 isEqualToString:@"miles"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E0] miles];
  }
  else if ([v13 isEqualToString:@"centimeters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E0] centimeters];
  }
  else if ([v13 isEqualToString:@"feet"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E0] feet];
  }
  else if ([v13 isEqualToString:@"inches"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E0] inches];
  }
  else if ([v13 isEqualToString:@"yards"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E0] yards];
  }
  else if ([v13 isEqualToString:@"kilometers"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E0] kilometers];
  }
  else if ([v13 isEqualToString:@"celsius"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29218] celsius];
  }
  else if ([v13 isEqualToString:@"fahrenheit"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29218] fahrenheit];
  }
  else if ([v13 isEqualToString:@"kelvin"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29218] kelvin];
  }
  else if ([v13 isEqualToString:@"kilograms"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] kilograms];
  }
  else if ([v13 isEqualToString:@"grams"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] grams];
  }
  else if ([v13 isEqualToString:@"decigrams"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] decigrams];
  }
  else if ([v13 isEqualToString:@"centigrams"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] centigrams];
  }
  else if ([v13 isEqualToString:@"milligrams"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] milligrams];
  }
  else if ([v13 isEqualToString:@"micrograms"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] micrograms];
  }
  else if ([v13 isEqualToString:@"nanograms"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] nanograms];
  }
  else if ([v13 isEqualToString:@"picograms"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] picograms];
  }
  else if ([v13 isEqualToString:@"ounces"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] ounces];
  }
  else if ([v13 isEqualToString:@"poundsMass"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] poundsMass];
  }
  else if ([v13 isEqualToString:@"stones"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] stones];
  }
  else if ([v13 isEqualToString:@"metricTons"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] metricTons];
  }
  else if ([v13 isEqualToString:@"shortTons"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] shortTons];
  }
  else if ([v13 isEqualToString:@"carats"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] carats];
  }
  else if ([v13 isEqualToString:@"ouncesTroy"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] ouncesTroy];
  }
  else if ([v13 isEqualToString:@"slugs"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291E8] slugs];
  }
  else if ([v13 isEqualToString:@"megaliters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] megaliters];
  }
  else if ([v13 isEqualToString:@"kiloliters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] kiloliters];
  }
  else if ([v13 isEqualToString:@"liters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] liters];
  }
  else if ([v13 isEqualToString:@"deciliters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] deciliters];
  }
  else if ([v13 isEqualToString:@"centiliters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] centiliters];
  }
  else if ([v13 isEqualToString:@"milliliters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] milliliters];
  }
  else if ([v13 isEqualToString:@"cubicKilometers"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] cubicKilometers];
  }
  else if ([v13 isEqualToString:@"cubicDecimeters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] cubicDecimeters];
  }
  else if ([v13 isEqualToString:@"cubicMillimeters"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] cubicMillimeters];
  }
  else if ([v13 isEqualToString:@"cubicInches"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] cubicInches];
  }
  else if ([v13 isEqualToString:@"cubicFeet"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] cubicFeet];
  }
  else if ([v13 isEqualToString:@"cubicYards"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] cubicYards];
  }
  else if ([v13 isEqualToString:@"cubicMiles"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] cubicMiles];
  }
  else if ([v13 isEqualToString:@"acreFeet"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] acreFeet];
  }
  else if ([v13 isEqualToString:@"bushels"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] bushels];
  }
  else if ([v13 isEqualToString:@"teaspoons"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] teaspoons];
  }
  else if ([v13 isEqualToString:@"tablespoons"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] tablespoons];
  }
  else if ([v13 isEqualToString:@"fluidOunces"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] fluidOunces];
  }
  else if ([v13 isEqualToString:@"cups"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] cups];
  }
  else if ([v13 isEqualToString:@"pints"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] pints];
  }
  else if ([v13 isEqualToString:@"quarts"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] quarts];
  }
  else if ([v13 isEqualToString:@"gallons"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] gallons];
  }
  else if ([v13 isEqualToString:@"imperialTeaspoons"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] imperialTeaspoons];
  }
  else if ([v13 isEqualToString:@"imperialQuarts"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] imperialQuarts];
  }
  else if ([v13 isEqualToString:@"imperialGallons"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] imperialGallons];
  }
  else if ([v13 isEqualToString:@"metricCups"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29228] metricCups];
  }
  else if ([v13 isEqualToString:@"metersPerSecond"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29208] metersPerSecond];
  }
  else if ([v13 isEqualToString:@"kilometersPerHour"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29208] kilometersPerHour];
  }
  else if ([v13 isEqualToString:@"milesPerHour"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29208] milesPerHour];
  }
  else if ([v13 isEqualToString:@"knots"])
  {
    uint64_t v14 = [MEMORY[0x1E4F29208] knots];
  }
  else if ([v13 isEqualToString:@"kilojoules"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291B0] kilojoules];
  }
  else if ([v13 isEqualToString:@"joules"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291B0] joules];
  }
  else if ([v13 isEqualToString:@"kilocalories"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291B0] kilocalories];
  }
  else if ([v13 isEqualToString:@"calories"])
  {
    uint64_t v14 = [MEMORY[0x1E4F291B0] calories];
  }
  else
  {
    if (![v13 isEqualToString:@"kilowattHours"])
    {
LABEL_128:
      char v15 = 0;
      goto LABEL_129;
    }
    uint64_t v14 = [MEMORY[0x1E4F291B0] kilowattHours];
  }
  v16 = (void *)v14;
  if (!v14) {
    goto LABEL_128;
  }
  char v15 = (void *)[objc_alloc(MEMORY[0x1E4F28E28]) initWithDoubleValue:v14 unit:v12];

LABEL_129:
LABEL_130:

  return v15;
}

@end
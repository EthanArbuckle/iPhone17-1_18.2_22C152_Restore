@interface HKCorrelation(WFNaming)
- (id)wfName;
@end

@implementation HKCorrelation(WFNaming)

- (id)wfName
{
  v2 = [a1 correlationType];
  v3 = [v2 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x263F094C0]];

  if (v4)
  {
    v5 = [MEMORY[0x263F0A6E8] quantityTypeForIdentifier:*MEMORY[0x263F09C28]];
    v6 = [a1 objectsForType:v5];
    v7 = [v6 anyObject];

    v8 = [MEMORY[0x263F0A6E8] quantityTypeForIdentifier:*MEMORY[0x263F09C20]];
    v9 = [a1 objectsForType:v8];
    v10 = [v9 anyObject];

    v11 = [v7 quantity];
    v12 = [MEMORY[0x263F0A830] millimeterOfMercuryUnit];
    [v11 doubleValueForUnit:v12];
    uint64_t v14 = v13;

    v15 = [v10 quantity];
    v16 = [MEMORY[0x263F0A830] millimeterOfMercuryUnit];
    [v15 doubleValueForUnit:v16];
    uint64_t v18 = v17;

    v19 = NSString;
    if (v7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%g", v14);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v10) {
        goto LABEL_4;
      }
    }
    else
    {
      v20 = @"--";
      if (v10)
      {
LABEL_4:
        v21 = objc_msgSend(NSString, "stringWithFormat:", @"%g", v18);
        v22 = [v19 stringWithFormat:@"%@/%@", v20, v21];

        if (!v7)
        {
LABEL_6:

          goto LABEL_8;
        }
LABEL_5:

        goto LABEL_6;
      }
    }
    v22 = [v19 stringWithFormat:@"%@/%@", v20, @"--"];
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v24.receiver = a1;
  v24.super_class = (Class)&off_26F0CC460;
  v22 = objc_msgSendSuper2(&v24, sel_wfName);
LABEL_8:
  return v22;
}

@end
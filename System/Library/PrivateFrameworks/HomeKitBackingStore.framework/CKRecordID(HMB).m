@interface CKRecordID(HMB)
+ (id)recordIDFromExternalID:()HMB error:;
- (id)externalID:()HMB;
@end

@implementation CKRecordID(HMB)

- (id)externalID:()HMB
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"r";
  v5 = [a1 recordName];
  v14[0] = v5;
  v13[1] = @"z";
  v6 = [a1 zoneID];
  v7 = [v6 zoneName];
  v14[1] = v7;
  v13[2] = @"u";
  v8 = [a1 zoneID];
  v9 = [v8 ownerName];
  v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  v11 = [v10 hmbOPACKDataFromDictionaryWithError:a3];

  return v11;
}

+ (id)recordIDFromExternalID:()HMB error:
{
  v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hmbDictionaryFromOPACKData:error:");
  v6 = v5;
  if (v5)
  {
    v7 = [v5 objectForKey:@"u"];
    v8 = [v6 objectForKey:@"z"];
    uint64_t v9 = [v6 objectForKey:@"r"];
    v10 = (void *)v9;
    if (v7) {
      BOOL v11 = v8 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11 || v9 == 0)
    {
      if (a4)
      {
        [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
        v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F1A320]) initWithZoneName:v8 ownerName:v7];
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v10 zoneID:v13];
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
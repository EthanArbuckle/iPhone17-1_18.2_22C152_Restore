@interface CKRecord(HMB)
+ (id)recordFromExternalData:()HMB error:;
- (id)externalData:()HMB;
- (id)externalID:()HMB;
- (id)hmbDescription;
- (id)hmbObjectForKey:()HMB encrypted:;
- (void)hmbSetObject:()HMB forKey:encrypted:;
@end

@implementation CKRecord(HMB)

- (id)hmbObjectForKey:()HMB encrypted:
{
  id v6 = a3;
  if (a4)
  {
    v7 = [a1 encryptedValuesByKey];
    v8 = [v7 objectForKey:v6];

    id v6 = v7;
  }
  else
  {
    v8 = [a1 objectForKey:v6];
  }

  return v8;
}

- (void)hmbSetObject:()HMB forKey:encrypted:
{
  id v8 = a4;
  id v9 = a3;
  id v11 = v9;
  if (a5)
  {
    v10 = [a1 encryptedValuesByKey];
    [v10 setObject:v11 forKey:v8];

    id v8 = v11;
    id v11 = v10;
  }
  else
  {
    [a1 setObject:v9 forKey:v8];
  }
}

- (id)externalID:()HMB
{
  v4 = [a1 recordID];
  v5 = [v4 externalID:a3];

  return v5;
}

- (id)externalData:()HMB
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [a1 encodeSystemFieldsWithCoder:v5];
  [v5 finishEncoding];
  if (a3)
  {
    *a3 = [v5 error];
  }
  id v6 = [v5 encodedData];

  return v6;
}

- (id)hmbDescription
{
  v2 = NSString;
  v3 = [a1 recordID];
  v4 = [v3 hmbDescription];
  v5 = [a1 recordChangeTag];
  id v6 = [a1 modifiedByDevice];
  v7 = [a1 modificationDate];
  id v8 = [v2 stringWithFormat:@"%@/%@/%@/%@", v4, v5, v6, v7];

  return v8;
}

+ (id)recordFromExternalData:()HMB error:
{
  v5 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  id v15 = 0;
  v7 = (void *)[[v5 alloc] initForReadingFromData:v6 error:&v15];

  id v8 = v15;
  id v9 = v8;
  if (v7)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithCoder:v7];
    [v7 finishDecoding];
    if (v10)
    {
      id v11 = v10;
    }
    else if (a4)
    {
      v12 = [v7 error];

      if (v12) {
        [v7 error];
      }
      else {
      *a4 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      }
    }
  }
  else
  {
    if (a4)
    {
      if (v8)
      {
        v10 = 0;
        *a4 = v8;
        goto LABEL_15;
      }
      id v13 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
      *a4 = v13;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

@end
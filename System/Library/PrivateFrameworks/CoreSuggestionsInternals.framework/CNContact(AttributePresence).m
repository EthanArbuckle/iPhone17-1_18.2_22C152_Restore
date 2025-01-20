@interface CNContact(AttributePresence)
- (uint64_t)hasEmailAddress:()AttributePresence;
- (uint64_t)hasPhoneNumber:()AttributePresence;
- (uint64_t)hasPostalAddress:()AttributePresence;
@end

@implementation CNContact(AttributePresence)

- (uint64_t)hasPostalAddress:()AttributePresence
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 isKeyAvailable:*MEMORY[0x1E4F1AF10]] && objc_msgSend(v4, "length"))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = objc_msgSend(a1, "postalAddresses", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = 1;
LABEL_5:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) value];
        v12 = SGNormalizeCNAddress(v11);
        char v13 = SGPostalAddressesMatchWithParsed(v4, v12, 0, 0, 0, 0, 1);

        if (v13) {
          break;
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)hasEmailAddress:()AttributePresence
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![a1 isKeyAvailable:*MEMORY[0x1E4F1ADC8]])
  {
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  v5 = [a1 emailAddresses];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
LABEL_14:
    uint64_t v7 = v4;
    goto LABEL_18;
  }
  uint64_t v7 = SGNormalizeEmailAddress();

  if ([v7 length])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = objc_msgSend(a1, "emailAddresses", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          char v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) value];
          v14 = SGNormalizeEmailAddress();
          char v15 = [v7 isEqualToString:v14];

          if (v15)
          {
            uint64_t v6 = 1;
            goto LABEL_16;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v6 = 0;
LABEL_16:
  }
  else
  {
    uint64_t v6 = 0;
  }
LABEL_18:

  return v6;
}

- (uint64_t)hasPhoneNumber:()AttributePresence
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![a1 isKeyAvailable:*MEMORY[0x1E4F1AEE0]]) {
    goto LABEL_13;
  }
  v5 = [a1 phoneNumbers];
  uint64_t v6 = [v5 count];

  if (!v6) {
    goto LABEL_16;
  }
  if (![v4 length])
  {
LABEL_13:
    uint64_t v6 = 0;
    goto LABEL_16;
  }
  uint64_t v7 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = objc_msgSend(a1, "phoneNumbers", 0);
  uint64_t v6 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v8);
        }
        uint64_t v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) value];
        char v12 = [v11 isLikePhoneNumber:v7];

        if (v12)
        {
          uint64_t v6 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

LABEL_16:
  return v6;
}

@end
@interface AVMediaSelectionOption(MediaPlayer)
- (uint64_t)mpIsOnlyAC3;
- (uint64_t)mpIsSDH;
@end

@implementation AVMediaSelectionOption(MediaPlayer)

- (uint64_t)mpIsSDH
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F15B30];
  v18[0] = *MEMORY[0x1E4F15B90];
  v18[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v4 = [a1 mediaType];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F15C00]];

  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!objc_msgSend(a1, "hasMediaCharacteristic:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13))
          {
            uint64_t v11 = 0;
            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v11 = 1;
  }

  return v11;
}

- (uint64_t)mpIsOnlyAC3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 mediaSubTypes];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = objc_msgSend(a1, "mediaSubTypes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) unsignedIntValue];
        if (v9 > 1902207794)
        {
          if (v9 != 2053202739 && v9 != 1902207795)
          {
LABEL_22:
            uint64_t v12 = 0;
            goto LABEL_23;
          }
        }
        else if (v9 != 1633889587 && v9 != 1885430579)
        {
          goto LABEL_22;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 1;
LABEL_23:

  return v12;
}

@end
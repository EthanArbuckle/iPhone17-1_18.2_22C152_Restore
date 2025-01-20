@interface TLToneManager(BulletinBoard)
- (BOOL)bb_isToneEnabledForSectionInfo:()BulletinBoard;
- (id)bb_toneIdentifierForAlertConfiguration:()BulletinBoard;
- (uint64_t)bb_isToneEnabledForAlertConfiguration:()BulletinBoard;
- (uint64_t)bb_isToneEnabledForAlertType:()BulletinBoard topic:;
@end

@implementation TLToneManager(BulletinBoard)

- (BOOL)bb_isToneEnabledForSectionInfo:()BulletinBoard
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x263F7FC68];
  v6 = [v4 sectionID];
  uint64_t v7 = objc_msgSend(v5, "bb_toneLibraryAlertTypeForSectionID:", v6);

  if (v7)
  {
    v8 = [v4 subsections];
    if ([v8 count])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v13), "subsectionID", (void)v19);
            char v15 = objc_msgSend(a1, "bb_isToneEnabledForAlertType:topic:", v7, v14);

            if (v15)
            {
              int v16 = 1;
              goto LABEL_14;
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      int v16 = 0;
LABEL_14:
    }
    else
    {
      int v16 = objc_msgSend(a1, "bb_isToneEnabledForAlertType:topic:", v7, 0);
    }

    BOOL v17 = v16 != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (uint64_t)bb_isToneEnabledForAlertType:()BulletinBoard topic:
{
  v1 = objc_msgSend(a1, "currentToneIdentifierForAlertType:topic:");
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F7FD70]] ^ 1;

  return v2;
}

- (id)bb_toneIdentifierForAlertConfiguration:()BulletinBoard
{
  id v4 = a3;
  v5 = [v4 toneIdentifier];
  if (![v5 length])
  {
    uint64_t v6 = [v4 type];
    uint64_t v7 = [v4 topic];
    uint64_t v8 = [a1 currentToneIdentifierForAlertType:v6 topic:v7];

    v5 = (void *)v8;
  }

  return v5;
}

- (uint64_t)bb_isToneEnabledForAlertConfiguration:()BulletinBoard
{
  v1 = objc_msgSend(a1, "bb_toneIdentifierForAlertConfiguration:");
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x263F7FD70]] ^ 1;

  return v2;
}

@end
@interface VCEncryptionRules
+ (id)supportedCipherSuitesForStreamGroupID:(unsigned int)a3 isOneToOne:(BOOL)a4;
@end

@implementation VCEncryptionRules

+ (id)supportedCipherSuitesForStreamGroupID:(unsigned int)a3 isOneToOne:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
  v7 = v6;
  v8 = &unk_1F3DC40C8;
  if ((int)a3 > 1835623281)
  {
    if ((int)a3 > 1935897188)
    {
      if (a3 != 1937339233)
      {
        int v9 = 1935897189;
        goto LABEL_13;
      }
    }
    else if (a3 != 1835623282)
    {
      if (a3 != 1835623287) {
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (v4)
    {
      v10 = &unk_1F3DC7608;
      goto LABEL_18;
    }
LABEL_19:
    v8 = &unk_1F3DC40E0;
    goto LABEL_20;
  }
  if ((int)a3 <= 1667329398)
  {
    if (a3 == 1650745716)
    {
LABEL_14:
      if (v4)
      {
        v10 = &unk_1F3DC75F0;
LABEL_18:
        [v6 addObjectsFromArray:v10];
        goto LABEL_19;
      }
      goto LABEL_19;
    }
    int v9 = 1667329381;
LABEL_13:
    if (a3 != v9) {
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if (a3 != 1667329399)
  {
    int v9 = 1718909044;
    goto LABEL_13;
  }
LABEL_20:
  [v7 addObject:v8];
  return v7;
}

@end
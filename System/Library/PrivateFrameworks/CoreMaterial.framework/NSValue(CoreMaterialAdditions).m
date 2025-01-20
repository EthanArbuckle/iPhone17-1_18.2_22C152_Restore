@interface NSValue(CoreMaterialAdditions)
+ (id)mt_identityValueForFilter:()CoreMaterialAdditions;
+ (id)mt_identityValueForMaterialSettingsProperty:()CoreMaterialAdditions;
- (uint64_t)mt_isIdentityValueForFilter:()CoreMaterialAdditions;
- (uint64_t)mt_isIdentityValueForMaterialSettingsProperty:()CoreMaterialAdditions;
@end

@implementation NSValue(CoreMaterialAdditions)

+ (id)mt_identityValueForMaterialSettingsProperty:()CoreMaterialAdditions
{
  id v4 = a3;
  if ([v4 isEqualToString:@"luminanceAmount"])
  {
    v5 = (id *)MEMORY[0x1E4F3A268];
  }
  else if ([v4 isEqualToString:@"blurRadius"])
  {
    v5 = (id *)MEMORY[0x1E4F3A0D0];
  }
  else if ([v4 isEqualToString:@"saturation"])
  {
    v5 = (id *)MEMORY[0x1E4F3A048];
  }
  else if ([v4 isEqualToString:@"brightness"])
  {
    v5 = (id *)MEMORY[0x1E4F3A000];
  }
  else
  {
    if (([v4 isEqualToString:@"colorMatrix"] & 1) == 0)
    {

      goto LABEL_14;
    }
    v5 = (id *)MEMORY[0x1E4F3A038];
  }
  id v6 = *v5;

  if (v6)
  {
    v7 = objc_msgSend(a1, "mt_identityValueForFilter:", v6);
    goto LABEL_19;
  }
LABEL_14:
  if ([v4 isEqualToString:@"backdropScale"])
  {
    id v6 = 0;
    v7 = &unk_1F06A5570;
  }
  else if (([v4 isEqualToString:@"averageColorEnabled"] & 1) != 0 {
         || ([v4 isEqualToString:@"blurAtEnd"] & 1) != 0)
  }
  {
    id v6 = 0;
    v7 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
    v7 = &unk_1F06A54B0;
    if ([v4 isEqualToString:@"tintAlpha"])
    {
      id v6 = 0;
    }
    else
    {
      id v6 = 0;
      if (![v4 isEqualToString:@"zoom"]) {
        v7 = 0;
      }
    }
  }
LABEL_19:

  return v7;
}

+ (id)mt_identityValueForFilter:()CoreMaterialAdditions
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F3A048]])
  {
    id v4 = &unk_1F06A5570;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F3A038]])
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 48);
    v10[2] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 32);
    v10[3] = v5;
    v10[4] = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 64);
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F39AD8] + 16);
    v10[0] = *MEMORY[0x1E4F39AD8];
    v10[1] = v6;
    id v4 = [MEMORY[0x1E4F29238] valueWithBytes:v10 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
  }
  else
  {
    id v4 = 0;
  }
  if (v4) {
    v7 = v4;
  }
  else {
    v7 = &unk_1F06A54B0;
  }
  id v8 = v7;

  return v8;
}

- (uint64_t)mt_isIdentityValueForMaterialSettingsProperty:()CoreMaterialAdditions
{
  id v4 = a3;
  long long v5 = objc_msgSend((id)objc_opt_class(), "mt_identityValueForMaterialSettingsProperty:", v4);

  uint64_t v6 = [a1 isEqual:v5];
  return v6;
}

- (uint64_t)mt_isIdentityValueForFilter:()CoreMaterialAdditions
{
  id v4 = a3;
  long long v5 = objc_msgSend((id)objc_opt_class(), "mt_identityValueForFilter:", v4);

  uint64_t v6 = [a1 isEqual:v5];
  return v6;
}

@end
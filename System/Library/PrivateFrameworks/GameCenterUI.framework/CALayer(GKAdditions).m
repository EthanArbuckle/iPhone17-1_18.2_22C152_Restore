@interface CALayer(GKAdditions)
- (id)_gkDescriptionWithChildren:()GKAdditions;
- (uint64_t)_gkRecursiveDescription;
- (void)_gkParentSublayerTransform;
@end

@implementation CALayer(GKAdditions)

- (id)_gkDescriptionWithChildren:()GKAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = _gkTabStringForTabLevel();
  v6 = [MEMORY[0x1E4F28E78] string];
  v7 = [a1 debugDescription];
  [v6 appendFormat:@"%@%@\n", v5, v7];

  v8 = [a1 sublayers];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    uint64_t v12 = a3 + 1;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v14 = [*(id *)(*((void *)&v17 + 1) + 8 * i) _gkDescriptionWithChildren:v12];
        [v6 appendString:v14];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  id v15 = (id)_gkUnicodifyDescription();

  return v6;
}

- (uint64_t)_gkRecursiveDescription
{
  return [a1 _gkDescriptionWithChildren:0];
}

- (void)_gkParentSublayerTransform
{
  v3 = [a1 superlayer];
  if (v3)
  {
    uint64_t v9 = v3;
    [v3 sublayerTransform];
    v3 = v9;
  }
  else
  {
    v4 = (_OWORD *)MEMORY[0x1E4F39B10];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    a2[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    a2[5] = v5;
    long long v6 = v4[7];
    a2[6] = v4[6];
    a2[7] = v6;
    long long v7 = v4[1];
    *a2 = *v4;
    a2[1] = v7;
    long long v8 = v4[3];
    a2[2] = v4[2];
    a2[3] = v8;
  }
}

@end
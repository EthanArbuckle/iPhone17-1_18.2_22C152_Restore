@interface GEOTrail(MUExtras)
- (id)_mapsui_createCombinedTrailTypeAndLengthFactoid;
- (id)factoidWithSemantic:()MUExtras;
- (uint64_t)_mapsui_hikingDifficultyFactoid;
@end

@implementation GEOTrail(MUExtras)

- (uint64_t)_mapsui_hikingDifficultyFactoid
{
  return [a1 factoidWithSemantic:2];
}

- (id)_mapsui_createCombinedTrailTypeAndLengthFactoid
{
  v2 = [a1 factoidWithSemantic:4];
  uint64_t v3 = [a1 factoidWithSemantic:3];
  v4 = (void *)v3;
  v5 = 0;
  if (v2 && v3) {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F64460]) initWithLabelFactoid:v2 iconFactoid:v3];
  }

  return v5;
}

- (id)factoidWithSemantic:()MUExtras
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = objc_msgSend(a1, "factoids", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 semantic] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

@end
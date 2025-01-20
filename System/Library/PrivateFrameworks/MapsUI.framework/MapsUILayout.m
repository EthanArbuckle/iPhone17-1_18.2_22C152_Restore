@interface MapsUILayout
+ (id)_buildAttributedDisplayStringForComponents:(id)a3 isRTL:(BOOL)a4;
+ (id)buildAttributedDisplayStringForComponents:(id)a3;
+ (id)buildAttributedDisplayStringForComponents:(id)a3 forContainingView:(id)a4;
+ (id)buildAttributedDisplayStringForComponents:(id)a3 reverseIfRTLLayout:(BOOL)a4;
@end

@implementation MapsUILayout

+ (id)buildAttributedDisplayStringForComponents:(id)a3 forContainingView:(id)a4
{
  id v6 = a3;
  v7 = objc_msgSend(a1, "_buildAttributedDisplayStringForComponents:isRTL:", v6, objc_msgSend(a4, "effectiveUserInterfaceLayoutDirection") == 1);

  return v7;
}

+ (id)buildAttributedDisplayStringForComponents:(id)a3
{
  return (id)[a1 buildAttributedDisplayStringForComponents:a3 reverseIfRTLLayout:1];
}

+ (id)buildAttributedDisplayStringForComponents:(id)a3 reverseIfRTLLayout:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    BOOL v4 = [v7 userInterfaceLayoutDirection] == 1;
  }
  v8 = [a1 _buildAttributedDisplayStringForComponents:v6 isRTL:v4];

  return v8;
}

+ (id)_buildAttributedDisplayStringForComponents:(id)a3 isRTL:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (a4) {
    [v5 reverseObjectEnumerator];
  }
  else {
  v7 = [v5 objectEnumerator];
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "appendAttributedString:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v14 = (void *)[v8 copy];
  return v14;
}

@end
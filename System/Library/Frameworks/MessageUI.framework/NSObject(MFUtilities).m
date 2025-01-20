@interface NSObject(MFUtilities)
- (id)mf_objectWithHighest:()MFUtilities;
@end

@implementation NSObject(MFUtilities)

- (id)mf_objectWithHighest:()MFUtilities
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = a1;
  v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    double v9 = NAN;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      char v16 = 0;
      v4[2](v4, v11, &v16);
      if (v16) {
        break;
      }
      double v13 = v12;
      if (!v6 || v12 > v9)
      {
        id v14 = v11;

        v6 = v14;
        double v9 = v13;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v6;
}

@end
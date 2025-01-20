@interface EMFContextBuilderLeftHand
- (void)enumerateWindowsForContext:(id)a3 range:(_NSRange)a4 searchAnchors:(id)a5 usingBlock:(id)a6;
@end

@implementation EMFContextBuilderLeftHand

- (void)enumerateWindowsForContext:(id)a3 range:(_NSRange)a4 searchAnchors:(id)a5 usingBlock:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v27 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t, char *))a6;
  char v32 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v9;
  uint64_t v26 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v29;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v29 != v25) {
        objc_enumerationMutation(obj);
      }
      if (v32) {
        break;
      }
      uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * v10);
      uint64_t v12 = objc_msgSend(v8, "rangeOfString:options:range:locale:", v11, 1, a4.location, a4.length, 0);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = v12;
        uint64_t v15 = v13;
        uint64_t v16 = 0;
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          uint64_t v18 = v17 + v16;
          BOOL v19 = v17 == 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v17 = v14;
          uint64_t v20 = v14 - v18;
          if (v19) {
            uint64_t v20 = kEMFContextBuilderContextWindowLengthDefault;
          }
          uint64_t v21 = (v14 - v20) & ~((v14 - v20) >> 63);
          if (v14 - v21 >= 1 && v14 - v21 < (unint64_t)[v8 length]) {
            v27[2](v27, v21, v14 - v21, v14, v15, &v32);
          }
          uint64_t v14 = objc_msgSend(v8, "rangeOfString:options:range:locale:", v11, 1, v14 + v15, objc_msgSend(v8, "length") - (v14 + v15), 0);
          uint64_t v16 = v15;
          uint64_t v15 = v22;
        }
        while (v14 != 0x7FFFFFFFFFFFFFFFLL);
      }
      if (++v10 == v26)
      {
        uint64_t v26 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v26) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

@end
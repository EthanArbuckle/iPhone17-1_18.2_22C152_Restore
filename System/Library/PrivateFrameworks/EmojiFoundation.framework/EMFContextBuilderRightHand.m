@interface EMFContextBuilderRightHand
- (void)enumerateWindowsForContext:(id)a3 range:(_NSRange)a4 searchAnchors:(id)a5 usingBlock:(id)a6;
@end

@implementation EMFContextBuilderRightHand

- (void)enumerateWindowsForContext:(id)a3 range:(_NSRange)a4 searchAnchors:(id)a5 usingBlock:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = (void (**)(id, uint64_t, unint64_t, uint64_t, uint64_t, char *))a6;
  char v31 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v9;
  uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v28;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v28 != v24) {
        objc_enumerationMutation(obj);
      }
      if (v31) {
        break;
      }
      uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * v11);
      uint64_t v13 = objc_msgSend(v8, "rangeOfString:options:range:locale:", v12, 1, a4.location, a4.length, 0);
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v15 = v13;
        uint64_t v16 = v14;
        NSUInteger location = a4.location;
        NSUInteger length = a4.length;
        do
        {
          unint64_t v19 = v15 + v16;
          if (v15 + v16 < 0) {
            goto LABEL_16;
          }
          uint64_t v20 = kEMFContextBuilderContextWindowLengthDefault;
          if (v19 >= [v8 length]) {
            goto LABEL_16;
          }
          unint64_t v21 = v20 + v19;
          if (v20 + v19 >= location + length) {
            unint64_t v21 = location + length;
          }
          v10[2](v10, v15 + v16, v21 - v19, v15, v16, &v31);
          NSUInteger length = [v8 length] - v19;
          uint64_t v15 = objc_msgSend(v8, "rangeOfString:options:range:locale:", v12, 1, v15 + v16, length, 0);
          uint64_t v16 = v22;
          NSUInteger location = v19;
        }
        while (v15 != 0x7FFFFFFFFFFFFFFFLL);
      }
      if (++v11 == v23)
      {
        uint64_t v23 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v23) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
LABEL_16:
}

@end
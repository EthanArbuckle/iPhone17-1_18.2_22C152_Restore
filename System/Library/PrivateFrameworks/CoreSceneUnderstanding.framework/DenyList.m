@interface DenyList
- (BOOL)checkIfCaptionInDenylist:(id)a3;
- (NSArray)denyListRules;
- (void)setDenyListRules:(id)a3;
@end

@implementation DenyList

- (BOOL)checkIfCaptionInDenylist:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9 = objc_msgSend_denyListRules(self, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_count(v9, v10, v11, v12, v13);

  if (v14)
  {
    uint64_t v19 = objc_msgSend_length(v4, v15, v16, v17, v18);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v24 = objc_msgSend_denyListRules(self, v20, v21, v22, v23, 0);
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v31, (uint64_t)v35, 16);
    if (v27)
    {
      uint64_t v28 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(v24);
          }
          if (objc_msgSend_rangeOfFirstMatchInString_options_range_(*(void **)(*((void *)&v31 + 1) + 8 * i), v26, (uint64_t)v4, 0, 0, v19) != 0x7FFFFFFFFFFFFFFFLL)
          {
            LOBYTE(v14) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v26, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v27) {
          continue;
        }
        break;
      }
    }
    LOBYTE(v14) = 0;
LABEL_12:
  }
  return v14;
}

- (NSArray)denyListRules
{
  return self->denyListRules;
}

- (void)setDenyListRules:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
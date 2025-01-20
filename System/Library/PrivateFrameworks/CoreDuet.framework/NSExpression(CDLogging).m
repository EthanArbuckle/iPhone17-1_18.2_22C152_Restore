@interface NSExpression(CDLogging)
- (uint64_t)cd_containsSensitiveKeyPath;
@end

@implementation NSExpression(CDLogging)

- (uint64_t)cd_containsSensitiveKeyPath
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 expressionType];
  switch(v2)
  {
    case 4:
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      v3 = objc_msgSend(a1, "arguments", 0);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v12;
LABEL_9:
        uint64_t v7 = 0;
        while (1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v7), "cd_containsSensitiveKeyPath")) {
            goto LABEL_6;
          }
          if (v5 == ++v7)
          {
            uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
            if (v5) {
              goto LABEL_9;
            }
            goto LABEL_15;
          }
        }
      }
      goto LABEL_15;
    case 3:
      v8 = [a1 keyPath];
      char v9 = _DKStringContainsPrivacySensitiveMetadataKey(v8);

      if (v9) {
        return 1;
      }
      break;
    case 0:
      v3 = [a1 constantValue];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (_DKStringContainsPrivacySensitiveMetadataKey(v3))
      {
LABEL_6:

        return 1;
      }
LABEL_15:

      break;
  }
  return 0;
}

@end
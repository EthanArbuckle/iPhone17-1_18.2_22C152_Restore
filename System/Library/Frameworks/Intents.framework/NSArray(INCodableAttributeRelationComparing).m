@interface NSArray(INCodableAttributeRelationComparing)
- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:;
@end

@implementation NSArray(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6 = a3;
  uint64_t v7 = 0;
  switch(a4)
  {
    case 1:
      uint64_t v7 = 1;
      break;
    case 2:
      uint64_t v7 = [a1 isEqual:v6];
      break;
    case 3:
      uint64_t v7 = [a1 isEqual:v6] ^ 1;
      break;
    case 9:
      v8 = [MEMORY[0x1E4F1CAD0] setWithArray:a1];
      v9 = (void *)MEMORY[0x1E4F1CAD0];
      id v10 = v6;
      if (v10)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
      id v15 = v11;

      v16 = [v9 setWithArray:v15];

      uint64_t v7 = [v8 isSubsetOfSet:v16];
      goto LABEL_17;
    case 10:
      v8 = [MEMORY[0x1E4F1CAD0] setWithArray:a1];
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      id v13 = v6;
      if (v13)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
      id v17 = v14;

      v16 = [v12 setWithArray:v17];

      uint64_t v7 = [v8 isSubsetOfSet:v16] ^ 1;
LABEL_17:

      break;
    default:
      break;
  }

  return v7;
}

@end
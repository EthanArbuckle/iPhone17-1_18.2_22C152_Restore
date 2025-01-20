@interface NSNumber(INCodableAttributeRelationComparing)
- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:;
@end

@implementation NSNumber(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 1:
      uint64_t v8 = 1;
      break;
    case 2:
    case 9:
      uint64_t v8 = [a1 isEqual:v6];
      break;
    case 3:
    case 10:
      uint64_t v8 = [a1 isEqual:v6] ^ 1;
      break;
    case 4:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v9 = v7;
        }
        else {
          v9 = 0;
        }
      }
      else
      {
        v9 = 0;
      }
      id v14 = v9;
      uint64_t v15 = [a1 compare:v14];

      BOOL v16 = v15 == 1;
      goto LABEL_33;
    case 5:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v10 = v7;
        }
        else {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
      id v17 = v10;
      if ([a1 compare:v17] == 1) {
        goto LABEL_30;
      }
      goto LABEL_38;
    case 6:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11 = v7;
        }
        else {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
      id v18 = v11;
      uint64_t v19 = [a1 compare:v18];

      BOOL v16 = v19 == -1;
LABEL_33:
      uint64_t v8 = v16;
      break;
    case 7:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = v7;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v17 = v12;
      if ([a1 compare:v17] == -1) {
LABEL_30:
      }
        uint64_t v8 = 1;
      else {
LABEL_38:
      }
        uint64_t v8 = [a1 isEqual:v7];
      goto LABEL_46;
    case 8:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v13 = v7;
        }
        else {
          v13 = 0;
        }
      }
      else
      {
        v13 = 0;
      }
      id v17 = v13;
      if ([v17 count] == 2)
      {
        v20 = [v17 firstObject];
        v21 = [v17 lastObject];
        if (objc_msgSend(a1, "_intents_compareValue:relation:", v20, 5)) {
          uint64_t v8 = objc_msgSend(a1, "_intents_compareValue:relation:", v21, 7);
        }
        else {
          uint64_t v8 = 0;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
LABEL_46:

      break;
    default:
      uint64_t v8 = 0;
      break;
  }

  return v8;
}

@end
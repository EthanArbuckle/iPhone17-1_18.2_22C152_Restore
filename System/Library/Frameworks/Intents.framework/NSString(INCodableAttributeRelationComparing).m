@interface NSString(INCodableAttributeRelationComparing)
- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:;
@end

@implementation NSString(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 1:
      uint64_t v8 = 1;
      goto LABEL_67;
    case 2:
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
      id v18 = v9;
      v19 = a1;
      id v20 = v18;
      goto LABEL_57;
    case 3:
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
      id v21 = v10;
      int v22 = [a1 isEqualToString:v21];
      goto LABEL_66;
    case 4:
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
      id v23 = v11;
      uint64_t v24 = [a1 compare:v23];

      BOOL v25 = v24 == 1;
      goto LABEL_51;
    case 5:
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
      id v18 = v12;
      if ([a1 compare:v18] == 1) {
        goto LABEL_48;
      }
      goto LABEL_56;
    case 6:
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
      id v26 = v13;
      uint64_t v27 = [a1 compare:v26];

      BOOL v25 = v27 == -1;
LABEL_51:
      uint64_t v8 = v25;
      goto LABEL_67;
    case 7:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v14 = v7;
        }
        else {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
      id v18 = v14;
      if ([a1 compare:v18] == -1)
      {
LABEL_48:
        uint64_t v8 = 1;
      }
      else
      {
LABEL_56:
        v19 = a1;
        id v20 = v7;
LABEL_57:
        uint64_t v28 = [v19 isEqualToString:v20];
LABEL_62:
        uint64_t v8 = v28;
      }

LABEL_67:
      return v8;
    case 8:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v15 = v7;
        }
        else {
          v15 = 0;
        }
      }
      else
      {
        v15 = 0;
      }
      id v18 = v15;
      uint64_t v28 = [v18 containsObject:a1];
      goto LABEL_62;
    case 9:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v16 = v7;
        }
        else {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
      id v18 = v16;
      uint64_t v28 = [a1 containsString:v18];
      goto LABEL_62;
    case 10:
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v17 = v7;
        }
        else {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v21 = v17;
      int v22 = [a1 containsString:v21];
LABEL_66:
      int v29 = v22;

      uint64_t v8 = v29 ^ 1u;
      goto LABEL_67;
    default:
      uint64_t v8 = 0;
      goto LABEL_67;
  }
}

@end
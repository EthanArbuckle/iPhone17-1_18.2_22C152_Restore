@interface NSObject(INCodableAttributeRelationComparing)
- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:;
@end

@implementation NSObject(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6 = a3;
  v7 = v6;
  uint64_t v8 = 0;
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
    case 8:
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
      id v10 = v9;
      uint64_t v8 = [v10 containsObject:a1];

      break;
    default:
      break;
  }

  return v8;
}

@end
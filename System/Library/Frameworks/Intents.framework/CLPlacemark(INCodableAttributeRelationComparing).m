@interface CLPlacemark(INCodableAttributeRelationComparing)
- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:;
@end

@implementation CLPlacemark(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v12 = v8;

    uint64_t v13 = [v12 name];
LABEL_16:
    v11 = (void *)v13;

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v12 = v10;

    uint64_t v13 = objc_msgSend(v12, "if_flatMap:", &__block_literal_global_34316);
    goto LABEL_16;
  }
  v11 = 0;
LABEL_17:
  v14 = [a1 name];
  uint64_t v15 = objc_msgSend(v14, "_intents_compareValue:relation:", v11, a4);

  return v15;
}

@end
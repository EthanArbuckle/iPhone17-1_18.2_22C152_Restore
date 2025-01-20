@interface NSMeasurement(INCodableAttributeRelationComparing)
- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:;
@end

@implementation NSMeasurement(INCodableAttributeRelationComparing)

- (uint64_t)_intents_compareValue:()INCodableAttributeRelationComparing relation:
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [a1 unit];
    uint64_t v8 = [v6 measurementByConvertingToUnit:v7];

    id v6 = (id)v8;
  }
  else
  {
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
      id v11 = v10;

      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __85__NSMeasurement_INCodableAttributeRelationComparing___intents_compareValue_relation___block_invoke;
      v43[3] = &unk_1E551F418;
      v43[4] = a1;
      objc_msgSend(v11, "if_flatMap:", v43);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  switch(a4)
  {
    case 1:
      uint64_t v12 = 1;
      break;
    case 2:
    case 9:
      uint64_t v12 = [a1 isEqual:v6];
      break;
    case 3:
    case 10:
      uint64_t v12 = [a1 isEqual:v6] ^ 1;
      break;
    case 4:
      v13 = NSNumber;
      [a1 doubleValue];
      objc_msgSend(v13, "numberWithDouble:");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = NSNumber;
      id v16 = v6;
      if (v16)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v17 = v16;
        }
        else {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v31 = v17;

      [v31 doubleValue];
      double v33 = v32;

      v34 = [v15 numberWithDouble:v33];
      BOOL v35 = [v14 compare:v34] == 1;
      goto LABEL_42;
    case 5:
      v18 = NSNumber;
      [a1 doubleValue];
      objc_msgSend(v18, "numberWithDouble:");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v19 = NSNumber;
      id v20 = v6;
      if (v20)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v21 = v20;
        }
        else {
          v21 = 0;
        }
      }
      else
      {
        v21 = 0;
      }
      id v36 = v21;

      [v36 doubleValue];
      v37 = objc_msgSend(v19, "numberWithDouble:");
      if ([v14 compare:v37] == 1) {
        goto LABEL_39;
      }
      goto LABEL_48;
    case 6:
      v22 = NSNumber;
      [a1 doubleValue];
      objc_msgSend(v22, "numberWithDouble:");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v23 = NSNumber;
      id v24 = v6;
      if (v24)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v25 = v24;
        }
        else {
          v25 = 0;
        }
      }
      else
      {
        v25 = 0;
      }
      id v38 = v25;

      [v38 doubleValue];
      double v40 = v39;

      v34 = [v23 numberWithDouble:v40];
      BOOL v35 = [v14 compare:v34] == -1;
LABEL_42:
      uint64_t v12 = v35;
      goto LABEL_45;
    case 7:
      v26 = NSNumber;
      [a1 doubleValue];
      objc_msgSend(v26, "numberWithDouble:");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v27 = NSNumber;
      id v20 = v6;
      if (v20)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v28 = v20;
        }
        else {
          v28 = 0;
        }
      }
      else
      {
        v28 = 0;
      }
      id v36 = v28;

      [v36 doubleValue];
      v37 = objc_msgSend(v27, "numberWithDouble:");
      if ([v14 compare:v37] == -1) {
LABEL_39:
      }
        uint64_t v12 = 1;
      else {
LABEL_48:
      }
        uint64_t v12 = [a1 isEqual:v20];

      goto LABEL_50;
    case 8:
      id v29 = v6;
      if (v29)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v30 = v29;
        }
        else {
          v30 = 0;
        }
      }
      else
      {
        v30 = 0;
      }
      id v14 = v30;

      if ([v14 count] == 2)
      {
        v34 = [v14 firstObject];
        v42 = [v14 lastObject];
        if (objc_msgSend(a1, "_intents_compareValue:relation:", v34, 5)) {
          uint64_t v12 = objc_msgSend(a1, "_intents_compareValue:relation:", v42, 7);
        }
        else {
          uint64_t v12 = 0;
        }

LABEL_45:
      }
      else
      {
        uint64_t v12 = 0;
      }
LABEL_50:

      break;
    default:
      uint64_t v12 = 0;
      break;
  }

  return v12;
}

@end
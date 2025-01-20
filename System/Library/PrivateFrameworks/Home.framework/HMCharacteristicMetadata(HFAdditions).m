@interface HMCharacteristicMetadata(HFAdditions)
- (HFNumberValueConstraints)hf_numericValueConstraints;
- (id)hf_characteristicValueForPercentage:()HFAdditions;
- (id)hf_normalizedValueForValue:()HFAdditions;
- (id)hf_valueRoundedToNearestStepValue:()HFAdditions;
- (uint64_t)hf_isEqualToMetadata:()HFAdditions;
- (uint64_t)hf_isInteger;
- (uint64_t)hf_isNumeric;
- (uint64_t)hf_isValidValue:()HFAdditions;
- (uint64_t)hf_percentageForCharacteristicValue:()HFAdditions;
@end

@implementation HMCharacteristicMetadata(HFAdditions)

- (HFNumberValueConstraints)hf_numericValueConstraints
{
  if (objc_msgSend(a1, "hf_isNumeric"))
  {
    v2 = [HFNumberValueConstraints alloc];
    v3 = [a1 minimumValue];
    v4 = [a1 maximumValue];
    v5 = [a1 stepValue];
    v6 = [(HFNumberValueConstraints *)v2 initWithMinValue:v3 maxValue:v4 stepValue:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (uint64_t)hf_isNumeric
{
  if (objc_msgSend(a1, "hf_isInteger")) {
    return 1;
  }
  v3 = [a1 format];
  uint64_t v4 = [v3 isEqualToString:*MEMORY[0x263F0BE40]];

  return v4;
}

- (uint64_t)hf_isInteger
{
  v2 = [a1 format];

  if (!v2) {
    return 0;
  }
  if (_MergedGlobals_264 != -1) {
    dispatch_once(&_MergedGlobals_264, &__block_literal_global_4_7);
  }
  id v3 = (id)qword_26AB2F1B8;
  uint64_t v4 = [a1 format];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

- (id)hf_normalizedValueForValue:()HFAdditions
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = objc_msgSend(a1, "hf_numericValueConstraints");
    uint64_t v6 = [v5 normalizedValueForValue:v4];
    v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = v4;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (uint64_t)hf_isEqualToMetadata:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 minimumValue];
  uint64_t v6 = [v4 minimumValue];
  id v7 = v5;
  id v8 = v6;
  id v9 = v8;
  if (v7 != v8)
  {
    uint64_t v10 = 0;
    v11 = v8;
    id v12 = v7;
LABEL_36:

    goto LABEL_37;
  }
  if (!v7 || (int v13 = [v7 isEqual:v7], v7, v7, v13))
  {
    v14 = [a1 maximumValue];
    v15 = [v4 maximumValue];
    id v12 = v14;
    id v16 = v15;
    v11 = v16;
    if (v12 != v16)
    {
      uint64_t v10 = 0;
      v17 = v16;
      id v18 = v12;
LABEL_35:

      goto LABEL_36;
    }
    if (v12)
    {
      int v19 = [v12 isEqual:v12];

      if (!v19)
      {
        uint64_t v10 = 0;
        v11 = v12;
        goto LABEL_36;
      }
    }
    v20 = [a1 stepValue];
    v21 = [v4 stepValue];
    id v18 = v20;
    id v22 = v21;
    v17 = v22;
    if (v18 != v22)
    {
      uint64_t v10 = 0;
      v23 = v22;
      id v24 = v18;
LABEL_34:

      goto LABEL_35;
    }
    if (v18)
    {
      int v25 = [v18 isEqual:v18];

      if (!v25)
      {
        uint64_t v10 = 0;
        v17 = v18;
        goto LABEL_35;
      }
    }
    v26 = [a1 maxLength];
    v27 = [v4 maxLength];
    id v24 = v26;
    id v28 = v27;
    v23 = v28;
    if (v24 != v28)
    {
      uint64_t v10 = 0;
      v29 = v28;
      id v41 = v24;
LABEL_33:

      id v24 = v41;
      goto LABEL_34;
    }
    if (v24)
    {
      int v42 = [v24 isEqual:v24];

      if (!v42)
      {
        uint64_t v10 = 0;
        v23 = v24;
        goto LABEL_34;
      }
    }
    id v41 = v24;
    v30 = [a1 format];
    v39 = [v4 format];
    id v24 = v30;
    id v31 = v39;
    id v40 = v31;
    if (v24 == v31)
    {
      if (v24)
      {
        LODWORD(v36) = [v24 isEqual:v24];

        if (!v36)
        {
          uint64_t v10 = 0;
          v29 = v24;
          goto LABEL_33;
        }
      }
      id v38 = v24;
      v32 = objc_msgSend(a1, "units", v36);
      v33 = [v4 units];
      id v34 = v32;
      id v37 = v33;
      if (v34 == v37)
      {
        if (v34)
        {
          id v24 = v34;
          uint64_t v10 = [v34 isEqual:v34];
        }
        else
        {
          id v24 = 0;
          uint64_t v10 = 1;
        }
      }
      else
      {
        id v24 = v34;
        uint64_t v10 = 0;
      }

      id v31 = v37;
    }
    else
    {
      uint64_t v10 = 0;
      id v38 = v24;
    }

    id v24 = v38;
    v29 = v40;
    goto LABEL_33;
  }
  uint64_t v10 = 0;
LABEL_37:

  return v10;
}

- (uint64_t)hf_isValidValue:()HFAdditions
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [a1 validValues];
    if (!v5
      || (uint64_t v6 = (void *)v5,
          [a1 validValues],
          id v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 containsObject:v4],
          v7,
          v6,
          v8))
    {
      objc_opt_class();
      id v9 = v4;
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;

      id v12 = [a1 minimumValue];
      if (v12)
      {
        int v13 = [a1 minimumValue];
        [v13 doubleValue];
        double v15 = v14;
      }
      else
      {
        double v15 = 2.22507386e-308;
      }

      v17 = [a1 maximumValue];
      if (v17)
      {
        id v18 = [a1 maximumValue];
        [v18 doubleValue];
        double v20 = v19;
      }
      else
      {
        double v20 = 1.79769313e308;
      }

      if (v11)
      {
        [v11 doubleValue];
        if (v21 < v15) {
          goto LABEL_17;
        }
        [v11 doubleValue];
        if (v22 > v20) {
          goto LABEL_17;
        }
      }
      else if (objc_msgSend(a1, "hf_isNumeric"))
      {
LABEL_17:
        uint64_t v16 = 0;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v16 = 1;
      goto LABEL_20;
    }
  }
  uint64_t v16 = 0;
LABEL_21:

  return v16;
}

- (uint64_t)hf_percentageForCharacteristicValue:()HFAdditions
{
  id v4 = a3;
  uint64_t v5 = [a1 minimumValue];
  if (v5)
  {
    uint64_t v6 = [a1 minimumValue];
    [v6 doubleValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  id v9 = [a1 maximumValue];
  if (v9)
  {
    uint64_t v10 = [a1 maximumValue];
    [v10 doubleValue];
    double v12 = v11;
  }
  else
  {
    double v12 = 100.0;
  }

  int v13 = NSNumber;
  [v4 doubleValue];
  double v15 = v14;

  return [v13 numberWithDouble:(v15 - v8) / (v12 - v8)];
}

- (id)hf_valueRoundedToNearestStepValue:()HFAdditions
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v5 = objc_msgSend(a1, "hf_numericValueConstraints");
    uint64_t v6 = [v5 roundedValueForValue:v4];
    double v7 = (void *)v6;
    if (v6) {
      double v8 = (void *)v6;
    }
    else {
      double v8 = v4;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (id)hf_characteristicValueForPercentage:()HFAdditions
{
  if (objc_msgSend(a1, "hf_isNumeric"))
  {
    if (a2 < 0.0 || a2 > 1.0) {
      NSLog(&cfstr_IncrementalSta.isa, *(void *)&a2);
    }
    float v5 = a2;
    float v6 = 0.0;
    float v7 = fmaxf(v5, 0.0);
    double v8 = [a1 minimumValue];
    if (v8)
    {
      id v9 = [a1 minimumValue];
      [v9 floatValue];
      float v6 = v10;
    }
    float v11 = fminf(v7, 1.0);

    double v12 = [a1 maximumValue];
    if (v12)
    {
      int v13 = [a1 maximumValue];
      [v13 floatValue];
      float v15 = v14;
    }
    else
    {
      float v15 = 100.0;
    }

    float v17 = v6 + (float)(v11 * (float)(v15 - v6));
    id v18 = [a1 stepValue];
    double v20 = v18;
    if (v18)
    {
      [v18 floatValue];
      float v17 = *(float *)&v19 * roundf(v17 / *(float *)&v19);
    }
    *(float *)&double v19 = v17;
    uint64_t v16 = [NSNumber numberWithFloat:v19];
  }
  else
  {
    uint64_t v16 = 0;
  }
  return v16;
}

@end
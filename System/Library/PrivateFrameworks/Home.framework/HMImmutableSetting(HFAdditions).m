@interface HMImmutableSetting(HFAdditions)
- (id)homeKitAccessorySettingValueForRawValue:()HFAdditions;
- (id)value;
@end

@implementation HMImmutableSetting(HFAdditions)

- (id)value
{
  objc_opt_class();
  id v2 = a1;
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  objc_opt_class();
  id v5 = v2;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  id v11 = v8;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  id v14 = v11;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  objc_opt_class();
  id v17 = v14;
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  id v19 = v18;

  if (v4)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
LABEL_31:
    v21 = (void *)v20;
    goto LABEL_32;
  }
  if (v7)
  {
    uint64_t v20 = [v7 stringValue];
    goto LABEL_31;
  }
  if (v10)
  {
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
    goto LABEL_31;
  }
  if (v13)
  {
    uint64_t v20 = [v13 stringListValue];
    goto LABEL_31;
  }
  if (v16)
  {
    uint64_t v20 = [v16 languageValues];
    goto LABEL_31;
  }
  if (v19)
  {
    uint64_t v20 = [v19 languageValue];
    goto LABEL_31;
  }
  v21 = 0;
LABEL_32:

  return v21;
}

- (id)homeKitAccessorySettingValueForRawValue:()HFAdditions
{
  id v4 = a3;
  objc_opt_class();
  id v5 = a1;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  objc_opt_class();
  id v8 = v5;
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  objc_opt_class();
  id v11 = v8;
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  objc_opt_class();
  id v14 = v4;
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  unint64_t v16 = v15;

  objc_opt_class();
  id v17 = v14;
  if (objc_opt_isKindOfClass()) {
    v18 = v17;
  }
  else {
    v18 = 0;
  }
  unint64_t v19 = v18;

  uint64_t v20 = 0;
  if (v16 | v19)
  {
    if (v7)
    {
      uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F0E728]), "initWithBoolValue:", objc_msgSend((id)v16, "BOOLValue"));
LABEL_23:
      uint64_t v20 = (void *)v21;
      goto LABEL_24;
    }
    if (v13)
    {
      uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263F0E738]), "initWithIntegerValue:", objc_msgSend((id)v16, "integerValue"));
      goto LABEL_23;
    }
    if (v10)
    {
      uint64_t v21 = [objc_alloc(MEMORY[0x263F0E748]) initWithStringValue:v19];
      goto LABEL_23;
    }
    uint64_t v20 = 0;
  }
LABEL_24:

  return v20;
}

@end
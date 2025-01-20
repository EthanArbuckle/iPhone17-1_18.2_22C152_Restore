@interface HMSettingValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMSettingValue)initWithCoder:(id)a3;
- (HMSettingValue)initWithType:(int64_t)a3 stringValue:(id)a4 numberValue:(id)a5 dataValue:(id)a6 selectionIdentifier:(id)a7 selectionValue:(id)a8;
- (NSData)dataValue;
- (NSNumber)numberValue;
- (NSString)selectionValue;
- (NSString)stringValue;
- (NSUUID)selectionIdentifier;
- (id)description;
- (id)initDataSettingWithValue:(id)a3;
- (id)initNumberSettingWithValue:(id)a3;
- (id)initStringSettingWithValue:(id)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMSettingValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionValue, 0);
  objc_storeStrong((id *)&self->_selectionIdentifier, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_numberValue, 0);
}

- (NSString)selectionValue
{
  return self->_selectionValue;
}

- (NSUUID)selectionIdentifier
{
  return self->_selectionIdentifier;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (HMSettingValue *)a3;
  if (self != v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;
    if (!v7 || (int64_t v8 = [(HMSettingValue *)self type], v8 != [(HMSettingValue *)v7 type]))
    {
      char v12 = 0;
LABEL_35:

      goto LABEL_36;
    }
    v9 = [(HMSettingValue *)self numberValue];
    v10 = [(HMSettingValue *)v7 numberValue];
    if (v9 != v10)
    {
      v11 = [(HMSettingValue *)self numberValue];
      [(HMSettingValue *)v7 numberValue];
      v40 = v41 = v11;
      if (!objc_msgSend(v11, "isEqual:"))
      {
        char v12 = 0;
        goto LABEL_33;
      }
    }
    v13 = [(HMSettingValue *)self stringValue];
    v14 = [(HMSettingValue *)v7 stringValue];
    if (v13 != v14)
    {
      v3 = [(HMSettingValue *)self stringValue];
      v37 = [(HMSettingValue *)v7 stringValue];
      if (!objc_msgSend(v3, "isEqual:"))
      {
        char v12 = 0;
LABEL_31:

LABEL_32:
        if (v9 == v10)
        {
LABEL_34:

          goto LABEL_35;
        }
LABEL_33:

        goto LABEL_34;
      }
    }
    uint64_t v15 = [(HMSettingValue *)self dataValue];
    uint64_t v38 = [(HMSettingValue *)v7 dataValue];
    v39 = (void *)v15;
    if (v15 != v38)
    {
      v16 = [(HMSettingValue *)self dataValue];
      v34 = [(HMSettingValue *)v7 dataValue];
      v35 = v16;
      if (!objc_msgSend(v16, "isEqual:"))
      {
        char v12 = 0;
        v18 = (void *)v38;
        v17 = v39;
LABEL_29:

LABEL_30:
        if (v13 == v14) {
          goto LABEL_32;
        }
        goto LABEL_31;
      }
    }
    v19 = [(HMSettingValue *)self selectionIdentifier];
    v20 = [(HMSettingValue *)v7 selectionIdentifier];
    v36 = v3;
    if (v19 == v20)
    {
      v31 = v14;
    }
    else
    {
      v21 = [(HMSettingValue *)self selectionIdentifier];
      v32 = [(HMSettingValue *)v7 selectionIdentifier];
      v33 = v21;
      if (!objc_msgSend(v21, "isEqual:"))
      {
        char v12 = 0;
        v3 = v36;
        goto LABEL_27;
      }
      v31 = v14;
    }
    v22 = [(HMSettingValue *)self selectionValue];
    uint64_t v23 = [(HMSettingValue *)v7 selectionValue];
    if (v22 == (void *)v23)
    {

      char v12 = 1;
    }
    else
    {
      v24 = (void *)v23;
      [(HMSettingValue *)self selectionValue];
      v25 = v29 = v19;
      [(HMSettingValue *)v7 selectionValue];
      v30 = v13;
      v27 = v26 = v20;
      char v12 = [v25 isEqual:v27];

      v20 = v26;
      v13 = v30;

      v19 = v29;
    }
    v14 = v31;
    v3 = v36;
    if (v19 == v20)
    {
LABEL_28:

      v18 = (void *)v38;
      v17 = v39;
      if (v39 == (void *)v38) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
LABEL_27:

    goto LABEL_28;
  }
  char v12 = 1;
LABEL_36:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", -[HMSettingValue type](self, "type"));
  [v5 encodeObject:v6 forKey:@"HMSV.type"];

  v7 = [(HMSettingValue *)self stringValue];
  [v5 encodeObject:v7 forKey:@"HMSV.strValue"];

  int64_t v8 = [(HMSettingValue *)self numberValue];
  [v5 encodeObject:v8 forKey:@"HMSV.numValue"];

  v9 = [(HMSettingValue *)self dataValue];
  [v5 encodeObject:v9 forKey:@"HMSV.dataValue"];

  v10 = [(HMSettingValue *)self selectionIdentifier];
  [v5 encodeObject:v10 forKey:@"HMSV.selId"];

  id v11 = [(HMSettingValue *)self selectionValue];
  [v5 encodeObject:v11 forKey:@"HMSV.selValue"];
}

- (HMSettingValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMSV.type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMSV.strValue"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMSV.numValue"];
  int64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMSV.dataValue"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMSV.selId"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMSV.selValue"];

  id v11 = -[HMSettingValue initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:](self, "initWithType:stringValue:numberValue:dataValue:selectionIdentifier:selectionValue:", [v5 integerValue], v6, v7, v8, v9, v10);
  return v11;
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(HMSettingValue *)self type];
  id v5 = [(HMSettingValue *)self stringValue];
  v6 = [(HMSettingValue *)self numberValue];
  v7 = [(HMSettingValue *)self selectionIdentifier];
  int64_t v8 = [(HMSettingValue *)self selectionValue];
  v9 = [v3 stringWithFormat:@"[HMSettingValue(%ld): str:%@ num:%@ sel:[%@]%@]", v4, v5, v6, v7, v8];

  return v9;
}

- (id)initDataSettingWithValue:(id)a3
{
  return [(HMSettingValue *)self initWithType:1 stringValue:0 numberValue:0 dataValue:a3 selectionIdentifier:0 selectionValue:0];
}

- (id)initNumberSettingWithValue:(id)a3
{
  return [(HMSettingValue *)self initWithType:2 stringValue:0 numberValue:a3 dataValue:0 selectionIdentifier:0 selectionValue:0];
}

- (id)initStringSettingWithValue:(id)a3
{
  return [(HMSettingValue *)self initWithType:3 stringValue:a3 numberValue:0 dataValue:0 selectionIdentifier:0 selectionValue:0];
}

- (HMSettingValue)initWithType:(int64_t)a3 stringValue:(id)a4 numberValue:(id)a5 dataValue:(id)a6 selectionIdentifier:(id)a7 selectionValue:(id)a8
{
  id v14 = a4;
  id v23 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMSettingValue;
  v18 = [(HMSettingValue *)&v24 init];
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v14);
    stringValue = v19->_stringValue;
    v19->_stringValue = (NSString *)v20;

    objc_storeStrong((id *)&v19->_numberValue, a5);
    objc_storeStrong((id *)&v19->_dataValue, a6);
    objc_storeStrong((id *)&v19->_selectionIdentifier, a7);
    objc_storeStrong((id *)&v19->_selectionValue, a8);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
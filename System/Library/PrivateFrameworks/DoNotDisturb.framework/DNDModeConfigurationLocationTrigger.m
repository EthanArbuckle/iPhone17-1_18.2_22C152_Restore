@interface DNDModeConfigurationLocationTrigger
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSecureData;
- (BOOL)isEqual:(id)a3;
- (CLCircularRegion)region;
- (DNDModeConfigurationLocationTrigger)initWithCoder:(id)a3;
- (DNDModeConfigurationLocationTrigger)initWithRegion:(id)a3 detail:(id)a4 enabledSetting:(unint64_t)a5;
- (NSString)detail;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DNDModeConfigurationLocationTrigger

- (DNDModeConfigurationLocationTrigger)initWithRegion:(id)a3 detail:(id)a4 enabledSetting:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DNDModeConfigurationLocationTrigger;
  v11 = [(DNDModeConfigurationTrigger *)&v16 initWithEnabledSetting:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_region, a3);
    uint64_t v13 = [v10 copy];
    detail = v12->_detail;
    v12->_detail = (NSString *)v13;
  }
  return v12;
}

- (BOOL)hasSecureData
{
  return 1;
}

- (unint64_t)hash
{
  v6.receiver = self;
  v6.super_class = (Class)DNDModeConfigurationLocationTrigger;
  unint64_t v3 = [(DNDModeConfigurationTrigger *)&v6 hash];
  uint64_t v4 = [(CLCircularRegion *)self->_region hash] ^ v3;
  return v4 ^ [(NSString *)self->_detail hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (DNDModeConfigurationLocationTrigger *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v27.receiver = self;
      v27.super_class = (Class)DNDModeConfigurationLocationTrigger;
      if (![(DNDModeConfigurationTrigger *)&v27 isEqual:v5])
      {
        char v13 = 0;
LABEL_27:

        goto LABEL_28;
      }
      objc_super v6 = [(DNDModeConfigurationLocationTrigger *)self region];
      v7 = [(DNDModeConfigurationLocationTrigger *)v5 region];
      if (v6 != v7)
      {
        uint64_t v8 = [(DNDModeConfigurationLocationTrigger *)self region];
        if (!v8)
        {
          char v13 = 0;
LABEL_26:

          goto LABEL_27;
        }
        id v9 = (void *)v8;
        id v10 = [(DNDModeConfigurationLocationTrigger *)v5 region];
        if (!v10)
        {
          char v13 = 0;
LABEL_25:

          goto LABEL_26;
        }
        v11 = [(DNDModeConfigurationLocationTrigger *)self region];
        v12 = [(DNDModeConfigurationLocationTrigger *)v5 region];
        if (![v11 isEqual:v12])
        {
          char v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v23 = v12;
        v24 = v11;
        v25 = v10;
        v26 = v9;
      }
      v14 = [(DNDModeConfigurationLocationTrigger *)self detail];
      uint64_t v15 = [(DNDModeConfigurationLocationTrigger *)v5 detail];
      if (v14 == (void *)v15)
      {

        char v13 = 1;
      }
      else
      {
        objc_super v16 = (void *)v15;
        uint64_t v17 = [(DNDModeConfigurationLocationTrigger *)self detail];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [(DNDModeConfigurationLocationTrigger *)v5 detail];
          if (v19)
          {
            v22 = [(DNDModeConfigurationLocationTrigger *)self detail];
            v20 = [(DNDModeConfigurationLocationTrigger *)v5 detail];
            char v13 = [v22 isEqual:v20];
          }
          else
          {
            char v13 = 0;
          }
        }
        else
        {

          char v13 = 0;
        }
      }
      id v10 = v25;
      id v9 = v26;
      v12 = v23;
      v11 = v24;
      if (v6 == v7) {
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    char v13 = 0;
  }
LABEL_28:

  return v13;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(DNDModeConfigurationTrigger *)self enabledSetting];
  objc_super v6 = [(DNDModeConfigurationLocationTrigger *)self region];
  v7 = [(DNDModeConfigurationLocationTrigger *)self detail];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; enabledSetting: %llu; region: %@; detail: %@>",
    v4,
    self,
    v5,
    v6,
  uint64_t v8 = v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeConfigurationLocationTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDModeConfigurationLocationTrigger;
  unint64_t v5 = [(DNDModeConfigurationTrigger *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"region"];
    region = v5->_region;
    v5->_region = (CLCircularRegion *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"detail"];
    detail = v5->_detail;
    v5->_detail = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DNDModeConfigurationLocationTrigger;
  id v4 = a3;
  [(DNDModeConfigurationTrigger *)&v7 encodeWithCoder:v4];
  unint64_t v5 = [(DNDModeConfigurationLocationTrigger *)self region];
  [v4 encodeObject:v5 forKey:@"region"];

  uint64_t v6 = [(DNDModeConfigurationLocationTrigger *)self detail];
  [v4 encodeObject:v6 forKey:@"detail"];
}

- (CLCircularRegion)region
{
  return self->_region;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
@interface NIHomeDeviceConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)canUpdateToConfiguration:(id)a3;
- (BOOL)isAnchor;
- (BOOL)isEqual:(id)a3;
- (NIHomeDeviceConfiguration)init;
- (NIHomeDeviceConfiguration)initWithAllowedDevices:(unint64_t)a3 sessionKey:(id)a4 asAnchor:(BOOL)a5 regions:(id)a6;
- (NIHomeDeviceConfiguration)initWithCoder:(id)a3;
- (NIHomeDeviceConfiguration)initWithRegions:(id)a3;
- (NSArray)monitoredRegions;
- (NSData)sessionKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)antennaDiversityOverride;
- (int64_t)minimumPreferredUpdatedRate;
- (unint64_t)allowedDevices;
- (unint64_t)hash;
- (void)_updateRegionDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedDevices:(unint64_t)a3;
- (void)setAnchor:(BOOL)a3;
- (void)setAntennaDiversityOverride:(int64_t)a3;
- (void)setMinimumPreferredUpdatedRate:(int64_t)a3;
- (void)setMonitoredRegions:(id)a3;
- (void)setSessionKey:(id)a3;
@end

@implementation NIHomeDeviceConfiguration

- (NIHomeDeviceConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)NIHomeDeviceConfiguration;
  v2 = [(NIConfiguration *)&v6 initInternal];
  v3 = v2;
  if (v2)
  {
    v2->_allowedDevices = 4;
    sessionKey = v2->_sessionKey;
    v2->_sessionKey = 0;

    v3->_anchor = 0;
    v3->_minimumPreferredUpdatedRate = 3;
    v3->_antennaDiversityOverride = 0;
    [(NIHomeDeviceConfiguration *)v3 setMonitoredRegions:MEMORY[0x1E4F1CBF0]];
  }
  return v3;
}

+ (id)new
{
  return objc_alloc_init(NIHomeDeviceConfiguration);
}

- (NIHomeDeviceConfiguration)initWithRegions:(id)a3
{
  id v4 = a3;
  v5 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class());

  [(NIHomeDeviceConfiguration *)v5 setMonitoredRegions:v4];
  return v5;
}

- (NIHomeDeviceConfiguration)initWithAllowedDevices:(unint64_t)a3 sessionKey:(id)a4 asAnchor:(BOOL)a5 regions:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v13 = (NIHomeDeviceConfiguration *)objc_alloc_init((Class)objc_opt_class());

  if (v13)
  {
    v13->_allowedDevices = a3;
    objc_storeStrong((id *)&v13->_sessionKey, a4);
    v13->_anchor = a5;
    [(NIHomeDeviceConfiguration *)v13 setMonitoredRegions:v12];
  }

  return v13;
}

- (void)setMonitoredRegions:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredRegions, a3);

  [(NIHomeDeviceConfiguration *)self _updateRegionDescription];
}

- (NSArray)monitoredRegions
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_monitoredRegions copyItems:1];

  return (NSArray *)v2;
}

- (void)_updateRegionDescription
{
  if ([(NSArray *)self->_monitoredRegions count])
  {
    v3 = objc_opt_new();
    monitoredRegions = self->_monitoredRegions;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53__NIHomeDeviceConfiguration__updateRegionDescription__block_invoke;
    v9[3] = &unk_1E5AC2E08;
    id v5 = v3;
    id v10 = v5;
    [(NSArray *)monitoredRegions enumerateObjectsUsingBlock:v9];
    regionDescription = self->_regionDescription;
    self->_regionDescription = (NSString *)v5;
    id v7 = v5;
  }
  else
  {
    v8 = self->_regionDescription;
    self->_regionDescription = (NSString *)@"[none]";
  }
}

void __53__NIHomeDeviceConfiguration__updateRegionDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 shortDescription];
  [v2 appendFormat:@"\n    [%@] ", v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NIHomeDeviceConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v9, sel_copyWithZone_);
  [v5 setAllowedDevices:self->_allowedDevices];
  [v5 setSessionKey:self->_sessionKey];
  [v5 setAnchor:self->_anchor];
  [v5 setAntennaDiversityOverride:self->_antennaDiversityOverride];
  [v5 setMinimumPreferredUpdatedRate:self->_minimumPreferredUpdatedRate];
  if (self->_monitoredRegions)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "allocWithZone:", a3), "initWithArray:copyItems:", self->_monitoredRegions, 1);
    id v7 = v5[4];
    v5[4] = (id)v6;
  }
  objc_storeStrong(v5 + 5, self->_regionDescription);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIHomeDeviceConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_allowedDevices forKey:@"allowedDevices"];
  [v4 encodeObject:self->_sessionKey forKey:@"sessionKey"];
  [v4 encodeBool:self->_anchor forKey:@"anchor"];
  [v4 encodeInteger:self->_antennaDiversityOverride forKey:@"antennaDiversityOverride"];
  [v4 encodeObject:self->_monitoredRegions forKey:@"monitoredRegions"];
  [v4 encodeInteger:self->_minimumPreferredUpdatedRate forKey:@"minimumPreferredUpdatedRate"];
}

- (NIHomeDeviceConfiguration)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NIHomeDeviceConfiguration;
  objc_super v5 = [(NIConfiguration *)&v17 initWithCoder:v4];
  if (v5
    && (uint64_t v6 = [v4 decodeIntegerForKey:@"allowedDevices"],
        +[NIInternalUtils isIntValidRelationshipSpecifier:v6]))
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionKey"];
    char v8 = [v4 decodeBoolForKey:@"anchor"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"antennaDiversityOverride"];
    if (+[NIInternalUtils isIntValidAntennaDiversityOverride:v9])
    {
      id v10 = (void *)MEMORY[0x1E4F1CAD0];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      id v12 = [v10 setWithArray:v11];
      v13 = [v4 decodeObjectOfClasses:v12 forKey:@"monitoredRegions"];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (uint64_t v14 = [v4 decodeIntegerForKey:@"minimumPreferredUpdatedRate"],
            +[NIInternalUtils isIntValidNearbyObjectUpdateRate:v14]))
      {
        v5->_allowedDevices = v6;
        objc_storeStrong((id *)&v5->_sessionKey, v7);
        v5->_anchor = v8;
        v5->_antennaDiversityOverride = v9;
        objc_storeStrong((id *)&v5->_monitoredRegions, v13);
        [(NIHomeDeviceConfiguration *)v5 _updateRegionDescription];
        v5->_minimumPreferredUpdatedRate = v14;
        v15 = v5;
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  id v4 = (NIHomeDeviceConfiguration *)a3;
  objc_super v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      char v14 = 1;
    }
    else
    {
      uint64_t v6 = [(NIHomeDeviceConfiguration *)v4 allowedDevices];
      unint64_t allowedDevices = self->_allowedDevices;
      BOOL v8 = [(NIHomeDeviceConfiguration *)v5 isAnchor];
      int anchor = self->_anchor;
      uint64_t v10 = [(NIHomeDeviceConfiguration *)v5 antennaDiversityOverride];
      int64_t antennaDiversityOverride = self->_antennaDiversityOverride;
      uint64_t v12 = [(NIHomeDeviceConfiguration *)v5 minimumPreferredUpdatedRate];
      int64_t v29 = antennaDiversityOverride;
      int64_t minimumPreferredUpdatedRate = self->_minimumPreferredUpdatedRate;
      v13 = [(NIHomeDeviceConfiguration *)v5 sessionKey];
      uint64_t v25 = v12;
      if (v13) {
        BOOL v27 = 0;
      }
      else {
        BOOL v27 = self->_sessionKey == 0;
      }
      uint64_t v28 = v10;

      v15 = [(NIHomeDeviceConfiguration *)v5 sessionKey];
      int v16 = v8;
      int v17 = [v15 isEqualToData:self->_sessionKey];
      unint64_t v18 = allowedDevices;
      uint64_t v19 = v6;

      v20 = [(NIHomeDeviceConfiguration *)v5 monitoredRegions];
      char v21 = [v20 isEqualToArray:self->_monitoredRegions];

      v22 = [(NIHomeDeviceConfiguration *)v5 monitoredRegions];
      if (v22) {
        BOOL v23 = 0;
      }
      else {
        BOOL v23 = self->_monitoredRegions == 0;
      }

      char v14 = 0;
      if (v19 == v18 && anchor == v16 && v28 == v29 && (((v27 | v17) ^ 1) & 1) == 0)
      {
        if (v25 == minimumPreferredUpdatedRate) {
          char v14 = v21 | v23;
        }
        else {
          char v14 = 0;
        }
      }
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NIHomeDeviceConfiguration *)v4;
    if (v5 == self)
    {
      BOOL v7 = 1;
    }
    else if ([(NIHomeDeviceConfiguration *)self canUpdateToConfiguration:v5])
    {
      unint64_t v6 = [(NIConfiguration *)self enabledGestures];
      BOOL v7 = v6 == [(NIConfiguration *)v5 enabledGestures];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_allowedDevices ^ self->_anchor ^ [(NSData *)self->_sessionKey hash];
  int64_t antennaDiversityOverride = self->_antennaDiversityOverride;
  return v3 ^ antennaDiversityOverride ^ [(NSArray *)self->_monitoredRegions hash] ^ self->_minimumPreferredUpdatedRate;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  unint64_t v6 = [(NIHomeDeviceConfiguration *)self descriptionInternal];
  BOOL v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  id v3 = NSString;
  id v4 = +[NIInternalUtils NIRelationshipSpecifierToString:self->_allowedDevices];
  if (self->_anchor) {
    objc_super v5 = "Yes";
  }
  else {
    objc_super v5 = "No";
  }
  return (id)[v3 stringWithFormat:@"<devices: [%s], ses-key: %@, anchor: %s, ant-div: %s, min-rate: %s, gestures: %d, regions: %@>", v4, self->_sessionKey, v5, +[NIInternalUtils AntennaDiversityOverrideToString:](NIInternalUtils, "AntennaDiversityOverrideToString:", self->_antennaDiversityOverride), +[NIInternalUtils NINearbyObjectUpdateRateToString:](NIInternalUtils, "NINearbyObjectUpdateRateToString:", self->_minimumPreferredUpdatedRate), -[NIConfiguration enabledGestures](self, "enabledGestures"), self->_regionDescription];
}

- (unint64_t)allowedDevices
{
  return self->_allowedDevices;
}

- (void)setAllowedDevices:(unint64_t)a3
{
  self->_unint64_t allowedDevices = a3;
}

- (NSData)sessionKey
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSessionKey:(id)a3
{
}

- (BOOL)isAnchor
{
  return self->_anchor;
}

- (void)setAnchor:(BOOL)a3
{
  self->_int anchor = a3;
}

- (int64_t)minimumPreferredUpdatedRate
{
  return self->_minimumPreferredUpdatedRate;
}

- (void)setMinimumPreferredUpdatedRate:(int64_t)a3
{
  self->_int64_t minimumPreferredUpdatedRate = a3;
}

- (int64_t)antennaDiversityOverride
{
  return self->_antennaDiversityOverride;
}

- (void)setAntennaDiversityOverride:(int64_t)a3
{
  self->_int64_t antennaDiversityOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionKey, 0);
  objc_storeStrong((id *)&self->_regionDescription, 0);

  objc_storeStrong((id *)&self->_monitoredRegions, 0);
}

@end
@interface CTSweetgumUsagePlanItemData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTSweetgumUsagePlanItemData)init;
- (CTSweetgumUsagePlanItemData)initWithCoder:(id)a3;
- (NSString)capacity;
- (NSString)maxDataBeforeThrottling;
- (NSString)sharedDataUsed;
- (NSString)sharedPlanIdentifier;
- (NSString)thisDeviceDataUsed;
- (id)description;
- (int64_t)units;
- (void)encodeWithCoder:(id)a3;
- (void)setCapacity:(id)a3;
- (void)setMaxDataBeforeThrottling:(id)a3;
- (void)setSharedDataUsed:(id)a3;
- (void)setSharedPlanIdentifier:(id)a3;
- (void)setThisDeviceDataUsed:(id)a3;
- (void)setUnits:(int64_t)a3;
@end

@implementation CTSweetgumUsagePlanItemData

- (CTSweetgumUsagePlanItemData)init
{
  v10.receiver = self;
  v10.super_class = (Class)CTSweetgumUsagePlanItemData;
  v2 = [(CTSweetgumUsagePlanItemData *)&v10 init];
  v3 = v2;
  if (v2)
  {
    capacity = v2->_capacity;
    v2->_units = 0;
    v2->_capacity = 0;

    maxDataBeforeThrottling = v3->_maxDataBeforeThrottling;
    v3->_maxDataBeforeThrottling = 0;

    thisDeviceDataUsed = v3->_thisDeviceDataUsed;
    v3->_thisDeviceDataUsed = 0;

    sharedDataUsed = v3->_sharedDataUsed;
    v3->_sharedDataUsed = 0;

    sharedPlanIdentifier = v3->_sharedPlanIdentifier;
    v3->_sharedPlanIdentifier = 0;
  }
  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendFormat:@", units=%s", CTSweetgumDataUnitsAsString(-[CTSweetgumUsagePlanItemData units](self, "units"))];
  v4 = [(CTSweetgumUsagePlanItemData *)self capacity];
  [v3 appendFormat:@", capacity=%@", v4];

  v5 = [(CTSweetgumUsagePlanItemData *)self maxDataBeforeThrottling];
  [v3 appendFormat:@", maxDataBeforeThrottling=%@", v5];

  v6 = [(CTSweetgumUsagePlanItemData *)self thisDeviceDataUsed];
  [v3 appendFormat:@", used=%@", v6];

  v7 = [(CTSweetgumUsagePlanItemData *)self sharedDataUsed];
  [v3 appendFormat:@", sharedDataUsed=%@", v7];

  v8 = [(CTSweetgumUsagePlanItemData *)self sharedPlanIdentifier];
  [v3 appendFormat:@", sharedPlanIdentifier=%@", v8];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (CTSweetgumUsagePlanItemData *)a3;
  if (v7 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v8 = [(CTSweetgumUsagePlanItemData *)self units];
      if (v8 == [(CTSweetgumUsagePlanItemData *)v7 units])
      {
        v9 = [(CTSweetgumUsagePlanItemData *)self capacity];
        objc_super v10 = [(CTSweetgumUsagePlanItemData *)v7 capacity];
        if (v9 != v10)
        {
          v11 = [(CTSweetgumUsagePlanItemData *)self capacity];
          [(CTSweetgumUsagePlanItemData *)v7 capacity];
          v39 = v38 = v11;
          if (!objc_msgSend(v11, "isEqualToString:"))
          {
            char v12 = 0;
            goto LABEL_32;
          }
        }
        v13 = [(CTSweetgumUsagePlanItemData *)self maxDataBeforeThrottling];
        v14 = [(CTSweetgumUsagePlanItemData *)v7 maxDataBeforeThrottling];
        if (v13 != v14)
        {
          v5 = [(CTSweetgumUsagePlanItemData *)self maxDataBeforeThrottling];
          v3 = [(CTSweetgumUsagePlanItemData *)v7 maxDataBeforeThrottling];
          if (![v5 isEqualToString:v3])
          {
            char v12 = 0;
LABEL_30:

LABEL_31:
            if (v9 == v10)
            {
LABEL_33:

              goto LABEL_34;
            }
LABEL_32:

            goto LABEL_33;
          }
        }
        uint64_t v15 = [(CTSweetgumUsagePlanItemData *)self thisDeviceDataUsed];
        uint64_t v36 = [(CTSweetgumUsagePlanItemData *)v7 thisDeviceDataUsed];
        v37 = (void *)v15;
        if (v15 == v36)
        {
          v35 = v3;
        }
        else
        {
          v16 = [(CTSweetgumUsagePlanItemData *)self thisDeviceDataUsed];
          v33 = [(CTSweetgumUsagePlanItemData *)v7 thisDeviceDataUsed];
          v34 = v16;
          if (!objc_msgSend(v16, "isEqualToString:"))
          {
            char v12 = 0;
            v20 = (void *)v36;
            v19 = v37;
LABEL_28:

LABEL_29:
            if (v13 == v14) {
              goto LABEL_31;
            }
            goto LABEL_30;
          }
          v35 = v3;
        }
        v17 = [(CTSweetgumUsagePlanItemData *)self sharedDataUsed];
        v18 = [(CTSweetgumUsagePlanItemData *)v7 sharedDataUsed];
        if (v17 == v18)
        {
          v30 = v5;
          v31 = v14;
        }
        else
        {
          v4 = [(CTSweetgumUsagePlanItemData *)self sharedDataUsed];
          v32 = [(CTSweetgumUsagePlanItemData *)v7 sharedDataUsed];
          if (!objc_msgSend(v4, "isEqualToString:"))
          {
            char v12 = 0;
            goto LABEL_26;
          }
          v30 = v5;
          v31 = v14;
        }
        v21 = [(CTSweetgumUsagePlanItemData *)self sharedPlanIdentifier];
        uint64_t v22 = [(CTSweetgumUsagePlanItemData *)v7 sharedPlanIdentifier];
        if (v21 == (void *)v22)
        {

          char v12 = 1;
        }
        else
        {
          v23 = (void *)v22;
          [(CTSweetgumUsagePlanItemData *)self sharedPlanIdentifier];
          v24 = v28 = v4;
          [(CTSweetgumUsagePlanItemData *)v7 sharedPlanIdentifier];
          v29 = v13;
          v26 = v25 = v17;
          char v12 = [v24 isEqualToString:v26];

          v17 = v25;
          v13 = v29;

          v4 = v28;
        }
        v5 = v30;
        v14 = v31;
        if (v17 == v18)
        {
LABEL_27:

          v20 = (void *)v36;
          v19 = v37;
          v3 = v35;
          if (v37 == (void *)v36) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
LABEL_26:

        goto LABEL_27;
      }
    }
    char v12 = 0;
  }
LABEL_34:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t units = self->_units;
  id v5 = a3;
  [v5 encodeInteger:units forKey:@"units"];
  [v5 encodeObject:self->_capacity forKey:@"capacity"];
  [v5 encodeObject:self->_maxDataBeforeThrottling forKey:@"maxDataBeforeThrottling"];
  [v5 encodeObject:self->_thisDeviceDataUsed forKey:@"thisDeviceDataUsed"];
  [v5 encodeObject:self->_sharedDataUsed forKey:@"sharedDataUsed"];
  [v5 encodeObject:self->_sharedPlanIdentifier forKey:@"sharedPlanIdentifier"];
}

- (CTSweetgumUsagePlanItemData)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTSweetgumUsagePlanItemData;
  id v5 = [(CTSweetgumUsagePlanItemData *)&v17 init];
  if (v5)
  {
    v5->_int64_t units = [v4 decodeIntegerForKey:@"units"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"capacity"];
    capacity = v5->_capacity;
    v5->_capacity = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxDataBeforeThrottling"];
    maxDataBeforeThrottling = v5->_maxDataBeforeThrottling;
    v5->_maxDataBeforeThrottling = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"thisDeviceDataUsed"];
    thisDeviceDataUsed = v5->_thisDeviceDataUsed;
    v5->_thisDeviceDataUsed = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedDataUsed"];
    sharedDataUsed = v5->_sharedDataUsed;
    v5->_sharedDataUsed = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedPlanIdentifier"];
    sharedPlanIdentifier = v5->_sharedPlanIdentifier;
    v5->_sharedPlanIdentifier = (NSString *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)units
{
  return self->_units;
}

- (void)setUnits:(int64_t)a3
{
  self->_int64_t units = a3;
}

- (NSString)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(id)a3
{
}

- (NSString)maxDataBeforeThrottling
{
  return self->_maxDataBeforeThrottling;
}

- (void)setMaxDataBeforeThrottling:(id)a3
{
}

- (NSString)thisDeviceDataUsed
{
  return self->_thisDeviceDataUsed;
}

- (void)setThisDeviceDataUsed:(id)a3
{
}

- (NSString)sharedDataUsed
{
  return self->_sharedDataUsed;
}

- (void)setSharedDataUsed:(id)a3
{
}

- (NSString)sharedPlanIdentifier
{
  return self->_sharedPlanIdentifier;
}

- (void)setSharedPlanIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedPlanIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedDataUsed, 0);
  objc_storeStrong((id *)&self->_thisDeviceDataUsed, 0);
  objc_storeStrong((id *)&self->_maxDataBeforeThrottling, 0);

  objc_storeStrong((id *)&self->_capacity, 0);
}

@end
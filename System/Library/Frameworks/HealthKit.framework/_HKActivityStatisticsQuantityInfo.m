@interface _HKActivityStatisticsQuantityInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKQuantity)quantityValue;
- (NSDate)endDate;
- (NSDate)startDate;
- (_HKActivityStatisticsQuantityInfo)initWithCoder:(id)a3;
- (_HKActivityStatisticsQuantityInfo)initWithStartDate:(id)a3 endDate:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setQuantityValue:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation _HKActivityStatisticsQuantityInfo

- (_HKActivityStatisticsQuantityInfo)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_HKActivityStatisticsQuantityInfo;
  v8 = [(_HKActivityStatisticsQuantityInfo *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v9;

    uint64_t v11 = [v7 copy];
    endDate = v8->_endDate;
    v8->_endDate = (NSDate *)v11;
  }
  return v8;
}

- (void)setQuantityValue:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  id v6 = NSStringFromSelector(sel_startDate);
  [v5 encodeObject:startDate forKey:v6];

  endDate = self->_endDate;
  v8 = NSStringFromSelector(sel_endDate);
  [v5 encodeObject:endDate forKey:v8];

  quantityValue = self->_quantityValue;
  NSStringFromSelector(sel_quantityValue);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:quantityValue forKey:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantityValue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (_HKActivityStatisticsQuantityInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_HKActivityStatisticsQuantityInfo;
  id v5 = [(_HKActivityStatisticsQuantityInfo *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_startDate);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = NSStringFromSelector(sel_endDate);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_quantityValue);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    quantityValue = v5->_quantityValue;
    v5->_quantityValue = (HKQuantity *)v16;
  }
  return v5;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (HKQuantity)quantityValue
{
  return self->_quantityValue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if ([v5 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v6 = [v5 startDate];
    id v7 = [(_HKActivityStatisticsQuantityInfo *)self startDate];
    if (v6 != v7)
    {
      uint64_t v8 = [(_HKActivityStatisticsQuantityInfo *)self startDate];
      if (!v8)
      {
        char v11 = 0;
        goto LABEL_29;
      }
      v3 = (void *)v8;
      uint64_t v9 = [v5 startDate];
      uint64_t v10 = [(_HKActivityStatisticsQuantityInfo *)self startDate];
      if (![v9 isEqualToDate:v10])
      {
        char v11 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v32 = v10;
      v33 = v9;
    }
    uint64_t v12 = [v5 endDate];
    v13 = [(_HKActivityStatisticsQuantityInfo *)self endDate];
    if (v12 != v13)
    {
      uint64_t v14 = [(_HKActivityStatisticsQuantityInfo *)self endDate];
      if (!v14)
      {
        char v11 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v15 = (void *)v14;
      uint64_t v16 = [v5 endDate];
      v17 = [(_HKActivityStatisticsQuantityInfo *)self endDate];
      if (([v16 isEqualToDate:v17] & 1) == 0)
      {

        char v11 = 0;
LABEL_24:
        BOOL v25 = v6 == v7;
        goto LABEL_27;
      }
      v28 = v17;
      v29 = v16;
      v30 = v15;
    }
    v18 = [v5 quantityValue];
    uint64_t v19 = [(_HKActivityStatisticsQuantityInfo *)self quantityValue];
    char v11 = v18 == (void *)v19;
    if (v18 == (void *)v19)
    {
    }
    else
    {
      v20 = (void *)v19;
      v31 = v12;
      uint64_t v21 = [(_HKActivityStatisticsQuantityInfo *)self quantityValue];
      if (v21)
      {
        v22 = (void *)v21;
        v27 = v3;
        v23 = [v5 quantityValue];
        v24 = [(_HKActivityStatisticsQuantityInfo *)self quantityValue];
        char v11 = [v23 isEqual:v24];

        if (v31 == v13)
        {
        }
        else
        {
        }
        BOOL v25 = v6 == v7;
        v3 = v27;
LABEL_27:
        uint64_t v10 = v32;
        uint64_t v9 = v33;
        if (!v25) {
          goto LABEL_28;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    if (v12 != v13)
    {
    }
    goto LABEL_23;
  }
  char v11 = 0;
LABEL_30:

  return v11;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)_HKActivityStatisticsQuantityInfo;
  id v4 = [(_HKActivityStatisticsQuantityInfo *)&v10 description];
  id v5 = [(_HKActivityStatisticsQuantityInfo *)self startDate];
  uint64_t v6 = [(_HKActivityStatisticsQuantityInfo *)self endDate];
  id v7 = [(_HKActivityStatisticsQuantityInfo *)self quantityValue];
  uint64_t v8 = [v3 stringWithFormat:@"%@: Start Date: %@; End Date: %@; Quantity: %@", v4, v5, v6, v7];

  return v8;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

@end
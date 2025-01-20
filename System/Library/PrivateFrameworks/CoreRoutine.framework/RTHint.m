@interface RTHint
+ (BOOL)supportsSecureCoding;
+ (id)hintSourceToString:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (RTHint)init;
- (RTHint)initWithCoder:(id)a3;
- (RTHint)initWithLocation:(id)a3 source:(int64_t)a4 date:(id)a5;
- (RTLocation)location;
- (id)description;
- (int64_t)source;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTHint

- (RTLocation)location
{
  return self->_location;
}

- (int64_t)source
{
  return self->_source;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (RTHint)initWithLocation:(id)a3 source:(int64_t)a4 date:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (!v9)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      v15 = 0;
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: location";
LABEL_16:
    _os_log_error_impl(&dword_1A8FEF000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_13;
  }
  if (!v10)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: date";
    goto LABEL_16;
  }
  if ((unint64_t)(a4 + 1) >= 0xC)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTHint initWithLocation:source:date:]";
      __int16 v22 = 1024;
      int v23 = 89;
      _os_log_error_impl(&dword_1A8FEF000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: source >= RTHintSourceFirst() && source <= RTHintSourceLast() (in %s:%d)", buf, 0x12u);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)RTHint;
  v13 = [(RTHint *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_location, a3);
    v14->_source = a4;
    objc_storeStrong((id *)&v14->_date, a5);
  }
  self = v14;
  v15 = self;
LABEL_14:

  return v15;
}

+ (id)hintSourceToString:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xB) {
    return @"Bluetooth";
  }
  else {
    return off_1E5D746A8[a3 + 1];
  }
}

- (RTHint)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocation_source_date_);
}

- (id)description
{
  v3 = NSString;
  v4 = [(RTHint *)self location];
  v5 = +[RTHint hintSourceToString:[(RTHint *)self source]];
  v6 = [(RTHint *)self date];
  v7 = [v6 stringFromDate];
  v8 = [v3 stringWithFormat:@"location, %@, source, %@, date, %@", v4, v5, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v6 = a3;
  [v6 encodeObject:date forKey:@"date"];
  v5 = [NSNumber numberWithLongLong:self->_source];
  [v6 encodeObject:v5 forKey:@"source"];

  [v6 encodeObject:self->_location forKey:@"location"];
}

- (RTHint)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
  uint64_t v7 = [v6 integerValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];

  id v9 = [(RTHint *)self initWithLocation:v8 source:v7 date:v5];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTHint *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  if (self == v4)
  {
    char v18 = 1;
    goto LABEL_19;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [(RTHint *)self location];
    [v7 latitude];
    double v9 = v8;
    id v10 = [(RTHint *)v6 location];
    [v10 latitude];
    if (v9 == v11)
    {
      v12 = [(RTHint *)self location];
      [v12 longitude];
      double v14 = v13;
      v15 = [(RTHint *)v6 location];
      [v15 longitude];
      if (v14 == v16)
      {
        objc_super v19 = [(RTHint *)self location];
        [v19 horizontalUncertainty];
        double v21 = v20;
        __int16 v22 = [(RTHint *)v6 location];
        [v22 horizontalUncertainty];
        if (v21 == v23)
        {
          uint64_t v24 = [(RTHint *)self date];
          uint64_t v25 = [(RTHint *)v6 date];
          v30 = (void *)v24;
          v26 = (void *)v24;
          v27 = (void *)v25;
          if ([v26 isEqualToDate:v25])
          {
            int64_t v28 = [(RTHint *)self source];
            BOOL v17 = v28 != [(RTHint *)v6 source];
          }
          else
          {
            BOOL v17 = 1;
          }
        }
        else
        {
          BOOL v17 = 1;
        }
      }
      else
      {
        BOOL v17 = 1;
      }
    }
    else
    {
      BOOL v17 = 1;
    }

    char v18 = !v17;
  }
  else
  {
LABEL_7:
    char v18 = 0;
  }
LABEL_19:

  return v18;
}

- (unint64_t)hash
{
  v3 = [(RTHint *)self location];
  uint64_t v4 = [v3 hash];
  v5 = [(RTHint *)self date];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[RTHint source](self, "source"));
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

@end
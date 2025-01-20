@interface RTPredictedDate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (RTPredictedDate)initWithCoder:(id)a3;
- (RTPredictedDate)initWithDate:(id)a3 uncertainty:(double)a4 confidence:(double)a5;
- (double)confidence;
- (double)uncertainty;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTPredictedDate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPredictedDate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTPredictedDate;
  v5 = [(RTPredictedDate *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    [v4 decodeDoubleForKey:@"uncertainty"];
    v5->_uncertainty = v8;
    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeDouble:@"uncertainty" forKey:self->_uncertainty];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
}

- (RTPredictedDate)initWithDate:(id)a3 uncertainty:(double)a4 confidence:(double)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RTPredictedDate;
  double v9 = [(RTPredictedDate *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    date = v9->_date;
    v9->_date = (NSDate *)v10;

    v9->_uncertainty = a4;
    v9->_confidence = a5;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(RTPredictedDate *)self date];
  [(RTPredictedDate *)self uncertainty];
  double v7 = v6;
  [(RTPredictedDate *)self confidence];
  double v9 = (void *)[v4 initWithDate:v5 uncertainty:v7 confidence:v8];

  return v9;
}

- (id)description
{
  if (qword_1EB472170 != -1) {
    dispatch_once(&qword_1EB472170, &__block_literal_global_4);
  }
  v3 = NSString;
  [(NSDate *)self->_date timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;
  double v6 = [(id)_MergedGlobals_8 stringFromDate:self->_date];
  double v7 = [v3 stringWithFormat:@"%f, %@, uncertainty, %.2f, confidence, %.1f", v5, v6, *(void *)&self->_uncertainty, *(void *)&self->_confidence];

  return v7;
}

uint64_t __30__RTPredictedDate_description__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_8;
  _MergedGlobals_8 = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  [(id)_MergedGlobals_8 setLocale:v2];

  [(id)_MergedGlobals_8 setDateStyle:1];
  v3 = (void *)_MergedGlobals_8;
  return [v3 setTimeStyle:3];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (RTPredictedDate *)a3;
  double v6 = v5;
  if (v5 == self)
  {
    BOOL v12 = 1;
    goto LABEL_19;
  }
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v12 = 0;
    goto LABEL_19;
  }
  double v7 = v6;
  double v8 = [(RTPredictedDate *)self date];
  if (!v8)
  {
    v3 = [(RTPredictedDate *)v7 date];
    if (!v3)
    {
      char v11 = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  double v9 = [(RTPredictedDate *)self date];
  uint64_t v10 = [(RTPredictedDate *)v7 date];
  char v11 = [v9 isEqualToDate:v10];

  if (!v8) {
    goto LABEL_11;
  }
LABEL_12:

  [(RTPredictedDate *)self uncertainty];
  double v14 = v13;
  [(RTPredictedDate *)v7 uncertainty];
  double v16 = v15;
  [(RTPredictedDate *)self confidence];
  double v18 = v17;
  [(RTPredictedDate *)v7 confidence];
  if (v14 == v16) {
    char v20 = v11;
  }
  else {
    char v20 = 0;
  }
  if (v18 == v19) {
    BOOL v12 = v20;
  }
  else {
    BOOL v12 = 0;
  }

LABEL_19:
  return v12;
}

- (unint64_t)hash
{
  v3 = [(RTPredictedDate *)self date];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = NSNumber;
  [(RTPredictedDate *)self uncertainty];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = [v6 hash] ^ v4;
  double v8 = NSNumber;
  [(RTPredictedDate *)self confidence];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  unint64_t v10 = v7 ^ [v9 hash];

  return v10;
}

- (NSDate)date
{
  return self->_date;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
}

@end
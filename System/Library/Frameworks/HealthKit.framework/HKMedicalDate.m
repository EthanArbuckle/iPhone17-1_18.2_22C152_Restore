@interface HKMedicalDate
+ (BOOL)_validForm:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 error:(id *)a4;
+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 error:(id *)a6;
+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 nanosecond:(int64_t)a9 originalTimeZoneString:(id)a10 error:(id *)a11;
+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 originalTimeZoneString:(id)a9 error:(id *)a10;
+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 error:(id *)a5;
+ (id)_adjustDate:(id)a3 calendar:(id)a4 form:(int64_t)a5;
+ (id)_descriptionForForm:(int64_t)a3;
+ (id)_medicalDateWithForm:(int64_t)a3 underlyingDate:(id)a4 originalTimeZoneString:(id)a5;
+ (id)medicalDateFromComponents:(id)a3 originalTimeZoneString:(id)a4 form:(int64_t)a5 error:(id *)a6;
+ (id)medicalDateFromDate:(id)a3 originalTimeZone:(id)a4;
+ (id)referenceCalendar;
+ (id)referenceCalendarWithLocalTimezone;
+ (unint64_t)_calendarUnitForForm:(int64_t)a3;
- (BOOL)isCompatibleWithMedicalDateForm:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (HKMedicalDate)initWithCoder:(id)a3;
- (NSDate)dateForUTC;
- (NSDate)underlyingDate;
- (NSString)originalTimeZoneString;
- (id)_initWithForm:(int64_t)a3 underlyingDate:(id)a4 originalTimeZoneString:(id)a5;
- (id)adjustedDateForCalendar:(id)a3;
- (id)description;
- (int64_t)form;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalDate

+ (id)medicalDateFromComponents:(id)a3 originalTimeZoneString:(id)a4 form:(int64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([v10 isValidDate])
  {
    v12 = [a1 referenceCalendar];
    v13 = [v12 dateFromComponents:v10];

    id v14 = [[HKMedicalDate alloc] _initWithForm:a5 underlyingDate:v13 originalTimeZoneString:v11];
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = objc_opt_class();
    v13 = +[HKMedicalDate _descriptionForForm:a5];
    objc_msgSend(v15, "hk_assignError:code:format:", a6, 3, @"%@: Invalid date components for form: %@", v16, v13);
    id v14 = 0;
  }

  return v14;
}

+ (id)referenceCalendar
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithUTCTimeZone");
}

+ (id)referenceCalendarWithLocalTimezone
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendarWithLocalTimeZone");
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 error:(id *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v8 = [a1 referenceCalendar];
  [v7 setCalendar:v8];

  [v7 setYear:a3];
  v9 = [a1 medicalDateFromComponents:v7 originalTimeZoneString:0 form:3 error:a4];

  return (HKMedicalDate *)v9;
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 error:(id *)a5
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  id v10 = [a1 referenceCalendar];
  [v9 setCalendar:v10];

  [v9 setYear:a3];
  [v9 setMonth:a4];
  id v11 = [a1 medicalDateFromComponents:v9 originalTimeZoneString:0 form:2 error:a5];

  return (HKMedicalDate *)v11;
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 error:(id *)a6
{
  id v11 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  v12 = [a1 referenceCalendar];
  [v11 setCalendar:v12];

  [v11 setYear:a3];
  [v11 setMonth:a4];
  [v11 setDay:a5];
  v13 = [a1 medicalDateFromComponents:v11 originalTimeZoneString:0 form:1 error:a6];

  return (HKMedicalDate *)v13;
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 originalTimeZoneString:(id)a9 error:(id *)a10
{
  v17 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v18 = a9;
  id v19 = objc_alloc_init(v17);
  v20 = [a1 referenceCalendar];
  [v19 setCalendar:v20];

  [v19 setYear:a3];
  [v19 setMonth:a4];
  [v19 setDay:a5];
  [v19 setHour:a6];
  [v19 setMinute:a7];
  [v19 setSecond:a8];
  v21 = [a1 medicalDateFromComponents:v19 originalTimeZoneString:v18 form:0 error:a10];

  return (HKMedicalDate *)v21;
}

+ (HKMedicalDate)medicalDateWithYear:(int64_t)a3 month:(int64_t)a4 day:(int64_t)a5 hour:(int64_t)a6 minute:(int64_t)a7 second:(int64_t)a8 nanosecond:(int64_t)a9 originalTimeZoneString:(id)a10 error:(id *)a11
{
  v17 = (objc_class *)MEMORY[0x1E4F1C9D8];
  id v18 = a10;
  id v19 = objc_alloc_init(v17);
  v20 = [a1 referenceCalendar];
  [v19 setCalendar:v20];

  [v19 setYear:a3];
  [v19 setMonth:a4];
  [v19 setDay:a5];
  [v19 setHour:a6];
  [v19 setMinute:a7];
  [v19 setSecond:a8];
  [v19 setNanosecond:a9];
  v21 = [a1 medicalDateFromComponents:v19 originalTimeZoneString:v18 form:0 error:a11];

  return (HKMedicalDate *)v21;
}

+ (id)medicalDateFromDate:(id)a3 originalTimeZone:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a4;
  [a3 timeIntervalSince1970];
  v8 = [v5 dateWithTimeIntervalSince1970:trunc(v7)];
  id v9 = [HKMedicalDate alloc];
  id v10 = [v6 name];

  id v11 = [(HKMedicalDate *)v9 _initWithForm:0 underlyingDate:v8 originalTimeZoneString:v10];

  return v11;
}

- (id)adjustedDateForCalendar:(id)a3
{
  underlyingDate = self->_underlyingDate;
  id v5 = a3;
  id v6 = +[HKMedicalDate _adjustDate:underlyingDate calendar:v5 form:[(HKMedicalDate *)self form]];

  return v6;
}

- (BOOL)isCompatibleWithMedicalDateForm:(int64_t)a3
{
  return [(HKMedicalDate *)self form] <= a3;
}

- (NSDate)dateForUTC
{
  return self->_underlyingDate;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = +[HKMedicalDate _descriptionForForm:[(HKMedicalDate *)self form]];
  id v6 = [(HKMedicalDate *)self underlyingDate];
  double v7 = [(HKMedicalDate *)self originalTimeZoneString];
  v8 = [v3 stringWithFormat:@"%@: form: %@, underlyingDate: %@, originalTimeZoneString: %@", v4, v5, v6, v7];

  return v8;
}

+ (id)_medicalDateWithForm:(int64_t)a3 underlyingDate:(id)a4 originalTimeZoneString:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[HKMedicalDate alloc] _initWithForm:a3 underlyingDate:v8 originalTimeZoneString:v7];

  return v9;
}

+ (id)_adjustDate:(id)a3 calendar:(id)a4 form:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 referenceCalendar];
  if ([v9 isEqual:v10])
  {
    id v11 = v8;
  }
  else
  {
    v12 = objc_msgSend(v10, "components:fromDate:", +[HKMedicalDate _calendarUnitForForm:](HKMedicalDate, "_calendarUnitForForm:", a5), v8);
    id v11 = [v9 dateFromComponents:v12];
  }

  return v11;
}

- (id)_initWithForm:(int64_t)a3 underlyingDate:(id)a4 originalTimeZoneString:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (!v9)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HKMedicalDate.m", 194, @"Invalid parameter not satisfying: %@", @"underlyingDate" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HKMedicalDate;
  id v11 = [(HKMedicalDate *)&v19 init];
  v12 = v11;
  if (v11)
  {
    v11->_form = a3;
    uint64_t v13 = [v9 copy];
    underlyingDate = v12->_underlyingDate;
    v12->_underlyingDate = (NSDate *)v13;

    uint64_t v15 = [v10 copy];
    originalTimeZoneString = v12->_originalTimeZoneString;
    v12->_originalTimeZoneString = (NSString *)v15;
  }
  return v12;
}

+ (BOOL)_validForm:(int64_t)a3
{
  return (unint64_t)a3 < 4;
}

+ (unint64_t)_calendarUnitForForm:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 6;
  }
  else {
    return qword_19C3D3A20[a3];
  }
}

+ (id)_descriptionForForm:(int64_t)a3
{
  if ((unint64_t)a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Invalid HKMedicalDateForm: %ld", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E58C5790[a3];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalDate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalDate;
  id v5 = [(HKMedicalDate *)&v11 init];
  if (v5)
  {
    v5->_form = [v4 decodeIntegerForKey:@"form"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlyingDate"];
    underlyingDate = v5->_underlyingDate;
    v5->_underlyingDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalTimezoneString"];
    originalTimeZoneString = v5->_originalTimeZoneString;
    v5->_originalTimeZoneString = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HKMedicalDate form](self, "form"), @"form");
  id v5 = [(HKMedicalDate *)self underlyingDate];
  [v4 encodeObject:v5 forKey:@"underlyingDate"];

  id v6 = [(HKMedicalDate *)self originalTimeZoneString];
  [v4 encodeObject:v6 forKey:@"originalTimezoneString"];
}

- (unint64_t)hash
{
  int64_t v3 = [(HKMedicalDate *)self form];
  id v4 = [(HKMedicalDate *)self underlyingDate];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [(HKMedicalDate *)self originalTimeZoneString];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKMedicalDate *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t v6 = [(HKMedicalDate *)self form];
      if (v6 != [(HKMedicalDate *)v5 form]) {
        goto LABEL_16;
      }
      unint64_t v7 = [(HKMedicalDate *)self underlyingDate];
      uint64_t v8 = [(HKMedicalDate *)v5 underlyingDate];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        uint64_t v10 = [(HKMedicalDate *)v5 underlyingDate];
        if (!v10) {
          goto LABEL_15;
        }
        objc_super v11 = (void *)v10;
        v12 = [(HKMedicalDate *)self underlyingDate];
        uint64_t v13 = [(HKMedicalDate *)v5 underlyingDate];
        int v14 = [v12 isEqualToDate:v13];

        if (!v14) {
          goto LABEL_16;
        }
      }
      unint64_t v7 = [(HKMedicalDate *)self originalTimeZoneString];
      uint64_t v16 = [(HKMedicalDate *)v5 originalTimeZoneString];
      if (v7 == (void *)v16)
      {

LABEL_20:
        BOOL v15 = 1;
        goto LABEL_17;
      }
      id v9 = (void *)v16;
      uint64_t v17 = [(HKMedicalDate *)v5 originalTimeZoneString];
      if (v17)
      {
        id v18 = (void *)v17;
        objc_super v19 = [(HKMedicalDate *)self originalTimeZoneString];
        v20 = [(HKMedicalDate *)v5 originalTimeZoneString];
        char v21 = [v19 isEqualToString:v20];

        if (v21) {
          goto LABEL_20;
        }
LABEL_16:
        BOOL v15 = 0;
LABEL_17:

        goto LABEL_18;
      }
LABEL_15:

      goto LABEL_16;
    }
    BOOL v15 = 0;
  }
LABEL_18:

  return v15;
}

- (int64_t)form
{
  return self->_form;
}

- (NSString)originalTimeZoneString
{
  return self->_originalTimeZoneString;
}

- (NSDate)underlyingDate
{
  return self->_underlyingDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDate, 0);

  objc_storeStrong((id *)&self->_originalTimeZoneString, 0);
}

@end
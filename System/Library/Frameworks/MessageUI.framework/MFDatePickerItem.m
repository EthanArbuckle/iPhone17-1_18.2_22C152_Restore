@interface MFDatePickerItem
- (BOOL)isEqual:(id)a3;
- (BOOL)timeSwitchEnabled;
- (MFCity)selectedCity;
- (MFDatePickerItem)initWithIdentifier:(id)a3 selectedDate:(id)a4 selectedTime:(id)a5 selectedCity:(id)a6 datePickerComponentType:(int64_t)a7;
- (MFDatePickerItem)initWithIdentifier:(id)a3 selectedDate:(id)a4 selectedTime:(id)a5 selectedCity:(id)a6 datePickerComponentType:(int64_t)a7 timeSwitchEnabled:(BOOL)a8;
- (MFDatePickerItemIdentifier)identifier;
- (NSDate)selectedDate;
- (NSDate)selectedTime;
- (int64_t)datePickerComponentType;
- (unint64_t)hash;
- (void)setDatePickerComponentType:(int64_t)a3;
- (void)setSelectedCity:(id)a3;
- (void)setSelectedDate:(id)a3;
- (void)setSelectedTime:(id)a3;
- (void)setTimeSwitchEnabled:(BOOL)a3;
@end

@implementation MFDatePickerItem

- (MFDatePickerItem)initWithIdentifier:(id)a3 selectedDate:(id)a4 selectedTime:(id)a5 selectedCity:(id)a6 datePickerComponentType:(int64_t)a7
{
  return [(MFDatePickerItem *)self initWithIdentifier:a3 selectedDate:a4 selectedTime:a5 selectedCity:a6 datePickerComponentType:a7 timeSwitchEnabled:0];
}

- (MFDatePickerItem)initWithIdentifier:(id)a3 selectedDate:(id)a4 selectedTime:(id)a5 selectedCity:(id)a6 datePickerComponentType:(int64_t)a7 timeSwitchEnabled:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)MFDatePickerItem;
  v18 = [(MFDatePickerItem *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_selectedDate, a4);
    objc_storeStrong((id *)&v19->_selectedTime, a5);
    objc_storeStrong((id *)&v19->_selectedCity, a6);
    v19->_datePickerComponentType = a7;
    v19->_timeSwitchEnabled = a8;
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MFDatePickerItem *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(MFDatePickerItem *)self identifier];
      v7 = [(MFDatePickerItem *)v5 identifier];
      if ([v6 isEqual:v7])
      {
        v8 = [(MFDatePickerItem *)self selectedTime];
        v9 = [(MFDatePickerItem *)v5 selectedTime];
        if ([v8 isEqualToDate:v9])
        {
          v10 = [(MFDatePickerItem *)self selectedDate];
          v11 = [(MFDatePickerItem *)self selectedDate];
          if ([v10 isEqualToDate:v11])
          {
            id v17 = [(MFDatePickerItem *)self selectedCity];
            v12 = [(MFDatePickerItem *)v5 selectedCity];
            if ([v17 isEqual:v12]
              && (int64_t v16 = [(MFDatePickerItem *)self datePickerComponentType],
                  v16 == [(MFDatePickerItem *)v5 datePickerComponentType]))
            {
              BOOL v13 = [(MFDatePickerItem *)self timeSwitchEnabled];
              BOOL v14 = v13 ^ [(MFDatePickerItem *)v5 timeSwitchEnabled] ^ 1;
            }
            else
            {
              LOBYTE(v14) = 0;
            }
          }
          else
          {
            LOBYTE(v14) = 0;
          }
        }
        else
        {
          LOBYTE(v14) = 0;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [(MFDatePickerItem *)self identifier];
  uint64_t v4 = [v3 hash];

  v5 = [(MFDatePickerItem *)self selectedDate];
  uint64_t v6 = [v5 hash];

  v7 = [(MFDatePickerItem *)self selectedTime];
  uint64_t v8 = [v7 hash];

  v9 = [(MFDatePickerItem *)self selectedCity];
  uint64_t v10 = 33 * (33 * (33 * (33 * v4 + v6) + v8) + [v9 hash]);

  int64_t v11 = 33 * (v10 + [(MFDatePickerItem *)self datePickerComponentType]);
  return v11 + [(MFDatePickerItem *)self timeSwitchEnabled] + 1291467969;
}

- (MFDatePickerItemIdentifier)identifier
{
  return self->_identifier;
}

- (NSDate)selectedDate
{
  return self->_selectedDate;
}

- (void)setSelectedDate:(id)a3
{
}

- (NSDate)selectedTime
{
  return self->_selectedTime;
}

- (void)setSelectedTime:(id)a3
{
}

- (MFCity)selectedCity
{
  return self->_selectedCity;
}

- (void)setSelectedCity:(id)a3
{
}

- (int64_t)datePickerComponentType
{
  return self->_datePickerComponentType;
}

- (void)setDatePickerComponentType:(int64_t)a3
{
  self->_datePickerComponentType = a3;
}

- (BOOL)timeSwitchEnabled
{
  return self->_timeSwitchEnabled;
}

- (void)setTimeSwitchEnabled:(BOOL)a3
{
  self->_timeSwitchEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCity, 0);
  objc_storeStrong((id *)&self->_selectedTime, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
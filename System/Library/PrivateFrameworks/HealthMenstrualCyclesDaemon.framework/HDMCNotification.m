@interface HDMCNotification
- (BOOL)isEqual:(id)a3;
- (HDMCNotification)initWithFireOnDayIndex:(int64_t)a3 category:(id)a4;
- (HDMCNotification)initWithFireOnDayIndex:(int64_t)a3 category:(id)a4 fertileWindowEndDayIndex:(int64_t)a5 daysShifted:(int64_t)a6;
- (NSString)category;
- (NSString)hk_redactedDescription;
- (id)description;
- (id)eventIdentifierFromUpdateFertileWindowNotification;
- (int64_t)daysShifted;
- (int64_t)fertileWindowEndDayIndex;
- (int64_t)fireOnDayIndex;
@end

@implementation HDMCNotification

- (HDMCNotification)initWithFireOnDayIndex:(int64_t)a3 category:(id)a4
{
  return [(HDMCNotification *)self initWithFireOnDayIndex:a3 category:a4 fertileWindowEndDayIndex:0 daysShifted:0];
}

- (HDMCNotification)initWithFireOnDayIndex:(int64_t)a3 category:(id)a4 fertileWindowEndDayIndex:(int64_t)a5 daysShifted:(int64_t)a6
{
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDMCNotification;
  v12 = [(HDMCNotification *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_fireOnDayIndex = a3;
    objc_storeStrong((id *)&v12->_category, a4);
    v13->_fertileWindowEndDayIndex = a5;
    v13->_daysShifted = a6;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDMCNotification *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t fireOnDayIndex = self->_fireOnDayIndex;
      if (fireOnDayIndex == [(HDMCNotification *)v5 fireOnDayIndex])
      {
        category = self->_category;
        v8 = [(HDMCNotification *)v5 category];
        if ([(NSString *)category isEqualToString:v8]
          && (int64_t fertileWindowEndDayIndex = self->_fertileWindowEndDayIndex,
              fertileWindowEndDayIndex == [(HDMCNotification *)v5 fertileWindowEndDayIndex]))
        {
          int64_t daysShifted = self->_daysShifted;
          BOOL v11 = daysShifted == [(HDMCNotification *)v5 daysShifted];
        }
        else
        {
          BOOL v11 = 0;
        }
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p dayIndex:%ld category:%@ fertileWindowEndDayIndex:%ld daysShifted:%ld>", objc_opt_class(), self, self->_fireOnDayIndex, self->_category, self->_fertileWindowEndDayIndex, self->_daysShifted];
}

- (NSString)hk_redactedDescription
{
  return self->_category;
}

- (id)eventIdentifierFromUpdateFertileWindowNotification
{
  v3 = NSString;
  v4 = [(HDMCNotification *)self category];
  v5 = [v3 stringWithFormat:@"%@%ld_%ld", v4, -[HDMCNotification fertileWindowEndDayIndex](self, "fertileWindowEndDayIndex"), -[HDMCNotification daysShifted](self, "daysShifted")];

  return v5;
}

- (int64_t)fireOnDayIndex
{
  return self->_fireOnDayIndex;
}

- (NSString)category
{
  return self->_category;
}

- (int64_t)fertileWindowEndDayIndex
{
  return self->_fertileWindowEndDayIndex;
}

- (int64_t)daysShifted
{
  return self->_daysShifted;
}

- (void).cxx_destruct
{
}

@end
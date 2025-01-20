@interface GDMicroLocationVisitEvent
- (BOOL)isEnter;
- (BOOL)isEqual:(id)a3;
- (GDMicroLocationVisitEvent)initWithDate:(id)a3 microLocationIdentifier:(id)a4 probability:(double)a5 isEnter:(BOOL)a6;
- (NSDate)date;
- (NSString)microLocationIdentifier;
- (double)probability;
@end

@implementation GDMicroLocationVisitEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_microLocationIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (BOOL)isEnter
{
  return self->_isEnter;
}

- (double)probability
{
  return self->_probability;
}

- (NSString)microLocationIdentifier
{
  return self->_microLocationIdentifier;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (GDMicroLocationVisitEvent *)a3;
  v5 = v4;
  if (self == v4)
  {
    char isEqualToString = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    int isEnter = self->_isEnter;
    if (isEnter == objc_msgSend_isEnter(v6, v8, v9, v10)
      && (double probability = self->_probability, objc_msgSend_probability(v6, v11, v12, v13), probability == v18))
    {
      date = self->_date;
      v20 = objc_msgSend_date(v6, v15, v16, v17);
      if (objc_msgSend_isEqualToDate_(date, v21, (uint64_t)v20, v22))
      {
        microLocationIdentifier = self->_microLocationIdentifier;
        v27 = objc_msgSend_microLocationIdentifier(v6, v23, v24, v25);
        char isEqualToString = objc_msgSend_isEqualToString_(microLocationIdentifier, v28, (uint64_t)v27, v29);
      }
      else
      {
        char isEqualToString = 0;
      }
    }
    else
    {
      char isEqualToString = 0;
    }
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (GDMicroLocationVisitEvent)initWithDate:(id)a3 microLocationIdentifier:(id)a4 probability:(double)a5 isEnter:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GDMicroLocationVisitEvent;
  uint64_t v13 = [(GDMicroLocationVisitEvent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_date, a3);
    objc_storeStrong((id *)&v14->_microLocationIdentifier, a4);
    v14->_double probability = a5;
    v14->_int isEnter = a6;
  }

  return v14;
}

@end
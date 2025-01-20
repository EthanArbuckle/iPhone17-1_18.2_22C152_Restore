@interface GDGraphDateRelationship
- (GDGraphDateRelationship)initWithStartDateField:(id)a3 endDateField:(id)a4 occurrenceDateField:(id)a5 allStartDateField:(id)a6 allEndDateField:(id)a7 allOccurrenceDateField:(id)a8;
- (NSArray)allEndDate;
- (NSArray)allOccurrenceDate;
- (NSArray)allStartDate;
- (NSDate)endDate;
- (NSDate)occurrenceDate;
- (NSDate)startDate;
@end

@implementation GDGraphDateRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOccurrenceDate, 0);
  objc_storeStrong((id *)&self->_allEndDate, 0);
  objc_storeStrong((id *)&self->_allStartDate, 0);
  objc_storeStrong((id *)&self->_occurrenceDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (NSArray)allOccurrenceDate
{
  return self->_allOccurrenceDate;
}

- (NSArray)allEndDate
{
  return self->_allEndDate;
}

- (NSArray)allStartDate
{
  return self->_allStartDate;
}

- (NSDate)occurrenceDate
{
  return self->_occurrenceDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (GDGraphDateRelationship)initWithStartDateField:(id)a3 endDateField:(id)a4 occurrenceDateField:(id)a5 allStartDateField:(id)a6 allEndDateField:(id)a7 allOccurrenceDateField:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)GDGraphDateRelationship;
  v18 = [(GDGraphDateRelationship *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a3);
    objc_storeStrong((id *)&v19->_endDate, a4);
    objc_storeStrong((id *)&v19->_occurrenceDate, a5);
    objc_storeStrong((id *)&v19->_allStartDate, a6);
    objc_storeStrong((id *)&v19->_allEndDate, a7);
    objc_storeStrong((id *)&v19->_allOccurrenceDate, a8);
  }

  return v19;
}

@end
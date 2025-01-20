@interface ACHDateComponentInterval
- (ACHDateComponentInterval)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4;
- (BOOL)containsDateComponents:(id)a3 inCalendar:(id)a4;
- (NSDateComponents)endDateComponents;
- (NSDateComponents)startDateComponents;
- (id)chunked:(int64_t)a3 calendar:(id)a4;
- (id)description;
- (unint64_t)countOfDaysContainedInIntervalInCalendar:(id)a3;
@end

@implementation ACHDateComponentInterval

- (ACHDateComponentInterval)initWithStartDateComponents:(id)a3 endDateComponents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ACHDateComponentInterval;
  v9 = [(ACHDateComponentInterval *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDateComponents, a3);
    objc_storeStrong((id *)&v10->_endDateComponents, a4);
  }

  return v10;
}

- (BOOL)containsDateComponents:(id)a3 inCalendar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ACHDateComponentInterval *)self startDateComponents];
  v9 = [v6 dateFromComponents:v8];

  v10 = [(ACHDateComponentInterval *)self endDateComponents];
  v11 = [v6 dateFromComponents:v10];

  objc_super v12 = [v6 dateFromComponents:v7];

  v13 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v9 endDate:v11];
  LOBYTE(v7) = [v13 containsDate:v12];

  return (char)v7;
}

- (unint64_t)countOfDaysContainedInIntervalInCalendar:(id)a3
{
  id v4 = a3;
  v5 = [(ACHDateComponentInterval *)self startDateComponents];
  id v6 = [(ACHDateComponentInterval *)self endDateComponents];
  id v7 = [v4 components:16 fromDateComponents:v5 toDateComponents:v6 options:0];

  unint64_t v8 = [v7 day] + 1;
  return v8;
}

- (id)chunked:(int64_t)a3 calendar:(id)a4
{
  id v6 = a4;
  id v7 = [(ACHDateComponentInterval *)self startDateComponents];
  unint64_t v8 = [v6 dateFromComponents:v7];

  v9 = [(ACHDateComponentInterval *)self endDateComponents];
  v10 = [v6 dateFromComponents:v9];

  id v11 = v8;
  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_super v12 = v11;
  v25 = v11;
  if ([v11 compare:v10] != 1)
  {
    v13 = v11;
    do
    {
      v14 = (void *)MEMORY[0x223C4F4C0]();
      objc_super v12 = [v6 dateByAddingUnit:16 value:1 toDate:v13 options:0];

      v15 = [v6 components:16 fromDate:v11 toDate:v12 options:0];
      uint64_t v16 = [v15 day];

      uint64_t v17 = [v12 compare:v10];
      uint64_t v18 = v17;
      if (v16 == a3 || v17 != -1)
      {
        v19 = objc_msgSend(v6, "components:fromDate:", 28, v11, v25);
        if (v18 == -1) {
          v20 = v12;
        }
        else {
          v20 = v10;
        }
        v21 = [v6 components:28 fromDate:v20];
        v22 = [[ACHDateComponentInterval alloc] initWithStartDateComponents:v19 endDateComponents:v21];
        [v26 addObject:v22];
        v23 = [v6 dateByAddingUnit:16 value:1 toDate:v12 options:0];

        id v11 = v23;
        objc_super v12 = v11;
      }
      v13 = v12;
    }
    while ([v12 compare:v10] != 1);
  }

  return v26;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(ACHDateComponentInterval *)self startDateComponents];
  v5 = ACHYearMonthDayStringFromDateComponents(v4);
  id v6 = [(ACHDateComponentInterval *)self endDateComponents];
  id v7 = ACHYearMonthDayStringFromDateComponents(v6);
  unint64_t v8 = [v3 stringWithFormat:@"%@ - %@", v5, v7];

  return v8;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDateComponents, 0);

  objc_storeStrong((id *)&self->_startDateComponents, 0);
}

@end
@interface CKTokenizationDateRange
- (CKTokenizationDateRange)initWithStartDate:(id)a3 endDate:(id)a4;
- (NSDate)endDate;
- (NSDate)startDate;
- (id)serializeToStringArray;
@end

@implementation CKTokenizationDateRange

- (CKTokenizationDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKTokenizationDateRange;
  v9 = [(CKTokenizationDateRange *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    objc_storeStrong((id *)&v10->_endDate, a4);
  }

  return v10;
}

- (id)serializeToStringArray
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v3 = +[CKTokenizationDateParser serializationDateFormatter];
  v4 = [v3 stringFromDate:self->_startDate];
  v9[0] = v4;
  v5 = +[CKTokenizationDateParser serializationDateFormatter];
  v6 = [v5 stringFromDate:self->_endDate];
  v9[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
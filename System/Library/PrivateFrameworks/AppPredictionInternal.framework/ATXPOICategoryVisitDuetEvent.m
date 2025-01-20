@interface ATXPOICategoryVisitDuetEvent
- (ATXPOICategoryVisitDuetEvent)initWithCurrentContextStoreValues;
- (ATXPOICategoryVisitDuetEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (ATXPOICategoryVisitDuetEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5 hasExited:(BOOL)a6;
- (BOOL)hasExited;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPOICategoryVisitDuetEvent:(id)a3;
- (NSOrderedSet)possibleCategoryNames;
- (id)description;
- (id)identifier;
@end

@implementation ATXPOICategoryVisitDuetEvent

- (ATXPOICategoryVisitDuetEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5 hasExited:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXPOICategoryVisitDuetEvent;
  v12 = [(ATXDuetEvent *)&v15 initWithStartDate:a4 endDate:a5];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_possibleCategoryNames, a3);
    v13->_hasExited = a6;
  }

  return v13;
}

- (ATXPOICategoryVisitDuetEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  return [(ATXPOICategoryVisitDuetEvent *)self initWithPossibleCategoryNames:a3 startDate:a4 endDate:a5 hasExited:1];
}

- (ATXPOICategoryVisitDuetEvent)initWithCurrentContextStoreValues
{
  v3 = +[ATXPOICategoryVisitDuetDataProvider sharedInstance];
  v4 = [v3 getCurrentVisit];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXPOICategoryVisitDuetEvent *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPOICategoryVisitDuetEvent *)self isEqualToATXPOICategoryVisitDuetEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXPOICategoryVisitDuetEvent:(id)a3
{
  v4 = (id *)a3;
  possibleCategoryNames = self->_possibleCategoryNames;
  BOOL v6 = (NSOrderedSet *)v4[5];
  if (possibleCategoryNames == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = possibleCategoryNames;
    char v9 = [(NSOrderedSet *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  id v11 = [(ATXDuetEvent *)self startDate];
  v12 = [v4 startDate];
  if ([v11 isEqualToDate:v12])
  {
    v13 = [(ATXDuetEvent *)self endDate];
    v14 = [v4 endDate];
    char v10 = [v13 isEqualToDate:v14];
  }
  else
  {
    char v10 = 0;
  }

LABEL_9:
  return v10;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(ATXPOICategoryVisitDuetEvent *)self possibleCategoryNames];
  v5 = [(ATXDuetEvent *)self startDate];
  BOOL v6 = [(ATXDuetEvent *)self endDate];
  v7 = (void *)[v3 initWithFormat:@"ATXPOICategoryVisitDuetEvent categories: %@, startDate: %@, endDate: %@ hasExited: %d", v4, v5, v6, -[ATXPOICategoryVisitDuetEvent hasExited](self, "hasExited")];

  return v7;
}

- (id)identifier
{
  id v3 = [(ATXPOICategoryVisitDuetEvent *)self possibleCategoryNames];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [NSString alloc];
    BOOL v6 = [(ATXPOICategoryVisitDuetEvent *)self possibleCategoryNames];
    v7 = [v6 objectAtIndexedSubscript:0];
    v8 = (__CFString *)[v5 initWithFormat:@"%@", v7];
  }
  else
  {
    v8 = @"unknown";
  }
  return v8;
}

- (NSOrderedSet)possibleCategoryNames
{
  return self->_possibleCategoryNames;
}

- (BOOL)hasExited
{
  return self->_hasExited;
}

- (void).cxx_destruct
{
}

@end
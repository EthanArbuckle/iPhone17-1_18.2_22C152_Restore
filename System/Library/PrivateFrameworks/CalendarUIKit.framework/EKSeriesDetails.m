@interface EKSeriesDetails
- (EKEvent)masterEvent;
- (EKSeriesDetails)initWithEvent:(id)a3;
- (EKSeriesDetails)initWithMasterEvent:(id)a3 detachedEvents:(id)a4 exceptionDates:(id)a5;
- (NSArray)detachedEvents;
- (NSSet)exceptionDates;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDetachedEvents:(id)a3;
- (void)setExceptionDates:(id)a3;
- (void)setMasterEvent:(id)a3;
@end

@implementation EKSeriesDetails

- (EKSeriesDetails)initWithMasterEvent:(id)a3 detachedEvents:(id)a4 exceptionDates:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EKSeriesDetails;
  v12 = [(EKSeriesDetails *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_masterEvent, a3);
    objc_storeStrong((id *)&v13->_detachedEvents, a4);
    objc_storeStrong((id *)&v13->_exceptionDates, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = (void *)[(EKEvent *)self->_masterEvent copy];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_detachedEvents copyItems:1];
  v7 = (void *)[v4 initWithMasterEvent:v5 detachedEvents:v6 exceptionDates:self->_exceptionDates];

  return v7;
}

- (EKSeriesDetails)initWithEvent:(id)a3
{
  v4 = [a3 masterEvent];
  v5 = [v4 detachedItems];
  v6 = [v5 allObjects];
  v7 = [v4 exceptionDates];
  v8 = [(EKSeriesDetails *)self initWithMasterEvent:v4 detachedEvents:v6 exceptionDates:v7];

  return v8;
}

- (EKEvent)masterEvent
{
  return (EKEvent *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMasterEvent:(id)a3
{
}

- (NSArray)detachedEvents
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDetachedEvents:(id)a3
{
}

- (NSSet)exceptionDates
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExceptionDates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exceptionDates, 0);
  objc_storeStrong((id *)&self->_detachedEvents, 0);

  objc_storeStrong((id *)&self->_masterEvent, 0);
}

@end
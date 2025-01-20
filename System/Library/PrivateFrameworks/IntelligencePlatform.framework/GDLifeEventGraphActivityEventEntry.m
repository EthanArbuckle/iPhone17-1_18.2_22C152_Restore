@interface GDLifeEventGraphActivityEventEntry
- (GDGraphActivityEventEntityIdentifier)entityIdentifier;
- (GDLifeEventGraphActivityEventEntry)initWithEntityIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (NSDate)endDate;
- (NSDate)startDate;
@end

@implementation GDLifeEventGraphActivityEventEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (GDGraphActivityEventEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDLifeEventGraphActivityEventEntry)initWithEntityIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)GDLifeEventGraphActivityEventEntry;
  v12 = [(GDLifeEventGraphActivityEventEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityIdentifier, a3);
    objc_storeStrong((id *)&v13->_startDate, a4);
    objc_storeStrong((id *)&v13->_endDate, a5);
  }

  return v13;
}

@end
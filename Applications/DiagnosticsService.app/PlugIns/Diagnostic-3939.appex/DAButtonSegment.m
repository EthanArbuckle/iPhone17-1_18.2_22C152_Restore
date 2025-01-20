@interface DAButtonSegment
- (DAButtonSegment)initWithDictionary:(id)a3;
- (DAStateRange)range;
- (NSString)location;
- (int)numberOfActions;
- (void)setLocation:(id)a3;
- (void)setNumberOfActions:(int)a3;
- (void)setRange:(id)a3;
@end

@implementation DAButtonSegment

- (DAButtonSegment)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v15 = 0;
  v14.receiver = self;
  v14.super_class = (Class)DAButtonSegment;
  v5 = [(DASpecification *)&v14 initWithDictionary:v4];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [v4 dk_stringFromRequiredKey:@"location" maxLength:100 failed:&v15];
    location = v6->_location;
    v6->_location = (NSString *)v7;

    v9 = [v4 dk_numberFromRequiredKey:@"numberOfActions" lowerBound:&off_1000110E8 upperBound:&off_100011100 failed:&v15];
    v6->_numberOfActions = [v9 intValue];

    v10 = [[DAStateRange alloc] initWithDictionary:v4];
    range = v6->_range;
    v6->_range = v10;

    BOOL v12 = v15 == 0;
  }
  else
  {
    BOOL v12 = 1;
  }
  if (!v6->_range || !v12)
  {

    v6 = 0;
  }

  return v6;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int)numberOfActions
{
  return self->_numberOfActions;
}

- (void)setNumberOfActions:(int)a3
{
  self->_numberOfActions = a3;
}

- (DAStateRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end
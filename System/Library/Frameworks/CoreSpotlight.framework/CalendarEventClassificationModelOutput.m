@interface CalendarEventClassificationModelOutput
- (CalendarEventClassificationModelOutput)initWithY:(id)a3;
- (MLMultiArray)y;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setY:(id)a3;
@end

@implementation CalendarEventClassificationModelOutput

- (CalendarEventClassificationModelOutput)initWithY:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalendarEventClassificationModelOutput;
  v6 = [(CalendarEventClassificationModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_y, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000E7440];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"y"])
  {
    v4 = [(CalendarEventClassificationModelOutput *)self y];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)y
{
  return self->_y;
}

- (void)setY:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
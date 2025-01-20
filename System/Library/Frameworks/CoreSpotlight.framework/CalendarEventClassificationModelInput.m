@interface CalendarEventClassificationModelInput
- (CalendarEventClassificationModelInput)initWithEmb:(id)a3;
- (MLMultiArray)emb;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setEmb:(id)a3;
@end

@implementation CalendarEventClassificationModelInput

- (CalendarEventClassificationModelInput)initWithEmb:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalendarEventClassificationModelInput;
  v6 = [(CalendarEventClassificationModelInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_emb, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000E7428];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"emb"])
  {
    v4 = [(CalendarEventClassificationModelInput *)self emb];
    id v5 = +[MLFeatureValue featureValueWithMultiArray:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (MLMultiArray)emb
{
  return self->_emb;
}

- (void)setEmb:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
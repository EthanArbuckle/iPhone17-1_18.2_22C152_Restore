@interface DATouchButtonParameters
- (DATouchButtonParameters)initWithDictionary:(id)a3;
- (NSArray)targetEvents;
- (void)setTargetEvents:(id)a3;
@end

@implementation DATouchButtonParameters

- (DATouchButtonParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v13 = 0;
  v12.receiver = self;
  v12.super_class = (Class)DATouchButtonParameters;
  v5 = [(DAParameters *)&v12 initWithDictionary:v4];
  if (v5)
  {
    v6 = +[NSSet setWithObject:objc_opt_class()];
    v7 = [v4 dk_arrayFromRequiredKey:@"targetEvents" types:v6 maxLength:100 failed:&v13];

    uint64_t v8 = +[DASpecification specificationFromArray:v7];
    targetEvents = v5->_targetEvents;
    v5->_targetEvents = (NSArray *)v8;

    BOOL v10 = v13 == 0;
  }
  else
  {
    BOOL v10 = 1;
  }
  if (!v5->_targetEvents || !v10)
  {

    v5 = 0;
  }

  return v5;
}

- (NSArray)targetEvents
{
  return self->_targetEvents;
}

- (void)setTargetEvents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
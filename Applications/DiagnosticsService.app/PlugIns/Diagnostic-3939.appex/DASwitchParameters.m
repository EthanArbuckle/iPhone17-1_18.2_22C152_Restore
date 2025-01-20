@interface DASwitchParameters
- (DASwitchParameters)initWithDictionary:(id)a3;
- (NSArray)states;
- (int)startingState;
- (void)setStartingState:(int)a3;
- (void)setStates:(id)a3;
@end

@implementation DASwitchParameters

- (DASwitchParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)DASwitchParameters;
  v5 = [(DAParameters *)&v15 initWithDictionary:v4];
  if (v5)
  {
    v6 = +[NSSet setWithObjects:@"on", @"off", 0];
    v7 = [v4 dk_stringFromRequiredKey:@"startingState" inSet:v6 failed:&v16];

    if ([v7 isEqualToString:@"on"])
    {
      int v8 = 1;
    }
    else
    {
      if (![v7 isEqualToString:@"off"])
      {
LABEL_8:
        v10 = +[NSSet setWithObject:objc_opt_class()];
        v11 = [v4 dk_arrayFromRequiredKey:@"states" types:v10 maxLength:100 failed:&v16];

        uint64_t v12 = +[DASpecification specificationFromArray:v11];
        states = v5->_states;
        v5->_states = (NSArray *)v12;

        BOOL v9 = v16 == 0;
        goto LABEL_9;
      }
      int v8 = 0;
    }
    v5->_startingState = v8;
    goto LABEL_8;
  }
  BOOL v9 = 1;
LABEL_9:
  if (!v5->_states || !v9)
  {

    v5 = 0;
  }

  return v5;
}

- (int)startingState
{
  return self->_startingState;
}

- (void)setStartingState:(int)a3
{
  self->_startingState = a3;
}

- (NSArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
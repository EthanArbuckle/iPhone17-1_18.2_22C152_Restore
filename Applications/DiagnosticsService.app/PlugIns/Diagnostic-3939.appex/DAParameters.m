@interface DAParameters
- (BOOL)resetTimer;
- (DAParameters)initWithDictionary:(id)a3;
- (double)listenForInputTimeout;
- (double)noInputTimeout;
- (int)totalPressEvents;
- (void)setListenForInputTimeout:(double)a3;
- (void)setNoInputTimeout:(double)a3;
- (void)setResetTimer:(BOOL)a3;
- (void)setTotalPressEvents:(int)a3;
@end

@implementation DAParameters

- (DAParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  char v16 = 0;
  v15.receiver = self;
  v15.super_class = (Class)DAParameters;
  v5 = [(DASpecification *)&v15 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_20;
  }
  v6 = [v4 dk_numberFromKey:@"totalPressEvents" lowerBound:&off_1000110E8 upperBound:&off_100011100 defaultValue:0 failed:&v16];
  v7 = [v4 dk_numberFromKey:@"listenForInputTimeout" lowerBound:&off_100011268 upperBound:&off_100011278 defaultValue:0 failed:&v16];
  uint64_t v8 = [v4 dk_numberFromKey:@"noInputTimeout" lowerBound:&off_100011268 upperBound:&off_100011278 defaultValue:0 failed:&v16];
  v9 = (void *)v8;
  if (v6) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  int v11 = !v10;
  if (!v10 && v7) {
    goto LABEL_15;
  }
  if (v11)
  {
    v5->_resetTimer = 1;
    v5->_totalPressEvents = [v6 intValue];
LABEL_12:
    [v9 doubleValue];
    uint64_t v13 = 24;
LABEL_17:
    *(Class *)((char *)&v5->super.super.isa + v13) = v12;
    goto LABEL_18;
  }
  if (v6 && v7)
  {
LABEL_15:
    v5->_totalPressEvents = [v6 intValue];
    goto LABEL_16;
  }
  if (v8 && v7) {
    goto LABEL_16;
  }
  if (v6)
  {
    v5->_totalPressEvents = [v6 intValue];
  }
  else
  {
    if (v8)
    {
      v5->_resetTimer = 1;
      v5->_totalPressEvents = 1;
      goto LABEL_12;
    }
    if (v7)
    {
LABEL_16:
      [v7 doubleValue];
      uint64_t v13 = 16;
      goto LABEL_17;
    }
    v5->_totalPressEvents = 1;
  }
LABEL_18:

  if (v16)
  {

    v5 = 0;
  }
LABEL_20:

  return v5;
}

- (int)totalPressEvents
{
  return self->_totalPressEvents;
}

- (void)setTotalPressEvents:(int)a3
{
  self->_totalPressEvents = a3;
}

- (double)listenForInputTimeout
{
  return self->_listenForInputTimeout;
}

- (void)setListenForInputTimeout:(double)a3
{
  self->_listenForInputTimeout = a3;
}

- (double)noInputTimeout
{
  return self->_noInputTimeout;
}

- (void)setNoInputTimeout:(double)a3
{
  self->_noInputTimeout = a3;
}

- (BOOL)resetTimer
{
  return self->_resetTimer;
}

- (void)setResetTimer:(BOOL)a3
{
  self->_resetTimer = a3;
}

@end
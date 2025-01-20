@interface PMSmartPowerNapInterruption
- (BOOL)is_transient;
- (NSDate)end;
- (NSDate)start;
- (PMSmartPowerNapInterruption)initWithStart:(id)a3;
- (void)setEnd:(id)a3;
- (void)setIs_transient:(BOOL)a3;
- (void)setStart:(id)a3;
@end

@implementation PMSmartPowerNapInterruption

- (PMSmartPowerNapInterruption)initWithStart:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PMSmartPowerNapInterruption;
  v5 = [(PMSmartPowerNapInterruption *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PMSmartPowerNapInterruption *)v5 setStart:v4];
  }

  return v6;
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStart:(id)a3
{
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
}

- (BOOL)is_transient
{
  return self->_is_transient;
}

- (void)setIs_transient:(BOOL)a3
{
  self->_is_transient = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end
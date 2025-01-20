@interface PMCoreSmartPowerNapInterruption
- (BOOL)is_transient;
- (NSDate)end;
- (NSDate)start;
- (PMCoreSmartPowerNapInterruption)initWithStart:(id)a3;
- (void)setEnd:(id)a3;
- (void)setIs_transient:(BOOL)a3;
- (void)setStart:(id)a3;
@end

@implementation PMCoreSmartPowerNapInterruption

- (PMCoreSmartPowerNapInterruption)initWithStart:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PMCoreSmartPowerNapInterruption;
  v5 = [(PMCoreSmartPowerNapInterruption *)&v8 init];
  v6 = v5;
  if (v5) {
    [(PMCoreSmartPowerNapInterruption *)v5 setStart:v4];
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
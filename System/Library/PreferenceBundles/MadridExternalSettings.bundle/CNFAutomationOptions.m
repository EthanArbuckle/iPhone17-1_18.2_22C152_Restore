@interface CNFAutomationOptions
- (NSNumber)interval;
- (NSNumber)repetitions;
- (NSString)remote;
- (void)setInterval:(id)a3;
- (void)setRemote:(id)a3;
- (void)setRepetitions:(id)a3;
@end

@implementation CNFAutomationOptions

- (NSString)remote
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRemote:(id)a3
{
}

- (NSNumber)interval
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInterval:(id)a3
{
}

- (NSNumber)repetitions
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRepetitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repetitions, 0);
  objc_storeStrong((id *)&self->_interval, 0);

  objc_storeStrong((id *)&self->_remote, 0);
}

@end
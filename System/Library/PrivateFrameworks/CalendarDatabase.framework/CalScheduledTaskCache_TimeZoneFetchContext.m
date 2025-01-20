@interface CalScheduledTaskCache_TimeZoneFetchContext
- (NSMutableDictionary)dict;
- (NSTimeZone)nextTimeZone;
- (NSTimeZone)previousTimeZone;
- (void)setDict:(id)a3;
- (void)setNextTimeZone:(id)a3;
- (void)setPreviousTimeZone:(id)a3;
@end

@implementation CalScheduledTaskCache_TimeZoneFetchContext

- (NSTimeZone)previousTimeZone
{
  return self->_previousTimeZone;
}

- (void)setPreviousTimeZone:(id)a3
{
}

- (NSTimeZone)nextTimeZone
{
  return self->_nextTimeZone;
}

- (void)setNextTimeZone:(id)a3
{
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
  objc_storeStrong((id *)&self->_nextTimeZone, 0);
  objc_storeStrong((id *)&self->_previousTimeZone, 0);
}

@end
@interface C2Route
- (NSString)destination;
- (double)lastUpdated;
- (void)setDestination:(id)a3;
- (void)setLastUpdated:(double)a3;
@end

@implementation C2Route

- (NSString)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (double)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(double)a3
{
  self->_lastUpdated = a3;
}

- (void).cxx_destruct
{
}

@end
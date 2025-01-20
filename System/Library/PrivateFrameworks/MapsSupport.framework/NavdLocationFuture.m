@interface NavdLocationFuture
- (BOOL)failed;
- (BOOL)hasBeenFulfilled;
- (CLLocation)location;
- (void)fulfillAsFailure;
- (void)fulfillWithLocation:(id)a3;
@end

@implementation NavdLocationFuture

- (void)fulfillWithLocation:(id)a3
{
  self->_hasBeenFulfilled = 1;
}

- (void)fulfillAsFailure
{
  *(_WORD *)&self->_hasBeenFulfilled = 257;
}

- (CLLocation)location
{
  return self->_location;
}

- (BOOL)hasBeenFulfilled
{
  return self->_hasBeenFulfilled;
}

- (BOOL)failed
{
  return self->_failed;
}

- (void).cxx_destruct
{
}

@end
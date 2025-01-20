@interface BuddyActivationError
- (BOOL)isCellular;
- (BOOL)isConnectionFailure;
- (BuddyActivationError)initWithConnectionFailure:(BOOL)a3 cellular:(BOOL)a4;
- (void)setCellular:(BOOL)a3;
- (void)setConnectionFailure:(BOOL)a3;
@end

@implementation BuddyActivationError

- (BuddyActivationError)initWithConnectionFailure:(BOOL)a3 cellular:(BOOL)a4
{
  SEL v9 = a2;
  BOOL v8 = a3;
  BOOL v7 = a4;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyActivationError;
  id location = [(BuddyActivationError *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    *((unsigned char *)location + 8) = v8;
    *((unsigned char *)location + 9) = v7;
  }
  v4 = (BuddyActivationError *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)isConnectionFailure
{
  return self->_connectionFailure;
}

- (void)setConnectionFailure:(BOOL)a3
{
  self->_connectionFailure = a3;
}

- (BOOL)isCellular
{
  return self->_cellular;
}

- (void)setCellular:(BOOL)a3
{
  self->_cellular = a3;
}

@end
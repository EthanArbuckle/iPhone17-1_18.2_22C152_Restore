@interface HDDataCollectionObserverState
+ (id)dataCollectionObserverStateInForeground:(BOOL)a3 hasRunningWorkout:(BOOL)a4 hasBackgroundObserver:(BOOL)a5;
- (BOOL)hasBackgroundObserver;
- (BOOL)hasRunningWorkout;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInForeground;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation HDDataCollectionObserverState

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[HDDataCollectionObserverState allocWithZone:a3] init];
  *((unsigned char *)result + 8) = self->_isInForeground;
  *((unsigned char *)result + 9) = self->_hasRunningWorkout;
  *((unsigned char *)result + 10) = self->_hasBackgroundObserver;
  return result;
}

+ (id)dataCollectionObserverStateInForeground:(BOOL)a3 hasRunningWorkout:(BOOL)a4 hasBackgroundObserver:(BOOL)a5
{
  v8 = objc_alloc_init(HDDataCollectionObserverState);
  v8->_isInForeground = a3;
  v8->_hasRunningWorkout = a4;
  v8->_hasBackgroundObserver = a5;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_isInForeground == v4[8]
    && self->_hasRunningWorkout == v4[9]
    && self->_hasBackgroundObserver == v4[10];

  return v5;
}

- (id)description
{
  v2 = @"YES";
  if (self->_isInForeground) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (self->_hasRunningWorkout) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (!self->_hasBackgroundObserver) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"(isInForeground=%@, hasRunningWorkout=%@, hasBackgroundObserver=%@)", v3, v4, v2];
}

- (BOOL)isInForeground
{
  return self->_isInForeground;
}

- (BOOL)hasRunningWorkout
{
  return self->_hasRunningWorkout;
}

- (BOOL)hasBackgroundObserver
{
  return self->_hasBackgroundObserver;
}

@end
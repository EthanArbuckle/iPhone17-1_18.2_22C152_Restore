@interface NSError
+ (id)_maps_cancellationError;
- (BOOL)_maps_isCancellation;
- (BOOL)_maps_isErrorOfDomain:(id)a3 code:(int64_t)a4;
@end

@implementation NSError

+ (id)_maps_cancellationError
{
  return +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
}

- (BOOL)_maps_isCancellation
{
  v3 = [(NSError *)self domain];
  if ([v3 isEqualToString:NSCocoaErrorDomain]) {
    BOOL v4 = (id)[(NSError *)self code] == (id)3072;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_maps_isErrorOfDomain:(id)a3 code:(int64_t)a4
{
  id v6 = a3;
  v7 = [(NSError *)self domain];
  unsigned int v8 = [v7 isEqualToString:v6];

  if (v8) {
    BOOL v9 = [(NSError *)self code] == a4;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

@end
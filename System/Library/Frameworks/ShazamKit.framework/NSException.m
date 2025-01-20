@interface NSException
+ (id)shl_exceptionWithName:(id)a3 reason:(id)a4;
@end

@implementation NSException

+ (id)shl_exceptionWithName:(id)a3 reason:(id)a4
{
  NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
  id v11 = a4;
  id v5 = a4;
  id v6 = a3;
  v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v8 = +[NSException exceptionWithName:v6 reason:v5 userInfo:v7];

  return v8;
}

@end
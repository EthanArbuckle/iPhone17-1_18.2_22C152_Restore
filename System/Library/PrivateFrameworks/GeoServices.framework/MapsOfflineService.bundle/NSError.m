@interface NSError
+ (id)MOSErrorWithCode:(int)a3;
+ (id)MOSErrorWithCode:(int)a3 userInfo:(id)a4;
@end

@implementation NSError

+ (id)MOSErrorWithCode:(int)a3
{
  return [a1 MOSErrorWithCode:*(void *)&a3 userInfo:0];
}

+ (id)MOSErrorWithCode:(int)a3 userInfo:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 mutableCopy];

    v8 = sub_209FBF8(v4);
    [v7 setObject:v8 forKey:@"ErrorString"];

    v9 = v7;
  }
  else
  {
    CFStringRef v13 = @"ErrorString";
    v10 = sub_209FBF8(v4);
    v14 = v10;
    v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  }
  v11 = +[NSError errorWithDomain:@"MapsOfflineService" code:(int)v4 userInfo:v9];

  return v11;
}

@end
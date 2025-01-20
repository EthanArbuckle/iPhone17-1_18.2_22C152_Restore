@interface NSError
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5;
+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6;
@end

@implementation NSError

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  [v12 setObject:v10 forKeyedSubscript:NSLocalizedDescriptionKey];

  [v12 setObject:v9 forKeyedSubscript:NSUnderlyingErrorKey];
  v13 = +[NSError errorWithDomain:v11 code:a4 userInfo:v12];

  return (NSError *)v13;
}

+ (NSError)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5
{
  return +[NSError errorWithDomain:a3 code:a4 description:a5 underlying:0];
}

@end
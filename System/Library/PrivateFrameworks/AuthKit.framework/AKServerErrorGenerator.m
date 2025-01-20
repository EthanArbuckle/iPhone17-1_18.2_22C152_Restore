@interface AKServerErrorGenerator
+ (id)errorFromServerResponseParameters:(id)a3 authenticationError:(int64_t)a4;
@end

@implementation AKServerErrorGenerator

+ (id)errorFromServerResponseParameters:(id)a3 authenticationError:(int64_t)a4
{
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"em"];
  v7 = [v5 objectForKeyedSubscript:@"tt"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v14[0] = NSLocalizedFailureErrorKey;
    v14[1] = NSLocalizedFailureReasonErrorKey;
    v15[0] = v7;
    v15[1] = v6;
    v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
    v9 = +[NSError ak_errorWithCode:a4 userInfo:v8];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      v13 = v6;
      v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      v9 = +[NSError ak_errorWithCode:a4 userInfo:v10];
    }
    else
    {
      v9 = +[NSError ak_errorWithCode:a4];
    }
  }

  return v9;
}

@end
@interface NSError
+ (NSError)errorWithZhuGeErrorCode:(unint64_t)a3 underlyingError:(id)a4;
+ (id)descriptionFromZhuGeErrorCode:(unint64_t)a3;
- (id)ZhuGeDescription;
- (id)_ZhuGeDescriptionWithLayer:(unint64_t)a3;
@end

@implementation NSError

+ (NSError)errorWithZhuGeErrorCode:(unint64_t)a3 underlyingError:(id)a4
{
  id v5 = a4;
  v6 = +[NSError errorWithDomain:@"com.apple.zhuge" code:0 userInfo:0];
  if (a3 == 1)
  {
    v7 = off_100019650[0];
    v8 = +[NSNumber numberWithUnsignedInteger:1];
    v9 = +[NSString stringWithFormat:@"Reserved ZhuGeErrorCode %@ shall not be the argument", v8];

    v10 = +[NSString stringWithFormat:@"Please check newly added code that calling ZhuGeError API"];
LABEL_10:
    v13 = v6;
    goto LABEL_11;
  }
  if (a3 >= 0x51)
  {
    v7 = off_100019650[0];
    v11 = +[NSNumber numberWithUnsignedInteger:a3];
    v9 = +[NSString stringWithFormat:@"ZhuGeErrorCode %@ exceed maximum", v11];
LABEL_9:

    v10 = @"Please file a radar against \"ZhuGe|all\"";
    a3 = 1;
    goto LABEL_10;
  }
  v12 = (void *)((char *)&ZhuGeErrorTable + 32 * a3);
  if (*v12 != a3)
  {
    v7 = off_100019650[0];
    v11 = +[NSNumber numberWithUnsignedInteger:a3];
    v15 = +[NSNumber numberWithInteger:*v12];
    v9 = +[NSString stringWithFormat:@"Index %@ of ZhuGeErrorCode table got a wrong code %@", v11, v15];

    goto LABEL_9;
  }
  v13 = v5;
  if (isObjectNilOrZhuGeNull(v5))
  {
    id v14 = v6;

LABEL_17:
    v13 = v14;
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_18:
    v21 = (id *)((char *)&ZhuGeErrorTable + 32 * a3);
    v7 = (__CFString *)v21[1];
    v9 = (__CFString *)v21[2];
    v10 = (__CFString *)v21[3];
    id v5 = v13;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24[0] = NSLocalizedDescriptionKey;
    v24[1] = NSLocalizedFailureReasonErrorKey;
    v25[0] = v5;
    v25[1] = off_100019678[0];
    v24[2] = NSLocalizedRecoverySuggestionErrorKey;
    v24[3] = NSUnderlyingErrorKey;
    v25[2] = off_100019680;
    v25[3] = v6;
    v20 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
    id v14 = +[NSError errorWithDomain:@"com.apple.zhuge" code:2 userInfo:v20];

    goto LABEL_17;
  }
  v7 = off_100019650[0];
  v10 = @"Please check latest code that using ZhuGe error API";
  a3 = 1;
  v13 = v6;
  v9 = @"UnderlyingError can only be NSError, NSString, ZHUGE_NULL or nil";
LABEL_11:
  id v16 = v13;
  v22[0] = NSLocalizedDescriptionKey;
  v22[1] = NSLocalizedFailureReasonErrorKey;
  v23[0] = v7;
  v23[1] = v9;
  v22[2] = NSLocalizedRecoverySuggestionErrorKey;
  v22[3] = NSUnderlyingErrorKey;
  v23[2] = v10;
  v23[3] = v16;
  v17 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];
  v18 = +[NSError errorWithDomain:@"com.apple.zhuge" code:a3 userInfo:v17];

  return (NSError *)v18;
}

+ (id)descriptionFromZhuGeErrorCode:(unint64_t)a3
{
  if (a3 <= 0x50)
  {
    if (*((void *)&ZhuGeErrorTable + 4 * a3) == a3) {
      v4 = (__CFString *)*((id *)&ZhuGeErrorTable + 4 * a3 + 1);
    }
    else {
      v4 = @"Invalid ZhuGe Error Code!";
    }
  }
  else
  {
    v4 = @"Illegal ZhuGe Error Code!";
  }
  return v4;
}

- (id)_ZhuGeDescriptionWithLayer:(unint64_t)a3
{
  unint64_t v5 = 4 * a3;
  v6 = [&stru_1000148A0 stringByPaddingToLength:4 * a3 withString:@" " startingAtIndex:0];
  v7 = [&stru_1000148A0 stringByPaddingToLength:(4 * a3) | 2 withString:@" " startingAtIndex:0];
  v8 = [&stru_1000148A0 stringByPaddingToLength:v5 + 4 withString:@" " startingAtIndex:0];
  v9 = [(NSError *)self domain];
  unsigned __int8 v10 = [v9 isEqualToString:@"com.apple.zhuge"];

  if (v10)
  {
    v11 = [(NSError *)self userInfo];
    v12 = [v11 objectForKey:NSLocalizedDescriptionKey];

    v13 = [(NSError *)self userInfo];
    v23 = [v13 objectForKey:NSLocalizedFailureReasonErrorKey];

    id v14 = [(NSError *)self userInfo];
    v15 = [v14 objectForKey:NSLocalizedRecoverySuggestionErrorKey];

    id v16 = [(NSError *)self userInfo];
    v17 = [v16 objectForKey:NSUnderlyingErrorKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = [v17 _ZhuGeDescriptionWithLayer:a3 + 1];

      v17 = (void *)v18;
    }
    v19 = [(NSError *)self domain];
    v20 = +[NSNumber numberWithInteger:[(NSError *)self code]];
    v21 = +[NSString stringWithFormat:@"\n%@{\n%@Domain   = %@\n%@Code     = %@\n%@UserInfo = {\n%@Description        = %@\n%@FailureReason      = %@\n%@RecoverySuggestion = %@\n%@UnderlyingError    = %@\n%@}", v6, v7, v19, v7, v20, v7, v8, v12, v8, v23, v8, v15, v8, v17, v6];
  }
  else
  {
    v12 = [(NSError *)self description];
    v21 = +[NSString stringWithFormat:@"{\n%@%@\n%@}", v8, v12, v7];
  }

  return v21;
}

- (id)ZhuGeDescription
{
  return [(NSError *)self _ZhuGeDescriptionWithLayer:0];
}

@end
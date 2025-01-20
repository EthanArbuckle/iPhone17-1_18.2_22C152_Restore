@interface AKAppleIDCodeGenerator
+ (id)generateLoginCode:(id *)a3;
@end

@implementation AKAppleIDCodeGenerator

+ (id)generateLoginCode:(id *)a3
{
  unsigned int v11 = 0;
  sub_10015D708(+[AKActiveAnisetteDSIDFetcher activeAnisettDSIDFromLastKnownIDMSEnvironment], (uint64_t)&v11);
  uint64_t v5 = v4;
  v6 = _AKLogSystem();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10017AFC4(v5, v7);
    }

    if (a3)
    {
      id v8 = +[NSError ak_wrappedAnisetteError:v5];
      v9 = 0;
      *a3 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10017AF80(v7);
    }

    v9 = +[NSNumber numberWithUnsignedInt:v11];
  }

  return v9;
}

@end
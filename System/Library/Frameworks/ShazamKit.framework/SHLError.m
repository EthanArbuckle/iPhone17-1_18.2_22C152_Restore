@interface SHLError
+ (BOOL)canRetryForError:(id)a3;
+ (BOOL)canRetryForPartialError:(id)a3;
+ (double)retrySecondsForError:(id)a3;
+ (id)errorCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithUnderlyingError:(id)a3;
+ (id)localizedDescriptionForSyncError:(int64_t)a3;
+ (id)localizedFailureReasonForSyncError:(int64_t)a3;
+ (id)localizedRecoverySuggestionForSyncError:(int64_t)a3;
+ (id)userInfoForErrorCode:(int64_t)a3 withUnderlyingError:(id)a4;
+ (int64_t)errorCodeForError:(id)a3;
@end

@implementation SHLError

+ (id)errorWithCode:(int64_t)a3
{
  return +[SHLError errorCode:a3 underlyingError:0];
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  return +[SHLError errorCode:a3 underlyingError:a4];
}

+ (id)errorWithUnderlyingError:(id)a3
{
  id v4 = a3;
  v5 = +[SHLError errorCode:underlyingError:](SHLError, "errorCode:underlyingError:", [a1 errorCodeForError:v4], v4);

  return v5;
}

+ (double)retrySecondsForError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:CKErrorDomain];

  double v6 = 0.0;
  if (v5)
  {
    if ([v3 code] == (id)2)
    {
      uint64_t v14 = 0;
      v15 = (double *)&v14;
      uint64_t v16 = 0x2020000000;
      uint64_t v17 = 0;
      v7 = [v3 userInfo];
      v8 = [v7 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100026590;
      v13[3] = &unk_100075770;
      v13[4] = &v14;
      [v8 enumerateKeysAndObjectsUsingBlock:v13];
      double v6 = v15[3];

      _Block_object_dispose(&v14, 8);
    }
    else
    {
      v9 = [v3 userInfo];
      v10 = [v9 objectForKeyedSubscript:CKErrorRetryAfterKey];
      [v10 doubleValue];
      double v6 = v11;
    }
  }

  return v6;
}

+ (BOOL)canRetryForError:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 domain];
  unsigned int v6 = [v5 isEqualToString:CKErrorDomain];

  if (!v6)
  {
    unsigned __int8 v8 = 0;
    goto LABEL_7;
  }
  unint64_t v7 = (unint64_t)[v4 code];
  unsigned __int8 v8 = 1;
  if (v7 > 0x24) {
    goto LABEL_8;
  }
  if (((1 << v7) & 0x1008B000D8) == 0)
  {
    if (v7 == 2)
    {
      v9 = [v4 userInfo];
      v10 = [v9 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];
      unsigned __int8 v8 = [a1 canRetryForPartialError:v10];

      goto LABEL_7;
    }
LABEL_8:
    unsigned __int8 v8 = v7 == 111;
  }
LABEL_7:

  return v8;
}

+ (BOOL)canRetryForPartialError:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  unsigned __int8 v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002680C;
  v6[3] = &unk_100075798;
  v6[4] = &v7;
  v6[5] = a1;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  LOBYTE(a1) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a1;
}

+ (id)errorCode:(int64_t)a3 underlyingError:(id)a4
{
  unsigned int v5 = [a1 userInfoForErrorCode:a3 withUnderlyingError:a4];
  id v6 = [objc_alloc((Class)NSError) initWithDomain:@"com.shazam.library" code:a3 userInfo:v5];

  return v6;
}

+ (id)userInfoForErrorCode:(int64_t)a3 withUnderlyingError:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[NSMutableDictionary dictionary];
  [v7 setValue:v6 forKey:NSUnderlyingErrorKey];

  unsigned __int8 v8 = [a1 localizedDescriptionForSyncError:a3];
  [v7 setObject:v8 forKey:NSLocalizedDescriptionKey];

  uint64_t v9 = [a1 localizedFailureReasonForSyncError:a3];
  [v7 setObject:v9 forKey:NSLocalizedFailureReasonErrorKey];

  char v10 = [a1 localizedRecoverySuggestionForSyncError:a3];
  [v7 setObject:v10 forKey:NSLocalizedRecoverySuggestionErrorKey];

  id v11 = [v7 copy];

  return v11;
}

+ (int64_t)errorCodeForError:(id)a3
{
  uint64_t v3 = (uint64_t)[a3 code];
  if (v3 > 24)
  {
    if (v3 <= 27)
    {
      if (v3 == 25) {
        return 6;
      }
      if (v3 == 26) {
        return 7;
      }
    }
    else
    {
      switch(v3)
      {
        case 28:
          return 8;
        case 110:
          return 2;
        case 112:
          return 3;
      }
    }
    return 5;
  }
  uint64_t v4 = v3 - 1;
  int64_t result = 0;
  switch(v4)
  {
    case 2:
    case 3:
      int64_t result = 4;
      break;
    case 8:
      return result;
    default:
      return 5;
  }
  return result;
}

+ (id)localizedDescriptionForSyncError:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"No account logged in on this device.";
  }
  else {
    return off_1000757B8[a3 - 1];
  }
}

+ (id)localizedFailureReasonForSyncError:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"Shazam history saves to the user's private database, which requires an authenticated session.";
  }
  else {
    return off_1000757F8[a3 - 1];
  }
}

+ (id)localizedRecoverySuggestionForSyncError:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"The user should manually log in.";
  }
  else {
    return off_100075838[a3 - 1];
  }
}

@end
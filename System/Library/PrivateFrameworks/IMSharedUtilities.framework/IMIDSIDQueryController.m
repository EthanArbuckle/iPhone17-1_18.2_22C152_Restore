@interface IMIDSIDQueryController
+ (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
+ (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
+ (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 fromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10;
+ (BOOL)participantsForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
+ (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
+ (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7;
+ (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5;
+ (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5;
+ (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5;
@end

@implementation IMIDSIDQueryController

+ (BOOL)idInfoForDestinations:(id)a3 service:(id)a4 fromID:(id)a5 infoTypes:(unint64_t)a6 options:(id)a7 listenerID:(id)a8 queue:(id)a9 completionBlock:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  v22 = +[IMIDSServiceController sharedInstance];
  [v22 logIfDebuggingService:v16 method:"+[IMIDSIDQueryController idInfoForDestinations:service:fromID:infoTypes:options:listenerID:queue:completionBlock:]"];

  v23 = [MEMORY[0x1E4F6AB38] sharedInstance];
  if (objc_opt_respondsToSelector())
  {
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F6B5C8]) initWithPrefixedURI:v17];
    char v25 = [v23 idInfoForDestinations:v15 service:v16 preferredFromID:v24 infoTypes:a6 options:v18 listenerID:v19 queue:v20 completionBlock:v21];
  }
  else
  {
    char v25 = [v23 idInfoForDestinations:v15 service:v16 infoTypes:a6 options:v18 listenerID:v19 queue:v20 completionBlock:v21];
  }

  return v25;
}

+ (id)_currentIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[IMIDSServiceController sharedInstance];
  [v10 logIfDebuggingService:v8 method:"+[IMIDSIDQueryController _currentIDStatusForDestinations:service:listenerID:]"];

  v11 = [MEMORY[0x1E4F6AB38] sharedInstance];
  v12 = [v11 _currentIDStatusForDestinations:v9 service:v8 listenerID:v7];

  return v12;
}

+ (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[IMIDSServiceController sharedInstance];
  [v16 logIfDebuggingService:v14 method:"+[IMIDSIDQueryController refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:]"];

  id v17 = [MEMORY[0x1E4F6AB38] sharedInstance];
  char v18 = [v17 refreshIDStatusForDestinations:v15 service:v14 listenerID:v13 queue:v12 completionBlock:v11];

  return v18;
}

+ (int64_t)_currentCachedIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[IMIDSServiceController sharedInstance];
  [v10 logIfDebuggingService:v8 method:"+[IMIDSIDQueryController _currentCachedIDStatusForDestination:service:listenerID:]"];

  id v11 = [MEMORY[0x1E4F6AB38] sharedInstance];
  int64_t v12 = [v11 _currentCachedIDStatusForDestination:v9 service:v8 listenerID:v7];

  return v12;
}

+ (id)_currentCachedRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[IMIDSServiceController sharedInstance];
  [v10 logIfDebuggingService:v8 method:"+[IMIDSIDQueryController _currentCachedRemoteDevicesForDestinations:service:listenerID:]"];

  id v11 = [MEMORY[0x1E4F6AB38] sharedInstance];
  int64_t v12 = [v11 _currentCachedRemoteDevicesForDestinations:v9 service:v8 listenerID:v7];

  return v12;
}

+ (BOOL)currentIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[IMIDSServiceController sharedInstance];
  [v16 logIfDebuggingService:v14 method:"+[IMIDSIDQueryController currentIDStatusForDestination:service:listenerID:queue:completionBlock:]"];

  id v17 = [MEMORY[0x1E4F6AB38] sharedInstance];
  char v18 = [v17 currentIDStatusForDestination:v15 service:v14 listenerID:v13 queue:v12 completionBlock:v11];

  return v18;
}

+ (BOOL)refreshIDStatusForDestination:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[IMIDSServiceController sharedInstance];
  [v16 logIfDebuggingService:v14 method:"+[IMIDSIDQueryController refreshIDStatusForDestination:service:listenerID:queue:completionBlock:]"];

  id v17 = [MEMORY[0x1E4F6AB38] sharedInstance];
  char v18 = [v17 refreshIDStatusForDestination:v15 service:v14 listenerID:v13 queue:v12 completionBlock:v11];

  return v18;
}

+ (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[IMIDSServiceController sharedInstance];
  [v16 logIfDebuggingService:v14 method:"+[IMIDSIDQueryController currentRemoteDevicesForDestinations:service:listenerID:queue:completionBlock:]"];

  id v17 = [MEMORY[0x1E4F6AB38] sharedInstance];
  char v18 = [v17 currentRemoteDevicesForDestinations:v15 service:v14 listenerID:v13 queue:v12 completionBlock:v11];

  return v18;
}

+ (BOOL)participantsForDestinations:(id)a3 service:(id)a4 listenerID:(id)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = +[IMIDSServiceController sharedInstance];
  [v16 logIfDebuggingService:v14 method:"+[IMIDSIDQueryController participantsForDestinations:service:listenerID:queue:completionBlock:]"];

  id v17 = [MEMORY[0x1E4F6AB38] sharedInstance];
  char v18 = [v17 participantsForDestinations:v15 service:v14 listenerID:v13 queue:v12 completionBlock:v11];

  return v18;
}

@end
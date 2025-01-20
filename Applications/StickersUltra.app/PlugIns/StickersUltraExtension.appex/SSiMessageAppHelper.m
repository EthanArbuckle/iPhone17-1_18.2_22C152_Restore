@interface SSiMessageAppHelper
+ (BOOL)balloonHostAppIsMessages;
+ (id)entitlementValueForBalloonHost:(id)a3 expectedClass:(Class)a4;
+ (id)extendedIdentifierFromIdentifier:(id)a3;
@end

@implementation SSiMessageAppHelper

+ (id)extendedIdentifierFromIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v4 = (void *)qword_1000AD9A8;
  uint64_t v20 = qword_1000AD9A8;
  if (!qword_1000AD9A8)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000062CC;
    v16[3] = &unk_10009A620;
    v16[4] = &v17;
    sub_1000062CC((uint64_t)v16);
    v4 = (void *)v18[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v17, 8);
  v6 = [v5 pluginKitProxyForIdentifier:v3];
  v7 = [v6 teamID];
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = [v6 containingBundle];
    uint64_t v11 = [v10 teamID];
    v12 = (void *)v11;
    v13 = @"0000000000";
    if (v11) {
      v13 = (__CFString *)v11;
    }
    v9 = v13;
  }
  v14 = [IMBalloonPluginIdentifierMessageExtension stringByAppendingFormat:@":%@:%@", v9, v3];

  return v14;
}

+ (id)entitlementValueForBalloonHost:(id)a3 expectedClass:(Class)a4
{
  id v4 = a3;
  id v5 = +[_MSMessageAppContext activeExtensionContext];
  if (objc_opt_respondsToSelector())
  {
    id v6 = v5;
    v7 = v6;
    if (v6) {
      [v6 balloonHostAuditToken:0, 0];
    }
    v8 = (void *)IMDAuditTokenTaskCopyValueForEntitlement();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)balloonHostAppIsMessages
{
  v2 = +[SSiMessageAppHelper entitlementValueForBalloonHost:@"com.apple.messages.sticker-sharing-level" expectedClass:objc_opt_class()];
  if (v2) {
    BOOL v3 = [@"Messages" caseInsensitiveCompare:v2] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end
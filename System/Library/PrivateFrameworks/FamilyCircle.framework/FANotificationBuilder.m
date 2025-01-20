@interface FANotificationBuilder
+ (id)_buildActivationURLWithResponse:(id)a3;
+ (id)_getParamsForInviteFromResponse:(id)a3;
+ (id)buildNotificationWithResponse:(id)a3 payload:(id)a4;
@end

@implementation FANotificationBuilder

+ (id)buildNotificationWithResponse:(id)a3 payload:(id)a4
{
  id v5 = a3;
  if ([v5 showMessage])
  {
    v6 = [v5 title];
    if (v6)
    {

LABEL_8:
      id v8 = objc_alloc_init((Class)FAFamilyNotification);
      v10 = +[NSUUID UUID];
      v11 = [v10 UUIDString];
      [v8 setIdentifier:v11];

      v12 = [v5 title];
      [v8 setTitle:v12];

      v13 = [v5 message];
      [v8 setInformativeText:v13];

      [v8 setShouldPersistWhenActivated:1];
      v14 = [v5 launchURLFromServer];

      if (v14) {
        [v5 launchURLFromServer];
      }
      else {
      v15 = [a1 _buildActivationURLWithResponse:v5];
      }
      [v8 setActivateActionURL:v15];

      goto LABEL_12;
    }
    v9 = [v5 message];

    if (v9) {
      goto LABEL_8;
    }
    v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100036158(v7);
    }
  }
  else
  {
    v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10003619C(v7);
    }
  }

  id v8 = 0;
LABEL_12:

  return v8;
}

+ (id)_getParamsForInviteFromResponse:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:@"showFamilyInvite" forKey:@"aaaction"];
  id v5 = [v3 inviteCode];
  [v4 setObject:v5 forKey:@"inviteCode"];

  [v4 setObject:@"1" forKey:@"fresh"];
  v6 = [v3 organizerFirstName];

  if (v6)
  {
    v7 = [v3 organizerFirstName];
    [v4 setObject:v7 forKey:@"organizerFirstName"];
  }
  id v8 = [v3 organizerLastName];

  if (v8)
  {
    v9 = [v3 organizerLastName];
    [v4 setObject:v9 forKey:@"organizerLastName"];
  }
  v10 = [v3 organizerEmail];

  if (v10)
  {
    v11 = [v3 organizerEmail];
    [v4 setObject:v11 forKey:@"organizerEmail"];
  }
  v12 = [v3 childFirstName];

  if (v12)
  {
    v13 = [v3 childFirstName];
    [v4 setObject:v13 forKey:@"childFirstName"];
  }
  v14 = [v3 childLastName];

  if (v14)
  {
    v15 = [v3 childLastName];
    [v4 setObject:v15 forKey:@"childLastName"];
  }
  return v4;
}

+ (id)_buildActivationURLWithResponse:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pushTopic];
  if ([v5 isEqualToString:@"f_member_invite"])
  {

LABEL_4:
    id v8 = [a1 _getParamsForInviteFromResponse:v4];
    id v13 = 0;
    v9 = +[FamilySettingsDestinations urlDestinationTo:4 params:v8 error:&v13];
    id v10 = v13;

    goto LABEL_6;
  }
  v6 = [v4 pushTopic];
  unsigned int v7 = [v6 isEqualToString:@"f_child_transfer_req"];

  if (v7) {
    goto LABEL_4;
  }
  id v12 = 0;
  v9 = +[FamilySettingsDestinations urlDestinationTo:3 error:&v12];
  id v10 = v12;
LABEL_6:

  return v9;
}

@end
@interface FamilyMember
- (BOOL)isAskToBuyEnabled;
- (BOOL)isCurrentSignedInUser;
- (BOOL)isSharingPurchases;
- (FamilyMember)initWithDictionaryRepresentation:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)iCloudDSID;
- (NSNumber)iTunesDSID;
- (NSString)firstName;
- (NSString)iCloudUsername;
- (NSString)iTunesUsername;
- (NSString)lastName;
- (id)description;
- (void)setCurrentSignedInUser:(BOOL)a3;
@end

@implementation FamilyMember

- (FamilyMember)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"ITunesPreferredDsid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    v30.receiver = self;
    v30.super_class = (Class)FamilyMember;
    v7 = [(FamilyMember *)&v30 init];
    if (v7)
    {
      v8 = [v4 objectForKeyedSubscript:@"askToBuy"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }

      v7->_askToBuyEnabled = [v9 BOOLValue];
      v12 = [v4 objectForKeyedSubscript:@"firstName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v13 = v12;
      }
      else {
        v13 = 0;
      }

      firstName = v7->_firstName;
      v7->_firstName = v13;

      v15 = [v4 objectForKeyedSubscript:@"ICloudDsid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }

      iCloudDSID = v7->_iCloudDSID;
      v7->_iCloudDSID = v16;

      v18 = [v4 objectForKeyedSubscript:@"accountName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v19 = v18;
      }
      else {
        v19 = 0;
      }

      iCloudUsername = v7->_iCloudUsername;
      v7->_iCloudUsername = v19;

      objc_storeStrong((id *)&v7->_iTunesDSID, v6);
      v21 = [v4 objectForKeyedSubscript:@"ITunesPreferredAccountName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v22 = v21;
      }
      else {
        v22 = 0;
      }

      iTunesUsername = v7->_iTunesUsername;
      v7->_iTunesUsername = v22;

      v24 = [v4 objectForKeyedSubscript:@"lastName"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v25 = v24;
      }
      else {
        v25 = 0;
      }

      lastName = v7->_lastName;
      v7->_lastName = v25;

      v27 = [v4 objectForKeyedSubscript:@"sharingPurchases"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v28 = v27;
      }
      else {
        id v28 = 0;
      }

      v7->_sharingPurchases = [v28 BOOLValue];
    }
    self = v7;
    v11 = self;
  }
  else
  {
    if (qword_1003A0038 != -1) {
      dispatch_once(&qword_1003A0038, &stru_100359AC0);
    }
    v10 = qword_10039FFF0;
    if (os_log_type_enabled((os_log_t)qword_10039FFF0, OS_LOG_TYPE_ERROR)) {
      sub_1002C87E8((uint64_t)v4, v10);
    }
    v11 = 0;
  }

  return v11;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = +[NSNumber numberWithBool:[(FamilyMember *)self isAskToBuyEnabled]];
  [v3 setObject:v4 forKeyedSubscript:@"askToBuy"];

  v5 = [(FamilyMember *)self iTunesDSID];
  [v3 setObject:v5 forKeyedSubscript:@"ITunesPreferredDsid"];

  id v6 = +[NSNumber numberWithBool:[(FamilyMember *)self isSharingPurchases]];
  [v3 setObject:v6 forKeyedSubscript:@"sharingPurchases"];

  v7 = [(FamilyMember *)self firstName];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, @"firstName");

  v8 = [(FamilyMember *)self iCloudDSID];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, @"ICloudDsid");

  id v9 = [(FamilyMember *)self iCloudUsername];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v9, @"accountName");

  v10 = [(FamilyMember *)self iTunesUsername];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v10, @"ITunesPreferredAccountName");

  v11 = [(FamilyMember *)self lastName];
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v11, @"lastName");

  id v12 = [v3 copy];

  return (NSDictionary *)v12;
}

- (id)description
{
  v15[0] = @"firstName";
  id v3 = [(FamilyMember *)self firstName];
  v16[0] = v3;
  v15[1] = @"iCloudDSID";
  id v4 = [(FamilyMember *)self iCloudDSID];
  v16[1] = v4;
  v15[2] = @"iCloudUsername";
  v5 = [(FamilyMember *)self iCloudUsername];
  v16[2] = v5;
  v15[3] = @"isCurrentSignedInUser";
  if ([(FamilyMember *)self isCurrentSignedInUser]) {
    CFStringRef v6 = @"true";
  }
  else {
    CFStringRef v6 = @"false";
  }
  v16[3] = v6;
  v15[4] = @"iTunesDSID";
  v7 = [(FamilyMember *)self iTunesDSID];
  v16[4] = v7;
  v15[5] = @"iTunesUsername";
  v8 = [(FamilyMember *)self iTunesUsername];
  v16[5] = v8;
  v15[6] = @"isAskToBuyEnabled";
  if ([(FamilyMember *)self isAskToBuyEnabled]) {
    CFStringRef v9 = @"true";
  }
  else {
    CFStringRef v9 = @"false";
  }
  v16[6] = v9;
  v15[7] = @"isSharingPurchases";
  if ([(FamilyMember *)self isSharingPurchases]) {
    CFStringRef v10 = @"true";
  }
  else {
    CFStringRef v10 = @"false";
  }
  v16[7] = v10;
  v15[8] = @"lastName";
  v11 = [(FamilyMember *)self lastName];
  v16[8] = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:9];

  v13 = +[NSString stringWithFormat:@"%@", v12];

  return v13;
}

- (BOOL)isCurrentSignedInUser
{
  return self->_currentSignedInUser;
}

- (void)setCurrentSignedInUser:(BOOL)a3
{
  self->_currentSignedInUser = a3;
}

- (BOOL)isAskToBuyEnabled
{
  return self->_askToBuyEnabled;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSNumber)iCloudDSID
{
  return self->_iCloudDSID;
}

- (NSString)iCloudUsername
{
  return self->_iCloudUsername;
}

- (NSNumber)iTunesDSID
{
  return self->_iTunesDSID;
}

- (NSString)iTunesUsername
{
  return self->_iTunesUsername;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (BOOL)isSharingPurchases
{
  return self->_sharingPurchases;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_iTunesUsername, 0);
  objc_storeStrong((id *)&self->_iTunesDSID, 0);
  objc_storeStrong((id *)&self->_iCloudUsername, 0);
  objc_storeStrong((id *)&self->_iCloudDSID, 0);

  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
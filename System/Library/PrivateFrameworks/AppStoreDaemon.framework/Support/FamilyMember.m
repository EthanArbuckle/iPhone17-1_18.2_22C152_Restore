@interface FamilyMember
- (id)description;
@end

@implementation FamilyMember

- (id)description
{
  CFStringRef v17 = @"firstName";
  if (self)
  {
    v3 = self->_firstName;
    v26 = v3;
    CFStringRef v18 = @"iCloudDSID";
    v4 = self->_iCloudDSID;
    v27 = v4;
    CFStringRef v19 = @"iCloudUsername";
    v5 = self->_iCloudUsername;
    v6 = v5;
    if (self->_currentSignedInUser) {
      CFStringRef v7 = @"true";
    }
    else {
      CFStringRef v7 = @"false";
    }
    v28 = v5;
    CFStringRef v29 = v7;
    CFStringRef v20 = @"isCurrentSignedInUser";
    CFStringRef v21 = @"iTunesDSID";
    v8 = self->_iTunesDSID;
    v30 = v8;
    v9 = self->_iTunesUsername;
    if (self->_askToBuyEnabled) {
      CFStringRef v10 = @"true";
    }
    else {
      CFStringRef v10 = @"false";
    }
    if (self->_sharingPurchases) {
      CFStringRef v11 = @"true";
    }
    else {
      CFStringRef v11 = @"false";
    }
    lastName = self->_lastName;
  }
  else
  {
    v9 = 0;
    v6 = 0;
    v3 = 0;
    v4 = 0;
    v8 = 0;
    lastName = 0;
    v26 = 0;
    v27 = 0;
    CFStringRef v18 = @"iCloudDSID";
    CFStringRef v19 = @"iCloudUsername";
    CFStringRef v10 = @"false";
    v28 = 0;
    CFStringRef v29 = @"false";
    CFStringRef v20 = @"isCurrentSignedInUser";
    CFStringRef v21 = @"iTunesDSID";
    CFStringRef v11 = @"false";
    v30 = 0;
  }
  CFStringRef v22 = @"iTunesUsername";
  CFStringRef v23 = @"isAskToBuyEnabled";
  v31 = v9;
  CFStringRef v32 = v10;
  CFStringRef v24 = @"isSharingPurchases";
  CFStringRef v25 = @"lastName";
  CFStringRef v33 = v11;
  v34 = lastName;
  v13 = lastName;
  v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v17 count:9];

  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@", v14, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31,
    v32,
    v33,
  v15 = v34);

  return v15;
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
@interface AFSiriIncomingCall
+ (BOOL)supportsSecureCoding;
- (AFSiriIncomingCall)init;
- (AFSiriIncomingCall)initWithCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleID:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9;
- (AFSiriIncomingCall)initWithCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleID:(id)a5 callers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9;
- (AFSiriIncomingCall)initWithCoder:(id)a3;
- (BOOL)isCallerIDBlocked;
- (BOOL)isVideo;
- (NSArray)callerContactIdentifiers;
- (NSString)callProviderBundleID;
- (NSString)callProviderIdentifier;
- (NSString)callUUID;
- (TUHandle)handle;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSiriIncomingCall

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_callerContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_callProviderBundleID, 0);
  objc_storeStrong((id *)&self->_callProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
}

- (BOOL)isCallerIDBlocked
{
  return self->_isCallerIDBlocked;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (NSArray)callerContactIdentifiers
{
  return self->_callerContactIdentifiers;
}

- (NSString)callProviderBundleID
{
  return self->_callProviderBundleID;
}

- (NSString)callProviderIdentifier
{
  return self->_callProviderIdentifier;
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (AFSiriIncomingCall)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callUUID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callProviderIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callProviderBundleID"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"callerContactIdentifiers"];

  id TUHandleClass = getTUHandleClass();
  if (TUHandleClass)
  {
    v13 = [v4 decodeObjectOfClass:TUHandleClass forKey:@"handle"];
  }
  else
  {
    v13 = 0;
  }
  uint64_t v14 = [v4 decodeBoolForKey:@"isVideo"];
  LOBYTE(v17) = [v4 decodeBoolForKey:@"isCallerIDBlocked"];
  v15 = -[AFSiriIncomingCall initWithCallUUID:callProviderIdentifier:callProviderBundleID:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:](self, "initWithCallUUID:callProviderIdentifier:callProviderBundleID:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:", v5, v6, v7, v11, v13, v14, v17, v18[0]);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(AFSiriIncomingCall *)self callUUID];
  [v9 encodeObject:v4 forKey:@"callUUID"];

  v5 = [(AFSiriIncomingCall *)self callProviderIdentifier];
  [v9 encodeObject:v5 forKey:@"callProviderIdentifier"];

  v6 = [(AFSiriIncomingCall *)self callProviderBundleID];
  [v9 encodeObject:v6 forKey:@"callProviderBundleID"];

  v7 = [(AFSiriIncomingCall *)self callerContactIdentifiers];
  [v9 encodeObject:v7 forKey:@"callerContactIdentifiers"];

  v8 = [(AFSiriIncomingCall *)self handle];
  [v9 encodeObject:v8 forKey:@"handle"];

  objc_msgSend(v9, "encodeBool:forKey:", -[AFSiriIncomingCall isVideo](self, "isVideo"), @"isVideo");
  objc_msgSend(v9, "encodeBool:forKey:", -[AFSiriIncomingCall isCallerIDBlocked](self, "isCallerIDBlocked"), @"isCallerIDBlocked");
}

- (AFSiriIncomingCall)initWithCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleID:(id)a5 callerContactIdentifiers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v30.receiver = self;
  v30.super_class = (Class)AFSiriIncomingCall;
  v20 = [(AFSiriIncomingCall *)&v30 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    callUUID = v20->_callUUID;
    v20->_callUUID = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    callProviderIdentifier = v20->_callProviderIdentifier;
    v20->_callProviderIdentifier = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    callProviderBundleID = v20->_callProviderBundleID;
    v20->_callProviderBundleID = (NSString *)v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v18 copyItems:1];
    callerContactIdentifiers = v20->_callerContactIdentifiers;
    v20->_callerContactIdentifiers = (NSArray *)v27;

    objc_storeStrong((id *)&v20->_handle, a7);
    v20->_isVideo = a8;
    v20->_isCallerIDBlocked = a9;
  }

  return v20;
}

- (AFSiriIncomingCall)initWithCallUUID:(id)a3 callProviderIdentifier:(id)a4 callProviderBundleID:(id)a5 callers:(id)a6 handle:(id)a7 isVideo:(BOOL)a8 isCallerIDBlocked:(BOOL)a9
{
  return -[AFSiriIncomingCall initWithCallUUID:callProviderIdentifier:callProviderBundleID:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:](self, "initWithCallUUID:callProviderIdentifier:callProviderBundleID:callerContactIdentifiers:handle:isVideo:isCallerIDBlocked:", a3, a4, a5, 0, a7, a8);
}

- (AFSiriIncomingCall)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init with no parameters is not supported" userInfo:0];
  objc_exception_throw(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
@interface WCSessionState
+ (BOOL)supportsSecureCoding;
- (BOOL)iOSDeviceNeedsFirstUnlock;
- (BOOL)isAppInstalled;
- (BOOL)isCompanionAppInstalled;
- (BOOL)isComplicationEnabled;
- (BOOL)isPaired;
- (BOOL)isReachable;
- (BOOL)isStandaloneApp;
- (NSSet)pairedDevicesPairingIDs;
- (NSString)appInstallationID;
- (NSString)pairingID;
- (NSURL)watchDirectoryURL;
- (WCSessionState)initWithCoder:(id)a3;
- (WCSessionState)initWithReachable:(BOOL)a3 iOSDeviceNeedsFirstUnlock:(BOOL)a4 activePairingID:(id)a5 standaloneApp:(BOOL)a6 companionAppInstalled:(BOOL)a7;
- (WCSessionState)initWithReachable:(BOOL)a3 paired:(BOOL)a4 appInstalled:(BOOL)a5 complicationEnabled:(BOOL)a6 remainingComplicationUserInfoTransfers:(unint64_t)a7 activePairingID:(id)a8 pairedDevicesPairingIDs:(id)a9 appInstallationID:(id)a10;
- (WCSessionState)initWithReachable:(BOOL)a3 paired:(BOOL)a4 appInstalled:(BOOL)a5 complicationEnabled:(BOOL)a6 remainingComplicationUserInfoTransfers:(unint64_t)a7 iOSDeviceNeedsFirstUnlock:(BOOL)a8 pairingID:(id)a9 pairedDevicesPairingIDs:(id)a10 appInstallationID:(id)a11 standaloneApp:(BOOL)a12 companionAppInstalled:(BOOL)a13;
- (id)description;
- (unint64_t)remainingComplicationUserInfoTransfers;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WCSessionState

- (void)encodeWithCoder:(id)a3
{
  BOOL reachable = self->_reachable;
  id v5 = a3;
  [v5 encodeBool:reachable forKey:@"reachable"];
  [v5 encodeBool:self->_paired forKey:@"paired"];
  [v5 encodeBool:self->_appInstalled forKey:@"appInstalled"];
  [v5 encodeBool:self->_complicationEnabled forKey:@"complicationEnabled"];
  [v5 encodeInteger:self->_remainingComplicationUserInfoTransfers forKey:@"remainingComplicationUserInfoTransfers"];
  [v5 encodeBool:self->_iOSDeviceNeedsFirstUnlock forKey:@"iOSDeviceNeedsFirstUnlock"];
  [v5 encodeObject:self->_pairingID forKey:@"pairingID"];
  [v5 encodeObject:self->_pairedDevicesPairingIDs forKey:@"pairedDevicesPairingIDs"];
  [v5 encodeObject:self->_appInstallationID forKey:@"appInstallationID"];
  [v5 encodeBool:self->_standalone forKey:@"standalone"];
  [v5 encodeBool:self->_companionAppInstalled forKey:@"companionAppInstalled"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInstallationID, 0);
  objc_storeStrong((id *)&self->_pairedDevicesPairingIDs, 0);

  objc_storeStrong((id *)&self->_pairingID, 0);
}

- (BOOL)isStandaloneApp
{
  return self->_standalone;
}

- (id)description
{
  v17 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  if ([(WCSessionState *)self isReachable]) {
    id v5 = "YES";
  }
  else {
    id v5 = "NO";
  }
  v16 = v5;
  if ([(WCSessionState *)self isPaired]) {
    v6 = "YES";
  }
  else {
    v6 = "NO";
  }
  if ([(WCSessionState *)self isAppInstalled]) {
    v7 = "YES";
  }
  else {
    v7 = "NO";
  }
  if ([(WCSessionState *)self isComplicationEnabled]) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  unint64_t v9 = [(WCSessionState *)self remainingComplicationUserInfoTransfers];
  v10 = [(WCSessionState *)self pairingID];
  v11 = [(WCSessionState *)self pairedDevicesPairingIDs];
  v12 = WCCompactStringFromCollection(v11);
  v13 = [(WCSessionState *)self appInstallationID];
  v14 = [v17 stringWithFormat:@"<%@: %p, reachable: %s, paired: %s, appInstalled: %s, complicationEnabled: %s(%d), pairingID: %@, pairedDevicesPairingIDs: %@, appInstallationID: %@>", v4, self, v16, v6, v7, v8, v9, v10, v12, v13];

  return v14;
}

- (unint64_t)remainingComplicationUserInfoTransfers
{
  return self->_remainingComplicationUserInfoTransfers;
}

- (BOOL)isReachable
{
  return self->_reachable;
}

- (BOOL)isPaired
{
  return self->_paired;
}

- (BOOL)isComplicationEnabled
{
  return self->_complicationEnabled;
}

- (BOOL)isAppInstalled
{
  return self->_appInstalled;
}

- (NSSet)pairedDevicesPairingIDs
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)appInstallationID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)watchDirectoryURL
{
  uint64_t v3 = [(WCSessionState *)self pairingID];
  if (v3
    && (v4 = (void *)v3,
        [(WCSessionState *)self appInstallationID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = NSURL;
    v7 = NSHomeDirectory();
    v8 = [v6 fileURLWithPath:v7 isDirectory:1];

    unint64_t v9 = [(WCSessionState *)self pairingID];
    v10 = WCWatchDirectoryLocationInContainer((uint64_t)v8, v9);

    v11 = [(WCSessionState *)self appInstallationID];
    v12 = [v10 URLByAppendingPathComponent:v11 isDirectory:1];
  }
  else
  {
    v12 = 0;
  }

  return (NSURL *)v12;
}

- (NSString)pairingID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (WCSessionState)initWithReachable:(BOOL)a3 paired:(BOOL)a4 appInstalled:(BOOL)a5 complicationEnabled:(BOOL)a6 remainingComplicationUserInfoTransfers:(unint64_t)a7 activePairingID:(id)a8 pairedDevicesPairingIDs:(id)a9 appInstallationID:(id)a10
{
  LOWORD(v11) = 0;
  return -[WCSessionState initWithReachable:paired:appInstalled:complicationEnabled:remainingComplicationUserInfoTransfers:iOSDeviceNeedsFirstUnlock:pairingID:pairedDevicesPairingIDs:appInstallationID:standaloneApp:companionAppInstalled:](self, "initWithReachable:paired:appInstalled:complicationEnabled:remainingComplicationUserInfoTransfers:iOSDeviceNeedsFirstUnlock:pairingID:pairedDevicesPairingIDs:appInstallationID:standaloneApp:companionAppInstalled:", a3, a4, a5, a6, a7, 0, a8, a9, a10, v11);
}

- (WCSessionState)initWithReachable:(BOOL)a3 paired:(BOOL)a4 appInstalled:(BOOL)a5 complicationEnabled:(BOOL)a6 remainingComplicationUserInfoTransfers:(unint64_t)a7 iOSDeviceNeedsFirstUnlock:(BOOL)a8 pairingID:(id)a9 pairedDevicesPairingIDs:(id)a10 appInstallationID:(id)a11 standaloneApp:(BOOL)a12 companionAppInstalled:(BOOL)a13
{
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  v32.receiver = self;
  v32.super_class = (Class)WCSessionState;
  v23 = [(WCSessionState *)&v32 init];
  v24 = v23;
  if (v23)
  {
    v23->_BOOL reachable = a3;
    v23->_paired = a4;
    uint64_t v25 = [v20 copy];
    pairingID = v24->_pairingID;
    v24->_pairingID = (NSString *)v25;

    uint64_t v27 = [v21 copy];
    pairedDevicesPairingIDs = v24->_pairedDevicesPairingIDs;
    v24->_pairedDevicesPairingIDs = (NSSet *)v27;

    uint64_t v29 = [v22 copy];
    appInstallationID = v24->_appInstallationID;
    v24->_appInstallationID = (NSString *)v29;

    v24->_appInstalled = a5;
    v24->_complicationEnabled = a6;
    v24->_remainingComplicationUserInfoTransfers = a7;
    v24->_iOSDeviceNeedsFirstUnlock = a8;
    v24->_standalone = a12;
    v24->_companionAppInstalled = a13;
  }

  return v24;
}

- (WCSessionState)initWithCoder:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WCSessionState;
  id v5 = [(WCSessionState *)&v19 init];
  if (v5)
  {
    v5->_BOOL reachable = [v4 decodeBoolForKey:@"reachable"];
    v5->_paired = [v4 decodeBoolForKey:@"paired"];
    v5->_appInstalled = [v4 decodeBoolForKey:@"appInstalled"];
    v5->_complicationEnabled = [v4 decodeBoolForKey:@"complicationEnabled"];
    v5->_remainingComplicationUserInfoTransfers = [v4 decodeIntegerForKey:@"remainingComplicationUserInfoTransfers"];
    v5->_iOSDeviceNeedsFirstUnlock = [v4 decodeBoolForKey:@"iOSDeviceNeedsFirstUnlock"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingID"];
    uint64_t v7 = [v6 copy];
    pairingID = v5->_pairingID;
    v5->_pairingID = (NSString *)v7;

    unint64_t v9 = (void *)MEMORY[0x263EFFA08];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
    uint64_t v11 = [v9 setWithArray:v10];
    v12 = [v4 decodeObjectOfClasses:v11 forKey:@"pairedDevicesPairingIDs"];
    uint64_t v13 = [v12 copy];
    pairedDevicesPairingIDs = v5->_pairedDevicesPairingIDs;
    v5->_pairedDevicesPairingIDs = (NSSet *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appInstallationID"];
    uint64_t v16 = [v15 copy];
    appInstallationID = v5->_appInstallationID;
    v5->_appInstallationID = (NSString *)v16;

    v5->_standalone = [v4 decodeBoolForKey:@"standalone"];
    v5->_companionAppInstalled = [v4 decodeBoolForKey:@"companionAppInstalled"];
  }

  return v5;
}

- (WCSessionState)initWithReachable:(BOOL)a3 iOSDeviceNeedsFirstUnlock:(BOOL)a4 activePairingID:(id)a5 standaloneApp:(BOOL)a6 companionAppInstalled:(BOOL)a7
{
  BYTE1(v8) = a7;
  LOBYTE(v8) = a6;
  return -[WCSessionState initWithReachable:paired:appInstalled:complicationEnabled:remainingComplicationUserInfoTransfers:iOSDeviceNeedsFirstUnlock:pairingID:pairedDevicesPairingIDs:appInstallationID:standaloneApp:companionAppInstalled:](self, "initWithReachable:paired:appInstalled:complicationEnabled:remainingComplicationUserInfoTransfers:iOSDeviceNeedsFirstUnlock:pairingID:pairedDevicesPairingIDs:appInstallationID:standaloneApp:companionAppInstalled:", a3, 1, 1, 0, 0, a4, a5, 0, 0, v8);
}

- (BOOL)isCompanionAppInstalled
{
  return self->_companionAppInstalled;
}

- (BOOL)iOSDeviceNeedsFirstUnlock
{
  return self->_iOSDeviceNeedsFirstUnlock;
}

@end
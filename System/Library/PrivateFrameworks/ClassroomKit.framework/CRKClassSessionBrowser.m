@interface CRKClassSessionBrowser
- (BOOL)allowInvitationSessions;
- (BOOL)allowUnenrolledSessions;
- (BOOL)hasConnectionToClassWithIdentifier:(id)a3;
- (BOOL)isBrowsing;
- (CRKClassSessionBrowser)init;
- (CRKClassSessionBrowserDelegate)delegate;
- (CRKInvitationSessionBrowserDelegate)invitationSessionDelegate;
- (NSSet)enrolledControlGroupIdentifiers;
- (NSSet)inRangeClassSessionIdentifiers;
- (NSSet)organizationUUIDs;
- (id)browserStateDictionary;
- (id)clientIdentityForSession:(id)a3;
- (id)delegateNeedsClientIdentityForGroup:(id)a3;
- (id)delegateNeedsClientIdentityForInvitationSessionWithEndpoint:(id)a3;
- (id)delegateNeedsTrustedAnchorCertificatesForGroup:(id)a3;
- (id)stateDictionariesByClassSessionIdentifierString;
- (id)trustedAnchorCertificatesForSession:(id)a3;
- (void)acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:(id)a3;
- (void)acquireConnectWithoutBeaconAssertionForSessionIdentifier:(id)a3;
- (void)addInRangeClassSession:(id)a3;
- (void)beaconBrowser:(id)a3 didFailWithError:(id)a4;
- (void)beaconBrowser:(id)a3 didFindBeaconForClassSession:(id)a4 flags:(unsigned __int16)a5;
- (void)beaconBrowser:(id)a3 didFindBeaconForInvitationSessionWithEndpoint:(id)a4;
- (void)classSessionInvalidated:(id)a3;
- (void)classSessionRejected:(id)a3;
- (void)connectToClassSessionWithIdentifier:(id)a3;
- (void)dealloc;
- (void)delegateClassSessionDidBecomeConnectable:(id)a3;
- (void)delegateClassSessionDidBecomeNotConnectable:(id)a3;
- (void)delegateDidFailWithError:(id)a3;
- (void)delegateDidFindClassSession:(id)a3 transport:(id)a4;
- (void)delegateDidFindInvitationSession:(id)a3 transport:(id)a4;
- (void)delegateDidRemoveClassSession:(id)a3;
- (void)delegateDidRemoveInvitationSession:(id)a3;
- (void)delegateInRangeClassSessionsDidChange;
- (void)delegateLostConnectionToClassSession:(id)a3;
- (void)delegateLostConnectionToInvitationSession:(id)a3;
- (void)handleUntrustedClassSession:(id)a3 ASMInstructorIdentifier:(id)a4 decisionHandler:(id)a5;
- (void)handleUntrustedInvitationSession:(id)a3 decisionHandler:(id)a4;
- (void)invitationSessionWithEndpointInvalidated:(id)a3;
- (void)lostConnectionToClassSession:(id)a3;
- (void)lostConnectionToInvitationSessionWithEndpoint:(id)a3;
- (void)reachabilityDidChange:(id)a3;
- (void)releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:(id)a3;
- (void)releaseConnectWithoutBeaconAssertionForSessionIdentifier:(id)a3;
- (void)removeInRangeClassSession:(id)a3;
- (void)session:(id)a3 didConnectWithTransport:(id)a4;
- (void)session:(id)a3 encounteredUntrustedConnectionForASMInstructorIdentifier:(id)a4 decisionHandler:(id)a5;
- (void)session:(id)a3 willLoseBeaconAfterTimeInterval:(double)a4;
- (void)sessionDidBecomeConnectable:(id)a3;
- (void)sessionDidBecomeNotConnectable:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)sessionDidInvalidate:(id)a3;
- (void)sessionDidLoseBeacon:(id)a3;
- (void)setAllowInvitationSessions:(BOOL)a3;
- (void)setAllowUnenrolledSessions:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrolledControlGroupIdentifiers:(id)a3;
- (void)setInvitationSessionDelegate:(id)a3;
- (void)setOrganizationUUIDs:(id)a3;
- (void)startBrowsing;
- (void)stopBrowsing;
- (void)updateConnectedSessions;
- (void)updateRequiresBeaconFlagForSession:(id)a3;
@end

@implementation CRKClassSessionBrowser

- (void)dealloc
{
  [(CATNetworkReachability *)self->mNetworkReachability setDelegate:0];
  mNetworkReachability = self->mNetworkReachability;
  v4 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [(CATNetworkReachability *)mNetworkReachability removeFromRunLoop:v4 forMode:*MEMORY[0x263EFF478]];

  v5.receiver = self;
  v5.super_class = (Class)CRKClassSessionBrowser;
  [(CRKClassSessionBrowser *)&v5 dealloc];
}

- (CRKClassSessionBrowser)init
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    v23 = NSStringFromSelector(a2);
    [v22 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 44, @"%@ must be called from the main thread", v23 object file lineNumber description];
  }
  v24.receiver = self;
  v24.super_class = (Class)CRKClassSessionBrowser;
  v4 = [(CRKClassSessionBrowser *)&v24 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    mClassSessionsByIdentifier = v4->mClassSessionsByIdentifier;
    v4->mClassSessionsByIdentifier = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    mInRangeClassSessions = v4->mInRangeClassSessions;
    v4->mInRangeClassSessions = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    mInvitationSessionsByEndpoint = v4->mInvitationSessionsByEndpoint;
    v4->mInvitationSessionsByEndpoint = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263F39C80] reachabilityForLocalWiFi];
    mNetworkReachability = v4->mNetworkReachability;
    v4->mNetworkReachability = (CATNetworkReachability *)v11;

    [(CATNetworkReachability *)v4->mNetworkReachability setDelegate:v4];
    v13 = v4->mNetworkReachability;
    v14 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(CATNetworkReachability *)v13 scheduleInRunLoop:v14 forMode:*MEMORY[0x263EFF478]];

    uint64_t v15 = objc_opt_new();
    mBeaconBrowser = v4->mBeaconBrowser;
    v4->mBeaconBrowser = (CRKClassSessionBeaconBrowser *)v15;

    [(CRKClassSessionBeaconBrowser *)v4->mBeaconBrowser setDelegate:v4];
    uint64_t v17 = objc_opt_new();
    mConnectWithoutBeaconAssertionCountBySessionIdentifier = v4->mConnectWithoutBeaconAssertionCountBySessionIdentifier;
    v4->mConnectWithoutBeaconAssertionCountBySessionIdentifier = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_opt_new();
    mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint = v4->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint;
    v4->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint = (NSMutableDictionary *)v19;
  }
  return v4;
}

- (void)setOrganizationUUIDs:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x263F08B88];
  id v6 = a3;
  if (([v5 isMainThread] & 1) == 0)
  {
    uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 68, @"%@ must be called from the main thread", v10 object file lineNumber description];
  }
  [(CRKClassSessionBeaconBrowser *)self->mBeaconBrowser setOrganizationUUIDs:v6];
  uint64_t v7 = (NSSet *)[v6 copy];

  organizationUUIDs = self->_organizationUUIDs;
  self->_organizationUUIDs = v7;
}

- (void)setEnrolledControlGroupIdentifiers:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 75, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  uint64_t v5 = (NSSet *)[v9 copy];
  enrolledControlGroupIdentifiers = self->_enrolledControlGroupIdentifiers;
  self->_enrolledControlGroupIdentifiers = v5;

  [(CRKClassSessionBrowser *)self updateConnectedSessions];
}

- (void)setAllowUnenrolledSessions:(BOOL)a3
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 83, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  self->_allowUnenrolledSessions = a3;
  if (!a3)
  {
    [(CRKClassSessionBrowser *)self updateConnectedSessions];
  }
}

- (void)setAllowInvitationSessions:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v6 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 93, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  [(CRKClassSessionBeaconBrowser *)self->mBeaconBrowser setAllowInvitationSessions:v3];
  self->_allowInvitationSessions = v3;
  if (!v3)
  {
    [(CRKClassSessionBrowser *)self updateConnectedSessions];
  }
}

- (void)connectToClassSessionWithIdentifier:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:a3];
  [v3 connect];
}

- (void)classSessionInvalidated:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 111, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  uint64_t v5 = v9;
  if (v9)
  {
    id v6 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v9];
    [v6 invalidate];

    uint64_t v5 = v9;
  }
}

- (void)classSessionRejected:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 119, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  uint64_t v5 = v9;
  if (v9)
  {
    id v6 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v9];
    [v6 rejected];

    uint64_t v5 = v9;
  }
}

- (void)lostConnectionToClassSession:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 127, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  uint64_t v5 = v9;
  if (v9)
  {
    id v6 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v9];
    [v6 lostConnection];

    uint64_t v5 = v9;
  }
}

- (BOOL)hasConnectionToClassWithIdentifier:(id)a3
{
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    v10 = NSStringFromSelector(a2);
    [v9 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 135, @"%@ must be called from the main thread", v10 object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 136, @"Invalid parameter not satisfying: %@", @"classIdentifier" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v5];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)invitationSessionWithEndpointInvalidated:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 141, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  id v5 = v9;
  if (v9)
  {
    id v6 = [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint objectForKeyedSubscript:v9];
    [v6 invalidate];

    [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint removeObjectForKey:v9];
    id v5 = v9;
  }
}

- (void)lostConnectionToInvitationSessionWithEndpoint:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 150, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  id v5 = v9;
  if (v9)
  {
    id v6 = [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint objectForKeyedSubscript:v9];
    [v6 lostConnection];

    id v5 = v9;
  }
}

- (void)acquireConnectWithoutBeaconAssertionForSessionIdentifier:(id)a3
{
  id v5 = a3;
  id v15 = v5;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 158, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" object file lineNumber description];

    id v5 = 0;
  }
  uint64_t v6 = [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountBySessionIdentifier objectForKeyedSubscript:v5];
  BOOL v7 = (void *)v6;
  v8 = &unk_26D81A360;
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  v10 = NSNumber;
  uint64_t v11 = [v9 unsignedIntegerValue];

  v12 = [v10 numberWithUnsignedInteger:v11 + 1];
  [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountBySessionIdentifier setObject:v12 forKeyedSubscript:v15];

  v13 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v15];
  [(CRKClassSessionBrowser *)self updateRequiresBeaconFlagForSession:v13];
}

- (void)releaseConnectWithoutBeaconAssertionForSessionIdentifier:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 166, @"Invalid parameter not satisfying: %@", @"sessionIdentifier" object file lineNumber description];

    id v5 = 0;
  }
  uint64_t v6 = [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountBySessionIdentifier objectForKeyedSubscript:v5];
  BOOL v7 = v6;
  if (v6)
  {
    if ([v6 isEqual:&unk_26D81A378])
    {
      [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountBySessionIdentifier removeObjectForKey:v11];
    }
    else
    {
      v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") - 1);
      [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountBySessionIdentifier setObject:v8 forKeyedSubscript:v11];
    }
    id v9 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v11];
    [(CRKClassSessionBrowser *)self updateRequiresBeaconFlagForSession:v9];
  }
}

- (void)acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:(id)a3
{
  id v5 = a3;
  id v15 = v5;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 185, @"Invalid parameter not satisfying: %@", @"endpoint" object file lineNumber description];

    id v5 = 0;
  }
  uint64_t v6 = [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint objectForKeyedSubscript:v5];
  BOOL v7 = (void *)v6;
  v8 = &unk_26D81A360;
  if (v6) {
    v8 = (void *)v6;
  }
  id v9 = v8;

  v10 = NSNumber;
  uint64_t v11 = [v9 unsignedIntegerValue];

  v12 = [v10 numberWithUnsignedInteger:v11 + 1];
  [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint setObject:v12 forKeyedSubscript:v15];

  v13 = [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint objectForKeyedSubscript:v15];
  [(CRKClassSessionBrowser *)self updateRequiresBeaconFlagForSession:v13];
}

- (void)releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:(id)a3
{
  id v5 = a3;
  id v11 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 193, @"Invalid parameter not satisfying: %@", @"endpoint" object file lineNumber description];

    id v5 = 0;
  }
  uint64_t v6 = [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint objectForKeyedSubscript:v5];
  BOOL v7 = v6;
  if (v6)
  {
    if ([v6 isEqual:&unk_26D81A378])
    {
      [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint removeObjectForKey:v11];
    }
    else
    {
      v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") - 1);
      [(NSMutableDictionary *)self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint setObject:v8 forKeyedSubscript:v11];
    }
    id v9 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v11];
    [(CRKClassSessionBrowser *)self updateRequiresBeaconFlagForSession:v9];
  }
}

- (void)startBrowsing
{
}

- (void)stopBrowsing
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self->mBeaconBrowser selector:sel_startBrowsing object:0];
  mBeaconBrowser = self->mBeaconBrowser;

  [(CRKClassSessionBeaconBrowser *)mBeaconBrowser stopBrowsing];
}

- (BOOL)isBrowsing
{
  return [(CRKClassSessionBeaconBrowser *)self->mBeaconBrowser isBrowsing];
}

- (NSSet)inRangeClassSessionIdentifiers
{
  v2 = (void *)MEMORY[0x263EFFA08];
  id v3 = [(NSMutableArray *)self->mInRangeClassSessions valueForKey:@"identifier"];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)clientIdentityForSession:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 identifier];

    uint64_t v6 = [v5 groupIdentifier];
    BOOL v7 = [(CRKClassSessionBrowser *)self delegateNeedsClientIdentityForGroup:v6];
  }
  else
  {
    id v5 = [v4 endpoint];

    BOOL v7 = [(CRKClassSessionBrowser *)self delegateNeedsClientIdentityForInvitationSessionWithEndpoint:v5];
  }

  return v7;
}

- (id)trustedAnchorCertificatesForSession:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 identifier];
    uint64_t v6 = [v5 groupIdentifier];
    BOOL v7 = [(CRKClassSessionBrowser *)self delegateNeedsTrustedAnchorCertificatesForGroup:v6];
  }
  else
  {
    BOOL v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

- (void)sessionDidBecomeConnectable:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CRKClassSessionBrowser *)self delegateClassSessionDidBecomeConnectable:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 connect];
    }
    else {
      [v4 invalidate];
    }
  }
}

- (void)sessionDidBecomeNotConnectable:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(CRKClassSessionBrowser *)self delegateClassSessionDidBecomeNotConnectable:v4];
  }
}

- (void)session:(id)a3 didConnectWithTransport:(id)a4
{
  id v8 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 identifier];

    [(CRKClassSessionBrowser *)self delegateDidFindClassSession:v7 transport:v8];
    id v6 = (id)v7;
  }
  else
  {
    [(CRKClassSessionBrowser *)self delegateDidFindInvitationSession:v6 transport:v8];
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v5 identifier];

    [(CRKClassSessionBrowser *)self delegateLostConnectionToClassSession:v4];
    id v5 = (id)v4;
  }
  else
  {
    [(CRKClassSessionBrowser *)self delegateLostConnectionToInvitationSession:v5];
  }
}

- (void)session:(id)a3 willLoseBeaconAfterTimeInterval:(double)a4
{
}

- (void)sessionDidLoseBeacon:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = _CRKLogGeneral_21();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v5 identifier];
      int v11 = 138543618;
      v12 = v7;
      __int16 v13 = 1024;
      int v14 = [v5 flags];
      _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "Class session lost beacon %{public}@ [%d]", (uint8_t *)&v11, 0x12u);
    }
    id v8 = [v5 identifier];
    [(CRKClassSessionBrowser *)self delegateDidRemoveClassSession:v8];
  }
  else
  {
    id v5 = _CRKLogGeneral_21();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 endpoint];
      v10 = [v9 stringValue];
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_224C00000, v5, OS_LOG_TYPE_DEFAULT, "Invite session lost beacon %{public}@", (uint8_t *)&v11, 0xCu);
    }
  }

  [v4 invalidate];
}

- (void)sessionDidInvalidate:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    mClassSessionsByIdentifier = self->mClassSessionsByIdentifier;
    id v5 = v9;
    id v6 = [v5 identifier];
    [(NSMutableDictionary *)mClassSessionsByIdentifier removeObjectForKey:v6];

    [(CRKClassSessionBrowser *)self removeInRangeClassSession:v5];
  }
  else
  {
    mInvitationSessionsByEndpoint = self->mInvitationSessionsByEndpoint;
    id v8 = [v9 endpoint];
    [(NSMutableDictionary *)mInvitationSessionsByEndpoint removeObjectForKey:v8];

    [(CRKClassSessionBrowser *)self delegateDidRemoveInvitationSession:v9];
  }
}

- (void)session:(id)a3 encounteredUntrustedConnectionForASMInstructorIdentifier:(id)a4 decisionHandler:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(CRKClassSessionBrowser *)self handleUntrustedInvitationSession:v10 decisionHandler:v9];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CRKClassSessionBrowser *)self handleUntrustedClassSession:v10 ASMInstructorIdentifier:v8 decisionHandler:v9];
    }
    else {
      v9[2](v9, 0);
    }
  }
}

- (void)handleUntrustedInvitationSession:(id)a3 decisionHandler:(id)a4
{
  id v6 = (void (**)(id, uint64_t))a4;
  if ([(CRKClassSessionBrowser *)self allowInvitationSessions]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 0;
  }
  v6[2](v6, v5);
}

- (void)handleUntrustedClassSession:(id)a3 ASMInstructorIdentifier:(id)a4 decisionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(CRKClassSessionBrowser *)self delegate];
  int v11 = [v10 identifier];

  [v12 browser:self encounteredUntrustedClassSession:v11 ASMInstructorIdentifier:v9 decisionHandler:v8];
}

- (void)beaconBrowser:(id)a3 didFailWithError:(id)a4
{
}

- (void)beaconBrowser:(id)a3 didFindBeaconForClassSession:(id)a4 flags:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = (CRKClassSession *)a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = NSStringFromSelector(a2);
    [v15 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 348, @"%@ must be called from the main thread", v16 object file lineNumber description];
  }
  id v9 = [(CRKClassSessionBrowser *)self enrolledControlGroupIdentifiers];
  id v10 = [(CRKClassSession *)v8 groupIdentifier];
  if ([v9 containsObject:v10])
  {
  }
  else
  {
    BOOL v11 = [(CRKClassSessionBrowser *)self allowUnenrolledSessions];

    if ((v5 & 1) == 0 || !v11) {
      goto LABEL_15;
    }
  }
  id v12 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v8];
  if (!v12)
  {
    __int16 v13 = _CRKLogGeneral_21();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      __int16 v19 = 1024;
      int v20 = v5;
      _os_log_impl(&dword_224C00000, v13, OS_LOG_TYPE_DEFAULT, "Found class session with beacon %{public}@ [%d]", buf, 0x12u);
    }

    id v12 = [[CRKClassSession alloc] initWithIdentifier:v8];
    [(CRKSession *)v12 setDelegate:self];
    [(NSMutableDictionary *)self->mClassSessionsByIdentifier setObject:v12 forKeyedSubscript:v8];
    [(CRKClassSessionBrowser *)self updateRequiresBeaconFlagForSession:v12];
    if (([(CATNetworkReachability *)self->mNetworkReachability isReachable] & 1) == 0) {
      [(CRKSession *)v12 localWiFiBecameUnavailable];
    }
  }
  [(CRKClassSessionBrowser *)self addInRangeClassSession:v12];
  int v14 = _CRKLogGeneral_21();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v12;
    __int16 v19 = 1024;
    int v20 = v5;
    _os_log_impl(&dword_224C00000, v14, OS_LOG_TYPE_DEFAULT, "Telling class session %{public}@ that we found beacon with flags [%d]", buf, 0x12u);
  }

  [(CRKClassSession *)v12 foundBeaconWithFlags:v5];
LABEL_15:
}

- (void)beaconBrowser:(id)a3 didFindBeaconForInvitationSessionWithEndpoint:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    BOOL v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 376, @"%@ must be called from the main thread", v11 object file lineNumber description];
  }
  uint64_t v7 = [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v8 = _CRKLogGeneral_21();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 stringValue];
      *(_DWORD *)buf = 138543362;
      __int16 v13 = v9;
      _os_log_impl(&dword_224C00000, v8, OS_LOG_TYPE_DEFAULT, "Found invitation session with ip %{public}@", buf, 0xCu);
    }
    uint64_t v7 = [(CRKSession *)[CRKInvitationSession alloc] initWithEndpoint:v6];
    [(CRKSession *)v7 setDelegate:self];
    [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint setObject:v7 forKeyedSubscript:v6];
    [(CRKClassSessionBrowser *)self updateRequiresBeaconFlagForSession:v7];
    if (([(CATNetworkReachability *)self->mNetworkReachability isReachable] & 1) == 0) {
      [(CRKSession *)v7 localWiFiBecameUnavailable];
    }
  }
  [(CRKSession *)v7 foundBeacon];
}

- (void)reachabilityDidChange:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if ([a3 isReachable])
  {
    if ([(CRKClassSessionBeaconBrowser *)self->mBeaconBrowser isBrowsing])
    {
      [(CRKClassSessionBeaconBrowser *)self->mBeaconBrowser stopBrowsing];
      [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self->mBeaconBrowser selector:sel_startBrowsing object:0];
      [(CRKClassSessionBeaconBrowser *)self->mBeaconBrowser performSelector:sel_startBrowsing withObject:0 afterDelay:1.0];
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v4 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v36 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v35 + 1) + 8 * i) localWiFiBecameAvailable];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v6);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint allValues];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v32 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * j) localWiFiBecameAvailable];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v11);
    }
  }
  else
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v14 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier allValues];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * k) localWiFiBecameUnavailable];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v40 count:16];
      }
      while (v16);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint allValues];
    uint64_t v19 = [v9 countByEnumeratingWithState:&v23 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (uint64_t m = 0; m != v20; ++m)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * m) localWiFiBecameUnavailable];
        }
        uint64_t v20 = [v9 countByEnumeratingWithState:&v23 objects:v39 count:16];
      }
      while (v20);
    }
  }
}

- (void)addInRangeClassSession:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableArray containsObject:](self->mInRangeClassSessions, "containsObject:") & 1) == 0)
  {
    [(NSMutableArray *)self->mInRangeClassSessions addObject:v4];
    [(CRKClassSessionBrowser *)self delegateInRangeClassSessionsDidChange];
  }
}

- (void)removeInRangeClassSession:(id)a3
{
  id v4 = a3;
  if (-[NSMutableArray containsObject:](self->mInRangeClassSessions, "containsObject:"))
  {
    [(NSMutableArray *)self->mInRangeClassSessions removeObject:v4];
    [(CRKClassSessionBrowser *)self delegateInRangeClassSessionsDidChange];
  }
}

- (void)updateRequiresBeaconFlagForSession:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      mConnectWithoutBeaconAssertionCountBySessionIdentifier = self->mConnectWithoutBeaconAssertionCountBySessionIdentifier;
      uint64_t v6 = [v9 identifier];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v8 = 0;
        goto LABEL_8;
      }
      mConnectWithoutBeaconAssertionCountBySessionIdentifier = self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint;
      uint64_t v6 = [v9 endpoint];
    }
    uint64_t v7 = (void *)v6;
    id v8 = [(NSMutableDictionary *)mConnectWithoutBeaconAssertionCountBySessionIdentifier objectForKeyedSubscript:v6];

LABEL_8:
    objc_msgSend(v9, "setRequiresBeacon:", objc_msgSend(v8, "unsignedIntegerValue") == 0);

    id v4 = v9;
  }
}

- (id)stateDictionariesByClassSessionIdentifierString
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v4 = self->mClassSessionsByIdentifier;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier objectForKeyedSubscript:v9];
        uint64_t v11 = [v10 stateDictionary];
        uint64_t v12 = [v9 stringValue];
        [v3 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  __int16 v13 = [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        uint64_t v19 = [v18 stateDictionary];
        uint64_t v20 = [v18 endpoint];
        uint64_t v21 = [v20 stringValue];
        [v3 setObject:v19 forKeyedSubscript:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v15);
  }

  return v3;
}

- (id)browserStateDictionary
{
  return [(CRKClassSessionBeaconBrowser *)self->mBeaconBrowser stateDictionary];
}

- (void)updateConnectedSessions
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  id v4 = [(CRKClassSessionBrowser *)self enrolledControlGroupIdentifiers];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->mClassSessionsByIdentifier allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        uint64_t v12 = [v11 groupIdentifier];

        if (([v4 containsObject:v12] & 1) == 0
          && (![(CRKClassSessionBrowser *)self allowUnenrolledSessions]
           || ([v10 flags] & 1) == 0))
        {
          __int16 v13 = [v10 identifier];
          [v3 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v7);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v3;
  uint64_t v14 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v36;
    *(void *)&long long v15 = 138543362;
    long long v29 = v15;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        uint64_t v20 = -[NSMutableDictionary objectForKeyedSubscript:](self->mClassSessionsByIdentifier, "objectForKeyedSubscript:", v19, v29);
        uint64_t v21 = _CRKLogGeneral_21();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v29;
          v45 = v20;
          _os_log_impl(&dword_224C00000, v21, OS_LOG_TYPE_DEFAULT, "Invalidating session because we are no longer enrolled: %{public}@", buf, 0xCu);
        }

        [(CRKClassSessionBrowser *)self delegateDidRemoveClassSession:v19];
        [v20 invalidate];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v16);
  }

  if (![(CRKClassSessionBrowser *)self allowInvitationSessions])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v22 = [(NSMutableDictionary *)self->mInvitationSessionsByEndpoint allValues];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v24; ++k)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = *(void **)(*((void *)&v31 + 1) + 8 * k);
          long long v28 = _CRKLogGeneral_21();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v45 = v27;
            _os_log_impl(&dword_224C00000, v28, OS_LOG_TYPE_DEFAULT, "Invalidating invitation session because we are not browsing for invitations: %{public}@", buf, 0xCu);
          }

          [v27 invalidate];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v24);
    }
  }
}

- (void)delegateDidFailWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(CRKClassSessionBrowser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(CRKClassSessionBrowser *)self delegate];
    [v6 browser:self didFailWithError:v7];
  }
}

- (id)delegateNeedsClientIdentityForGroup:(id)a3
{
  id v4 = a3;
  char v5 = [(CRKClassSessionBrowser *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRKClassSessionBrowser *)self delegate];
    uint64_t v8 = [v7 browser:self clientIdentityForGroup:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)delegateNeedsTrustedAnchorCertificatesForGroup:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"CRKClassSessionBrowser.m", 532, @"Invalid parameter not satisfying: %@", @"groupIdentifier" object file lineNumber description];
  }
  char v6 = [(CRKClassSessionBrowser *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    uint64_t v8 = [(CRKClassSessionBrowser *)self delegate];
    id v9 = [v8 browser:self trustedAnchorCertificatesForGroup:v5];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)delegateClassSessionDidBecomeConnectable:(id)a3
{
  id v8 = a3;
  id v4 = [(CRKClassSessionBrowser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CRKClassSessionBrowser *)self delegate];
    char v7 = [v8 identifier];
    objc_msgSend(v6, "browser:classSessionDidBecomeConnectable:withFlags:", self, v7, objc_msgSend(v8, "flags"));
  }
}

- (void)delegateClassSessionDidBecomeNotConnectable:(id)a3
{
  id v8 = a3;
  id v4 = [(CRKClassSessionBrowser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(CRKClassSessionBrowser *)self delegate];
    char v7 = [v8 identifier];
    objc_msgSend(v6, "browser:classSessionDidBecomeNotConnectable:withFlags:", self, v7, objc_msgSend(v8, "flags"));
  }
}

- (void)delegateDidFindClassSession:(id)a3 transport:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRKClassSessionBrowser *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = _CRKLogGeneral_21();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_224C00000, v10, OS_LOG_TYPE_DEFAULT, "Found class session %{public}@", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v11 = [(CRKClassSessionBrowser *)self delegate];
    [v11 browser:self didFindClassSession:v6 transport:v7];
  }
}

- (void)delegateLostConnectionToClassSession:(id)a3
{
  id v7 = a3;
  id v4 = [(CRKClassSessionBrowser *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKClassSessionBrowser *)self delegate];
    [v6 browser:self lostConnectionToClassSession:v7];
  }
}

- (void)delegateDidRemoveClassSession:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(CRKClassSessionBrowser *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = _CRKLogGeneral_21();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "Removed class session %{public}@", (uint8_t *)&v9, 0xCu);
    }

    id v8 = [(CRKClassSessionBrowser *)self delegate];
    [v8 browser:self didRemoveClassSession:v4];
  }
}

- (void)delegateInRangeClassSessionsDidChange
{
  id v3 = [(CRKClassSessionBrowser *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v6 = [(CRKClassSessionBrowser *)self delegate];
    char v5 = [(CRKClassSessionBrowser *)self inRangeClassSessionIdentifiers];
    [v6 browser:self didUpdateInRangeClassSessions:v5];
  }
}

- (id)delegateNeedsClientIdentityForInvitationSessionWithEndpoint:(id)a3
{
  id v4 = a3;
  char v5 = [(CRKClassSessionBrowser *)self invitationSessionDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CRKClassSessionBrowser *)self invitationSessionDelegate];
    id v8 = [v7 browser:self needsClientIdentityForEndpoint:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)delegateDidFindInvitationSession:(id)a3 transport:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CRKClassSessionBrowser *)self invitationSessionDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = _CRKLogGeneral_21();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v6 endpoint];
      int v12 = [v11 stringValue];
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl(&dword_224C00000, v10, OS_LOG_TYPE_DEFAULT, "Found invitation session %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v13 = [(CRKClassSessionBrowser *)self invitationSessionDelegate];
    uint64_t v14 = [v6 endpoint];
    [v13 browser:self didFindInvitationSessionWithEndpoint:v14 transport:v7];
  }
}

- (void)delegateLostConnectionToInvitationSession:(id)a3
{
  id v8 = a3;
  id v4 = [(CRKClassSessionBrowser *)self invitationSessionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKClassSessionBrowser *)self invitationSessionDelegate];
    id v7 = [v8 endpoint];
    [v6 browser:self lostConnectionToInvitationSessionWithEndpoint:v7];
  }
}

- (void)delegateDidRemoveInvitationSession:(id)a3
{
  id v8 = a3;
  id v4 = [(CRKClassSessionBrowser *)self invitationSessionDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CRKClassSessionBrowser *)self invitationSessionDelegate];
    id v7 = [v8 endpoint];
    [v6 browser:self didRemoveInvitationSessionWithEndpoint:v7];
  }
}

- (CRKClassSessionBrowserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKClassSessionBrowserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CRKInvitationSessionBrowserDelegate)invitationSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invitationSessionDelegate);

  return (CRKInvitationSessionBrowserDelegate *)WeakRetained;
}

- (void)setInvitationSessionDelegate:(id)a3
{
}

- (NSSet)organizationUUIDs
{
  return self->_organizationUUIDs;
}

- (NSSet)enrolledControlGroupIdentifiers
{
  return self->_enrolledControlGroupIdentifiers;
}

- (BOOL)allowInvitationSessions
{
  return self->_allowInvitationSessions;
}

- (BOOL)allowUnenrolledSessions
{
  return self->_allowUnenrolledSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrolledControlGroupIdentifiers, 0);
  objc_storeStrong((id *)&self->_organizationUUIDs, 0);
  objc_destroyWeak((id *)&self->_invitationSessionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->mConnectWithoutBeaconAssertionCountByInviteSessionEndpoint, 0);
  objc_storeStrong((id *)&self->mConnectWithoutBeaconAssertionCountBySessionIdentifier, 0);
  objc_storeStrong((id *)&self->mNetworkReachability, 0);
  objc_storeStrong((id *)&self->mBeaconBrowser, 0);
  objc_storeStrong((id *)&self->mInvitationSessionsByEndpoint, 0);
  objc_storeStrong((id *)&self->mInRangeClassSessions, 0);

  objc_storeStrong((id *)&self->mClassSessionsByIdentifier, 0);
}

@end
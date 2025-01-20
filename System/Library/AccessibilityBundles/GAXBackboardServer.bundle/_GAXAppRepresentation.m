@interface _GAXAppRepresentation
- (AXIPCClient)appClient;
- (BOOL)_hasValidPID;
- (BOOL)_setupGAXClientConnection;
- (BOOL)isCoreAuthUI;
- (BOOL)isGAXClientLoaded;
- (BOOL)isHostedByTheSystemApp;
- (BOOL)isPreferences;
- (BOOL)isPurpleBuddy;
- (BOOL)isWebApp;
- (BOOL)prepareForTransitionToWorkspaceAndRetrieveRestrictionsInformation:(id *)a3;
- (BOOL)wasPlayingMedia;
- (_GAXAppRepresentation)initWithDelegate:(id)a3;
- (_GAXAppRepresentationDelegate)delegate;
- (id)containedViewsForArchivedFingerPath:(id)a3;
- (id)description;
- (id)restrictionIdentifiers;
- (unint64_t)relaunchAttempts;
- (void)_sendMessageToClient:(id)a3 replyMessage:(id *)a4 timeout:(double)a5 description:(id)a6;
- (void)dealloc;
- (void)handleDeath;
- (void)restrictionWithIdentifier:(id)a3 didChangeState:(int64_t)a4;
- (void)resume;
- (void)setAppClient:(id)a3;
- (void)setGaxClientLoaded:(BOOL)a3;
- (void)setRelaunchAttempts:(unint64_t)a3;
- (void)setWasPlayingMedia:(BOOL)a3;
- (void)settingsDidChangeWithServerMode:(unsigned int)a3 allowsMotion:(BOOL)a4 allowsKeyboardTextInput:(BOOL)a5;
- (void)suspend;
- (void)terminate;
@end

@implementation _GAXAppRepresentation

- (_GAXAppRepresentation)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GAXAppRepresentation;
  v5 = [(_GAXAppRepresentation *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)dealloc
{
  v3 = [(_GAXAppRepresentation *)self appClient];
  id v4 = v3;
  if (v3)
  {
    id v9 = 0;
    unsigned __int8 v5 = [v3 disconnectWithError:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      v7 = GAXLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v11 = v6;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Guided Access could not disconnect from frontmost app message service gracefully: %{public}@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  [v4 setPortDeathHandler:0];
  [(_GAXAppRepresentation *)self setBundleIdentifier:0];

  v8.receiver = self;
  v8.super_class = (Class)_GAXAppRepresentation;
  [(_GAXAppRepresentation *)&v8 dealloc];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_GAXAppRepresentation;
  v3 = [(_GAXAppRepresentation *)&v7 description];
  id v4 = [v3 mutableCopy];

  unsigned __int8 v5 = +[NSNumber numberWithBool:[(_GAXAppRepresentation *)self isGAXClientLoaded]];
  [v4 appendFormat:@". GAX Client loaded: %@", v5];

  return v4;
}

- (BOOL)isHostedByTheSystemApp
{
  v2 = [(_GAXAppRepresentation *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.InCallService"];

  return v3;
}

- (BOOL)isWebApp
{
  unsigned __int8 v3 = +[AXSpringBoardServer server];
  id v4 = [(_GAXAppRepresentation *)self bundleIdentifier];
  unsigned __int8 v5 = [v3 gaxIsWebAppAndForegroundRunning:v4];

  return v5;
}

- (BOOL)isPurpleBuddy
{
  v2 = [(_GAXAppRepresentation *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.purplebuddy"];

  return v3;
}

- (BOOL)isPreferences
{
  v2 = [(_GAXAppRepresentation *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.Preferences"];

  return v3;
}

- (BOOL)isCoreAuthUI
{
  v2 = [(_GAXAppRepresentation *)self bundleIdentifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"com.apple.CoreAuthUI"];

  return v3;
}

- (void)terminate
{
  unsigned __int8 v3 = GAXLogAppLaunching();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_2B6F8(self);
  }

  kill((pid_t)[(_GAXAppRepresentation *)self pid], 9);
}

- (void)suspend
{
  if (!self->_isSuspended)
  {
    [(_GAXAppRepresentation *)self pid];
    AXPidSuspend();
    unsigned __int8 v3 = GAXLogAppLaunching();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(_GAXAppRepresentation *)self bundleIdentifier];
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "GAX: Suspending process: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    [(_GAXAppRepresentation *)self pid];
    pid_suspend();
    self->_isSuspended = 1;
  }
}

- (void)resume
{
  if (self->_isSuspended)
  {
    [(_GAXAppRepresentation *)self pid];
    AXPidUnsuspend();
    unsigned __int8 v3 = GAXLogAppLaunching();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(_GAXAppRepresentation *)self bundleIdentifier];
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "GAX: Resuming process: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    [(_GAXAppRepresentation *)self pid];
    pid_resume();
    self->_isSuspended = 0;
  }
}

- (void)settingsDidChangeWithServerMode:(unsigned int)a3 allowsMotion:(BOOL)a4 allowsKeyboardTextInput:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v13[0] = @"GAXIPCPayloadKeyServerMode";
  objc_super v8 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  v14[0] = v8;
  v13[1] = @"GAXIPCPayloadKeyAllowsMotion";
  id v9 = +[NSNumber numberWithBool:v6];
  v14[1] = v9;
  v13[2] = @"GAXIPCPayloadKeyAllowsKeyboardTextInput";
  v10 = +[NSNumber numberWithBool:v5];
  v14[2] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  id v12 = [objc_alloc((Class)AXIPCMessage) initWithKey:11003 payload:v11];
  [(_GAXAppRepresentation *)self _sendMessageToClient:v12 replyMessage:0 timeout:@"notify client app of server settings change" description:0.0];
}

- (id)containedViewsForArchivedFingerPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v4, @"GAXIPCPayloadKeyPath", 0);
    id v6 = [objc_alloc((Class)AXIPCMessage) initWithKey:11000 payload:v5];
    id v11 = 0;
    [(_GAXAppRepresentation *)self _sendMessageToClient:v6 replyMessage:&v11 timeout:@"get contained views for finger path" description:0.0];
    id v7 = v11;

    objc_super v8 = [v7 payload];

    id v9 = [v8 objectForKey:@"GAXIPCPayloadKeyViewsForPath"];

    if (!v9) {
      _AXLogWithFacility();
    }
  }
  else
  {
    _AXLogWithFacility();
    id v9 = 0;
  }

  return v9;
}

- (void)handleDeath
{
  unsigned __int8 v3 = [(_GAXAppRepresentation *)self delegate];
  if (!v3)
  {
    id v4 = GAXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2B77C();
    }
  }
  [v3 gaxAppDidGoInvalid:self];
  [(_GAXAppRepresentation *)self setAppClient:0];
}

- (BOOL)prepareForTransitionToWorkspaceAndRetrieveRestrictionsInformation:(id *)a3
{
  id v5 = [objc_alloc((Class)AXIPCMessage) initWithKey:11006 payload:0];
  id v12 = 0;
  [(_GAXAppRepresentation *)self _sendMessageToClient:v5 replyMessage:&v12 timeout:@"prepare client app for transition to workspace" description:0.0];
  id v6 = v12;

  id v7 = [v6 payload];
  objc_super v8 = [v7 objectForKey:@"GAXIPCPayloadKeyShouldAbortServerModeTransition"];
  unsigned int v9 = [v8 BOOLValue];

  if (a3)
  {
    if (v9) {
      v10 = 0;
    }
    else {
      v10 = v7;
    }
    *a3 = v10;
  }

  return v9;
}

- (id)restrictionIdentifiers
{
  id v3 = [objc_alloc((Class)AXIPCMessage) initWithKey:11004 payload:0];
  id v8 = 0;
  [(_GAXAppRepresentation *)self _sendMessageToClient:v3 replyMessage:&v8 timeout:@"get restriction identifiers" description:0.0];
  id v4 = v8;

  id v5 = [v4 payload];

  id v6 = [v5 objectForKey:@"GAXIPCPayloadKeyRestrictionIdentifiers"];

  return v6;
}

- (void)restrictionWithIdentifier:(id)a3 didChangeState:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    v11[0] = @"GAXIPCPayloadKeyRestrictionIdentifier";
    v11[1] = @"GAXIPCPayloadKeyRestrictionState";
    v12[0] = v6;
    id v8 = +[NSNumber numberWithInteger:a4];
    v12[1] = v8;
    unsigned int v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

    id v10 = [objc_alloc((Class)AXIPCMessage) initWithKey:11005 payload:v9];
    [(_GAXAppRepresentation *)self _sendMessageToClient:v10 replyMessage:0 timeout:@"restriction state did change" description:0.0];
  }
  else
  {
    _AXAssert();
  }
}

- (BOOL)_hasValidPID
{
  return (int)[(_GAXAppRepresentation *)self pid] > 0;
}

- (BOOL)_setupGAXClientConnection
{
  if (![(_GAXAppRepresentation *)self _hasValidPID])
  {
    id v10 = GAXLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2B984(self, v10);
    }

    id v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2B8F4();
    }
    goto LABEL_14;
  }
  if (![(_GAXAppRepresentation *)self isGAXClientLoaded])
  {
    id v11 = GAXLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_2B880();
    }

    id v3 = GAXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_2B7F0();
    }
LABEL_14:
    BOOL v9 = 0;
    goto LABEL_15;
  }
  id v3 = [objc_alloc((Class)AXIPCClient) initWithServiceName:@"com.apple.accessibility.gax.client"];
  [v3 setUsesPerPidLookup:1];
  [v3 setPid:[(_GAXAppRepresentation *)self pid]];
  id v4 = GAXLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(_GAXAppRepresentation *)self pid];
    id v6 = [(_GAXAppRepresentation *)self bundleIdentifier];
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = v5;
    __int16 v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Created app client for pid %i, identifier %@", (uint8_t *)&buf, 0x12u);
  }
  [v3 setShouldRegisterCallbackSourceOnMainRunloop:1];
  id v7 = [(_GAXAppRepresentation *)self bundleIdentifier];
  id v8 = +[NSString stringWithFormat:@"GAXApp-%@", v7];
  [v3 setClientIdentifier:v8];

  objc_initWeak(&buf, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_295A8;
  void v13[3] = &unk_49DA0;
  objc_copyWeak(&v14, &buf);
  [v3 setPortDeathHandler:v13];
  [(_GAXAppRepresentation *)self setAppClient:v3];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&buf);
  BOOL v9 = 1;
LABEL_15:

  return v9;
}

- (void)_sendMessageToClient:(id)a3 replyMessage:(id *)a4 timeout:(double)a5 description:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [(_GAXAppRepresentation *)self appClient];
  if (!v12)
  {
    if (![(_GAXAppRepresentation *)self _setupGAXClientConnection])
    {
      v19 = GAXLogCommon();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(_GAXAppRepresentation *)self bundleIdentifier];
        v21 = +[NSNumber numberWithInt:[(_GAXAppRepresentation *)self pid]];
        *(_DWORD *)id buf = 138543618;
        *(void *)v29 = v20;
        *(_WORD *)&v29[8] = 2114;
        *(void *)&v29[10] = v21;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Could not set up client GAX connection. bundle:%{public}@ pid:%{public}@", buf, 0x16u);
      }
      id v12 = 0;
      goto LABEL_22;
    }
    id v12 = [(_GAXAppRepresentation *)self appClient];
  }
  if ([v12 verifyConnectionExists])
  {
    if (a4)
    {
      int v13 = 0;
      if (a5 > 2.22044605e-16)
      {
        [v12 timeout];
        int v13 = v14;
        *(float *)&double v15 = a5;
        [v12 setTimeout:v15];
      }
      id v26 = 0;
      __int16 v16 = [v12 sendMessage:v10 withError:&v26];
      id v17 = v26;
      *a4 = v16;
      HIDWORD(v18) = 1018167296;
      if (a5 > 2.22044605e-16)
      {
        LODWORD(v18) = v13;
        [v12 setTimeout:v18];
      }
      if (!v17) {
        goto LABEL_21;
      }
    }
    else
    {
      id v27 = 0;
      uint64_t v22 = [v12 sendSimpleMessage:v10 withError:&v27];
      id v17 = v27;
      if (v22)
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    v23 = GAXLogCommon();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      unsigned int v24 = [(_GAXAppRepresentation *)self pid];
      v25 = [(_GAXAppRepresentation *)self bundleIdentifier];
      *(_DWORD *)id buf = 67109890;
      *(_DWORD *)v29 = v24;
      *(_WORD *)&v29[4] = 2112;
      *(void *)&v29[6] = v25;
      *(_WORD *)&v29[14] = 2114;
      *(void *)&v29[16] = v11;
      __int16 v30 = 2114;
      id v31 = v17;
      _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Could not send message to client with pid %i identifier %@: %{public}@ (%{public}@)", buf, 0x26u);
    }
    goto LABEL_21;
  }
  if (a4) {
    *a4 = 0;
  }
LABEL_22:
}

- (_GAXAppRepresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_GAXAppRepresentationDelegate *)WeakRetained;
}

- (unint64_t)relaunchAttempts
{
  return self->_relaunchAttempts;
}

- (void)setRelaunchAttempts:(unint64_t)a3
{
  self->_relaunchAttempts = a3;
}

- (BOOL)isGAXClientLoaded
{
  return self->_gaxClientLoaded;
}

- (void)setGaxClientLoaded:(BOOL)a3
{
  self->_gaxClientLoaded = a3;
}

- (BOOL)wasPlayingMedia
{
  return self->_wasPlayingMedia;
}

- (void)setWasPlayingMedia:(BOOL)a3
{
  self->_wasPlayingMedia = a3;
}

- (AXIPCClient)appClient
{
  return self->_appClient;
}

- (void)setAppClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClient, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end
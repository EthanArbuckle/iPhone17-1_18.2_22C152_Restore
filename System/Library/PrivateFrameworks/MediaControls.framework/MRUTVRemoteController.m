@interface MRUTVRemoteController
- (BOOL)showTVRemote;
- (BOOL)transportSupportsTVRemote;
- (MRUEndpointController)endpointController;
- (MRUTVRemoteController)initWithEndpointController:(id)a3;
- (MRUTVRemoteControllerDelegate)delegate;
- (id)_stateDumpObject;
- (id)airplayIdentifier;
- (id)mediaRemoteIdentifier;
- (int64_t)context;
- (int64_t)launchContext;
- (void)presentTVRemoteUsingApp:(BOOL)a3;
- (void)prewarmIfNeeded;
- (void)setContext:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)updateShowTVRemote;
@end

@implementation MRUTVRemoteController

- (MRUTVRemoteController)initWithEndpointController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUTVRemoteController;
  v6 = [(MRUTVRemoteController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointController, a3);
    [(MRUEndpointController *)v7->_endpointController addObserver:v7];
    [(MRUTVRemoteController *)v7 updateShowTVRemote];
  }

  return v7;
}

- (id)mediaRemoteIdentifier
{
  v2 = [(MRUEndpointController *)self->_endpointController route];
  if (([v2 isAppleTVRoute] & 1) != 0
    || [v2 containsDeviceWithSubtype:18])
  {
    v3 = objc_msgSend((id)objc_msgSend(v2, "endpoint"), "externalDevice");
    v4 = [v3 deviceInfo];
    id v5 = [v4 identifier];
    v6 = (void *)[v5 copy];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)airplayIdentifier
{
  v2 = [(MRUEndpointController *)self->_endpointController route];
  v3 = objc_msgSend((id)objc_msgSend(v2, "endpoint"), "outputDevices");
  v4 = [v3 firstObject];
  if (([v2 isAppleTVRoute] & 1) != 0
    || [v2 isTVRoute] && objc_msgSend(v4, "isAddedToHomeKit"))
  {
    uint64_t v5 = [v2 groupLeaderAirplayIdentifier];
LABEL_3:
    v6 = (void *)v5;
    goto LABEL_22;
  }
  if ([v2 isDeviceRoute]
    && [v2 isAirPlayingToDevice]
    && [v3 count] == 1)
  {
    int v7 = [v4 deviceSubtype] == 13 ? objc_msgSend(v4, "supportsRapport") : 0;
    int v8 = [v4 deviceSubtype] == 11
      || [v4 deviceSubtype] == 17
      || [v4 deviceSubtype] == 16
       ? [v4 isAddedToHomeKit]
       : 0;
    BOOL v9 = [v4 deviceSubtype] == 15 && objc_msgSend(v4, "clusterType") == 2;
    if (((v7 | v8) & 1) != 0 || v9)
    {
      uint64_t v5 = [v4 uid];
      goto LABEL_3;
    }
  }
  v6 = 0;
LABEL_22:

  return v6;
}

- (BOOL)transportSupportsTVRemote
{
  v2 = [(MRUEndpointController *)self->_endpointController route];
  v3 = objc_msgSend((id)objc_msgSend(v2, "endpoint"), "outputDevices");
  v4 = [v3 firstObject];
  BOOL v5 = [v4 transportType] == 1;

  return v5;
}

- (void)prewarmIfNeeded
{
  if (self->_showTVRemote)
  {
    id v2 = [MEMORY[0x1E4FAA430] sharedInstance];
    [v2 prewarm];
  }
}

- (void)presentTVRemoteUsingApp:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MRUTVRemoteController *)self mediaRemoteIdentifier];
  if (v5)
  {
    uint64_t v6 = 0;
    id v14 = (id)v5;
  }
  else
  {
    id v14 = [(MRUTVRemoteController *)self airplayIdentifier];
    uint64_t v6 = 1;
  }
  int v7 = [(MRUEndpointController *)self->_endpointController route];
  int v8 = [v7 isTVRoute];

  int64_t v9 = [(MRUTVRemoteController *)self launchContext];
  v10 = v14;
  if (v14)
  {
    if (v8) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    v12 = (void *)[objc_alloc(MEMORY[0x1E4FAA428]) initWithDeviceIdentifier:v14 identifierType:v6 deviceType:v11 launchContext:v9 launchMethod:v3];
    v13 = [MEMORY[0x1E4FAA430] sharedInstance];
    [v13 presentWithContext:v12];

    v10 = v14;
  }
}

- (void)updateShowTVRemote
{
  if ([(MRUTVRemoteController *)self transportSupportsTVRemote])
  {
    BOOL v3 = [(MRUTVRemoteController *)self mediaRemoteIdentifier];
    if (v3)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v5 = [(MRUTVRemoteController *)self airplayIdentifier];
      BOOL v4 = v5 != 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  if (self->_showTVRemote != v4)
  {
    self->_showTVRemote = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tvRemoteController:self didChangeShowTVRemote:v4];
  }
}

- (int64_t)launchContext
{
  unint64_t v2 = self->_context - 1;
  if (v2 > 6) {
    return 0;
  }
  else {
    return qword_1AE9640C8[v2];
  }
}

- (id)_stateDumpObject
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11[0] = @"airplayIdentifier";
  uint64_t v3 = [(MRUTVRemoteController *)self airplayIdentifier];
  BOOL v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"<NONE>";
  }
  v11[1] = @"mediaRemoteIdentifier";
  v12[0] = v5;
  uint64_t v6 = [(MRUTVRemoteController *)self mediaRemoteIdentifier];
  int v7 = (void *)v6;
  if (v6) {
    int v8 = (__CFString *)v6;
  }
  else {
    int v8 = @"<NONE>";
  }
  v12[1] = v8;
  int64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (MRUEndpointController)endpointController
{
  return self->_endpointController;
}

- (MRUTVRemoteControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUTVRemoteControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showTVRemote
{
  return self->_showTVRemote;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_endpointController, 0);
}

@end
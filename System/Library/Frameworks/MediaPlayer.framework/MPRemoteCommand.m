@interface MPRemoteCommand
- (BOOL)hasTargets;
- (BOOL)isEnabled;
- (BOOL)isForceDisabled;
- (BOOL)isSupportedAndEnabled;
- (BOOL)skipSerializedEventDelivery;
- (MPRemoteCommand)initWithMediaRemoteCommandType:(unsigned int)a3;
- (MPRemoteCommandCenter)commandCenter;
- (NSArray)disabledReasons;
- (NSArray)unsupportedReasons;
- (NSString)description;
- (double)timeout;
- (id)_mediaRemoteCommandInfo;
- (id)_mediaRemoteCommandInfoOptions;
- (id)_stateDumpObject;
- (id)addTargetWithHandler:(void *)handler;
- (id)commandInfoRepresentations;
- (id)newCommandEvent;
- (id)newCommandEventWithCommandType:(unsigned int)a3 options:(id)a4;
- (id)newCommandEventWithContentItemIdentifier:(id)a3;
- (id)newCommandEventWithPlaybackQueueOffset:(int64_t)a3;
- (id)newSeekCommandEventWithType:(unint64_t)a3;
- (int64_t)disabledReason;
- (unsigned)mediaRemoteCommandType;
- (void)addTarget:(id)a3 action:(SEL)a4 usingExtendedStatus:(BOOL)a5;
- (void)addTarget:(id)target action:(SEL)action;
- (void)invokeCommandWithEvent:(id)a3 completion:(id)a4;
- (void)notifyPropagatablePropertyChanged;
- (void)removeTarget:(id)target;
- (void)removeTarget:(id)target action:(SEL)action;
- (void)setCommandCenter:(id)a3;
- (void)setDisabledReason:(int64_t)a3;
- (void)setDisabledReasons:(id)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setForceDisabled:(BOOL)a3;
- (void)setSkipSerializedEventDelivery:(BOOL)a3;
- (void)setTimeout:(double)a3;
- (void)setUnsupportedReasons:(id)a3;
@end

@implementation MPRemoteCommand

- (void)setUnsupportedReasons:(id)a3
{
}

uint64_t __29__MPRemoteCommand_hasTargets__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)setCommandCenter:(id)a3
{
}

- (MPRemoteCommand)initWithMediaRemoteCommandType:(unsigned int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MPRemoteCommand;
  v4 = [(MPRemoteCommand *)&v11 init];
  if (v4)
  {
    id v5 = [NSString stringWithFormat:@"com.apple.MediaPlayer/%@", objc_opt_class()];
    dispatch_queue_t v6 = dispatch_queue_create((const char *)[v5 UTF8String], 0);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    handlers = v4->_handlers;
    v4->_handlers = (NSMutableDictionary *)v8;

    v4->_mediaRemoteCommandType = a3;
    v4->_enabled = 1;
    v4->_timeout = 9.0;
  }
  return v4;
}

- (void)setDisabledReasons:(id)a3
{
}

- (void)setEnabled:(BOOL)enabled
{
  if (self->_enabled != enabled)
  {
    self->_enabled = enabled;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)addTarget:(id)a3 action:(SEL)a4 usingExtendedStatus:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = NSString;
  id v10 = v8;
  objc_super v11 = objc_msgSend(v9, "stringWithFormat:", @"%p:%s", v10, sel_getName(a4));

  v12 = [v10 methodSignatureForSelector:a4];
  objc_initWeak(location, self);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke;
  v42[3] = &unk_1E57F74C0;
  objc_copyWeak(&v44, location);
  id v13 = v11;
  id v43 = v13;
  v14 = (void *)MEMORY[0x19971E0F0](v42);
  if (dyld_program_sdk_at_least()) {
    int v15 = 1;
  }
  else {
    int v15 = dyld_program_sdk_at_least();
  }
  objc_initWeak(&from, v10);
  id v16 = v12;
  int v17 = *(unsigned __int8 *)[v16 methodReturnType];
  if ([v16 numberOfArguments] == 4)
  {
    v18 = v38;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_3;
    v38[3] = &unk_1E57F7510;
    v19 = v39;
    objc_copyWeak(v39, &from);
    v38[4] = v14;
    BOOL v40 = v5;
LABEL_11:
    v18[6] = a4;
    v20 = (void *)MEMORY[0x19971E0F0](v18);

    objc_destroyWeak(v19);
LABEL_12:
    if (v20) {
      int v21 = 0;
    }
    else {
      int v21 = v15;
    }
    if (v21 == 1)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2 object:self file:@"MPRemoteCommand.m" lineNumber:135 description:@"Unsupported action method signature. Must return MPRemoteCommandHandlerStatus or take a completion handler as the second argument."];

      v20 = 0;
    }
    goto LABEL_17;
  }
  if (v17 == 113 || v17 == 105)
  {
    if (v5)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      [v27 handleFailureInMethod:a2 object:self file:@"MPRemoteCommand.m" lineNumber:110 description:@"Cannot use extended status with synchronous target/action"];
    }
    v18 = v36;
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_5;
    v36[3] = &unk_1E57F7538;
    v19 = v37;
    objc_copyWeak(v37, &from);
    v36[4] = v14;
    goto LABEL_11;
  }
  if (v15)
  {
    v20 = 0;
    goto LABEL_12;
  }
  if (v5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"MPRemoteCommand.m" lineNumber:122 description:@"Cannot use extended status with synchronous target/action"];
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_6;
  v33[3] = &unk_1E57F7538;
  objc_copyWeak(v35, &from);
  id v34 = v14;
  v35[1] = (id)a4;
  v20 = (void *)MEMORY[0x19971E0F0](v33);

  objc_destroyWeak(v35);
LABEL_17:
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_39;
  block[3] = &unk_1E57F8408;
  block[4] = self;
  id v23 = v13;
  id v31 = v23;
  id v24 = v20;
  id v32 = v24;
  dispatch_sync(serialQueue, block);
  v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v25 postNotificationName:@"MPRemoteCommandTargetsDidChangeNotification" object:self];

  objc_destroyWeak(&from);
  objc_destroyWeak(&v44);
  objc_destroyWeak(location);
}

- (unsigned)mediaRemoteCommandType
{
  return self->_mediaRemoteCommandType;
}

- (BOOL)hasTargets
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__MPRemoteCommand_hasTargets__block_invoke;
  v5[3] = &unk_1E57F9F20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (id)_mediaRemoteCommandInfoOptions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)commandInfoRepresentations
{
  v13[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MPRemoteCommand *)self _mediaRemoteCommandInfo];
  v4 = (void *)v3;
  unsigned int mediaRemoteCommandType = self->_mediaRemoteCommandType;
  if (mediaRemoteCommandType == 10)
  {
    uint64_t v6 = [(MPRemoteCommand *)self _mediaRemoteCommandInfo];
    [v6 setCommand:11];
    v12[0] = v4;
    v12[1] = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = v12;
    goto LABEL_5;
  }
  if (mediaRemoteCommandType == 8)
  {
    uint64_t v6 = [(MPRemoteCommand *)self _mediaRemoteCommandInfo];
    [v6 setCommand:9];
    v13[0] = v4;
    v13[1] = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v8 = v13;
LABEL_5:
    char v9 = [v7 arrayWithObjects:v8 count:2];

    goto LABEL_7;
  }
  uint64_t v11 = v3;
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
LABEL_7:

  return v9;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = (void *)MRMediaRemoteCopyCommandDescription();
  uint64_t mediaRemoteCommandType = self->_mediaRemoteCommandType;
  if ([(MPRemoteCommand *)self isForceDisabled])
  {
    v7 = @"NO [FORCED]";
  }
  else if (self->_enabled)
  {
    v7 = @"YES";
  }
  else
  {
    v7 = @"NO";
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_handlers allKeys];
  char v9 = objc_msgSend(v8, "msv_compactDescription");
  id v10 = [v3 stringWithFormat:@"<%@: %p type=%@ (%ld) enabled=%@ handlers=[%@]>", v4, self, v5, mediaRemoteCommandType, v7, v9];

  return (NSString *)v10;
}

- (id)_mediaRemoteCommandInfo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F76FF0]);
  [v3 setCommand:self->_mediaRemoteCommandType];
  if (self->_enabled) {
    uint64_t v4 = [(MPRemoteCommand *)self isForceDisabled] ^ 1;
  }
  else {
    uint64_t v4 = 0;
  }
  [v3 setEnabled:v4];
  uint64_t v5 = [(MPRemoteCommand *)self _mediaRemoteCommandInfoOptions];
  uint64_t v6 = (void *)v5;
  v7 = (void *)MEMORY[0x1E4F1CC08];
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  if ([v3 isEnabled])
  {
    char v9 = v8;
  }
  else
  {
    char v9 = (void *)[v8 mutableCopy];
    int64_t v10 = [(MPRemoteCommand *)self disabledReason];
    if ((unint64_t)(v10 - 1) <= 5)
    {
      uint64_t v11 = [NSNumber numberWithInt:v10];
      [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F77248]];
    }
  }
  [v3 setOptions:v9];

  return v3;
}

- (BOOL)isForceDisabled
{
  return self->_forceDisabled;
}

- (NSArray)unsupportedReasons
{
  return self->_unsupportedReasons;
}

- (NSArray)disabledReasons
{
  return self->_disabledReasons;
}

- (int64_t)disabledReason
{
  return self->_disabledReason;
}

- (void)addTarget:(id)target action:(SEL)action
{
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_39(void *a1)
{
  id v2 = (id)MEMORY[0x19971E0F0](a1[6]);
  [*(id *)(a1[4] + 16) setObject:v2 forKeyedSubscript:a1[5]];
}

- (void)setSkipSerializedEventDelivery:(BOOL)a3
{
  self->_skipSerializedEventDelivery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedReasons, 0);
  objc_storeStrong((id *)&self->_disabledReasons, 0);
  objc_destroyWeak((id *)&self->_commandCenter);
  objc_storeStrong((id *)&self->_handlers, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)notifyPropagatablePropertyChanged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandCenter);
  [WeakRetained remoteCommandDidMutatePropagatableProperty:self];
}

- (void)setDisabledReason:(int64_t)a3
{
  if (self->_disabledReason != a3)
  {
    self->_disabledReason = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)removeTarget:(id)target action:(SEL)action
{
  id v6 = target;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MPRemoteCommand_removeTarget_action___block_invoke;
  block[3] = &unk_1E57F9250;
  id v11 = v6;
  SEL v12 = action;
  block[4] = self;
  id v8 = v6;
  dispatch_sync(serialQueue, block);
  char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"MPRemoteCommandTargetsDidChangeNotification" object:self];
}

void __39__MPRemoteCommand_removeTarget_action___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = *(const char **)(a1 + 48);
  if (v2)
  {
    id v3 = NSString;
    id v4 = *(id *)(a1 + 40);
    objc_msgSend(v3, "stringWithFormat:", @"%p:%s", v4, sel_getName(v2));
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(*(void *)(a1 + 32) + 16) setObject:0 forKeyedSubscript:v13];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (([v10 isEqual:*(void *)(a1 + 40)] & 1) == 0)
          {
            id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%p", *(void *)(a1 + 40));
            int v12 = [v10 hasPrefix:v11];

            if (!v12) {
              continue;
            }
          }
          [*(id *)(*(void *)(a1 + 32) + 16) setObject:0 forKeyedSubscript:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)skipSerializedEventDelivery
{
  return self->_skipSerializedEventDelivery;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setForceDisabled:(BOOL)a3
{
  self->_forceDisabled = a3;
}

- (MPRemoteCommandCenter)commandCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandCenter);

  return (MPRemoteCommandCenter *)WeakRetained;
}

- (id)_stateDumpObject
{
  v13[5] = *MEMORY[0x1E4F143B8];
  v12[0] = @"enabled";
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[MPRemoteCommand isEnabled](self, "isEnabled"));
  v13[0] = v3;
  v12[1] = @"forceDisabled";
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[MPRemoteCommand isForceDisabled](self, "isForceDisabled"));
  v13[1] = v4;
  void v12[2] = @"hasTargets";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MPRemoteCommand hasTargets](self, "hasTargets"));
  v13[2] = v5;
  v12[3] = @"supported";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MPRemoteCommand isSupported](self, "isSupported"));
  void v13[3] = v6;
  v12[4] = @"options";
  uint64_t v7 = [(MPRemoteCommand *)self _mediaRemoteCommandInfoOptions];
  uint64_t v8 = (void *)v7;
  uint64_t v9 = MEMORY[0x1E4F1CC08];
  if (v7) {
    uint64_t v9 = v7;
  }
  v13[4] = v9;
  int64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  return v10;
}

- (id)newSeekCommandEventWithType:(unint64_t)a3
{
  unsigned int mediaRemoteCommandType = self->_mediaRemoteCommandType;
  if (mediaRemoteCommandType == 8) {
    unsigned int v4 = 9;
  }
  else {
    unsigned int v4 = self->_mediaRemoteCommandType;
  }
  if (mediaRemoteCommandType == 10) {
    unsigned int v5 = 11;
  }
  else {
    unsigned int v5 = v4;
  }
  if (a3 == 1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = mediaRemoteCommandType;
  }
  +[MPRemoteCommandEvent eventWithCommand:self mediaRemoteType:v6 options:MEMORY[0x1E4F1CC08]];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newCommandEventWithCommandType:(unsigned int)a3 options:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newCommandEventWithPlaybackQueueOffset:(int64_t)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = *MEMORY[0x1E4F776F0];
  unsigned int v4 = [NSNumber numberWithInteger:a3];
  v9[0] = v4;
  unsigned int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  id v6 = [(MPRemoteCommand *)self newCommandEventWithCommandType:self->_mediaRemoteCommandType options:v5];
  return v6;
}

- (id)newCommandEventWithContentItemIdentifier:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v8 = *MEMORY[0x1E4F77678];
    v9[0] = v4;
    unsigned int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    unsigned int v5 = 0;
  }
  id v6 = [(MPRemoteCommand *)self newCommandEventWithCommandType:self->_mediaRemoteCommandType options:v5];

  return v6;
}

- (id)newCommandEvent
{
  return [(MPRemoteCommand *)self newCommandEventWithCommandType:self->_mediaRemoteCommandType options:MEMORY[0x1E4F1CC08]];
}

- (void)invokeCommandWithEvent:(id)a3 completion:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__46027;
  v38 = __Block_byref_object_dispose__46028;
  id v39 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke;
  block[3] = &unk_1E57F9F20;
  block[4] = self;
  void block[5] = &v34;
  dispatch_sync(serialQueue, block);
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v11 = objc_msgSend(v10, "initWithCapacity:", objc_msgSend((id)v35[5], "count"));
  dispatch_group_t v12 = dispatch_group_create();
  id v13 = (void *)v35[5];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2;
  v27[3] = &unk_1E57F7650;
  long long v14 = v12;
  v28 = v14;
  id v15 = v7;
  id v29 = v15;
  v30 = self;
  id v16 = v11;
  id v31 = v16;
  SEL v32 = a2;
  [v13 enumerateKeysAndObjectsUsingBlock:v27];
  if (![(id)v35[5] count])
  {
    long long v17 = (void *)MEMORY[0x1E4F28C58];
    BOOL v40 = @"event";
    v41[0] = v15;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    uint64_t v19 = [v17 errorWithDomain:@"MPErrorDomain" code:5 userInfo:v18];
    v20 = +[MPRemoteCommandStatus statusWithCode:404 error:v19];
    [v16 addObject:v20];
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_86;
  v24[3] = &unk_1E57F9140;
  id v25 = v16;
  id v26 = v8;
  id v21 = v16;
  id v22 = v8;
  dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_INHERIT_QOS_CLASS, v24);
  dispatch_group_notify(v14, (dispatch_queue_t)self->_serialQueue, v23);

  _Block_object_dispose(&v34, 8);
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = *(NSObject **)(a1 + 32);
  id v7 = a3;
  dispatch_group_enter(v6);
  id v8 = objc_alloc(MEMORY[0x1E4F77968]);
  [*(id *)(a1 + 40) timeout];
  double v10 = v9;
  if (v9 == 0.0)
  {
    [*(id *)(a1 + 48) timeout];
    double v10 = v11;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_3;
  v29[3] = &unk_1E57F7600;
  id v30 = *(id *)(a1 + 40);
  id v31 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 48);
  id v32 = v12;
  uint64_t v33 = v14;
  uint64_t v34 = v13;
  id v15 = (void *)[v8 initWithTimeout:v29 interruptionHandler:v10];
  id v16 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v36 = v5;
    __int16 v37 = 2114;
    uint64_t v38 = v17;
    _os_log_impl(&dword_1952E8000, v16, OS_LOG_TYPE_DEFAULT, "RCC: invokeCommandWithEvent: handler=%{public}@ event=%{public}@", buf, 0x16u);
  }

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_83;
  v23[3] = &unk_1E57F7628;
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v19 = *(void **)(a1 + 56);
  v23[4] = *(void *)(a1 + 48);
  id v24 = v19;
  id v25 = v15;
  id v26 = *(id *)(a1 + 32);
  id v27 = v5;
  id v28 = *(id *)(a1 + 40);
  v20 = (void (*)(void *, uint64_t, void *))v7[2];
  id v21 = v5;
  id v22 = v15;
  v20(v7, v18, v23);
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_86(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if (a2 == 1)
    {
      uint64_t v3 = [*(id *)(a1 + 32) command];
      [v3 mediaRemoteCommandType];

      id v4 = NSString;
      id v5 = (void *)MRMediaRemoteCopyCommandDescription();
      uint64_t v6 = [v4 stringWithFormat:@"command=%@", v5];

      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      id v8 = (void *)MEMORY[0x1E4F77950];
      uint64_t v9 = *MEMORY[0x1E4F778C8];
      double v10 = [*(id *)(a1 + 32) description];
      id v44 = v10;
      double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      id v30 = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2_75;
      id v31 = &unk_1E57F9EA8;
      id v12 = v7;
      id v32 = v12;
      [v8 snapshotWithDomain:v9 type:@"Bug" subType:@"CommandHandlerNotCalledBug" context:v6 triggerThresholdValues:0 events:v11 completion:&v28];

      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:*(void *)(a1 + 64), *(void *)(a1 + 56), @"MPRemoteCommand.m", 281, @"Command handler completion deallocated without being called. event=%@", *(void *)(a1 + 32), v28, v29, v30, v31 object file lineNumber description];

      id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Command handler completion deallocated without being called -- assertion failed" userInfo:0];
      objc_exception_throw(v14);
    }
  }
  else
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_4;
    v40[3] = &unk_1E57F7588;
    id v41 = *(id *)(a1 + 32);
    id v42 = *(id *)(a1 + 40);
    id v43 = *(id *)(a1 + 48);
    id v15 = (void (**)(void, void))MEMORY[0x19971E0F0](v40);
    id v16 = [*(id *)(a1 + 32) command];
    uint64_t v17 = [v16 commandCenter];

    uint64_t v18 = [v17 delegate];
    if (objc_opt_respondsToSelector())
    {
      id v19 = objc_alloc(MEMORY[0x1E4F77968]);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_59;
      v36[3] = &unk_1E57F75B0;
      v20 = v15;
      uint64_t v22 = *(void *)(a1 + 56);
      uint64_t v21 = *(void *)(a1 + 64);
      id v38 = v20;
      uint64_t v39 = v21;
      v36[4] = v22;
      id v37 = *(id *)(a1 + 32);
      dispatch_block_t v23 = (void *)[v19 initWithTimeout:v36 interruptionHandler:1.0];
      id v24 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        uint64_t v46 = v25;
        _os_log_impl(&dword_1952E8000, v24, OS_LOG_TYPE_ERROR, "RCC: Command handler completion timeout. Calling delegate for status: event=%{public}@", buf, 0xCu);
      }

      uint64_t v26 = *(void *)(a1 + 32);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_63;
      v33[3] = &unk_1E57F75D8;
      id v34 = v23;
      v35 = v20;
      id v27 = v23;
      [v18 commandCenter:v17 didTimeoutCommandEvent:v26 statusHandler:v33];
    }
    else
    {
      v15[2](v15, 0);
    }
  }
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2_84;
  id v12 = &unk_1E57F9F98;
  id v13 = *(id *)(a1 + 40);
  id v5 = v3;
  id v14 = v5;
  dispatch_sync(v4, &v9);
  if (objc_msgSend(*(id *)(a1 + 48), "disarm", v9, v10, v11, v12)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
  uint64_t v6 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    _os_log_impl(&dword_1952E8000, v6, OS_LOG_TYPE_DEFAULT, "RCC: invokeCommandWithEvent: finished handler=%{public}@ event=%p", buf, 0x16u);
  }
}

uint64_t __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2_84(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_4(uint64_t a1, void *a2)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    v19[0] = @"commandID";
    id v5 = [*(id *)(a1 + 32) commandID];
    v19[1] = @"event";
    v20[0] = v5;
    v20[1] = *(void *)(a1 + 32);
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    uint64_t v7 = [v4 errorWithDomain:@"MPErrorDomain" code:7 userInfo:v6];
    id v3 = +[MPRemoteCommandStatus statusWithCode:555 error:v7];
  }
  uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v9;
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "RCC: Command handler completion timeout: event=%{public}@ status=%{public}@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) addObject:v3];
  uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = @"status";
  id v14 = v3;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v10 postNotificationName:@"MPRemoteCommandEventDidTimeout" object:v11 userInfo:v12];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_59(void *a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a1[7], a1[4], @"MPRemoteCommand.m", 258, @"Command center delegate status handler deallocated without being called. event=%@", a1[5] object file lineNumber description];
  }
  else if (!a2)
  {
    id v3 = *(void (**)(void))(a1[6] + 16);
    v3();
  }
}

void __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_63(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

intptr_t __53__MPRemoteCommand_invokeCommandWithEvent_completion___block_invoke_2_75(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)isSupportedAndEnabled
{
  BOOL v3 = [(MPRemoteCommand *)self isSupported];
  if (v3)
  {
    BOOL v3 = [(MPRemoteCommand *)self isEnabled];
    if (v3) {
      LOBYTE(v3) = ![(MPRemoteCommand *)self isForceDisabled];
    }
  }
  return v3;
}

- (id)addTargetWithHandler:(void *)handler
{
  id v4 = handler;
  id v5 = NSString;
  uint64_t v6 = (void *)MEMORY[0x19971E0F0]();
  uint64_t v7 = objc_msgSend(v5, "stringWithFormat:", @"%p", v6);

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MPRemoteCommand_addTargetWithHandler___block_invoke;
  block[3] = &unk_1E57F8408;
  block[4] = self;
  id v9 = v7;
  id v16 = v9;
  __int16 v17 = v4;
  id v10 = v4;
  dispatch_sync(serialQueue, block);
  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"MPRemoteCommandTargetsDidChangeNotification" object:self];

  id v12 = v17;
  id v13 = v9;

  return v13;
}

void __40__MPRemoteCommand_addTargetWithHandler___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__MPRemoteCommand_addTargetWithHandler___block_invoke_2;
  v3[3] = &unk_1E57F7560;
  id v4 = *(id *)(a1 + 48);
  id v2 = (void *)MEMORY[0x19971E0F0](v3);
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

void __40__MPRemoteCommand_addTargetWithHandler___block_invoke_2(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  uint64_t v7 = a3;
  id v8 = +[MPRemoteCommandStatus statusWithCode:v6(v5, a2)];
  ((void (**)(void, id))a3)[2](v7, v8);
}

- (void)removeTarget:(id)target
{
  if (target)
  {
    -[MPRemoteCommand removeTarget:action:](self, "removeTarget:action:");
  }
  else
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__MPRemoteCommand_removeTarget___block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"MPRemoteCommandTargetsDidChangeNotification" object:self];
  }
}

uint64_t __32__MPRemoteCommand_removeTarget___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained[1];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    id v12 = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_2;
    id v13 = &unk_1E57F9F98;
    id v14 = WeakRetained;
    id v15 = *(id *)(a1 + 32);
    dispatch_sync(v7, &v10);
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"MPErrorDomain", 6, @"Target was not available for command.", v10, v11, v12, v13);
  id v9 = +[MPRemoteCommandStatus statusWithCode:200 error:v8];
  v4[2](v4, v9);
}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    int v9 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v10 = (void (*)(void *, uint64_t, id, id))[WeakRetained methodForSelector:*(void *)(a1 + 48)];
    uint64_t v11 = *(void *)(a1 + 48);
    if (v9)
    {
      v10(v8, v11, v5, v6);
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_4;
      v12[3] = &unk_1E57F74E8;
      id v13 = v6;
      v10(v8, v11, v5, v12);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = +[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", ((uint64_t (*)(id, void, id))[WeakRetained methodForSelector:*(void *)(a1 + 48)])(WeakRetained, *(void *)(a1 + 48), v9));
    v5[2](v5, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_ERROR, "Unsupported action method signature. Must return MPRemoteCommandHandlerStatus or take a completion handler as the second argument. ** This will break in a future release. **", v10, 2u);
    }

    ((void (*)(id, void, id))[WeakRetained methodForSelector:*(void *)(a1 + 48)])(WeakRetained, *(void *)(a1 + 48), v5);
    id v9 = +[MPRemoteCommandStatus successStatus];
    v6[2](v6, v9);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[MPRemoteCommandStatus statusWithCode:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __56__MPRemoteCommand_addTarget_action_usingExtendedStatus___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

@end
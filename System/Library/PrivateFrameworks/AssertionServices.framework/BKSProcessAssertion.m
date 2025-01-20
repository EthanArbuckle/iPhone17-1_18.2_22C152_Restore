@interface BKSProcessAssertion
+ (id)NameForReason:(unsigned int)a3;
- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6;
- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7;
- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7 acquire:(BOOL)a8;
- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 pid:(int)a4 flags:(unsigned int)a5 reason:(unsigned int)a6 name:(id)a7 withHandler:(id)a8 acquire:(BOOL)a9;
- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6;
- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7;
- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7 acquire:(BOOL)a8;
- (BOOL)acquire;
- (unint64_t)_legacyFlagsForFlags:(unsigned int)a3;
- (unint64_t)_legacyReasonForReason:(unsigned int)a3;
- (unsigned)flags;
- (unsigned)reason;
- (void)acquire;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setFlags:(unsigned int)a3;
@end

@implementation BKSProcessAssertion

- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  return [(BKSProcessAssertion *)self initWithPID:*(void *)&a3 flags:*(void *)&a4 reason:*(void *)&a5 name:a6 withHandler:0 acquire:0];
}

- (void)dealloc
{
  mediaPlaybackHackAssertion = self->_mediaPlaybackHackAssertion;
  if (mediaPlaybackHackAssertion)
  {
    [(RBSAssertion *)mediaPlaybackHackAssertion invalidate];
    v4 = self->_mediaPlaybackHackAssertion;
    self->_mediaPlaybackHackAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)BKSProcessAssertion;
  [(BKSAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  mediaPlaybackHackAssertion = self->_mediaPlaybackHackAssertion;
  if (mediaPlaybackHackAssertion)
  {
    [(RBSAssertion *)mediaPlaybackHackAssertion invalidate];
    v4 = self->_mediaPlaybackHackAssertion;
    self->_mediaPlaybackHackAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)BKSProcessAssertion;
  [(BKSAssertion *)&v5 invalidate];
}

- (BOOL)acquire
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if (self->_reason != 1) {
    goto LABEL_12;
  }
  v3 = [(BKSAssertion *)self _target];
  v4 = [v3 processIdentity];
  if (!v4)
  {
    objc_super v5 = (void *)MEMORY[0x1E4F963E8];
    v6 = [MEMORY[0x1E4F96430] predicateMatchingTarget:v3];
    v7 = [v5 handleForPredicate:v6 error:0];

    v4 = [v7 identity];
  }
  if (![v4 isExtension])
  {
LABEL_11:

LABEL_12:
    v21.receiver = self;
    v21.super_class = (Class)BKSProcessAssertion;
    return [(BKSAssertion *)&v21 acquire];
  }
  v8 = [v4 hostIdentifier];
  if (!v8)
  {
    v11 = rbs_general_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v4;
      _os_log_impl(&dword_1B50B5000, v11, OS_LOG_TYPE_DEFAULT, "MediaPlayback hack extensions %{public}@ doesn't have host", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v9 = [MEMORY[0x1E4F963A8] attributeWithReason:1 flags:3];
  v25[0] = v9;
  v10 = [MEMORY[0x1E4F96308] attributeWithCompletionPolicy:1];
  v25[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

  id v12 = objc_alloc(MEMORY[0x1E4F96318]);
  uint64_t v13 = [MEMORY[0x1E4F96478] targetWithProcessIdentifier:v8];
  v14 = (RBSAssertion *)[v12 initWithExplanation:@"MediaPlackback hack assertion" target:v13 attributes:v11];
  mediaPlaybackHackAssertion = self->_mediaPlaybackHackAssertion;
  self->_mediaPlaybackHackAssertion = v14;

  v16 = self->_mediaPlaybackHackAssertion;
  id v22 = 0;
  LOBYTE(v13) = [(RBSAssertion *)v16 acquireWithError:&v22];
  id v17 = v22;
  v18 = v17;
  if (v13)
  {

LABEL_10:
    goto LABEL_11;
  }
  v20 = rbs_general_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[BKSProcessAssertion acquire]();
  }

  return 0;
}

uint64_t __90__BKSProcessAssertion_initWithBundleIdentifier_pid_flags_reason_name_withHandler_acquire___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7 acquire:(BOOL)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  id v14 = a6;
  if ((int)v12 <= 0)
  {
    v16 = rbs_shim_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BKSProcessAssertion initWithPID:flags:reason:name:withHandler:acquire:]();
    }

    v15 = 0;
  }
  else
  {
    LOBYTE(v18) = a8;
    self = [(BKSProcessAssertion *)self initWithBundleIdentifier:0 pid:v12 flags:v11 reason:v10 name:v14 withHandler:a7 acquire:v18];
    v15 = self;
  }

  return v15;
}

- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 pid:(int)a4 flags:(unsigned int)a5 reason:(unsigned int)a6 name:(id)a7 withHandler:(id)a8 acquire:(BOOL)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  uint64_t v13 = *(void *)&a4;
  v36[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  if (!v15 && (int)v13 <= 0)
  {
    uint64_t v18 = rbs_shim_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[BKSProcessAssertion initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:]();
    }
  }
  if ((int)v11 > 10000)
  {
    if ((v11 - 50000) >= 4 && v11 != 10003 && v11 != 10001) {
      goto LABEL_17;
    }
  }
  else if (v11 > 0x18 || ((1 << v11) & 0x142C840) == 0)
  {
LABEL_17:
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __90__BKSProcessAssertion_initWithBundleIdentifier_pid_flags_reason_name_withHandler_acquire___block_invoke;
    v34[3] = &unk_1E60C6558;
    id v22 = v17;
    v35 = v22;
    v23 = (void *)MEMORY[0x1BA997230](v34);
    v33.receiver = self;
    v33.super_class = (Class)BKSProcessAssertion;
    v24 = [(BKSAssertion *)&v33 _initWithName:v16 handler:v23];
    v25 = v24;
    if (v24)
    {
      BOOL v26 = a9;
      v24[17] = v12;
      v24[16] = v11;
      if (v15)
      {
        v27 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:v15];
        v28 = [MEMORY[0x1E4F96478] targetWithProcessIdentity:v27];

        BOOL v26 = a9;
      }
      else if ((int)v13 < 1)
      {
        v28 = 0;
      }
      else
      {
        v28 = [MEMORY[0x1E4F96478] targetWithPid:v13];
      }
      [v25 _setTarget:v28];
      uint64_t v29 = [v25 _legacyFlagsForFlags:v12];
      uint64_t v30 = [v25 _legacyReasonForReason:v11];
      v31 = [MEMORY[0x1E4F963A8] attributeWithReason:v30 flags:v29];
      v36[0] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];

      [v25 _setAttributes:v32];
      if (v26)
      {
        if (v22) {
          [v25 _acquireAsynchronously];
        }
        else {
          [v25 acquire];
        }
      }
    }
    self = v25;

    v19 = v35;
    v20 = self;
    goto LABEL_16;
  }
  v19 = rbs_shim_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    -[BKSProcessAssertion initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:]((uint64_t)v16, v11, v19);
  }
  v20 = 0;
LABEL_16:

  return v20;
}

- (unint64_t)_legacyReasonForReason:(unsigned int)a3
{
  unint64_t result = 0;
  switch(a3)
  {
    case 1u:
      unint64_t result = 1;
      break;
    case 2u:
      unint64_t result = 2;
      break;
    case 3u:
      unint64_t result = 3;
      break;
    case 4u:
      unint64_t result = 4;
      break;
    case 5u:
      unint64_t result = 5;
      break;
    case 6u:
    case 0xBu:
    case 0xEu:
    case 0xFu:
    case 0x11u:
    case 0x16u:
      return result;
    case 7u:
      unint64_t result = 7;
      break;
    case 8u:
      unint64_t result = 8;
      break;
    case 9u:
      unint64_t result = 9;
      break;
    case 0xAu:
      unint64_t result = 10;
      break;
    case 0xCu:
      unint64_t result = 12;
      break;
    case 0xDu:
      unint64_t result = 13;
      break;
    case 0x10u:
      unint64_t result = 16;
      break;
    case 0x12u:
      unint64_t result = 18;
      break;
    case 0x13u:
      unint64_t result = 19;
      break;
    case 0x14u:
      unint64_t result = 20;
      break;
    case 0x15u:
      unint64_t result = 21;
      break;
    case 0x17u:
      unint64_t result = 23;
      break;
    default:
      switch(a3)
      {
        case 0x2710u:
          unint64_t result = 10000;
          break;
        case 0x2711u:
        case 0x2713u:
          return result;
        case 0x2712u:
          unint64_t result = 10002;
          break;
        case 0x2714u:
          unint64_t result = 10004;
          break;
        case 0x2715u:
          unint64_t result = 10005;
          break;
        case 0x2716u:
          unint64_t result = 10006;
          break;
        case 0x2717u:
          unint64_t result = 10007;
          break;
        case 0x2718u:
          unint64_t result = 10008;
          break;
        default:
          if (a3 == 50004) {
            unint64_t result = 50004;
          }
          else {
            unint64_t result = 0;
          }
          break;
      }
      break;
  }
  return result;
}

- (unint64_t)_legacyFlagsForFlags:(unsigned int)a3
{
  return a3 & 0x3F;
}

- (void).cxx_destruct
{
}

- (BKSProcessAssertion)initWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7
{
  return [(BKSProcessAssertion *)self initWithPID:*(void *)&a3 flags:*(void *)&a4 reason:*(void *)&a5 name:a6 withHandler:a7 acquire:1];
}

+ (id)NameForReason:(unsigned int)a3
{
  if ((int)a3 > 9999)
  {
    if ((int)a3 > 50003)
    {
      switch(a3)
      {
        case 0xC354u:
          return @"finishTaskAfterWatchConnectivity";
        case 0xEA60u:
          return @"domain";
        case 0xEA61u:
          return @"custom";
        default:
          return @"Unknown";
      }
    }
    else
    {
      switch(a3)
      {
        case 0x2710u:
          id result = @"activation";
          break;
        case 0x2712u:
          id result = @"transientWakeup";
          break;
        case 0x2714u:
          id result = @"finishTaskUnbounded";
          break;
        case 0x2715u:
          id result = @"continuous";
          break;
        case 0x2716u:
          id result = @"backgroundContentFetching";
          break;
        case 0x2717u:
          id result = @"notificationAction";
          break;
        case 0x2718u:
          id result = @"PIP";
          break;
        default:
          return @"Unknown";
      }
    }
  }
  else
  {
    id result = @"none";
    switch(a3)
    {
      case 0u:
        return result;
      case 1u:
        id result = @"audio";
        break;
      case 2u:
        id result = @"location";
        break;
      case 3u:
        id result = @"external-accessory";
        break;
      case 4u:
        id result = @"finishTask";
        break;
      case 5u:
        id result = @"bluetooth";
        break;
      case 7u:
        id result = @"backgroundUI";
        break;
      case 8u:
        id result = @"interAppAudioStreaming";
        break;
      case 9u:
        id result = @"viewServices";
        break;
      case 0xAu:
        id result = @"newsstandDownload";
        break;
      case 0xCu:
        id result = @"voIP";
        break;
      case 0xDu:
        id result = @"extension";
        break;
      case 0x10u:
        id result = @"WatchConnectivity";
        break;
      case 0x12u:
        id result = @"complicationUpdate";
        break;
      case 0x13u:
        id result = @"workoutProcessing";
        break;
      case 0x14u:
        id result = @"complicationPushUpdate";
        break;
      case 0x15u:
        id result = @"backgroundLocationProcessing";
        break;
      case 0x17u:
        id result = @"audioRecording";
        break;
      default:
        return @"Unknown";
    }
  }
  return result;
}

- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7 acquire:(BOOL)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  id v14 = a6;
  if (a3)
  {
    LOBYTE(v18) = a8;
    self = [(BKSProcessAssertion *)self initWithBundleIdentifier:a3 pid:0xFFFFFFFFLL flags:v11 reason:v10 name:v14 withHandler:a7 acquire:v18];
    id v15 = self;
  }
  else
  {
    id v16 = rbs_shim_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BKSProcessAssertion initWithBundleIdentifier:flags:reason:name:withHandler:acquire:]();
    }

    id v15 = 0;
  }

  return v15;
}

- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6 withHandler:(id)a7
{
  return [(BKSProcessAssertion *)self initWithBundleIdentifier:a3 flags:*(void *)&a4 reason:*(void *)&a5 name:a6 withHandler:a7 acquire:1];
}

- (BKSProcessAssertion)initWithBundleIdentifier:(id)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  return [(BKSProcessAssertion *)self initWithBundleIdentifier:a3 flags:*(void *)&a4 reason:*(void *)&a5 name:a6 withHandler:0 acquire:0];
}

- (unsigned)flags
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__BKSProcessAssertion_flags__block_invoke;
  v4[3] = &unk_1E60C6580;
  v4[4] = self;
  v4[5] = &v5;
  [(BKSAssertion *)self _lock:v4];
  unsigned int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __28__BKSProcessAssertion_flags__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 68);
  return result;
}

- (void)setFlags:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__BKSProcessAssertion_setFlags___block_invoke;
  v3[3] = &unk_1E60C65A8;
  v3[4] = self;
  unsigned int v4 = a3;
  [(BKSAssertion *)self _lock:v3];
}

uint64_t __32__BKSProcessAssertion_setFlags___block_invoke(uint64_t result)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 68) != v2)
  {
    uint64_t v3 = result;
    *(_DWORD *)(v1 + 68) = v2;
    unsigned int v4 = *(unsigned int **)(result + 32);
    uint64_t v5 = [MEMORY[0x1E4F963A8] attributeWithReason:v4[16] flags:v4[17]];
    v7[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    objc_msgSend(v4, "_lock_setAttributes:", v6);

    return objc_msgSend(*(id *)(v3 + 32), "_lock_reaquireAssertion");
  }
  return result;
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  mediaPlaybackHackAssertion = self->_mediaPlaybackHackAssertion;
  if (mediaPlaybackHackAssertion)
  {
    [(RBSAssertion *)mediaPlaybackHackAssertion invalidate];
    v9 = self->_mediaPlaybackHackAssertion;
    self->_mediaPlaybackHackAssertion = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)BKSProcessAssertion;
  [(BKSAssertion *)&v10 assertion:v6 didInvalidateWithError:v7];
}

- (unsigned)reason
{
  return self->_reason;
}

- (void)initWithBundleIdentifier:(NSObject *)a3 pid:flags:reason:name:withHandler:acquire:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4 = a2;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = +[BKSProcessAssertion NameForReason:a2];
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  objc_super v10 = v6;
  __int16 v11 = 1024;
  int v12 = v4;
  _os_log_fault_impl(&dword_1B50B5000, a3, OS_LOG_TYPE_FAULT, "BKSProcessAssertion %{public}@ created with no longer supported reason %{public}@ (%d)", (uint8_t *)&v7, 0x1Cu);
}

- (void)initWithBundleIdentifier:pid:flags:reason:name:withHandler:acquire:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B50B5000, v0, v1, "BKSProcessAssertion \"%{public}@\" created with no identifier or PID.", v2, v3, v4, v5, v6);
}

- (void)initWithBundleIdentifier:flags:reason:name:withHandler:acquire:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B50B5000, v0, v1, "BKSProcessAssertion \"%{public}@\" initialized with nil bundleIdentifier", v2, v3, v4, v5, v6);
}

- (void)initWithPID:flags:reason:name:withHandler:acquire:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B50B5000, v0, v1, "BKSProcessAssertion \"%{public}@\" initialized with invalid pid", v2, v3, v4, v5, v6);
}

- (void)acquire
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B50B5000, v0, v1, "MediaPlayback hack assertion failed to acquire with error %@", v2, v3, v4, v5, v6);
}

@end
@interface FSChangeSubscription
- (BOOL)activateWithError:(id *)a3;
- (BOOL)didProcessBarrierEventUUID:(id)a3;
- (BOOL)ignoreOwnEvents;
- (BOOL)isActivated;
- (FSChangeSubscription)initWithPath:(id)a3 fd:(int)a4 reader:(id)a5 sinceEventID:(unint64_t)a6 streamUUID:(id)a7 ignoreOwnEvents:(BOOL)a8 delegate:(id)a9 purpose:(id)a10;
- (FSChangeSubscriptionDelegate)delegate;
- (NSString)root;
- (NSString)rootParent;
- (NSUUID)eventStreamUUID;
- (id)description;
- (id)waitableBarrier;
- (int)rootfd;
- (unint64_t)lastDeliveredEventID;
- (unint64_t)rootFileID;
- (unint64_t)state;
- (void)didProcessEventID:(unint64_t)a3;
- (void)dispose;
- (void)setDelegate:(id)a3;
- (void)setEventStreamUUID:(id)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setLastDeliveredEventID:(unint64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)waitableBarrier;
@end

@implementation FSChangeSubscription

- (FSChangeSubscription)initWithPath:(id)a3 fd:(int)a4 reader:(id)a5 sinceEventID:(unint64_t)a6 streamUUID:(id)a7 ignoreOwnEvents:(BOOL)a8 delegate:(id)a9 purpose:(id)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  v25.receiver = self;
  v25.super_class = (Class)FSChangeSubscription;
  v20 = [(FSChangeSubscription *)&v25 init];
  if (v20)
  {
    uint64_t v21 = objc_msgSend(v15, "fp_realpath");
    root = v20->_root;
    v20->_root = (NSString *)v21;

    v20->_rootfd = a4;
    objc_storeWeak((id *)&v20->_delegate, v18);
    v20->_lastDeliveredEventID = a6;
    objc_storeStrong((id *)&v20->_eventStreamUUID, a7);
    v20->_state = 1;
    objc_storeWeak((id *)&v20->_weakReader, v16);
    v20->_ignoreOwnEvents = a8;
    objc_storeStrong((id *)&v20->_purpose, a10);
  }

  return v20;
}

- (BOOL)activateWithError:(id *)a3
{
  if (self->_state == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_weakReader);
    if (WeakRetained)
    {
      int rootfd = self->_rootfd;
      if ((rootfd & 0x80000000) == 0
        || (self->_ownRootFD = 1,
            int rootfd = open([(NSString *)self->_root fileSystemRepresentation], 1048836),
            self->_int rootfd = rootfd,
            (rootfd & 0x80000000) == 0))
      {
        memset(&v13, 0, sizeof(v13));
        if ((fstat(rootfd, &v13) & 0x80000000) == 0 && (v13.st_mode & 0xF000) == 0x4000)
        {
          self->_rootFileID = v13.st_ino;
          if ([WeakRetained activateSubscription:self error:a3])
          {
            v7 = self;
            objc_sync_enter(v7);
            self->_state = 2;
            objc_sync_exit(v7);

            BOOL v8 = 1;
LABEL_17:

            return v8;
          }
LABEL_16:
          BOOL v8 = 0;
          goto LABEL_17;
        }
      }
      if (!a3) {
        goto LABEL_16;
      }
      v9 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = *__error();
      v11 = v9;
    }
    else
    {
      if (!a3) {
        goto LABEL_16;
      }
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v10 = 22;
    }
    objc_msgSend(v11, "fp_errorWithPOSIXCode:", v10);
    BOOL v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (!a3) {
    return 0;
  }
  objc_msgSend(MEMORY[0x263F087E8], "fp_errorWithPOSIXCode:", 35);
  BOOL v8 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (id)description
{
  if (self->_state == 2) {
    v2 = @"<subscription %@: observing>";
  }
  else {
    v2 = @"<subscription %@: (inactive)>";
  }
  v3 = objc_msgSend(NSString, "stringWithFormat:", v2, self->_purpose);

  return v3;
}

- (NSString)rootParent
{
  return [(NSString *)self->_root stringByDeletingLastPathComponent];
}

- (id)waitableBarrier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakReader);
  v4 = WeakRetained;
  if (WeakRetained
    && ([WeakRetained barrierFolderURL],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    v7 = self;
    objc_sync_enter(v7);
    barrierGroup = v7->_barrierGroup;
    if (!barrierGroup)
    {
      dispatch_group_t v9 = dispatch_group_create();
      uint64_t v10 = v7->_barrierGroup;
      v7->_barrierGroup = (OS_dispatch_group *)v9;

      dispatch_group_enter((dispatch_group_t)v7->_barrierGroup);
    }
    objc_storeStrong((id *)&v7->_notifyStreamUUID, v6);
    v11 = v7->_barrierGroup;
    objc_sync_exit(v7);

    v12 = NSString;
    stat v13 = [v6 UUIDString];
    v14 = [v12 stringWithFormat:@".rendez-vous.%@.nosync", v13];

    id v15 = [v4 barrierFolderURL];
    id v16 = [v15 URLByAppendingPathComponent:v14];

    id v17 = v16;
    uint64_t v18 = [v17 fileSystemRepresentation];
    uint64_t v28 = MEMORY[0x263EF8330];
    uint64_t v29 = 3221225472;
    v30 = __39__FSChangeSubscription_waitableBarrier__block_invoke;
    v31 = &__block_descriptor_40_e8_i12__0i8l;
    uint64_t v32 = v18;
    fpfs_openat();
    id v19 = [v4 delegationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__FSChangeSubscription_waitableBarrier__block_invoke_2;
    block[3] = &unk_2653070B0;
    id v20 = v17;
    id v27 = v20;
    dispatch_group_notify(v11, v19, block);

    uint64_t v21 = fp_current_or_default_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
    if (barrierGroup)
    {
      if (v22) {
        [(FSChangeSubscription *)v20 waitableBarrier];
      }
    }
    else if (v22)
    {
      [(FSChangeSubscription *)v20 waitableBarrier];
    }

    v24 = v27;
    v23 = v11;
  }
  else
  {
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(FSChangeSubscription *)(uint64_t)v4 waitableBarrier];
    }
    v23 = 0;
  }

  return v23;
}

uint64_t __39__FSChangeSubscription_waitableBarrier__block_invoke(uint64_t a1)
{
  return unlinkat(-2, *(const char **)(a1 + 32), 0);
}

uint64_t __39__FSChangeSubscription_waitableBarrier__block_invoke_2(uint64_t a1)
{
  v1 = (const char *)[*(id *)(a1 + 32) fileSystemRepresentation];

  return unlink(v1);
}

- (void)didProcessEventID:(unint64_t)a3
{
  if (a3) {
    self->_lastDeliveredEventID = a3;
  }
}

- (BOOL)didProcessBarrierEventUUID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  notifyStreamUUID = v5->_notifyStreamUUID;
  if (!notifyStreamUUID) {
    goto LABEL_8;
  }
  if (v4)
  {
    if ([(NSUUID *)notifyStreamUUID isEqual:v4])
    {
      notifyStreamUUID = v5->_notifyStreamUUID;
      goto LABEL_5;
    }
LABEL_8:
    objc_sync_exit(v5);

    BOOL v11 = 0;
    goto LABEL_9;
  }
LABEL_5:
  v7 = notifyStreamUUID;
  dispatch_group_leave((dispatch_group_t)v5->_barrierGroup);
  barrierGroup = v5->_barrierGroup;
  v5->_barrierGroup = 0;

  dispatch_group_t v9 = v5->_notifyStreamUUID;
  v5->_notifyStreamUUID = 0;

  objc_sync_exit(v5);
  uint64_t v10 = fp_current_or_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[FSChangeSubscription didProcessBarrierEventUUID:]((uint64_t)v7, v10);
  }

  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (void)dispose
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_state = 4;
  objc_sync_exit(v2);

  id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
  [WeakRetained subscriptionHandleTermination:v2];

  id v4 = objc_loadWeakRetained((id *)&v2->_weakReader);
  [v4 disableSubscription:v2];

  obj = v2;
  objc_sync_enter(obj);
  if (obj->_ownRootFD)
  {
    close(obj->_rootfd);
    obj->_int rootfd = -1;
  }
  objc_storeWeak((id *)&v2->_delegate, 0);
  objc_storeWeak((id *)&v2->_weakReader, 0);
  objc_sync_exit(obj);
}

- (NSString)root
{
  return self->_root;
}

- (int)rootfd
{
  return self->_rootfd;
}

- (unint64_t)rootFileID
{
  return self->_rootFileID;
}

- (FSChangeSubscriptionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FSChangeSubscriptionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)lastDeliveredEventID
{
  return self->_lastDeliveredEventID;
}

- (void)setLastDeliveredEventID:(unint64_t)a3
{
  self->_lastDeliveredEventID = a3;
}

- (NSUUID)eventStreamUUID
{
  return self->_eventStreamUUID;
}

- (void)setEventStreamUUID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (BOOL)ignoreOwnEvents
{
  return self->_ignoreOwnEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStreamUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_destroyWeak((id *)&self->_weakReader);
  objc_storeStrong((id *)&self->_notifyStreamUUID, 0);

  objc_storeStrong((id *)&self->_barrierGroup, 0);
}

- (void)waitableBarrier
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(a1, "fp_shortDescription");
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_24D3D0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] 🚧  updating existing barrier to new rendez-vous %@", (uint8_t *)&v4, 0xCu);
}

- (void)didProcessBarrierEventUUID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_24D3D0000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] 🚧  handle event on barrier %@", (uint8_t *)&v2, 0xCu);
}

@end
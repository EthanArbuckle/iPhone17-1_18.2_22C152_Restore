@interface _GEOURLManifestListener
+ (id)sharedListener;
- (_GEOURLManifestListener)init;
- (void)_finish:(BOOL)a3;
- (void)waitForManifestWithCallback:(id)a3;
@end

@implementation _GEOURLManifestListener

- (void)waitForManifestWithCallback:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = [(NSMutableArray *)self->_handlers count];
  [(NSMutableArray *)self->_handlers addObject:v4];
  os_unfair_lock_unlock(&self->_lock);
  if (v6) {
    goto LABEL_11;
  }
  v7 = +[GEONotificationPreferenceManager sharedManager];
  int v8 = [v7 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest"];

  if (v8)
  {
    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"GEOPPTTest_ManifestBEGIN" object:0];
  }
  v10 = +[GEOResourceManifestManager modernManager];
  int v11 = [v10 hasActiveTileGroup];

  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = v11 ^ 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke;
  block[3] = &unk_1E53DB3C8;
  block[4] = &v22;
  if (waitForManifestWithCallback__once != -1)
  {
    dispatch_once(&waitForManifestWithCallback__once, block);
    if (!v11) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v11) {
LABEL_7:
  }
    [(_GEOURLManifestListener *)self _finish:1];
LABEL_8:
  if (*((unsigned char *)v23 + 24))
  {
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 0;
    v12 = +[GEOResourceManifestManager modernManager];
    [v12 openServerConnection];

    v13 = +[GEOResourceManifestManager modernManager];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55___GEOURLManifestListener_waitForManifestWithCallback___block_invoke_2;
    v18[3] = &unk_1E53DFE48;
    v18[4] = self;
    v18[5] = v19;
    [v13 updateManifest:v18];

    id v14 = MEMORY[0x1E4F14428];
    v15 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue();

    os_unfair_lock_lock_with_options();
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v15;
    v17 = v15;

    os_unfair_lock_unlock(p_lock);
    dispatch_activate(v17);

    _Block_object_dispose(v19, 8);
  }
  _Block_object_dispose(&v22, 8);
LABEL_11:
}

- (void)_finish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = self->_timeoutTimer;
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = 0;

  int v8 = (void *)[(NSMutableArray *)self->_handlers copy];
  [(NSMutableArray *)self->_handlers removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  if (v6) {
    dispatch_source_cancel((dispatch_source_t)v6);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v13++), "performHandler:", v3, (void)v17);
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v14 = +[GEONotificationPreferenceManager sharedManager];
  int v15 = [v14 isEnabledForSubTestWithName:@"GEOPPTTest_Manifest"];

  if (v15)
  {
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 postNotificationName:@"GEOPPTTest_ManifestEND" object:0];
  }
}

+ (id)sharedListener
{
  if (_MergedGlobals_303 != -1) {
    dispatch_once(&_MergedGlobals_303, &__block_literal_global_130);
  }
  v2 = (void *)qword_1EB2A0300;

  return v2;
}

- (_GEOURLManifestListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)_GEOURLManifestListener;
  v2 = [(_GEOURLManifestListener *)&v7 init];
  if (v2)
  {
    BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    handlers = v2->_handlers;
    v2->_handlers = v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);

  objc_storeStrong((id *)&self->_handlers, 0);
}

@end
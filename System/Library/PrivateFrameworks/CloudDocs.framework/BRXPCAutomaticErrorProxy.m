@interface BRXPCAutomaticErrorProxy
+ (BOOL)sanitizeErrors;
+ (void)decrementConnectionRefCount:(id)a3;
+ (void)incrementConnectionRefCount:(id)a3;
- (BRXPCAutomaticErrorProxy)initWithConnection:(id)a3 service:(id)a4 interface:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation BRXPCAutomaticErrorProxy

- (BRXPCAutomaticErrorProxy)initWithConnection:(id)a3 service:(id)a4 interface:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v9 setRemoteObjectInterface:v11];
  v12 = [v11 protocol];

  v13 = [v10 name];
  v14 = [v13 stringByAppendingString:@" error proxy"];
  uint64_t v15 = getpid();
  v18.receiver = self;
  v18.super_class = (Class)BRXPCAutomaticErrorProxy;
  v16 = [(FPXPCAutomaticErrorProxy *)&v18 initWithConnection:v9 protocol:v12 orError:0 name:v14 requestPid:v15];

  if (v16)
  {
    objc_storeStrong((id *)&v16->_connection, a3);
    objc_storeStrong((id *)&v16->_service, a4);
    +[BRXPCAutomaticErrorProxy incrementConnectionRefCount:v16->_connection];
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BRXPCAutomaticErrorProxy;
  v4 = [(FPXPCAutomaticErrorProxy *)&v7 copyWithZone:a3];
  objc_storeStrong(v4 + 13, self->_service);
  objc_storeStrong(v4 + 12, self->_connection);
  id v5 = (id)__connectionToReferenceCount;
  objc_sync_enter(v5);
  +[BRXPCAutomaticErrorProxy incrementConnectionRefCount:self->_connection];
  objc_sync_exit(v5);

  return v4;
}

- (void)invalidate
{
  id obj = (id)__connectionToReferenceCount;
  objc_sync_enter(obj);
  +[BRXPCAutomaticErrorProxy decrementConnectionRefCount:self->_connection];
  connection = self->_connection;
  self->_connection = 0;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  [(BRXPCAutomaticErrorProxy *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BRXPCAutomaticErrorProxy;
  [(BRXPCAutomaticErrorProxy *)&v3 dealloc];
}

+ (BOOL)sanitizeErrors
{
  return 0;
}

+ (void)incrementConnectionRefCount:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    if (incrementConnectionRefCount__onceToken != -1) {
      dispatch_once(&incrementConnectionRefCount__onceToken, &__block_literal_global_33);
    }
    id v3 = (id)__connectionToReferenceCount;
    objc_sync_enter(v3);
    v4 = [(id)__connectionToReferenceCount objectForKey:v8];
    id v5 = v4;
    v6 = (void *)__connectionToReferenceCount;
    if (v4)
    {
      objc_super v7 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "longLongValue") + 1);
      [v6 setObject:v7 forKey:v8];
    }
    else
    {
      [(id)__connectionToReferenceCount setObject:&unk_1EF133658 forKey:v8];
    }

    objc_sync_exit(v3);
  }
}

uint64_t __56__BRXPCAutomaticErrorProxy_incrementConnectionRefCount___block_invoke()
{
  __connectionToReferenceCount = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];

  return MEMORY[0x1F41817F8]();
}

+ (void)decrementConnectionRefCount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (id)__connectionToReferenceCount;
    objc_sync_enter(v4);
    id v5 = [(id)__connectionToReferenceCount objectForKey:v3];
    uint64_t v6 = [v5 longLongValue];
    uint64_t v7 = v6 - 1;
    if (v6 > 1)
    {
      id v8 = (void *)__connectionToReferenceCount;
      id v9 = [NSNumber numberWithLongLong:v7];
      [v8 setObject:v9 forKey:v3];
    }
    else
    {
      if (v6 != 1)
      {
        id v10 = brc_bread_crumbs((uint64_t)"+[BRXPCAutomaticErrorProxy decrementConnectionRefCount:]", 103);
        id v11 = brc_default_log(0);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          +[BRXPCAutomaticErrorProxy decrementConnectionRefCount:]((uint64_t)v10, v11);
        }
      }
      objc_msgSend(v3, "invalidate", v7);
      [(id)__connectionToReferenceCount removeObjectForKey:v3];
    }

    objc_sync_exit(v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

+ (void)decrementConnectionRefCount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: count == 1%@", (uint8_t *)&v2, 0xCu);
}

@end
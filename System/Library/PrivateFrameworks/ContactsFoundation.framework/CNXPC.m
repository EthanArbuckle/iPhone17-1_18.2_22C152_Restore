@interface CNXPC
+ (id)listenerDelegateWithExportedObject:(id)a3 exportedInterfaceProtocol:(id)a4;
+ (id)reasonConnectionWasInvalidated:(id)a3;
+ (id)resumedConnectionForServiceName:(id)a3 remoteObjectInterfaceProtocol:(id)a4;
+ (void)addAllowedClasses:(id)a3 toInterface:(id)a4 forSelector:(SEL)a5 argumentIndex:(unint64_t)a6 ofReply:(BOOL)a7;
@end

@implementation CNXPC

+ (id)resumedConnectionForServiceName:(id)a3 remoteObjectInterfaceProtocol:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:v5];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v6];
    [v7 setRemoteObjectInterface:v8];

    [v7 resume];
    id v9 = v7;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    +[CNXPC resumedConnectionForServiceName:remoteObjectInterfaceProtocol:]((uint64_t)v5);
  }

  return v7;
}

+ (id)listenerDelegateWithExportedObject:(id)a3 exportedInterfaceProtocol:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CNXPCListenerDelegate alloc] initWithWithExportedObject:v6 exportedInterfaceProtocol:v5];

  return v7;
}

+ (void)addAllowedClasses:(id)a3 toInterface:(id)a4 forSelector:(SEL)a5 argumentIndex:(unint64_t)a6 ofReply:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a4;
  id v12 = a3;
  v13 = [v11 classesForSelector:a5 argumentIndex:a6 ofReply:v7];
  id v14 = [v13 setByAddingObjectsFromArray:v12];

  [v11 setClasses:v14 forSelector:a5 argumentIndex:a6 ofReply:v7];
}

+ (id)reasonConnectionWasInvalidated:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 _xpcConnection];

    if (v5)
    {
      id v6 = [v4 _xpcConnection];
      BOOL v7 = (void *)xpc_connection_copy_invalidation_reason();

      if (v7)
      {
        v8 = [NSString stringWithUTF8String:v7];
        free(v7);
        id v9 = v8;
        LODWORD(v8) = off_1EE025420((uint64_t)&__block_literal_global_119, v9);

        if (!v8) {
          goto LABEL_7;
        }
      }
    }
  }
  id v9 = @"<unknown>";
LABEL_7:

  return v9;
}

+ (void)resumedConnectionForServiceName:(uint64_t)a1 remoteObjectInterfaceProtocol:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create XPC connection for service: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
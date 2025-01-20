@interface DUTriggerMacFileUpdate
+ (id)findDocUConnectionWithUser:(unsigned int)a3;
+ (unsigned)beMobileUser;
+ (void)sendDUNotification;
@end

@implementation DUTriggerMacFileUpdate

+ (id)findDocUConnectionWithUser:(unsigned int)a3
{
  v3 = dispatch_queue_create("testingDocumentUpdateHandlerQueue", 0);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.TextUnderstanding.DocumentUpdateHandler", v3, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = sub_24CF7CB00;
  handler[3] = &unk_2652FA930;
  v5 = mach_service;
  v8 = v5;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_set_target_uid();
  xpc_connection_activate(v5);

  return v5;
}

+ (void)sendDUNotification
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_msgSend(a1, "findDocUConnectionWithUser:", objc_msgSend(a1, "beMobileUser"));
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_24CF75000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DocumentUndersanding: Simulating DocU connection connection:%@", (uint8_t *)&v4, 0xCu);
  }
  if (v2)
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "event_type", "mds_index_updated");
    xpc_dictionary_set_int64(v3, "num_updates", 1);
    xpc_connection_send_message(v2, v3);
  }
}

+ (unsigned)beMobileUser
{
  if (!getuid())
  {
    v2 = getpwnam("mobile");
    if (!v2)
    {
      puts("Error: failed to get pwInfo Exiting.");
      _exit(7);
    }
    xpc_object_t v3 = v2;
    if (!v2->pw_uid)
    {
      puts("Error: got pwInfo for uid=0. Exiting.");
      _exit(8);
    }
    int v4 = fileno((FILE *)*MEMORY[0x263EF8358]);
    if (isatty(v4) == 1) {
      printf("Dropping root privileges to %s (%i)\n", v3->pw_name, v3->pw_uid);
    }
    if (setuid(v3->pw_uid))
    {
      puts("Error: could not set uid");
      _exit(9);
    }
    if (!getuid())
    {
      puts("Error: failed to setuid to drop privileges. Exiting.");
      _exit(10);
    }
  }
  return getuid();
}

@end
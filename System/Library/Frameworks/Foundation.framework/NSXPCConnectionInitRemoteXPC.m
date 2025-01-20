@interface NSXPCConnectionInitRemoteXPC
@end

@implementation NSXPCConnectionInitRemoteXPC

void *___NSXPCConnectionInitRemoteXPC_block_invoke()
{
  result = dlopen("/System/Library/PrivateFrameworks/RemoteXPC.framework/RemoteXPC", 256);
  qword_1EB1ED5F8 = (uint64_t)result;
  if (result)
  {
    _xpc_remote_connection_activate = (uint64_t (*)(void))dlsym(result, "xpc_remote_connection_activate");
    _xpc_remote_connection_cancel = (uint64_t (*)(void))dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_cancel");
    _xpc_remote_connection_create_remote_service_listener = dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_create_remote_service_listener");
    off_1EB1ED600 = dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_create_with_remote_service");
    off_1EB1ED608 = (uint64_t (*)(void, void))dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_send_barrier");
    off_1EB1ED610 = (uint64_t (*)(void, void))dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_send_message");
    off_1EB1ED618 = (uint64_t (*)(void, void, void, void))dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_send_message_with_reply");
    off_1EB1ED620 = (uint64_t (*)(void))dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_send_message_with_reply_sync");
    _xpc_remote_connection_set_event_handler = dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_set_event_handler");
    _xpc_remote_connection_set_target_queue = (uint64_t (*)(void, void))dlsym((void *)qword_1EB1ED5F8, "xpc_remote_connection_set_target_queue");
    result = dlsym((void *)qword_1EB1ED5F8, "_xpc_type_remote_connection");
    _XPC_TYPE_REMOTE_CONNECTION = (uint64_t)result;
  }
  return result;
}

@end
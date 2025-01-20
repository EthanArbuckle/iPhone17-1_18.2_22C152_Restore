@interface GTMTLCaptureServiceObserver
- (void)notifyCaptureObjectsChanged:(id)a3;
- (void)notifyCaptureProgress:(id)a3;
- (void)notifyCaptureRequest:(id)a3;
- (void)notifyUnsupportedFenum:(id)a3;
@end

@implementation GTMTLCaptureServiceObserver

- (void)notifyCaptureProgress:(id)a3
{
  id v5 = a3;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "_port", [(GTServiceObserver *)self replyStream]);
  v7 = [(GTServiceObserver *)self replyPath];
  xpc_dictionary_set_value(xdict, "_replyPath", v7);

  xpc_dictionary_set_nsobject(xdict, "progress", (uint64_t)v5);
  v8 = [(GTServiceObserver *)self connection];
  [v8 sendMessage:xdict];
}

- (void)notifyUnsupportedFenum:(id)a3
{
  id v5 = a3;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "_port", [(GTServiceObserver *)self replyStream]);
  v7 = [(GTServiceObserver *)self replyPath];
  xpc_dictionary_set_value(xdict, "_replyPath", v7);

  xpc_dictionary_set_nsobject(xdict, "info", (uint64_t)v5);
  v8 = [(GTServiceObserver *)self connection];
  [v8 sendMessage:xdict];
}

- (void)notifyCaptureObjectsChanged:(id)a3
{
  id v5 = a3;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "_port", [(GTServiceObserver *)self replyStream]);
  v7 = [(GTServiceObserver *)self replyPath];
  xpc_dictionary_set_value(xdict, "_replyPath", v7);

  xpc_dictionary_set_nsobject(xdict, "captureObjects", (uint64_t)v5);
  v8 = [(GTServiceObserver *)self connection];
  [v8 sendMessage:xdict];
}

- (void)notifyCaptureRequest:(id)a3
{
  id v5 = a3;
  xpc_object_t xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "_port", [(GTServiceObserver *)self replyStream]);
  v7 = [(GTServiceObserver *)self replyPath];
  xpc_dictionary_set_value(xdict, "_replyPath", v7);

  xpc_dictionary_set_nsobject(xdict, "descriptor", (uint64_t)v5);
  v8 = [(GTServiceObserver *)self connection];
  [v8 sendMessage:xdict];
}

@end
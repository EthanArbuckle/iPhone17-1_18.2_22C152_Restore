@interface GTBulkDataReplyStream
- (GTBulkDataReplyStream)initWithCallback:(id)a3;
- (unint64_t)dispatcherId;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
- (void)setDispatcherId:(unint64_t)a3;
@end

@implementation GTBulkDataReplyStream

- (GTBulkDataReplyStream)initWithCallback:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GTBulkDataReplyStream;
  v5 = [(GTBulkDataReplyStream *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x23ECDA150](v4);
    id callback = v5->_callback;
    v5->_id callback = (id)v6;

    v5->_dispatcherId = 0;
  }

  return v5;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  xpc_object_t xdict = a3;
  id v6 = a4;
  if (MessageHasReply(xdict))
  {
    v7 = gt_xpc_dictionary_create_reply(xdict);
    [v6 sendMessage:v7];
  }
  nsdata = (void *)xpc_dictionary_get_nsdata(xdict, "chunk");
  BOOL v9 = xpc_dictionary_get_BOOL(xdict, "isFinalChunk");
  nserror = (void *)xpc_dictionary_get_nserror(xdict, "error");
  (*((void (**)(void))self->_callback + 2))();
  if (!nsdata || v9 || nserror) {
    objc_msgSend(v6, "deregisterDispatcher:", -[GTBulkDataReplyStream dispatcherId](self, "dispatcherId"));
  }
}

- (unint64_t)dispatcherId
{
  return self->_dispatcherId;
}

- (void)setDispatcherId:(unint64_t)a3
{
  self->_dispatcherId = a3;
}

- (void).cxx_destruct
{
}

@end
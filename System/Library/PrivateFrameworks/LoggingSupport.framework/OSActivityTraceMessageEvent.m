@interface OSActivityTraceMessageEvent
- (OSActivityTraceMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (OS_xpc_object)payload;
- (unint64_t)senderProgramCounter;
- (unsigned)messageType;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityTraceMessageEvent

- (void).cxx_destruct
{
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (unint64_t)senderProgramCounter
{
  return self->_senderProgramCounter;
}

- (OS_xpc_object)payload
{
  return self->_payload;
}

- (void)_addProperties:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OSActivityTraceMessageEvent;
  id v4 = a3;
  [(OSActivityEvent *)&v8 _addProperties:v4];
  int v5 = [(OSActivityTraceMessageEvent *)self messageType];
  if (v5 <= 1)
  {
    if (!v5)
    {
      v6 = @"Default";
      goto LABEL_13;
    }
    if (v5 == 1)
    {
      v6 = @"Info";
      goto LABEL_13;
    }
LABEL_12:
    v6 = @"Unknown";
    goto LABEL_13;
  }
  if (v5 == 2)
  {
    v6 = @"Debug";
    goto LABEL_13;
  }
  if (v5 == 16)
  {
    v6 = @"Error";
    goto LABEL_13;
  }
  if (v5 != 17) {
    goto LABEL_12;
  }
  v6 = @"Fault";
LABEL_13:
  [v4 setObject:v6 forKey:@"messageType"];
  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[OSActivityTraceMessageEvent senderProgramCounter](self, "senderProgramCounter"));
  [v4 setObject:v7 forKey:@"senderProgramCounter"];
}

- (OSActivityTraceMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OSActivityTraceMessageEvent;
  id v4 = [(OSActivityTraceMessageEvent *)&v9 init];
  if (v4)
  {
    unint64_t var0 = a3->var8.var0.var0;
    v6 = os_trace_copy_formatted_message((uint64_t)&a3->var8);
    if (v6)
    {
      v7 = v6;
      [(OSActivityEvent *)v4 fillFromStreamEntry:a3 eventMessage:v6 persisted:0];
      [(OSActivityEventMessage *)v4 fillEventData:a3->var8.var2.var11 length:a3->var8.var2.var12 privateBuffer:0 length:0];
      objc_storeStrong((id *)&v4->_payload, a3->var8.var4.var13);
      v4->_senderProgramCounter = a3->var8.var0.var7;
      v4->_messageType = BYTE1(var0);
      free(v7);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

@end
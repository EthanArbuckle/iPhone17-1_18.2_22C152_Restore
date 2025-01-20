@interface OSActivityLogMessageEvent
- (NSString)category;
- (NSString)subsystem;
- (OSActivityLogMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (unint64_t)senderProgramCounter;
- (unsigned)messageType;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityLogMessageEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (unint64_t)senderProgramCounter
{
  return self->_senderProgramCounter;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)_addProperties:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)OSActivityLogMessageEvent;
  [(OSActivityEvent *)&v12 _addProperties:v4];
  int v5 = [(OSActivityLogMessageEvent *)self messageType];
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
  }
  else
  {
    switch(v5)
    {
      case 2:
        v6 = @"Debug";
        goto LABEL_13;
      case 16:
        v6 = @"Error";
        goto LABEL_13;
      case 17:
        v6 = @"Fault";
        goto LABEL_13;
    }
  }
  v6 = @"Unknown";
LABEL_13:
  v7 = [(OSActivityLogMessageEvent *)self subsystem];

  if (v7)
  {
    v8 = [(OSActivityLogMessageEvent *)self subsystem];
    [v4 setObject:v8 forKey:@"subsystem"];
  }
  v9 = [(OSActivityLogMessageEvent *)self category];

  if (v9)
  {
    v10 = [(OSActivityLogMessageEvent *)self category];
    [v4 setObject:v10 forKey:@"category"];
  }
  [v4 setObject:v6 forKey:@"messageType"];
  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[OSActivityLogMessageEvent senderProgramCounter](self, "senderProgramCounter"));
  [v4 setObject:v11 forKey:@"senderProgramCounter"];
}

- (OSActivityLogMessageEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)OSActivityLogMessageEvent;
  id v4 = [(OSActivityLogMessageEvent *)&v13 init];
  if (v4)
  {
    unint64_t var0 = a3->var8.var0.var0;
    v6 = os_log_copy_formatted_message((uint64_t)&a3->var8);
    if (v6)
    {
      v7 = v6;
      [(OSActivityEvent *)v4 fillFromStreamEntry:a3 eventMessage:v6 persisted:a3->var8.var4.var19];
      free(v7);
      [(OSActivityEventMessage *)v4 fillEventData:a3->var8.var2.var11 length:a3->var8.var2.var12 privateBuffer:a3->var8.var8.var12 length:a3->var8.var4.var14];
      if (a3->var8.var4.var16)
      {
        uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:");
        category = v4->_category;
        v4->_category = (NSString *)v8;
      }
      if (a3->var8.var4.var15)
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:");
        subsystem = v4->_subsystem;
        v4->_subsystem = (NSString *)v10;
      }
      v4->_senderProgramCounter = a3->var8.var0.var7;
      v4->_messageType = BYTE1(var0);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

@end
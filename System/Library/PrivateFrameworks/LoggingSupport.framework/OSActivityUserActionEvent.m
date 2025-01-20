@interface OSActivityUserActionEvent
- (OSActivityUserActionEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (unint64_t)senderProgramCounter;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityUserActionEvent

- (unint64_t)senderProgramCounter
{
  return self->_senderProgramCounter;
}

- (void)_addProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OSActivityUserActionEvent;
  id v4 = a3;
  [(OSActivityEvent *)&v6 _addProperties:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[OSActivityUserActionEvent senderProgramCounter](self, "senderProgramCounter", v6.receiver, v6.super_class));
  [v4 setObject:v5 forKey:@"senderProgramCounter"];
}

- (OSActivityUserActionEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  if (a3->var8.var3.var10)
  {
    v7.receiver = self;
    v7.super_class = (Class)OSActivityUserActionEvent;
    id v4 = [(OSActivityUserActionEvent *)&v7 init];
    v5 = v4;
    if (v4)
    {
      [(OSActivityEvent *)v4 fillFromStreamEntry:a3 eventMessage:a3->var8.var3.var10 persisted:a3->var8.var8.var10[12]];
      v5->_senderProgramCounter = a3->var8.var0.var7;
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end
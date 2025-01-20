@interface OSActivityCreateEvent
- (OSActivityCreateEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (unint64_t)creatorActivityID;
- (unint64_t)creatorProcessUniqueID;
- (unint64_t)senderProgramCounter;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityCreateEvent

- (unint64_t)senderProgramCounter
{
  return self->_senderProgramCounter;
}

- (unint64_t)creatorProcessUniqueID
{
  return self->_creatorProcessUniqueID;
}

- (unint64_t)creatorActivityID
{
  return self->_creatorActivityID;
}

- (void)_addProperties:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)OSActivityCreateEvent;
  [(OSActivityEvent *)&v7 _addProperties:v4];
  [v4 setObject:@"OSActivityCreateEvent" forKey:@"eventType"];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[OSActivityCreateEvent senderProgramCounter](self, "senderProgramCounter"));
  [v4 setObject:v5 forKey:@"senderProgramCounter"];

  if ([(OSActivityCreateEvent *)self creatorActivityID])
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityCreateEvent creatorActivityID](self, "creatorActivityID"));
    [v4 setObject:v6 forKey:@"creatorActivityID"];
  }
}

- (OSActivityCreateEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  if (a3->var8.var3.var10)
  {
    v7.receiver = self;
    v7.super_class = (Class)OSActivityCreateEvent;
    id v4 = [(OSActivityCreateEvent *)&v7 init];
    v5 = v4;
    if (v4)
    {
      [(OSActivityEvent *)v4 fillFromStreamEntry:a3 eventMessage:a3->var8.var3.var10 persisted:0];
      v5->_creatorActivityID = a3->var8.var2.var11;
      v5->_creatorProcessUniqueID = a3->var8.var2.var12;
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
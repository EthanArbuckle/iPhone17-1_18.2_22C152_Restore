@interface OSActivityLossEvent
- (BOOL)saturated;
- (OSActivityLossEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (unint64_t)endMachTimestamp;
- (unint64_t)startMachTimestamp;
- (unsigned)count;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityLossEvent

- (BOOL)saturated
{
  return self->_saturated;
}

- (unsigned)count
{
  return self->_count;
}

- (unint64_t)endMachTimestamp
{
  return self->_endMachTimestamp;
}

- (unint64_t)startMachTimestamp
{
  return self->_startMachTimestamp;
}

- (void)_addProperties:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)OSActivityLossEvent;
  id v4 = a3;
  [(OSActivityEvent *)&v9 _addProperties:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityLossEvent startMachTimestamp](self, "startMachTimestamp", v9.receiver, v9.super_class));
  [v4 setObject:v5 forKey:@"startMachTimestamp"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityLossEvent endMachTimestamp](self, "endMachTimestamp"));
  [v4 setObject:v6 forKey:@"endMachTimestamp"];

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[OSActivityLossEvent count](self, "count"));
  [v4 setObject:v7 forKey:@"count"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[OSActivityLossEvent saturated](self, "saturated"));
  [v4 setObject:v8 forKey:@"saturated"];
}

- (OSActivityLossEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)OSActivityLossEvent;
  id v4 = [(OSActivityLossEvent *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_startMachTimestamp = a3->var8.var3.var10;
    unint64_t var11 = a3->var8.var2.var11;
    v4->_endMachTimestamp = var11;
    unsigned int var12 = a3->var8.var9.var12;
    v4->_count = var12;
    BOOL v8 = a3->var8.var9.var12 == 63;
    v4->_saturated = v8;
    objc_super v9 = (const char *)&_CTF_NULLSTR;
    if (v8) {
      objc_super v9 = ">=";
    }
    snprintf(__str, 0x100uLL, "lost %s%u unreliable messages from %llu-%llu (Mach continuous exact start-approx. end)", v9, var12, v4->_startMachTimestamp, var11);
    [(OSActivityEvent *)v5 fillFromStreamEntry:a3 eventMessage:__str persisted:1];
  }
  return v5;
}

@end
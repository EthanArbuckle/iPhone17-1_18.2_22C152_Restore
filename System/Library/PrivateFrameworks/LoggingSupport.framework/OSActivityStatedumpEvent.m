@interface OSActivityStatedumpEvent
- (OSActivityStatedumpEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityStatedumpEvent

- (void)_addProperties:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OSActivityStatedumpEvent;
  id v3 = a3;
  [(OSActivityEvent *)&v4 _addProperties:v3];
  objc_msgSend(v3, "setObject:forKey:", &unk_1EF44AC10, @"eventType", v4.receiver, v4.super_class);
}

- (OSActivityStatedumpEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  if (a3->var8.var2.var11)
  {
    v7.receiver = self;
    v7.super_class = (Class)OSActivityStatedumpEvent;
    objc_super v4 = [(OSActivityStatedumpEvent *)&v7 init];
    v5 = v4;
    if (v4) {
      [(OSActivityEvent *)v4 fillFromStreamEntry:a3 eventMessage:a3->var8.var3.var10 persisted:1];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end
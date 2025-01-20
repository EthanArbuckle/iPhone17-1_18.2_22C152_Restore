@interface OSActivityTransitionEvent
- (OSActivityTransitionEvent)initWithEntry:(os_activity_stream_entry_s *)a3;
- (unint64_t)transitionToActivityID;
- (void)_addProperties:(id)a3;
@end

@implementation OSActivityTransitionEvent

- (unint64_t)transitionToActivityID
{
  return self->_transitionToActivityID;
}

- (void)_addProperties:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OSActivityTransitionEvent;
  id v4 = a3;
  [(OSActivityEvent *)&v6 _addProperties:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityTransitionEvent transitionToActivityID](self, "transitionToActivityID", v6.receiver, v6.super_class));
  [v4 setObject:v5 forKey:@"transitionToActivityID"];
}

- (OSActivityTransitionEvent)initWithEntry:(os_activity_stream_entry_s *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)OSActivityTransitionEvent;
  id v4 = [(OSActivityTransitionEvent *)&v8 init];
  v5 = v4;
  if (v4)
  {
    unint64_t var10 = a3->var8.var3.var10;
    v4->_transitionToActivityID = var10;
    snprintf(__str, 0x80uLL, "Transition to 0x%llx", var10 & 0xFFFFFFFFFFFFFFLL);
    [(OSActivityEvent *)v5 fillFromStreamEntry:a3 eventMessage:__str persisted:0];
  }
  return v5;
}

@end
@interface IMJunkRecoveryTranscriptChatItem
- (NSDate)earliestMessageDate;
- (id)_initWithItem:(id)a3;
- (void)setEarliestMessageDate:(id)a3;
@end

@implementation IMJunkRecoveryTranscriptChatItem

- (id)_initWithItem:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IMJunkRecoveryTranscriptChatItem;
  id v3 = [(IMChatItem *)&v8 _initWithItem:a3];
  v6 = v3;
  if (v3) {
    objc_msgSend__setGUID_(v3, v4, @"jr:", v5);
  }
  return v6;
}

- (NSDate)earliestMessageDate
{
  return self->_earliestMessageDate;
}

- (void)setEarliestMessageDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
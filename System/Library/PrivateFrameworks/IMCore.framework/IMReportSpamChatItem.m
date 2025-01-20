@interface IMReportSpamChatItem
- (BOOL)hasMultipleMessages;
- (BOOL)isBusinessChat;
- (BOOL)isGroupMessage;
- (BOOL)showReportSMSSpam;
- (BOOL)wasReportedAsSpam;
- (id)_initWithItem:(id)a3 wasReportedAsSpam:(BOOL)a4 isGroup:(BOOL)a5 hasMultipleMessages:(BOOL)a6 showReportSMSSpam:(BOOL)a7 isBusinessChat:(BOOL)a8;
@end

@implementation IMReportSpamChatItem

- (id)_initWithItem:(id)a3 wasReportedAsSpam:(BOOL)a4 isGroup:(BOOL)a5 hasMultipleMessages:(BOOL)a6 showReportSMSSpam:(BOOL)a7 isBusinessChat:(BOOL)a8
{
  v18.receiver = self;
  v18.super_class = (Class)IMReportSpamChatItem;
  v13 = [(IMChatItem *)&v18 _initWithItem:a3];
  v16 = v13;
  if (v13)
  {
    objc_msgSend__setGUID_(v13, v14, @"rs:", v15);
    v16[56] = a4;
    v16[57] = a5;
    v16[58] = a6;
    v16[59] = a7;
    v16[60] = a8;
  }
  return v16;
}

- (BOOL)wasReportedAsSpam
{
  return self->_wasReportedAsSpam;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (BOOL)hasMultipleMessages
{
  return self->_hasMultipleMessages;
}

- (BOOL)showReportSMSSpam
{
  return self->_showReportSMSSpam;
}

- (BOOL)isBusinessChat
{
  return self->_isBusinessChat;
}

@end
@interface IMStewieResumeItem
- (NSString)chatIdentifier;
- (id)_initWithItem:(id)a3 chatIdentifier:(id)a4;
@end

@implementation IMStewieResumeItem

- (id)_initWithItem:(id)a3 chatIdentifier:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IMStewieResumeItem;
  v8 = [(IMChatItem *)&v13 _initWithItem:a3];
  v11 = v8;
  if (v8)
  {
    objc_msgSend__setGUID_(v8, v9, @"srb:", v10);
    objc_storeStrong(v11 + 7, a4);
  }

  return v11;
}

- (NSString)chatIdentifier
{
  return self->_chatIdentifier;
}

- (void).cxx_destruct
{
}

@end
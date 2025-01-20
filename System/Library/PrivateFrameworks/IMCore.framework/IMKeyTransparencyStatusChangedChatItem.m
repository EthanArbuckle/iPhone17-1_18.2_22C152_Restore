@interface IMKeyTransparencyStatusChangedChatItem
- (BOOL)isGroupChat;
- (NSArray)affectedHandles;
- (id)_initWithHandles:(id)a3 status:(unint64_t)a4 isGroupChat:(BOOL)a5;
- (unint64_t)status;
@end

@implementation IMKeyTransparencyStatusChangedChatItem

- (id)_initWithHandles:(id)a3 status:(unint64_t)a4 isGroupChat:(BOOL)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMKeyTransparencyStatusChangedChatItem;
  v10 = [(IMChatItem *)&v15 _initWithItem:0];
  v13 = v10;
  if (v10)
  {
    objc_msgSend__setGUID_(v10, v11, @"kte:", v12);
    objc_storeStrong(v13 + 8, a3);
    v13[9] = (id)a4;
    *((unsigned char *)v13 + 56) = a5;
  }

  return v13;
}

- (NSArray)affectedHandles
{
  return self->_affectedHandles;
}

- (unint64_t)status
{
  return self->_status;
}

- (BOOL)isGroupChat
{
  return self->_groupChat;
}

- (void).cxx_destruct
{
}

@end
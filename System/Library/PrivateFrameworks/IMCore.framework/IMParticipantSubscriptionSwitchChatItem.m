@interface IMParticipantSubscriptionSwitchChatItem
- (IMHandle)otherHandle;
- (IMHandle)sender;
- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5;
@end

@implementation IMParticipantSubscriptionSwitchChatItem

- (id)_initWithItem:(id)a3 sender:(id)a4 otherHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)IMParticipantSubscriptionSwitchChatItem;
  v11 = [(IMChatItem *)&v21 _initWithItem:v8];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 7, a4);
    objc_storeStrong(v12 + 8, a5);
    v16 = objc_msgSend_guid(v8, v13, v14, v15);
    v17 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v12, v18, (uint64_t)v17, v19);
  }

  return v12;
}

- (IMHandle)sender
{
  return self->_sender;
}

- (IMHandle)otherHandle
{
  return self->_otherHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherHandle, 0);

  objc_storeStrong((id *)&self->_sender, 0);
}

@end
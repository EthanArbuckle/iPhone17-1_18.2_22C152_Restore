@interface IMSatelliteAvailabilityChatItem
- (IMHandle)handle;
- (id)_initWithHandle:(id)a3;
@end

@implementation IMSatelliteAvailabilityChatItem

- (id)_initWithHandle:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IMSatelliteAvailabilityChatItem;
  v6 = [(IMChatItem *)&v16 _initWithItem:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(v6 + 7, a3);
    v11 = objc_msgSend_ID(v7[7], v8, v9, v10);
    v12 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v7, v13, (uint64_t)v12, v14);
  }

  return v7;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void).cxx_destruct
{
}

@end
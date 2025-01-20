@interface IMUnavailabilityIndicatorChatItem
- (BOOL)displayNotifyAnywayButton;
- (IMHandle)handle;
- (NSHashTable)unavailabilityIndicatorChatItemDelegates;
- (id)_initWithHandle:(id)a3 displayNotifyAnywayButton:(BOOL)a4;
- (void)_notifyDelegatesOfStateChange;
- (void)addUnavailabilityIndicatorChatItemDelegate:(id)a3;
- (void)setDisplayNotifyAnywayButton:(BOOL)a3;
- (void)setUnavailabilityIndicatorChatItemDelegates:(id)a3;
@end

@implementation IMUnavailabilityIndicatorChatItem

- (id)_initWithHandle:(id)a3 displayNotifyAnywayButton:(BOOL)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)IMUnavailabilityIndicatorChatItem;
  v8 = [(IMChatItem *)&v23 _initWithItem:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(v8 + 8, a3);
    *((unsigned char *)v9 + 56) = a4;
    v13 = objc_msgSend_ID(v9[8], v10, v11, v12);
    v14 = (void *)sub_1A4C4EEE8();

    objc_msgSend__setGUID_(v9, v15, (uint64_t)v14, v16);
    uint64_t v20 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v17, v18, v19);
    id v21 = v9[9];
    v9[9] = (id)v20;
  }
  return v9;
}

- (void)setDisplayNotifyAnywayButton:(BOOL)a3
{
  if (self->_displayNotifyAnywayButton != a3)
  {
    self->_displayNotifyAnywayButton = a3;
    ((void (*)(IMUnavailabilityIndicatorChatItem *, char *, BOOL))MEMORY[0x1F4181798])(self, sel__notifyDelegatesOfStateChange, a3);
  }
}

- (void)_notifyDelegatesOfStateChange
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_unavailabilityIndicatorChatItemDelegates;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, (uint64_t)v15, 16);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend_displayNotifyAnywayButtonStateChanged_(*(void **)(*((void *)&v11 + 1) + 8 * v10++), v6, (uint64_t)self, v7, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v11, (uint64_t)v15, 16);
    }
    while (v8);
  }
}

- (void)addUnavailabilityIndicatorChatItemDelegate:(id)a3
{
  objc_msgSend_addObject_(self->_unavailabilityIndicatorChatItemDelegates, a2, (uint64_t)a3, v3);
}

- (IMHandle)handle
{
  return self->_handle;
}

- (BOOL)displayNotifyAnywayButton
{
  return self->_displayNotifyAnywayButton;
}

- (NSHashTable)unavailabilityIndicatorChatItemDelegates
{
  return self->_unavailabilityIndicatorChatItemDelegates;
}

- (void)setUnavailabilityIndicatorChatItemDelegates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailabilityIndicatorChatItemDelegates, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end
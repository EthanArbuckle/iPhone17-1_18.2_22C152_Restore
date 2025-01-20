@interface CSBluetoothWirelessSplitterInfo
- (BOOL)_hasDeviceTemporaryPairedNotInContacts;
- (BOOL)shouldDisableSpeakerVerificationInSplitterMode;
- (BOOL)splitterEnabled;
- (CSBluetoothWirelessSplitterInfo)init;
- (id)description;
- (id)splitterDeviceList;
- (unint64_t)splitterState;
- (void)addDeviceIntoSplitterDeviceList:(id)a3;
- (void)setSplitterEnabled:(BOOL)a3;
@end

@implementation CSBluetoothWirelessSplitterInfo

- (void).cxx_destruct
{
}

- (void)setSplitterEnabled:(BOOL)a3
{
  self->_splitterEnabled = a3;
}

- (BOOL)splitterEnabled
{
  return self->_splitterEnabled;
}

- (BOOL)_hasDeviceTemporaryPairedNotInContacts
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_splitterEnabled)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = self->_splitterDeviceList;
    uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v9 != v4) {
            objc_enumerationMutation(v2);
          }
          v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
          if ((objc_msgSend(v6, "supportDoAP", (void)v8) & 1) == 0
            && ([v6 isTemporaryPairedNotInContacts] & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)shouldDisableSpeakerVerificationInSplitterMode
{
  if (([(CSBluetoothWirelessSplitterInfo *)self splitterState] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    return ![(CSBluetoothWirelessSplitterInfo *)self _hasDeviceTemporaryPairedNotInContacts];
  }
  else {
    return 0;
  }
}

- (unint64_t)splitterState
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!self->_splitterEnabled) {
    return 1;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_splitterDeviceList;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3)
  {

    return 2;
  }
  uint64_t v4 = v3;
  int v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "supportDoAP", (void)v9);
    }
    uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);

  if (v5 == 1) {
    unint64_t result = 3;
  }
  else {
    unint64_t result = 4;
  }
  if (!v5) {
    return 2;
  }
  return result;
}

- (void)addDeviceIntoSplitterDeviceList:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_splitterDeviceList, "addObject:");
  }
}

- (id)splitterDeviceList
{
  v2 = (void *)[(NSMutableArray *)self->_splitterDeviceList copy];
  return v2;
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v3, "appendFormat:", @"[SplitterEnabled(%d)]", self->_splitterEnabled);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_splitterDeviceList;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = [v10 address];
        [v3 appendFormat:@"[Device%d(%@) DoAP(%d)]", v8 + i, v11, objc_msgSend(v10, "supportDoAP")];
      }
      uint64_t v8 = (v8 + i);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  objc_msgSend(v3, "appendFormat:", @"[SplitterState:%d]", -[CSBluetoothWirelessSplitterInfo splitterState](self, "splitterState"));
  return v3;
}

- (CSBluetoothWirelessSplitterInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSBluetoothWirelessSplitterInfo;
  v2 = [(CSBluetoothWirelessSplitterInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    splitterDeviceList = v2->_splitterDeviceList;
    v2->_splitterDeviceList = (NSMutableArray *)v3;
  }
  return v2;
}

@end
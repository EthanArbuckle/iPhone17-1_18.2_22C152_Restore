@interface MSPSharedTripVirtualContact
- (BOOL)isPhoneNumber;
- (MSPSharedTripVirtualContact)initWithVirtualReceiverHandle:(id)a3;
- (id)_deviceHandleForVersion:(unint64_t)a3;
- (id)contact;
- (id)displayName;
- (id)handleForIDS;
- (id)labeledValue;
- (id)stringValue;
@end

@implementation MSPSharedTripVirtualContact

- (MSPSharedTripVirtualContact)initWithVirtualReceiverHandle:(id)a3
{
  id v5 = a3;
  v6 = [(MSPSharedTripVirtualContact *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_virtualReceiverHandle, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deviceHandlesByVersion = v7->_deviceHandlesByVersion;
    v7->_deviceHandlesByVersion = v8;
  }
  return v7;
}

- (BOOL)isPhoneNumber
{
  return 0;
}

- (id)displayName
{
  virtualReceiverName = self->_virtualReceiverName;
  if (!virtualReceiverName)
  {
    MSPSharedTripVirtualReceiverHandleGetName(self->_virtualReceiverHandle);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_virtualReceiverName;
    self->_virtualReceiverName = v4;

    virtualReceiverName = self->_virtualReceiverName;
  }

  return virtualReceiverName;
}

- (id)stringValue
{
  return self->_virtualReceiverHandle;
}

- (id)handleForIDS
{
  return self->_virtualReceiverHandle;
}

- (id)contact
{
  return 0;
}

- (id)labeledValue
{
  return 0;
}

- (id)_deviceHandleForVersion:(unint64_t)a3
{
  deviceHandlesByVersion = self->_deviceHandlesByVersion;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v7 = [(NSMutableDictionary *)deviceHandlesByVersion objectForKeyedSubscript:v6];

  if (!v7)
  {
    v7 = MSPSharedTripVirturalReceiverDeviceHandleMake(self->_virtualReceiverHandle, a3);
    v8 = self->_deviceHandlesByVersion;
    v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 setObject:v7 forKeyedSubscript:v9];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceHandlesByVersion, 0);
  objc_storeStrong((id *)&self->_virtualReceiverName, 0);

  objc_storeStrong((id *)&self->_virtualReceiverHandle, 0);
}

@end
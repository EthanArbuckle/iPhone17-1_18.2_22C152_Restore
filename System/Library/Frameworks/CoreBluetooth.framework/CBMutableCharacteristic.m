@interface CBMutableCharacteristic
- (BOOL)handleCentralSubscribed:(id)a3;
- (BOOL)handleCentralUnsubscribed:(id)a3;
- (CBAttributePermissions)permissions;
- (CBMutableCharacteristic)initWithService:(id)a3 dictionary:(id)a4;
- (CBMutableCharacteristic)initWithType:(CBUUID *)UUID properties:(CBCharacteristicProperties)properties value:(NSData *)value permissions:(CBAttributePermissions)permissions;
- (NSArray)subscribedCentrals;
- (NSNumber)ID;
- (id)description;
- (void)dealloc;
- (void)handlePowerNotOn;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setID:(id)a3;
- (void)setPermissions:(CBAttributePermissions)permissions;
@end

@implementation CBMutableCharacteristic

- (CBMutableCharacteristic)initWithType:(CBUUID *)UUID properties:(CBCharacteristicProperties)properties value:(NSData *)value permissions:(CBAttributePermissions)permissions
{
  v10 = value;
  v16.receiver = self;
  v16.super_class = (Class)CBMutableCharacteristic;
  v11 = [(CBAttribute *)&v16 initWithUUID:UUID];
  v12 = v11;
  if (v11)
  {
    [(CBCharacteristic *)v11 setValue:v10];
    v12->_permissions = permissions;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subscribedCentrals = v12->_subscribedCentrals;
    v12->_subscribedCentrals = v13;

    [(CBCharacteristic *)v12 setProperties:properties];
    [(CBMutableCharacteristic *)v12 addObserver:v12 forKeyPath:@"properties" options:0 context:0];
    [(CBMutableCharacteristic *)v12 addObserver:v12 forKeyPath:@"descriptors" options:0 context:0];
  }

  return v12;
}

- (CBMutableCharacteristic)initWithService:(id)a3 dictionary:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v7 = +[CBUUID UUIDWithData:v6];

  v8 = [v5 objectForKeyedSubscript:@"kCBMsgArgCharacteristicProperties"];
  uint64_t v9 = [v8 integerValue];

  v10 = [v5 objectForKeyedSubscript:@"kCBMsgArgAttributePermissions"];
  uint64_t v11 = [v10 integerValue];

  v12 = [v5 objectForKeyedSubscript:@"kCBMsgArgData"];
  v13 = [(CBMutableCharacteristic *)self initWithType:v7 properties:v9 value:v12 permissions:v11];
  if (v13)
  {
    uint64_t v14 = [v5 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
    ID = v13->_ID;
    v13->_ID = (NSNumber *)v14;
  }
  return v13;
}

- (void)dealloc
{
  [(CBMutableCharacteristic *)self removeObserver:self forKeyPath:@"descriptors"];
  [(CBMutableCharacteristic *)self removeObserver:self forKeyPath:@"properties"];
  v3.receiver = self;
  v3.super_class = (Class)CBMutableCharacteristic;
  [(CBMutableCharacteristic *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if ([v8 isEqualToString:@"descriptors"])
  {
    SEL v26 = a2;
    id v27 = v8;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = [(CBCharacteristic *)self descriptors];
    uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v11 = 0;
      int v12 = 0;
      uint64_t v29 = *(void *)v31;
      unint64_t v13 = 0x1E5E30000;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          while (1)
          {
            v15 = self;
            if (*(void *)v31 != v29) {
              objc_enumerationMutation(obj);
            }
            objc_super v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v17 = [v16 UUID];
            v18 = [*(id *)(v13 + 3640) UUIDWithString:@"2901"];
            int v19 = [v17 isEqual:v18];

            if (!v19) {
              break;
            }
            self = v15;
            if (v11)
            {
              v23 = [MEMORY[0x1E4F28B00] currentHandler];
              [v23 handleFailureInMethod:v26 object:v15 file:@"CBCharacteristic.m" lineNumber:194 description:@"Cannot have more than one User Description descriptor per characteristic"];
              char v11 = 1;
              goto LABEL_17;
            }
            char v11 = 1;
LABEL_13:
            unint64_t v13 = 0x1E5E30000uLL;
            [v16 setCharacteristic:self];
            if (v10 == ++i) {
              goto LABEL_4;
            }
          }
          v20 = [v16 UUID];
          v21 = [*(id *)(v13 + 3640) UUIDWithString:@"2904"];
          int v22 = [v20 isEqual:v21];

          if ((v22 & v12) != 1)
          {
            v12 |= v22;
            self = v15;
            goto LABEL_13;
          }
          v23 = [MEMORY[0x1E4F28B00] currentHandler];
          self = v15;
          [v23 handleFailureInMethod:v26 object:v15 file:@"CBCharacteristic.m" lineNumber:198 description:@"Cannot have more than one Format descriptor per characteristic"];
          int v12 = 1;
LABEL_17:
          unint64_t v13 = 0x1E5E30000;

          [v16 setCharacteristic:self];
        }
LABEL_4:
        uint64_t v10 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v10);
    }

    id v8 = v27;
  }
  else if ([v8 isEqualToString:@"properties"])
  {
    if ([(CBCharacteristic *)self properties])
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2 object:self file:@"CBCharacteristic.m" lineNumber:206 description:@"CBCharacteristicPropertyBroadcast is not allowed"];

      if (([(CBCharacteristic *)self properties] & 0x80) == 0) {
        goto LABEL_24;
      }
    }
    else if (([(CBCharacteristic *)self properties] & 0x80) == 0)
    {
      goto LABEL_24;
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"CBCharacteristic.m" lineNumber:207 description:@"CBCharacteristicPropertyExtendedProperties is not allowed"];
  }
LABEL_24:
}

- (BOOL)handleCentralSubscribed:(id)a3
{
  id v4 = a3;
  char v5 = [(NSMutableArray *)self->_subscribedCentrals containsObject:v4];
  if ((v5 & 1) == 0) {
    [(NSMutableArray *)self->_subscribedCentrals addObject:v4];
  }

  return v5 ^ 1;
}

- (BOOL)handleCentralUnsubscribed:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableArray *)self->_subscribedCentrals containsObject:v4];
  if (v5) {
    [(NSMutableArray *)self->_subscribedCentrals removeObject:v4];
  }

  return v5;
}

- (void)handlePowerNotOn
{
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(CBAttribute *)self UUID];
  v6 = [(CBCharacteristic *)self value];
  CBCharacteristicProperties v7 = [(CBCharacteristic *)self properties];
  CBAttributePermissions v8 = [(CBMutableCharacteristic *)self permissions];
  uint64_t v9 = [(CBCharacteristic *)self descriptors];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p UUID = %@, Value = %@, Properties = 0x%lX, Permissions = 0x%lX, Descriptors = %@, SubscribedCentrals = %@>", v4, self, v5, v6, v7, v8, v9, self->_subscribedCentrals];

  return v10;
}

- (NSArray)subscribedCentrals
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (CBAttributePermissions)permissions
{
  return self->_permissions;
}

- (void)setPermissions:(CBAttributePermissions)permissions
{
  self->_permissions = permissions;
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ID, 0);

  objc_storeStrong((id *)&self->_subscribedCentrals, 0);
}

@end
@interface CBMutableService
- (CBMutableService)initWithDictionary:(id)a3;
- (CBMutableService)initWithType:(CBUUID *)UUID primary:(BOOL)isPrimary;
- (NSNumber)ID;
- (id)description;
- (void)dealloc;
- (void)handlePowerNotOn;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setID:(id)a3;
@end

@implementation CBMutableService

- (CBMutableService)initWithType:(CBUUID *)UUID primary:(BOOL)isPrimary
{
  BOOL v4 = isPrimary;
  v7 = UUID;
  v8 = [(CBUUID *)v7 data];
  if ([v8 length] != 2)
  {
    v9 = [(CBUUID *)v7 data];
    uint64_t v10 = [v9 length];

    if (v10 == 16) {
      goto LABEL_5;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CBService.m", 146, @"Invalid parameter not satisfying: %@", @"UUID.data.length == 2 || UUID.data.length == 16" object file lineNumber description];
  }

LABEL_5:
  v14.receiver = self;
  v14.super_class = (Class)CBMutableService;
  v11 = [(CBAttribute *)&v14 initWithUUID:v7];
  v12 = v11;
  if (v11)
  {
    [(CBService *)v11 setIsPrimary:v4];
    [(CBMutableService *)v12 addObserver:v12 forKeyPath:@"characteristics" options:0 context:0];
  }

  return v12;
}

- (CBMutableService)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kCBMsgArgUUID"];
  v6 = +[CBUUID UUIDWithData:v5];
  v7 = [v4 objectForKeyedSubscript:@"kCBMsgArgType"];
  v8 = -[CBMutableService initWithType:primary:](self, "initWithType:primary:", v6, [v7 BOOLValue]);

  if (v8)
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"kCBMsgArgAttributeID"];
    ID = v8->_ID;
    v8->_ID = (NSNumber *)v9;
  }
  return v8;
}

- (void)dealloc
{
  [(CBMutableService *)self removeObserver:self forKeyPath:@"characteristics"];
  v3.receiver = self;
  v3.super_class = (Class)CBMutableService;
  [(CBMutableService *)&v3 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a3, "isEqualToString:", @"characteristics", a4, a5, a6))
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = [(CBService *)self characteristics];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setService:self];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)handlePowerNotOn
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(CBService *)self characteristics];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) handlePowerNotOn];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if ([(CBService *)self isPrimary]) {
    uint64_t v5 = "YES";
  }
  else {
    uint64_t v5 = "NO";
  }
  uint64_t v6 = [(CBAttribute *)self UUID];
  long long v7 = [(CBService *)self includedServices];
  long long v8 = [(CBService *)self characteristics];
  long long v9 = [v3 stringWithFormat:@"<%@: %p Primary = %s, UUID = %@, Included Services = %@, Characteristics = %@>", v4, self, v5, v6, v7, v8];

  return v9;
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
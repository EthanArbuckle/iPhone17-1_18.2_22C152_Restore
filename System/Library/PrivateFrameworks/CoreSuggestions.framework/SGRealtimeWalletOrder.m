@interface SGRealtimeWalletOrder
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRealtimeWalletOrder:(id)a3;
- (NSData)walletOrderData;
- (NSData)walletOrderDictData;
- (NSString)description;
- (NSString)identifier;
- (SGRealtimeWalletOrder)initWithCoder:(id)a3;
- (id)initRealtimeWalletOrderForState:(int)a3 identifier:(id)a4 walletOrderDictionary:(id)a5 walletOrderData:(id)a6;
- (id)walletOrderDictionary;
- (int)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGRealtimeWalletOrder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walletOrderData, 0);
  objc_storeStrong((id *)&self->_walletOrderDictData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSData)walletOrderData
{
  return self->_walletOrderData;
}

- (NSData)walletOrderDictData
{
  return self->_walletOrderDictData;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)state
{
  return self->_state;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  identifier = self->_identifier;
  uint64_t state = self->_state;
  v6 = [(SGRealtimeWalletOrder *)self walletOrderDictionary];

  return (NSString *)v7;
}

- (id)walletOrderDictionary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  walletOrderDictData = self->_walletOrderDictData;
  if (walletOrderDictData)
  {
    id v10 = 0;
    id v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:walletOrderDictData options:0 error:&v10];
    id v4 = v10;
    if (!v4) {
      goto LABEL_7;
    }
    v5 = v4;
    v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_error_impl(&dword_1A4D8C000, v6, OS_LOG_TYPE_ERROR, "%@: Error encountered while retrieving string from NSData", buf, 0xCu);
    }
  }
  id v3 = 0;
LABEL_7:

  return v3;
}

- (BOOL)isEqualToRealtimeWalletOrder:(id)a3
{
  id v4 = (id *)a3;
  int state = self->_state;
  if (state != [v4 state]) {
    goto LABEL_8;
  }
  identifier = self->_identifier;
  v7 = (NSString *)v4[2];
  if (identifier == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = identifier;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_8;
    }
  }
  walletOrderDictData = self->_walletOrderDictData;
  v12 = (NSData *)v4[3];
  if (walletOrderDictData == v12)
  {
  }
  else
  {
    uint64_t v13 = v12;
    v14 = walletOrderDictData;
    char v15 = [(NSData *)v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
LABEL_8:
      char v16 = 0;
      goto LABEL_14;
    }
  }
  v17 = self->_walletOrderData;
  v18 = v17;
  if (v17 == v4[4]) {
    char v16 = 1;
  }
  else {
    char v16 = -[NSData isEqual:](v17, "isEqual:");
  }

LABEL_14:
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGRealtimeWalletOrder *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGRealtimeWalletOrder *)self isEqualToRealtimeWalletOrder:v5];

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state = self->_state;
  id v5 = a3;
  [v5 encodeInt32:state forKey:@"state"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_walletOrderDictData forKey:@"walletOrderDictData"];
  [v5 encodeObject:self->_walletOrderData forKey:@"walletOrderData"];
}

- (SGRealtimeWalletOrder)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SGRealtimeWalletOrder;
  id v5 = [(SGRealtimeWalletOrder *)&v16 init];
  if (v5)
  {
    v5->_uint64_t state = [v4 decodeInt32ForKey:@"state"];
    BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"walletOrderDictData"];
    walletOrderDictData = v5->_walletOrderDictData;
    v5->_walletOrderDictData = (NSData *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"walletOrderData"];
    walletOrderData = v5->_walletOrderData;
    v5->_walletOrderData = (NSData *)v13;
  }
  return v5;
}

- (id)initRealtimeWalletOrderForState:(int)a3 identifier:(id)a4 walletOrderDictionary:(id)a5 walletOrderData:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_13:
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"SGRealtimeWalletOrder.m", 27, @"Invalid parameter not satisfying: %@", @"walletOrderDictionary" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_14;
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SGRealtimeWalletOrder.m", 26, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v13) {
    goto LABEL_13;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_14:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SGRealtimeWalletOrder.m", 28, @"Invalid parameter not satisfying: %@", @"walletOrderData" object file lineNumber description];

LABEL_4:
  id v28 = 0;
  char v15 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:0 error:&v28];
  id v16 = v28;
  if (v16)
  {
    v17 = sgLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138412546;
      v30 = v23;
      __int16 v31 = 2112;
      id v32 = v16;
      _os_log_error_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_ERROR, "%@: Error encountered while retrieving NSData from dictionary: %@", buf, 0x16u);
    }
    v18 = 0;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SGRealtimeWalletOrder;
    v19 = [(SGRealtimeWalletOrder *)&v27 init];
    p_isa = (id *)&v19->super.isa;
    if (v19)
    {
      v19->_uint64_t state = a3;
      objc_storeStrong((id *)&v19->_identifier, a4);
      objc_storeStrong(p_isa + 3, v15);
      objc_storeStrong(p_isa + 4, a6);
    }
    self = p_isa;
    v18 = self;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
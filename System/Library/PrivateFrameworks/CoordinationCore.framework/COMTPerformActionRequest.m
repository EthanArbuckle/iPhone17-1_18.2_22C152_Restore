@interface COMTPerformActionRequest
+ (BOOL)supportsSecureCoding;
- (COMTPerformActionRequest)initWithActions:(id)a3;
- (COMTPerformActionRequest)initWithCoder:(id)a3;
- (NSArray)actions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTPerformActionRequest

- (COMTPerformActionRequest)initWithActions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTPerformActionRequest;
  v5 = [(COMessageChannelRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;
  }
  return v5;
}

- (COMTPerformActionRequest)initWithCoder:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)COMTPerformActionRequest;
  v5 = [(COMessageChannelRequest *)&v23 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"PA"];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v17 = 0;
            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v15 = [v10 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v15;
  }
  v17 = v5;
LABEL_13:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMTPerformActionRequest;
  id v4 = a3;
  [(COMessageChannelRequest *)&v6 encodeWithCoder:v4];
  v5 = [(COMTPerformActionRequest *)self actions];
  [v4 encodeObject:v5 forKey:@"PA"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
}

@end
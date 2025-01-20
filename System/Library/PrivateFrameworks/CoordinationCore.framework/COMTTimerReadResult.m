@interface COMTTimerReadResult
+ (BOOL)supportsSecureCoding;
- (COMTTimerReadResult)initWithCoder:(id)a3;
- (COMTTimerReadResult)initWithTimers:(id)a3 actionIdentifier:(id)a4;
- (NSArray)timers;
- (void)encodeWithCoder:(id)a3;
@end

@implementation COMTTimerReadResult

- (COMTTimerReadResult)initWithTimers:(id)a3 actionIdentifier:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTTimerReadResult;
  v7 = [(COMTResult *)&v11 initWithActionIdentifier:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    timers = v7->_timers;
    v7->_timers = (NSArray *)v8;
  }
  return v7;
}

- (COMTTimerReadResult)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)COMTTimerReadResult;
  v5 = [(COMTResult *)&v22 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"TRA"];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v10 = v9;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v16 = 0;
            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    timers = v5->_timers;
    v5->_timers = v10;
  }
  v16 = v5;
LABEL_13:

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)COMTTimerReadResult;
  id v4 = a3;
  [(COMTResult *)&v6 encodeWithCoder:v4];
  v5 = [(COMTTimerReadResult *)self timers];
  [v4 encodeObject:v5 forKey:@"TRA"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)timers
{
  return self->_timers;
}

- (void).cxx_destruct
{
}

@end
@interface LACDTORatchetStateComposite
+ (BOOL)supportsSecureCoding;
+ (id)nullInstance;
- (BOOL)isEqual:(id)a3;
- (LACDTOBiometryWatchdogPack)watchdogs;
- (LACDTOGracePeriodState)gracePeriodState;
- (LACDTORatchetState)ratchetState;
- (LACDTORatchetStateComposite)initWithCoder:(id)a3;
- (LACDTORatchetStateComposite)initWithRatchetState:(id)a3 gracePeriodState:(id)a4 watchdogs:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LACDTORatchetStateComposite

- (LACDTORatchetStateComposite)initWithRatchetState:(id)a3 gracePeriodState:(id)a4 watchdogs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACDTORatchetStateComposite;
  v12 = [(LACDTORatchetStateComposite *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_ratchetState, a3);
    objc_storeStrong((id *)&v13->_gracePeriodState, a4);
    objc_storeStrong((id *)&v13->_watchdogs, a5);
  }

  return v13;
}

+ (id)nullInstance
{
  v2 = [LACDTORatchetStateComposite alloc];
  v3 = +[LACDTORatchetState nullInstance];
  v4 = +[LACDTOGracePeriodState nullInstance];
  v5 = +[LACDTOBiometryWatchdogPack nullInstance];
  v6 = [(LACDTORatchetStateComposite *)v2 initWithRatchetState:v3 gracePeriodState:v4 watchdogs:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LACDTORatchetStateComposite *)self ratchetState];
  v6 = NSStringFromSelector(sel_ratchetState);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(LACDTORatchetStateComposite *)self gracePeriodState];
  v8 = NSStringFromSelector(sel_gracePeriodState);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(LACDTORatchetStateComposite *)self watchdogs];
  id v9 = NSStringFromSelector(sel_watchdogs);
  [v4 encodeObject:v10 forKey:v9];
}

- (LACDTORatchetStateComposite)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_ratchetState);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_gracePeriodState);
  id v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_watchdogs);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  v14 = [(LACDTORatchetStateComposite *)self initWithRatchetState:v7 gracePeriodState:v10 watchdogs:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 ratchetState];
    uint64_t v7 = [(LACDTORatchetStateComposite *)self ratchetState];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      uint64_t v8 = (void *)v7;
      id v9 = [v5 ratchetState];
      id v10 = [(LACDTORatchetStateComposite *)self ratchetState];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [v5 gracePeriodState];
    uint64_t v14 = [(LACDTORatchetStateComposite *)self gracePeriodState];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      objc_super v15 = (void *)v14;
      v16 = [v5 gracePeriodState];
      v17 = [(LACDTORatchetStateComposite *)self gracePeriodState];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [v5 watchdogs];
    uint64_t v20 = [(LACDTORatchetStateComposite *)self watchdogs];
    if (v19 == (void *)v20)
    {
      char v12 = 1;
      v21 = v19;
    }
    else
    {
      v21 = (void *)v20;
      v22 = [v5 watchdogs];
      v23 = [(LACDTORatchetStateComposite *)self watchdogs];
      char v12 = [v22 isEqual:v23];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)description
{
  v18[3] = *MEMORY[0x263EF8340];
  v17 = NSString;
  uint64_t v3 = objc_opt_class();
  id v4 = NSString;
  id v5 = [(LACDTORatchetStateComposite *)self ratchetState];
  v6 = [v4 stringWithFormat:@"ratchetState: %@", v5];
  v18[0] = v6;
  uint64_t v7 = NSString;
  uint64_t v8 = [(LACDTORatchetStateComposite *)self gracePeriodState];
  id v9 = [v7 stringWithFormat:@"gracePeriodState: %@", v8];
  v18[1] = v9;
  id v10 = NSString;
  int v11 = [(LACDTORatchetStateComposite *)self watchdogs];
  char v12 = [v10 stringWithFormat:@"watchdogs: %@", v11];
  v18[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  uint64_t v14 = [v13 componentsJoinedByString:@"; "];
  objc_super v15 = [v17 stringWithFormat:@"<%@ %p; %@>", v3, self, v14];

  return v15;
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (LACDTOGracePeriodState)gracePeriodState
{
  return self->_gracePeriodState;
}

- (LACDTOBiometryWatchdogPack)watchdogs
{
  return self->_watchdogs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogs, 0);
  objc_storeStrong((id *)&self->_gracePeriodState, 0);
  objc_storeStrong((id *)&self->_ratchetState, 0);
}

@end
@interface HKStateMachineState
- (BOOL)isEqual:(id)a3;
- (HKStateMachineState)init;
- (HKStateMachineState)initWithIndex:(int64_t)a3 label:(id)a4;
- (NSDictionary)incomingTransitions;
- (NSDictionary)outgoingTransitions;
- (NSString)label;
- (id)description;
- (int64_t)index;
- (void)setIncomingTransitions:(id)a3;
- (void)setOutgoingTransitions:(id)a3;
@end

@implementation HKStateMachineState

- (HKStateMachineState)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKStateMachineState)initWithIndex:(int64_t)a3 label:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKStateMachineState;
  v7 = [(HKStateMachineState *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_index = a3;
    uint64_t v9 = [v6 copy];
    label = v8->_label;
    v8->_label = (NSString *)v9;
  }
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@(%ld)", self->_label, self->_index];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_index == v4[1]
    && [(NSString *)self->_label isEqualToString:v4[2]];

  return v5;
}

- (int64_t)index
{
  return self->_index;
}

- (NSString)label
{
  return self->_label;
}

- (NSDictionary)incomingTransitions
{
  return self->_incomingTransitions;
}

- (void)setIncomingTransitions:(id)a3
{
}

- (NSDictionary)outgoingTransitions
{
  return self->_outgoingTransitions;
}

- (void)setOutgoingTransitions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingTransitions, 0);
  objc_storeStrong((id *)&self->_incomingTransitions, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end
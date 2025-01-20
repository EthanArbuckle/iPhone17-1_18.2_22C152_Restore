@interface CNAtomicToggle
- (BOOL)isEqual:(id)a3;
- (BOOL)trySetState:(BOOL)a3;
- (CNAtomicToggle)init;
- (CNAtomicToggle)initWithState:(BOOL)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation CNAtomicToggle

- (CNAtomicToggle)init
{
  return [(CNAtomicToggle *)self initWithState:0];
}

- (CNAtomicToggle)initWithState:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNAtomicToggle;
  v4 = [(CNAtomicToggle *)&v8 init];
  v5 = v4;
  if (v4)
  {
    atomic_store(a3, (unsigned __int8 *)&v4->_state);
    v6 = v4;
  }

  return v5;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_state);
  id v5 = (id)[v3 appendName:@"state" BOOLValue:v4 & 1];
  v6 = [v3 build];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 v4 = (CNAtomicToggle *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_state);
      unsigned __int8 v6 = atomic_load((unsigned __int8 *)&v4->_state);
      char v7 = ((v5 & 1) == 0) ^ v6;
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7 & 1;
}

- (unint64_t)hash
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_state);
  return (v2 & 1) + 527;
}

- (BOOL)trySetState:(BOOL)a3
{
  BOOL v3 = !a3;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_state, (unsigned __int8 *)&v3, a3);
  return v3 == !a3;
}

@end
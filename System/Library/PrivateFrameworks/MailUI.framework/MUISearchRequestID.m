@interface MUISearchRequestID
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToID:(id)a3;
- (MUISearchRequestID)init;
- (id)description;
- (unint64_t)hash;
@end

@implementation MUISearchRequestID

- (MUISearchRequestID)init
{
  v3.receiver = self;
  v3.super_class = (Class)MUISearchRequestID;
  result = [(MUISearchRequestID *)&v3 init];
  if (result) {
    result->_underlying = atomic_fetch_add(init_next, 1u);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(MUISearchRequestID *)self isEqualToID:v4];

  return v5;
}

- (BOOL)isEqualToID:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self) {
    unsigned int underlying = self->_underlying;
  }
  else {
    unsigned int underlying = 0;
  }
  return underlying == *((_DWORD *)a3 + 2);
}

- (unint64_t)hash
{
  if (self) {
    return *(unsigned int *)(self + 8);
  }
  return self;
}

- (id)description
{
  unsigned int underlying = self;
  if (self) {
    unsigned int underlying = (MUISearchRequestID *)self->_underlying;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%u", underlying);
}

@end
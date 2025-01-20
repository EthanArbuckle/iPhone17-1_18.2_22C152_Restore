@interface DADeviceRepresentation
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (DADeviceDelegate)delegate;
- (DADeviceRepresentation)initWithSerialNumber:(id)a3 isLocal:(BOOL)a4 attributes:(id)a5;
- (DADeviceState)state;
- (NSString)description;
- (unint64_t)hash;
- (void)setDelegate:(id)a3;
- (void)setLocal:(BOOL)a3;
- (void)setState:(id)a3;
@end

@implementation DADeviceRepresentation

- (DADeviceRepresentation)initWithSerialNumber:(id)a3 isLocal:(BOOL)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DADeviceRepresentation;
  v10 = [(DADeviceRepresentation *)&v16 init];
  if (v10)
  {
    v11 = &__NSDictionary0__struct;
    if (v9) {
      v11 = v9;
    }
    id v12 = v11;

    v10->_local = a4;
    v13 = [[DADeviceState alloc] initWithSerialNumber:v8 attributes:v12];
    state = v10->_state;
    v10->_state = v13;

    id v9 = v12;
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(DADeviceRepresentation *)self state];
  v3 = [v2 serialNumber];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___DADevice])
  {
    v5 = [(DADeviceRepresentation *)self state];
    v6 = [v5 serialNumber];
    v7 = [v4 state];
    id v8 = [v7 serialNumber];
    unsigned __int8 v9 = [v6 isEqualToString:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(DADeviceRepresentation *)self state];
  v6 = [v5 serialNumber];
  v7 = +[NSString stringWithFormat:@"<%@; %p: %@>", v4, self, v6];

  return (NSString *)v7;
}

- (DADeviceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (DADeviceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DADeviceState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (BOOL)isLocal
{
  return self->_local;
}

- (void)setLocal:(BOOL)a3
{
  self->_local = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end
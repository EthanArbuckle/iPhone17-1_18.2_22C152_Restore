@interface _AFDeviceRequestHandlingRecordMutation
- (BOOL)isDirty;
- (_AFDeviceRequestHandlingRecordMutation)initWithBase:(id)a3;
- (id)getRequestID;
- (unint64_t)getDeviceRoles;
- (void)setDeviceRoles:(unint64_t)a3;
- (void)setRequestID:(id)a3;
@end

@implementation _AFDeviceRequestHandlingRecordMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setDeviceRoles:(unint64_t)a3
{
  self->_deviceRoles = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getDeviceRoles
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_deviceRoles;
  }
  else {
    return [(AFDeviceRequestHandlingRecord *)self->_base deviceRoles];
  }
}

- (void)setRequestID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getRequestID
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_requestID;
  }
  else
  {
    v2 = [(AFDeviceRequestHandlingRecord *)self->_base requestID];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFDeviceRequestHandlingRecordMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFDeviceRequestHandlingRecordMutation;
  v6 = [(_AFDeviceRequestHandlingRecordMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
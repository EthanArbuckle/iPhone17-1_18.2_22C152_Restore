@interface _AFDeviceContextHistoryConfigurationMutation
- (BOOL)getKeepsHistory;
- (BOOL)isDirty;
- (_AFDeviceContextHistoryConfigurationMutation)initWithBase:(id)a3;
- (unint64_t)getHistoryBufferSize;
- (void)setHistoryBufferSize:(unint64_t)a3;
- (void)setKeepsHistory:(BOOL)a3;
@end

@implementation _AFDeviceContextHistoryConfigurationMutation

- (void).cxx_destruct
{
}

- (void)setHistoryBufferSize:(unint64_t)a3
{
  self->_historyBufferSize = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getHistoryBufferSize
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_historyBufferSize;
  }
  else {
    return [(AFDeviceContextHistoryConfiguration *)self->_base historyBufferSize];
  }
}

- (void)setKeepsHistory:(BOOL)a3
{
  self->_keepsHistory = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (BOOL)getKeepsHistory
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_keepsHistory;
  }
  else {
    return [(AFDeviceContextHistoryConfiguration *)self->_base keepsHistory];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFDeviceContextHistoryConfigurationMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFDeviceContextHistoryConfigurationMutation;
  v6 = [(_AFDeviceContextHistoryConfigurationMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
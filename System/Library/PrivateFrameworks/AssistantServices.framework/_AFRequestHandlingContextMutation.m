@interface _AFRequestHandlingContextMutation
- (BOOL)isDirty;
- (_AFRequestHandlingContextMutation)initWithBase:(id)a3;
- (id)getInputAssistantID;
- (id)getInputDeviceID;
- (id)getRequestID;
- (void)setInputAssistantID:(id)a3;
- (void)setInputDeviceID:(id)a3;
- (void)setRequestID:(id)a3;
@end

@implementation _AFRequestHandlingContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputAssistantID, 0);
  objc_storeStrong((id *)&self->_inputDeviceID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setInputAssistantID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (id)getInputAssistantID
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_inputAssistantID;
  }
  else
  {
    v2 = [(AFRequestHandlingContext *)self->_base inputAssistantID];
  }
  return v2;
}

- (void)setInputDeviceID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getInputDeviceID
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_inputDeviceID;
  }
  else
  {
    v2 = [(AFRequestHandlingContext *)self->_base inputDeviceID];
  }
  return v2;
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
    v2 = [(AFRequestHandlingContext *)self->_base requestID];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFRequestHandlingContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFRequestHandlingContextMutation;
  v6 = [(_AFRequestHandlingContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
@interface _AFSiriActivationContextMutation
- (BOOL)isDirty;
- (_AFSiriActivationContextMutation)initWithBase:(id)a3;
- (id)getDeviceID;
- (id)getUserInfo;
- (int64_t)getEvent;
- (int64_t)getSource;
- (unint64_t)getOptions;
- (unint64_t)getTimestamp;
- (void)setDeviceID:(id)a3;
- (void)setEvent:(int64_t)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setSource:(int64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _AFSiriActivationContextMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setUserInfo:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x41u;
}

- (id)getUserInfo
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_userInfo;
  }
  else
  {
    v2 = [(AFSiriActivationContext *)self->_base userInfo];
  }
  return v2;
}

- (void)setDeviceID:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getDeviceID
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_deviceID;
  }
  else
  {
    v2 = [(AFSiriActivationContext *)self->_base deviceID];
  }
  return v2;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (unint64_t)getOptions
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
    return self->_options;
  }
  else {
    return [(AFSiriActivationContext *)self->_base options];
  }
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (int64_t)getEvent
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_event;
  }
  else {
    return [(AFSiriActivationContext *)self->_base event];
  }
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (int64_t)getSource
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
    return self->_source;
  }
  else {
    return [(AFSiriActivationContext *)self->_base source];
  }
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getTimestamp
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0) {
    return self->_timestamp;
  }
  else {
    return [(AFSiriActivationContext *)self->_base timestamp];
  }
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFSiriActivationContextMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFSiriActivationContextMutation;
  v6 = [(_AFSiriActivationContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
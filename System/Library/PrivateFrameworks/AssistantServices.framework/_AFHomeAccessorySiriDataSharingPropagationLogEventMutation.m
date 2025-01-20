@interface _AFHomeAccessorySiriDataSharingPropagationLogEventMutation
- (BOOL)isDirty;
- (_AFHomeAccessorySiriDataSharingPropagationLogEventMutation)initWithBase:(id)a3;
- (id)getAccessoryIdentifier;
- (id)getAssociatedChangeLogEventIdentifier;
- (id)getDate;
- (id)getPropagationEventReason;
- (int64_t)getPropagationEvent;
- (void)setAccessoryIdentifier:(id)a3;
- (void)setAssociatedChangeLogEventIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setPropagationEvent:(int64_t)a3;
- (void)setPropagationEventReason:(id)a3;
@end

@implementation _AFHomeAccessorySiriDataSharingPropagationLogEventMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedChangeLogEventIdentifier, 0);
  objc_storeStrong((id *)&self->_propagationEventReason, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setAssociatedChangeLogEventIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x21u;
}

- (id)getAssociatedChangeLogEventIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_associatedChangeLogEventIdentifier;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingPropagationLogEvent *)self->_base associatedChangeLogEventIdentifier];
  }
  return v2;
}

- (void)setPropagationEventReason:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (id)getPropagationEventReason
{
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_propagationEventReason;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingPropagationLogEvent *)self->_base propagationEventReason];
  }
  return v2;
}

- (void)setPropagationEvent:(int64_t)a3
{
  self->_propagationEvent = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (int64_t)getPropagationEvent
{
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0) {
    return self->_propagationEvent;
  }
  else {
    return [(AFHomeAccessorySiriDataSharingPropagationLogEvent *)self->_base propagationEvent];
  }
}

- (void)setAccessoryIdentifier:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (id)getAccessoryIdentifier
{
  if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_accessoryIdentifier;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingPropagationLogEvent *)self->_base accessoryIdentifier];
  }
  return v2;
}

- (void)setDate:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (id)getDate
{
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingPropagationLogEvent *)self->_base date];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(unsigned char *)&self->_mutationFlags & 1;
}

- (_AFHomeAccessorySiriDataSharingPropagationLogEventMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAccessorySiriDataSharingPropagationLogEventMutation;
  v6 = [(_AFHomeAccessorySiriDataSharingPropagationLogEventMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end
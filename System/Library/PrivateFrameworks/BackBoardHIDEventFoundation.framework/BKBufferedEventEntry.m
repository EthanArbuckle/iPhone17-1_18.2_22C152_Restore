@interface BKBufferedEventEntry
- (BKHIDEventDeliverySequence)sequence;
- (BKHIDEventSenderInfo)sender;
- (__IOHIDEvent)event;
- (id)additionalContext;
- (void)invalidate;
- (void)setAdditionalContext:(id)a3;
- (void)setEvent:(__IOHIDEvent *)a3;
- (void)setSender:(id)a3;
- (void)setSequence:(id)a3;
@end

@implementation BKBufferedEventEntry

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalContext, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
  objc_storeStrong((id *)&self->_sender, 0);

  objc_storeStrong(&self->_rawEvent, 0);
}

- (void)setAdditionalContext:(id)a3
{
}

- (id)additionalContext
{
  return self->_additionalContext;
}

- (void)setSequence:(id)a3
{
}

- (BKHIDEventDeliverySequence)sequence
{
  return self->_sequence;
}

- (void)setSender:(id)a3
{
}

- (BKHIDEventSenderInfo)sender
{
  return self->_sender;
}

- (void)invalidate
{
  sender = self->_sender;
  self->_sender = 0;

  sequence = self->_sequence;
  self->_sequence = 0;

  id additionalContext = self->_additionalContext;
  self->_id additionalContext = 0;

  id rawEvent = self->_rawEvent;
  self->_id rawEvent = 0;
}

- (void)setEvent:(__IOHIDEvent *)a3
{
}

- (__IOHIDEvent)event
{
  return (__IOHIDEvent *)self->_rawEvent;
}

@end
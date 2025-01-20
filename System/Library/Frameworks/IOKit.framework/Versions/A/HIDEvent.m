@interface HIDEvent
- (HIDEvent)initWithSize:(unint64_t)a3 type:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6;
- (id)description;
- (void)dealloc;
@end

@implementation HIDEvent

- (void)dealloc
{
  eventData = self->_event.eventData;
  if (eventData) {
    free(eventData);
  }
  children = self->_event.children;
  if (children)
  {
    CFIndex Count = CFArrayGetCount(children);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(self->_event.children, i);
        if (ValueAtIndex) {
          ValueAtIndex[10] = 0;
        }
      }
    }
    CFRelease(self->_event.children);
  }
  attributeData = self->_event.attributeData;
  if (attributeData) {
    free(attributeData);
  }
  sender = self->_event.sender;
  if (sender) {
    CFRelease(sender);
  }
  attachments = self->_event.attachments;
  if (attachments) {
    CFRelease(attachments);
  }
  v12.receiver = self;
  v12.super_class = (Class)HIDEvent;
  [(HIDEvent *)&v12 dealloc];
}

- (HIDEvent)initWithSize:(unint64_t)a3 type:(unsigned int)a4 timestamp:(unint64_t)a5 options:(unsigned int)a6
{
  v13.receiver = self;
  v13.super_class = (Class)HIDEvent;
  v10 = [(HIDEvent *)&v13 init];
  result = 0;
  if (a3 >= 0x10 && v10)
  {
    result = (HIDEvent *)malloc_type_malloc(a3, 0xDB656780uLL);
    v10->_event.eventData = (IOHIDEventData *)result;
    if (result)
    {
      bzero(result, a3);
      v10->_event.timeStamp = a5;
      v10->_event.options = a6;
      v10->_event.typeMask = 1 << a4;
      eventData = v10->_event.eventData;
      *(_DWORD *)eventData = a3;
      *((_DWORD *)eventData + 1) = a4;
      *((_DWORD *)eventData + 2) = a6;
      return v10;
    }
  }
  return result;
}

- (id)description
{
  v2 = IOHIDEventCopyDescription((uint64_t)self);

  return v2;
}

@end
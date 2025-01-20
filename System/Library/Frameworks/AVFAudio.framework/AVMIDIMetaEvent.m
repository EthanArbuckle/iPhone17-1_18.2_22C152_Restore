@interface AVMIDIMetaEvent
- (AVMIDIMetaEvent)initWithMetaEvent:(MIDIMetaEvent *)a3;
- (AVMIDIMetaEvent)initWithType:(AVMIDIMetaEventType)type data:(NSData *)data;
- (AVMIDIMetaEventType)type;
- (MIDIMetaEvent)metaEvent;
- (void)dealloc;
@end

@implementation AVMIDIMetaEvent

- (MIDIMetaEvent)metaEvent
{
  return self->_event;
}

- (void)dealloc
{
  free(self->_event);
  v3.receiver = self;
  v3.super_class = (Class)AVMIDIMetaEvent;
  [(AVMIDIMetaEvent *)&v3 dealloc];
}

- (AVMIDIMetaEvent)initWithMetaEvent:(MIDIMetaEvent *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVMIDIMetaEvent;
  v4 = [(AVMIDIMetaEvent *)&v7 init];
  if (v4)
  {
    v5 = (char *)malloc_type_malloc(a3->dataLength + 11, 0x85DD1E1FuLL);
    char *v5 = a3->metaEventType;
    v5[3] = 0;
    *(_WORD *)(v5 + 1) = 0;
    *((_DWORD *)v5 + 1) = a3->dataLength;
    memcpy(v5 + 8, a3->data, a3->dataLength);
    v4->_event = (MIDIMetaEvent *)v5;
  }
  return v4;
}

- (AVMIDIMetaEventType)type
{
  return (unint64_t)self->_event->metaEventType;
}

- (AVMIDIMetaEvent)initWithType:(AVMIDIMetaEventType)type data:(NSData *)data
{
  char v4 = type;
  v6 = data;
  v11.receiver = self;
  v11.super_class = (Class)AVMIDIMetaEvent;
  objc_super v7 = [(AVMIDIMetaEvent *)&v11 init];
  if (v7)
  {
    unsigned int v8 = [(NSData *)v6 length];
    v9 = (char *)malloc_type_malloc(v8 + 11, 0x8113B206uLL);
    char *v9 = v4;
    v9[3] = 0;
    *(_WORD *)(v9 + 1) = 0;
    *((_DWORD *)v9 + 1) = v8;
    memcpy(v9 + 8, [(NSData *)v6 bytes], v8);
    v7->_event = (MIDIMetaEvent *)v9;
  }

  return v7;
}

@end
@interface AVAUPresetEvent
- (AUPresetEvent)event;
- (AVAUPresetEvent)initWithAUPresetEvent:(AUPresetEvent *)a3;
- (AVAUPresetEvent)initWithScope:(UInt32)scope element:(UInt32)element dictionary:(NSDictionary *)presetDictionary;
- (NSDictionary)presetDictionary;
- (UInt32)element;
- (UInt32)scope;
- (void)dealloc;
- (void)setElement:(UInt32)element;
- (void)setScope:(UInt32)scope;
@end

@implementation AVAUPresetEvent

- (AUPresetEvent)event
{
  return &self->_event;
}

- (void)dealloc
{
  CFPropertyListRef preset = self->_event.preset;
  if (preset) {
    CFRelease(preset);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAUPresetEvent;
  [(AVAUPresetEvent *)&v4 dealloc];
}

- (AVAUPresetEvent)initWithAUPresetEvent:(AUPresetEvent *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVAUPresetEvent;
  objc_super v4 = [(AVAUPresetEvent *)&v8 init];
  v5 = v4;
  if (v4)
  {
    *(void *)&v4->_event.scope = *(void *)&a3->scope;
    CFPropertyListRef preset = a3->preset;
    v5->_event.CFPropertyListRef preset = preset;
    CFRetain(preset);
  }
  return v5;
}

- (NSDictionary)presetDictionary
{
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_event.preset];
}

- (void)setElement:(UInt32)element
{
  self->_event.element = element;
}

- (UInt32)element
{
  return self->_event.element;
}

- (void)setScope:(UInt32)scope
{
  self->_event.scope = scope;
}

- (UInt32)scope
{
  return self->_event.scope;
}

- (AVAUPresetEvent)initWithScope:(UInt32)scope element:(UInt32)element dictionary:(NSDictionary *)presetDictionary
{
  objc_super v8 = presetDictionary;
  v12.receiver = self;
  v12.super_class = (Class)AVAUPresetEvent;
  v9 = [(AVAUPresetEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_event.scope = scope;
    v9->_event.element = element;
    v9->_event.CFPropertyListRef preset = (CFPropertyListRef)[(NSDictionary *)v8 copy];
  }

  return v10;
}

@end
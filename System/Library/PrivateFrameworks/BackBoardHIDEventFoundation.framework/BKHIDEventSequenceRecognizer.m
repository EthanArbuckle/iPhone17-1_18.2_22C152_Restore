@interface BKHIDEventSequenceRecognizer
+ (id)recognizerForEventDescriptor:(id)a3;
+ (id)recognizerForEventDescriptors:(id)a3;
- (BOOL)shouldConsumeEvents;
- (NSArray)descriptors;
- (int64_t)processEvent:(__IOHIDEvent *)a3 shouldConsume:(BOOL *)a4;
- (void)setShouldConsumeEvents:(BOOL)a3;
@end

@implementation BKHIDEventSequenceRecognizer

+ (id)recognizerForEventDescriptors:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

+ (id)recognizerForEventDescriptor:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v9[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (void).cxx_destruct
{
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setShouldConsumeEvents:(BOOL)a3
{
  self->_shouldConsumeEvents = a3;
}

- (BOOL)shouldConsumeEvents
{
  return self->_shouldConsumeEvents;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 shouldConsume:(BOOL *)a4
{
  v7 = [(NSArray *)self->_descriptors objectAtIndexedSubscript:self->_descriptorIndex];
  LODWORD(a3) = [v7 matchesHIDEvent:a3];

  unint64_t descriptorIndex = self->_descriptorIndex;
  if (a3)
  {
    self->_unint64_t descriptorIndex = ++descriptorIndex;
    if (self->_shouldConsumeEvents) {
      *a4 = 1;
    }
  }
  if (descriptorIndex < [(NSArray *)self->_descriptors count]) {
    return 0;
  }
  self->_unint64_t descriptorIndex = 0;
  return 1;
}

@end
@interface CSFCircularEventsCacheBuffer
- (CSFCircularEventsCacheBuffer)init;
- (NSMutableArray)eventsArray;
- (void)addEventToCacheBuffer:(id)a3;
- (void)clearBuffer;
@end

@implementation CSFCircularEventsCacheBuffer

- (void).cxx_destruct
{
}

- (NSMutableArray)eventsArray
{
  return self->_eventsArray;
}

- (void)clearBuffer
{
  self->_lastEventIndex = -1;
}

- (void)addEventToCacheBuffer:(id)a3
{
  if (a3) {
    [(NSMutableArray *)self->_eventsArray insertObject:a3 atIndex:(self->_lastEventIndex + 1) % 0x14uLL];
  }
}

- (CSFCircularEventsCacheBuffer)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSFCircularEventsCacheBuffer;
  v2 = [(CSFCircularEventsCacheBuffer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastEventIndex = -1;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
    eventsArray = v3->_eventsArray;
    v3->_eventsArray = (NSMutableArray *)v4;
  }
  return v3;
}

@end
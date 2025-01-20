@interface NSBlockObservationSink
- (NSBlockObservationSink)initWithBlock:(id)a3 tag:(int)a4;
- (void)_receiveBox:(id)a3;
- (void)dealloc;
@end

@implementation NSBlockObservationSink

- (NSBlockObservationSink)initWithBlock:(id)a3 tag:(int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSBlockObservationSink;
  v6 = [(NSBlockObservationSink *)&v8 init];
  if (v6)
  {
    v6->_block = (id)[a3 copy];
    v6->_tag = a4;
  }
  return v6;
}

- (void)_receiveBox:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int tag = self->_tag;
  if (*((_DWORD *)a3 + 6) == tag && tag != 3) {
    (*((void (**)(void))self->_block + 2))();
  }
  v7.receiver = self;
  v7.super_class = (Class)NSBlockObservationSink;
  [(NSBlockObservationSink *)&v7 _receiveBox:a3];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSBlockObservationSink;
  [(NSBlockObservationSink *)&v3 dealloc];
}

@end
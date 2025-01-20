@interface AXHARingBuffer
- (AXHARingBuffer)initWithCount:(unint64_t)a3;
- (id)content;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)reset;
@end

@implementation AXHARingBuffer

- (AXHARingBuffer)initWithCount:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AXHARingBuffer;
  v4 = [(AXHARingBuffer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_size = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v4->_size];
    bufferArray = v5->_bufferArray;
    v5->_bufferArray = (NSMutableArray *)v6;

    [(AXHARingBuffer *)v5 reset];
  }
  return v5;
}

- (unint64_t)count
{
  return self->_size;
}

- (void)addObject:(id)a3
{
  unint64_t head = self->_head;
  bufferArray = self->_bufferArray;
  id v6 = a3;
  unint64_t v7 = [(NSMutableArray *)bufferArray count];
  v8 = self->_bufferArray;
  if (head >= v7) {
    [(NSMutableArray *)v8 addObject:v6];
  }
  else {
    [(NSMutableArray *)v8 replaceObjectAtIndex:self->_head withObject:v6];
  }

  self->_unint64_t head = (self->_head + 1) % self->_size;
}

- (id)content
{
  unint64_t v3 = [(NSMutableArray *)self->_bufferArray count];
  bufferArray = self->_bufferArray;
  if (v3 >= self->_size)
  {
    id v6 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, self->_head);
    unint64_t v7 = [(NSMutableArray *)bufferArray objectsAtIndexes:v6];

    v8 = self->_bufferArray;
    objc_super v9 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", self->_head, self->_size - self->_head);
    v10 = [(NSMutableArray *)v8 objectsAtIndexes:v9];

    v11 = [v10 arrayByAddingObjectsFromArray:v7];
    v5 = (void *)[v11 copy];
  }
  else
  {
    v5 = (void *)[(NSMutableArray *)self->_bufferArray copy];
  }
  return v5;
}

- (void)reset
{
  unint64_t v3 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:self->_size];
  bufferArray = self->_bufferArray;
  self->_bufferArray = v3;

  self->_unint64_t head = 0;
}

- (void).cxx_destruct
{
}

@end
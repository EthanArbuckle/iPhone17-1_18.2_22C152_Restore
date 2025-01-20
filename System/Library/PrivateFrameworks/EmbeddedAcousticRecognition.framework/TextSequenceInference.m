@interface TextSequenceInference
- (TextSequenceInference)init;
- (TextSequenceInference)initWithLength:(unint64_t)a3;
- (TextSequenceInference)initWithLength:(unint64_t)a3 BOS:(unint64_t)a4;
- (id)sequence;
- (id)target;
- (void)addWordWithInputId:(unint64_t)a3;
- (void)resetWithBOS:(unint64_t)a3;
@end

@implementation TextSequenceInference

- (TextSequenceInference)init
{
  return 0;
}

- (TextSequenceInference)initWithLength:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TextSequenceInference;
  v4 = [(TextSequenceInference *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    sequence = v4->_sequence;
    v4->_sequence = (NSMutableArray *)v5;
  }
  return v4;
}

- (TextSequenceInference)initWithLength:(unint64_t)a3 BOS:(unint64_t)a4
{
  v6 = -[TextSequenceInference initWithLength:](self, "initWithLength:");
  if (v6)
  {
    for (; a3; --a3)
    {
      sequence = v6->_sequence;
      objc_super v8 = [NSNumber numberWithUnsignedLong:a4];
      [(NSMutableArray *)sequence addObject:v8];
    }
    uint64_t v9 = [NSNumber numberWithUnsignedLong:a4];
    target = v6->_target;
    v6->_target = (NSNumber *)v9;
  }
  return v6;
}

- (void)resetWithBOS:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_sequence count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [NSNumber numberWithUnsignedLong:a3];
      [(NSMutableArray *)self->_sequence setObject:v6 atIndexedSubscript:v5];

      ++v5;
    }
    while (v5 < [(NSMutableArray *)self->_sequence count]);
  }
  v7 = [NSNumber numberWithUnsignedLong:a3];
  target = self->_target;
  self->_target = v7;
}

- (void)addWordWithInputId:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_sequence count])
  {
    [(NSMutableArray *)self->_sequence addObject:self->_target];
    [(NSMutableArray *)self->_sequence removeObjectAtIndex:0];
    unint64_t v5 = [NSNumber numberWithUnsignedLong:a3];
    target = self->_target;
    self->_target = v5;
  }
}

- (id)sequence
{
  return self->_sequence;
}

- (id)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
@interface SMTTextSequenceInference
- (SMTTextSequenceInference)init;
- (SMTTextSequenceInference)initWithLength:(unint64_t)a3;
- (SMTTextSequenceInference)initWithLength:(unint64_t)a3 BOS:(unint64_t)a4;
- (id)sequence;
- (id)target;
- (void)addWordWithInputId:(unint64_t)a3;
- (void)resetWithBOS:(unint64_t)a3;
@end

@implementation SMTTextSequenceInference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

- (id)target
{
  return self->_target;
}

- (id)sequence
{
  return self->_sequence;
}

- (void)addWordWithInputId:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_sequence count])
  {
    [(NSMutableArray *)self->_sequence addObject:self->_target];
    [(NSMutableArray *)self->_sequence removeObjectAtIndex:0];
    self->_target = +[NSNumber numberWithUnsignedLong:a3];
    _objc_release_x1();
  }
}

- (void)resetWithBOS:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_sequence count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = +[NSNumber numberWithUnsignedLong:a3];
      [(NSMutableArray *)self->_sequence setObject:v6 atIndexedSubscript:v5];

      ++v5;
    }
    while (v5 < (unint64_t)[(NSMutableArray *)self->_sequence count]);
  }
  self->_target = +[NSNumber numberWithUnsignedLong:a3];
  _objc_release_x1();
}

- (SMTTextSequenceInference)initWithLength:(unint64_t)a3 BOS:(unint64_t)a4
{
  v6 = -[SMTTextSequenceInference initWithLength:](self, "initWithLength:");
  if (v6)
  {
    for (; a3; --a3)
    {
      sequence = v6->_sequence;
      v8 = +[NSNumber numberWithUnsignedLong:a4];
      [(NSMutableArray *)sequence addObject:v8];
    }
    uint64_t v9 = +[NSNumber numberWithUnsignedLong:a4];
    target = v6->_target;
    v6->_target = (NSNumber *)v9;
  }
  return v6;
}

- (SMTTextSequenceInference)initWithLength:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SMTTextSequenceInference;
  v4 = [(SMTTextSequenceInference *)&v8 init];
  if (v4)
  {
    unint64_t v5 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:a3];
    sequence = v4->_sequence;
    v4->_sequence = v5;
  }
  return v4;
}

- (SMTTextSequenceInference)init
{
  return 0;
}

@end
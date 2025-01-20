@interface TextSequenceTrain
- (TextSequenceTrain)init;
- (TextSequenceTrain)initWithLength:(unint64_t)a3;
- (id)mask;
- (id)sequence;
- (id)target;
- (void)addWordWithInputId:(unint64_t)a3;
- (void)addWordWithInputId:(unint64_t)a3 target:(unint64_t)a4 mask:(unint64_t)a5;
@end

@implementation TextSequenceTrain

- (TextSequenceTrain)init
{
  return 0;
}

- (TextSequenceTrain)initWithLength:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TextSequenceTrain;
  v4 = [(TextSequenceTrain *)&v12 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    sequence = v4->_sequence;
    v4->_sequence = (NSMutableArray *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    target = v4->_target;
    v4->_target = (NSMutableArray *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    mask = v4->_mask;
    v4->_mask = (NSMutableArray *)v9;
  }
  return v4;
}

- (void)addWordWithInputId:(unint64_t)a3
{
  sequence = self->_sequence;
  id v4 = [NSNumber numberWithUnsignedLong:a3];
  -[NSMutableArray addObject:](sequence, "addObject:");
}

- (void)addWordWithInputId:(unint64_t)a3 target:(unint64_t)a4 mask:(unint64_t)a5
{
  [(TextSequenceTrain *)self addWordWithInputId:a3];
  target = self->_target;
  id v10 = [NSNumber numberWithUnsignedLong:a4];
  -[NSMutableArray addObject:](target, "addObject:");

  mask = self->_mask;
  id v11 = [NSNumber numberWithUnsignedLong:a5];
  -[NSMutableArray addObject:](mask, "addObject:");
}

- (id)sequence
{
  return self->_sequence;
}

- (id)target
{
  return self->_target;
}

- (id)mask
{
  return self->_mask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
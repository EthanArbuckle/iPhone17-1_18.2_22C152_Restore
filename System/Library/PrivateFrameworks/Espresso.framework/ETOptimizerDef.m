@interface ETOptimizerDef
- (ETOptimizerDef)init;
- (unsigned)batch_size;
- (void)setBatch_size:(unsigned int)a3;
@end

@implementation ETOptimizerDef

- (void)setBatch_size:(unsigned int)a3
{
  self->_batch_size = a3;
}

- (unsigned)batch_size
{
  return self->_batch_size;
}

- (ETOptimizerDef)init
{
  v4.receiver = self;
  v4.super_class = (Class)ETOptimizerDef;
  v2 = [(ETOptimizerDef *)&v4 init];
  [(ETOptimizerDef *)v2 setBatch_size:1];
  return v2;
}

@end
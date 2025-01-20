@interface ETOptimizerDefSGD
- (ETOptimizerDefSGD)init;
- (float)lr;
- (float)lr_decay_epoch;
- (float)momentum;
- (float)weight_decay;
- (void)setLr:(float)a3;
- (void)setLr_decay_epoch:(float)a3;
- (void)setMomentum:(float)a3;
- (void)setWeight_decay:(float)a3;
@end

@implementation ETOptimizerDefSGD

- (void)setWeight_decay:(float)a3
{
  self->_momentum = a3;
}

- (float)weight_decay
{
  return self->_momentum;
}

- (void)setMomentum:(float)a3
{
  self->_lr_decay_epoch = a3;
}

- (float)momentum
{
  return self->_lr_decay_epoch;
}

- (void)setLr_decay_epoch:(float)a3
{
  self->_lr = a3;
}

- (float)lr_decay_epoch
{
  return self->_lr;
}

- (void)setLr:(float)a3
{
  *((float *)&self->super._batch_size + 1) = a3;
}

- (float)lr
{
  return *((float *)&self->super._batch_size + 1);
}

- (ETOptimizerDefSGD)init
{
  v8.receiver = self;
  v8.super_class = (Class)ETOptimizerDefSGD;
  v2 = [(ETOptimizerDef *)&v8 init];
  LODWORD(v3) = 1028443341;
  [(ETOptimizerDefSGD *)v2 setLr:v3];
  LODWORD(v4) = 1064514355;
  [(ETOptimizerDefSGD *)v2 setLr_decay_epoch:v4];
  LODWORD(v5) = 1063675494;
  [(ETOptimizerDefSGD *)v2 setMomentum:v5];
  LODWORD(v6) = 981668463;
  [(ETOptimizerDefSGD *)v2 setWeight_decay:v6];
  return v2;
}

@end
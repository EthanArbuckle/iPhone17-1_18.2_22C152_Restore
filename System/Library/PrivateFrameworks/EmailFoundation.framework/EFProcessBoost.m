@interface EFProcessBoost
- (EFProcessBoost)initWithBoost:(id)a3;
- (void)drop;
@end

@implementation EFProcessBoost

- (EFProcessBoost)initWithBoost:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFProcessBoost;
  v5 = [(EFProcessBoost *)&v9 init];
  if (v5)
  {
    v6 = _Block_copy(v4);
    id boost = v5->_boost;
    v5->_id boost = v6;
  }
  return v5;
}

- (void)drop
{
  id boost = (void (**)(id, SEL))self->_boost;
  if (boost)
  {
    boost[2](boost, a2);
    id boost = (void (**)(id, SEL))self->_boost;
  }
  self->_id boost = 0;
}

- (void).cxx_destruct
{
}

@end
@interface DABabysitterRegistrationToken
- (DABabysitterRegistrationToken)initWithBlock:(id)a3;
- (id)unregisterBlock;
- (void)dealloc;
- (void)setUnregisterBlock:(id)a3;
@end

@implementation DABabysitterRegistrationToken

- (DABabysitterRegistrationToken)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DABabysitterRegistrationToken;
  v5 = [(DABabysitterRegistrationToken *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1C87CCD40](v4);
    id unregisterBlock = v5->_unregisterBlock;
    v5->_id unregisterBlock = (id)v6;
  }
  return v5;
}

- (void)dealloc
{
  id unregisterBlock = self->_unregisterBlock;
  if (unregisterBlock)
  {
    id v4 = (void (**)(void))MEMORY[0x1C87CCD40](unregisterBlock, a2);
    id v5 = self->_unregisterBlock;
    self->_id unregisterBlock = 0;

    v4[2](v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)DABabysitterRegistrationToken;
  [(DABabysitterRegistrationToken *)&v6 dealloc];
}

- (id)unregisterBlock
{
  return self->_unregisterBlock;
}

- (void)setUnregisterBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
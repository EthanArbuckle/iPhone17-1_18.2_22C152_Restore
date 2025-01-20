@interface MRUCoordinatedUpdate
- (MRUCoordinatedUpdate)initWithUpdate:(id)a3 completion:(id)a4;
- (id)completion;
- (id)update;
- (void)complete;
- (void)process;
@end

@implementation MRUCoordinatedUpdate

- (MRUCoordinatedUpdate)initWithUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRUCoordinatedUpdate;
  v8 = [(MRUCoordinatedUpdate *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id update = v8->_update;
    v8->_id update = (id)v9;

    uint64_t v11 = [v7 copy];
    id completion = v8->_completion;
    v8->_id completion = (id)v11;
  }
  return v8;
}

- (void)process
{
  id update = (void (**)(void))self->_update;
  if (update) {
    update[2]();
  }
}

- (void)complete
{
  id completion = (void (**)(void))self->_completion;
  if (completion) {
    completion[2]();
  }
}

- (id)update
{
  return self->_update;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong(&self->_update, 0);
}

@end
@interface _BPSRemoveDuplicatesInner
- (_BPSRemoveDuplicatesInner)initWithDownstream:(id)a3 isDuplicate:(id)a4;
- (id)isDuplicate;
- (id)last;
- (id)receiveNewValue:(id)a3;
- (void)setLast:(id)a3;
@end

@implementation _BPSRemoveDuplicatesInner

- (_BPSRemoveDuplicatesInner)initWithDownstream:(id)a3 isDuplicate:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_BPSRemoveDuplicatesInner;
  v7 = [(BPSFilterProducer *)&v12 initWithDownstream:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    id isDuplicate = v7->_isDuplicate;
    v7->_id isDuplicate = (id)v8;

    id last = v7->_last;
    v7->_id last = 0;
  }
  return v7;
}

- (id)receiveNewValue:(id)a3
{
  id v5 = a3;
  if (self->_last && ((*((uint64_t (**)(void))self->_isDuplicate + 2))() & 1) != 0)
  {
    id v6 = 0;
  }
  else
  {
    objc_storeStrong(&self->_last, a3);
    id v6 = v5;
  }
  v7 = [[BPSPartialCompletion alloc] initWithState:1 value:v6 error:0];

  return v7;
}

- (id)isDuplicate
{
  return self->_isDuplicate;
}

- (id)last
{
  return self->_last;
}

- (void)setLast:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_last, 0);
  objc_storeStrong(&self->_isDuplicate, 0);
}

@end
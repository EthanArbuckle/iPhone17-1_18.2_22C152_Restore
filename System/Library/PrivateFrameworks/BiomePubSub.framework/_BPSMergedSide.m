@interface _BPSMergedSide
- (_BPSMerged)merger;
- (_BPSMergedSide)initWithIndex:(int64_t)a3 merger:(id)a4;
- (int64_t)index;
- (int64_t)receiveInput:(id)a3;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setMerger:(id)a3;
@end

@implementation _BPSMergedSide

- (_BPSMergedSide)initWithIndex:(int64_t)a3 merger:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSMergedSide;
  v8 = [(_BPSMergedSide *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    objc_storeStrong((id *)&v8->_merger, a4);
  }

  return v9;
}

- (void)receiveCompletion:(id)a3
{
  v6 = self;
  id v4 = a3;
  v5 = [(_BPSMergedSide *)v6 merger];
  objc_msgSend(v5, "receiveCompletion:atIndex:", v4, -[_BPSMergedSide index](v6, "index"));
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = [(_BPSMergedSide *)v4 merger];
  int64_t v7 = objc_msgSend(v6, "receiveInput:atIndex:", v5, -[_BPSMergedSide index](v4, "index"));

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSMergedSide *)self merger];
  objc_msgSend(v5, "receiveSubscription:atIndex:", v4, -[_BPSMergedSide index](self, "index"));
}

- (_BPSMerged)merger
{
  return self->_merger;
}

- (void)setMerger:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
}

@end
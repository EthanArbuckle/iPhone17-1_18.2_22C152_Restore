@interface _BPSAbstractOrderedMergeSide
- (_BPSAbstractOrderedMerge)combiner;
- (_BPSAbstractOrderedMergeSide)initWithIndex:(unint64_t)a3 combiner:(id)a4;
- (int64_t)receiveInput:(id)a3;
- (unint64_t)index;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setCombiner:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation _BPSAbstractOrderedMergeSide

- (_BPSAbstractOrderedMergeSide)initWithIndex:(unint64_t)a3 combiner:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSAbstractOrderedMergeSide;
  v8 = [(_BPSAbstractOrderedMergeSide *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    objc_storeStrong((id *)&v8->_combiner, a4);
  }

  return v9;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSAbstractOrderedMergeSide *)self combiner];
  objc_msgSend(v5, "receiveSubscription:atIndex:", v4, -[_BPSAbstractOrderedMergeSide index](self, "index"));
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = [(_BPSAbstractOrderedMergeSide *)v4 combiner];
  int64_t v7 = objc_msgSend(v6, "receiveInput:atIndex:", v5, -[_BPSAbstractOrderedMergeSide index](v4, "index"));

  return v7;
}

- (void)receiveCompletion:(id)a3
{
  v6 = self;
  id v4 = a3;
  id v5 = [(_BPSAbstractOrderedMergeSide *)v6 combiner];
  objc_msgSend(v5, "receiveCompletion:atIndex:", v4, -[_BPSAbstractOrderedMergeSide index](v6, "index"));
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (_BPSAbstractOrderedMerge)combiner
{
  return self->_combiner;
}

- (void)setCombiner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
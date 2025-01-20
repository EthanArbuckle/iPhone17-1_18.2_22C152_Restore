@interface _BPSOrderedMergeManyInner
- (_BPSOrderedMergeManyInner)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4 comparator:(id)a5;
- (id)comparator;
- (int64_t)compareFirst:(id)a3 withSecond:(id)a4;
- (void)setComparator:(id)a3;
@end

@implementation _BPSOrderedMergeManyInner

- (_BPSOrderedMergeManyInner)initWithDownstream:(id)a3 upstreamCount:(unint64_t)a4 comparator:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_BPSOrderedMergeManyInner;
  v9 = [(_BPSAbstractOrderedMerge *)&v13 initWithDownstream:a3 upstreamCount:a4];
  if (v9)
  {
    v10 = _Block_copy(v8);
    id comparator = v9->_comparator;
    v9->_id comparator = v10;
  }
  return v9;
}

- (int64_t)compareFirst:(id)a3 withSecond:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_BPSOrderedMergeManyInner *)self comparator];
  int64_t v9 = ((uint64_t (**)(void, id, id))v8)[2](v8, v7, v6);

  return v9;
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
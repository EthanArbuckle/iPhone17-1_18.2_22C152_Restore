@interface _BPSFlatMapSide
- (_BPSFlatMapOuter)outer;
- (_BPSFlatMapSide)initWithIndex:(int64_t)a3 outer:(id)a4;
- (int64_t)index;
- (int64_t)receiveInput:(id)a3;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setOuter:(id)a3;
@end

@implementation _BPSFlatMapSide

- (_BPSFlatMapSide)initWithIndex:(int64_t)a3 outer:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSFlatMapSide;
  v8 = [(_BPSFlatMapSide *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outer, a4);
    v9->_index = a3;
  }

  return v9;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSFlatMapSide *)self outer];
  objc_msgSend(v5, "receiveInnerSubscription:index:", v4, -[_BPSFlatMapSide index](self, "index"));
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = [(_BPSFlatMapSide *)v4 outer];
  int64_t v7 = objc_msgSend(v6, "receiveInnerInput:index:", v5, -[_BPSFlatMapSide index](v4, "index"));

  return v7;
}

- (void)receiveCompletion:(id)a3
{
  v6 = self;
  id v4 = a3;
  id v5 = [(_BPSFlatMapSide *)v6 outer];
  objc_msgSend(v5, "receiveInnerCompletion:index:", v4, -[_BPSFlatMapSide index](v6, "index"));
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (_BPSFlatMapOuter)outer
{
  return self->_outer;
}

- (void)setOuter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
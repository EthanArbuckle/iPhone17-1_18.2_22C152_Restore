@interface _BPSLastInnser
- (BPSSubscriber)downstream;
- (_BPSLastInnser)initWithDownstream:(id)a3;
- (id)last;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setDownstream:(id)a3;
- (void)setLast:(id)a3;
@end

@implementation _BPSLastInnser

- (_BPSLastInnser)initWithDownstream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_BPSLastInnser;
  v6 = [(_BPSLastInnser *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_downstream, a3);
  }

  return v7;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSLastInnser *)self downstream];
  [v5 receiveSubscription:v4];
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  [(_BPSLastInnser *)v4 setLast:a3];

  return 1;
}

- (void)receiveCompletion:(id)a3
{
  v8 = self;
  id v4 = a3;
  id v5 = [(_BPSLastInnser *)v8 downstream];
  v6 = [(_BPSLastInnser *)v8 last];
  [v5 receiveInput:v6];

  v7 = [(_BPSLastInnser *)v8 downstream];
  [v7 receiveCompletion:v4];
}

- (void)cancel
{
  v3 = self;
  v2 = [(_BPSLastInnser *)v3 downstream];
  [v2 cancel];
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
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
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
@interface _BPSMapInner
- (BPSSubscriber)downstream;
- (_BPSMapInner)initWithDownstream:(id)a3 transform:(id)a4;
- (id)transform;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setDownstream:(id)a3;
- (void)setTransform:(id)a3;
@end

@implementation _BPSMapInner

- (_BPSMapInner)initWithDownstream:(id)a3 transform:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_BPSMapInner;
  v9 = [(_BPSMapInner *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    id transform = v9->_transform;
    v9->_id transform = (id)v10;

    objc_storeStrong((id *)&v9->_downstream, a3);
  }

  return v9;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSMapInner *)self downstream];
  [v5 receiveSubscription:v4];
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = [(_BPSMapInner *)v4 transform];
  id v7 = ((void (**)(void, id))v6)[2](v6, v5);

  id v8 = [(_BPSMapInner *)v4 downstream];
  int64_t v9 = [v8 receiveInput:v7];

  return v9;
}

- (void)receiveCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = self;
  id v5 = a3;
  v6 = __biome_log_for_category();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = (id)objc_opt_class();
    id v7 = v10;
    _os_log_impl(&dword_1AD01F000, v6, OS_LOG_TYPE_INFO, "%@ - completion", (uint8_t *)&v9, 0xCu);
  }
  id v8 = [(_BPSMapInner *)v4 downstream];
  [v8 receiveCompletion:v5];
}

- (void)cancel
{
  v3 = self;
  v2 = [(_BPSMapInner *)v3 downstream];
  [v2 cancel];
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (id)transform
{
  return self->_transform;
}

- (void)setTransform:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transform, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
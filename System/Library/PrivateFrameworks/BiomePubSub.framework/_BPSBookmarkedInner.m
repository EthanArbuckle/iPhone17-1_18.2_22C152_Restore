@interface _BPSBookmarkedInner
- (BMBookmark)upstreamBookmark;
- (BPSSubscriber)downstream;
- (BPSSubscription)subscription;
- (NSString)upstreamClassName;
- (_BPSBookmarkedInner)initWithUpstream:(id)a3 downstream:(id)a4 state:(id)a5;
- (id)newBookmark;
- (id)state;
- (int64_t)receiveInput:(id)a3;
- (void)_updateBookmarkWhenLocked;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setDownstream:(id)a3;
- (void)setState:(id)a3;
- (void)setSubscription:(id)a3;
- (void)setUpstreamBookmark:(id)a3;
- (void)setUpstreamClassName:(id)a3;
@end

@implementation _BPSBookmarkedInner

- (_BPSBookmarkedInner)initWithUpstream:(id)a3 downstream:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_BPSBookmarkedInner;
  v11 = [(_BPSBookmarkedInner *)&v18 init];
  if (v11)
  {
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    upstreamClassName = v11->_upstreamClassName;
    v11->_upstreamClassName = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
    upstreamBookmark = v11->_upstreamBookmark;
    v11->_upstreamBookmark = (BMBookmark *)v15;

    objc_storeStrong((id *)&v11->_downstream, a4);
    objc_storeStrong(&v11->_state, a5);
    v11->_lock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (void)receiveCompletion:(id)a3
{
  p_lock = &self->_lock;
  id v8 = self;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(_BPSBookmarkedInner *)v8 _updateBookmarkWhenLocked];
  subscription = v8->_subscription;
  v8->_subscription = 0;

  os_unfair_lock_unlock(p_lock);
  v7 = [(_BPSBookmarkedInner *)v8 downstream];
  [v7 receiveCompletion:v5];
}

- (int64_t)receiveInput:(id)a3
{
  p_lock = &self->_lock;
  id v5 = self;
  id v6 = a3;
  os_unfair_lock_lock(p_lock);
  [(_BPSBookmarkedInner *)v5 setState:v6];
  os_unfair_lock_unlock(p_lock);
  v7 = [(_BPSBookmarkedInner *)v5 downstream];
  int64_t v8 = [v7 receiveInput:v6];

  return v8;
}

- (void)receiveSubscription:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(_BPSBookmarkedInner *)self setSubscription:v5];

  os_unfair_lock_unlock(p_lock);
  id v6 = [(_BPSBookmarkedInner *)self downstream];
  [v6 receiveSubscription:self];
}

- (void)cancel
{
  p_lock = &self->_lock;
  id v5 = self;
  os_unfair_lock_lock(p_lock);
  v3 = v5->_subscription;
  [(_BPSBookmarkedInner *)v5 _updateBookmarkWhenLocked];
  subscription = v5->_subscription;
  v5->_subscription = 0;

  os_unfair_lock_unlock(p_lock);
  [(BPSSubscription *)v3 cancel];
}

- (void)requestDemand:(int64_t)a3
{
  id v4 = [(_BPSBookmarkedInner *)self subscription];
  [v4 requestDemand:a3];
}

- (id)newBookmark
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [BMBookmarkNode alloc];
  id v4 = [(_BPSBookmarkedInner *)self state];
  v8[0] = self->_upstreamBookmark;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(BMBookmarkNode *)v3 initWithValue:v4 upstreams:v5 name:self->_upstreamClassName];

  return v6;
}

- (void)_updateBookmarkWhenLocked
{
  v1 = [a1 subscription];
  OUTLINED_FUNCTION_0_1(&dword_1AD01F000, v2, v3, "Subscription - %@ doesn't conform to BMBookmarkableSubscription protocol", v4, v5, v6, v7, 2u);
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
}

- (NSString)upstreamClassName
{
  return self->_upstreamClassName;
}

- (void)setUpstreamClassName:(id)a3
{
}

- (BPSSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
}

- (BMBookmark)upstreamBookmark
{
  return self->_upstreamBookmark;
}

- (void)setUpstreamBookmark:(id)a3
{
}

- (id)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_state, 0);
  objc_storeStrong((id *)&self->_upstreamBookmark, 0);
  objc_storeStrong((id *)&self->_subscription, 0);
  objc_storeStrong((id *)&self->_upstreamClassName, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

@end
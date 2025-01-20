@interface COClusterAssertion
+ (id)assertionForCluster:(id)a3 delegate:(id)a4;
- (COCluster)cluster;
- (COClusterAssertionDelegate)delegate;
- (id)_initWithCluster:(id)a3 delegate:(id)a4;
- (void)_notifyInvalidated;
- (void)dealloc;
@end

@implementation COClusterAssertion

- (id)_initWithCluster:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)COClusterAssertion;
  v9 = [(COClusterAssertion *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cluster, a3);
    objc_storeWeak(p_isa + 1, v8);
  }

  return p_isa;
}

+ (id)assertionForCluster:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) _initWithCluster:v7 delegate:v6];

  return v8;
}

- (void)dealloc
{
  [(COClusterAssertion *)self _notifyInvalidated];
  v3.receiver = self;
  v3.super_class = (Class)COClusterAssertion;
  [(COClusterAssertion *)&v3 dealloc];
}

- (void)_notifyInvalidated
{
  id v4 = [(COClusterAssertion *)self delegate];
  if (v4)
  {
    objc_super v3 = [(COClusterAssertion *)self cluster];
    [v4 didInvalidateAssertionForCluster:v3];
  }
}

- (COClusterAssertionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (COClusterAssertionDelegate *)WeakRetained;
}

- (COCluster)cluster
{
  return self->_cluster;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cluster, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
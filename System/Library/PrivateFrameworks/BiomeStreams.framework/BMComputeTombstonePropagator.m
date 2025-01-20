@interface BMComputeTombstonePropagator
- (BMComputeTombstonePropagator)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4;
- (id)computeSource;
- (void)didWriteTombstone:(id)a3 timestamp:(double)a4 account:(id)a5 remoteName:(id)a6;
@end

@implementation BMComputeTombstonePropagator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamIdentifier, 0);

  objc_storeStrong((id *)&self->_computeSource, 0);
}

- (BMComputeTombstonePropagator)initWithStreamIdentifier:(id)a3 domain:(unint64_t)a4
{
  id v6 = a3;
  if (([v6 hasSuffix:@":tombstones"] & 1) == 0)
  {
    uint64_t v7 = [v6 stringByAppendingString:@":tombstones"];

    id v6 = (id)v7;
  }
  v11.receiver = self;
  v11.super_class = (Class)BMComputeTombstonePropagator;
  v8 = [(BMComputeTombstonePropagator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_streamIdentifier, v6);
    v9->_domain = a4;
  }

  return v9;
}

- (id)computeSource
{
  computeSource = self->_computeSource;
  if (!computeSource)
  {
    v4 = [BMComputeSourceClient alloc];
    v5 = [(BMComputeSourceClient *)v4 initWithStreamIdentifier:self->_streamIdentifier domain:self->_domain useCase:*MEMORY[0x1E4F4FB10]];
    id v6 = self->_computeSource;
    self->_computeSource = v5;

    computeSource = self->_computeSource;
  }

  return computeSource;
}

- (void)didWriteTombstone:(id)a3 timestamp:(double)a4 account:(id)a5 remoteName:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [(BMComputeTombstonePropagator *)self computeSource];
  [v13 sendEvent:v12 account:v11 remoteName:v10 timestamp:0 signpostID:0 sendFullEvent:a4];
}

@end
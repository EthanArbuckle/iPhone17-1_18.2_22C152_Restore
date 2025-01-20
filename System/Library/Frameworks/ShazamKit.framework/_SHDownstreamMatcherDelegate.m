@interface _SHDownstreamMatcherDelegate
- (SHMatcherController)worker;
- (void)matcher:(id)a3 didProduceResponse:(id)a4;
- (void)setWorker:(id)a3;
@end

@implementation _SHDownstreamMatcherDelegate

- (void)matcher:(id)a3 didProduceResponse:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_SHDownstreamMatcherDelegate *)self worker];
  [v8 downstreamMatcher:v7 didProduceResponse:v6];
}

- (SHMatcherController)worker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_worker);

  return (SHMatcherController *)WeakRetained;
}

- (void)setWorker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
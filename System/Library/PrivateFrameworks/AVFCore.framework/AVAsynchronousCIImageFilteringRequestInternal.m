@interface AVAsynchronousCIImageFilteringRequestInternal
- (AVAsynchronousVideoCompositionRequest)compositingRequest;
- (CIImage)sourceCIImage;
- (__CVBuffer)sourcePBuf;
- (id)cancellationTest;
- (id)completionHandler;
- (id)defaultCIContextProvider;
- (void)_willDeallocOrFinalize;
- (void)dealloc;
- (void)setCancellationTest:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompositingRequest:(id)a3;
- (void)setDefaultCIContextProvider:(id)a3;
- (void)setSourceCIImage:(id)a3;
- (void)setSourcePBuf:(__CVBuffer *)a3;
@end

@implementation AVAsynchronousCIImageFilteringRequestInternal

- (void)_willDeallocOrFinalize
{
}

- (void)dealloc
{
  [(AVAsynchronousCIImageFilteringRequestInternal *)self _willDeallocOrFinalize];

  v3.receiver = self;
  v3.super_class = (Class)AVAsynchronousCIImageFilteringRequestInternal;
  [(AVAsynchronousCIImageFilteringRequestInternal *)&v3 dealloc];
}

- (AVAsynchronousVideoCompositionRequest)compositingRequest
{
  return self->_compositingRequest;
}

- (void)setCompositingRequest:(id)a3
{
}

- (id)cancellationTest
{
  return self->_cancellationTest;
}

- (void)setCancellationTest:(id)a3
{
}

- (id)defaultCIContextProvider
{
  return self->_defaultCIContextProvider;
}

- (void)setDefaultCIContextProvider:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (CIImage)sourceCIImage
{
  return self->_sourceCIImage;
}

- (void)setSourceCIImage:(id)a3
{
}

- (__CVBuffer)sourcePBuf
{
  return self->_sourcePBuf;
}

- (void)setSourcePBuf:(__CVBuffer *)a3
{
}

@end
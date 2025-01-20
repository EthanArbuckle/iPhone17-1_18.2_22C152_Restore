@interface PHResourceLocalAvailabilityRequestOptions
- (BOOL)allowMissingVideoComplement;
- (BOOL)dontAllowRAW;
- (BOOL)includeAllAssetResources;
- (BOOL)includeOriginalResourcesOnly;
- (BOOL)treatLivePhotoAsStill;
- (OS_dispatch_queue)resultHandlerQueue;
- (id)description;
- (void)setAllowMissingVideoComplement:(BOOL)a3;
- (void)setDontAllowRAW:(BOOL)a3;
- (void)setIncludeAllAssetResources:(BOOL)a3;
- (void)setIncludeOriginalResourcesOnly:(BOOL)a3;
- (void)setResultHandlerQueue:(id)a3;
- (void)setTreatLivePhotoAsStill:(BOOL)a3;
@end

@implementation PHResourceLocalAvailabilityRequestOptions

- (void).cxx_destruct
{
}

- (void)setAllowMissingVideoComplement:(BOOL)a3
{
  self->_allowMissingVideoComplement = a3;
}

- (BOOL)allowMissingVideoComplement
{
  return self->_allowMissingVideoComplement;
}

- (void)setResultHandlerQueue:(id)a3
{
}

- (void)setIncludeOriginalResourcesOnly:(BOOL)a3
{
  self->_includeOriginalResourcesOnly = a3;
}

- (BOOL)includeOriginalResourcesOnly
{
  return self->_includeOriginalResourcesOnly;
}

- (void)setIncludeAllAssetResources:(BOOL)a3
{
  self->_includeAllAssetResources = a3;
}

- (BOOL)includeAllAssetResources
{
  return self->_includeAllAssetResources;
}

- (void)setDontAllowRAW:(BOOL)a3
{
  self->_dontAllowRAW = a3;
}

- (BOOL)dontAllowRAW
{
  return self->_dontAllowRAW;
}

- (void)setTreatLivePhotoAsStill:(BOOL)a3
{
  self->_treatLivePhotoAsStill = a3;
}

- (BOOL)treatLivePhotoAsStill
{
  return self->_treatLivePhotoAsStill;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  resultHandlerQueue = self->_resultHandlerQueue;
  if (resultHandlerQueue)
  {
    v3 = resultHandlerQueue;
  }
  else
  {
    v3 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
  }

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p, treatLivePhotoAsStill:%d, dontAllowRAW:%d, includeAllAssetResources:%d, includeOriginalResourcesOnly:%d>", objc_opt_class(), self, self->_treatLivePhotoAsStill, self->_dontAllowRAW, self->_includeAllAssetResources, self->_includeOriginalResourcesOnly];
}

@end
@interface VNRequestPerformingContext
- (BOOL)cacheObservationsOfRequest:(id)a3;
- (VNRequestPerformingContext)initWithSession:(id)a3 requestPerformer:(id)a4 imageBuffer:(id)a5 forensics:(id)a6 observationsCache:(id)a7;
- (VNRequestPerformingContext)initWithSession:(id)a3 requestPerformer:(id)a4 imageBuffer:(id)a5 forensics:(id)a6 observationsCache:(id)a7 qosClass:(unsigned int)a8;
- (VNSession)session;
- (id)_observationsCacheKeyForRequest:(id)a3;
- (id)cachedObservationsAcceptedByRequest:(id)a3;
- (id)imageBufferAndReturnError:(id *)a3;
- (id)previousSequencedObservationsAcceptedByRequest:(id)a3;
- (id)requestForensics;
- (id)requestPerformerAndReturnError:(id *)a3;
- (unint64_t)serialNumber;
- (unsigned)qosClass;
- (void)recordSequencedObservationsOfRequest:(id)a3;
@end

@implementation VNRequestPerformingContext

- (id)cachedObservationsAcceptedByRequest:(id)a3
{
  id v4 = a3;
  p_observationsCacheLock = &self->_observationsCacheLock;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  if (self->_requestForensics)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __66__VNRequestPerformingContext_cachedObservationsAcceptedByRequest___block_invoke;
    v12 = &unk_1E5B1FED8;
    v13 = self;
    id v14 = v4;
    v6 = _Block_copy(&v9);
  }
  else
  {
    v6 = 0;
  }
  v7 = -[VNObservationsCache observationsAcceptedByRequest:testedKeyHandler:](self->_observationsCache, "observationsAcceptedByRequest:testedKeyHandler:", v4, v6, v9, v10, v11, v12, v13);

  os_unfair_lock_unlock(p_observationsCacheLock);

  return v7;
}

- (unsigned)qosClass
{
  return self->_qosClass;
}

- (VNRequestPerformingContext)initWithSession:(id)a3 requestPerformer:(id)a4 imageBuffer:(id)a5 forensics:(id)a6 observationsCache:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [(VNRequestPerformingContext *)self initWithSession:v16 requestPerformer:v15 imageBuffer:v14 forensics:v13 observationsCache:v12 qosClass:qos_class_self()];

  return v17;
}

- (VNRequestPerformingContext)initWithSession:(id)a3 requestPerformer:(id)a4 imageBuffer:(id)a5 forensics:(id)a6 observationsCache:(id)a7 qosClass:(unsigned int)a8
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v25.receiver = self;
  v25.super_class = (Class)VNRequestPerformingContext;
  v19 = [(VNRequestPerformingContext *)&v25 init];
  v20 = v19;
  if (v19)
  {
    v19->_serialNumber = atomic_fetch_add_explicit(&initWithSession_requestPerformer_imageBuffer_forensics_observationsCache_qosClass__ourNextSerialNumber, 1uLL, memory_order_relaxed)+ 1;
    objc_storeStrong((id *)&v19->_session, a3);
    v20->_qosClass = a8;
    objc_storeWeak((id *)&v20->_weakRequestPerformer, v15);
    objc_storeStrong((id *)&v20->_imageBuffer_DO_NOT_DIRECTLY_ACCESS, a5);
    uint64_t v21 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    requestToObservationsCacheKeyMap = v20->_requestToObservationsCacheKeyMap;
    v20->_requestToObservationsCacheKeyMap = (NSMapTable *)v21;

    objc_storeStrong((id *)&v20->_observationsCache, a7);
    v20->_observationsCacheLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_requestForensics, a6);
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestForensics, 0);
  objc_storeStrong((id *)&self->_observationsCache, 0);
  objc_storeStrong((id *)&self->_requestToObservationsCacheKeyMap, 0);
  objc_storeStrong((id *)&self->_imageBuffer_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_destroyWeak((id *)&self->_weakRequestPerformer);

  objc_storeStrong((id *)&self->_session, 0);
}

- (id)previousSequencedObservationsAcceptedByRequest:(id)a3
{
  id v4 = a3;
  v5 = [(VNRequestPerformingContext *)self requestPerformerAndReturnError:0];
  v6 = [v5 previousSequencedObservationsForRequest:v4];

  return v6;
}

- (void)recordSequencedObservationsOfRequest:(id)a3
{
  id v5 = a3;
  if ([v5 wantsSequencedRequestObservationsRecording])
  {
    id v4 = [(VNRequestPerformingContext *)self requestPerformerAndReturnError:0];
    [v4 recordSequencedObservationsForRequest:v5];
  }
}

uint64_t __66__VNRequestPerformingContext_cachedObservationsAcceptedByRequest___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void **)(*(void *)(a1 + 32) + 72);
  if (a3) {
    return [v4 cachedObservationsWithKey:a2 wereLocatedOnBehalfOfRequest:v3];
  }
  else {
    return [v4 cachedObservationsWithKey:a2 wereCheckedOnBehalfOfRequest:v3];
  }
}

- (BOOL)cacheObservationsOfRequest:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_observationsCacheLock);
  char v5 = [v4 allowsCachingOfResults];
  if (v5)
  {
    v6 = [(VNRequestPerformingContext *)self _observationsCacheKeyForRequest:v4];
    observationsCache = self->_observationsCache;
    v8 = [v4 results];
    [(VNObservationsCache *)observationsCache setObservations:v8 forKey:v6];

    [(VNRequestPerformingContext *)self serialNumber];
    [v4 resolvedRevision];
    [(id)objc_opt_class() VNClassCode];
    kdebug_trace();
    requestForensics = self->_requestForensics;
    if (requestForensics) {
      [(VNRequestForensics *)requestForensics request:v4 cachedResultsWithObservationsCacheKey:v6];
    }
  }
  os_unfair_lock_unlock(&self->_observationsCacheLock);

  return v5;
}

- (id)imageBufferAndReturnError:(id *)a3
{
  imageBuffer_DO_NOT_DIRECTLY_ACCESS = self->_imageBuffer_DO_NOT_DIRECTLY_ACCESS;
  if (imageBuffer_DO_NOT_DIRECTLY_ACCESS)
  {
    id v4 = imageBuffer_DO_NOT_DIRECTLY_ACCESS;
  }
  else if (a3)
  {
    *a3 = +[VNError errorForInvalidOperationWithLocalizedDescription:@"no image is available"];
  }

  return imageBuffer_DO_NOT_DIRECTLY_ACCESS;
}

- (id)requestForensics
{
  return self->_requestForensics;
}

- (id)requestPerformerAndReturnError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakRequestPerformer);
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained;
  }
  else if (a3)
  {
    *a3 = +[VNError errorForInternalErrorWithLocalizedDescription:@"no request performer available"];
  }

  return v5;
}

- (VNSession)session
{
  return self->_session;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (id)_observationsCacheKeyForRequest:(id)a3
{
  id v4 = a3;
  char v5 = [(NSMapTable *)self->_requestToObservationsCacheKeyMap objectForKey:v4];
  if (!v5)
  {
    id v6 = [v4 configuration];
    char v5 = (void *)[v6 copy];
    [(NSMapTable *)self->_requestToObservationsCacheKeyMap setObject:v5 forKey:v4];
  }

  return v5;
}

@end
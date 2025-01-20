@interface VNRequest
+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7;
+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6;
+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(float)a6 error:(id *)a7;
+ (BOOL)getOptionalArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 error:(id *)a7;
+ (BOOL)getOptionalObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7;
+ (BOOL)getRequiredObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7;
+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4;
+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4;
+ (BOOL)setsTimeRangeOnResults;
+ (BOOL)supportedRevisionsAreFilteredBasedOnAvailableComputeDevices;
+ (BOOL)supportsAnyRevision:(unint64_t)a3;
+ (BOOL)supportsPrivateRevision:(unint64_t)a3;
+ (BOOL)supportsRevision:(unint64_t)a3;
+ (BOOL)warmUpSession:(id)a3 error:(id *)a4;
+ (Class)configurationClass;
+ (NSIndexSet)allSupportedRevisions;
+ (NSIndexSet)supportedPrivateRevisions;
+ (NSIndexSet)supportedRevisions;
+ (NSUInteger)currentRevision;
+ (NSUInteger)defaultRevision;
+ (const)dependentRequestCompatibility;
+ (const)dependentRequestMappingTable;
+ (const)revisionAvailability;
+ (id)_runtimeAvailableRevisionsOfRevisions:(id)a3;
+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)newConfigurationInstance;
+ (id)privateRevisionsSet;
+ (id)publicRevisionsSet;
+ (unint64_t)_defaultRevisionForBuildVersion:(int)a3;
+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4;
+ (unint64_t)firstSupportedRevisionInOrderedRevisionList:(unint64_t)a3;
+ (unint64_t)resolvedRevisionForRevision:(unint64_t)a3;
+ (unsigned)VNClassCode;
+ (void)initialize;
- (BOOL)allowsCachingOfResults;
- (BOOL)cancellationTriggered;
- (BOOL)cancellationTriggeredAndReturnError:(id *)a3;
- (BOOL)hasCancellationHook;
- (BOOL)internalCancelInContext:(id)a3 error:(id *)a4;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)performInContext:(id)a3 error:(id *)a4;
- (BOOL)preferBackgroundProcessing;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (BOOL)setRevision:(unint64_t)a3 error:(id *)a4;
- (BOOL)usesCPUOnly;
- (BOOL)validateConfigurationAndReturnError:(id *)a3;
- (BOOL)validateImageBuffer:(id)a3 ofNonZeroWidth:(unint64_t *)a4 andHeight:(unint64_t *)a5 error:(id *)a6;
- (BOOL)wantsSequencedRequestObservationsRecording;
- (BOOL)warmUpApplicableDetectorInSession:(id)a3 error:(id *)a4;
- (BOOL)warmUpSession:(id)a3 error:(id *)a4;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (CGRect)VNImageProcessingSessionRegionOfInterest;
- (Class)applicableDetectorClassAndOptions:(id *)a3 forRevision:(unint64_t)a4 error:(id *)a5;
- (Class)frameworkClass;
- (MTLDevice)preferredMetalContext;
- (NSArray)results;
- (NSDictionary)computeStageDeviceAssignments;
- (NSDictionary)resolvedComputeStageDeviceAssignments;
- (NSDictionary)supportedComputeStageDevicesAndReturnError:(NSError *)error;
- (NSString)description;
- (NSUInteger)revision;
- (OS_dispatch_semaphore)cancellationSemaphore;
- (VNAsyncStatus)asyncStatus;
- (VNControlledCapacityTasksQueue)requestTasksQueue;
- (VNProcessingDevice)processingDevice;
- (VNRequest)init;
- (VNRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler;
- (VNRequestCompletionHandler)completionHandler;
- (VNRequestSpecifier)specifier;
- (double)executionTimeInternal;
- (id)VNCoreMLTransformerDetectionprintAndReturnError:(id *)a3;
- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3;
- (id)VNImageProcessingSessionPrintAndReturnError:(id *)a3;
- (id)VNImageProcessingSessionPrintKeyPath;
- (id)_alignFacesInContext:(id)a3 faces:(id)a4 qosClass:(unsigned int)a5 options:(id)a6 error:(id *)a7;
- (id)applicableDetectorAndOptions:(id *)a3 forRevision:(unint64_t)a4 loadedInSession:(id)a5 error:(id *)a6;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)cancellerAndReturnError:(id *)a3;
- (id)computeDeviceForComputeStage:(VNComputeStage)computeStage;
- (id)configuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)detectFaceLandmarksInContext:(id)a3 faces:(id)a4 error:(id *)a5;
- (id)detectFacesInContext:(id)a3 error:(id *)a4;
- (id)detectorProgressHandler;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (id)newDefaultDetectorOptionsForSession:(id)a3;
- (id)newDuplicateInstance;
- (id)processFaceObservations:(id)a3 revision:(unint64_t)a4 regionOfInterest:(CGRect)a5 detectorType:(id)a6 detectorOptions:(id)a7 shouldAlignFaceBBox:(id)a8 shouldRunDetectorBlock:(id)a9 context:(id)a10 error:(id *)a11;
- (id)sequencedRequestPreviousObservationsKey;
- (id)utilizedResourcesWithError:(id *)a3;
- (id)valueForWarning:(id)a3;
- (id)warnings;
- (int64_t)dependencyProcessingOrdinality;
- (unint64_t)applicableRevisionForDependentRequest:(id)a3;
- (unint64_t)detectionLevel;
- (unint64_t)executionNanoseconds;
- (unint64_t)ioSurfaceMemoryPoolId;
- (unint64_t)maximumProcessingDimensionOnTheLongSide;
- (unint64_t)metalContextPriority;
- (unint64_t)modelExecutionPriority;
- (unint64_t)modelFileBackingStore;
- (unint64_t)resolvedRevision;
- (unint64_t)serialNumber;
- (void)_setResolvedRevision:(unint64_t)a3;
- (void)applyCompatibleComputeStageDeviceAssignmentsOfRequest:(id)a3;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)cancel;
- (void)categorizeFaceObservations:(id)a3 shouldRunDetectorBlock:(id)a4 facesThatNeedNoProcessing:(id)a5 facesThatNeedProcessing:(id)a6 facesThatNeed2DLandmarks:(id)a7;
- (void)copyStateOfRequest:(id)a3;
- (void)performInContextAsync:(id)a3 asyncDispatchQueue:(id)a4 asyncDispatchGroup:(id)a5;
- (void)recordWarning:(id)a3 value:(id)a4;
- (void)resetAsyncStatus;
- (void)setAsyncStatus:(BOOL)a3 error:(id)a4;
- (void)setCancellationSemaphore:(id)a3;
- (void)setComputeDevice:(id)computeDevice forComputeStage:(VNComputeStage)computeStage;
- (void)setDetectionLevel:(unint64_t)a3;
- (void)setIoSurfaceMemoryPoolId:(unint64_t)a3;
- (void)setMaximumProcessingDimensionOnTheLongSide:(unint64_t)a3;
- (void)setMetalContextPriority:(unint64_t)a3;
- (void)setModelExecutionPriority:(unint64_t)a3;
- (void)setModelFileBackingStore:(unint64_t)a3;
- (void)setPreferBackgroundProcessing:(BOOL)preferBackgroundProcessing;
- (void)setPreferredMetalContext:(id)a3;
- (void)setProcessedResults:(id)a3;
- (void)setProcessingDevice:(id)a3;
- (void)setResults:(id)a3;
- (void)setResults:(id)a3 assignedWithOriginatingSpecifier:(BOOL)a4;
- (void)setRevision:(NSUInteger)revision;
- (void)setUsesCPUOnly:(BOOL)usesCPUOnly;
@end

@implementation VNRequest

- (VNRequest)initWithCompletionHandler:(VNRequestCompletionHandler)completionHandler
{
  VNRequestCompletionHandler v4 = completionHandler;
  v16.receiver = self;
  v16.super_class = (Class)VNRequest;
  v5 = [(VNRequest *)&v16 init];
  v6 = v5;
  if (v5)
  {
    v5->_serialNumber = atomic_fetch_add_explicit(&-[VNRequest initWithCompletionHandler:]::ourNextSerialNumber, 1uLL, memory_order_relaxed)+ 1;
    v5->_cancellationResourcesLock._os_unfair_lock_opaque = 0;
    v7 = objc_opt_class();
    uint64_t v8 = [v7 newConfigurationInstance];
    configuration = v6->_configuration;
    v6->_configuration = (VNRequestConfiguration *)v8;

    v10 = _Block_copy(v4);
    id v11 = v6->_completionHandler;
    v6->_completionHandler = v10;

    v6->_revision = [v7 defaultRevision];
    v12 = objc_alloc_init(VNAsyncStatus);
    asyncStatus = v6->_asyncStatus;
    v6->_asyncStatus = v12;

    v6->_asyncStatusLock._os_unfair_lock_opaque = 0;
    v14 = v6;
  }

  return v6;
}

+ (unint64_t)resolvedRevisionForRevision:(unint64_t)a3
{
  if (!a3)
  {
    v3 = [a1 publicRevisionsSet];
    unint64_t v4 = [v3 lastIndex];

    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return v4;
    }
  }
  return a3;
}

+ (NSUInteger)defaultRevision
{
  uint64_t v3 = [a1 _defaultRevisionForBuildVersion:ourVisionFrameworkLinkTimeVersion];

  return [a1 resolvedRevisionForRevision:v3];
}

+ (unint64_t)_defaultRevisionForBuildVersion:(int)a3
{
  if (a3 == -1) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v6 = (unint64_t *)[a1 revisionAvailability];
  if (v6 && (unint64_t v7 = *v6) != 0)
  {
    uint64_t v8 = v6 + 4;
    while (1)
    {
      int v9 = *((_DWORD *)v8 - 4);
      if (v9 == a3) {
        break;
      }
      if (v9 <= a3)
      {
        int v10 = *((_DWORD *)v8 - 3);
        if (v10) {
          BOOL v11 = v10 < a3;
        }
        else {
          BOOL v11 = 0;
        }
        if (!v11) {
          [v5 addIndex:v7];
        }
      }
      unint64_t v12 = *v8;
      v8 += 4;
      unint64_t v7 = v12;
      if (!v12) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    if ([v5 count]) {
      unint64_t v7 = [v5 lastIndex];
    }
    else {
      unint64_t v7 = 0;
    }
  }

  return v7;
}

+ (id)newConfigurationInstance
{
  id v3 = objc_alloc((Class)[a1 configurationClass]);
  uint64_t v4 = [a1 frameworkClass];

  return (id)[v3 initWithRequestClass:v4];
}

- (Class)applicableDetectorClassAndOptions:(id *)a3 forRevision:(unint64_t)a4 error:(id *)a5
{
  int v9 = [(VNRequest *)self applicableDetectorTypeForRevision:a4 error:a5];
  if (v9)
  {
    id v10 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:a4 session:0];
    id v15 = v10;
    BOOL v11 = +[VNDetector detectorClassAndConfigurationOptions:&v15 forDetectorType:v9 options:v10 error:a5];
    id v12 = v15;

    if (v11)
    {
      if (a3) {
        *a3 = v12;
      }
      v13 = v11;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNRequest modelFileBackingStore](self, "modelFileBackingStore"));
  [v7 setObject:v8 forKeyedSubscript:@"VNDetectorInitOption_ModelBackingStore"];

  int v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VNRequest ioSurfaceMemoryPoolId](self, "ioSurfaceMemoryPoolId"));
  [v7 setObject:v9 forKeyedSubscript:@"VNDetectorInitOption_MemoryPoolId"];

  id v10 = +[VNRequestSpecifier specifierForRequestClass:[(VNRequest *)self frameworkClass] revision:a3 error:0];
  [v7 setObject:v10 forKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
  BOOL v11 = [(VNRequest *)self resolvedComputeStageDeviceAssignments];
  [v7 setObject:v11 forKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];

  id v12 = objc_msgSend(NSNumber, "numberWithBool:", -[VNRequest preferBackgroundProcessing](self, "preferBackgroundProcessing"));
  [v7 setObject:v12 forKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNRequest modelExecutionPriority](self, "modelExecutionPriority"));
  [v7 setObject:v13 forKeyedSubscript:@"VNDetectorOption_EspressoPlanPriority"];

  if (v6) {
    [v7 setObject:v6 forKeyedSubscript:@"VNDetectorProcessOption_Session"];
  }
  v14 = [(VNRequest *)self cancellerAndReturnError:0];
  [v7 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_Canceller"];

  return v7;
}

- (NSDictionary)resolvedComputeStageDeviceAssignments
{
  return [(VNRequestConfiguration *)self->_configuration resolvedComputeStageDeviceAssignments];
}

- (Class)frameworkClass
{
  v2 = (objc_class *)objc_opt_class();

  return VNRequestClassFromClientSubclass(v2);
}

- (unint64_t)modelExecutionPriority
{
  return [(VNRequestConfiguration *)self->_configuration modelExecutionPriority];
}

- (unint64_t)ioSurfaceMemoryPoolId
{
  return [(VNRequestConfiguration *)self->_configuration memoryPoolId];
}

- (BOOL)preferBackgroundProcessing
{
  return [(VNRequestConfiguration *)self->_configuration preferBackgroundProcessing];
}

- (unint64_t)modelFileBackingStore
{
  return [(VNRequestConfiguration *)self->_configuration modelFileBackingStore];
}

- (id)cancellerAndReturnError:(id *)a3
{
  p_cancellationResourcesLock = &self->_cancellationResourcesLock;
  os_unfair_lock_lock(&self->_cancellationResourcesLock);
  id v6 = self->_canceller;
  os_unfair_lock_unlock(p_cancellationResourcesLock);
  if (v6)
  {
    id v7 = v6;
  }
  else if (a3)
  {
    if ([(VNRequest *)self hasCancellationHook])
    {
      uint64_t v8 = @"cancellation is not currently available";
    }
    else
    {
      int v9 = NSString;
      id v10 = (objc_class *)objc_opt_class();
      BOOL v11 = NSStringFromClass(v10);
      uint64_t v12 = [v9 stringWithFormat:@"%@ does not support cancellation", v11];

      uint64_t v8 = (__CFString *)v12;
    }
    *a3 = +[VNError errorForInvalidOperationWithLocalizedDescription:v8];
  }

  return v6;
}

BOOL __51__VNRequest__runtimeAvailableRevisionsOfRevisions___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setResolvedRevision:a2];
  id v3 = [*(id *)(a1 + 32) supportedComputeStageDevicesAndReturnError:0];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKeyedSubscript:@"VNComputeStageMain"];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_setResolvedRevision:(unint64_t)a3
{
  unint64_t revision = self->_revision;
  self->_unint64_t revision = a3;
  if (revision != a3)
  {
    -[VNRequestConfiguration setResolvedRevision:](self->_configuration, "setResolvedRevision:");
    [(VNRequest *)self resolvedRevisionDidChangeFromRevision:revision];
  }
}

- (NSDictionary)supportedComputeStageDevicesAndReturnError:(NSError *)error
{
  id v10 = 0;
  uint64_t v4 = [(VNRequest *)self applicableDetectorClassAndOptions:&v10 forRevision:[(VNRequest *)self resolvedRevision] error:error];
  id v5 = v10;
  if (v4)
  {
    BOOL v6 = [(objc_class *)v4 supportedComputeStageDevicesForOptions:v5 error:error];
    id v7 = v6;
    if (v6) {
      id v8 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }

  return (NSDictionary *)v7;
}

- (unint64_t)resolvedRevision
{
  unint64_t v3 = [(VNRequestConfiguration *)self->_configuration resolvedRevision];
  if (!v3)
  {
    unint64_t v3 = objc_msgSend((id)objc_opt_class(), "resolvedRevisionForRevision:", -[VNRequest revision](self, "revision"));
    [(VNRequestConfiguration *)self->_configuration setResolvedRevision:v3];
  }
  return v3;
}

+ (const)revisionAvailability
{
  return 0;
}

+ (id)publicRevisionsSet
{
  uint64_t v2 = [a1 frameworkClass];
  os_unfair_lock_lock(&+[VNRequest publicRevisionsSet]::ourLock);
  unint64_t v3 = (void *)+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable;
  if (!+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    id v5 = (void *)+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable;
    +[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable = v4;

    unint64_t v3 = (void *)+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable;
  }
  BOOL v6 = [v3 objectForKey:v2];
  if (!v6)
  {
    id v7 = (void *)[self revisionAvailability];
    if (v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      int v9 = +[VNRuntimeUtilities runTimeVersion];
      if (*v7)
      {
        int v10 = v9;
        BOOL v11 = v7 + 4;
        do
        {
          if (*((_DWORD *)v11 - 4) <= v10)
          {
            int v12 = *((_DWORD *)v11 - 3);
            if (!v12 || v12 >= v10) {
              objc_msgSend(v8, "addIndex:");
            }
          }
          uint64_t v14 = *v11;
          v11 += 4;
        }
        while (v14);
      }
    }
    else
    {
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:1];
    }
    BOOL v6 = (void *)[v8 copy];

    [(id)+[VNRequest publicRevisionsSet]::ourRequestClassToSuportedRevisionsMapTable setObject:v6 forKey:v2];
  }
  os_unfair_lock_unlock(&+[VNRequest publicRevisionsSet]::ourLock);

  return v6;
}

- (void)setModelFileBackingStore:(unint64_t)a3
{
}

- (void)setIoSurfaceMemoryPoolId:(unint64_t)a3
{
}

- (void)setComputeDevice:(id)computeDevice forComputeStage:(VNComputeStage)computeStage
{
}

- (VNProcessingDevice)processingDevice
{
  return [(VNRequestConfiguration *)self->_configuration processingDevice];
}

- (void)setProcessingDevice:(id)a3
{
  id v9 = a3;
  uint64_t v4 = [[VNProcessingDeviceComputeDeviceBridge alloc] initWithProcessingDevice:v9];
  id v5 = [(VNRequest *)self supportedComputeStageDevicesAndReturnError:0];
  BOOL v6 = [v5 objectForKeyedSubscript:@"VNComputeStageMain"];
  id v7 = [(VNProcessingDeviceComputeDeviceBridge *)v4 computeDevice];
  char v8 = [v6 containsObject:v7];

  if (v8) {
    [(VNRequestConfiguration *)self->_configuration setProcessingDevice:v9];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    ourVisionFrameworkLinkTimeVersion = +[VNFrameworkManager linktimeVersion];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_cancellationQueue, 0);
  objc_storeStrong((id *)&self->_cancellationSemaphore, 0);
  objc_storeStrong((id *)&self->_canceller, 0);
  objc_storeStrong((id *)&self->_asyncStatus, 0);
  objc_storeStrong((id *)&self->_warningRecorder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setModelExecutionPriority:(unint64_t)a3
{
}

- (NSUInteger)revision
{
  return self->_revision;
}

- (id)configuration
{
  return self->_configuration;
}

- (VNRequestSpecifier)specifier
{
  unint64_t v3 = [(VNRequest *)self frameworkClass];
  unint64_t v4 = [(VNRequest *)self resolvedRevision];

  return (VNRequestSpecifier *)+[VNRequestSpecifier specifierForRequestClass:v3 revision:v4 error:0];
}

- (VNRequest)init
{
  return [(VNRequest *)self initWithCompletionHandler:0];
}

- (BOOL)setRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 < 0xDECAF000)
  {
    [(VNRequest *)self setRevision:a3];
    if ([(id)objc_opt_class() supportsRevision:a3]) {
      return 1;
    }
  }
  else
  {
    if (!self) {
      return 0;
    }
    [(VNRequest *)self _setResolvedRevision:a3];
    if ([(id)objc_opt_class() supportsPrivateRevision:a3]) {
      return 1;
    }
  }
  if (a4)
  {
    id v8 = +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
    BOOL result = 0;
    *a4 = v8;
    return result;
  }
  return 0;
}

- (void)setRevision:(NSUInteger)revision
{
  id v5 = (objc_class *)objc_opt_class();
  BOOL v6 = v5;
  if (revision > 0xDECAEFFF
    || [(objc_class *)v5 supportsPrivateRevision:revision])
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    NSStringFromClass(v6);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = VNRequestRevisionString(v6, revision);
    [v7 raise:*MEMORY[0x1E4F1C3C8], @"%@ does not support %@", v10, v8 format];
  }
  else
  {
    uint64_t v9 = [(objc_class *)v6 resolvedRevisionForRevision:revision];
    [(VNRequest *)self _setResolvedRevision:v9];
  }
}

+ (BOOL)supportsPrivateRevision:(unint64_t)a3
{
  unint64_t v4 = [a1 supportedPrivateRevisions];
  LOBYTE(a3) = [v4 containsIndex:a3];

  return a3;
}

+ (NSIndexSet)supportedPrivateRevisions
{
  unint64_t v3 = [a1 privateRevisionsSet];
  if ([a1 supportedRevisionsAreFilteredBasedOnAvailableComputeDevices])
  {
    uint64_t v4 = [a1 _runtimeAvailableRevisionsOfRevisions:v3];

    unint64_t v3 = (void *)v4;
  }

  return (NSIndexSet *)v3;
}

+ (BOOL)supportedRevisionsAreFilteredBasedOnAvailableComputeDevices
{
  return 1;
}

+ (id)_runtimeAvailableRevisionsOfRevisions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_alloc_init(_VNRequestRevisionsIntrospectionInstanceCreator);
    BOOL v6 = (objc_class *)[a1 frameworkClass];
    id v17 = 0;
    id v7 = [(VNRequestInstanceCreator *)v5 newRequestInstanceOfClass:v6 withCompletionHandler:0 revision:0 error:&v17];
    id v8 = v17;
    if (v7)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__VNRequest__runtimeAvailableRevisionsOfRevisions___block_invoke;
      v15[3] = &unk_1E5B1C718;
      id v16 = v7;
      uint64_t v9 = [v4 indexesPassingTest:v15];
    }
    else
    {
      id v10 = [NSString alloc];
      BOOL v11 = NSStringFromClass(v6);
      int v12 = [v8 localizedDescription];
      v13 = (void *)[v10 initWithFormat:@"Failed to create instance of %@ - %@", v11, v12];
      +[VNError VNAssert:0 log:v13];

      uint64_t v9 = (void *)[v4 copy];
    }
  }
  else
  {
    uint64_t v9 = (void *)[v4 copy];
  }

  return v9;
}

+ (id)privateRevisionsSet
{
  return (id)[MEMORY[0x1E4F28D60] indexSet];
}

- (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (+[VisionCoreRuntimeUtilities item:self overridesSelector:a2])
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [(VNRequest *)self applicableDetectorTypeForRevision:[(VNRequest *)self resolvedRevision] error:a4];
    id v10 = v9;
    if (v9)
    {
      if ([v9 isEqualToString:&stru_1EF75C0C0]) {
        char v11 = [(id)objc_opt_class() warmUpSession:v7 error:a4];
      }
      else {
        char v11 = [(VNRequest *)self warmUpApplicableDetectorInSession:v7 error:a4];
      }
      BOOL v8 = v11;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (BOOL)warmUpApplicableDetectorInSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v21 = 0;
  id v7 = [(VNRequest *)self applicableDetectorAndOptions:&v21 forRevision:[(VNRequest *)self resolvedRevision] loadedInSession:v6 error:a4];
  id v8 = v21;
  if (v7)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __53__VNRequest_warmUpApplicableDetectorInSession_error___block_invoke;
    id v17 = &unk_1E5B1DFB0;
    id v9 = v7;
    id v18 = v9;
    id v19 = v6;
    id v20 = v8;
    id v10 = _Block_copy(&v14);
    char v11 = objc_opt_class();
    char v12 = objc_msgSend(v11, "runSuccessReportingBlockSynchronously:detector:qosClass:error:", v10, v9, qos_class_self(), a4, v14, v15, v16, v17);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)applicableDetectorAndOptions:(id *)a3 forRevision:(unint64_t)a4 loadedInSession:(id)a5 error:(id *)a6
{
  id v10 = a5;
  char v11 = [(VNRequest *)self applicableDetectorTypeForRevision:a4 error:a6];
  if (v11)
  {
    id v12 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:a4 session:v10];
    v13 = [v10 detectorOfType:v11 configuredWithOptions:v12 error:a6];
    if (v13)
    {
      if (a3) {
        *a3 = v12;
      }
      id v14 = v13;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)detectionLevel
{
  return [(VNRequestConfiguration *)self->_configuration detectionLevel];
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  id v4 = &stru_1EF75C0C0;
  return &stru_1EF75C0C0;
}

+ (BOOL)warmUpSession:(id)a3 error:(id *)a4
{
  return 1;
}

uint64_t __53__VNRequest_warmUpApplicableDetectorInSession_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) warmUpSession:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 48) error:a2];
}

- (void)setCancellationSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)cancellationSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 64, 1);
}

- (VNRequestCompletionHandler)completionHandler
{
  return self->_completionHandler;
}

- (NSArray)results
{
  return self->_results;
}

- (NSDictionary)computeStageDeviceAssignments
{
  return [(VNRequestConfiguration *)self->_configuration computeStageDeviceAssignments];
}

- (id)computeDeviceForComputeStage:(VNComputeStage)computeStage
{
  unint64_t v3 = [(VNRequestConfiguration *)self->_configuration computeDeviceForComputeStage:computeStage];

  return v3;
}

- (id)detectorProgressHandler
{
  if ([(id)objc_opt_class() conformsToProtocol:&unk_1EF7CCF10])
  {
    unint64_t v3 = self;
    id v4 = [(VNRequest *)v3 progressHandler];
    if (v4)
    {
      objc_initWeak(&location, v3);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __36__VNRequest_detectorProgressHandler__block_invoke;
      aBlock[3] = &unk_1E5B1C858;
      objc_copyWeak(&v10, &location);
      id v9 = v4;
      id v5 = _Block_copy(aBlock);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    else
    {
      id v5 = 0;
    }
    id v6 = _Block_copy(v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __36__VNRequest_detectorProgressHandler__block_invoke(uint64_t a1, void *a2, double a3)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
  }
}

- (void)categorizeFaceObservations:(id)a3 shouldRunDetectorBlock:(id)a4 facesThatNeedNoProcessing:(id)a5 facesThatNeedProcessing:(id)a6 facesThatNeed2DLandmarks:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = (uint64_t (**)(id, void *))a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v11;
  uint64_t v16 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        char v20 = v12[2](v12, v19);
        id v21 = v13;
        if (v20)
        {
          v22 = [v19 landmarkPoints];
          BOOL v23 = v22 == 0;

          if (v23) {
            id v21 = v15;
          }
          else {
            id v21 = v14;
          }
        }
        [v21 addObject:v19];
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }
}

- (id)detectFaceLandmarksInContext:(id)a3 faces:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(VNDetectFaceLandmarksRequest);
  [(VNDetectFaceLandmarksRequest *)v10 applyConfigurationOfRequest:self];
  [(VNDetectFaceLandmarksRequest *)v10 setConstellation:1];
  id v11 = [v8 requestPerformerAndReturnError:a5];
  if (v11
    && ([(VNImageBasedRequest *)v10 setInputFaceObservations:v9],
        v16[0] = v10,
        [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1],
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v11 performDependentRequests:v12 onBehalfOfRequest:self inContext:v8 error:a5],
        v12,
        (v13 & 1) != 0))
  {
    id v14 = [(VNRequest *)v10 results];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_alignFacesInContext:(id)a3 faces:(id)a4 qosClass:(unsigned int)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  v28[1] = *MEMORY[0x1E4F143B8];
  id v26 = a4;
  id v25 = a6;
  id v12 = [a3 session];
  id v13 = v25;
  id v14 = +[VNFaceBBoxAligner supportedComputeStageDevicesForOptions:v13 error:a7];
  id v15 = (void *)[v13 mutableCopy];
  long long v27 = @"VNComputeStageMain";
  uint64_t v16 = objc_msgSend(v14, "objectForKeyedSubscript:");
  uint64_t v17 = [v16 firstObject];
  v28[0] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
  [v15 setObject:v18 forKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];

  id v19 = (void *)[v15 copy];
  char v20 = [v12 detectorOfType:@"VNFaceBoxAlignerType" configuredWithOptions:v19 error:a7];

  if (v20)
  {
    [v13 setObject:v26 forKeyedSubscript:@"VNDetectorProcessOption_InputFaceObservations"];
    id v21 = objc_msgSend(v20, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v9, v13, self, a7, 0, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    v22 = v21;
    if (v21) {
      id v23 = v21;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)detectFacesInContext:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(VNDetectFaceRectanglesRequest);
  [(VNDetectFaceRectanglesRequest *)v7 applyConfigurationOfRequest:self];
  id v8 = [v6 requestPerformerAndReturnError:a4];
  if (v8
    && (v13[0] = v7,
        [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 performDependentRequests:v9 onBehalfOfRequest:self inContext:v6 error:a4],
        v9,
        (v10 & 1) != 0))
  {
    id v11 = [(VNRequest *)v7 results];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)processFaceObservations:(id)a3 revision:(unint64_t)a4 regionOfInterest:(CGRect)a5 detectorType:(id)a6 detectorOptions:(id)a7 shouldAlignFaceBBox:(id)a8 shouldRunDetectorBlock:(id)a9 context:(id)a10 error:(id *)a11
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v130[1] = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  id v61 = a6;
  id v62 = a7;
  v76 = (uint64_t (**)(id, void))a8;
  v75 = (uint64_t (**)(id, void *))a9;
  id v77 = a10;
  [v77 qosClass];
  v60 = [v77 requestPerformerAndReturnError:a11];
  if (!v60)
  {
    id v52 = 0;
    goto LABEL_36;
  }
  v59 = [v77 imageBufferAndReturnError:a11];
  if (v59)
  {
    v58 = [v77 session];
    id v73 = -[VNRequest newDefaultDetectorOptionsForRequestRevision:session:](self, "newDefaultDetectorOptionsForRequestRevision:session:", a4);
    [v73 addEntriesFromDictionary:v62];
    v130[0] = v59;
    char v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:1];
    [v73 setObject:v20 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

    v72 = [v58 detectorOfType:v61 configuredWithOptions:v73 error:a11];
    if (!v72)
    {
      id v52 = 0;
LABEL_34:

      goto LABEL_35;
    }
    dispatch_qos_class_t v67 = [v77 qosClass];
    uint64_t v21 = [v63 count];
    v54 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
    v55 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v21];
    v126[0] = 0;
    v126[1] = v126;
    v126[2] = 0x3812000000;
    v126[3] = __Block_byref_object_copy__5717;
    v126[4] = __Block_byref_object_dispose__5718;
    v126[5] = "";
    int v127 = 0;
    v70 = [(VNRequest *)self requestTasksQueue];
    dispatch_group_t v64 = dispatch_group_create();
    uint64_t v68 = objc_opt_class();
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke;
    aBlock[3] = &unk_1E5B1C790;
    v125 = v126;
    id v56 = v54;
    id v123 = v56;
    id v57 = v55;
    id v124 = v57;
    v71 = _Block_copy(aBlock);
    uint64_t v69 = [v63 count];
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id obj = v63;
    uint64_t v22 = [obj countByEnumeratingWithState:&v118 objects:v129 count:16];
    if (v22)
    {
      uint64_t v66 = *(void *)v119;
      do
      {
        uint64_t v78 = v22;
        for (uint64_t i = 0; i != v78; ++i)
        {
          if (*(void *)v119 != v66) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v118 + 1) + 8 * i);
          uint64_t v112 = 0;
          v113 = &v112;
          uint64_t v114 = 0x3032000000;
          v115 = __Block_byref_object_copy__140;
          v116 = __Block_byref_object_dispose__141;
          id v117 = 0;
          uint64_t v106 = 0;
          v107 = &v106;
          uint64_t v108 = 0x3032000000;
          v109 = __Block_byref_object_copy__140;
          v110 = __Block_byref_object_dispose__141;
          id v111 = 0;
          int v25 = v76[2](v76, v24);
          id v26 = (void *)[v73 mutableCopy];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_142;
          block[3] = &unk_1E5B1C7E0;
          uint64_t v103 = v68;
          dispatch_qos_class_t v104 = v67;
          v101 = &v106;
          block[4] = self;
          id v97 = v77;
          uint64_t v98 = v24;
          id v27 = v26;
          id v99 = v27;
          v102 = &v112;
          BOOL v105 = v69 == 1;
          id v28 = v70;
          id v100 = v28;
          dispatch_block_t v29 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v67, 0, block);
          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3221225472;
          v79[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_3;
          v79[3] = &unk_1E5B1C830;
          uint64_t v88 = v68;
          dispatch_qos_class_t v93 = v67;
          char v94 = v25;
          uint64_t v30 = v29;
          id v84 = v30;
          v86 = &v112;
          v87 = &v106;
          id v31 = v27;
          id v80 = v31;
          id v32 = v72;
          CGFloat v89 = x;
          CGFloat v90 = y;
          CGFloat v91 = width;
          CGFloat v92 = height;
          id v81 = v32;
          v82 = self;
          id v33 = v71;
          id v85 = v33;
          BOOL v95 = v69 == 1;
          id v34 = v28;
          id v83 = v34;
          v35 = (void (**)(void))dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v67, 0, v79);
          if (v25)
          {
            if (v69 == 1) {
              v30[2](v30);
            }
            else {
              [v34 dispatchGroupAsyncByPreservingQueueCapacity:v64 block:v30];
            }
          }
          else
          {
            uint64_t v128 = v24;
            uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v128 count:1];
            v37 = (void *)v107[5];
            v107[5] = v36;

            v38 = objc_alloc_init(VNAsyncStatus);
            v39 = (void *)v113[5];
            v113[5] = (uint64_t)v38;
          }
          v40 = [(id)v107[5] firstObject];
          int v41 = v75[2](v75, v40);

          if (v41)
          {
            if (v69 == 1) {
              v35[2](v35);
            }
            else {
              [v34 dispatchGroupAsyncByPreservingQueueCapacity:v64 block:v35];
            }
          }
          else
          {
            if (v25 && dispatch_block_wait(v30, 0xFFFFFFFFFFFFFFFFLL))
            {
              v42 = +[VNError errorForExecutionTimeoutWithLocalizedDescription:@"Timed out waiting for dependent task execution"];
              v43 = [[VNAsyncStatus alloc] initWithStatus:0 error:v42];
              v44 = (void *)v113[5];
              v113[5] = (uint64_t)v43;
            }
            (*((void (**)(id, uint64_t, uint64_t))v71 + 2))(v33, v107[5], v113[5]);
          }

          _Block_object_dispose(&v106, 8);
          _Block_object_dispose(&v112, 8);
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v118 objects:v129 count:16];
      }
      while (v22);
    }

    v45 = a11;
    if (v69 == 1 || (char v46 = [v70 dispatchGroupWait:v64 error:a11], v45 = a11, (v46 & 1) != 0))
    {
      if (+[VNValidationUtilities validateAsyncStatusResults:v57 error:v45])
      {
        id v52 = v56;
LABEL_33:

        _Block_object_dispose(v126, 8);
        goto LABEL_34;
      }
    }
    else
    {
      VNValidatedLog(4, @"Timed out waiting for processing face observations: %@", v47, (uint64_t)a11, v48, v49, v50, v51, (uint64_t)obj);
    }
    id v52 = 0;
    goto LABEL_33;
  }
  id v52 = 0;
LABEL_35:

LABEL_36:

  return v52;
}

void __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 48));
  [*(id *)(a1 + 32) addObjectsFromArray:v6];
  [*(id *)(a1 + 40) addObject:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 48));
}

void __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_142(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  VNValidatedLog(1, @"alignFaceBlock: start processing: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 88));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_2;
  aBlock[3] = &unk_1E5B1C7B8;
  int v32 = *(_DWORD *)(a1 + 96);
  uint64_t v9 = *(void *)(a1 + 32);
  char v10 = *(void **)(a1 + 40);
  uint64_t v31 = *(void *)(a1 + 72);
  void aBlock[4] = v9;
  id v11 = v10;
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = *(void **)(a1 + 56);
  id v28 = v11;
  uint64_t v29 = v12;
  id v30 = v13;
  id v14 = (uint64_t (**)(void *, id *))_Block_copy(aBlock);
  id v26 = 0;
  uint64_t v15 = v14[2](v14, &v26);
  id v16 = v26;
  uint64_t v17 = [[VNAsyncStatus alloc] initWithStatus:v15 error:v16];
  uint64_t v18 = *(void *)(*(void *)(a1 + 80) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  VNValidatedLog(1, @"alignFaceBlock: finish processing: %@", v20, v21, v22, v23, v24, v25, *(void *)(a1 + 88));
  if (!*(unsigned char *)(a1 + 100)) {
    [*(id *)(a1 + 64) dispatchReportBlockCompletion];
  }
}

void __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  VNValidatedLog(1, @"processFaceBlock: start processing: %@", a3, a4, a5, a6, a7, a8, *(void *)(a1 + 96));
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_4;
  aBlock[3] = &unk_1E5B1C808;
  int v33 = *(_DWORD *)(a1 + 136);
  char v34 = *(unsigned char *)(a1 + 140);
  id v29 = *(id *)(a1 + 64);
  long long v30 = *(_OWORD *)(a1 + 80);
  id v26 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  long long v10 = *(_OWORD *)(a1 + 120);
  long long v31 = *(_OWORD *)(a1 + 104);
  long long v32 = v10;
  uint64_t v11 = *(void *)(a1 + 48);
  id v27 = v9;
  uint64_t v28 = v11;
  uint64_t v12 = _Block_copy(aBlock);
  id v24 = 0;
  uint64_t v13 = VNExecuteBlock(v12, (uint64_t)&v24);
  id v14 = v24;
  uint64_t v15 = [[VNAsyncStatus alloc] initWithStatus:v13 error:v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  VNValidatedLog(1, @"processFaceBlock: finish processing: %@", v18, v19, v20, v21, v22, v23, *(void *)(a1 + 96));
  if (!*(unsigned char *)(a1 + 141)) {
    [*(id *)(a1 + 56) dispatchReportBlockCompletion];
  }
}

BOOL __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_4(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 116))
  {
    if (dispatch_block_wait(*(dispatch_block_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL))
    {
      if (a2)
      {
        id v4 = +[VNError errorForExecutionTimeoutWithLocalizedDescription:@"Timed out waiting for dependent task execution"];
LABEL_11:
        id v9 = v4;
        BOOL result = 0;
        *a2 = v9;
        return result;
      }
      return 0;
    }
    if (([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) completed] & 1) == 0)
    {
      if (a2)
      {
        id v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error];
        goto LABEL_11;
      }
      return 0;
    }
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count]) {
    return 1;
  }
  [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forKeyedSubscript:@"VNDetectorProcessOption_InputFaceObservations"];
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 40), "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", *(unsigned int *)(a1 + 112), *(void *)(a1 + 32), *(void *)(a1 + 48), a2, 0, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) != 0;
}

BOOL __149__VNRequest_processFaceObservations_revision_regionOfInterest_detectorType_detectorOptions_shouldAlignFaceBBox_shouldRunDetectorBlock_context_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v11[0] = *(void *)(a1 + 48);
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v7 = [v4 _alignFacesInContext:v5 faces:v6 qosClass:*(unsigned int *)(a1 + 72) options:*(void *)(a1 + 56) error:a2];
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  return *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0;
}

- (double)executionTimeInternal
{
  return (double)[(VNRequest *)self executionNanoseconds] / 1000000000.0;
}

- (unint64_t)executionNanoseconds
{
  return self->_executionNanoseconds;
}

- (NSString)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v18.receiver = self;
  v18.super_class = (Class)VNRequest;
  id v4 = [(VNRequest *)&v18 description];
  uint64_t v5 = [(VNRequest *)self specifier];
  uint64_t v6 = (void *)[v3 initWithFormat:@"%@ %@", v4, v5];

  [(VNRequest *)self computeStageDeviceAssignments];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v7 objectForKeyedSubscript:v11];
        [v6 appendFormat:@" %@=%@", v11, v12, (void)v14];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  if ([(VNRequest *)self preferBackgroundProcessing]) {
    [v6 appendString:@" preferBackgroundProcessing"];
  }

  return (NSString *)v6;
}

- (unint64_t)applicableRevisionForDependentRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = objc_msgSend(v5, "applicableRevisionForDependentRequestOfClass:beingPerformedByRevision:", objc_opt_class(), -[VNRequest resolvedRevision](self, "resolvedRevision"));

  return v6;
}

- (BOOL)validateImageBuffer:(id)a3 ofNonZeroWidth:(unint64_t *)a4 andHeight:(unint64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = v10;
  if (!v10)
  {
    if (a6)
    {
      +[VNError errorForInvalidArgument:0 named:@"imageBuffer"];
      BOOL v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  unint64_t v12 = [v10 width];
  unint64_t v13 = [v11 height];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __64__VNRequest_validateImageBuffer_ofNonZeroWidth_andHeight_error___block_invoke;
  v16[3] = &unk_1E5B20040;
  v16[4] = self;
  if (!+[VNValidationUtilities validateNonZeroImageWidth:v12 height:v13 componentNameProvidingBlock:v16 error:a6])goto LABEL_10; {
  if (a4)
  }
    *a4 = v12;
  if (a5) {
    *a5 = v13;
  }
  BOOL v14 = 1;
LABEL_11:

  return v14;
}

NSString *__64__VNRequest_validateImageBuffer_ofNonZeroWidth_andHeight_error___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v0);
}

- (void)setMaximumProcessingDimensionOnTheLongSide:(unint64_t)a3
{
}

- (unint64_t)maximumProcessingDimensionOnTheLongSide
{
  return [(VNRequestConfiguration *)self->_configuration maximumProcessingDimensionOnTheLongSide];
}

- (void)setDetectionLevel:(unint64_t)a3
{
}

- (void)setMetalContextPriority:(unint64_t)a3
{
}

- (unint64_t)metalContextPriority
{
  return [(VNRequestConfiguration *)self->_configuration metalContextPriority];
}

- (void)setUsesCPUOnly:(BOOL)usesCPUOnly
{
  if (usesCPUOnly)
  {
    uint64_t v4 = +[VNProcessingDevice defaultCPUDevice];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  [(VNRequestConfiguration *)self->_configuration setProcessingDevice:v4];
}

- (BOOL)usesCPUOnly
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [(VNRequestConfiguration *)self->_configuration processingDevice];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 targetsCPU];
  }
  else
  {
    unint64_t v6 = [(VNRequestConfiguration *)self->_configuration computeStageDeviceAssignments];
    id v7 = [v6 allValues];

    if ([v7 count])
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v14;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v8);
            }
            if (!+[VNComputeDeviceUtilities isCPUComputeDevice:](VNComputeDeviceUtilities, "isCPUComputeDevice:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
            {
              char v5 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      char v5 = 1;
LABEL_14:
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (void)setPreferredMetalContext:(id)a3
{
  id v8 = a3;
  id v4 = [(VNRequest *)self preferredMetalContext];
  if (v4 != v8)
  {
    char v5 = [MEMORY[0x1E4F1CA98] null];
    int v6 = [v5 isEqual:v8];

    if (v6)
    {
    }
    else if (v8)
    {
      id v7 = +[VNProcessingDevice deviceForMetalDevice:](VNProcessingDevice, "deviceForMetalDevice:");
LABEL_7:
      [(VNRequestConfiguration *)self->_configuration setProcessingDevice:v7];

      goto LABEL_8;
    }
    id v8 = 0;
    id v7 = 0;
    goto LABEL_7;
  }
LABEL_8:
}

- (MTLDevice)preferredMetalContext
{
  id v3 = [(VNRequest *)self processingDevice];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 metalDevice];
  }
  else
  {
    int v6 = [(VNRequest *)self computeDeviceForComputeStage:@"VNComputeStageMain"];
    if (v6)
    {
      char v5 = +[VNComputeDeviceUtilities metalDeviceForComputeDevice:v6];
    }
    else
    {
      char v5 = 0;
    }
  }

  return (MTLDevice *)v5;
}

- (void)setPreferBackgroundProcessing:(BOOL)preferBackgroundProcessing
{
}

- (BOOL)cancellationTriggeredAndReturnError:(id *)a3
{
  BOOL v5 = [(VNRequest *)self cancellationTriggered];
  BOOL v6 = v5;
  if (a3 && v5)
  {
    *a3 = +[VNError errorForCancellationOfRequest:self];
  }
  return v6;
}

- (BOOL)cancellationTriggered
{
  return self->_cancellationTriggered;
}

- (void)cancel
{
  p_cancellationResourcesLock = &self->_cancellationResourcesLock;
  os_unfair_lock_lock(&self->_cancellationResourcesLock);
  BOOL v5 = self->_canceller;
  id v4 = self->_cancellationSemaphore;
  os_unfair_lock_unlock(p_cancellationResourcesLock);
  self->_cancellationTriggered = 1;
  [(VNCanceller *)v5 signalCancellation];
  if (v4) {
    dispatch_semaphore_signal((dispatch_semaphore_t)v4);
  }
}

- (id)warnings
{
  warningRecorder = self->_warningRecorder;
  if (warningRecorder)
  {
    id v3 = [(VNWarningRecorder *)warningRecorder warnings];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v3;
}

- (id)valueForWarning:(id)a3
{
  id v3 = [(VNWarningRecorder *)self->_warningRecorder valueForWarning:a3];

  return v3;
}

- (void)recordWarning:(id)a3 value:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  warningRecorder = self->_warningRecorder;
  if (!warningRecorder)
  {
    id v8 = objc_alloc_init(VNWarningRecorder);
    uint64_t v9 = self->_warningRecorder;
    self->_warningRecorder = v8;

    warningRecorder = self->_warningRecorder;
  }
  [(VNWarningRecorder *)warningRecorder recordWarning:v10 value:v6];
}

- (void)setProcessedResults:(id)a3
{
  id v6 = a3;
  id v4 = (NSArray *)[v6 copy];
  results = self->_results;
  self->_results = v4;
}

- (void)setResults:(id)a3 assignedWithOriginatingSpecifier:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (v4)
  {
    id v6 = [(VNRequest *)self specifier];
    uint64_t v7 = [v9 VNObservationsWithOriginatingRequestSpecifier:v6];

    id v8 = (id)v7;
  }
  else
  {
    id v8 = v9;
  }
  id v10 = v8;
  -[VNRequest setProcessedResults:](self, "setProcessedResults:");
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 1;
}

- (void)setResults:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    [(VNRequest *)self setResults:v5 assignedWithOriginatingSpecifier:[(VNRequest *)self resultsAreAssignedWithOriginatingRequestSpecifier]];
  }
  else
  {
    results = self->_results;
    self->_results = 0;
  }
}

- (BOOL)internalCancelInContext:(id)a3 error:(id *)a4
{
  BOOL v4 = [(VNRequest *)self cancellerAndReturnError:a4];
  id v5 = v4;
  if (v4) {
    [v4 signalCancellation];
  }

  return v5 != 0;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[VNError errorForUnimplementedMethod:a2 ofObject:self];
  }
  return 0;
}

- (BOOL)validateConfigurationAndReturnError:(id *)a3
{
  warningRecorder = self->_warningRecorder;
  self->_warningRecorder = 0;

  self->_executionNanoseconds = 0;
  if ([(VNRequest *)self hasCancellationHook])
  {
    id v5 = [NSString alloc];
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = VNRequestRevisionString(v6, [(VNRequest *)self resolvedRevision]);
    id v8 = (void *)[v5 initWithFormat:@"com.apple.%@", v7];

    os_unfair_lock_lock(&self->_cancellationResourcesLock);
    id v9 = objc_alloc_init(VNCanceller);
    canceller = self->_canceller;
    self->_canceller = v9;

    uint64_t v11 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    cancellationSemaphore = self->_cancellationSemaphore;
    self->_cancellationSemaphore = v11;

    id v13 = v8;
    long long v14 = (const char *)[v13 UTF8String];
    long long v15 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v16 = (OS_dispatch_queue *)dispatch_queue_create(v14, v15);
    cancellationQueue = self->_cancellationQueue;
    self->_cancellationQueue = v16;

    os_unfair_lock_unlock(&self->_cancellationResourcesLock);
  }
  self->_cancellationTriggered = 0;
  return 1;
}

- (BOOL)performInContext:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 serialNumber];
  unint64_t v8 = [(VNRequest *)self resolvedRevision];
  id v9 = [(VNRequest *)self frameworkClass];
  int v10 = [(objc_class *)v9 VNClassCode];
  kdebug_trace();
  uint64_t v36 = mach_absolute_time();
  id v62 = 0;
  BOOL v11 = [(VNRequest *)self cancellationTriggeredAndReturnError:&v62];
  id v12 = v62;
  if (v11)
  {
    BOOL v13 = 0;
  }
  else
  {
    if ([(objc_class *)v9 supportsAnyRevision:v8])
    {
      long long v14 = [v6 cachedObservationsAcceptedByRequest:self];
      if (v14)
      {
        kdebug_trace();
        [(VNRequest *)self setResults:v14 assignedWithOriginatingSpecifier:0];
        BOOL v13 = 1;
      }
      else
      {
        uint64_t v58 = 0;
        v59 = &v58;
        uint64_t v60 = 0x2020000000;
        char v61 = 0;
        uint64_t v33 = [(VNRequest *)self hasCancellationHook];
        if (v33)
        {
          os_unfair_lock_lock(&self->_cancellationResourcesLock);
          queue = self->_cancellationQueue;
          long long v15 = self->_cancellationSemaphore;
          os_unfair_lock_unlock(&self->_cancellationResourcesLock);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __36__VNRequest_performInContext_error___block_invoke;
          block[3] = &unk_1E5B1C768;
          v54 = &v58;
          uint64_t v55 = v7;
          dispatch_semaphore_t dsema = v15;
          dispatch_semaphore_t v51 = dsema;
          id v52 = self;
          unint64_t v56 = v8;
          int v57 = v10;
          id v53 = v6;
          dispatch_async((dispatch_queue_t)queue, block);
        }
        else
        {
          dispatch_semaphore_t dsema = 0;
          queue = 0;
        }
        *((unsigned char *)v59 + 24) = 1;
        id v49 = v12;
        BOOL v13 = [(VNRequest *)self internalPerformRevision:v8 inContext:v6 error:&v49];
        id v16 = v49;

        id v12 = v16;
        if (v13)
        {
          if (([(id)objc_opt_class() setsTimeRangeOnResults] & 1) == 0)
          {
            long long v17 = [v6 imageBufferAndReturnError:0];
            uint64_t v48 = 0;
            long long v47 = 0u;
            long long v45 = 0u;
            memset(v46, 0, sizeof(v46));
            long long v31 = v17;
            if (v17)
            {
              [v17 timingInfo];
            }
            else
            {
              long long v18 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
              v46[1] = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
              long long v47 = v18;
              uint64_t v48 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
              long long v19 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
              long long v45 = *MEMORY[0x1E4F1FA70];
              v46[0] = v19;
            }
            memset(&v44, 0, sizeof(v44));
            if (BYTE4(v46[1]))
            {
              CMTime start = *(CMTime *)((char *)v46 + 8);
              *(_OWORD *)&duration.value = v45;
              duration.epoch = *(void *)&v46[0];
              CMTimeRangeMake(&v44, &start, &duration);
            }
            else
            {
              long long v20 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
              *(_OWORD *)&v44.start.value = *MEMORY[0x1E4F1FA30];
              *(_OWORD *)&v44.start.epoch = v20;
              *(_OWORD *)&v44.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
            }
            long long v40 = 0u;
            long long v41 = 0u;
            long long v38 = 0u;
            long long v39 = 0u;
            uint64_t v21 = [(VNRequest *)self results];
            uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v63 count:16];
            if (v22)
            {
              uint64_t v23 = *(void *)v39;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v39 != v23) {
                    objc_enumerationMutation(v21);
                  }
                  uint64_t v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                  CMTimeRange v37 = v44;
                  [v25 setTimeRange:&v37];
                }
                uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v63 count:16];
              }
              while (v22);
            }
          }
          [v6 recordSequencedObservationsOfRequest:self];
        }
        else
        {
          [(VNRequest *)self setResults:0];
        }
        [v6 cacheObservationsOfRequest:self];
        *((unsigned char *)v59 + 24) = 0;
        if (v33)
        {
          dispatch_semaphore_signal(dsema);
          dispatch_sync((dispatch_queue_t)queue, &__block_literal_global_5787);
        }

        _Block_object_dispose(&v58, 8);
        long long v14 = 0;
      }
    }
    else
    {
      +[VNError errorForUnsupportedRevision:v8 ofRequest:self];
      BOOL v13 = 0;
      long long v14 = v12;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  self->_executionNanoseconds = mach_absolute_time() - v36;
  uint64_t v26 = [(VNRequest *)self completionHandler];
  id v27 = (void *)v26;
  if (v26)
  {
    if (v13) {
      id v28 = 0;
    }
    else {
      id v28 = v12;
    }
    (*(void (**)(uint64_t, VNRequest *, id))(v26 + 16))(v26, self, v28);
  }
  if (a4) {
    char v29 = v13;
  }
  else {
    char v29 = 1;
  }
  if ((v29 & 1) == 0) {
    *a4 = v12;
  }
  kdebug_trace();

  return v13;
}

void __36__VNRequest_performInContext_error___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    kdebug_trace();
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    id v13 = 0;
    char v4 = [v2 internalCancelInContext:v3 error:&v13];
    id v5 = v13;
    id v12 = v5;
    if ((v4 & 1) == 0) {
      VNValidatedLog(4, @"Encountered error cancelling request: %@", v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    }
  }
}

- (void)performInContextAsync:(id)a3 asyncDispatchQueue:(id)a4 asyncDispatchGroup:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [&stru_1EF75C0C0 UTF8String];
  [v8 qosClass];
  objc_initWeak(&location, self);
  dispatch_qos_class_t v11 = [v8 qosClass];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  long long v17 = __73__VNRequest_performInContextAsync_asyncDispatchQueue_asyncDispatchGroup___block_invoke;
  long long v18 = &unk_1E5B1C740;
  objc_copyWeak(&v21, &location);
  id v12 = v8;
  id v19 = v12;
  id v13 = v9;
  id v20 = v13;
  dispatch_block_t v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v11, 0, &v15);
  objc_msgSend(v13, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v10, v14, v15, v16, v17, v18);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __73__VNRequest_performInContextAsync_asyncDispatchQueue_asyncDispatchGroup___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = objc_opt_class();
    [WeakRetained resolvedRevision];
    VNValidatedLog(1, @"performInContextAsync: start processing: %@; revision: %lu",
      v4,
      v5,
      v6,
      v7,
      v8,
      v9,
      v3);
    [&stru_1EF75C0C0 UTF8String];
    [a1[4] qosClass];
    id v10 = a1[4];
    id v20 = 0;
    uint64_t v11 = [WeakRetained performInContext:v10 error:&v20];
    id v12 = v20;
    [WeakRetained setAsyncStatus:v11 error:v12];
    uint64_t v13 = objc_opt_class();
    [WeakRetained resolvedRevision];
    VNValidatedLog(1, @"performInContextAsync: finish processing: %@; revision: %lu",
      v14,
      v15,
      v16,
      v17,
      v18,
      v19,
      v13);
    [a1[5] dispatchReportBlockCompletion];
  }
  else
  {
    id v12 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Currently executed Request should not be nil"];
    [0 setAsyncStatus:0 error:v12];
  }
}

- (void)applyConfigurationOfRequest:(id)a3
{
  uint64_t v4 = (VNRequest *)a3;
  if (v4 != self)
  {
    self->_unint64_t revision = [(VNRequest *)v4 applicableRevisionForDependentRequest:self];
    [(VNRequestConfiguration *)self->_configuration setResolvedRevision:0];
    [(VNRequest *)self applyCompatibleComputeStageDeviceAssignmentsOfRequest:v4];
    [(VNRequestConfiguration *)self->_configuration setDetectionLevel:[(VNRequest *)v4 detectionLevel]];
    [(VNRequestConfiguration *)self->_configuration setMetalContextPriority:[(VNRequest *)v4 metalContextPriority]];
    [(VNRequestConfiguration *)self->_configuration setModelExecutionPriority:[(VNRequest *)v4 modelExecutionPriority]];
    [(VNRequestConfiguration *)self->_configuration setPreferBackgroundProcessing:[(VNRequest *)v4 preferBackgroundProcessing]];
    [(VNRequestConfiguration *)self->_configuration setModelFileBackingStore:[(VNRequest *)v4 modelFileBackingStore]];
    [(VNRequestConfiguration *)self->_configuration setMaximumProcessingDimensionOnTheLongSide:[(VNRequest *)v4 maximumProcessingDimensionOnTheLongSide]];
    [(VNRequestConfiguration *)self->_configuration setMemoryPoolId:[(VNRequest *)v4 ioSurfaceMemoryPoolId]];
  }
}

- (void)applyCompatibleComputeStageDeviceAssignmentsOfRequest:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = [a3 configuration];
  uint64_t v3 = [v17 processingDevice];
  if (v3)
  {
    [(VNRequestConfiguration *)self->_configuration setProcessingDevice:v3];
  }
  else
  {
    uint64_t v15 = 0;
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = [v17 computeStageDeviceAssignments];
    if ([v4 count])
    {
      [(VNRequest *)self supportedComputeStageDevicesAndReturnError:0];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v20 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            id v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, v15);
            if (v10)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                configuration = self->_configuration;
                uint64_t v14 = [v10 processingDevice];
                [(VNRequestConfiguration *)configuration setProcessingDevice:v14];

                goto LABEL_19;
              }
              uint64_t v11 = [v5 objectForKeyedSubscript:v9];
              id v12 = +[VNComputeDeviceUtilities computeDeviceOfComputeDevices:v11 mostCompatibleWithComputeDevice:v10 options:0];

              if (v12) {
                [v18 setObject:v12 forKeyedSubscript:v9];
              }
            }
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
    -[VNRequestConfiguration setComputeStageDeviceAssignments:](self->_configuration, "setComputeStageDeviceAssignments:", v18, v15);
LABEL_19:

    uint64_t v3 = v15;
  }
}

- (void)copyStateOfRequest:(id)a3
{
  id v11 = a3;
  -[VNRequest applyConfigurationOfRequest:](self, "applyConfigurationOfRequest:");
  -[VNRequest _setResolvedRevision:](self, "_setResolvedRevision:", [v11 revision]);
  uint64_t v4 = [v11 results];
  id v5 = (NSArray *)[v4 copy];
  results = self->_results;
  self->_results = v5;

  warningRecorder = self->_warningRecorder;
  if (!warningRecorder)
  {
    uint64_t v8 = objc_alloc_init(VNWarningRecorder);
    uint64_t v9 = self->_warningRecorder;
    self->_warningRecorder = v8;

    warningRecorder = self->_warningRecorder;
  }
  id v10 = [v11 warnings];
  [(VNWarningRecorder *)warningRecorder setWarnings:v10];
}

- (void)resetAsyncStatus
{
}

- (void)setAsyncStatus:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  os_unfair_lock_lock(&self->_asyncStatusLock);
  uint64_t v6 = [[VNAsyncStatus alloc] initWithStatus:v4 error:v8];
  asyncStatus = self->_asyncStatus;
  self->_asyncStatus = v6;

  os_unfair_lock_unlock(&self->_asyncStatusLock);
}

- (VNAsyncStatus)asyncStatus
{
  p_asyncStatusLock = &self->_asyncStatusLock;
  os_unfair_lock_lock(&self->_asyncStatusLock);
  BOOL v4 = (void *)[(VNAsyncStatus *)self->_asyncStatus copy];
  os_unfair_lock_unlock(p_asyncStatusLock);

  return (VNAsyncStatus *)v4;
}

- (id)newDefaultDetectorOptionsForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:[(VNRequest *)self resolvedRevision] session:v4];

  return v5;
}

- (id)newDuplicateInstance
{
  id v3 = objc_alloc((Class)objc_opt_class());
  id completionHandler = self->_completionHandler;

  return (id)[v3 initWithCompletionHandler:completionHandler];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(VNRequest *)self newDuplicateInstance];
  id v5 = v4;
  if (v4) {
    [v4 copyStateOfRequest:self];
  }
  return v5;
}

- (BOOL)hasCancellationHook
{
  return 0;
}

- (id)sequencedRequestPreviousObservationsKey
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unint64_t v6 = [(VNRequest *)self resolvedRevision];
  uint64_t v7 = [(VNRequest *)self preferredMetalContext];
  id v8 = [v7 name];
  uint64_t v9 = (void *)[v3 initWithFormat:@"%@-%lu:MTL=%@:Det=%lu:MDm=%lu", v5, v6, v8, -[VNRequest detectionLevel](self, "detectionLevel"), -[VNRequest maximumProcessingDimensionOnTheLongSide](self, "maximumProcessingDimensionOnTheLongSide")];

  return v9;
}

- (BOOL)wantsSequencedRequestObservationsRecording
{
  return 0;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(VNRequest *)self frameworkClass];
  if (v5 == (objc_class *)[v4 requestClass])
  {
    unint64_t v7 = [(VNRequest *)self resolvedRevision];
    uint64_t v8 = [v4 resolvedRevision];
    if (v7 == v8) {
      char v6 = 1;
    }
    else {
      char v6 = [(objc_class *)v5 revision:v7 mayAcceptResultsProducedByRevision:v8];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)allowsCachingOfResults
{
  return 1;
}

- (unint64_t)serialNumber
{
  return self->_serialNumber;
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(0, self);
}

- (VNControlledCapacityTasksQueue)requestTasksQueue
{
  uint64_t v2 = +[VNRequestAsyncTasksQueueCache sharedCache];
  id v3 = [v2 queueWithUniqueAppendix:&stru_1EF75C0C0];

  return (VNControlledCapacityTasksQueue *)v3;
}

+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4
{
  if (a1 == a3) {
    return a4;
  }
  uint64_t v7 = [a1 dependentRequestMappingTable];
  if (v7)
  {
    uint64_t v8 = *(void *)v7;
    if (*(void *)v7)
    {
      while (v8 != a4 || *(Class *)(v7 + 8) != a3)
      {
        uint64_t v9 = *(void *)(v7 + 24);
        v7 += 24;
        uint64_t v8 = v9;
        if (!v9) {
          goto LABEL_7;
        }
      }
      return *(void *)(v7 + 16);
    }
  }
LABEL_7:
  unint64_t v10 = [(objc_class *)a3 defaultRevision];
  id v11 = (unint64_t *)[a1 dependentRequestCompatibility];
  if (v11)
  {
    unint64_t v12 = *v11;
    if (*v11)
    {
      unint64_t v13 = 0;
      uint64_t v14 = v11 + 2;
      do
      {
        if (v12 == a4 && (Class)*(v14 - 1) == a3)
        {
          unint64_t v15 = *v14;
          if (*v14 < 0xDECAF000)
          {
            if (v15 == v10) {
              return v10;
            }
            if (v15 > v13) {
              unint64_t v13 = *v14;
            }
          }
          else
          {
            id v16 = [NSString alloc];
            uint64_t v17 = VNMethodSignatureStringForObjectAndSelector(a1, sel_dependentRequestCompatibility);
            id v18 = VNRequestRevisionString((objc_class *)a1, *(v14 - 2));
            long long v19 = VNRequestRevisionString((objc_class *)*(v14 - 1), *v14);
            long long v20 = (void *)[v16 initWithFormat:@"%@ contains an entry for %@ that is dependent on a private revision %@", v17, v18, v19];

            +[VNError VNAssert:0 log:v20];
          }
        }
        unint64_t v12 = v14[1];
        v14 += 3;
      }
      while (v12);
      if (v13) {
        return v13;
      }
    }
  }

  return [(objc_class *)a3 resolvedRevisionForRevision:0];
}

+ (const)dependentRequestMappingTable
{
  return 0;
}

+ (const)dependentRequestCompatibility
{
  return 0;
}

+ (NSIndexSet)allSupportedRevisions
{
  id v3 = [a1 supportedRevisions];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [a1 supportedPrivateRevisions];
  [v4 addIndexes:v5];

  return (NSIndexSet *)v4;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  return 0;
}

+ (unint64_t)firstSupportedRevisionInOrderedRevisionList:(unint64_t)a3
{
  unint64_t v3 = a3;
  if (a3)
  {
    uint64_t v9 = (unint64_t *)&v10;
    id v5 = (void *)MEMORY[0x1A6257080](a1, a2);
    char v6 = [a1 allSupportedRevisions];
    do
    {
      if ([v6 containsIndex:v3]) {
        break;
      }
      uint64_t v7 = v9++;
      unint64_t v3 = *v7;
    }
    while (*v7);
  }
  return v3;
}

+ (BOOL)supportsAnyRevision:(unint64_t)a3
{
  if (objc_msgSend(a1, "supportsRevision:")) {
    return 1;
  }

  return [a1 supportsPrivateRevision:a3];
}

+ (BOOL)supportsRevision:(unint64_t)a3
{
  id v4 = [a1 supportedRevisions];
  LOBYTE(a3) = [v4 containsIndex:a3];

  return a3;
}

+ (BOOL)setsTimeRangeOnResults
{
  return 0;
}

+ (NSUInteger)currentRevision
{
  unint64_t v3 = [a1 supportedRevisions];
  NSUInteger v4 = [v3 lastIndex];

  if (v4 == 0x7FFFFFFFFFFFFFFFLL || !v4)
  {
    NSUInteger v4 = [a1 defaultRevision];
    if (!v4)
    {
      id v5 = [NSString alloc];
      char v6 = NSStringFromClass((Class)[a1 frameworkClass]);
      uint64_t v7 = (void *)[v5 initWithFormat:@"%@ must provide at least one supported revision", v6];

      +[VNError VNAssert:0 log:v7];
      return 0;
    }
  }
  return v4;
}

+ (NSIndexSet)supportedRevisions
{
  unint64_t v3 = [a1 publicRevisionsSet];
  if ([a1 supportedRevisionsAreFilteredBasedOnAvailableComputeDevices])
  {
    uint64_t v4 = [a1 _runtimeAvailableRevisionsOfRevisions:v3];

    unint64_t v3 = (void *)v4;
  }

  return (NSIndexSet *)v3;
}

+ (BOOL)getOptionalArray:(id *)a3 forKey:(id)a4 inOptions:(id)a5 withElementsOfClass:(Class)a6 error:(id *)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v30 = 0;
  unint64_t v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionarCGFloat y = _getObjectFromOptionsDictionary(&v30, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v30;
  id v16 = v15;
  if (ObjectFromOptionsDictionary)
  {
    if (a6)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(v17);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a7)
              {
                id v22 = [NSString alloc];
                uint64_t v23 = NSStringFromClass(a6);
                uint64_t v24 = (void *)[v22 initWithFormat:@"All elements in the %@ array must be of class %@ (%@)", v11, v23, v17];

                *a7 = +[VNError errorWithCode:5 message:v24];
              }
              goto LABEL_18;
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v31 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
    }
    if (a3) {
      *a3 = (id)[v16 copy];
    }
    BOOL v21 = 1;
  }
  else
  {
LABEL_18:
    BOOL v21 = 0;
  }

  return v21;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(float)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v20 = 0;
  unint64_t v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionarCGFloat y = _getObjectFromOptionsDictionary(&v20, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v20;
  id v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15)
    {
      [v15 floatValue];
      a6 = v18;
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getFloatValue:(float *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v18 = 0;
  id v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionarCGFloat y = _getObjectFromOptionsDictionary(&v18, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v18;
  uint64_t v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15)
  {
    [v13 floatValue];
    *(_DWORD *)a3 = v16;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 withDefaultValue:(double)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a5;
  id v20 = 0;
  id v13 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionarCGFloat y = _getObjectFromOptionsDictionary(&v20, v12, v11, 0, v13, (uint64_t)a7);
  id v15 = v20;
  int v16 = v15;
  if (a3) {
    char v17 = ObjectFromOptionsDictionary;
  }
  else {
    char v17 = 0;
  }
  if (v17)
  {
    if (v15)
    {
      [v15 doubleValue];
      a6 = v18;
    }
    *a3 = a6;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getDoubleValue:(double *)a3 forKey:(id)a4 inOptions:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  id v18 = 0;
  id v11 = (objc_class *)objc_opt_class();
  ObjectFromOptionsDictionarCGFloat y = _getObjectFromOptionsDictionary(&v18, v10, v9, 1, v11, (uint64_t)a6);
  id v13 = v18;
  uint64_t v14 = v13;
  if (a3) {
    char v15 = ObjectFromOptionsDictionary;
  }
  else {
    char v15 = 0;
  }
  if (v15)
  {
    [v13 doubleValue];
    *(void *)a3 = v16;
  }

  return ObjectFromOptionsDictionary;
}

+ (BOOL)getRequiredObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7
{
  return _getObjectFromOptionsDictionary(a3, a6, a5, 1, a4, (uint64_t)a7);
}

+ (BOOL)getOptionalObject:(id *)a3 ofClass:(Class)a4 forKey:(id)a5 inOptions:(id)a6 error:(id *)a7
{
  return _getObjectFromOptionsDictionary(a3, a6, a5, 0, a4, (uint64_t)a7);
}

+ (BOOL)revision:(unint64_t)a3 mayAcceptResultsProducedByRevision:(unint64_t)a4
{
  if (a3 == a4) {
    return 1;
  }
  uint64_t v8 = +[VNRequestSpecifier specifierForRequestClass:a1 revision:a3 error:0];
  id v9 = +[VNRequestSpecifier specifierForRequestClass:a1 revision:a4 error:0];
  char v10 = [v8 hasModelEquivalencyToRequestSpecifier:v9];
  BOOL v12 = a3 < 0xDECAF000 && a4 < 0xDECAF000;
  BOOL v4 = (v10 & 1) != 0 || v12;

  return v4;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (unsigned)VNClassCode
{
  unsigned int v3 = 0;
  +[VNClassRegistrar getClassCode:&v3 forClass:a1 error:0];
  return v3;
}

- (id)utilizedResourcesWithError:(id *)a3
{
  if (a3)
  {
    BOOL v4 = [(VNRequest *)self specifier];
    *a3 = +[VNError errorForInvalidOperationForRequestSpecifier:v4];
  }
  return 0;
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)VNImageProcessingSessionPrintKeyPath
{
  return 0;
}

- (id)VNImageProcessingSessionPrintAndReturnError:(id *)a3
{
  id v5 = [(VNRequest *)self VNImageProcessingSessionPrintKeyPath];
  if (v5)
  {
    char v6 = [(VNRequest *)self results];
    if ([v6 count] == 1)
    {
      uint64_t v7 = [v6 firstObject];
      uint64_t v8 = [v7 valueForKeyPath:v5];
    }
    else
    {
      if (!a3)
      {
        uint64_t v8 = 0;
        goto LABEL_10;
      }
      uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"%@ did not generate a single print", self];
      +[VNError errorForInvalidOptionWithLocalizedDescription:v7];
      uint64_t v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (!a3)
    {
      uint64_t v8 = 0;
      goto LABEL_11;
    }
    char v6 = [(VNRequest *)self specifier];
    +[VNError errorForInvalidOperationForRequestSpecifier:v6];
    uint64_t v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

LABEL_11:

  return v8;
}

- (CGRect)VNImageProcessingSessionRegionOfInterest
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 1.0;
  double v5 = 1.0;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7
{
  if (a7)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, a1, a5, a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)VNCoreMLTransformerDetectionprintAndReturnError:(id *)a3
{
  if (a3)
  {
    id v5 = [NSString alloc];
    char v6 = [(VNRequest *)self specifier];
    uint64_t v7 = (void *)[v5 initWithFormat:@"%@ does not produce detectionprint data", v6];

    *a3 = +[VNError errorForDataUnavailableWithLocalizedDescription:v7];
  }
  return 0;
}

- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3
{
  if (a3)
  {
    id v5 = [NSString alloc];
    char v6 = [(VNRequest *)self specifier];
    uint64_t v7 = (void *)[v5 initWithFormat:@"%@ does not produce sceneprint data", v6];

    *a3 = +[VNError errorForDataUnavailableWithLocalizedDescription:v7];
  }
  return 0;
}

@end
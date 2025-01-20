@interface VNRPNTrackerEspressoResources
- (id)_initWithRPNInitEspressoResources:(id)a3 RPNTrackEspressoResources:(id)a4;
- (id)rpnInitEspressoResources;
- (id)rpnTrackEspressoResources;
@end

@implementation VNRPNTrackerEspressoResources

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rpnTrackEspressoResources, 0);

  objc_storeStrong((id *)&self->_rpnInitEspressoResources, 0);
}

- (id)_initWithRPNInitEspressoResources:(id)a3 RPNTrackEspressoResources:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VNRPNTrackerEspressoResources;
  v9 = [(VNRPNTrackerEspressoResources *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rpnInitEspressoResources, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

id __110__VNRPNTrackerEspressoResources_resourcesForOptions_PRNInitEspressoModelName_RPNTrackEspressoModelName_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:a2 error:a3];
  if (v5
    && (unsigned int v14 = 0,
        +[VNValidationUtilities getEspressoPriority:&v14 forKey:@"VNDetectorOption_EspressoPlanPriority" inOptions:*(void *)(a1 + 32) withDefaultValue:0 error:a3]))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 48) BOOLValue];
    id v13 = 0;
    BOOL v8 = +[VNEspressoHelpers createSingleNetworkPlanFromModelPath:v5 forComputeDevice:v6 lowPriorityMode:v7 priority:v14 inputBlobNames:0 outputBlobNames:0 networkConfiguration:0 memoryPoolId:0 espressoResources:&v13 error:a3];
    id v9 = v13;
    v10 = v9;
    if (v8) {
      id v11 = v9;
    }
    else {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)rpnInitEspressoResources
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)rpnTrackEspressoResources
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

@end
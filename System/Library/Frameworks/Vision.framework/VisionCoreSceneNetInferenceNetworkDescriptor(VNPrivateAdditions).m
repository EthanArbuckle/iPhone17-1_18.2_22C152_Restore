@interface VisionCoreSceneNetInferenceNetworkDescriptor(VNPrivateAdditions)
- (id)VNPublicClassificationDisallowedList;
- (id)VNSceneprintFromData:()VNPrivateAdditions originatingRequestSpecifier:error:;
- (id)VNSceneprintFromOutputObjects:()VNPrivateAdditions originatingRequestSpecifier:error:;
@end

@implementation VisionCoreSceneNetInferenceNetworkDescriptor(VNPrivateAdditions)

- (id)VNSceneprintFromData:()VNPrivateAdditions originatingRequestSpecifier:error:
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 sceneprintOutput];
  if (v10)
  {
    if ([v9 requestClassAndReturnError:a5])
    {
      objc_opt_class();
      v11 = [a1 VNEspressoModelImageprintOfClass:objc_opt_class() fromData:v8 tensorDescriptor:v10 originatingRequestSpecifier:v9 fromBlock:0 error:a5];
      goto LABEL_7;
    }
  }
  else if (a5)
  {
    +[VNError errorForDataUnavailableWithLocalizedDescription:@"could not obtain sceneprint descriptor" underlyingError:0];
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)VNSceneprintFromOutputObjects:()VNPrivateAdditions originatingRequestSpecifier:error:
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 sceneprintOutput];
  if (v10)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__13962;
    v23 = __Block_byref_object_dispose__13963;
    id v24 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __132__VisionCoreSceneNetInferenceNetworkDescriptor_VNPrivateAdditions__VNSceneprintFromOutputObjects_originatingRequestSpecifier_error___block_invoke;
    aBlock[3] = &unk_1E5B1D650;
    v18 = &v19;
    aBlock[4] = a1;
    id v17 = v9;
    v11 = _Block_copy(aBlock);
    v12 = [v10 name];
    char v13 = [v8 accessReadOnlyDataForName:v12 usingBlock:v11 error:a5];

    if (v13) {
      id v14 = (id)v20[5];
    }
    else {
      id v14 = 0;
    }

    _Block_object_dispose(&v19, 8);
  }
  else if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"sceneprint output descriptor is not defined"];
    id v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)VNPublicClassificationDisallowedList
{
  if ([a1 model] == 1)
  {
    v1 = +[VNDisallowedList sceneNetV3];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

@end
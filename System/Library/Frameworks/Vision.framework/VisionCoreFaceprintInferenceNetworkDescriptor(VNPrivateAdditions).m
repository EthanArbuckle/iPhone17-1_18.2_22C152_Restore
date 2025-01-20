@interface VisionCoreFaceprintInferenceNetworkDescriptor(VNPrivateAdditions)
- (VNFaceprint)VNFaceprintFromData:()VNPrivateAdditions confidence:originatingRequestSpecifier:error:;
- (id)VNFaceprintFromOutputObjects:()VNPrivateAdditions originatingRequestSpecifier:error:;
@end

@implementation VisionCoreFaceprintInferenceNetworkDescriptor(VNPrivateAdditions)

- (VNFaceprint)VNFaceprintFromData:()VNPrivateAdditions confidence:originatingRequestSpecifier:error:
{
  id v10 = a4;
  id v11 = a5;
  *(float *)&double v12 = a2;
  if (+[VNValidationUtilities validateVNConfidenceRange:a6 error:v12])
  {
    v13 = [a1 faceprintOutput];
    if (v13)
    {
      v29 = 0;
      uint64_t v30 = 0;
      id v28 = 0;
      char v14 = [a1 getVNEspressoModelImageprintData:&v28 elementType:&v30 elementCount:&v29 fromTensorData:v10 descriptor:v13 error:a6];
      id v15 = v28;
      v16 = v15;
      if (v14)
      {
        size_t v17 = [v15 length];
        std::vector<unsigned char>::vector(__p, v17);
        v18 = (vision::mod::FaceprintAndAttributes *)[v16 bytes];
        v20 = (void *)vision::mod::FaceprintAndAttributes::normalizeFacePrintData(v18, (const void *)v29, 1, (float *)__p[0], v19);
        if (v20 == 128)
        {
          v21 = [VNFaceprint alloc];
          *(float *)&double v22 = a2;
          v23 = [(VNFaceprint *)v21 initWithData:__p[0] elementCount:v29 elementType:v30 lengthInBytes:v17 confidence:v11 originatingRequestSpecifier:v22];
          v24 = v23;
          if (v23)
          {
            v25 = v23;
          }
          else if (a6)
          {
            *a6 = +[VNError errorForInternalErrorWithLocalizedDescription:@"unable to create VNFaceprint"];
          }
        }
        else if (a6)
        {
          VNErrorForCVMLStatus(v20);
          v24 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        v24 = 0;
      }
    }
    else if (a6)
    {
      +[VNError errorForDataUnavailableWithLocalizedDescription:@"could not obtain faceprint descriptor" underlyingError:0];
      v24 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)VNFaceprintFromOutputObjects:()VNPrivateAdditions originatingRequestSpecifier:error:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 faceprintOutput];
  if (v10)
  {
    id v11 = [a1 confidencesOutput];
    if (v11)
    {
      int v27 = 0;
      if ([v8 VNGetConfidenceValue:&v27 asTensor:v11 error:a5])
      {
        uint64_t v21 = 0;
        double v22 = &v21;
        uint64_t v23 = 0x3032000000;
        v24 = __Block_byref_object_copy__28960;
        v25 = __Block_byref_object_dispose__28961;
        id v26 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __132__VisionCoreFaceprintInferenceNetworkDescriptor_VNPrivateAdditions__VNFaceprintFromOutputObjects_originatingRequestSpecifier_error___block_invoke;
        aBlock[3] = &unk_1E5B1EE18;
        v19 = &v21;
        aBlock[4] = a1;
        int v20 = v27;
        id v18 = v9;
        double v12 = _Block_copy(aBlock);
        v13 = [v10 name];
        char v14 = [v8 accessReadOnlyDataForName:v13 usingBlock:v12 error:a5];

        if (v14) {
          id v15 = (id)v22[5];
        }
        else {
          id v15 = 0;
        }

        _Block_object_dispose(&v21, 8);
        goto LABEL_14;
      }
    }
    else if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"confidences output descriptor is not defined"];
      id v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }
    id v15 = 0;
    goto LABEL_14;
  }
  if (a5)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"faceprint output descriptor is not defined"];
    id v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }
LABEL_15:

  return v15;
}

@end
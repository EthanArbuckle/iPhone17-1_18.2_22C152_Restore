@interface MLCLSTMLayer(CoreMLModelSpecification)
+ (id)uniDirectionalLSTMLayer:()CoreMLModelSpecification error:;
@end

@implementation MLCLSTMLayer(CoreMLModelSpecification)

+ (id)uniDirectionalLSTMLayer:()CoreMLModelSpecification error:
{
  v95[4] = *MEMORY[0x1E4F143B8];
  v6 = (uint64_t *)a3[6];
  if (!v6) {
    v6 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
  }
  v7 = (uint64_t *)v6[2];
  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &CoreML::Specification::_WeightParams_default_instance_;
  }
  id v92 = 0;
  v9 = _validateAndGetData((uint64_t)v8, &v92);
  id v10 = v92;
  if (v9)
  {
    v11 = (uint64_t *)a3[6];
    if (!v11) {
      v11 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    }
    v12 = (uint64_t *)v11[3];
    if (v12) {
      v13 = v12;
    }
    else {
      v13 = &CoreML::Specification::_WeightParams_default_instance_;
    }
    id v91 = v10;
    v77 = _validateAndGetData((uint64_t)v13, &v91);
    id v14 = v91;

    if (!v77)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:6 underlyingError:v14 format:@"Failed to extract forgetGateWeightMatrix."];
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_139;
    }
    v15 = (uint64_t *)a3[6];
    if (!v15) {
      v15 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    }
    v16 = (uint64_t *)v15[4];
    if (v16) {
      v17 = v16;
    }
    else {
      v17 = &CoreML::Specification::_WeightParams_default_instance_;
    }
    id v90 = v14;
    v18 = _validateAndGetData((uint64_t)v17, &v90);
    id v19 = v90;

    if (!v18)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:6 underlyingError:v19 format:@"Failed to extract blockInputWeightMatrix."];
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_138;
    }
    v20 = (uint64_t *)a3[6];
    if (!v20) {
      v20 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    }
    v21 = (uint64_t *)v20[5];
    if (v21) {
      v22 = v21;
    }
    else {
      v22 = &CoreML::Specification::_WeightParams_default_instance_;
    }
    id v89 = v19;
    v23 = _validateAndGetData((uint64_t)v22, &v89);
    id v24 = v89;

    if (!v23)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:6 underlyingError:v24 format:@"Failed to extract outputGateWeightMatrix."];
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_137;
    }
    v95[0] = v9;
    v95[1] = v77;
    v95[2] = v18;
    v95[3] = v23;
    v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:4];
    v25 = (uint64_t *)a3[6];
    if (!v25) {
      v25 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    }
    v26 = (uint64_t *)v25[6];
    if (v26) {
      v27 = v26;
    }
    else {
      v27 = &CoreML::Specification::_WeightParams_default_instance_;
    }
    id v88 = v24;
    v76 = _validateAndGetData((uint64_t)v27, &v88);
    id v28 = v88;

    if (!v76)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:6 underlyingError:v28 format:@"Failed to extract inputGateRecursionMatrix."];
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_136;
    }
    v29 = (uint64_t *)a3[6];
    if (!v29) {
      v29 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    }
    v30 = (uint64_t *)v29[7];
    if (v30) {
      v31 = v30;
    }
    else {
      v31 = &CoreML::Specification::_WeightParams_default_instance_;
    }
    id v87 = v28;
    v75 = _validateAndGetData((uint64_t)v31, &v87);
    id v32 = v87;

    if (!v75)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:6 underlyingError:v32 format:@"Failed to extract forgetGateRecursionMatrix."];
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_135;
    }
    v33 = (uint64_t *)a3[6];
    if (!v33) {
      v33 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    }
    v34 = (uint64_t *)v33[8];
    if (v34) {
      v35 = v34;
    }
    else {
      v35 = &CoreML::Specification::_WeightParams_default_instance_;
    }
    id v86 = v32;
    v73 = _validateAndGetData((uint64_t)v35, &v86);
    id v36 = v86;

    if (!v73)
    {
      if (a4)
      {
        +[MLModelErrorUtils errorWithCode:6 underlyingError:v36 format:@"Failed to extract blockInputRecursionMatrix."];
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }
      goto LABEL_134;
    }
    v37 = (uint64_t *)a3[6];
    if (!v37) {
      v37 = &CoreML::Specification::_LSTMWeightParams_default_instance_;
    }
    v38 = (uint64_t *)v37[9];
    if (v38) {
      v39 = v38;
    }
    else {
      v39 = &CoreML::Specification::_WeightParams_default_instance_;
    }
    id v85 = v36;
    uint64_t v72 = _validateAndGetData((uint64_t)v39, &v85);
    id v40 = v85;

    v41 = (void *)v72;
    if (!v72)
    {
      if (!a4)
      {
        v44 = 0;
LABEL_133:

        id v36 = v40;
LABEL_134:

        id v32 = v36;
LABEL_135:

        id v28 = v32;
LABEL_136:

        id v24 = v28;
LABEL_137:

        id v19 = v24;
LABEL_138:

        id v14 = v19;
LABEL_139:

        id v10 = v14;
        goto LABEL_140;
      }
      +[MLModelErrorUtils errorWithCode:6 underlyingError:v40 format:@"Failed to extract outputGateRecursionMatrix."];
      v44 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_132:
      v41 = (void *)v72;
      goto LABEL_133;
    }
    v94[0] = v76;
    v94[1] = v75;
    v94[2] = v73;
    v94[3] = v72;
    v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:4];
    v70 = 0;
    v42 = (uint64_t *)a3[6];
    if (v42 && v42 != &CoreML::Specification::_LSTMWeightParams_default_instance_)
    {
      uint64_t v43 = v42[10];
      if (v43)
      {
        id v84 = v40;
        v70 = _validateAndGetData(v43, &v84);
        id v71 = v84;

        if (!v70)
        {
          if (a4)
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
            v44 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = 0;
          }
          goto LABEL_131;
        }
        v42 = (uint64_t *)a3[6];
        id v40 = v71;
      }
      else
      {
        v70 = 0;
      }
    }
    uint64_t v45 = 0;
    if (v42 && v42 != &CoreML::Specification::_LSTMWeightParams_default_instance_)
    {
      uint64_t v46 = v42[11];
      if (v46)
      {
        id v83 = v40;
        uint64_t v45 = _validateAndGetData(v46, &v83);
        id v71 = v83;

        if (!v45)
        {
          if (a4)
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
            v44 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = 0;
          }
          goto LABEL_130;
        }
        v42 = (uint64_t *)a3[6];
        id v40 = v71;
      }
      else
      {
        uint64_t v45 = 0;
      }
    }
    v47 = 0;
    v67 = (void *)v45;
    if (v42 && v42 != &CoreML::Specification::_LSTMWeightParams_default_instance_)
    {
      uint64_t v48 = v42[12];
      if (v48)
      {
        id v82 = v40;
        uint64_t v49 = _validateAndGetData(v48, &v82);
        id v71 = v82;

        if (!v49)
        {
          if (a4)
          {
            +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
            v44 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v44 = 0;
          }
          goto LABEL_129;
        }
        v47 = (void *)v49;
        v42 = (uint64_t *)a3[6];
        id v40 = v71;
        uint64_t v45 = (uint64_t)v67;
      }
      else
      {
        v47 = 0;
      }
    }
    v50 = 0;
    if (v42)
    {
      if (v42 != &CoreML::Specification::_LSTMWeightParams_default_instance_)
      {
        v50 = (void *)v42[10];
        if (v50)
        {
          v51 = v47;
          v52 = (uint64_t *)v42[13];
          if (v52) {
            v53 = v52;
          }
          else {
            v53 = &CoreML::Specification::_WeightParams_default_instance_;
          }
          id v81 = v40;
          uint64_t v54 = _validateAndGetData((uint64_t)v53, &v81);
          id v71 = v81;

          if (!v54)
          {
            if (a4)
            {
              +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 6);
              v44 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v44 = 0;
            }
LABEL_128:

LABEL_129:
LABEL_130:

LABEL_131:
            id v40 = v71;
            goto LABEL_132;
          }
          v50 = (void *)v54;
          id v40 = v71;
          uint64_t v45 = (uint64_t)v67;
          v47 = v51;
        }
      }
    }
    v93[0] = v70;
    v93[1] = v45;
    v51 = v47;
    v93[2] = v47;
    v93[3] = v50;
    v55 = v50;
    v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:4];
    uint64_t v56 = *(void *)(a3[4] + 8);
    id v80 = v40;
    v68 = _mlcActivationDescriptor(*(_DWORD *)(v56 + 28), &v80);
    id v71 = v80;

    if (v68)
    {
      uint64_t v57 = *(void *)(a3[4] + 16);
      id v79 = v71;
      v65 = _mlcActivationDescriptor(*(_DWORD *)(v57 + 28), &v79);
      id v58 = v79;

      if (v65)
      {
        uint64_t v59 = *(void *)(a3[4] + 24);
        id v78 = v58;
        v60 = _mlcActivationDescriptor(*(_DWORD *)(v59 + 28), &v78);
        id v61 = v78;

        if (v60)
        {
          v62 = (uint64_t *)a3[5];
          if (!v62) {
            v62 = &CoreML::Specification::_LSTMParams_default_instance_;
          }
          LOBYTE(v64) = *((unsigned char *)v62 + 20);
          v44 = +[MLNeuralNetworkMLComputeLayer uniDirectionalLSTMLayerWithInputSize:a3[7] outputSize:a3[8] inputWeightsData:v74 recursionWeightsData:v69 hasBias:*((unsigned __int8 *)v62 + 21) biasTermsData:v66 sequenceOutput:v64 inputGateActivation:v68 cellGateActivation:v65 hiddenOutputActivation:v60];
        }
        else if (a4)
        {
          +[MLModelErrorUtils errorWithCode:6 underlyingError:v61 format:@"Failed to extract hiddenOutputActivation."];
          v44 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v44 = 0;
        }

        id v58 = v61;
      }
      else if (a4)
      {
        +[MLModelErrorUtils errorWithCode:6 underlyingError:v58 format:@"Failed to extract cellGateActivation."];
        v44 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v44 = 0;
      }

      id v71 = v58;
    }
    else if (a4)
    {
      +[MLModelErrorUtils errorWithCode:6 underlyingError:v71 format:@"Failed to extract inputGateActivation."];
      v44 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v44 = 0;
    }

    goto LABEL_128;
  }
  if (a4)
  {
    +[MLModelErrorUtils errorWithCode:6 underlyingError:v10 format:@"Failed to extract inputGateWeightMatrix."];
    v44 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
LABEL_140:

  return v44;
}

@end
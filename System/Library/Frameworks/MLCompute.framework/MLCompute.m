id ANE_BuildNeuronParams(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  float v4;
  __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  float v20;
  int v21;
  void *v22;
  __CFString *v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  int v48;
  int v49;
  void *v50;
  void *v51;
  float v52;
  float v53;
  NSObject *v54;
  __int16 v56;
  int v57;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [v3 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
  switch([v1 activationType])
  {
    case 1u:
      [v1 a];
      if (fabsf(v4) < 0.000001)
      {
        v5 = @"ReLU";
        goto LABEL_28;
      }
      [v3 setObject:@"LeakyReLU" forKeyedSubscript:@"Type"];
      [v1 a];
      v57 = v49;
      v56 = 0;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        v50 = [NSNumber numberWithShort:v56];
        [v3 setObject:v50 forKeyedSubscript:@"ReluSlope"];

        v56 = 0;
        v22 = [NSNumber numberWithShort:0];
        v23 = @"ReluOffset";
        goto LABEL_44;
      }
      v7 = +[MLCLog framework];
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_68;
      }
      goto LABEL_64;
    case 2u:
      v6 = ANE_BuildLinearParams(v1);
      if (v6) {
        goto LABEL_25;
      }
      v7 = +[MLCLog framework];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        ANE_BuildNeuronParams_cold_3(v1);
      }
      goto LABEL_68;
    case 3u:
      v5 = @"SigmoidHighPrecision";
      goto LABEL_28;
    case 4u:
      [v1 a];
      v9 = v8;
      [v1 b];
      LODWORD(v11) = v10;
      LODWORD(v12) = v9;
      v7 = +[MLCActivationDescriptor descriptorWithType:2 a:v12 b:v11];
      v13 = ANE_BuildLinearParams(v7);
      if (v13)
      {
        v14 = (void *)v13;
        [v2 addObjectsFromArray:v13];
        [v3 setObject:@"ClampedReLU" forKeyedSubscript:@"Type"];
        v57 = 1065353216;
        v56 = 0;
        ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56);
        v15 = [NSNumber numberWithShort:0];
        [v3 setObject:v15 forKeyedSubscript:@"ReluMin"];

        v16 = [NSNumber numberWithShort:v56];
        [v3 setObject:v16 forKeyedSubscript:@"ReluMax"];

        v17 = v2;
        v18 = v3;
        goto LABEL_37;
      }
      v54 = +[MLCLog framework];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        ANE_BuildNeuronParams_cold_3(v1);
      }
      goto LABEL_67;
    case 5u:
      [v1 a];
      if (fabsf(v19 + -1.0) < 0.000001)
      {
        [v1 b];
        if (fabsf(v20 + -1.0) < 0.000001)
        {
          v5 = @"Tanh";
LABEL_28:
          [v3 setObject:v5 forKeyedSubscript:@"Type"];
          goto LABEL_45;
        }
      }
      [v1 b];
      v57 = v42;
      v56 = 0;
      if (!ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        v7 = +[MLCLog framework];
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        goto LABEL_64;
      }
      v7 = [MEMORY[0x1E4F1CC08] mutableCopy];
      [v7 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
      v43 = [NSNumber numberWithShort:v56];
      [v7 setObject:v43 forKeyedSubscript:@"ScaleScalar"];

      [v2 addObject:v7];
      [v3 setObject:@"Tanh" forKeyedSubscript:@"Type"];
      [v2 addObject:v3];
      [v1 a];
      v57 = v44;
      v56 = 0;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        v14 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        [v14 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
        v45 = [NSNumber numberWithShort:v56];
        [v14 setObject:v45 forKeyedSubscript:@"ScaleScalar"];

        v17 = v2;
        v18 = v14;
LABEL_37:
        [v17 addObject:v18];

LABEL_38:
        goto LABEL_46;
      }
      v54 = +[MLCLog framework];
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        ANE_BuildNeuronParams_cold_2((uint64_t)&v57);
      }
LABEL_67:

      goto LABEL_68;
    case 6u:
      [v3 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      v5 = @"Abs";
      goto LABEL_28;
    case 9u:
      [v3 setObject:@"ELU" forKeyedSubscript:@"Type"];
      [v1 a];
      v57 = v21;
      v56 = 0;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        v22 = [NSNumber numberWithShort:v56];
        v23 = @"EluAlpha";
        goto LABEL_44;
      }
      v7 = +[MLCLog framework];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        goto LABEL_64;
      }
      goto LABEL_68;
    case 0xAu:
      if (!+[MLCPlatformInfo isAneSubTypeVersionGreaterThanOrEqualTo:13])
      {
        [v1 a];
        if (v52 <= (float)-0.000001 || ([v1 b], v53 < 0.000001))
        {
          v7 = +[MLCLog framework];
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            ANE_BuildNeuronParams_cold_11(v7);
          }
LABEL_68:

          v51 = 0;
          goto LABEL_69;
        }
      }
      [v1 a];
      if (fabsf(v24) >= 0.000001
        || ([v1 b], v25 < 0.000001)
        || ([v1 b], v27 = v26, objc_msgSend(v1, "a"), v27 <= v28))
      {
        [v3 setObject:@"ReLUN" forKeyedSubscript:@"Type"];
        [v1 b];
        v57 = v46;
        v56 = 0;
        if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
        {
          v47 = [NSNumber numberWithShort:v56];
          [v3 setObject:v47 forKeyedSubscript:@"ReluMax"];

          [v1 a];
          v57 = v48;
          v56 = 0;
          if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
          {
            v22 = [NSNumber numberWithShort:v56];
            v23 = @"ReluSlope";
            goto LABEL_44;
          }
          v7 = +[MLCLog framework];
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            goto LABEL_68;
          }
        }
        else
        {
          v7 = +[MLCLog framework];
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            goto LABEL_68;
          }
        }
      }
      else
      {
        [v3 setObject:@"ClampedReLU" forKeyedSubscript:@"Type"];
        [v3 setObject:&unk_1F3876450 forKeyedSubscript:@"ReluMin"];
        [v1 b];
        v57 = v29;
        v56 = 0;
        if (ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
        {
          v30 = NSNumber;
          goto LABEL_33;
        }
        v7 = +[MLCLog framework];
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
      }
      ANE_BuildNeuronParams_cold_8((uint64_t)&v57);
      goto LABEL_68;
    case 0xBu:
      [v3 setObject:@"SigmoidHighPrecision" forKeyedSubscript:@"Type"];
      [v2 addObject:v3];
      v6 = ANE_BuildArithmeticParams(24);
LABEL_25:
      v7 = v6;
      [v2 addObjectsFromArray:v6];
      goto LABEL_38;
    case 0x10u:
      [v3 setObject:@"Tanh" forKeyedSubscript:@"Type"];
      [v2 addObject:v3];
      v31 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v31 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      [v31 setObject:@"Sub" forKeyedSubscript:@"Type"];
      [v2 addObject:v31];

      goto LABEL_46;
    case 0x12u:
      v5 = @"GELU";
      goto LABEL_28;
    case 0x13u:
      v32 = (void *)MEMORY[0x1E4F1CC08];
      v7 = [MEMORY[0x1E4F1CC08] mutableCopy];
      [v7 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
      v57 = 1077936128;
      v56 = 0;
      ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56);
      v33 = [NSNumber numberWithShort:v56];
      [v7 setObject:v33 forKeyedSubscript:@"BiasScalar"];

      [v2 addObject:v7];
      v34 = (void *)[v32 mutableCopy];
      [v34 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      [v34 setObject:@"ClampedReLU" forKeyedSubscript:@"Type"];
      [v34 setObject:&unk_1F3876450 forKeyedSubscript:@"ReluMin"];
      v57 = 1086324736;
      ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56);
      v35 = [NSNumber numberWithShort:v56];
      [v34 setObject:v35 forKeyedSubscript:@"ReluMax"];

      [v2 addObject:v34];
      v36 = (void *)[v32 mutableCopy];
      [v36 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
      v57 = 1042983595;
      ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56);
      v37 = [NSNumber numberWithShort:v56];
      [v36 setObject:v37 forKeyedSubscript:@"ScaleScalar"];

      [v2 addObject:v36];
      v38 = (void *)[v32 mutableCopy];
      [v38 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      [v38 setObject:@"Mult" forKeyedSubscript:@"Type"];
      [v2 addObject:v38];

      goto LABEL_38;
    case 0x14u:
      [v3 setObject:@"ClampedReLU" forKeyedSubscript:@"Type"];
      [v1 a];
      v57 = v39;
      v56 = 0;
      if (!ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        v7 = +[MLCLog framework];
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
LABEL_64:
        ANE_BuildNeuronParams_cold_2((uint64_t)&v57);
        goto LABEL_68;
      }
      v40 = [NSNumber numberWithShort:v56];
      [v3 setObject:v40 forKeyedSubscript:@"ReluMin"];

      [v1 b];
      v57 = v41;
      v56 = 0;
      if (!ANE_ConvertFp32ToInt16((uint64_t)&v57, &v56))
      {
        v7 = +[MLCLog framework];
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          goto LABEL_68;
        }
        goto LABEL_64;
      }
      v30 = NSNumber;
LABEL_33:
      v22 = [v30 numberWithShort:v56];
      v23 = @"ReluMax";
LABEL_44:
      [v3 setObject:v22 forKeyedSubscript:v23];

LABEL_45:
      [v2 addObject:v3];
LABEL_46:
      v51 = (void *)[v2 copy];
LABEL_69:

      return v51;
    default:
      v7 = +[MLCLog framework];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        ANE_BuildNeuronParams_cold_1(v1);
      }
      goto LABEL_68;
  }
}

id ANE_BuildLinearParams(void *a1)
{
  id v1 = a1;
  v2 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v1 a];
  if (fabsf(v3) < 0.0001)
  {
    v4 = +[MLCLog framework];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      ANE_BuildLinearParams_cold_3(v1, v4);
    }

    [v1 a];
    float v24 = v5;
    __int16 v23 = 0;
    if (ANE_ConvertFp32ToInt16((uint64_t)&v24, &v23))
    {
      v6 = (void *)MEMORY[0x1E4F1CC08];
      v7 = [MEMORY[0x1E4F1CC08] mutableCopy];
      [v7 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
      v8 = [NSNumber numberWithShort:v23];
      [v7 setObject:v8 forKeyedSubscript:@"ScaleScalar"];

      [v2 addObject:v7];
      v9 = (void *)[v6 mutableCopy];
      [v9 setObject:@"Pooling" forKeyedSubscript:kMLCANENetUnitType[0]];
      [v9 setObject:@"Max" forKeyedSubscript:@"Type"];
      [v9 setObject:@"Zero" forKeyedSubscript:@"PaddingMode"];
      [v9 setObject:&unk_1F3876468 forKeyedSubscript:@"KernelWidth"];
      [v9 setObject:&unk_1F3876468 forKeyedSubscript:@"KernelHeight"];
      [v9 setObject:&unk_1F3876C90 forKeyedSubscript:@"Step"];
      [v2 addObject:v9];
      [v1 b];
      float v24 = v10;
      __int16 v22 = 0;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v24, &v22))
      {
        v11 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        [v11 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
        v12 = [NSNumber numberWithShort:v22];
        [v11 setObject:v12 forKeyedSubscript:@"BiasScalar"];

        [v2 addObject:v11];
LABEL_10:

        v19 = (void *)[v2 copy];
        goto LABEL_21;
      }
      v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        ANE_BuildLinearParams_cold_1((uint64_t)&v24);
      }

      goto LABEL_20;
    }
    v7 = +[MLCLog framework];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
LABEL_12:
    ANE_BuildLinearParams_cold_1((uint64_t)&v24);
    goto LABEL_20;
  }
  [v1 a];
  float v24 = v13;
  __int16 v23 = 0;
  if (!ANE_ConvertFp32ToInt16((uint64_t)&v24, &v23))
  {
    v7 = +[MLCLog framework];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    goto LABEL_12;
  }
  [v1 b];
  float v15 = v14;
  [v1 a];
  float v24 = v15 / v16;
  __int16 v22 = 0;
  if (ANE_ConvertFp32ToInt16((uint64_t)&v24, &v22))
  {
    v7 = [MEMORY[0x1E4F1CC08] mutableCopy];
    [v7 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
    v17 = [NSNumber numberWithShort:v23];
    [v7 setObject:v17 forKeyedSubscript:@"ScaleScalar"];

    v18 = [NSNumber numberWithShort:v22];
    [v7 setObject:v18 forKeyedSubscript:@"BiasScalar"];

    [v2 addObject:v7];
    goto LABEL_10;
  }
  v7 = +[MLCLog framework];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    ANE_BuildLinearParams_cold_1((uint64_t)&v24);
  }
LABEL_20:

  v19 = 0;
LABEL_21:

  return v19;
}

id ANE_CreateNeuronLayer(void *a1)
{
  id v1 = a1;
  id v2 = (id)MEMORY[0x1E4F1CBF0];
  float v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v4 = ANE_BuildNeuronParams(v1);
  if (v4)
  {
    float v5 = +[_MLCANENeuronParameters neuronUnitParametersWith:neuronType:](_MLCANENeuronParameters, "neuronUnitParametersWith:neuronType:", v4, [v1 activationType]);
    v6 = +[MLCANEDeviceOps deviceOpsWithType:10 params:v5];
    if (v6) {
      [v3 addObject:v6];
    }
    id v2 = v3;
  }

  return v2;
}

id ANE_CreateUnitsWithNeuronLayer(void *a1, void *a2, int a3)
{
  v130[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  switch(a3)
  {
    case 1:
    case 3:
    case 9:
    case 10:
    case 18:
    case 20:
      uint64_t v8 = [v6 objectAtIndexedSubscript:0];
      v9 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v8];

      float v10 = [v5 sourceTensors];
      LOBYTE(v8) = ANE_ValidateNeuronUnit(v10, v9, 1);

      if (v8) {
        goto LABEL_3;
      }
      v12 = +[MLCLog framework];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      goto LABEL_7;
    case 2:
      uint64_t v14 = ANE_CreateUnitsOfLinear(v5, v6);
      if (v14)
      {
        v9 = v14;
        [v7 addObjectsFromArray:v14];
        goto LABEL_4;
      }
      v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithNeuronLayer_cold_2();
      }
      goto LABEL_9;
    case 4:
      v9 = objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);
      float v15 = ANE_CreateUnitsOfLinear(v5, v9);
      if (v15)
      {
        float v16 = v15;
        uint64_t v17 = [v15 count];
        v18 = [v6 objectAtIndexedSubscript:v17];
        v19 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v18];

        v20 = [v5 label];
        v21 = objc_msgSend(v20, "stringByAppendingFormat:", @"_%lu", v17);
        id v22 = v6;
        [v19 setObject:v21 forKeyedSubscript:@"Name"];

        __int16 v23 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v16, "count") - 1);
        float v24 = [v23 objectForKeyedSubscript:@"Name"];
        v126 = v24;
        v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1];
        [v19 setObject:v25 forKeyedSubscript:@"Bottom"];

        id v6 = v22;
        [v7 addObjectsFromArray:v16];
        [v7 addObject:v19];

        goto LABEL_4;
      }
      v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithNeuronLayer_cold_2();
      }
      goto LABEL_8;
    case 5:
      if ([v6 count] != 3)
      {
        if ([v6 count] != 1)
        {
          v9 = +[MLCLog framework];
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            ANE_CreateUnitsWithNeuronLayer_cold_7();
          }
          goto LABEL_9;
        }
        v110 = [v6 objectAtIndexedSubscript:0];
        v9 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v110];

        v111 = [v5 sourceTensors];
        char v112 = ANE_ValidateNeuronUnit(v111, v9, 1);

        if (v112)
        {
LABEL_3:
          [v7 addObject:v9];
LABEL_4:

          goto LABEL_5;
        }
        v12 = +[MLCLog framework];
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
      v26 = [v6 objectAtIndexedSubscript:0];
      v9 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v26];

      v27 = [v5 label];
      uint64_t v28 = [v27 stringByAppendingString:@"_0"];
      [v9 setObject:v28 forKeyedSubscript:@"Name"];

      v29 = [v5 sourceTensors];
      LOBYTE(v28) = ANE_ValidateGOCUnit(v29, v9, 1);

      if ((v28 & 1) == 0)
      {
        v12 = +[MLCLog framework];
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        goto LABEL_7;
      }
      v30 = [v6 objectAtIndexedSubscript:1];
      v12 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v30];

      v31 = [v5 label];
      v32 = [v31 stringByAppendingString:@"_1"];
      [v12 setObject:v32 forKeyedSubscript:@"Name"];

      v33 = [v9 objectForKeyedSubscript:@"Name"];
      v130[0] = v33;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:1];
      [v12 setObject:v34 forKeyedSubscript:@"Bottom"];

      v35 = [v5 sourceTensors];
      LOBYTE(v34) = ANE_ValidateNeuronUnit(v35, v12, 1);

      if ((v34 & 1) == 0)
      {
        v114 = +[MLCLog framework];
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsWithNeuronLayer_cold_3();
        }

        goto LABEL_8;
      }
      v36 = [v6 objectAtIndexedSubscript:2];
      v37 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v36];

      v38 = [v5 label];
      v39 = [v38 stringByAppendingString:@"_2"];
      [v37 setObject:v39 forKeyedSubscript:@"Name"];

      v40 = [v12 objectForKeyedSubscript:@"Name"];
      v129 = v40;
      uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v129 count:1];
      [v37 setObject:v41 forKeyedSubscript:@"Bottom"];

      v42 = [v5 sourceTensors];
      LOBYTE(v41) = ANE_ValidateGOCUnit(v42, v37, 1);

      if (v41)
      {
        [v7 addObject:v9];
        [v7 addObject:v12];
        [v7 addObject:v37];

        goto LABEL_5;
      }
      v116 = +[MLCLog framework];
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithNeuronLayer_cold_3();
      }

      id v11 = 0;
      goto LABEL_11;
    case 6:
      v43 = [v6 objectAtIndexedSubscript:0];
      v9 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v43];

      v44 = [v5 sourceTensors];
      v45 = [v44 objectAtIndexedSubscript:0];
      v124 = v45;
      v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
      char v47 = ANE_ValidateElementWiseUnit(v46, v9, 1);

      if (v47) {
        goto LABEL_3;
      }
      v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithNeuronLayer_cold_3();
      }
      goto LABEL_8;
    case 11:
      v49 = [v6 objectAtIndexedSubscript:0];
      v50 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v49];

      v51 = [v5 label];
      uint64_t v52 = objc_msgSend(v51, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v7, "count"));
      [v50 setObject:v52 forKeyedSubscript:@"Name"];

      v53 = [v5 sourceTensors];
      LOBYTE(v52) = ANE_ValidateNeuronUnit(v53, v50, 1);

      if (v52)
      {
        [v7 addObject:v50];
        id v119 = v6;
        v117 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
        v54 = ANE_CreateUnitsWithArithmeticOpeartion(24, v5, v117);
        if ([v54 count])
        {
          unint64_t v55 = 0;
          do
          {
            v56 = [v54 objectAtIndexedSubscript:v55];
            v57 = [v5 label];
            v58 = objc_msgSend(v57, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v7, "count"), v117);
            [v56 setObject:v58 forKeyedSubscript:@"Name"];

            v59 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1);
            v60 = [v59 objectForKeyedSubscript:@"Name"];

            v125 = v60;
            v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
            [v56 setObject:v61 forKeyedSubscript:@"Bottom"];

            [v7 addObject:v56];
            ++v55;
          }
          while (v55 < [v54 count]);
        }

        goto LABEL_38;
      }
      v88 = +[MLCLog framework];
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithNeuronLayer_cold_3();
      }
      goto LABEL_63;
    case 16:
      if ([v6 count] != 2)
      {
        v9 = +[MLCLog framework];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsWithNeuronLayer_cold_10();
        }
        goto LABEL_9;
      }
      v62 = [v6 objectAtIndexedSubscript:0];
      v9 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v62];

      v63 = [v5 label];
      uint64_t v64 = [v63 stringByAppendingString:@"_0"];
      [v9 setObject:v64 forKeyedSubscript:@"Name"];

      v65 = [v5 sourceTensors];
      LOBYTE(v64) = ANE_ValidateNeuronUnit(v65, v9, 1);

      if ((v64 & 1) == 0)
      {
        v12 = +[MLCLog framework];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
LABEL_7:
        }
          ANE_CreateUnitsWithNeuronLayer_cold_3();
LABEL_8:

        goto LABEL_9;
      }
      id v119 = v6;
      v66 = [v6 objectAtIndexedSubscript:1];
      uint64_t v67 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v66];

      v68 = [v5 label];
      v69 = [v68 stringByAppendingString:@"_1"];
      [(id)v67 setObject:v69 forKeyedSubscript:@"Name"];

      v70 = [v5 sourceTensors];
      v71 = [v70 objectAtIndexedSubscript:0];
      v72 = [v71 label];
      v128[0] = v72;
      v73 = [v9 objectForKeyedSubscript:@"Name"];
      v128[1] = v73;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
      v75 = v74 = v5;
      [(id)v67 setObject:v75 forKeyedSubscript:@"Bottom"];

      v76 = [v74 sourceTensors];
      v77 = [v76 objectAtIndexedSubscript:0];
      v127[0] = v77;
      v78 = v74;
      v79 = v74;
      v80 = (void *)v67;
      v81 = [v79 sourceTensors];
      v82 = [v81 objectAtIndexedSubscript:0];
      v127[1] = v82;
      v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:2];
      LOBYTE(v67) = ANE_ValidateElementWiseUnit(v83, (void *)v67, 1);

      if ((v67 & 1) == 0)
      {
        v115 = +[MLCLog framework];
        id v5 = v78;
        if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsWithNeuronLayer_cold_3();
        }

        id v11 = 0;
        id v6 = v119;
        goto LABEL_11;
      }
      [v7 addObject:v9];
      [v7 addObject:v80];

      id v5 = v78;
LABEL_38:
      id v6 = v119;
      goto LABEL_5;
    case 19:
      if ([v6 count] != 4)
      {
        v9 = +[MLCLog framework];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsWithNeuronLayer_cold_15();
        }
LABEL_9:

        goto LABEL_10;
      }
      v84 = [v6 objectAtIndexedSubscript:0];
      v50 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v84];

      v85 = [v5 label];
      v86 = objc_msgSend(v85, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v7, "count"));
      [v50 setObject:v86 forKeyedSubscript:@"Name"];

      [v7 addObject:v50];
      v87 = [v6 objectAtIndexedSubscript:1];
      v88 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v87];

      v89 = [v5 label];
      v90 = objc_msgSend(v89, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v7, "count"));
      [v88 setObject:v90 forKeyedSubscript:@"Name"];

      v91 = [v50 objectForKeyedSubscript:@"Name"];
      v123 = v91;
      uint64_t v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
      [v88 setObject:v92 forKeyedSubscript:@"Bottom"];

      v93 = [v5 sourceTensors];
      LOBYTE(v92) = ANE_ValidateNeuronUnit(v93, v88, 1);

      if ((v92 & 1) == 0)
      {
        v113 = +[MLCLog framework];
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsWithNeuronLayer_cold_3();
        }

LABEL_63:
LABEL_10:
        id v11 = 0;
        goto LABEL_11;
      }
      [v7 addObject:v88];
      v94 = [v6 objectAtIndexedSubscript:2];
      v95 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v94];

      v96 = [v5 label];
      v118 = v50;
      id v97 = v5;
      v98 = objc_msgSend(v96, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v7, "count"));
      [v95 setObject:v98 forKeyedSubscript:@"Name"];

      v99 = [v88 objectForKeyedSubscript:@"Name"];
      v122 = v99;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
      v100 = v120 = v6;
      [v95 setObject:v100 forKeyedSubscript:@"Bottom"];

      [v7 addObject:v95];
      v101 = [v120 objectAtIndexedSubscript:3];
      v102 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v101];

      v103 = [v5 label];
      v104 = objc_msgSend(v103, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v7, "count"));
      [v102 setObject:v104 forKeyedSubscript:@"Name"];

      v105 = [v5 sourceTensors];
      v106 = [v105 objectAtIndexedSubscript:0];
      v107 = [v106 label];
      v121[0] = v107;
      v108 = [v95 objectForKeyedSubscript:@"Name"];
      v121[1] = v108;
      v109 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
      [v102 setObject:v109 forKeyedSubscript:@"Bottom"];

      id v5 = v97;
      [v7 addObject:v102];

      id v6 = v120;
LABEL_5:
      id v11 = v7;
LABEL_11:

      return v11;
    default:
      v48 = +[MLCLog framework];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithNeuronLayer_cold_1();
      }

      goto LABEL_10;
  }
}

id ANE_CreateUnitsOfLinear(void *a1, void *a2)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if ([v4 count] == 3)
  {
    id v6 = [v4 objectAtIndexedSubscript:0];
    v7 = +[_MLCANEPlistBuilder createUnitWithLayer:v3 unitParams:v6];

    uint64_t v8 = [v3 label];
    uint64_t v9 = [v8 stringByAppendingString:@"_0"];
    [v7 setObject:v9 forKeyedSubscript:@"Name"];

    float v10 = [v3 sourceTensors];
    LOBYTE(v9) = ANE_ValidateGOCUnit(v10, v7, 1);

    if (v9)
    {
      id v11 = [v4 objectAtIndexedSubscript:1];
      v12 = +[_MLCANEPlistBuilder createUnitWithLayer:v3 unitParams:v11];

      float v13 = [v3 label];
      uint64_t v14 = [v13 stringByAppendingString:@"_1"];
      [v12 setObject:v14 forKeyedSubscript:@"Name"];

      float v15 = [v7 objectForKeyedSubscript:@"Name"];
      v32[0] = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
      [v12 setObject:v16 forKeyedSubscript:@"Bottom"];

      uint64_t v17 = [v3 sourceTensors];
      LOBYTE(v16) = ANE_ValidatePoolingUnit(v17, v12, 1);

      if (v16)
      {
        v18 = [v4 objectAtIndexedSubscript:2];
        v19 = +[_MLCANEPlistBuilder createUnitWithLayer:v3 unitParams:v18];

        v20 = [v3 label];
        v21 = [v20 stringByAppendingString:@"_2"];
        [v19 setObject:v21 forKeyedSubscript:@"Name"];

        id v22 = [v12 objectForKeyedSubscript:@"Name"];
        v31 = v22;
        uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
        [v19 setObject:v23 forKeyedSubscript:@"Bottom"];

        float v24 = [v3 sourceTensors];
        LOBYTE(v23) = ANE_ValidateGOCUnit(v24, v19, 1);

        if (v23)
        {
          [v5 addObject:v7];
          [v5 addObject:v12];
          [v5 addObject:v19];

LABEL_9:
          uint64_t v28 = (void *)[v5 copy];
          goto LABEL_24;
        }
        v29 = +[MLCLog framework];
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsOfLinear_cold_1();
        }
      }
      else
      {
        v19 = +[MLCLog framework];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsOfLinear_cold_2();
        }
      }

      goto LABEL_22;
    }
    v12 = +[MLCLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
  }
  else
  {
    if ([v4 count] != 1)
    {
      v7 = +[MLCLog framework];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsOfLinear_cold_5();
      }
      goto LABEL_23;
    }
    v25 = [v4 objectAtIndexedSubscript:0];
    v7 = +[_MLCANEPlistBuilder createUnitWithLayer:v3 unitParams:v25];

    v26 = [v3 sourceTensors];
    char v27 = ANE_ValidateGOCUnit(v26, v7, 1);

    if (v27)
    {
      [v5 addObject:v7];
      goto LABEL_9;
    }
    v12 = +[MLCLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
LABEL_11:
    }
      ANE_CreateUnitsOfLinear_cold_1();
  }
LABEL_22:

LABEL_23:
  uint64_t v28 = 0;
LABEL_24:

  return v28;
}

id ANE_CompileNeuronLayer(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = [a3 parentLayers];
  id v6 = [v5 objectAtIndexedSubscript:0];

  v7 = [v4 objectAtIndexedSubscript:0];

  uint64_t v8 = [v7 params];
  uint64_t v9 = [v8 neuronParams];

  float v10 = [v7 params];
  int v11 = [v10 type];

  v12 = ANE_CreateUnitsWithNeuronLayer(v6, v9, v11);
  float v13 = v12;
  if (v12) {
    id v14 = v12;
  }

  return v13;
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

double OUTLINED_FUNCTION_4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 8) = a2;
  return *(float *)a1;
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id GPU_CreateLossLayer(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 lossType];
  if (v5 >= 9)
  {
    uint64_t v10 = +[MLCLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      GPU_CreateLossLayer_cold_2(v4);
    }
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  v7 = v4;
  uint64_t v8 = [v4 reductionType];
  [v7 lossType];
  if (v8 >= 3)
  {
    uint64_t v10 = +[MLCLog framework];
    id v4 = v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      GPU_CreateLossLayer_cold_1(v7);
    }
LABEL_13:

    int v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_34;
  }
  uint64_t v9 = [MEMORY[0x1E4F35460] cnnLossDescriptorWithType:v6 reductionType:v8];
  objc_msgSend(v9, "setReduceAcrossBatch:", objc_msgSend(v7, "reductionType") != 0);
  id v4 = v7;
  if ((v6 & 0xE) == 2)
  {
    [v7 labelSmoothing];
    objc_msgSend(v9, "setLabelSmoothing:");
  }
  switch(v6)
  {
    case 8:
      [v7 epsilon];
      objc_msgSend(v9, "setEpsilon:");
      break;
    case 6:
      [v7 delta];
      objc_msgSend(v9, "setDelta:");
      break;
    case 2:
      objc_msgSend(v9, "setNumberOfClasses:", objc_msgSend(v7, "classCount"));
      break;
  }
  v12 = [v3 deviceList];
  uint64_t v13 = [v12 count];

  v30 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (v13)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0x1E4F35000uLL;
    uint64_t v28 = v13;
    id v29 = v3;
    do
    {
      uint64_t v16 = [v3 deviceList];
      uint64_t v17 = [v16 objectAtIndexedSubscript:v14];

      [v4 weight];
      objc_msgSend(v9, "setWeight:");
      v18 = (void *)[objc_alloc(*(Class *)(v15 + 2312)) initWithDevice:v17 lossDescriptor:v9];
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F35928]) initWithDevice:v17 lossDescriptor:v9];
      v32 = (void *)[objc_alloc(MEMORY[0x1E4F35918]) initWithDevice:v17];
      v31 = (void *)[objc_alloc(MEMORY[0x1E4F35450]) initWithDevice:v17 lossDescriptor:v9];
      if (([v4 lossType] == 2 || objc_msgSend(v4, "lossType") == 4)
        && ![v4 reductionType])
      {
        v20 = (void *)[objc_alloc(MEMORY[0x1E4F35958]) initWithDevice:v17];
        if (!v18) {
          goto LABEL_32;
        }
      }
      else
      {
        v20 = 0;
        if (!v18) {
          goto LABEL_32;
        }
      }
      if (v19)
      {
        if ([v4 reductionType] != 2 || v13 == 1)
        {
          v26 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v18 gradientKernel:v19];
          if (v26) {
            goto LABEL_30;
          }
        }
        else
        {
          LODWORD(v21) = 0.5;
          id v22 = [MEMORY[0x1E4F35930] cnnNeuronDescriptorWithType:2 a:v21 b:0.0];
          uint64_t v23 = v9;
          id v24 = v4;
          v25 = (void *)[objc_alloc(MEMORY[0x1E4F35470]) initWithDevice:v17 neuronDescriptor:v22];
          v26 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v18 gradientKernel:v19 secondaryGradientKernel:v25];

          id v4 = v24;
          uint64_t v9 = v23;
          uint64_t v13 = v28;

          id v3 = v29;
          if (!v26) {
            goto LABEL_31;
          }
LABEL_30:
          [v26 setLossInitialGradientKernel:v32];
          [v26 setCombinedForwardAndGradientLossKernel:v31];
          [v26 setReduceLossKernel:v20];
          [v26 setSourceOfForwardNeededForGradient:1];
          [v26 setResultOfForwardNeededForGradient:0];
          [v30 addObject:v26];
        }
LABEL_31:

        unint64_t v15 = 0x1E4F35000;
      }
LABEL_32:

      ++v14;
    }
    while (v13 != v14);
  }
  int v11 = (void *)[v30 copy];

LABEL_34:

  return v11;
}

id GPU_CreateYOLOLossLayer(void *a1, void *a2)
{
  id v141 = a1;
  id v3 = a2;
  id v4 = [v3 spatialPositionLossDescriptor];
  uint64_t v5 = [v4 lossType];
  int v6 = 0;
  int v7 = 0;
  int v8 = 0;
  switch((int)v5)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 7:
      break;
    case 2:
      int v7 = 0;
      int v8 = 0;
      int v6 = 1;
      break;
    case 6:
      int v6 = 0;
      int v7 = 0;
      int v8 = 1;
      break;
    case 8:
      int v6 = 0;
      int v8 = 0;
      int v7 = 1;
      break;
    default:
      int v6 = 0;
      int v7 = 0;
      int v8 = 0;
      uint64_t v5 = 10;
      break;
  }
  int v133 = v6;
  int v137 = v7;
  int v139 = v8;

  uint64_t v9 = [v3 spatialSizeLossDescriptor];
  uint64_t v10 = [v9 lossType];
  int v11 = 0;
  int v12 = 0;
  int v13 = 0;
  switch((int)v10)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 7:
      break;
    case 2:
      int v12 = 0;
      int v13 = 0;
      int v11 = 1;
      break;
    case 6:
      int v11 = 0;
      int v12 = 0;
      int v13 = 1;
      break;
    case 8:
      int v11 = 0;
      int v13 = 0;
      int v12 = 1;
      break;
    default:
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      uint64_t v10 = 10;
      break;
  }
  int v132 = v11;
  int v136 = v12;
  int v140 = v13;

  uint64_t v14 = [v3 confidenceLossDescriptor];
  uint64_t v15 = [v14 lossType];
  int v16 = 0;
  int v17 = 0;
  int v18 = 0;
  switch((int)v15)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 7:
      break;
    case 2:
      int v17 = 0;
      int v18 = 0;
      int v16 = 1;
      break;
    case 6:
      int v16 = 0;
      int v17 = 0;
      int v18 = 1;
      break;
    case 8:
      int v16 = 0;
      int v18 = 0;
      int v17 = 1;
      break;
    default:
      int v16 = 0;
      int v17 = 0;
      int v18 = 0;
      uint64_t v15 = 10;
      break;
  }
  int v131 = v16;
  int v135 = v17;
  int v138 = v18;

  uint64_t v19 = [v3 classesLossDescriptor];
  uint64_t v20 = [(id)v19 lossType];
  int v21 = 0;
  int v22 = 0;
  int v23 = 0;
  switch((int)v20)
  {
    case 0:
    case 1:
    case 3:
    case 4:
    case 5:
    case 7:
      break;
    case 2:
      int v22 = 0;
      int v23 = 0;
      int v21 = 1;
      break;
    case 6:
      int v21 = 0;
      int v22 = 0;
      int v23 = 1;
      break;
    case 8:
      int v21 = 0;
      int v23 = 0;
      int v22 = 1;
      break;
    default:
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      uint64_t v20 = 10;
      break;
  }
  int v134 = v22;

  LODWORD(v19) = [v3 reductionType];
  id v24 = [v3 spatialPositionLossDescriptor];
  [v24 lossType];
  if (v19 >= 3) {
    uint64_t v19 = 4;
  }
  else {
    uint64_t v19 = v19;
  }

  v25 = (void *)MEMORY[0x1E4F35518];
  v26 = [v3 anchorBoxes];
  char v27 = objc_msgSend(v25, "cnnLossDescriptorWithXYLossType:WHLossType:confidenceLossType:classesLossType:reductionType:anchorBoxes:numberOfAnchorBoxes:", v5, v10, v15, v20, v19, v26, objc_msgSend(v3, "anchorBoxCount"));

  [v27 setReduceAcrossBatch:1];
  uint64_t v28 = [v3 spatialPositionLossDescriptor];
  [v28 weight];
  int v30 = v29;
  v31 = [v27 XYLossDescriptor];
  LODWORD(v32) = v30;
  [v31 setWeight:v32];

  v33 = [v3 spatialSizeLossDescriptor];
  [v33 weight];
  int v35 = v34;
  v36 = [v27 WHLossDescriptor];
  LODWORD(v37) = v35;
  [v36 setWeight:v37];

  v38 = [v3 confidenceLossDescriptor];
  [v38 weight];
  int v40 = v39;
  uint64_t v41 = [v27 confidenceLossDescriptor];
  LODWORD(v42) = v40;
  [v41 setWeight:v42];

  v43 = [v3 classesLossDescriptor];
  [v43 weight];
  int v45 = v44;
  v46 = [v27 classesLossDescriptor];
  LODWORD(v47) = v45;
  [v46 setWeight:v47];

  if ((v5 & 0xE) == 2)
  {
    v48 = [v3 spatialPositionLossDescriptor];
    [v48 labelSmoothing];
    int v50 = v49;
    v51 = [v27 XYLossDescriptor];
    LODWORD(v52) = v50;
    [v51 setLabelSmoothing:v52];
  }
  if ((v10 & 0xE) == 2)
  {
    v53 = [v3 spatialSizeLossDescriptor];
    [v53 labelSmoothing];
    int v55 = v54;
    v56 = [v27 WHLossDescriptor];
    LODWORD(v57) = v55;
    [v56 setLabelSmoothing:v57];
  }
  if ((v15 & 0xE) == 2)
  {
    v58 = [v3 confidenceLossDescriptor];
    [v58 labelSmoothing];
    int v60 = v59;
    v61 = [v27 confidenceLossDescriptor];
    LODWORD(v62) = v60;
    [v61 setLabelSmoothing:v62];
  }
  if ((v20 & 0xE) == 2)
  {
    v63 = [v3 classesLossDescriptor];
    [v63 labelSmoothing];
    int v65 = v64;
    v66 = [v27 classesLossDescriptor];
    LODWORD(v67) = v65;
    [v66 setLabelSmoothing:v67];
  }
  if (v133)
  {
    v68 = [v3 spatialPositionLossDescriptor];
    uint64_t v69 = [v68 classCount];
    v70 = [v27 XYLossDescriptor];
    [v70 setNumberOfClasses:v69];
  }
  if (v132)
  {
    v71 = [v3 spatialSizeLossDescriptor];
    uint64_t v72 = [v71 classCount];
    v73 = [v27 WHLossDescriptor];
    [v73 setNumberOfClasses:v72];
  }
  if (v131)
  {
    v74 = [v3 confidenceLossDescriptor];
    uint64_t v75 = [v74 classCount];
    v76 = [v27 confidenceLossDescriptor];
    [v76 setNumberOfClasses:v75];
  }
  if (v21)
  {
    v77 = [v3 classesLossDescriptor];
    uint64_t v78 = [v77 classCount];
    v79 = [v27 classesLossDescriptor];
    [v79 setNumberOfClasses:v78];
  }
  if (v137)
  {
    v80 = [v3 spatialPositionLossDescriptor];
    [v80 epsilon];
    int v82 = v81;
    v83 = [v27 XYLossDescriptor];
    LODWORD(v84) = v82;
    [v83 setEpsilon:v84];
  }
  if (v136)
  {
    v85 = [v3 spatialSizeLossDescriptor];
    [v85 epsilon];
    int v87 = v86;
    v88 = [v27 WHLossDescriptor];
    LODWORD(v89) = v87;
    [v88 setEpsilon:v89];
  }
  if (v135)
  {
    v90 = [v3 confidenceLossDescriptor];
    [v90 epsilon];
    int v92 = v91;
    v93 = [v27 confidenceLossDescriptor];
    LODWORD(v94) = v92;
    [v93 setEpsilon:v94];
  }
  if (v134)
  {
    v95 = [v3 classesLossDescriptor];
    [v95 epsilon];
    int v97 = v96;
    v98 = [v27 classesLossDescriptor];
    LODWORD(v99) = v97;
    [v98 setEpsilon:v99];
  }
  if (v139)
  {
    v100 = [v3 spatialPositionLossDescriptor];
    [v100 delta];
    int v102 = v101;
    v103 = [v27 XYLossDescriptor];
    LODWORD(v104) = v102;
    [v103 setDelta:v104];
  }
  if (v140)
  {
    v105 = [v3 spatialSizeLossDescriptor];
    [v105 delta];
    int v107 = v106;
    v108 = [v27 WHLossDescriptor];
    LODWORD(v109) = v107;
    [v108 setDelta:v109];
  }
  if (v138)
  {
    v110 = [v3 confidenceLossDescriptor];
    [v110 delta];
    int v112 = v111;
    v113 = [v27 confidenceLossDescriptor];
    LODWORD(v114) = v112;
    [v113 setDelta:v114];
  }
  if (v23)
  {
    v115 = [v3 classesLossDescriptor];
    [v115 delta];
    int v117 = v116;
    v118 = [v27 classesLossDescriptor];
    LODWORD(v119) = v117;
    [v118 setDelta:v119];
  }
  objc_msgSend(v27, "setRescore:", objc_msgSend(v3, "shouldRescore"));
  [v3 scaleSpatialPositionLoss];
  objc_msgSend(v27, "setScaleXY:");
  [v3 scaleSpatialSizeLoss];
  objc_msgSend(v27, "setScaleWH:");
  [v3 scaleNoObjectConfidenceLoss];
  objc_msgSend(v27, "setScaleNoObject:");
  [v3 scaleObjectConfidenceLoss];
  objc_msgSend(v27, "setScaleObject:");
  [v3 scaleClassLoss];
  objc_msgSend(v27, "setScaleClass:");
  [v3 minimumIOUForObjectPresence];
  objc_msgSend(v27, "setMinIOUForObjectPresence:");
  [v3 maximumIOUForObjectAbsence];
  objc_msgSend(v27, "setMaxIOUForObjectAbsence:");
  v120 = [v141 deviceList];
  uint64_t v121 = [v120 count];

  v122 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (v121)
  {
    for (uint64_t i = 0; i != v121; ++i)
    {
      v124 = [v141 deviceList];
      v125 = [v124 objectAtIndexedSubscript:i];

      v126 = (void *)[objc_alloc(MEMORY[0x1E4F35510]) initWithDevice:v125 lossDescriptor:v27];
      if (v126)
      {
        v127 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v126 gradientKernel:v126];
        v128 = v127;
        if (v127)
        {
          [v127 setLossInitialGradientKernel:0];
          [v128 setCombinedForwardAndGradientLossKernel:v126];
          [v128 setSourceOfForwardNeededForGradient:1];
          [v128 setResultOfForwardNeededForGradient:0];
          [v122 addObject:v128];
        }
      }
    }
  }
  v129 = (void *)[v122 copy];

  return v129;
}

uint64_t CPU_BNNSDataTypeSizeInBytes(int a1)
{
  uint64_t result = 4;
  if (a1 > 131103)
  {
    if (a1 <= 262159)
    {
      if (a1 == 131104) {
        return result;
      }
      if (a1 != 262152) {
        goto LABEL_18;
      }
    }
    else if (a1 != 1048584)
    {
      if (a1 == 262176) {
        return result;
      }
      int v7 = 262160;
      goto LABEL_15;
    }
    return 1;
  }
  if (a1 > 131079)
  {
    if (a1 != 131080)
    {
      int v7 = 131088;
LABEL_15:
      if (a1 == v7) {
        return 2;
      }
LABEL_18:
      int v8 = +[MLCLog framework];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        CPU_BNNSDataTypeSizeInBytes_cold_1(v8, v9, v10);
      }

      return 0;
    }
    return 1;
  }
  if (a1 == 65552) {
    return 2;
  }
  if (a1 != 65568) {
    goto LABEL_18;
  }
  return result;
}

uint64_t CPU_BNNSDataType(int a1)
{
  int v2 = a1 - 1;
  if (a1 - 1) < 9 && ((0x1EDu >> v2)) {
    return dword_1DD1F0A40[v2];
  }
  uint64_t v3 = +[MLCLog framework];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    CPU_BNNSDataType_cold_1(a1, v3);
  }

  return 0;
}

uint64_t CPU_BuildBNNSNDArrayLastMajorDescriptor(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  int v12 = (void *)MEMORY[0x1E4F1CBF0];
  int v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v14 = (void *)[v12 mutableCopy];
  id v57 = v11;
  switch([v9 count])
  {
    case 1:
      *(_DWORD *)(a1 + 4) = 98304;
      uint64_t v15 = [v9 objectAtIndexedSubscript:0];
      [v13 setObject:v15 atIndexedSubscript:0];

      if (!v10) {
        goto LABEL_17;
      }
      int v16 = [v10 objectAtIndexedSubscript:0];
      int v17 = v14;
      int v18 = v16;
      uint64_t v19 = 0;
      goto LABEL_9;
    case 2:
      *(_DWORD *)(a1 + 4) = 163840;
      id v24 = [v9 objectAtIndexedSubscript:0];
      [v13 setObject:v24 atIndexedSubscript:0];

      v25 = [v9 objectAtIndexedSubscript:1];
      [v13 setObject:v25 atIndexedSubscript:1];

      if (v10)
      {
        v26 = [v10 objectAtIndexedSubscript:0];
        [v14 setObject:v26 atIndexedSubscript:0];

        int v16 = [v10 objectAtIndexedSubscript:1];
        int v17 = v14;
        int v18 = v16;
        uint64_t v19 = 1;
LABEL_9:
        [v17 setObject:v18 atIndexedSubscript:v19];
      }
      goto LABEL_17;
    case 3:
      char v27 = [v9 objectAtIndexedSubscript:0];
      [v13 setObject:v27 atIndexedSubscript:0];

      uint64_t v28 = [v9 objectAtIndexedSubscript:1];
      [v13 setObject:v28 atIndexedSubscript:1];

      int v29 = [v9 objectAtIndexedSubscript:2];
      [v13 setObject:v29 atIndexedSubscript:2];

      if (v10)
      {
        int v30 = [v10 objectAtIndexedSubscript:0];
        [v14 setObject:v30 atIndexedSubscript:0];

        v31 = [v10 objectAtIndexedSubscript:1];
        [v14 setObject:v31 atIndexedSubscript:1];

        double v32 = [v10 objectAtIndexedSubscript:2];
        [v14 setObject:v32 atIndexedSubscript:2];
      }
      int v33 = 229376;
      goto LABEL_16;
    case 4:
      int v34 = [v9 objectAtIndexedSubscript:0];
      [v13 setObject:v34 atIndexedSubscript:0];

      int v35 = [v9 objectAtIndexedSubscript:1];
      [v13 setObject:v35 atIndexedSubscript:1];

      v36 = [v9 objectAtIndexedSubscript:2];
      [v13 setObject:v36 atIndexedSubscript:2];

      double v37 = [v9 objectAtIndexedSubscript:3];
      [v13 setObject:v37 atIndexedSubscript:3];

      if (v10)
      {
        v38 = [v10 objectAtIndexedSubscript:0];
        [v14 setObject:v38 atIndexedSubscript:0];

        int v39 = [v10 objectAtIndexedSubscript:1];
        [v14 setObject:v39 atIndexedSubscript:1];

        int v40 = [v10 objectAtIndexedSubscript:2];
        [v14 setObject:v40 atIndexedSubscript:2];

        uint64_t v41 = [v10 objectAtIndexedSubscript:3];
        [v14 setObject:v41 atIndexedSubscript:3];
      }
      int v33 = 294912;
LABEL_16:
      *(_DWORD *)(a1 + 4) = v33;
LABEL_17:
      int v42 = CPU_BNNSDataType(a5);
      *(_DWORD *)(a1 + 144) = v42;
      unint64_t v43 = CPU_BNNSDataTypeSizeInBytes(v42);
      uint64_t v44 = [v13 count];
      if (v44)
      {
        unint64_t v45 = v44;
        v46 = (void *)(a1 + 8);
        uint64_t v47 = -1;
        do
        {
          v48 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") + v47);
          *v46++ = [v48 unsignedIntegerValue];

          --v47;
        }
        while (v45 + v47 != -1);
        if (v10)
        {
          uint64_t v49 = 0;
          uint64_t v50 = -(uint64_t)v45;
          v51 = (unint64_t *)(a1 + 72);
          do
          {
            double v52 = objc_msgSend(v14, "objectAtIndexedSubscript:", --v49 + objc_msgSend(v13, "count"));
            *v51++ = [v52 unsignedIntegerValue] / v43;
          }
          while (v50 != v49);
        }
        else
        {
          *(void *)(a1 + 72) = 1;
          if (v45 >= 2)
          {
            unint64_t v53 = v45 - 1;
            int v54 = (uint64_t *)(a1 + 80);
            uint64_t v55 = 1;
            do
            {
              v55 *= *(v54 - 9);
              *v54++ = v55;
              --v53;
            }
            while (v53);
          }
        }
      }
      else if (!v10)
      {
        *(void *)(a1 + 72) = 1;
      }
      id v11 = v57;
      if (v57) {
        *(void *)(a1 + 136) = [v57 bytes];
      }
      *(void *)(a1 + 164) = 1065353216;
      uint64_t v23 = 1;
      break;
    default:
      uint64_t v20 = +[MLCLog framework];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        CPU_BuildBNNSNDArrayLastMajorDescriptor_cold_1(v20, v21, v22);
      }

      uint64_t v23 = 0;
      break;
  }

  return v23;
}

uint64_t CPU_BuildBNNSNDArrayDescriptor(uint64_t a1, void *a2, void *a3, void *a4, int a5, int a6, int a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  int v16 = (void *)MEMORY[0x1E4F1CBF0];
  int v17 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  int v18 = (void *)[v16 mutableCopy];
  switch([v13 count])
  {
    case 1:
      *(_DWORD *)(a1 + 4) = 0x10000;
      uint64_t v19 = [v13 objectAtIndexedSubscript:0];
      [v17 setObject:v19 atIndexedSubscript:0];

      if (!v14) {
        goto LABEL_24;
      }
      uint64_t v20 = v14;
      uint64_t v21 = 0;
      goto LABEL_10;
    case 2:
      if (a6)
      {
        *(_DWORD *)(a1 + 4) = 0x10000;
        v26 = [v13 objectAtIndexedSubscript:1];
        [v17 setObject:v26 atIndexedSubscript:0];

        if (!v14) {
          goto LABEL_24;
        }
        uint64_t v20 = v14;
        uint64_t v21 = 1;
LABEL_10:
        char v27 = [v20 objectAtIndexedSubscript:v21];
        uint64_t v28 = v18;
        int v29 = v27;
        uint64_t v30 = 0;
      }
      else
      {
        *(_DWORD *)(a1 + 4) = 0x20000;
        uint64_t v49 = [v13 objectAtIndexedSubscript:0];
        [v17 setObject:v49 atIndexedSubscript:0];

        uint64_t v50 = [v13 objectAtIndexedSubscript:1];
        [v17 setObject:v50 atIndexedSubscript:1];

        if (!v14) {
          goto LABEL_24;
        }
        v51 = [v14 objectAtIndexedSubscript:0];
        [v18 setObject:v51 atIndexedSubscript:0];

        char v27 = [v14 objectAtIndexedSubscript:1];
        uint64_t v28 = v18;
        int v29 = v27;
        uint64_t v30 = 1;
      }
      [v28 setObject:v29 atIndexedSubscript:v30];

      goto LABEL_24;
    case 3:
      v31 = [v13 objectAtIndexedSubscript:0];
      [v17 setObject:v31 atIndexedSubscript:0];

      double v32 = [v13 objectAtIndexedSubscript:1];
      [v17 setObject:v32 atIndexedSubscript:1];

      if (a7)
      {
        int v33 = [v13 objectAtIndexedSubscript:2];
        [v17 setObject:v33 atIndexedSubscript:2];

        if (!v14) {
          goto LABEL_23;
        }
        int v34 = [v14 objectAtIndexedSubscript:0];
        [v18 setObject:v34 atIndexedSubscript:0];

        int v35 = [v14 objectAtIndexedSubscript:1];
        [v18 setObject:v35 atIndexedSubscript:1];

        v36 = [v14 objectAtIndexedSubscript:2];
        double v37 = v18;
        v38 = v36;
        uint64_t v39 = 2;
      }
      else
      {
        double v52 = [NSNumber numberWithUnsignedInteger:1];
        [v17 setObject:v52 atIndexedSubscript:2];

        unint64_t v53 = [v13 objectAtIndexedSubscript:2];
        [v17 setObject:v53 atIndexedSubscript:3];

        if (!v14) {
          goto LABEL_23;
        }
        int v54 = [v14 objectAtIndexedSubscript:0];
        [v18 setObject:v54 atIndexedSubscript:0];

        uint64_t v55 = [v14 objectAtIndexedSubscript:1];
        [v18 setObject:v55 atIndexedSubscript:1];

        v56 = [v14 objectAtIndexedSubscript:1];
        [v18 setObject:v56 atIndexedSubscript:2];

        uint64_t v47 = v14;
        uint64_t v48 = 2;
LABEL_21:
        v36 = [v47 objectAtIndexedSubscript:v48];
        double v37 = v18;
        v38 = v36;
        uint64_t v39 = 3;
      }
      [v37 setObject:v38 atIndexedSubscript:v39];

LABEL_23:
      *(_DWORD *)(a1 + 4) = 196608;
LABEL_24:
      id v73 = v13;
      int v57 = CPU_BNNSDataType(a5);
      *(_DWORD *)(a1 + 144) = v57;
      unint64_t v58 = CPU_BNNSDataTypeSizeInBytes(v57);
      if ([v17 count] == 4 && (a6 & 1) != 0)
      {
        int v59 = v15;
        unint64_t v60 = 3;
      }
      else
      {
        int v59 = v15;
        unint64_t v60 = [v17 count];
        if (!v60)
        {
          char v64 = 1;
          if (v14) {
            goto LABEL_31;
          }
          goto LABEL_36;
        }
      }
      v61 = (void *)(a1 + 8);
      uint64_t v62 = -1;
      do
      {
        v63 = objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v17, "count") + v62);
        *v61++ = [v63 unsignedIntegerValue];

        --v62;
      }
      while (v60 + v62 != -1);
      char v64 = 0;
      if (v14)
      {
LABEL_31:
        if ((v64 & 1) == 0)
        {
          uint64_t v65 = 0;
          uint64_t v66 = -(uint64_t)v60;
          double v67 = (unint64_t *)(a1 + 72);
          do
          {
            v68 = objc_msgSend(v18, "objectAtIndexedSubscript:", --v65 + objc_msgSend(v17, "count"));
            *v67++ = [v68 unsignedIntegerValue] / v58;
          }
          while (v66 != v65);
        }
        goto LABEL_39;
      }
LABEL_36:
      *(void *)(a1 + 72) = 1;
      if (v60 >= 2)
      {
        unint64_t v69 = v60 - 1;
        v70 = (uint64_t *)(a1 + 80);
        uint64_t v71 = 1;
        do
        {
          v71 *= *(v70 - 9);
          *v70++ = v71;
          --v69;
        }
        while (v69);
      }
LABEL_39:
      id v15 = v59;
      if (v59) {
        *(void *)(a1 + 136) = [v59 bytes];
      }
      *(void *)(a1 + 164) = 1065353216;
      uint64_t v25 = 1;
      id v13 = v73;
LABEL_42:

      return v25;
    case 4:
      int v40 = [v13 objectAtIndexedSubscript:0];
      [v17 setObject:v40 atIndexedSubscript:0];

      uint64_t v41 = [v13 objectAtIndexedSubscript:1];
      [v17 setObject:v41 atIndexedSubscript:1];

      int v42 = [v13 objectAtIndexedSubscript:2];
      [v17 setObject:v42 atIndexedSubscript:2];

      unint64_t v43 = [v13 objectAtIndexedSubscript:3];
      [v17 setObject:v43 atIndexedSubscript:3];

      if (!v14) {
        goto LABEL_23;
      }
      uint64_t v44 = [v14 objectAtIndexedSubscript:0];
      [v18 setObject:v44 atIndexedSubscript:0];

      unint64_t v45 = [v14 objectAtIndexedSubscript:1];
      [v18 setObject:v45 atIndexedSubscript:1];

      v46 = [v14 objectAtIndexedSubscript:2];
      [v18 setObject:v46 atIndexedSubscript:2];

      uint64_t v47 = v14;
      uint64_t v48 = 3;
      goto LABEL_21;
    default:
      uint64_t v22 = +[MLCLog framework];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        CPU_BuildBNNSNDArrayDescriptor_cold_1(v22, v23, v24);
      }

      uint64_t v25 = 0;
      goto LABEL_42;
  }
}

uint64_t CPU_BuildPermuteBNNSNDArrayDescriptor(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  int v12 = (void *)MEMORY[0x1E4F1CBF0];
  id v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v14 = (void *)[v12 mutableCopy];
  uint64_t v15 = [v9 count];
  switch(v15)
  {
    case 4:
      uint64_t v20 = [v9 objectAtIndexedSubscript:0];
      [v13 setObject:v20 atIndexedSubscript:0];

      uint64_t v21 = [v9 objectAtIndexedSubscript:1];
      [v13 setObject:v21 atIndexedSubscript:1];

      uint64_t v22 = [v9 objectAtIndexedSubscript:2];
      [v13 setObject:v22 atIndexedSubscript:2];

      uint64_t v23 = [v9 objectAtIndexedSubscript:3];
      [v13 setObject:v23 atIndexedSubscript:3];

      if (v10)
      {
        uint64_t v24 = [v10 objectAtIndexedSubscript:0];
        [v14 setObject:v24 atIndexedSubscript:0];

        uint64_t v25 = [v10 objectAtIndexedSubscript:1];
        [v14 setObject:v25 atIndexedSubscript:1];

        v26 = [v10 objectAtIndexedSubscript:2];
        [v14 setObject:v26 atIndexedSubscript:2];

        char v27 = [v10 objectAtIndexedSubscript:3];
        [v14 setObject:v27 atIndexedSubscript:3];
      }
      id v54 = v11;
      int v28 = 294912;
      goto LABEL_12;
    case 3:
      int v29 = [v9 objectAtIndexedSubscript:0];
      [v13 setObject:v29 atIndexedSubscript:0];

      uint64_t v30 = [v9 objectAtIndexedSubscript:1];
      [v13 setObject:v30 atIndexedSubscript:1];

      v31 = [v9 objectAtIndexedSubscript:2];
      [v13 setObject:v31 atIndexedSubscript:2];

      if (v10)
      {
        double v32 = [v10 objectAtIndexedSubscript:0];
        [v14 setObject:v32 atIndexedSubscript:0];

        int v33 = [v10 objectAtIndexedSubscript:1];
        [v14 setObject:v33 atIndexedSubscript:1];

        int v34 = [v10 objectAtIndexedSubscript:2];
        [v14 setObject:v34 atIndexedSubscript:2];
      }
      id v54 = v11;
      int v28 = 229376;
LABEL_12:
      *(_DWORD *)(a1 + 4) = v28;
LABEL_13:
      int v35 = CPU_BNNSDataType(a5);
      *(_DWORD *)(a1 + 144) = v35;
      unint64_t v36 = CPU_BNNSDataTypeSizeInBytes(v35);
      uint64_t v37 = [v13 count];
      if (v37)
      {
        unint64_t v38 = v37;
        uint64_t v39 = (void *)(a1 + 8);
        uint64_t v40 = -1;
        do
        {
          uint64_t v41 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") + v40);
          *v39++ = [v41 unsignedIntegerValue];

          --v40;
        }
        while (v38 + v40 != -1);
        if (v10)
        {
          uint64_t v42 = 0;
          uint64_t v43 = -(uint64_t)v38;
          uint64_t v44 = (unint64_t *)(a1 + 72);
          do
          {
            unint64_t v45 = objc_msgSend(v14, "objectAtIndexedSubscript:", --v42 + objc_msgSend(v13, "count"));
            *v44++ = [v45 unsignedIntegerValue] / v36;
          }
          while (v43 != v42);
        }
        else
        {
          *(void *)(a1 + 72) = 1;
          if (v38 >= 2)
          {
            unint64_t v50 = v38 - 1;
            v51 = (uint64_t *)(a1 + 80);
            uint64_t v52 = 1;
            do
            {
              v52 *= *(v51 - 9);
              *v51++ = v52;
              --v50;
            }
            while (v50);
          }
        }
      }
      else if (!v10)
      {
        *(void *)(a1 + 72) = 1;
      }
      id v11 = v54;
      if (v54) {
        *(void *)(a1 + 136) = [v54 bytes];
      }
      *(void *)(a1 + 164) = 1065353216;
      uint64_t v49 = 1;
      goto LABEL_31;
    case 2:
      id v54 = v11;
      *(_DWORD *)(a1 + 4) = 163840;
      int v16 = [v9 objectAtIndexedSubscript:0];
      [v13 setObject:v16 atIndexedSubscript:0];

      int v17 = [v9 objectAtIndexedSubscript:1];
      [v13 setObject:v17 atIndexedSubscript:1];

      if (v10)
      {
        int v18 = [v10 objectAtIndexedSubscript:0];
        [v14 setObject:v18 atIndexedSubscript:0];

        uint64_t v19 = [v10 objectAtIndexedSubscript:1];
        [v14 setObject:v19 atIndexedSubscript:1];
      }
      goto LABEL_13;
  }
  v46 = +[MLCLog framework];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
    CPU_BuildPermuteBNNSNDArrayDescriptor_cold_1(v46, v47, v48);
  }

  uint64_t v49 = 0;
LABEL_31:

  return v49;
}

BOOL CPU_BuildBNNSNDArrayDescriptorRowMajor(uint64_t a1, void *a2, void *a3, void *a4, int a5, uint64_t a6, void *a7)
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  int v16 = (void *)[a2 mutableCopy];
  int v17 = (void *)[v13 mutableCopy];
  if (v15)
  {
    objc_msgSend(v16, "removeObjectAtIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
    objc_msgSend(v17, "removeObjectAtIndex:", objc_msgSend(v15, "unsignedIntegerValue"));
  }
  uint64_t v18 = [v16 count];
  uint64_t v19 = v18 - a6;
  if (v18 != a6)
  {
    do
    {
      [v16 removeObjectAtIndex:0];
      [v17 removeObjectAtIndex:0];
      --v19;
    }
    while (v19);
  }
  uint64_t v20 = [v16 count];
  unint64_t v21 = v20 - 1;
  if ((unint64_t)(v20 - 1) >= 8)
  {
    uint64_t v30 = +[MLCLog framework];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      CPU_BuildBNNSNDArrayDescriptorRowMajor_cold_1(v30, v31, v32);
    }
  }
  else
  {
    unint64_t v22 = v20;
    id v36 = v14;
    id v37 = v13;
    *(_DWORD *)(a1 + 4) = dword_1DD1F0A64[v21];
    int v23 = CPU_BNNSDataType(a5);
    *(_DWORD *)(a1 + 144) = v23;
    unint64_t v24 = CPU_BNNSDataTypeSizeInBytes(v23);
    uint64_t v25 = 0;
    do
    {
      v26 = objc_msgSend(v16, "objectAtIndexedSubscript:", v25, v36);
      *(void *)(a1 + 8 + 8 * v25) = [v26 unsignedIntegerValue];

      ++v25;
    }
    while (v22 != v25);
    if (v17)
    {
      char v27 = (unint64_t *)(a1 + 72);
      unint64_t v28 = v21;
      do
      {
        int v29 = [v17 objectAtIndexedSubscript:v28];
        *v27++ = [v29 unsignedIntegerValue] / v24;

        --v28;
      }
      while (v28 != -1);
    }
    else
    {
      *(void *)(a1 + 72) = 1;
      if (v22 >= 2)
      {
        uint64_t v33 = 1;
        uint64_t v34 = 80;
        do
        {
          v33 *= *(void *)(a1 + 8 * v22);
          *(void *)(a1 + v34) = v33;
          --v22;
          v34 += 8;
        }
        while (v22 != 1);
      }
    }
    id v14 = v36;
    if (v36) {
      *(void *)(a1 + 136) = [v36 bytes];
    }
    *(void *)(a1 + 164) = 1065353216;
    id v13 = v37;
  }

  return v21 < 8;
}

BOOL CPU_BuildBNNSNDArrayDescriptorColMajor(uint64_t a1, void *a2, void *a3, void *a4, int a5, uint64_t a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = (void *)[a2 mutableCopy];
  id v14 = (void *)[v11 mutableCopy];
  for (uint64_t i = [v13 count] - a6; i; --i)
  {
    [v13 removeObjectAtIndex:0];
    [v14 removeObjectAtIndex:0];
  }
  uint64_t v16 = [v13 count];
  unint64_t v17 = v16 - 1;
  if ((unint64_t)(v16 - 1) >= 8)
  {
    uint64_t v25 = +[MLCLog framework];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      CPU_BuildBNNSNDArrayDescriptorColMajor_cold_1(v25, v26, v27);
    }
  }
  else
  {
    unint64_t v18 = v16;
    *(_DWORD *)(a1 + 4) = dword_1DD1F0A84[v17];
    int v19 = CPU_BNNSDataType(a5);
    uint64_t v20 = 0;
    *(_DWORD *)(a1 + 144) = v19;
    do
    {
      unint64_t v21 = [v13 objectAtIndexedSubscript:v20];
      *(void *)(a1 + 8 + 8 * v20) = [v21 unsignedIntegerValue];

      ++v20;
    }
    while (v18 != v20);
    *(void *)(a1 + 72) = 1;
    if (v18 >= 2)
    {
      unint64_t v22 = (uint64_t *)(a1 + 80);
      uint64_t v23 = 1;
      unint64_t v24 = v17;
      do
      {
        v23 *= *(v22 - 9);
        *v22++ = v23;
        --v24;
      }
      while (v24);
    }
    if (v12) {
      *(void *)(a1 + 136) = [v12 bytes];
    }
    *(void *)(a1 + 164) = 1065353216;
  }

  return v17 < 8;
}

unint64_t CPU_SetBatchStride(void *a1)
{
  id v1 = a1;
  int v2 = [v1 descriptor];
  uint64_t v3 = [v2 stride];
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  unint64_t v5 = [v4 unsignedIntegerValue];

  int v6 = [v1 descriptor];
  int v7 = [v6 shape];
  uint64_t v8 = [v7 count];

  if (v8 == 1)
  {
    id v9 = [v1 descriptor];
    id v10 = [v9 shape];
    id v11 = [v10 objectAtIndexedSubscript:0];
    v5 *= [v11 unsignedIntegerValue];
  }
  id v12 = [v1 descriptor];
  int v13 = [v12 dataType];

  unint64_t v14 = v5 >> 2;
  if (v13 != 1) {
    unint64_t v14 = v5;
  }
  if (v13 == 3) {
    unint64_t v15 = v5 >> 1;
  }
  else {
    unint64_t v15 = v14;
  }

  return v15;
}

void convertDataLayout(void *a1, void *a2, void *a3, int a4, int a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = v11;
  if (!v10 || !v11)
  {
    unint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      convertDataLayout_cold_1();
    }
    goto LABEL_11;
  }
  uint64_t v13 = [v10 length];
  if (v13 != [v12 length])
  {
    unint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      convertDataLayout_cold_4();
    }
    goto LABEL_11;
  }
  unint64_t v14 = [v9 tensorAllocationSizeInBytes];
  if (v14 > [v10 length])
  {
    unint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      convertDataLayout_cold_2();
    }
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v16 = [v9 shape];
  unint64_t v17 = [v16 objectAtIndexedSubscript:3];
  uint64_t v18 = [v17 unsignedIntegerValue];

  int v19 = [v9 shape];
  uint64_t v20 = [v19 objectAtIndexedSubscript:2];
  uint64_t v21 = [v20 unsignedIntegerValue];

  unint64_t v22 = [v9 shape];
  uint64_t v23 = [v22 objectAtIndexedSubscript:1];
  uint64_t v24 = [v23 unsignedIntegerValue];

  id v53 = v9;
  uint64_t v25 = [v9 shape];
  uint64_t v26 = [v25 objectAtIndexedSubscript:0];
  uint64_t v27 = [v26 unsignedIntegerValue];

  if (a4 || a5 != 1)
  {
    if (a4 != 1 || a5)
    {
      unint64_t v15 = +[MLCLog framework];
      id v9 = v53;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        convertDataLayout_cold_3();
      }
      goto LABEL_11;
    }
    uint64_t v40 = [v10 bytes];
    uint64_t v41 = [v12 bytes];
    id v9 = v53;
    if (v27)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (v21)
        {
          uint64_t v43 = 0;
          uint64_t v44 = v40;
          uint64_t v45 = v41;
          do
          {
            if (v18)
            {
              uint64_t v46 = 0;
              uint64_t v47 = (int *)v44;
              uint64_t v48 = (_DWORD *)v45;
              do
              {
                uint64_t v49 = v47;
                unint64_t v50 = v48;
                for (uint64_t j = v24; j; --j)
                {
                  int v52 = *v49++;
                  _DWORD *v50 = v52;
                  v50 += v21 * v18;
                }
                ++v46;
                ++v48;
                v47 += v24;
              }
              while (v46 != v18);
            }
            ++v43;
            v45 += 4 * v18;
            v44 += 4 * v18 * v24;
          }
          while (v43 != v21);
        }
        v41 += 4 * v24 * v21 * v18;
        v40 += 4 * v21 * v18 * v24;
      }
    }
  }
  else
  {
    uint64_t v28 = [v10 bytes];
    uint64_t v29 = [v12 bytes];
    id v9 = v53;
    if (v27)
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (v21)
        {
          uint64_t v31 = 0;
          uint64_t v32 = v29;
          uint64_t v33 = v28;
          do
          {
            if (v18)
            {
              uint64_t v34 = 0;
              int v35 = (_DWORD *)v32;
              id v36 = (_DWORD *)v33;
              do
              {
                id v37 = v35;
                unint64_t v38 = v36;
                for (uint64_t m = v24; m; --m)
                {
                  *v37++ = *v38;
                  v38 += v21 * v18;
                }
                ++v34;
                ++v36;
                v35 += v24;
              }
              while (v34 != v18);
            }
            ++v31;
            v33 += 4 * v18;
            v32 += 4 * v18 * v24;
          }
          while (v31 != v21);
        }
        v28 += 4 * v24 * v21 * v18;
        v29 += 4 * v21 * v18 * v24;
      }
    }
  }
LABEL_12:
}

void convertNCHWtoTNC(void *a1, unint64_t a2, uint64_t a3, _DWORD *a4)
{
  id v5 = a1;
  int v6 = [v5 descriptor];
  int v7 = [v6 shape];
  uint64_t v8 = [v7 objectAtIndexedSubscript:1];
  uint64_t v31 = [v8 unsignedIntegerValue];

  id v9 = [v5 descriptor];
  id v10 = [v9 shape];
  id v11 = [v10 objectAtIndexedSubscript:3];
  uint64_t v12 = [v11 unsignedIntegerValue];

  uint64_t v13 = [v5 descriptor];
  unint64_t v14 = [v13 shape];
  unint64_t v15 = [v14 objectAtIndexedSubscript:2];
  uint64_t v16 = [v15 unsignedIntegerValue];

  if (v16 == 1)
  {
    id v28 = v5;
    unint64_t v17 = [v5 descriptor];
    uint64_t v18 = [v17 batchSizePerSequenceStep];

    if (a2)
    {
      unint64_t v19 = 0;
      do
      {
        if (v31)
        {
          uint64_t v20 = 0;
          uint64_t v21 = a3;
          uint64_t v33 = a4;
          do
          {
            uint64_t v32 = v20;
            if (v12)
            {
              uint64_t v22 = 0;
              uint64_t v23 = v33;
              do
              {
                unint64_t v24 = a2;
                if (v18)
                {
                  uint64_t v25 = [v18 objectAtIndexedSubscript:v22];
                  unint64_t v24 = [v25 unsignedIntegerValue];
                }
                int v26 = 0;
                if (v19 < v24) {
                  int v26 = *(_DWORD *)(v21 + 4 * v22);
                }
                *uint64_t v23 = v26;
                ++v22;
                v23 += v31 * a2;
              }
              while (v12 != v22);
            }
            uint64_t v20 = v32 + 1;
            v21 += 4 * v12;
            ++v33;
          }
          while (v32 + 1 != v31);
        }
        ++v19;
        a3 += 4 * v31 * v12;
        a4 += v31;
      }
      while (v19 != a2);
    }

    id v5 = v28;
  }
  else
  {
    uint64_t v27 = +[MLCLog framework];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      convertNCHWtoTNC_cold_1(v5);
    }
  }
}

void convertNSEtoTNC(void *a1, unint64_t a2, _DWORD *a3, _DWORD *a4)
{
  id v22 = a1;
  id v5 = [v22 descriptor];
  int v6 = [v5 shape];
  int v7 = [v6 objectAtIndexedSubscript:1];
  uint64_t v27 = [v7 unsignedIntegerValue];

  uint64_t v8 = [v22 descriptor];
  id v9 = [v8 shape];
  id v10 = [v9 objectAtIndexedSubscript:2];
  uint64_t v25 = [v10 unsignedIntegerValue];

  id v11 = [v22 descriptor];
  uint64_t v12 = [v11 batchSizePerSequenceStep];

  if (a2)
  {
    unint64_t v13 = 0;
    uint64_t v26 = v25;
    do
    {
      if (v27)
      {
        uint64_t v14 = 0;
        unint64_t v15 = a3;
        uint64_t v16 = a4;
        do
        {
          id v28 = v15;
          unint64_t v17 = v16;
          for (uint64_t i = v25; i; --i)
          {
            unint64_t v19 = a2;
            if (v12)
            {
              uint64_t v20 = [v12 objectAtIndexedSubscript:v14];
              unint64_t v19 = [v20 unsignedIntegerValue];
            }
            int v21 = 0;
            if (v13 < v19) {
              int v21 = *v15;
            }
            *v17++ = v21;
            ++v15;
          }
          ++v14;
          v16 += v25 * a2;
          unint64_t v15 = &v28[v26];
        }
        while (v14 != v27);
      }
      ++v13;
      a4 = (_DWORD *)((char *)a4 + v26 * 4);
      a3 += v27 * v25;
    }
    while (v13 != a2);
  }
}

void convertTNCtoNC(void *a1, void *a2, uint64_t a3, _DWORD *a4)
{
  id v32 = a1;
  id v7 = a2;
  uint64_t v8 = [v7 descriptor];
  id v9 = [v8 shape];
  id v10 = [v9 objectAtIndexedSubscript:0];
  uint64_t v11 = [v10 unsignedIntegerValue];

  uint64_t v12 = [v32 descriptor];
  unint64_t v13 = [v12 shape];
  uint64_t v14 = [v13 objectAtIndexedSubscript:3];
  uint64_t v15 = [v14 unsignedIntegerValue];

  uint64_t v16 = [v7 descriptor];
  unint64_t v17 = [v16 shape];
  uint64_t v18 = [v17 objectAtIndexedSubscript:1];
  uint64_t v19 = [v18 unsignedIntegerValue];

  uint64_t v20 = [v32 descriptor];
  int v21 = [v20 batchSizePerSequenceStep];

  uint64_t v22 = v15 - 1;
  if (v21)
  {
    uint64_t v23 = [v21 objectAtIndexedSubscript:v15 - 1];
    uint64_t v24 = [v23 unsignedIntegerValue];

    if (!v24) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v24 = v11;
    if (!v11) {
      goto LABEL_9;
    }
  }
  uint64_t v25 = 0;
  uint64_t v26 = 4 * v19;
  uint64_t v27 = (int *)(a3 + 4 * v11 * v19 * v22);
  do
  {
    id v28 = v27;
    uint64_t v29 = a4;
    for (uint64_t i = v19; i; --i)
    {
      int v31 = *v28++;
      *v29++ = v31;
    }
    ++v25;
    a4 = (_DWORD *)((char *)a4 + v26);
    uint64_t v27 = (int *)((char *)v27 + v26);
  }
  while (v25 != v24);
LABEL_9:
}

void convertTNCtoNCHW(void *a1, void *a2, unint64_t a3, _DWORD *a4, _DWORD *a5, int a6)
{
  id v42 = a1;
  id v11 = a2;
  uint64_t v12 = [v42 descriptor];
  unint64_t v13 = [v12 shape];
  uint64_t v14 = [v13 objectAtIndexedSubscript:3];
  uint64_t v15 = [v14 unsignedIntegerValue];

  uint64_t v16 = [v11 descriptor];
  unint64_t v17 = [v16 shape];
  uint64_t v18 = [v17 objectAtIndexedSubscript:1];
  uint64_t v19 = [v18 unsignedIntegerValue];

  uint64_t v20 = [v42 descriptor];
  int v21 = [v20 batchSizePerSequenceStep];

  if (a6)
  {
    if (v15)
    {
      uint64_t v22 = v15;
      for (uint64_t i = 0; i != v22; ++i)
      {
        unint64_t v24 = a3;
        if (v21)
        {
          [v21 objectAtIndexedSubscript:i];
          v25 = uint64_t v43 = a4;
          unint64_t v24 = [v25 unsignedIntegerValue];

          uint64_t v22 = v15;
          a4 = v43;
        }
        if (a3)
        {
          unint64_t v26 = 0;
          uint64_t v27 = a5;
          id v28 = a4;
          do
          {
            if (v26 < v24 && v19)
            {
              uint64_t v29 = v27;
              uint64_t v30 = v28;
              uint64_t v31 = v19;
              do
              {
                int v32 = *v30++;
                _DWORD *v29 = v32;
                v29 += v15;
                --v31;
              }
              while (v31);
            }
            ++v26;
            v28 += v19;
            v27 += v19 * v15;
          }
          while (v26 != a3);
        }
        a4 += v19 * a3;
        ++a5;
      }
    }
  }
  else
  {
    uint64_t v33 = a3;
    if (v21)
    {
      uint64_t v34 = [v21 objectAtIndexedSubscript:v15 - 1];
      uint64_t v33 = [v34 unsignedIntegerValue];
    }
    if (v33)
    {
      uint64_t v35 = 0;
      uint64_t v36 = 4 * v19;
      id v37 = &a4[v19 * a3 * (v15 - 1)];
      do
      {
        unint64_t v38 = v37;
        uint64_t v39 = a5;
        for (uint64_t j = v19; j; --j)
        {
          int v41 = *v38++;
          *v39++ = v41;
        }
        ++v35;
        a5 = (_DWORD *)((char *)a5 + v36);
        id v37 = (int *)((char *)v37 + v36);
      }
      while (v35 != v33);
    }
  }
}

void convertTNCtoNTC(void *a1, void *a2, unint64_t a3, int *a4, _DWORD *a5)
{
  id v33 = a1;
  id v9 = a2;
  id v10 = [v33 descriptor];
  id v11 = [v10 shape];
  uint64_t v12 = [v11 objectAtIndexedSubscript:1];
  uint64_t v13 = [v12 unsignedIntegerValue];

  int v32 = v9;
  uint64_t v14 = [v9 descriptor];
  uint64_t v15 = [v14 shape];
  uint64_t v16 = [v15 objectAtIndexedSubscript:2];
  uint64_t v17 = [v16 unsignedIntegerValue];

  uint64_t v18 = [v33 descriptor];
  uint64_t v19 = [v18 batchSizePerSequenceStep];

  uint64_t v34 = v13;
  if (v13)
  {
    uint64_t v20 = 0;
    uint64_t v21 = 4 * v17;
    uint64_t v22 = 4 * v13 * v17;
    do
    {
      unint64_t v23 = a3;
      if (v19)
      {
        unint64_t v24 = [v19 objectAtIndexedSubscript:v20];
        unint64_t v23 = [v24 unsignedIntegerValue];
      }
      if (a3)
      {
        unint64_t v25 = 0;
        unint64_t v26 = a4;
        uint64_t v27 = a5;
        do
        {
          if (v25 < v23 && v17)
          {
            id v28 = v26;
            uint64_t v29 = v27;
            uint64_t v30 = v17;
            do
            {
              int v31 = *v28++;
              *v29++ = v31;
              --v30;
            }
            while (v30);
          }
          ++v25;
          uint64_t v27 = (_DWORD *)((char *)v27 + v22);
          unint64_t v26 = (int *)((char *)v26 + v21);
        }
        while (v25 != a3);
      }
      ++v20;
      a5 = (_DWORD *)((char *)a5 + v21);
      a4 += v17 * a3;
    }
    while (v20 != v34);
  }
}

void convertHiddenBNNStoMLC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unint64_t a5)
{
  id v22 = a3;
  id v9 = [v22 descriptor];
  id v10 = [v9 shape];
  id v11 = [v10 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 unsignedIntegerValue];

  uint64_t v13 = [v22 descriptor];
  uint64_t v14 = [v13 shape];
  uint64_t v15 = [v14 objectAtIndexedSubscript:2];
  unint64_t v16 = [v15 unsignedIntegerValue];

  if (v12)
  {
    uint64_t v17 = 0;
    if (v16 / a5 <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v16 / a5;
    }
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (v16 >= a5)
        {
          uint64_t v20 = 0;
          uint64_t v21 = v18;
          do
          {
            *(_DWORD *)(a2 + 4 * (v20 + (v19 + v17 * a5) * (v16 / a5))) = *(_DWORD *)(a1
                                                                                    + 4
                                                                                    * (v20
                                                                                     + (v17 + (v19 + (a4 - 1) * a5)
                                                                                            * v12)
                                                                                     * (v16
                                                                                      / a5)));
            ++v20;
            --v21;
          }
          while (v21);
        }
        ++v19;
      }
      while (v19 != a5);
      ++v17;
    }
    while (v17 != v12);
  }
}

uint64_t convertNCtoTNC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  if (result)
  {
    uint64_t v6 = 0;
    uint64_t v7 = a3 * a2;
    while (!a4)
    {
LABEL_20:
      ++v6;
      a6 += a3 * a2 * a4;
      if (v6 == result) {
        return result;
      }
    }
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    id v10 = a6;
    while (!a3)
    {
LABEL_19:
      ++v9;
      v8 += v7;
      v10 += a3 * a2;
      if (v9 == a4) {
        goto LABEL_20;
      }
    }
    uint64_t v11 = 0;
    uint64_t v12 = v10;
    while (!a2)
    {
LABEL_18:
      ++v11;
      v12 += a2;
      if (v11 == a3) {
        goto LABEL_19;
      }
    }
    uint64_t v13 = 0;
    BOOL v14 = result - 1 == v6;
    BOOL v15 = v6 != 0;
    if (v11) {
      BOOL v14 = 0;
    }
    else {
      BOOL v15 = 1;
    }
    unint64_t v16 = v12;
    uint64_t v17 = a2;
    uint64_t v18 = v8;
    while (1)
    {
      if (v15)
      {
        int v19 = 0;
        uint64_t v20 = v18;
        if (!v14) {
          goto LABEL_17;
        }
      }
      else
      {
        uint64_t v20 = v9 * v7 + v11 * a2 + v13;
      }
      int v19 = *(_DWORD *)(a5 + 4 * v20);
LABEL_17:
      *v16++ = v19;
      ++v13;
      ++v18;
      if (!--v17) {
        goto LABEL_18;
      }
    }
  }
  return result;
}

id CPU_GetDeviceMemoryData(void *a1)
{
  id v1 = a1;
  int v2 = [v1 deviceMemory];
  uint64_t v3 = [v1 deviceIndex];

  uint64_t v4 = [v2 objectAtIndexedSubscript:v3];

  return v4;
}

uint64_t adjustBatchSizeForFC(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 descriptor];
  id v5 = [v4 shape];
  uint64_t v6 = [v5 count];

  if (v6 == 4)
  {
    uint64_t v7 = [v3 descriptor];
    uint64_t v8 = [v7 shape];
    uint64_t v9 = [v8 objectAtIndexedSubscript:3];
    if ([v9 unsignedIntegerValue] == 1)
    {
      id v10 = [v3 descriptor];
      uint64_t v11 = [v10 shape];
      uint64_t v12 = [v11 objectAtIndexedSubscript:2];
      uint64_t v13 = [v12 unsignedIntegerValue];

      if (v13 == 1) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v14 = 3;
  }
  else
  {
    uint64_t v14 = v6 - 1;
    if ((unint64_t)(v6 - 1) < 2) {
      goto LABEL_11;
    }
  }
  uint64_t v15 = 1;
  do
  {
    unint64_t v16 = [v3 descriptor];
    uint64_t v17 = [v16 shape];
    uint64_t v18 = [v17 objectAtIndexedSubscript:v15];
    a2 *= [v18 unsignedIntegerValue];

    ++v15;
  }
  while (v14 != v15);
LABEL_11:

  return a2;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

unint64_t *hashCombine(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 4;
  do
  {
    uint64_t v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *uint64_t result = v9;
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

id ANE_CreateUpsampleLayer(int a1, float a2, double a3)
{
  if (a1)
  {
    id v3 = +[MLCLog framework];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ANE_CreateUpsampleLayer_cold_3(v3);
    }
LABEL_18:

    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_19;
  }
  float v4 = *(float *)&a3;
  LODWORD(a3) = vcvtms_s32_f32(a2);
  int8x8_t v6 = vcnt_s8(*(int8x8_t *)&a3);
  v6.i16[0] = vaddlv_u8((uint8x8_t)v6);
  if ((float)(int)floorf(a2) != a2 || v6.i32[0] >= 2u)
  {
    id v3 = +[MLCLog framework];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ANE_CreateUpsampleLayer_cold_2();
    }
    goto LABEL_18;
  }
  v6.i32[0] = vcvtms_s32_f32(v4);
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v6);
  v8.i16[0] = vaddlv_u8(v8);
  if ((float)(int)floorf(v4) != v4 || v8.i32[0] >= 2u)
  {
    id v3 = +[MLCLog framework];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ANE_CreateUpsampleLayer_cold_1();
    }
    goto LABEL_18;
  }
  uint64_t v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v12 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [v12 setObject:@"Conv" forKeyedSubscript:kMLCANENetUnitType[0]];
  [v12 setObject:@"ChannelWiseDeConv" forKeyedSubscript:@"Type"];
  uint64_t v13 = [NSNumber numberWithBool:1];
  [v12 setObject:v13 forKeyedSubscript:@"KernelGroupReuse"];

  [v12 setObject:@"Unity" forKeyedSubscript:@"KernelMode"];
  [v12 setObject:&unk_1F3876528 forKeyedSubscript:@"KernelWidth"];
  [v12 setObject:&unk_1F3876528 forKeyedSubscript:@"KernelHeight"];
  [v12 setObject:&unk_1F3876D80 forKeyedSubscript:@"Step"];
  [v12 setObject:&unk_1F3876540 forKeyedSubscript:@"PadTop"];
  [v12 setObject:&unk_1F3876558 forKeyedSubscript:@"PadBot"];
  [v12 setObject:&unk_1F3876540 forKeyedSubscript:@"PadLeft"];
  [v12 setObject:&unk_1F3876558 forKeyedSubscript:@"PadRight"];
  [v12 setObject:@"Zero" forKeyedSubscript:@"PaddingMode"];
  *(float *)&double v14 = a2;
  *(float *)&double v15 = v4;
  unint64_t v16 = +[_MLCANEUpsampleParameters upsampleUnitParametersWith:v12 scaleFactorX:v14 scaleFactorY:v15];
  uint64_t v17 = +[MLCANEDeviceOps deviceOpsWithType:16 params:v16];
  uint64_t v18 = (void *)v17;
  if (v17) {
    [v11 addObject:v17];
  }

LABEL_19:

  return v11;
}

id ANE_CompileUpsampleLayer(void *a1, void *a2, void *a3)
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint8x8_t v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v9 = [v7 parentLayers];
  uint64_t v10 = [v9 objectAtIndexedSubscript:0];

  uint64_t v11 = [v5 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 params];
  uint64_t v13 = [v6 objectAtIndexedSubscript:0];
  double v14 = [v13 descriptor];
  uint64_t v15 = [v14 dimensionCount];
  if (v15 == 4)
  {
    uint64_t v43 = ANE_CreateUpsampleUnits(v13, v10, v12);
    if (v43)
    {
      uint64_t v44 = (void *)v43;
      uint64_t v66 = v14;
      [v8 addObjectsFromArray:v43];

      goto LABEL_26;
    }
    uint64_t v55 = +[MLCLog framework];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      ANE_CompileUpsampleLayer_cold_4();
    }

    id v53 = 0;
  }
  else
  {
    uint64_t v16 = v15;
    id v67 = v5;
    if (v15 == 3)
    {
      id v63 = v6;
      context = (void *)MEMORY[0x1E01B11E0]();
      id v68 = 0;
      id v69 = 0;
      BOOL v17 = +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:v10 reshapeUnits:&v69 reshapeResultTensors:&v68];
      id v18 = v69;
      id v19 = v68;
      uint64_t v66 = v14;
      char v64 = v19;
      if (v17)
      {
        uint64_t v20 = v19;
        int v59 = v13;
        uint64_t v21 = [v10 label];
        id v22 = objc_msgSend(v21, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v8, "count"));
        unint64_t v23 = [v18 objectAtIndexedSubscript:0];
        [v23 setObject:v22 forKeyedSubscript:@"Name"];

        uint64_t v62 = v18;
        unint64_t v24 = [v18 objectAtIndexedSubscript:0];
        [v8 addObject:v24];

        unint64_t v60 = [v20 objectAtIndexedSubscript:0];
        v61 = v12;
        unint64_t v25 = ANE_CreateUpsampleUnits(v60, v10, v12);
        unint64_t v26 = v25;
        if (v25)
        {
          int v57 = v11;
          id v58 = v7;
          if ([v25 count])
          {
            unint64_t v27 = 0;
            do
            {
              id v28 = [v26 objectAtIndexedSubscript:v27];
              uint64_t v29 = [v10 label];
              uint64_t v30 = objc_msgSend(v29, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v8, "count"));
              [v28 setObject:v30 forKeyedSubscript:@"Name"];

              int v31 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
              int v32 = [v31 objectForKeyedSubscript:@"Name"];
              v71[0] = v32;
              id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
              [v28 setObject:v33 forKeyedSubscript:@"Bottom"];

              [v8 addObject:v28];
              ++v27;
            }
            while (v27 < [v26 count]);
          }
          uint64_t v34 = [v10 label];
          uint64_t v35 = objc_msgSend(v34, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v8, "count"));
          uint64_t v36 = [v62 objectAtIndexedSubscript:1];
          [v36 setObject:v35 forKeyedSubscript:@"Name"];

          id v37 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);
          unint64_t v38 = [v37 objectForKeyedSubscript:@"Name"];
          v70 = v38;
          uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
          uint64_t v40 = [v62 objectAtIndexedSubscript:1];
          [v40 setObject:v39 forKeyedSubscript:@"Bottom"];

          int v41 = [v62 objectAtIndexedSubscript:1];
          [v8 addObject:v41];
          int v42 = 0;
          id v6 = v63;
          uint64_t v11 = v57;
          id v7 = v58;
          uint64_t v13 = v59;
        }
        else
        {
          int v41 = +[MLCLog framework];
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            ANE_CompileUpsampleLayer_cold_2();
          }
          int v42 = 1;
          uint64_t v13 = v59;
          id v6 = v63;
        }

        uint64_t v12 = v61;
        id v18 = v62;
        id v54 = v60;
      }
      else
      {
        id v54 = +[MLCLog framework];
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          ANE_CompileUpsampleLayer_cold_3();
        }
        int v42 = 1;
      }

      id v5 = v67;
      if (v42)
      {
        id v53 = 0;
LABEL_27:
        double v14 = v66;
        goto LABEL_28;
      }
LABEL_26:
      id v53 = (void *)[v8 copy];
      goto LABEL_27;
    }
    uint64_t v45 = v14;
    uint64_t v46 = +[MLCLog framework];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      ANE_CompileUpsampleLayer_cold_1(v16, v46, v47, v48, v49, v50, v51, v52);
    }

    id v53 = 0;
    double v14 = v45;
    id v5 = v67;
  }
LABEL_28:

  return v53;
}

id ANE_CreateUpsampleUnits(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint8x8_t v8 = (void *)MEMORY[0x1E01B11E0]();
  unint64_t v9 = [v7 upsampleParams];
  uint64_t v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [v5 descriptor];
  int v12 = [v11 dataType];

  uint64_t v13 = ANE_GetANECIRDataTypeWithMLCDataType(v12);
  if (v13)
  {
    [v10 setObject:v13 forKeyedSubscript:@"KernelType"];
    double v14 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    [v7 scaleFactorX];
    float v16 = log2f(v15);
    [v7 scaleFactorY];
    float v18 = log2f(v17);
    float v19 = v18;
    if (v16 < v18) {
      float v18 = v16;
    }
    unint64_t v20 = (unint64_t)v18;
    id v53 = v8;
    if ((unint64_t)v18)
    {
      id v57 = 0;
      char v21 = ANE_CreateUpsampleUnitsWithParams(v10, v6, v14, (unint64_t)v18, 1, 1, v5, &v57);
      id v22 = v57;
      id v23 = v22;
      if (v21)
      {
        unint64_t v24 = v22;
        goto LABEL_15;
      }
      uint64_t v40 = +[MLCLog framework];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUpsampleUnits_cold_5();
      }

      id v25 = 0;
    }
    else
    {
      float v26 = fabsf(v19);
      if (fabsf(v16) >= 0.000001 || v26 >= 0.000001)
      {
        unint64_t v24 = 0;
LABEL_15:
        float v28 = v16 - (float)v20;
        float v29 = v19 - (float)v20;
        if (v24) {
          uint64_t v30 = v24;
        }
        else {
          uint64_t v30 = v5;
        }
        id v31 = v30;

        if (v28 != 0.0 || v29 == 0.0)
        {
          if (v28 == 0.0 || v29 != 0.0) {
            goto LABEL_30;
          }
          int v32 = (void *)[v10 mutableCopy];
          uint64_t v52 = v31;
          id v41 = v6;
          [v32 setObject:&unk_1F3876540 forKeyedSubscript:@"KernelHeight"];
          int v42 = [v32 objectForKeyedSubscript:@"Step"];
          uint64_t v43 = (void *)[v42 mutableCopy];

          [v43 setObject:&unk_1F3876540 atIndexedSubscript:1];
          uint64_t v50 = v43;
          uint64_t v44 = [v43 copy];
          [v32 setObject:v44 forKeyedSubscript:@"Step"];

          [v32 setObject:&unk_1F3876558 forKeyedSubscript:@"PadTop"];
          id v54 = v24;
          id v37 = v41;
          uint64_t v45 = v41;
          id v31 = v52;
          LOBYTE(v44) = ANE_CreateUpsampleUnitsWithParams(v32, v45, v14, (unint64_t)v28, 1, 0, v52, &v54);
          id v23 = v54;

          if ((v44 & 1) == 0)
          {
            uint64_t v39 = +[MLCLog framework];
            id v6 = v37;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              ANE_CreateUpsampleUnits_cold_4();
            }
            goto LABEL_40;
          }
        }
        else
        {
          int v32 = (void *)[v10 mutableCopy];
          [v32 setObject:&unk_1F3876540 forKeyedSubscript:@"KernelWidth"];
          [v32 objectForKeyedSubscript:@"Step"];
          uint64_t v51 = v31;
          uint64_t v34 = v33 = v6;
          uint64_t v35 = (void *)[v34 mutableCopy];

          [v35 setObject:&unk_1F3876540 atIndexedSubscript:0];
          uint64_t v50 = v35;
          uint64_t v36 = [v35 copy];
          [v32 setObject:v36 forKeyedSubscript:@"Step"];

          [v32 setObject:&unk_1F3876558 forKeyedSubscript:@"PadLeft"];
          id v55 = v24;
          id v37 = v33;
          unint64_t v38 = v33;
          id v31 = v51;
          LOBYTE(v36) = ANE_CreateUpsampleUnitsWithParams(v32, v38, v14, (unint64_t)v29, 0, 1, v51, &v55);
          id v23 = v55;

          if ((v36 & 1) == 0)
          {
            uint64_t v39 = +[MLCLog framework];
            id v6 = v37;
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
              ANE_CreateUpsampleUnits_cold_3();
            }
LABEL_40:

            id v25 = 0;
            goto LABEL_41;
          }
        }

        unint64_t v24 = v23;
        id v6 = v37;
LABEL_30:
        id v25 = [v14 copy];
        id v23 = v24;
LABEL_41:

        id v5 = v31;
        uint8x8_t v8 = v53;
        goto LABEL_42;
      }
      uint64_t v46 = (void *)[v10 mutableCopy];
      [v46 setObject:&unk_1F3876540 forKeyedSubscript:@"KernelWidth"];
      [v46 setObject:&unk_1F3876540 forKeyedSubscript:@"KernelHeight"];
      [v46 setObject:&unk_1F3876D98 forKeyedSubscript:@"Step"];
      [v46 setObject:&unk_1F3876558 forKeyedSubscript:@"PadLeft"];
      [v46 setObject:&unk_1F3876558 forKeyedSubscript:@"PadTop"];
      id v56 = 0;
      char v47 = ANE_CreateUpsampleUnitsWithParams(v46, v6, v14, 1uLL, 0, 0, v5, &v56);
      id v23 = v56;
      if (v47)
      {
        id v25 = [v14 copy];
      }
      else
      {
        uint64_t v48 = +[MLCLog framework];
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUpsampleUnits_cold_2();
        }

        id v25 = 0;
      }
    }
    id v31 = v5;
    goto LABEL_41;
  }
  double v14 = +[MLCLog framework];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    ANE_CreateUpsampleUnits_cold_1((uint64_t)v5, v12, v14);
  }
  id v25 = 0;
LABEL_42:

  return v25;
}

uint64_t ANE_CreateUpsampleUnitsWithParams(void *a1, void *a2, void *a3, unint64_t a4, char a5, char a6, void *a7, void *a8)
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v56 = a1;
  id v14 = a2;
  id v15 = a3;
  id v67 = 0;
  id v61 = a7;
  ANE_GetTensor4DShapeWithBatchFirst(v61, &v67);
  id v16 = v67;
  float v17 = [v16 objectAtIndexedSubscript:0];
  uint64_t v60 = [v17 unsignedIntegerValue];

  float v18 = [v16 objectAtIndexedSubscript:1];
  uint64_t v62 = [v18 unsignedIntegerValue];

  float v19 = [v16 objectAtIndexedSubscript:2];
  uint64_t v20 = [v19 unsignedIntegerValue];

  id v55 = v16;
  char v21 = v16;
  unint64_t v22 = a4;
  id v23 = [v21 objectAtIndexedSubscript:3];
  uint64_t v24 = [v23 unsignedIntegerValue];

  if (!v22)
  {
LABEL_12:
    uint64_t v44 = [NSNumber numberWithUnsignedInteger:v60];
    v68[0] = v44;
    uint64_t v45 = [NSNumber numberWithUnsignedInteger:v62];
    v68[1] = v45;
    uint64_t v46 = [NSNumber numberWithUnsignedInteger:v20];
    v68[2] = v46;
    char v47 = [NSNumber numberWithUnsignedInteger:v24];
    v68[3] = v47;
    unint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];

    uint64_t v48 = v61;
    uint64_t v49 = [v61 descriptor];
    +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v27, [v49 dataType]);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    char v50 = 1;
    uint64_t v51 = v55;
    goto LABEL_16;
  }
  BOOL v66 = 0;
  uint64_t v25 = 0;
  char v63 = a6;
  char v64 = a5;
  unint64_t v65 = v22 - 1;
  id v58 = v14;
  id v59 = v15;
  unint64_t v57 = v22;
  while (1)
  {
    if (v25)
    {
      float v26 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
      unint64_t v27 = (void *)[v26 mutableCopy];
    }
    else
    {
      unint64_t v27 = +[_MLCANEPlistBuilder createUnitWithLayer:v14 unitParams:v56];
      float v28 = [NSNumber numberWithUnsignedInteger:v62];
      [v27 setObject:v28 forKeyedSubscript:@"OutputChannels"];

      float v26 = [NSNumber numberWithUnsignedInteger:v62];
      [v27 setObject:v26 forKeyedSubscript:@"NumGroups"];
    }

    float v29 = NSString;
    uint64_t v30 = [v14 label];
    id v31 = [v29 stringWithFormat:@"%@_%lu", v30, objc_msgSend(v15, "count")];
    [v27 setObject:v31 forKeyedSubscript:@"Name"];

    if ([v15 count])
    {
      int v32 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
      id v33 = [v32 objectForKeyedSubscript:@"Name"];
      v71[0] = v33;
      uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];
      [v27 setObject:v34 forKeyedSubscript:@"Bottom"];
    }
    if (v65 != v25) {
      goto LABEL_11;
    }
    uint64_t v35 = (void *)MEMORY[0x1E01B11E0]();
    uint64_t v36 = [NSNumber numberWithUnsignedInteger:v60];
    v70[0] = v36;
    id v37 = [NSNumber numberWithUnsignedInteger:v62];
    v70[1] = v37;
    unint64_t v38 = [NSNumber numberWithUnsignedInteger:v20];
    v70[2] = v38;
    uint64_t v39 = [NSNumber numberWithUnsignedInteger:v24];
    v70[3] = v39;
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:4];

    uint64_t v41 = [v61 descriptor];
    int v42 = +[MLCTensor tensorWithShape:dataType:](MLCTensor, "tensorWithShape:dataType:", v40, [(id)v41 dataType]);

    id v69 = v42;
    uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
    LOBYTE(v41) = ANE_ValidateConvolutionUnit(v43, v27, 0);

    if ((v41 & 1) == 0) {
      break;
    }

    id v14 = v58;
    id v15 = v59;
    unint64_t v22 = v57;
LABEL_11:
    [v15 addObject:v27];
    v24 <<= v64;
    v20 <<= v63;

    BOOL v66 = ++v25 >= v22;
    if (v22 == v25) {
      goto LABEL_12;
    }
  }
  uint64_t v52 = +[MLCLog framework];
  id v14 = v58;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
    ANE_CreateUpsampleUnitsWithParams_cold_1();
  }

  id v15 = v59;
  uint64_t v48 = v61;
  uint64_t v51 = v55;
  char v50 = v66;
LABEL_16:

  return v50 & 1;
}

uint64_t missingMPSGraphActivationType(unsigned int a1)
{
  return (a1 < 0x15) & (0x1FFFF4u >> a1);
}

BOOL activationIsFusableWithMPSGraph(void *a1)
{
  id v1 = a1;
  unsigned int v2 = [v1 activationType] - 2;
  BOOL v4 = 0;
  if (v2 >= 0x13 || ((0x7FFFDu >> v2) & 1) == 0)
  {
    [v1 a];
    if (v3 == 0.0 || [v1 activationType] != 1) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

id ANE_CreateSliceLayer(void *a1, void *a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v37 + 1) + 8 * i) unsignedIntegerValue] != 1)
        {
          uint64_t v13 = +[MLCLog framework];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            ANE_CreateSliceLayer_cold_3(v13);
          }
          float v17 = (void *)MEMORY[0x1E4F1CBF0];
          int v12 = v7;
          goto LABEL_34;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  int v12 = (void *)[v5 mutableCopy];
  uint64_t v13 = [v6 mutableCopy];
  id v14 = (void *)[v7 mutableCopy];
  uint64_t v15 = [v5 count];
  switch(v15)
  {
    case 4:
      goto LABEL_20;
    case 3:
      [v12 insertObject:&unk_1F3876570 atIndex:0];
      [v13 insertObject:&unk_1F3876588 atIndex:0];
      [v14 insertObject:&unk_1F3876588 atIndex:0];
LABEL_20:
      id v34 = v5;
      id v35 = v6;
      uint64_t v36 = [MEMORY[0x1E4F1CBF0] mutableCopy];
      if ([v12 count])
      {
        unint64_t v18 = 0;
        while (1)
        {
          float v19 = [v14 objectAtIndexedSubscript:v18];
          unint64_t v20 = [v19 unsignedIntegerValue];

          char v21 = [v13 objectAtIndexedSubscript:v18];
          uint64_t v22 = [v21 unsignedIntegerValue];
          id v23 = [v12 objectAtIndexedSubscript:v18];
          uint64_t v24 = [v23 unsignedIntegerValue];

          uint64_t v25 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
          [v25 setObject:@"InputView" forKeyedSubscript:kMLCANENetUnitType[0]];
          uint64_t v26 = ANE_GetANECIRDimension(v18);
          if (!v26) {
            break;
          }
          unint64_t v27 = (void *)v26;
          uint64_t v28 = (v22 + ~v24) / v20 + 1;
          [v25 setObject:v26 forKeyedSubscript:@"Dimension"];
          float v29 = [v12 objectAtIndexedSubscript:v18];
          [v25 setObject:v29 forKeyedSubscript:@"Offset"];

          uint64_t v30 = [NSNumber numberWithUnsignedInteger:v28];
          [v25 setObject:v30 forKeyedSubscript:@"Size"];

          id v31 = (void *)[v25 copy];
          [v36 addObject:v31];

          if (++v18 >= [v12 count]) {
            goto LABEL_24;
          }
        }
        int v32 = +[MLCLog framework];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          ANE_CreateSliceLayer_cold_2(v32);
        }
        float v17 = (void *)MEMORY[0x1E4F1CBF0];
      }
      else
      {
LABEL_24:
        float v17 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        uint64_t v25 = +[_MLCANESliceParameters sliceUnitParametersWith:v36];
        int v32 = +[MLCANEDeviceOps deviceOpsWithType:33 params:v25];
        if (v32) {
          [v17 addObject:v32];
        }
      }
      id v5 = v34;

      id v6 = v35;
      goto LABEL_33;
    case 2:
      if ([v5 count] != 4)
      {
        unint64_t v16 = 0;
        do
        {
          [v12 insertObject:&unk_1F3876570 atIndex:0];
          [v13 insertObject:&unk_1F3876588 atIndex:0];
          [v14 insertObject:&unk_1F3876588 atIndex:0];
          ++v16;
        }
        while (v16 < 4 - [v5 count]);
      }
      goto LABEL_20;
  }
  uint64_t v36 = +[MLCLog framework];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    ANE_CreateSliceLayer_cold_1(v5, v36);
  }
  float v17 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_33:

LABEL_34:

  return v17;
}

id ANE_CompileSliceLayer(void *a1, void *a2, void *a3)
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 parentLayers];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];

  id v33 = v5;
  id v34 = [v5 objectAtIndexedSubscript:0];
  uint64_t v10 = [v34 params];
  uint64_t v11 = [v10 sliceParams];

  int v12 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v36 = v6;
  uint64_t v13 = [v6 objectAtIndexedSubscript:0];
  id v41 = 0;
  ANE_GetTensor4DShapeWithOnePrepended(v13, &v41);
  id v39 = v41;

  id v40 = 0;
  id v35 = v7;
  ANE_GetTensor4DShapeWithOnePrepended(v7, &v40);
  id v38 = v40;
  if (![v11 count])
  {
    long long v37 = 0;
LABEL_15:
    uint64_t v26 = v37;
    if (![v12 count]) {
      [v12 addObject:v37];
    }
    unint64_t v27 = (void *)[v12 copy];
    float v29 = v33;
    uint64_t v28 = v34;
    uint64_t v30 = v35;
    goto LABEL_23;
  }
  long long v37 = 0;
  uint64_t v14 = 0;
  while (1)
  {
    uint64_t v15 = [v11 objectAtIndexedSubscript:v14];
    unint64_t v16 = [v9 label];
    float v17 = objc_msgSend(v16, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v12, "count"));

    unint64_t v18 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v15];
    [v18 setObject:v17 forKeyedSubscript:@"Name"];
    if ((unint64_t)(v14 - 1) >= 3) {
      break;
    }
    if ([v12 count])
    {
      float v19 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v12, "count") - 1);
      unint64_t v20 = [v19 objectForKeyedSubscript:@"Name"];

      v42[0] = v20;
      char v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
      [v18 setObject:v21 forKeyedSubscript:@"Bottom"];
    }
    if (v14 == 2)
    {
      id v22 = v18;

      long long v37 = v22;
    }
LABEL_9:
    id v23 = [v39 objectAtIndexedSubscript:v14];
    uint64_t v24 = [v38 objectAtIndexedSubscript:v14];
    char v25 = [v23 isEqualToNumber:v24];

    if ((v25 & 1) == 0)
    {
      if ((ANE_ValidateInputViewUnit(v36, v18, 1) & 1) == 0)
      {
        id v31 = +[MLCLog framework];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          ANE_CompileSliceLayer_cold_2((uint64_t)v18, (uint64_t)v9, v31);
        }
        goto LABEL_22;
      }
      [v12 addObject:v18];
    }

    if (++v14 >= (unint64_t)[v11 count]) {
      goto LABEL_15;
    }
  }
  if (!v14) {
    goto LABEL_9;
  }
  id v31 = +[MLCLog framework];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    ANE_CompileSliceLayer_cold_1();
  }
LABEL_22:
  float v29 = v33;

  unint64_t v27 = 0;
  uint64_t v28 = v34;
  uint64_t v30 = v35;
  uint64_t v26 = v37;
LABEL_23:

  return v27;
}

id ANE_CreateComparisonLayer(int a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  unsigned int v2 = (void *)MEMORY[0x1E4F1CBF0];
  float v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  BOOL v4 = (void *)[v2 mutableCopy];
  uint64_t v14 = kMLCANENetUnitType[0];
  v15[0] = @"ElementWise";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v6 = (void *)[v5 mutableCopy];

  switch(a1)
  {
    case 0:
      id v7 = @"Equal";
      goto LABEL_14;
    case 1:
    case 11:
      id v7 = @"NotEqual";
      goto LABEL_14;
    case 2:
      id v7 = @"LessThan";
      goto LABEL_14;
    case 3:
      id v7 = @"GreaterThan";
      goto LABEL_14;
    case 4:
      id v7 = @"LessThanEqual";
      goto LABEL_14;
    case 5:
      id v7 = @"GreaterThanEqual";
      goto LABEL_14;
    case 6:
      id v7 = @"Mult";
      goto LABEL_14;
    case 7:
      id v7 = @"Add";
      goto LABEL_14;
    case 8:
      id v7 = @"EqualZero";
LABEL_14:
      [v6 setObject:v7 forKeyedSubscript:@"Type"];
      goto LABEL_15;
    case 9:
      int v12 = @"Mult";
      goto LABEL_23;
    case 10:
      int v12 = @"Add";
LABEL_23:
      [v6 setObject:v12 forKeyedSubscript:@"Type"];
      [v4 addObject:v6];
      uint64_t v13 = (void *)[v6 mutableCopy];

      [v13 setObject:@"EqualZero" forKeyedSubscript:@"Type"];
      id v6 = v13;
LABEL_15:
      [v4 addObject:v6];
      uint64_t v8 = +[_MLCANEArithmeticParameters arithmeticUnitParametersWith:v4];
      uint64_t v10 = +[MLCANEDeviceOps deviceOpsWithType:34 params:v8];
      if (v10) {
        [v3 addObject:v10];
      }
      uint64_t v9 = (void *)[v3 copy];

      break;
    default:
      uint64_t v8 = +[MLCLog framework];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        ANE_CreateComparisonLayer_cold_1();
      }
      uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }

  return v9;
}

id ANE_CompileComparisonLayer(void *a1, void *a2, void *a3)
{
  v88[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v7 parentLayers];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];

  uint64_t v10 = [v5 objectAtIndexedSubscript:0];
  uint64_t v11 = [v10 params];
  int v12 = [v11 arithmeticParams];

  uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unsigned int v15 = [v9 operation];
  __int16 v85 = 0;
  v80 = (void *)[v13 mutableCopy];
  if ([v6 count] != 2)
  {
LABEL_10:
    if (v15 > 0xB)
    {
      uint64_t v36 = +[MLCLog framework];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        ANE_CompileComparisonLayer_cold_1();
      }
    }
    else if (((1 << v15) & 0x8FF) != 0)
    {
      if ([v12 count] == 1)
      {
        [v12 objectAtIndexedSubscript:0];
        v33 = int v32 = v14;
        id v34 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v33];

        uint64_t v14 = v32;
        if (ANE_ConnectBroadcastUnits(v34, v32, v9, &v85, v80))
        {
LABEL_14:

          id v35 = (void *)[v14 copy];
          goto LABEL_34;
        }
        char v47 = +[MLCLog framework];
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
LABEL_24:
        ANE_CompileComparisonLayer_cold_2(v47, v48, v49, v50, v51, v52, v53, v54);
LABEL_25:

        goto LABEL_26;
      }
      uint64_t v36 = +[MLCLog framework];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        ANE_CompileComparisonLayer_cold_3();
      }
    }
    else if (((1 << v15) & 0x600) != 0)
    {
      if ([v12 count] == 2)
      {
        [v12 objectAtIndexedSubscript:0];
        long long v37 = v74 = v14;
        id v34 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v37];

        uint64_t v14 = v74;
        if (ANE_ConnectBroadcastUnits(v34, v74, v9, &v85, v80))
        {
          id v38 = [v12 objectAtIndexedSubscript:1];
          id v39 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v38];

          id v40 = [v9 label];
          id v41 = objc_msgSend(v40, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v74, "count"));
          [v39 setObject:v41 forKeyedSubscript:@"Name"];

          uint64_t v42 = [v34 objectForKeyedSubscript:@"Name"];
          v88[0] = v42;
          uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:1];
          [v39 setObject:v43 forKeyedSubscript:@"Bottom"];

          uint64_t v44 = [v34 objectForKeyedSubscript:@"OutputType"];
          int v87 = v44;
          uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
          [v39 setObject:v45 forKeyedSubscript:@"InputType"];

          id v86 = v7;
          uint64_t v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
          LOBYTE(v45) = ANE_ValidateElementWiseUnit(v46, v39, 1);

          if ((v45 & 1) == 0)
          {
            id v73 = +[MLCLog framework];
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
              ANE_CompileComparisonLayer_cold_4();
            }

            id v35 = 0;
            goto LABEL_33;
          }
          uint64_t v14 = v74;
          [v74 addObject:v39];

          goto LABEL_14;
        }
        char v47 = +[MLCLog framework];
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      uint64_t v36 = +[MLCLog framework];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        ANE_CompileComparisonLayer_cold_8();
      }
    }
    else
    {
      if ([v12 count] == 1)
      {
        char v64 = v14;
        unint64_t v65 = [v12 objectAtIndexedSubscript:0];
        id v34 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v65];

        if (ANE_ValidateElementWiseUnit(v6, v34, 1))
        {
          uint64_t v14 = v64;
          [v64 addObject:v34];
          goto LABEL_14;
        }
        char v47 = +[MLCLog framework];
        uint64_t v14 = v64;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          ANE_CompileComparisonLayer_cold_4();
        }
        goto LABEL_25;
      }
      uint64_t v36 = +[MLCLog framework];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        ANE_CompileComparisonLayer_cold_5(v36, v66, v67, v68, v69, v70, v71, v72);
      }
    }

LABEL_26:
    id v35 = 0;
    goto LABEL_34;
  }
  unsigned int v75 = v15;
  id v78 = v7;
  v79 = v12;
  id v76 = v5;
  v77 = v10;
  id v84 = 0;
  ANE_GetTensor4DShapeWithOnePrepended(v7, &v84);
  id v16 = v84;
  if (![v6 count])
  {
LABEL_9:

    id v5 = v76;
    uint64_t v10 = v77;
    id v7 = v78;
    int v12 = v79;
    unsigned int v15 = v75;
    goto LABEL_10;
  }
  uint64_t v17 = 0;
  unint64_t v18 = 0x1E6CB4000uLL;
  while (1)
  {
    float v19 = [v6 objectAtIndexedSubscript:v17];
    unint64_t v20 = *(void **)(v18 + 2184);
    id v82 = 0;
    id v83 = 0;
    int v21 = [v20 createBroadcastUnitWithSourceTensor:v19 targetShape:v16 layer:v9 broadcastUnit:&v83 broadcastResultTensor:&v82];
    id v22 = v83;
    id v23 = v82;
    if (v21 == 1) {
      goto LABEL_8;
    }
    if (v21 != 2) {
      break;
    }
    if (!v22)
    {
      v74 = v14;
      id v55 = +[MLCLog framework];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        ANE_CompileComparisonLayer_cold_10(v55, v56, v57, v58, v59, v60, v61, v62);
      }
      id v22 = 0;
      goto LABEL_32;
    }
    *((unsigned char *)&v85 + v17) = 1;
    uint64_t v24 = [v9 label];
    objc_msgSend(v24, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v14, "count"));
    id v81 = v23;
    char v25 = v19;
    id v26 = v16;
    unint64_t v27 = v18;
    id v28 = v6;
    float v29 = v9;
    v31 = uint64_t v30 = v14;
    [v22 setObject:v31 forKeyedSubscript:@"Name"];

    uint64_t v14 = v30;
    uint64_t v9 = v29;
    id v6 = v28;
    unint64_t v18 = v27;
    id v16 = v26;
    float v19 = v25;
    id v23 = v81;

    [v14 addObject:v22];
    [v80 addObject:v81];
LABEL_8:

    if (++v17 >= (unint64_t)[v6 count]) {
      goto LABEL_9;
    }
  }
  v74 = v14;
  id v55 = +[MLCLog framework];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
    ANE_CompileComparisonLayer_cold_9();
  }
LABEL_32:
  id v5 = v76;
  int v12 = v79;

  id v35 = 0;
  uint64_t v10 = v77;
  id v7 = v78;
LABEL_33:
  uint64_t v14 = v74;
LABEL_34:

  return v35;
}

uint64_t ANE_ConnectBroadcastUnits(void *a1, void *a2, void *a3, unsigned char *a4, void *a5)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a5;
  uint64_t v13 = [v11 sourceTensors];
  uint64_t v14 = [v9 objectForKeyedSubscript:@"Bottom"];
  int v15 = a4[1];
  if (!*a4)
  {
    if (!a4[1])
    {
      id v22 = v13;
      goto LABEL_9;
    }
    id v23 = [v11 label];
    uint64_t v24 = objc_msgSend(v23, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v10, "count"));
    [v9 setObject:v24 forKeyedSubscript:@"Name"];

    char v25 = [v13 objectAtIndexedSubscript:0];
    id v26 = [v25 label];
    [v14 setObject:v26 atIndexedSubscript:0];

    unint64_t v27 = [v10 objectAtIndexedSubscript:0];
    id v28 = [v27 objectForKeyedSubscript:@"Name"];
    [v14 setObject:v28 atIndexedSubscript:1];

    float v29 = [v13 objectAtIndexedSubscript:0];
    v39[0] = v29;
    uint64_t v30 = [v12 objectAtIndexedSubscript:0];
    v39[1] = v30;
    id v31 = (void *)MEMORY[0x1E4F1C978];
    int v32 = v39;
LABEL_7:
    id v35 = [v31 arrayWithObjects:v32 count:2];

    goto LABEL_10;
  }
  id v16 = [v11 label];
  uint64_t v17 = objc_msgSend(v16, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v10, "count"));
  [v9 setObject:v17 forKeyedSubscript:@"Name"];

  unint64_t v18 = [v10 objectAtIndexedSubscript:0];
  float v19 = [v18 objectForKeyedSubscript:@"Name"];
  [v14 setObject:v19 atIndexedSubscript:0];

  if (!v15)
  {
    id v33 = [v13 objectAtIndexedSubscript:1];
    id v34 = [v33 label];
    [v14 setObject:v34 atIndexedSubscript:1];

    float v29 = [v12 objectAtIndexedSubscript:0];
    v40[0] = v29;
    uint64_t v30 = [v13 objectAtIndexedSubscript:1];
    v40[1] = v30;
    id v31 = (void *)MEMORY[0x1E4F1C978];
    int v32 = v40;
    goto LABEL_7;
  }
  unint64_t v20 = [v10 objectAtIndexedSubscript:1];
  int v21 = [v20 objectForKeyedSubscript:@"Name"];
  [v14 setObject:v21 atIndexedSubscript:1];

  id v22 = v12;
LABEL_9:
  id v35 = v22;
LABEL_10:
  uint64_t v36 = ANE_ValidateElementWiseUnit(v35, v9, 1);
  if (v36)
  {
    [v10 addObject:v9];
  }
  else
  {
    long long v37 = +[MLCLog framework];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      ANE_ConnectBroadcastUnits_cold_1();
    }
  }
  return v36;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id ANE_CreateReshapeLayer()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[MLCANEDeviceOps deviceOpsWithType:18 params:MEMORY[0x1E4F1CC08]];
  v3[0] = v0;
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v1;
}

id ANE_CompileReshapeLayer(uint64_t a1, void *a2, void *a3)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = [v5 parentLayers];
  id v7 = [v6 objectAtIndexedSubscript:0];

  uint64_t v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [v8 setObject:@"Reshape" forKeyedSubscript:kMLCANENetUnitType[0]];
  uint64_t v9 = [v5 descriptor];
  id v10 = [v9 shape];

  switch([v10 count])
  {
    case 1:
      [v8 setObject:&unk_1F38765A0 forKeyedSubscript:@"ReshapedBatch"];
      [v8 setObject:&unk_1F38765A0 forKeyedSubscript:@"ReshapedChannel"];
      [v8 setObject:&unk_1F38765A0 forKeyedSubscript:@"ReshapedHeight"];
      uint64_t v11 = 0;
      goto LABEL_8;
    case 2:
      [v8 setObject:&unk_1F38765A0 forKeyedSubscript:@"ReshapedBatch"];
      [v8 setObject:&unk_1F38765A0 forKeyedSubscript:@"ReshapedChannel"];
      uint64_t v13 = [v10 objectAtIndexedSubscript:0];
      [v8 setObject:v13 forKeyedSubscript:@"ReshapedHeight"];

      uint64_t v11 = 1;
      goto LABEL_8;
    case 3:
      [v8 setObject:&unk_1F38765A0 forKeyedSubscript:@"ReshapedBatch"];
      uint64_t v14 = [v10 objectAtIndexedSubscript:0];
      [v8 setObject:v14 forKeyedSubscript:@"ReshapedChannel"];

      int v15 = [v10 objectAtIndexedSubscript:1];
      [v8 setObject:v15 forKeyedSubscript:@"ReshapedHeight"];

      uint64_t v11 = 2;
      goto LABEL_8;
    case 4:
      id v16 = [v10 objectAtIndexedSubscript:0];
      [v8 setObject:v16 forKeyedSubscript:@"ReshapedBatch"];

      uint64_t v17 = [v10 objectAtIndexedSubscript:1];
      [v8 setObject:v17 forKeyedSubscript:@"ReshapedChannel"];

      unint64_t v18 = [v10 objectAtIndexedSubscript:2];
      [v8 setObject:v18 forKeyedSubscript:@"ReshapedHeight"];

      uint64_t v11 = 3;
LABEL_8:
      float v19 = [v10 objectAtIndexedSubscript:v11];
      [v8 setObject:v19 forKeyedSubscript:@"ReshapedWidth"];

      id v12 = +[_MLCANEPlistBuilder createUnitWithLayer:v7 unitParams:v8];
      if (ANE_ValidateReshapeUnit(v4, v12, 1))
      {
        v23[0] = v12;
        unint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      }
      else
      {
        int v21 = +[MLCLog framework];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          ANE_CompileReshapeLayer_cold_2();
        }

LABEL_13:
        unint64_t v20 = 0;
      }

      return v20;
    default:
      id v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        ANE_CompileReshapeLayer_cold_1();
      }
      goto LABEL_13;
  }
}

id GPU_CreateOptimizerDeviceDataForTensor(void *a1, void *a2, void *a3)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v42 = a2;
  id v47 = a3;
  id v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v7 = [v5 deviceList];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0x1E4F1C000uLL;
    uint64_t v43 = v6;
    uint64_t v44 = v5;
    while (1)
    {
      uint64_t v11 = [v5 deviceList];
      uint64_t v45 = v9;
      id v12 = [v11 objectAtIndexedSubscript:v9];

      uint64_t v46 = +[MLCTensorOptimizerDeviceData optimizerDeviceData];
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      uint64_t v14 = v47;
      if ([v47 count])
      {
        unint64_t v15 = 0;
        do
        {
          id v16 = *(void **)(v10 + 2488);
          uint64_t v17 = [v14 objectAtIndexedSubscript:v15];
          uint64_t v18 = [v17 bytes];
          float v19 = [v47 objectAtIndexedSubscript:v15];
          unint64_t v20 = objc_msgSend(v16, "dataWithBytesNoCopy:length:freeWhenDone:", v18, objc_msgSend(v19, "length"), 0);

          unint64_t v21 = [v20 length];
          id v22 = v20;
          id v23 = objc_msgSend(v12, "newBufferWithBytes:length:options:", objc_msgSend(v22, "bytes"), v21, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
          uint64_t v24 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:1 columns:v21 >> 2 rowBytes:v21 dataType:268435488];
          char v25 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v23 descriptor:v24];
          [v13 setObject:v25 atIndexedSubscript:v15];

          uint64_t v14 = v47;
          unint64_t v10 = 0x1E4F1C000;

          ++v15;
        }
        while (v15 < [v47 count]);
      }
      if (![v13 count]) {
        break;
      }
      id v26 = [v13 objectAtIndexedSubscript:0];
      v51[0] = v26;
      unint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
      [v46 setMomentumVectors:v27];

      if ((unint64_t)[v13 count] >= 2)
      {
        id v28 = [v13 objectAtIndexedSubscript:1];
        uint64_t v50 = v28;
        float v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
        [v46 setVelocityVectors:v29];

        if ((unint64_t)[v13 count] >= 3)
        {
          uint64_t v30 = [v13 objectAtIndexedSubscript:2];
          uint64_t v49 = v30;
          id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
          [v46 setCenterWeightVectors:v31];
        }
      }
      int v32 = +[MLCGPUDeviceOps deviceOps];
      id v5 = v44;
      if (v32)
      {
        id v33 = [v44 deviceList];
        unint64_t v34 = [v33 count];

        if (v34 >= 2)
        {
          id v35 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v32];

          id v48 = v42;
          uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
          GPU_AllocateResourceForMultiGPUTraining(v44, v35, v36, v45);

          int v32 = v35;
        }
      }
      id v6 = v43;
      [v46 setGpuOps:v32];
      [v43 addObject:v46];

      uint64_t v9 = v45 + 1;
      long long v37 = [v44 deviceList];
      unint64_t v38 = [v37 count];

      unint64_t v10 = 0x1E4F1C000;
      if (v45 + 1 >= v38) {
        goto LABEL_14;
      }
    }
    id v40 = +[MLCLog framework];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      GPU_CreateOptimizerDeviceDataForTensor_cold_1(v40);
    }

    id v39 = (void *)MEMORY[0x1E4F1CBF0];
    id v6 = v43;
    id v5 = v44;
  }
  else
  {
LABEL_14:
    id v39 = (void *)[v6 copy];
  }

  return v39;
}

id GPU_CreateOptimizerDeviceVectorDataForTensor(void *a1, uint64_t a2, void *a3)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = a3;
  id v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v7 = [v4 deviceList];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = 0;
    id v33 = v6;
    unint64_t v34 = v4;
    while (1)
    {
      unint64_t v10 = [v4 deviceList];
      uint64_t v35 = v9;
      uint64_t v11 = [v10 objectAtIndexedSubscript:v9];

      id v12 = +[MLCTensorOptimizerDeviceData optimizerDeviceData];
      uint64_t v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      if ([v5 count])
      {
        unint64_t v14 = 0;
        do
        {
          unint64_t v15 = (void *)MEMORY[0x1E4F1C9B8];
          id v16 = [v5 objectAtIndexedSubscript:v14];
          uint64_t v17 = [v16 bytes];
          uint64_t v18 = [v5 objectAtIndexedSubscript:v14];
          float v19 = objc_msgSend(v15, "dataWithBytesNoCopy:length:freeWhenDone:", v17, objc_msgSend(v18, "length"), 0);

          unint64_t v20 = GPU_AllocateMemoryForMomentum(v11, v19, 268435488);
          [v13 setObject:v20 atIndexedSubscript:v14];

          ++v14;
        }
        while (v14 < [v5 count]);
      }
      if (![v13 count]) {
        break;
      }
      unint64_t v21 = [v13 objectAtIndexedSubscript:0];
      v38[0] = v21;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
      [v12 setMomentumVectors:v22];

      id v6 = v33;
      if ((unint64_t)[v13 count] >= 2)
      {
        id v23 = [v13 objectAtIndexedSubscript:1];
        long long v37 = v23;
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        [v12 setVelocityVectors:v24];

        if ((unint64_t)[v13 count] >= 3)
        {
          char v25 = [v13 objectAtIndexedSubscript:2];
          uint64_t v36 = v25;
          id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
          [v12 setCenterWeightVectors:v26];
        }
      }
      unint64_t v27 = +[MLCGPUDeviceOps deviceOps];
      [v12 setGpuOps:v27];
      [v33 addObject:v12];

      id v4 = v34;
      uint64_t v9 = v35 + 1;
      id v28 = [v34 deviceList];
      unint64_t v29 = [v28 count];

      if (v35 + 1 >= v29) {
        goto LABEL_11;
      }
    }
    id v31 = +[MLCLog framework];
    id v6 = v33;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      GPU_CreateOptimizerDeviceVectorDataForTensor_cold_1(v31);
    }

    uint64_t v30 = (void *)MEMORY[0x1E4F1CBF0];
    id v4 = v34;
  }
  else
  {
LABEL_11:
    uint64_t v30 = (void *)[v6 copy];
  }

  return v30;
}

id ANE_BuildArithmeticParams(int a1)
{
  unsigned int v2 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  switch(a1)
  {
    case 0:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Add";
      goto LABEL_20;
    case 1:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Sub";
      goto LABEL_20;
    case 2:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Mult";
      goto LABEL_20;
    case 3:
      id v5 = (void *)MEMORY[0x1E4F1CC08];
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      [v3 setObject:@"Inv" forKeyedSubscript:@"Type"];
      id v6 = (void *)[v5 mutableCopy];
      [v6 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v7 = @"Mult";
      uint64_t v8 = v6;
      goto LABEL_13;
    case 7:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Sqrt";
      goto LABEL_20;
    case 8:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Rsqrt";
      goto LABEL_20;
    case 17:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Tanh";
      goto LABEL_20;
    case 22:
      uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
      int v19 = 1069066811;
      __int16 v18 = 0;
      ANE_ConvertFp32ToInt16((uint64_t)&v19, &v18);
      id v12 = [NSNumber numberWithShort:v18];
      [v3 setObject:v12 forKeyedSubscript:@"ScaleScalar"];

      id v6 = (void *)[v11 mutableCopy];
      [v6 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v7 = @"Exp2";
      uint64_t v8 = v6;
LABEL_13:
      [v8 setObject:v7 forKeyedSubscript:@"Type"];
      goto LABEL_16;
    case 23:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Exp2";
      goto LABEL_20;
    case 24:
      uint64_t v13 = (void *)MEMORY[0x1E4F1CC08];
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      [v3 setObject:@"Log2" forKeyedSubscript:@"Type"];
      id v6 = (void *)[v13 mutableCopy];
      [v6 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
      int v17 = 1060205080;
      __int16 v16 = 0;
      ANE_ConvertFp32ToInt16((uint64_t)&v17, &v16);
      unint64_t v14 = [NSNumber numberWithShort:v16];
      [v6 setObject:v14 forKeyedSubscript:@"ScaleScalar"];

LABEL_16:
      [v2 addObject:v3];
      [v2 addObject:v6];

      goto LABEL_21;
    case 25:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Log2";
      goto LABEL_20;
    case 28:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Min";
      goto LABEL_20;
    case 29:
      float v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      [v3 setObject:@"ElementWise" forKeyedSubscript:kMLCANENetUnitType[0]];
      id v4 = @"Max";
LABEL_20:
      [v3 setObject:v4 forKeyedSubscript:@"Type"];
      [v2 addObject:v3];
LABEL_21:

      unint64_t v10 = (void *)[v2 copy];
      break;
    default:
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_BuildArithmeticParams_cold_1();
      }

      unint64_t v10 = 0;
      break;
  }

  return v10;
}

id ANE_CreateArithmeticLayer(int a1)
{
  unsigned int v2 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  float v3 = ANE_BuildArithmeticParams(a1);
  if (v3)
  {
    id v4 = +[_MLCANEArithmeticParameters arithmeticUnitParametersWith:v3];
    id v5 = +[MLCANEDeviceOps deviceOpsWithType:1 params:v4];
    if (v5) {
      [v2 addObject:v5];
    }
    id v6 = v2;
  }
  else
  {
    id v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ANE_CreateArithmeticLayer_cold_1();
    }

    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

id ANE_CreateUnitsWithArithmeticOpeartion(int a1, void *a2, void *a3)
{
  v216[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v9 = [v5 sourceTensors];
  unint64_t v10 = [v5 resultTensors];
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];

  __int16 v185 = 0;
  v180 = (void *)[v7 mutableCopy];
  v179 = v9;
  if ([v9 count] != 2)
  {
LABEL_10:
    if (a1 <= 21)
    {
      if (a1 >= 3)
      {
        if (a1 == 3)
        {
          if ([v6 count] == 2)
          {
            v174 = v11;
            unint64_t v21 = [v6 objectAtIndexedSubscript:0];
            id v22 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v21];

            id v23 = [v5 label];
            uint64_t v24 = objc_msgSend(v23, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v8, "count"));
            [v22 setObject:v24 forKeyedSubscript:@"Name"];

            char v25 = [v6 objectAtIndexedSubscript:1];
            id v26 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v25];

            id v172 = v5;
            unint64_t v27 = [v5 label];
            id v28 = objc_msgSend(v27, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v8, "count") + 1);
            [v26 setObject:v28 forKeyedSubscript:@"Name"];

            uint64_t v181 = 0;
            unint64_t v29 = [v179 objectAtIndexedSubscript:1];
            ANE_GetTensorFeatureChannelsWithOnePrepended(v29, &v181);

            id v176 = v6;
            v178 = v8;
            if ((_BYTE)v185 && HIBYTE(v185))
            {
              uint64_t v30 = [v8 objectAtIndexedSubscript:0];
              id v31 = v8;
              int v32 = (void *)v30;
              id v33 = [v31 objectAtIndexedSubscript:1];
              unint64_t v34 = [v22 objectForKeyedSubscript:@"InputType"];
              uint64_t v35 = [v34 objectAtIndexedSubscript:1];
              v214 = v35;
              uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v214 count:1];
              [v22 setObject:v36 forKeyedSubscript:@"InputType"];

              long long v37 = [v179 objectAtIndexedSubscript:1];
              unint64_t v38 = [v37 label];
              v213 = v38;
              id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v213 count:1];
              [v22 setObject:v39 forKeyedSubscript:@"Bottom"];

              id v40 = [NSNumber numberWithUnsignedInteger:v181];
              [v22 setObject:v40 forKeyedSubscript:@"OutputChannels"];

              id v41 = [v179 objectAtIndexedSubscript:1];
              v212 = v41;
              uint64_t v170 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v212 count:1];

              id v42 = [v22 objectForKeyedSubscript:@"OutputType"];
              v211 = v42;
              uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v211 count:1];
              [v33 setObject:v43 forKeyedSubscript:@"InputType"];

              uint64_t v44 = [v22 objectForKeyedSubscript:@"Name"];
              v210 = v44;
              uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v210 count:1];
              [v33 setObject:v45 forKeyedSubscript:@"Bottom"];

              uint64_t v46 = [v32 objectForKeyedSubscript:@"OutputType"];
              v209[0] = v46;
              id v47 = [v33 objectForKeyedSubscript:@"OutputType"];
              v209[1] = v47;
              id v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v209 count:2];
              [v26 setObject:v48 forKeyedSubscript:@"InputType"];

              uint64_t v49 = [v32 objectForKeyedSubscript:@"Name"];
              v208[0] = v49;
              uint64_t v50 = [v33 objectForKeyedSubscript:@"Name"];
              v208[1] = v50;
              uint64_t v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v208 count:2];
              [v26 setObject:v51 forKeyedSubscript:@"Bottom"];

              uint64_t v9 = v179;
              id v52 = v180;
            }
            else
            {
              v108 = v26;
              if ((_BYTE)v185)
              {
                double v109 = [v8 objectAtIndexedSubscript:0];
                v110 = [v22 objectForKeyedSubscript:@"InputType"];
                int v111 = [v110 objectAtIndexedSubscript:1];
                v207 = v111;
                int v112 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v207 count:1];
                [v22 setObject:v112 forKeyedSubscript:@"InputType"];

                v113 = [v179 objectAtIndexedSubscript:1];
                double v114 = [v113 label];
                v206 = v114;
                v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v206 count:1];
                [v22 setObject:v115 forKeyedSubscript:@"Bottom"];

                int v116 = [v179 objectAtIndexedSubscript:1];
                v205 = v116;
                uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v205 count:1];

                int v117 = [v109 objectForKeyedSubscript:@"OutputType"];
                v204[0] = v117;
                v118 = [v22 objectForKeyedSubscript:@"OutputType"];
                v204[1] = v118;
                double v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:v204 count:2];
                [v26 setObject:v119 forKeyedSubscript:@"InputType"];

                v120 = [v109 objectForKeyedSubscript:@"Name"];
                v203[0] = v120;
                uint64_t v121 = [v22 objectForKeyedSubscript:@"Name"];
                v203[1] = v121;
                v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:v203 count:2];
                [v26 setObject:v122 forKeyedSubscript:@"Bottom"];

                uint64_t v9 = v179;
                v123 = [v180 objectAtIndexedSubscript:0];
                v202[0] = v123;
                v124 = [v179 objectAtIndexedSubscript:1];
                v202[1] = v124;
                id v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v202 count:2];

                goto LABEL_71;
              }
              if (!HIBYTE(v185))
              {
                v154 = [v22 objectForKeyedSubscript:@"InputType"];
                v155 = [v154 objectAtIndexedSubscript:1];
                v193 = v155;
                v156 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1];
                [v22 setObject:v156 forKeyedSubscript:@"InputType"];

                v157 = [v179 objectAtIndexedSubscript:1];
                v158 = [v157 label];
                v192 = v158;
                v159 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v192 count:1];
                [v22 setObject:v159 forKeyedSubscript:@"Bottom"];

                v160 = [v179 objectAtIndexedSubscript:1];
                v191 = v160;
                uint64_t v161 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v191 count:1];

                v162 = [v26 objectForKeyedSubscript:@"InputType"];
                v163 = [v162 objectAtIndexedSubscript:0];
                v190[0] = v163;
                v164 = [v22 objectForKeyedSubscript:@"OutputType"];
                v190[1] = v164;
                v165 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:2];
                [v26 setObject:v165 forKeyedSubscript:@"InputType"];

                v166 = [v179 objectAtIndexedSubscript:0];
                v167 = [v166 label];
                v189[0] = v167;
                v168 = [v22 objectForKeyedSubscript:@"Name"];
                v189[1] = v168;
                v169 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:2];
                [v26 setObject:v169 forKeyedSubscript:@"Bottom"];

                uint64_t v9 = v179;
                uint64_t v53 = (void *)v161;

                id v52 = v179;
                goto LABEL_71;
              }
              int v32 = [v8 objectAtIndexedSubscript:0];
              int v132 = [v22 objectForKeyedSubscript:@"InputType"];
              int v133 = [v132 objectAtIndexedSubscript:1];
              v201 = v133;
              int v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v201 count:1];
              [v22 setObject:v134 forKeyedSubscript:@"InputType"];

              int v135 = [v179 objectAtIndexedSubscript:1];
              int v136 = [v135 label];
              v200 = v136;
              int v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v200 count:1];
              [v22 setObject:v137 forKeyedSubscript:@"Bottom"];

              int v138 = [NSNumber numberWithUnsignedInteger:v181];
              [v22 setObject:v138 forKeyedSubscript:@"OutputChannels"];

              int v139 = [v179 objectAtIndexedSubscript:1];
              v199 = v139;
              uint64_t v170 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v199 count:1];

              int v140 = [v22 objectForKeyedSubscript:@"OutputType"];
              v198 = v140;
              id v141 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v198 count:1];
              [v32 setObject:v141 forKeyedSubscript:@"InputType"];

              v142 = [v22 objectForKeyedSubscript:@"Name"];
              v197 = v142;
              v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v197 count:1];
              [v32 setObject:v143 forKeyedSubscript:@"Bottom"];

              v144 = [v26 objectForKeyedSubscript:@"InputType"];
              v145 = [v144 objectAtIndexedSubscript:0];
              v196[0] = v145;
              v146 = [v32 objectForKeyedSubscript:@"OutputType"];
              v196[1] = v146;
              v147 = [MEMORY[0x1E4F1C978] arrayWithObjects:v196 count:2];
              [v108 setObject:v147 forKeyedSubscript:@"InputType"];

              id v26 = v108;
              v148 = [v179 objectAtIndexedSubscript:0];
              v149 = [v148 label];
              v195[0] = v149;
              v150 = [v32 objectForKeyedSubscript:@"Name"];
              v195[1] = v150;
              v151 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:2];
              [v108 setObject:v151 forKeyedSubscript:@"Bottom"];

              uint64_t v9 = v179;
              v152 = [v179 objectAtIndexedSubscript:0];
              v194[0] = v152;
              v153 = [v180 objectAtIndexedSubscript:0];
              v194[1] = v153;
              id v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:2];
            }
            uint64_t v53 = (void *)v170;
LABEL_71:
            id v5 = v172;
            v125 = v53;
            if (ANE_ValidateNeuronUnit(v53, v22, 1))
            {
              uint64_t v8 = v178;
              [v178 addObject:v22];
              id v6 = v176;
              if (ANE_ValidateElementWiseUnit(v52, v26, 1))
              {
                [v178 addObject:v26];

                uint64_t v11 = v174;
                goto LABEL_65;
              }
              v130 = +[MLCLog framework];
              uint64_t v11 = v174;
              if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
                ANE_CreateUnitsWithArithmeticOpeartion_cold_4();
              }
            }
            else
            {
              v130 = +[MLCLog framework];
              id v6 = v176;
              uint64_t v8 = v178;
              if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
                ANE_CreateUnitsWithArithmeticOpeartion_cold_7();
              }
              uint64_t v11 = v174;
            }

            goto LABEL_95;
          }
          v77 = +[MLCLog framework];
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
            ANE_CreateUnitsWithArithmeticOpeartion_cold_8();
          }
LABEL_33:

LABEL_96:
          v100 = 0;
          goto LABEL_97;
        }
        goto LABEL_40;
      }
LABEL_26:
      if ([v6 count] != 1)
      {
        v77 = +[MLCLog framework];
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      uint64_t v67 = [v6 objectAtIndexedSubscript:0];
      id v22 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v67];

      uint64_t v68 = [v22 objectForKeyedSubscript:@"Bottom"];
      if ((_BYTE)v185 && HIBYTE(v185))
      {
        uint64_t v69 = [v5 label];
        uint64_t v70 = objc_msgSend(v69, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v8, "count"));
        [v22 setObject:v70 forKeyedSubscript:@"Name"];

        uint64_t v71 = [v8 objectAtIndexedSubscript:0];
        uint64_t v72 = [v71 objectForKeyedSubscript:@"Name"];
        [v68 setObject:v72 atIndexedSubscript:0];

        id v73 = [v8 objectAtIndexedSubscript:1];
        v74 = [v73 objectForKeyedSubscript:@"Name"];
        [v68 setObject:v74 atIndexedSubscript:1];

        id v75 = v180;
LABEL_30:
        id v76 = v75;
LABEL_62:
        if ((ANE_ValidateElementWiseUnit(v76, v22, 1) & 1) == 0)
        {
          int v107 = +[MLCLog framework];
          uint64_t v9 = v179;
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
            ANE_CreateUnitsWithArithmeticOpeartion_cold_4();
          }

          goto LABEL_95;
        }
        [v8 addObject:v22];

LABEL_64:
        uint64_t v9 = v179;
        goto LABEL_65;
      }
      if ((_BYTE)v185)
      {
        id v78 = [v5 label];
        v79 = objc_msgSend(v78, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v8, "count"));
        [v22 setObject:v79 forKeyedSubscript:@"Name"];

        v80 = [v8 objectAtIndexedSubscript:0];
        id v81 = [v80 objectForKeyedSubscript:@"Name"];
        [v68 setObject:v81 atIndexedSubscript:0];

        id v82 = [v9 objectAtIndexedSubscript:1];
        id v83 = [v82 label];
        [v68 setObject:v83 atIndexedSubscript:1];

        id v84 = [v180 objectAtIndexedSubscript:0];
        v216[0] = v84;
        __int16 v85 = [v9 objectAtIndexedSubscript:1];
        v216[1] = v85;
        id v86 = (void *)MEMORY[0x1E4F1C978];
        int v87 = v216;
      }
      else
      {
        if (!HIBYTE(v185))
        {
          id v75 = v9;
          goto LABEL_30;
        }
        int v101 = [v5 label];
        int v102 = objc_msgSend(v101, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v8, "count"));
        [v22 setObject:v102 forKeyedSubscript:@"Name"];

        v103 = [v9 objectAtIndexedSubscript:0];
        double v104 = [v103 label];
        [v68 setObject:v104 atIndexedSubscript:0];

        v105 = [v8 objectAtIndexedSubscript:0];
        int v106 = [v105 objectForKeyedSubscript:@"Name"];
        [v68 setObject:v106 atIndexedSubscript:1];

        id v84 = [v9 objectAtIndexedSubscript:0];
        v215[0] = v84;
        __int16 v85 = [v180 objectAtIndexedSubscript:0];
        v215[1] = v85;
        id v86 = (void *)MEMORY[0x1E4F1C978];
        int v87 = v215;
      }
      id v76 = [v86 arrayWithObjects:v87 count:2];

      goto LABEL_62;
    }
    if ((a1 - 28) < 2) {
      goto LABEL_26;
    }
    if (a1 == 22)
    {
      if ([v6 count] != 2)
      {
        v77 = +[MLCLog framework];
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsWithArithmeticOpeartion_cold_11();
        }
        goto LABEL_33;
      }
      uint64_t v54 = v11;
      v88 = v9;
      double v89 = [v6 objectAtIndexedSubscript:0];
      id v22 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v89];

      v90 = [v5 label];
      int v91 = [v90 stringByAppendingString:@"_0"];
      [v22 setObject:v91 forKeyedSubscript:@"Name"];

      if (ANE_ValidateGOCUnit(v9, v22, 1))
      {
        [v8 addObject:v22];
        int v92 = [v6 objectAtIndexedSubscript:1];
        uint64_t v60 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v92];

        id v61 = v5;
        v93 = [v5 label];
        double v94 = [v93 stringByAppendingString:@"_1"];
        [v60 setObject:v94 forKeyedSubscript:@"Name"];

        v95 = [v22 objectForKeyedSubscript:@"Name"];
        v188 = v95;
        int v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v188 count:1];
        [v60 setObject:v96 forKeyedSubscript:@"Bottom"];

        uint64_t v9 = v88;
        if ((ANE_ValidateNeuronUnit(v88, v60, 1) & 1) == 0)
        {
          uint64_t v66 = +[MLCLog framework];
          uint64_t v11 = v54;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
LABEL_86:
          }
            ANE_CreateUnitsWithArithmeticOpeartion_cold_9();
LABEL_87:

LABEL_94:
LABEL_95:

          goto LABEL_96;
        }
LABEL_39:
        [v8 addObject:v60];

        id v5 = v61;
        uint64_t v11 = v54;
LABEL_65:

        v100 = (void *)[v8 copy];
        goto LABEL_97;
      }
      v126 = +[MLCLog framework];
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
        goto LABEL_77;
      }
    }
    else
    {
      if (a1 != 24)
      {
LABEL_40:
        if ([v6 count] == 1)
        {
          int v97 = [v6 objectAtIndexedSubscript:0];
          id v22 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v97];

          v98 = [v22 objectForKeyedSubscript:@"Type"];
          LODWORD(v97) = [v98 isEqualToString:@"Neuron"];

          if (v97)
          {
            if ((ANE_ValidateNeuronUnit(v9, v22, 1) & 1) == 0)
            {
              uint64_t v60 = +[MLCLog framework];
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                ANE_CreateUnitsWithArithmeticOpeartion_cold_1();
              }
LABEL_93:
              uint64_t v9 = v179;
              goto LABEL_94;
            }
          }
          else
          {
            v127 = [v9 objectAtIndexedSubscript:0];
            v186 = v127;
            v128 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v186 count:1];
            char v129 = ANE_ValidateElementWiseUnit(v128, v22, 1);

            if ((v129 & 1) == 0)
            {
              uint64_t v60 = +[MLCLog framework];
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                ANE_CreateUnitsWithArithmeticOpeartion_cold_2();
              }
              goto LABEL_93;
            }
          }
          [v8 addObject:v22];
          goto LABEL_64;
        }
        v77 = +[MLCLog framework];
        if (!os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
LABEL_32:
        ANE_CreateUnitsWithArithmeticOpeartion_cold_3();
        goto LABEL_33;
      }
      if ([v6 count] != 2)
      {
        v77 = +[MLCLog framework];
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
          ANE_CreateUnitsWithArithmeticOpeartion_cold_14();
        }
        goto LABEL_33;
      }
      uint64_t v54 = v11;
      id v55 = v9;
      uint64_t v56 = [v6 objectAtIndexedSubscript:0];
      id v22 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v56];

      uint64_t v57 = [v5 label];
      uint64_t v58 = [v57 stringByAppendingString:@"_0"];
      [v22 setObject:v58 forKeyedSubscript:@"Name"];

      if (ANE_ValidateNeuronUnit(v9, v22, 1))
      {
        [v8 addObject:v22];
        uint64_t v59 = [v6 objectAtIndexedSubscript:1];
        uint64_t v60 = +[_MLCANEPlistBuilder createUnitWithLayer:v5 unitParams:v59];

        id v61 = v5;
        uint64_t v62 = [v5 label];
        char v63 = [v62 stringByAppendingString:@"_1"];
        [v60 setObject:v63 forKeyedSubscript:@"Name"];

        char v64 = [v22 objectForKeyedSubscript:@"Name"];
        v187 = v64;
        unint64_t v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v187 count:1];
        [v60 setObject:v65 forKeyedSubscript:@"Bottom"];

        uint64_t v9 = v55;
        if ((ANE_ValidateGOCUnit(v55, v60, 1) & 1) == 0)
        {
          uint64_t v66 = +[MLCLog framework];
          uint64_t v11 = v54;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
            goto LABEL_86;
          }
          goto LABEL_87;
        }
        goto LABEL_39;
      }
      v126 = +[MLCLog framework];
      if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
LABEL_77:
      }
        ANE_CreateUnitsWithArithmeticOpeartion_cold_9();
    }

    v100 = 0;
    uint64_t v9 = v179;
    uint64_t v11 = v54;
    goto LABEL_97;
  }
  int v171 = a1;
  id v175 = v6;
  v177 = v8;
  id v184 = 0;
  v173 = v11;
  ANE_GetTensor4DShapeWithOnePrepended(v11, &v184);
  id v12 = v184;
  if (![v9 count])
  {
LABEL_9:

    id v6 = v175;
    uint64_t v8 = v177;
    uint64_t v11 = v173;
    a1 = v171;
    goto LABEL_10;
  }
  uint64_t v13 = 0;
  while (1)
  {
    unint64_t v14 = [v9 objectAtIndexedSubscript:v13];
    id v182 = 0;
    id v183 = 0;
    int v15 = +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:v14 targetShape:v12 layer:v5 broadcastUnit:&v183 broadcastResultTensor:&v182];
    id v16 = v183;
    id v17 = v182;
    if (v15 == 1) {
      goto LABEL_8;
    }
    if (v15 != 2) {
      break;
    }
    if (!v16)
    {
      double v99 = +[MLCLog framework];
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithArithmeticOpeartion_cold_16(v99);
      }
      id v16 = 0;
      goto LABEL_50;
    }
    *((unsigned char *)&v185 + v13) = 1;
    __int16 v18 = [v5 label];
    objc_msgSend(v18, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v177, "count"));
    v20 = id v19 = v5;
    [v16 setObject:v20 forKeyedSubscript:@"Name"];

    id v5 = v19;
    uint64_t v9 = v179;
    [v177 addObject:v16];
    [v180 addObject:v17];
LABEL_8:

    if (++v13 >= (unint64_t)[v9 count]) {
      goto LABEL_9;
    }
  }
  double v99 = +[MLCLog framework];
  if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
    ANE_CreateUnitsWithArithmeticOpeartion_cold_15();
  }
LABEL_50:

  v100 = 0;
  id v6 = v175;
  uint64_t v8 = v177;
  uint64_t v11 = v173;
LABEL_97:

  return v100;
}

id ANE_CompileArithmeticLayer(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = [a3 parentLayers];
  id v6 = [v5 objectAtIndexedSubscript:0];

  id v7 = [v4 objectAtIndexedSubscript:0];

  uint64_t v8 = [v7 params];
  uint64_t v9 = [v8 arithmeticParams];

  unint64_t v10 = ANE_CreateUnitsWithArithmeticOpeartion([v6 operation], v6, v9);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = (void *)[v10 copy];
  }
  else
  {
    uint64_t v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      ANE_CompileArithmeticLayer_cold_1();
    }

    id v12 = 0;
  }

  return v12;
}

uint64_t ANE_IsSupportedLayer(void *a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (ANE_IsAneCompiledLayer(v1)) {
    goto LABEL_2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0 && ![v1 skipLayer]) {
      goto LABEL_28;
    }
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v5 = [v1 resultTensors];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v43 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          uint64_t v11 = [v10 childLayers];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v39;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v39 != v14) {
                  objc_enumerationMutation(v11);
                }
                if (!ANE_IsSupportedLayer(*(void *)(*((void *)&v38 + 1) + 8 * j)))
                {

LABEL_28:
                  uint64_t v2 = 0;
                  goto LABEL_29;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
            }
            while (v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v7);
    }

    if (isKindOfClass)
    {
      uint64_t v2 = [v1 isLastLayer] ^ 1;
      goto LABEL_29;
    }
LABEL_2:
    uint64_t v2 = 1;
    goto LABEL_29;
  }
  id v3 = v1;
  if (([v3 isLastLayer] & 1) != 0 || objc_msgSend(v3, "paddingType"))
  {
    uint64_t v2 = 0;
    goto LABEL_7;
  }
  id v17 = [v3 resultTensors];
  __int16 v18 = [v17 objectAtIndexedSubscript:0];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v19 = [v18 childLayers];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (!v20)
  {
    uint64_t v2 = 1;
    goto LABEL_55;
  }
  uint64_t v21 = v20;
  uint64_t v22 = *(void *)v47;
  long long v37 = v18;
  while (2)
  {
    for (uint64_t k = 0; k != v21; ++k)
    {
      if (*(void *)v47 != v22) {
        objc_enumerationMutation(v19);
      }
      uint64_t v24 = *(void **)(*((void *)&v46 + 1) + 8 * k);
      if (!ANE_IsAneCompiledLayer(v24))
      {
LABEL_50:
        uint64_t v2 = 0;
        __int16 v18 = v37;
        goto LABEL_55;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v25 = [v24 deviceOps];
        id v26 = [v25 objectAtIndexedSubscript:0];

        unint64_t v27 = [v26 units];
        id v28 = ANE_FindUnitWithType(@"Conv", v27);

        if (!v28 || !applyAndCheckPaddingSizes(v3, v28, 1)) {
          goto LABEL_53;
        }

        continue;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_50;
      }
      id v26 = v24;
      unint64_t v29 = [v26 descriptor];
      int v30 = [v29 poolingType];

      if (v30 != 1)
      {
        if (v30 == 2)
        {
          id v31 = [v26 descriptor];
          char v32 = [v31 countIncludesPadding];

          if (v32) {
            goto LABEL_44;
          }
          __int16 v18 = v37;
        }
        else
        {
          id v28 = +[MLCLog framework];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            ANE_IsSupportedLayer_cold_1(v26, v28);
          }
LABEL_53:
          __int16 v18 = v37;
        }
        uint64_t v2 = 0;
        goto LABEL_55;
      }
LABEL_44:
      id v33 = [v26 deviceOps];
      id v28 = [v33 objectAtIndexedSubscript:0];

      unint64_t v34 = [v28 units];
      uint64_t v35 = ANE_FindUnitWithType(@"Pooling", v34);

      if (!v35) {
        goto LABEL_53;
      }
      int v36 = applyAndCheckPaddingSizes(v3, v35, 0);

      if (!v36) {
        goto LABEL_50;
      }
    }
    uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v52 count:16];
    uint64_t v2 = 1;
    __int16 v18 = v37;
    if (v21) {
      continue;
    }
    break;
  }
LABEL_55:

LABEL_7:
LABEL_29:

  return v2;
}

void buildANESubgraph(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unint64_t a7)
{
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  __int16 v18 = v15;
  id v19 = v17;
  id v20 = a6;
  int v91 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v14 addObject:v13];
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  int v87 = v13;
  uint64_t v21 = v13;
  uint64_t v22 = v16;
  id v23 = [v21 sourceTensors];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v112 objects:v124 count:16];
  if (v24)
  {
    uint64_t v26 = *(void *)v113;
    *(void *)&long long v25 = 136315394;
    long long v73 = v25;
    id v94 = v19;
    id v95 = v23;
    id v86 = v15;
    id v90 = v16;
    uint64_t v80 = *(void *)v113;
    do
    {
      uint64_t v27 = 0;
      uint64_t v79 = v24;
      do
      {
        if (*(void *)v113 != v26)
        {
          uint64_t v28 = v27;
          objc_enumerationMutation(v23);
          uint64_t v27 = v28;
        }
        uint64_t v83 = v27;
        unint64_t v29 = *(void **)(*((void *)&v112 + 1) + 8 * v27);
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v30 = v29;
        id v31 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        char v32 = [v30 parentLayers];
        uint64_t v33 = [v32 count];

        if (!v33)
        {
LABEL_24:
          id v50 = v31;
          uint64_t v22 = v90;
          goto LABEL_32;
        }
        unint64_t v34 = (char *)v33;
        uint64_t v35 = 0;
        obuint64_t j = v30;
        id v84 = v34;
        while (1)
        {
          int v36 = objc_msgSend(v30, "parentLayers", v73);
          int v92 = v35;
          long long v37 = [v36 objectAtIndexedSubscript:v35];

          if ([v37 skipLayer]) {
            break;
          }
          [v31 addObject:v37];
LABEL_23:

          uint64_t v35 = v92 + 1;
          id v30 = obj;
          if (v92 + 1 == v34) {
            goto LABEL_24;
          }
        }
        if (v37)
        {
          while ([v37 skipLayer])
          {
            long long v38 = [v37 sourceTensors];
            uint64_t v39 = [v38 count];

            if (v39 != 1)
            {
              uint64_t v51 = +[MLCLog framework];
              id v19 = v94;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v73;
                char v129 = "getParentLayers";
                __int16 v130 = 2112;
                int v131 = v37;
                _os_log_error_impl(&dword_1DD0C9000, v51, OS_LOG_TYPE_ERROR, "%s: Cannot find parents for a layer = %@", buf, 0x16u);
              }

              uint64_t v22 = v90;
              goto LABEL_31;
            }
            long long v40 = [v37 sourceTensors];
            long long v41 = [v40 lastObject];
            long long v42 = [v41 parentLayers];
            uint64_t v43 = [v42 lastObject];

            long long v37 = v43;
            if (!v43) {
              goto LABEL_25;
            }
          }
          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v44 = [v37 sourceTensors];
          uint64_t v45 = [v44 countByEnumeratingWithState:&v116 objects:v125 count:16];
          if (v45)
          {
            uint64_t v46 = v45;
            uint64_t v47 = *(void *)v117;
            do
            {
              for (uint64_t i = 0; i != v46; ++i)
              {
                if (*(void *)v117 != v47) {
                  objc_enumerationMutation(v44);
                }
                long long v49 = [*(id *)(*((void *)&v116 + 1) + 8 * i) parentLayers];
                [v31 addObjectsFromArray:v49];
              }
              uint64_t v46 = [v44 countByEnumeratingWithState:&v116 objects:v125 count:16];
            }
            while (v46);
          }

          unint64_t v34 = v84;
          __int16 v18 = v86;
          id v19 = v94;
          goto LABEL_23;
        }
LABEL_25:
        long long v37 = +[MLCLog framework];
        uint64_t v22 = v90;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          buildANESubgraph_cold_1(v126, &v127, v37);
        }
        id v19 = v94;
LABEL_31:

        id v50 = (id)MEMORY[0x1E4F1CBF0];
        id v30 = obj;
LABEL_32:

        uint64_t v52 = [v50 countByEnumeratingWithState:&v108 objects:v123 count:16];
        id v23 = v95;
        if (v52)
        {
          uint64_t v53 = *(void *)v109;
          uint64_t v78 = *(void *)v109;
          while (2)
          {
            uint64_t v54 = 0;
            uint64_t v77 = v52;
            do
            {
              if (*(void *)v109 != v53) {
                objc_enumerationMutation(v50);
              }
              id v55 = *(void **)(*((void *)&v108 + 1) + 8 * v54);
              if ((objc_msgSend(v22, "doesLayer:dominatesSubgraph:", v55, v18, v73) & 1) != 0
                || ([v19 containsObject:v55] & 1) != 0)
              {
LABEL_70:

                goto LABEL_71;
              }
              long long v106 = 0u;
              long long v107 = 0u;
              long long v104 = 0u;
              long long v105 = 0u;
              id obja = [v55 resultTensors];
              uint64_t v81 = [obja countByEnumeratingWithState:&v104 objects:v122 count:16];
              if (v81)
              {
                uint64_t v56 = *(void *)v105;
                id v85 = v50;
                v74 = v55;
                uint64_t v75 = v54;
                uint64_t v76 = *(void *)v105;
                do
                {
                  uint64_t v57 = 0;
                  do
                  {
                    if (*(void *)v105 != v56)
                    {
                      uint64_t v58 = v57;
                      objc_enumerationMutation(obja);
                      uint64_t v57 = v58;
                    }
                    uint64_t v82 = v57;
                    uint64_t v59 = *(void **)(*((void *)&v104 + 1) + 8 * v57);
                    long long v100 = 0u;
                    long long v101 = 0u;
                    long long v102 = 0u;
                    long long v103 = 0u;
                    id v93 = [v59 childLayers];
                    uint64_t v60 = [v93 countByEnumeratingWithState:&v100 objects:v121 count:16];
                    if (v60)
                    {
                      uint64_t v61 = v60;
                      uint64_t v62 = *(void *)v101;
                      do
                      {
                        for (uint64_t j = 0; j != v61; ++j)
                        {
                          if (*(void *)v101 != v62) {
                            objc_enumerationMutation(v93);
                          }
                          char v64 = *(void **)(*((void *)&v100 + 1) + 8 * j);
                          unint64_t v65 = [v64 key];
                          uint64_t v66 = [v20 objectForKeyedSubscript:v65];
                          if ([v66 unsignedIntegerValue] >= a7)
                          {

                            id v23 = v95;
                          }
                          else
                          {
                            char v67 = [v14 containsObject:v64];

                            id v23 = v95;
                            if ((v67 & 1) == 0)
                            {

                              id v50 = v85;
                              __int16 v18 = v86;
                              uint64_t v22 = v90;
                              id v19 = v94;
                              goto LABEL_70;
                            }
                          }
                          id v19 = v94;
                        }
                        uint64_t v61 = [v93 countByEnumeratingWithState:&v100 objects:v121 count:16];
                      }
                      while (v61);
                    }

                    uint64_t v57 = v82 + 1;
                    id v50 = v85;
                    __int16 v18 = v86;
                    uint64_t v22 = v90;
                    id v55 = v74;
                    uint64_t v54 = v75;
                    uint64_t v56 = v76;
                  }
                  while (v82 + 1 != v81);
                  uint64_t v68 = [obja countByEnumeratingWithState:&v104 objects:v122 count:16];
                  uint64_t v56 = v76;
                  uint64_t v81 = v68;
                }
                while (v68);
              }

              [v91 addObject:v55];
              ++v54;
              uint64_t v53 = v78;
            }
            while (v54 != v77);
            uint64_t v52 = [v50 countByEnumeratingWithState:&v108 objects:v123 count:16];
            uint64_t v53 = v78;
            if (v52) {
              continue;
            }
            break;
          }
        }

        uint64_t v27 = v83 + 1;
        uint64_t v26 = v80;
      }
      while (v83 + 1 != v79);
      uint64_t v24 = [v23 countByEnumeratingWithState:&v112 objects:v124 count:16];
      uint64_t v26 = v80;
    }
    while (v24);
  }

  if ([v91 count])
  {
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v23 = v91;
    uint64_t v69 = [v23 countByEnumeratingWithState:&v96 objects:v120 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v97;
      do
      {
        for (uint64_t k = 0; k != v70; ++k)
        {
          if (*(void *)v97 != v71) {
            objc_enumerationMutation(v23);
          }
          buildANESubgraph(*(void *)(*((void *)&v96 + 1) + 8 * k), v14, v18, v22, v19, v20, a7);
        }
        uint64_t v70 = [v23 countByEnumeratingWithState:&v96 objects:v120 count:16];
      }
      while (v70);
    }
LABEL_71:
  }
}

uint64_t applyAndCheckPaddingSizes(void *a1, void *a2, int a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)[a2 mutableCopy];
  ANE_ApplyPaddingSizes(v5, v6);
  if (a3) {
    uint64_t v7 = ANE_ValidateConvolutionLayer(v5, v6);
  }
  else {
    uint64_t v7 = ANE_ValidatePoolingLayer(v5, v6);
  }
  uint64_t v8 = v7;

  return v8;
}

uint64_t canMergeANESubgraphsHelper(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 getDominanceFrontierForSubgraph:v8];
  uint64_t v12 = (void *)[v11 mutableCopy];
  [v12 minusSet:v7];
  uint64_t v13 = [v12 count];
  if (v13 == [v11 count] || (objc_msgSend(v9, "doesSubgraph:dominatesSubgraph:", v7, v12) & 1) != 0)
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v46 = v12;
    uint64_t v47 = v11;
    id v49 = v7;
    id v50 = v9;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v7;
    uint64_t v15 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      unint64_t v17 = 0;
      uint64_t v18 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v62 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          uint64_t v21 = [v20 key];
          uint64_t v22 = [v10 objectForKeyedSubscript:v21];
          if (v17 <= [v22 unsignedIntegerValue])
          {
            id v23 = [v20 key];
            uint64_t v24 = [v10 objectForKeyedSubscript:v23];
            unint64_t v17 = [v24 unsignedIntegerValue];
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v16);
    }
    else
    {
      unint64_t v17 = 0;
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v48 = v8;
    id v52 = v8;
    uint64_t v25 = [v52 countByEnumeratingWithState:&v57 objects:v66 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      unint64_t v27 = 0;
      uint64_t v28 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v58 != v28) {
            objc_enumerationMutation(v52);
          }
          id v30 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          id v31 = [v30 key];
          char v32 = [v10 objectForKeyedSubscript:v31];
          if (v27 <= [v32 unsignedIntegerValue])
          {
            uint64_t v33 = [v30 key];
            unint64_t v34 = [v10 objectForKeyedSubscript:v33];
            unint64_t v27 = [v34 unsignedIntegerValue];
          }
        }
        uint64_t v26 = [v52 countByEnumeratingWithState:&v57 objects:v66 count:16];
      }
      while (v26);
    }
    else
    {
      unint64_t v27 = 0;
    }

    if (v17 <= v27) {
      unint64_t v35 = v27;
    }
    else {
      unint64_t v35 = v17;
    }
    id v9 = v50;
    [v50 getPostDominanceFrontierForSubgraph:obj];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v37 = [v36 countByEnumeratingWithState:&v53 objects:v65 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v54;
      id v8 = v48;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v54 != v39) {
            objc_enumerationMutation(v36);
          }
          long long v41 = *(void **)(*((void *)&v53 + 1) + 8 * k);
          long long v42 = [v41 key];
          uint64_t v43 = [v10 objectForKeyedSubscript:v42];
          if ([v43 unsignedIntegerValue] >= v35)
          {
          }
          else
          {
            char v44 = [v52 containsObject:v41];

            if ((v44 & 1) == 0)
            {
              uint64_t v14 = 0;
              goto LABEL_41;
            }
          }
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v53 objects:v65 count:16];
      }
      while (v38);
      uint64_t v14 = 1;
LABEL_41:
      id v9 = v50;
    }
    else
    {
      uint64_t v14 = 1;
      id v8 = v48;
    }

    id v7 = v49;
    uint64_t v12 = v46;
    uint64_t v11 = v47;
  }

  return v14;
}

uint64_t __pruneANESubgraphs_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 count];

  id v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v9 compare:v6];

  return v10;
}

uint64_t setBNNSActivation(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 activationType];
  switch(v4)
  {
    case 0:
    case 3:
    case 6:
      goto LABEL_30;
    case 1:
      [v3 a];
      if (v5 == 0.0) {
        int v4 = 1;
      }
      else {
        int v4 = 2;
      }
      goto LABEL_30;
    case 2:
      [v3 b];
      if (v8 == 0.0) {
        int v4 = 7;
      }
      else {
        int v4 = 20;
      }
      goto LABEL_30;
    case 4:
      int v4 = 15;
      goto LABEL_30;
    case 5:
      [v3 a];
      int v4 = 5;
      if (v9 == 1.0)
      {
        [v3 b];
        if (v10 == 1.0) {
          int v4 = 4;
        }
        else {
          int v4 = 5;
        }
      }
      goto LABEL_30;
    case 7:
      int v4 = 16;
      goto LABEL_30;
    case 8:
      int v4 = 17;
      goto LABEL_30;
    case 9:
      int v4 = 18;
      goto LABEL_30;
    case 10:
      int v4 = 19;
      goto LABEL_30;
    case 11:
      int v4 = 22;
      goto LABEL_30;
    case 12:
      int v4 = 23;
      goto LABEL_30;
    case 13:
      int v4 = 24;
      goto LABEL_30;
    case 14:
      int v4 = 25;
      goto LABEL_30;
    case 15:
      int v4 = 26;
      goto LABEL_30;
    case 16:
      int v4 = 27;
      goto LABEL_30;
    case 17:
      int v4 = 28;
      goto LABEL_30;
    case 18:
      *(_DWORD *)a1 = 12;
      *(void *)(a1 + 4) = 0x3D3727133F4C422ALL;
      goto LABEL_31;
    case 19:
      int v4 = 30;
      goto LABEL_30;
    case 20:
      int v4 = 8;
LABEL_30:
      *(_DWORD *)a1 = v4;
      [v3 a];
      *(_DWORD *)(a1 + 4) = v11;
      [v3 b];
      *(_DWORD *)(a1 + 8) = v12;
LABEL_31:
      uint64_t v7 = 1;
      break;
    default:
      uint64_t v6 = +[MLCLog framework];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        setBNNSActivation_cold_1(v3);
      }

      uint64_t v7 = 0;
      break;
  }

  return v7;
}

id softLinkClass_ANEIOSurfaceObject()
{
  if (softLinkClass_ANEIOSurfaceObject_onceToken != -1) {
    dispatch_once(&softLinkClass_ANEIOSurfaceObject_onceToken, &__block_literal_global_28);
  }
  uint64_t v0 = (void *)softLinkClass_ANEIOSurfaceObject_softLinkClass_ANEIOSurfaceObject;

  return v0;
}

void *__AppleNeuralEngineLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/AppleNeuralEngine.framework/AppleNeuralEngine", 1);
  AppleNeuralEngineLibrary_frameworkLibrary = (uint64_t)result;
  return result;
}

void sub_1DD0F9D00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DD0F9DAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id softLinkClass_ANEDeviceInfo()
{
  if (softLinkClass_ANEDeviceInfo_onceToken != -1) {
    dispatch_once(&softLinkClass_ANEDeviceInfo_onceToken, &__block_literal_global_105);
  }
  uint64_t v0 = (void *)softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo;

  return v0;
}

void *__AppleNeuralEngineLibrary_block_invoke_0()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/AppleNeuralEngine.framework/AppleNeuralEngine", 1);
  AppleNeuralEngineLibrary_frameworkLibrary_0 = (uint64_t)result;
  return result;
}

void sub_1DD0FCE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return [v0 deviceOpType];
}

unint64_t *hashCombine_0(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 11;
  do
  {
    int v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *uint64_t result = v9;
  return result;
}

uint64_t ANE_BuildConvolutionParams(void *a1, void *a2, void *a3)
{
  void v40[3] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  [v5 setObject:@"Conv" forKeyedSubscript:kMLCANENetUnitType[0]];
  int v8 = [v6 convolutionType];
  switch(v8)
  {
    case 2:
      goto LABEL_4;
    case 1:
      [v5 setObject:@"DeConv" forKeyedSubscript:@"Type"];
      goto LABEL_8;
    case 0:
LABEL_4:
      [v5 setObject:@"Conv" forKeyedSubscript:@"Type"];
      if ((unint64_t)[v6 dilationRateInX] > 1
        || (unint64_t)[v6 dilationRateInY] >= 2)
      {
        [v5 setObject:@"DilatedConv" forKeyedSubscript:@"Type"];
        unint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "dilationRateInX"));
        [v5 setObject:v9 forKeyedSubscript:@"KernelDilationX"];

        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "dilationRateInY"));
        [v5 setObject:v10 forKeyedSubscript:@"KernelDilationY"];
      }
LABEL_8:
      int v11 = [NSNumber numberWithBool:0];
      [v5 setObject:v11 forKeyedSubscript:@"KernelGroupReuse"];

      int v12 = [v7 descriptor];
      uint64_t v13 = ANE_GetANECIRDataTypeWithMLCDataType([v12 dataType]);
      if (!v13)
      {
        uint64_t v22 = +[MLCLog framework];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          ANE_BuildConvolutionParams_cold_2(v12);
        }
        uint64_t v29 = 0;
        goto LABEL_22;
      }
      [v5 setObject:v13 forKeyedSubscript:@"KernelType"];
      uint64_t v14 = [v12 shape];
      uint64_t v15 = [v14 objectAtIndexedSubscript:3];
      [v5 setObject:v15 forKeyedSubscript:@"KernelWidth"];

      uint64_t v16 = [v12 shape];
      unint64_t v17 = [v16 objectAtIndexedSubscript:2];
      [v5 setObject:v17 forKeyedSubscript:@"KernelHeight"];

      [v5 setObject:&unk_1F3876750 forKeyedSubscript:@"KernelDepth"];
      if ([v6 convolutionType] == 1)
      {
        uint64_t v39 = v13;
        uint64_t v18 = [v7 data];
        id v19 = v7;
        size_t v20 = [v18 length];

        uint64_t v21 = malloc_type_malloc(v20, 0xDD75BE8EuLL);
        uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v21 length:v20 freeWhenDone:1];
        id v23 = [v19 data];
        id v7 = v19;
        BOOL v24 = +[MLCDataHelper convertOIHWtoIOHW:sourceOIHW:resultIOHW:inputFeatureChannelCount:outputFeatureChannelCount:](MLCDataHelper, "convertOIHWtoIOHW:sourceOIHW:resultIOHW:inputFeatureChannelCount:outputFeatureChannelCount:", v19, [v23 bytes], v21, objc_msgSend(v6, "inputFeatureChannelCount") / (unint64_t)objc_msgSend(v6, "groupCount"), objc_msgSend(v6, "outputFeatureChannelCount"));

        if (!v24)
        {
          id v30 = +[MLCLog framework];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            ANE_BuildConvolutionParams_cold_3(v30, v31, v32, v33, v34, v35, v36, v37);
          }

          uint64_t v29 = 0;
          uint64_t v13 = v39;
          goto LABEL_22;
        }
        uint64_t v25 = [v19 deviceMemory];
        objc_msgSend(v25, "setObject:atIndexedSubscript:", v22, objc_msgSend(v19, "deviceIndex"));

        uint64_t v13 = v39;
      }
      [v5 setObject:@"Dense" forKeyedSubscript:@"KernelMode"];
      uint64_t v26 = [NSNumber numberWithBool:0];
      [v5 setObject:v26 forKeyedSubscript:@"KernelMutable"];

      uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "strideInX"));
      v40[0] = v22;
      unint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "strideInY"));
      v40[1] = v27;
      v40[2] = &unk_1F3876750;
      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:3];
      [v5 setObject:v28 forKeyedSubscript:@"Step"];

      uint64_t v29 = 1;
LABEL_22:

      goto LABEL_23;
  }
  int v12 = +[MLCLog framework];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    ANE_BuildConvolutionParams_cold_1(v6);
  }
  uint64_t v29 = 0;
LABEL_23:

  return v29;
}

id ANE_CreateConvolutionLayer(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  id v10 = a1;
  id v11 = (id)MEMORY[0x1E4F1CBF0];
  int v12 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v13 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  int v14 = ANE_BuildConvolutionParams(v13, v9, v10);

  if (v14)
  {
    if (v7)
    {
      uint64_t v15 = +[_MLCANEPlistBuilder buildBiasParamsWithBiases:v7];
      if (!v15)
      {
        uint64_t v15 = +[MLCLog framework];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          ANE_CreateConvolutionLayer_cold_2(v15, v21, v22, v23, v24, v25, v26, v27);
        }
        goto LABEL_17;
      }
      if (v8) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v15 = 0;
      if (v8)
      {
LABEL_5:
        uint64_t v16 = ANE_BuildNeuronParams(v8);
        if (!v16)
        {
          unint64_t v17 = +[MLCLog framework];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            ANE_CreateConvolutionLayer_cold_1(v17, v28, v29, v30, v31, v32, v33, v34);
          }
          goto LABEL_16;
        }
        unint64_t v17 = v16;
        uint64_t v18 = 5;
LABEL_9:
        id v19 = +[_MLCANEConvolutionParameters convolutionUnitParametersWith:v13 biasParams:v15 neuronParams:v17];
        size_t v20 = +[MLCANEDeviceOps deviceOpsWithType:v18 params:v19];
        if (v20) {
          [v12 addObject:v20];
        }
        id v11 = v12;

LABEL_16:
LABEL_17:

        goto LABEL_18;
      }
    }
    unint64_t v17 = 0;
    uint64_t v18 = 4;
    goto LABEL_9;
  }
LABEL_18:

  return v11;
}

uint64_t ANE_ValidateConvolutionLayer(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = [a1 sourceTensors];
  uint64_t v5 = ANE_ValidateConvolutionUnit(v4, v3, 0);

  return v5;
}

id ANE_CreateUnitsWithConvolutionLayer(void *a1, void *a2, void *a3)
{
  v93[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  id v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v10 = v5;
  id v11 = (void *)[v8 mutableCopy];
  uint64_t v12 = 6;
  do
  {
    [v11 addObject:&unk_1F3876768];
    --v12;
  }
  while (v12);
  objc_opt_class();
  id v90 = v9;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  id v86 = v7;
  id v88 = v6;
  id v85 = v10;
  id v13 = v10;
  int v14 = [v13 descriptor];
  uint64_t v15 = [v13 sourceTensors];
  uint64_t v16 = [v15 objectAtIndexedSubscript:0];

  unint64_t v17 = [v13 resultTensors];
  uint64_t v18 = [v17 objectAtIndexedSubscript:0];

  int v79 = [v14 paddingPolicy];
  uint64_t v91 = 1;
  uint64_t v92 = 1;
  id v84 = v16;
  ANE_GetTensorWidthAndHeightWithBatchFirst(v16, &v92, &v91);
  uint64_t v19 = v92;
  uint64_t v82 = v91;
  uint64_t v83 = v18;
  ANE_GetTensorWidthAndHeightWithBatchFirst(v18, &v92, &v91);
  uint64_t v20 = v92;
  uint64_t v81 = v91;
  uint64_t v21 = [v13 kernelWidth];
  uint64_t v80 = [v13 kernelHeight];
  uint64_t v22 = [v13 dilationRateInX];
  uint64_t v78 = [v13 dilationRateInY];
  uint64_t v23 = [v13 strideInX];
  uint64_t v24 = [v13 strideInY];
  uint64_t v25 = v14;
  if ([v14 convolutionType] != 1)
  {
    if (v79 == 2)
    {
      uint64_t v32 = [v14 paddingSizeInY];
      uint64_t v31 = [v14 paddingSizeInY];
      uint64_t v34 = [v25 paddingSizeInX];
      uint64_t v33 = [v25 paddingSizeInX];
    }
    else
    {
      uint64_t v35 = v22 * (v21 - 1) - v19 + v23 * (v20 - 1) + 1;
      unint64_t v36 = v35 & ~(v35 >> 63);
      unint64_t v37 = (v78 * (v80 - 1) - v82 + v24 * (v81 - 1) + 1) & ~((v78 * (v80 - 1) - v82 + v24 * (v81 - 1) + 1) >> 63);
      uint64_t v32 = v37 >> 1;
      uint64_t v31 = v37 - (v37 >> 1);
      uint64_t v34 = v36 >> 1;
      uint64_t v33 = v36 - (v36 >> 1);
    }
    goto LABEL_11;
  }
  uint64_t v26 = v20 - v23 * v19;
  BOOL v27 = __OFADD__(v26, v21);
  uint64_t v28 = v26 + v21;
  if ((v28 < 0) ^ v27 | (v28 == 0))
  {
    uint64_t v77 = +[MLCLog framework];
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      ANE_CreateUnitsWithConvolutionLayer_cold_4();
    }
  }
  else
  {
    uint64_t v29 = v81 - v24 * v82;
    BOOL v27 = __OFADD__(v29, v80);
    uint64_t v30 = v29 + v80;
    if (!((v30 < 0) ^ v27 | (v30 == 0)))
    {
      uint64_t v31 = (v30 - v24) / 2;
      uint64_t v32 = v30 - 1 - v31;
      uint64_t v33 = (v28 - v23) / 2;
      uint64_t v34 = v28 - 1 - v33;
LABEL_11:
      uint64_t v38 = [NSNumber numberWithLong:v32];
      [v11 setObject:v38 atIndexedSubscript:0];

      uint64_t v39 = [NSNumber numberWithLong:v31];
      [v11 setObject:v39 atIndexedSubscript:1];

      long long v40 = [NSNumber numberWithLong:v34];
      [v11 setObject:v40 atIndexedSubscript:2];

      long long v41 = [NSNumber numberWithLong:v33];
      [v11 setObject:v41 atIndexedSubscript:3];

      id v7 = v86;
      id v6 = v88;
      id v10 = v85;
      id v9 = v90;
LABEL_12:
      id v42 = v11;
      goto LABEL_13;
    }
    uint64_t v77 = +[MLCLog framework];
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR)) {
      ANE_CreateUnitsWithConvolutionLayer_cold_5();
    }
  }
  id v7 = v86;
  id v6 = v88;
  id v10 = v85;
  id v9 = v90;

  id v42 = (id)MEMORY[0x1E4F1CBF0];
LABEL_13:

  if ([v42 count])
  {
    uint64_t v43 = [v42 objectAtIndexedSubscript:0];
    [v6 setObject:v43 forKeyedSubscript:@"PadTop"];

    char v44 = [v42 objectAtIndexedSubscript:1];
    [v6 setObject:v44 forKeyedSubscript:@"PadBot"];

    uint64_t v45 = [v42 objectAtIndexedSubscript:2];
    [v6 setObject:v45 forKeyedSubscript:@"PadLeft"];

    uint64_t v46 = [v42 objectAtIndexedSubscript:3];
    [v6 setObject:v46 forKeyedSubscript:@"PadRight"];

    [v6 setObject:&unk_1F3876768 forKeyedSubscript:@"PadFront"];
    [v6 setObject:&unk_1F3876768 forKeyedSubscript:@"PadBack"];
    [v6 setObject:@"Zero" forKeyedSubscript:@"PaddingMode"];
    uint64_t v47 = +[_MLCANEPlistBuilder createUnitWithLayer:v10 unitParams:v6];
    uint64_t v92 = 1;
    id v48 = [v10 resultTensors];
    id v49 = [v48 objectAtIndexedSubscript:0];
    ANE_GetTensorFeatureChannelsWithBatchFirst(v49, &v92);

    id v50 = [NSNumber numberWithUnsignedInteger:v92];
    [v47 setObject:v50 forKeyedSubscript:@"OutputChannels"];

    uint64_t v51 = [v10 descriptor];
    int v52 = [v51 convolutionType];
    long long v53 = NSNumber;
    if (v52 == 2) {
      uint64_t v54 = [v51 inputFeatureChannelCount];
    }
    else {
      uint64_t v54 = [v51 groupCount];
    }
    long long v56 = [v53 numberWithUnsignedInteger:v54];
    [v47 setObject:v56 forKeyedSubscript:@"NumGroups"];

    if (ANE_ValidateConvolutionLayer(v10, v47))
    {
      long long v57 = v90;
      [v90 addObject:v47];
      if (!v7)
      {
LABEL_24:
        long long v55 = (void *)[v57 copy];
        id v9 = v57;
LABEL_32:

        goto LABEL_33;
      }
      id v89 = v6;
      long long v58 = [v10 label];
      long long v59 = [v58 stringByAppendingFormat:@"%@", @"_0"];

      [v47 setObject:v59 forKeyedSubscript:@"Name"];
      id v87 = v7;
      long long v60 = +[_MLCANEPlistBuilder createUnitWithLayer:v10 unitParams:v7];
      long long v61 = [NSNumber numberWithUnsignedInteger:v92];
      [v60 setObject:v61 forKeyedSubscript:@"OutputChannels"];

      long long v62 = [v10 label];
      long long v63 = [v62 stringByAppendingFormat:@"%@", @"_1"];

      [v60 setObject:v63 forKeyedSubscript:@"Name"];
      v93[0] = v59;
      long long v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:1];
      [v60 setObject:v64 forKeyedSubscript:@"Bottom"];

      unint64_t v65 = [v10 resultTensors];
      char v66 = ANE_ValidateGOCUnit(v65, v60, 0);

      if (v66)
      {
        long long v57 = v90;
        [v90 addObject:v60];

        id v7 = v87;
        id v6 = v89;
        goto LABEL_24;
      }
      uint64_t v75 = +[MLCLog framework];
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithConvolutionLayer_cold_2();
      }

      long long v55 = 0;
      id v7 = v87;
      id v6 = v89;
    }
    else
    {
      char v67 = +[MLCLog framework];
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        ANE_CreateUnitsWithConvolutionLayer_cold_3(v67, v68, v69, v70, v71, v72, v73, v74);
      }

      long long v55 = 0;
    }
    id v9 = v90;
    goto LABEL_32;
  }
  uint64_t v47 = +[MLCLog framework];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    ANE_CreateUnitsWithConvolutionLayer_cold_1();
  }
  long long v55 = 0;
LABEL_33:

  return v55;
}

id ANE_CompileConvolutionLayer(void *a1, void *a2, void *a3)
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v5 objectAtIndexedSubscript:0];
  id v9 = [v7 parentLayers];
  id v10 = [v9 objectAtIndexedSubscript:0];

  id v11 = [v6 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 descriptor];
  uint64_t v13 = [v12 dimensionCount];

  int v14 = [v8 params];
  uint64_t v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v16 = [v14 convolutionParams];
  id v86 = (void *)[v16 mutableCopy];

  unint64_t v17 = [v14 biasParams];
  id v85 = (void *)[v17 mutableCopy];

  uint64_t v18 = [v14 neuronParams];
  uint64_t v19 = (void *)v18;
  if (v13 == 4)
  {
    uint64_t v46 = ANE_CreateUnitsWithConvolutionLayer(v10, v86, v85);
    if (v46)
    {
      uint64_t v47 = (void *)v46;
      uint64_t v82 = v19;
      [v15 addObjectsFromArray:v46];

      goto LABEL_25;
    }
    long long v55 = +[MLCLog framework];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      ANE_CompileConvolutionLayer_cold_4();
    }

    uint64_t v54 = 0;
  }
  else
  {
    uint64_t v83 = v11;
    if (v13 == 3)
    {
      uint64_t v80 = v14;
      uint64_t v20 = (void *)MEMORY[0x1E01B11E0]();
      id v87 = 0;
      id v88 = 0;
      BOOL v21 = +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:v10 reshapeUnits:&v88 reshapeResultTensors:&v87];
      id v22 = v88;
      id v76 = v87;
      uint64_t v78 = v22;
      uint64_t v82 = v19;
      if (v21)
      {
        uint64_t v75 = v20;
        uint64_t v23 = [v10 label];
        uint64_t v24 = objc_msgSend(v23, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v15, "count"));
        uint64_t v25 = [v22 objectAtIndexedSubscript:0];
        [v25 setObject:v24 forKeyedSubscript:@"Name"];

        uint64_t v26 = [v22 objectAtIndexedSubscript:0];
        [v15 addObject:v26];

        BOOL v27 = ANE_CreateUnitsWithConvolutionLayer(v10, v86, v85);
        uint64_t v28 = v27;
        if (v27)
        {
          uint64_t v71 = v8;
          id v72 = v7;
          id v73 = v6;
          id v74 = v5;
          if ([v27 count])
          {
            unint64_t v29 = 0;
            do
            {
              uint64_t v30 = [v28 objectAtIndexedSubscript:v29];
              uint64_t v31 = [v10 label];
              uint64_t v32 = objc_msgSend(v31, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v15, "count"));
              [v30 setObject:v32 forKeyedSubscript:@"Name"];

              uint64_t v33 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
              uint64_t v34 = [v33 objectForKeyedSubscript:@"Name"];
              v91[0] = v34;
              [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:1];
              v36 = uint64_t v35 = v10;
              [v30 setObject:v36 forKeyedSubscript:@"Bottom"];

              id v10 = v35;
              [v15 addObject:v30];

              ++v29;
            }
            while (v29 < [v28 count]);
          }
          unint64_t v37 = [v10 label];
          uint64_t v38 = objc_msgSend(v37, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v15, "count"));
          uint64_t v39 = [v78 objectAtIndexedSubscript:1];
          [v39 setObject:v38 forKeyedSubscript:@"Name"];

          long long v40 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
          long long v41 = [v40 objectForKeyedSubscript:@"Name"];
          id v90 = v41;
          id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v90 count:1];
          uint64_t v43 = [v78 objectAtIndexedSubscript:1];
          [v43 setObject:v42 forKeyedSubscript:@"Bottom"];

          char v44 = [v78 objectAtIndexedSubscript:1];
          [v15 addObject:v44];
          int v45 = 0;
          id v6 = v73;
          id v5 = v74;
          id v8 = v71;
          id v7 = v72;
        }
        else
        {
          char v44 = +[MLCLog framework];
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
            ANE_CompileConvolutionLayer_cold_4();
          }
          int v45 = 1;
        }
        uint64_t v20 = v75;
      }
      else
      {
        uint64_t v28 = +[MLCLog framework];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          ANE_CompileConvolutionLayer_cold_5();
        }
        int v45 = 1;
      }

      int v14 = v80;
      id v11 = v83;
      if (v45)
      {
LABEL_36:
        uint64_t v54 = 0;
        uint64_t v19 = v82;
        goto LABEL_37;
      }
LABEL_25:
      uint64_t v19 = v82;
      if (!v82)
      {
LABEL_29:
        uint64_t v54 = (void *)[v15 copy];
        goto LABEL_37;
      }
      id v84 = v11;
      long long v56 = [v10 fusedLayers];
      long long v57 = [v56 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        long long v59 = [v10 fusedLayers];
        long long v60 = [v59 objectAtIndexedSubscript:0];

        long long v61 = [v60 descriptor];
        int v79 = v60;
        long long v62 = ANE_CreateUnitsWithNeuronLayer(v60, v82, [v61 activationType]);

        if (v62)
        {
          uint64_t v77 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v15, "count") - 1);
          long long v63 = [v77 objectForKeyedSubscript:@"Name"];
          id v89 = v63;
          [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1];
          uint64_t v81 = v14;
          v65 = long long v64 = v8;
          [v62 objectAtIndexedSubscript:0];
          char v67 = v66 = v10;
          [v67 setObject:v65 forKeyedSubscript:@"Bottom"];

          id v10 = v66;
          id v8 = v64;
          int v14 = v81;

          [v15 addObjectsFromArray:v62];
          uint64_t v19 = v82;
          id v11 = v84;
          goto LABEL_29;
        }
        uint64_t v69 = +[MLCLog framework];
        id v11 = v84;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
          ANE_CompileConvolutionLayer_cold_2();
        }
      }
      else
      {
        uint64_t v68 = +[MLCLog framework];
        id v11 = v84;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          ANE_CompileConvolutionLayer_cold_3(v10);
        }
      }
      goto LABEL_36;
    }
    id v48 = v8;
    id v49 = v7;
    id v50 = v6;
    id v51 = v5;
    int v52 = (void *)v18;
    long long v53 = +[MLCLog framework];
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      ANE_CompileConvolutionLayer_cold_1();
    }

    uint64_t v54 = 0;
    uint64_t v19 = v52;
    id v5 = v51;
    id v6 = v50;
    id v7 = v49;
    id v8 = v48;
    id v11 = v83;
  }
LABEL_37:

  return v54;
}

id ANE_CreateSelectionLayer()
{
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v1 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v11[0] = kMLCANENetUnitType[0];
  v11[1] = @"Type";
  v12[0] = @"ElementWise";
  v12[1] = @"Mult";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v3 = (void *)[v2 mutableCopy];

  [v1 addObject:v3];
  [v1 addObject:v3];
  int v4 = (void *)[v3 mutableCopy];

  [v4 setObject:@"EqualZero" forKeyedSubscript:@"Type"];
  [v1 addObject:v4];
  id v5 = (void *)[v4 mutableCopy];

  [v5 setObject:@"Add" forKeyedSubscript:@"Type"];
  [v1 addObject:v5];
  id v6 = (void *)[v0 mutableCopy];
  id v7 = +[_MLCANEArithmeticParameters arithmeticUnitParametersWith:v1];
  id v8 = +[MLCANEDeviceOps deviceOpsWithType:35 params:v7];
  if (v8) {
    [v6 addObject:v8];
  }
  id v9 = (void *)[v6 copy];

  return v9;
}

id ANE_CompileSelectionLayer(void *a1, void *a2, void *a3)
{
  v195[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 objectAtIndexedSubscript:0];
  id v8 = [v7 params];

  id v9 = [v8 arithmeticParams];
  if ([v9 count] != 4)
  {
    id v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      ANE_CompileSelectionLayer_cold_8(v11, v88, v89, v90, v91, v92, v93, v94);
    }
    id v95 = 0;
    goto LABEL_71;
  }
  int v171 = v9;
  v168 = v8;
  id v10 = [v6 parentLayers];
  id v11 = [v10 objectAtIndexedSubscript:0];

  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  id v175 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v174 = (void *)[v12 mutableCopy];
  id v177 = 0;
  id v169 = v6;
  ANE_GetTensor4DShapeWithOnePrepended(v6, &v177);
  id v172 = v5;
  id v173 = v177;
  if (![v5 count])
  {
LABEL_10:
    id v22 = [v5 objectAtIndexedSubscript:0];
    v176[0] = 1;
    ANE_GetTensorFeatureChannelsWithOnePrepended(v22, v176);
    uint64_t v23 = [v5 objectAtIndexedSubscript:1];
    uint64_t v24 = [v5 objectAtIndexedSubscript:2];
    uint64_t v25 = [v22 descriptor];
    uint64_t v26 = ANE_GetANECIRDataTypeWithMLCDataType([v25 dataType]);

    v165 = v23;
    BOOL v27 = [v23 descriptor];
    uint64_t v28 = ANE_GetANECIRDataTypeWithMLCDataType([v27 dataType]);

    v166 = v24;
    unint64_t v29 = [v24 descriptor];
    uint64_t v30 = ANE_GetANECIRDataTypeWithMLCDataType([v29 dataType]);

    v162 = (void *)v26;
    v163 = (void *)v30;
    v164 = (void *)v28;
    if (!v26 || !v28 || !v30)
    {
      long long v96 = +[MLCLog framework];
      long long v104 = v175;
      v167 = v96;
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
        ANE_CompileSelectionLayer_cold_1(v96, v97, v98, v99, v100, v101, v102, v103);
      }
      id v95 = 0;
      id v5 = v172;
      id v8 = v168;
      id v6 = v169;
      goto LABEL_69;
    }
    uint64_t v31 = [v9 objectAtIndexedSubscript:0];
    uint64_t v32 = +[_MLCANEPlistBuilder createUnitWithLayer:v11 unitParams:v31];

    uint64_t v33 = [v9 objectAtIndexedSubscript:1];
    uint64_t v161 = +[_MLCANEPlistBuilder createUnitWithLayer:v11 unitParams:v33];

    uint64_t v34 = [v9 objectAtIndexedSubscript:2];
    uint64_t v35 = +[_MLCANEPlistBuilder createUnitWithLayer:v11 unitParams:v34];

    unint64_t v36 = [v9 objectAtIndexedSubscript:3];
    v159 = +[_MLCANEPlistBuilder createUnitWithLayer:v11 unitParams:v36];

    unint64_t v37 = [v11 label];
    uint64_t v38 = objc_msgSend(v37, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v175, "count"));
    [v35 setObject:v38 forKeyedSubscript:@"Name"];

    uint64_t v39 = [v22 label];
    v195[0] = v39;
    uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v195 count:1];
    [v35 setObject:v40 forKeyedSubscript:@"Bottom"];

    long long v41 = [NSNumber numberWithUnsignedInteger:v176[0]];
    [v35 setObject:v41 forKeyedSubscript:@"OutputChannels"];

    uint64_t v194 = v26;
    id v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v194 count:1];
    [v35 setObject:v42 forKeyedSubscript:@"InputType"];

    [v35 setObject:v26 forKeyedSubscript:@"OutputType"];
    v193 = v22;
    uint64_t v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1];
    LOBYTE(v40) = ANE_ValidateElementWiseUnit(v43, v35, 1);

    char v44 = v22;
    v167 = v32;
    v160 = v35;
    if ((v40 & 1) == 0)
    {
      id v85 = +[MLCLog framework];
      id v8 = v168;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
        ANE_CompileSelectionLayer_cold_2();
      }
      id v95 = 0;
      id v6 = v169;
      id v9 = v171;
      id v5 = v172;
      goto LABEL_68;
    }
    [v175 addObject:v35];
    uint64_t v45 = [v175 count];
    uint64_t v46 = [v11 label];
    uint64_t v47 = objc_msgSend(v46, "stringByAppendingFormat:", @"_%lu", v45);
    id v48 = v32;
    [v32 setObject:v47 forKeyedSubscript:@"Name"];

    id v49 = [v165 label];
    v192[0] = v49;
    id v50 = [v22 label];
    v192[1] = v50;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:2];
    int v52 = v51 = v26;
    v156 = v22;
    long long v53 = (void *)[v52 mutableCopy];
    [v48 setObject:v53 forKeyedSubscript:@"Bottom"];

    v191[0] = v164;
    v191[1] = v51;
    uint64_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:2];
    long long v55 = (void *)[v54 mutableCopy];
    [v48 setObject:v55 forKeyedSubscript:@"InputType"];

    long long v56 = [v11 label];
    uint64_t v57 = v45 + 2;
    long long v58 = objc_msgSend(v56, "stringByAppendingFormat:", @"_%lu", v45 + 1);
    [v161 setObject:v58 forKeyedSubscript:@"Name"];

    long long v59 = [v160 objectForKeyedSubscript:@"Name"];
    v190[0] = v59;
    long long v60 = [v166 label];
    v190[1] = v60;
    long long v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:2];
    long long v62 = (void *)[v61 mutableCopy];
    [v161 setObject:v62 forKeyedSubscript:@"Bottom"];

    long long v63 = [v160 objectForKeyedSubscript:@"OutputType"];
    v189[0] = v63;
    v189[1] = v163;
    long long v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:2];
    unint64_t v65 = (void *)[v64 mutableCopy];
    [v161 setObject:v65 forKeyedSubscript:@"InputType"];

    char v66 = [v11 label];
    uint64_t v146 = v57;
    id v22 = v44;
    char v67 = objc_msgSend(v66, "stringByAppendingFormat:", @"_%lu", v146);
    [v159 setObject:v67 forKeyedSubscript:@"Name"];

    uint64_t v68 = [v167 objectForKeyedSubscript:@"Name"];
    v188[0] = v68;
    uint64_t v69 = [v161 objectForKeyedSubscript:@"Name"];
    v188[1] = v69;
    uint64_t v70 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:2];
    [v159 setObject:v70 forKeyedSubscript:@"Bottom"];

    uint64_t v71 = [v167 objectForKeyedSubscript:@"OutputType"];
    v187[0] = v71;
    id v72 = [v161 objectForKeyedSubscript:@"OutputType"];
    v187[1] = v72;
    id v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v187 count:2];
    [v159 setObject:v73 forKeyedSubscript:@"InputType"];

    v186[0] = v165;
    v186[1] = v44;
    id v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v186 count:2];
    v157 = [v74 mutableCopy];

    v185[0] = v44;
    v185[1] = v166;
    uint64_t v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:2];
    v158 = (void *)[v75 mutableCopy];

    v184[0] = v165;
    v184[1] = v166;
    id v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:2];
    uint64_t v77 = [v13 objectAtIndexedSubscript:0];
    id v9 = v171;
    if ([v77 BOOLValue])
    {
      uint64_t v78 = [v13 objectAtIndexedSubscript:1];
      if ([v78 BOOLValue])
      {
        int v79 = [v13 objectAtIndexedSubscript:2];
        int v80 = [v79 BOOLValue];

        if (v80)
        {
          v148 = [v175 objectAtIndexedSubscript:0];
          v151 = v76;
          uint64_t v81 = [v175 objectAtIndexedSubscript:1];
          v147 = [v175 objectAtIndexedSubscript:2];
          uint64_t v82 = [v174 objectAtIndexedSubscript:0];
          uint64_t v83 = [v174 objectAtIndexedSubscript:1];
          id v84 = [v174 objectAtIndexedSubscript:2];
          v155 = v81;
          id v85 = v157;
          ANE_ConnectBroadcastUnitForSource0(v81, v83, v167, v157);
          id v86 = v148;
          ANE_ConnectBroadcastUnitForMask(v148, v82, v167, v160, v161, v157, v158, v175);
          ANE_ConnectBroadcastUnitForSource1(v147, v84, v161, v158);
          v183[0] = v83;
          v183[1] = v84;
          uint64_t v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:2];

          id v76 = (void *)v87;
          id v22 = v156;
          id v8 = v168;
          id v6 = v169;
          goto LABEL_51;
        }
LABEL_35:
        long long v113 = [v13 objectAtIndexedSubscript:0];
        if ([v113 BOOLValue])
        {
          long long v114 = [v13 objectAtIndexedSubscript:1];
          int v115 = [v114 BOOLValue];

          id v6 = v169;
          if (v115)
          {
            v149 = [v175 objectAtIndexedSubscript:0];
            v152 = v76;
            long long v116 = [v175 objectAtIndexedSubscript:1];
            long long v117 = [v174 objectAtIndexedSubscript:0];
            long long v118 = [v174 objectAtIndexedSubscript:1];
            v155 = v116;
            id v85 = v157;
            ANE_ConnectBroadcastUnitForSource0(v116, v118, v167, v157);
            ANE_ConnectBroadcastUnitForMask(v149, v117, v167, v160, v161, v157, v158, v175);
            v182[0] = v118;
            v182[1] = v166;
            uint64_t v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:2];

            id v86 = v149;
LABEL_42:
            id v76 = (void *)v119;
            goto LABEL_50;
          }
        }
        else
        {

          id v6 = v169;
        }
        v120 = [v13 objectAtIndexedSubscript:1];
        if ([v120 BOOLValue])
        {
          uint64_t v121 = [v13 objectAtIndexedSubscript:2];
          int v122 = [v121 BOOLValue];

          if (v122)
          {
            [v175 objectAtIndexedSubscript:0];
            v123 = v153 = v76;
            v124 = [v175 objectAtIndexedSubscript:1];
            v125 = [v174 objectAtIndexedSubscript:0];
            v126 = [v174 objectAtIndexedSubscript:1];
            ANE_ConnectBroadcastUnitForSource0(v123, v125, v167, v157);
            v155 = v124;
            ANE_ConnectBroadcastUnitForSource1(v124, v126, v161, v158);
            v181[0] = v125;
            v181[1] = v126;
            id v85 = v157;
            uint64_t v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:v181 count:2];

            id v86 = v123;
            goto LABEL_42;
          }
        }
        else
        {
        }
        uint64_t v127 = [v13 objectAtIndexedSubscript:0];
        if ([v127 BOOLValue])
        {
          v128 = [v13 objectAtIndexedSubscript:2];
          int v129 = [v128 BOOLValue];

          if (v129)
          {
            v150 = [v175 objectAtIndexedSubscript:0];
            v154 = v76;
            __int16 v130 = [v175 objectAtIndexedSubscript:1];
            uint64_t v170 = [v174 objectAtIndexedSubscript:0];
            int v131 = [v174 objectAtIndexedSubscript:1];
            id v85 = v157;
            ANE_ConnectBroadcastUnitForMask(v150, v170, v167, v160, v161, v157, v158, v175);
            v155 = v130;
            ANE_ConnectBroadcastUnitForSource1(v130, v131, v161, v158);
            v180[0] = v165;
            v180[1] = v131;
            id v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:v180 count:2];

            id v86 = v150;
            goto LABEL_50;
          }
        }
        else
        {
        }
        uint64_t v132 = [v13 objectAtIndexedSubscript:0];
        int v133 = [v132 BOOLValue];

        if (!v133)
        {
          int v136 = [v13 objectAtIndexedSubscript:1];
          int v137 = [v136 BOOLValue];

          id v8 = v168;
          id v85 = v157;
          if (v137)
          {
            id v86 = [v175 objectAtIndexedSubscript:0];
            int v138 = [v174 objectAtIndexedSubscript:0];
            ANE_ConnectBroadcastUnitForSource0(v86, v138, v167, v157);
            v155 = v138;
            v179[0] = v138;
            v179[1] = v166;
            int v139 = (void *)MEMORY[0x1E4F1C978];
            int v140 = v179;
          }
          else
          {
            v142 = [v13 objectAtIndexedSubscript:2];
            int v143 = [v142 BOOLValue];

            if (!v143)
            {
LABEL_52:
              id v5 = v172;
              if ((ANE_ValidateElementWiseUnit(v85, v167, 1) & 1) == 0)
              {
                int v134 = +[MLCLog framework];
                if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
                  ANE_CompileSelectionLayer_cold_2();
                }

                id v95 = 0;
                goto LABEL_67;
              }
              [v175 addObject:v167];
              if (ANE_ValidateElementWiseUnit(v158, v161, 1))
              {
                [v175 addObject:v161];
                if (ANE_ValidateElementWiseUnit(v76, v159, 1))
                {
                  [v175 addObject:v159];
                  id v95 = (void *)[v175 copy];
LABEL_66:
                  id v85 = v157;
LABEL_67:

LABEL_68:
                  long long v104 = v175;
LABEL_69:

                  goto LABEL_70;
                }
                int v135 = +[MLCLog framework];
                if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_64;
                }
              }
              else
              {
                int v135 = +[MLCLog framework];
                if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
LABEL_64:
                }
                  ANE_CompileSelectionLayer_cold_2();
              }

              id v95 = 0;
              goto LABEL_66;
            }
            id v86 = [v175 objectAtIndexedSubscript:0];
            v144 = [v174 objectAtIndexedSubscript:0];
            ANE_ConnectBroadcastUnitForSource1(v86, v144, v161, v158);
            v178[0] = v165;
            v178[1] = v144;
            v155 = v144;
            int v139 = (void *)MEMORY[0x1E4F1C978];
            int v140 = v178;
          }
          uint64_t v145 = [v139 arrayWithObjects:v140 count:2];

          id v76 = (void *)v145;
LABEL_51:

          goto LABEL_52;
        }
        id v86 = [v175 objectAtIndexedSubscript:0];
        v155 = [v174 objectAtIndexedSubscript:0];
        id v85 = v157;
        ANE_ConnectBroadcastUnitForMask(v86, v155, v167, v160, v161, v157, v158, v175);
LABEL_50:
        id v8 = v168;
        goto LABEL_51;
      }
    }
    goto LABEL_35;
  }
  unint64_t v14 = 0;
  while (1)
  {
    [v5 objectAtIndexedSubscript:v14];
    v176[1] = 0;
    uint64_t v15 = v176[2] = 0;
    uint64_t v16 = v11;
    int v17 = +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:](_MLCANEPlistBuilder, "createBroadcastUnitWithSourceTensor:targetShape:layer:broadcastUnit:broadcastResultTensor:");
    id v18 = 0;
    id v19 = 0;
    if (v17 == 2) {
      break;
    }
    if (v17 != 1)
    {
      long long v105 = +[MLCLog framework];
      if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
        ANE_CompileSelectionLayer_cold_6(v17, v105);
      }
      goto LABEL_32;
    }
    [v13 setObject:MEMORY[0x1E4F1CC28] atIndexedSubscript:v14];
LABEL_9:

    ++v14;
    id v11 = v16;
    if (v14 >= [v5 count]) {
      goto LABEL_10;
    }
  }
  if (v18)
  {
    [v13 setObject:MEMORY[0x1E4F1CC38] atIndexedSubscript:v14];
    uint64_t v20 = [v16 label];
    BOOL v21 = objc_msgSend(v20, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v175, "count"));
    [v18 setObject:v21 forKeyedSubscript:@"Name"];

    id v5 = v172;
    [v175 addObject:v18];
    [v174 addObject:v19];
    goto LABEL_9;
  }
  long long v105 = +[MLCLog framework];
  if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
    ANE_CompileSelectionLayer_cold_7(v105, v106, v107, v108, v109, v110, v111, v112);
  }
  id v18 = 0;
LABEL_32:

  id v95 = 0;
  id v8 = v168;
  id v11 = v16;
  long long v104 = v175;
  id v22 = v15;
LABEL_70:

LABEL_71:

  return v95;
}

void ANE_ConnectBroadcastUnitForSource0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v14 = a2;
  id v9 = a1;
  id v10 = [v9 objectForKeyedSubscript:@"Name"];
  id v11 = [v8 objectForKeyedSubscript:@"Bottom"];
  [v11 setObject:v10 atIndexedSubscript:0];

  uint64_t v12 = [v9 objectForKeyedSubscript:@"OutputType"];

  uint64_t v13 = [v8 objectForKeyedSubscript:@"InputType"];

  [v13 setObject:v12 atIndexedSubscript:0];
  [v7 setObject:v14 atIndexedSubscript:0];
}

void ANE_ConnectBroadcastUnitForMask(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v15 = a1;
  id v16 = a2;
  id v17 = a8;
  id v36 = a7;
  id v34 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  BOOL v21 = (void *)[v15 mutableCopy];
  id v22 = v16;
  uint64_t v23 = [v15 objectForKeyedSubscript:@"Name"];
  uint64_t v35 = [v23 stringByAppendingString:@"_copy"];

  [v21 setObject:v35 forKeyedSubscript:@"Name"];
  uint64_t v24 = [v19 objectForKeyedSubscript:@"Name"];

  v37[0] = v24;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v21 setObject:v25 forKeyedSubscript:@"Bottom"];

  [v17 addObject:v21];
  uint64_t v26 = [v15 objectForKeyedSubscript:@"Name"];
  BOOL v27 = [v20 objectForKeyedSubscript:@"Bottom"];
  [v27 setObject:v26 atIndexedSubscript:1];

  uint64_t v28 = [v15 objectForKeyedSubscript:@"OutputType"];
  unint64_t v29 = [v20 objectForKeyedSubscript:@"InputType"];

  [v29 setObject:v28 atIndexedSubscript:1];
  [v34 setObject:v22 atIndexedSubscript:1];

  uint64_t v30 = [v21 objectForKeyedSubscript:@"Name"];
  uint64_t v31 = [v18 objectForKeyedSubscript:@"Bottom"];
  [v31 setObject:v30 atIndexedSubscript:0];

  uint64_t v32 = [v21 objectForKeyedSubscript:@"OutputType"];
  uint64_t v33 = [v18 objectForKeyedSubscript:@"InputType"];

  [v33 setObject:v32 atIndexedSubscript:0];
  [v36 setObject:v22 atIndexedSubscript:0];
}

void ANE_ConnectBroadcastUnitForSource1(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v14 = a2;
  id v9 = a1;
  id v10 = [v9 objectForKeyedSubscript:@"Name"];
  id v11 = [v8 objectForKeyedSubscript:@"Bottom"];
  [v11 setObject:v10 atIndexedSubscript:1];

  uint64_t v12 = [v9 objectForKeyedSubscript:@"OutputType"];

  uint64_t v13 = [v8 objectForKeyedSubscript:@"InputType"];

  [v13 setObject:v12 atIndexedSubscript:1];
  [v7 setObject:v14 atIndexedSubscript:1];
}

unint64_t *hashCombine_1(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 8;
  do
  {
    id v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *uint64_t result = v9;
  return result;
}

id softLinkClass_ANEDeviceInfo_0()
{
  if (softLinkClass_ANEDeviceInfo_onceToken_0 != -1) {
    dispatch_once(&softLinkClass_ANEDeviceInfo_onceToken_0, &__block_literal_global_195);
  }
  uint64_t v0 = (void *)softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo_0;

  return v0;
}

uint64_t VerifyTensorBeforeRead(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 deviceMemory];
  uint64_t v3 = [v2 count];

  if (!v3)
  {
    id v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      VerifyTensorBeforeRead_cold_1();
    }
    goto LABEL_10;
  }
  int v4 = [v1 deviceMemory];
  id v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v1, "deviceIndex"));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      VerifyTensorBeforeRead_cold_3(v8);
    }
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_15;
  }
  id v7 = [v1 deviceMemory];
  id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v1, "deviceIndex"));

  unint64_t v9 = [v8 liveIOStatus];
  uint64_t v10 = v9;
  if (v9 && [v9 count])
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v12 = +[MLCLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      VerifyTensorBeforeRead_cold_2();
    }

    uint64_t v11 = 0;
  }

LABEL_15:
  return v11;
}

id softLinkClass_ANERequest()
{
  if (softLinkClass_ANERequest_onceToken != -1) {
    dispatch_once(&softLinkClass_ANERequest_onceToken, &__block_literal_global_219);
  }
  uint64_t v0 = (void *)softLinkClass_ANERequest_softLinkClass_ANERequest;

  return v0;
}

id softLinkClass_ANEQoSMapper()
{
  if (softLinkClass_ANEQoSMapper_onceToken != -1) {
    dispatch_once(&softLinkClass_ANEQoSMapper_onceToken, &__block_literal_global_222);
  }
  uint64_t v0 = (void *)softLinkClass_ANEQoSMapper_softLinkClass_ANEQoSMapper;

  return v0;
}

id softLinkClass_ANEInMemoryModelDescriptor()
{
  if (softLinkClass_ANEInMemoryModelDescriptor_onceToken != -1) {
    dispatch_once(&softLinkClass_ANEInMemoryModelDescriptor_onceToken, &__block_literal_global_225);
  }
  uint64_t v0 = (void *)softLinkClass_ANEInMemoryModelDescriptor_softLinkClass_ANEInMemoryModelDescriptor;

  return v0;
}

id softLinkClass_ANEInMemoryModel()
{
  if (softLinkClass_ANEInMemoryModel_onceToken != -1) {
    dispatch_once(&softLinkClass_ANEInMemoryModel_onceToken, &__block_literal_global_228);
  }
  uint64_t v0 = (void *)softLinkClass_ANEInMemoryModel_softLinkClass_ANEInMemoryModel;

  return v0;
}

void *__AppleNeuralEngineLibrary_block_invoke_1()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/AppleNeuralEngine.framework/AppleNeuralEngine", 1);
  AppleNeuralEngineLibrary_frameworkLibrary_1 = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelDescriptionKey_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  uint64_t result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelDescriptionKey");
  softLinkObjcConstantkANEFModelDescriptionKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  uint64_t result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelProcedureNameToIDMapKey");
  softLinkObjcConstantkANEFModelProcedureNameToIDMapKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelProceduresArrayKey_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  uint64_t result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelProceduresArrayKey");
  softLinkObjcConstantkANEFModelProceduresArrayKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  uint64_t result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelInputSymbolIndexArrayKey");
  softLinkObjcConstantkANEFModelInputSymbolIndexArrayKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelInputSymbolsArrayKey_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  uint64_t result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelInputSymbolsArrayKey");
  softLinkObjcConstantkANEFModelInputSymbolsArrayKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  uint64_t result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelOutputSymbolIndexArrayKey");
  softLinkObjcConstantkANEFModelOutputSymbolIndexArrayKey_constant = (uint64_t)result;
  return result;
}

void *__softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_1 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_1, &__block_literal_global_189);
  }
  uint64_t result = dlsym((void *)AppleNeuralEngineLibrary_frameworkLibrary_1, "kANEFModelOutputSymbolsArrayKey");
  softLinkObjcConstantkANEFModelOutputSymbolsArrayKey_constant = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1, uint64_t a2)
{
  return a2;
}

id createMatrices(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6, void *a7)
{
  id v12 = a5;
  id v13 = a7;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1];
  if (a1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 4 * a1 * a3;
    uint64_t v17 = a1 - 1;
    do
    {
      uint64_t v18 = a2;
      if (v12)
      {
        if (a6) {
          uint64_t v19 = v17;
        }
        else {
          uint64_t v19 = v15;
        }
        id v20 = [v12 objectAtIndexedSubscript:v19];
        uint64_t v18 = [v20 unsignedIntegerValue];
      }
      BOOL v21 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v18 columns:a4 rowBytes:v16 dataType:268435488];
      id v22 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v13 descriptor:v21];
      [v14 addObject:v22];

      ++v15;
      --v17;
    }
    while (v17 != -1);
  }
  uint64_t v23 = (void *)[v14 copy];

  return v23;
}

void copyNC1TtoNTCMTLBuffer(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v24 = a1;
  id v13 = a2;
  id v26 = a6;
  id v25 = a7;
  context = (void *)MEMORY[0x1E01B11E0]();
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F35628]) initWithDevice:v13 count:a3];
  id v22 = (void *)[objc_alloc(MEMORY[0x1E4F35620]) initWithDevice:v13 copyRows:a4 copyColumns:a5 sourcesAreTransposed:0 destinationsAreTransposed:1];
  uint64_t v15 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:a4 columns:a5 rowBytes:4 * a5 dataType:268435488];
  uint64_t v16 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:a5 columns:a4 rowBytes:4 * a4 dataType:268435488];
  if (a3)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 4 * a5 * a4;
    do
    {
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v26 offset:v17 descriptor:v15];
      BOOL v21 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v25 offset:v17 descriptor:v16];
      objc_msgSend(v14, "setCopyOperationAtIndex:sourceMatrix:destinationMatrix:offsets:", v18, v20, v21, 0, 0);

      ++v18;
      v17 += v19;
    }
    while (a3 != v18);
  }
  [v22 encodeToCommandBuffer:v24 copyDescriptor:v14];
}

id createMatricesForTNCBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v22 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1];
  if (a1)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 4 * a3;
    uint64_t v15 = 4 * a3 * a2;
    do
    {
      uint64_t v16 = a2;
      if (v9)
      {
        uint64_t v17 = [v9 objectAtIndexedSubscript:v13];
        uint64_t v16 = [v17 unsignedIntegerValue];
      }
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:rowBytes:dataType:", v16, v22, v14, 268435488, v22);
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v10 offset:v12 descriptor:v18];
      [v11 addObject:v19];

      ++v13;
      v12 += v15;
    }
    while (a1 != v13);
  }
  id v20 = objc_msgSend(v11, "copy", v22);

  return v20;
}

id createTemporaryMatrixViews(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v8 = a1;
  id v26 = a2;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
  if (a4)
  {
    uint64_t v10 = a4;
    uint64_t v11 = 0;
    uint64_t v22 = 4 * a4 * a6;
    do
    {
      uint64_t v12 = [v8 descriptor];
      uint64_t v13 = [v12 batchSizePerSequenceStep];
      uint64_t v14 = a5;
      if (v13)
      {
        uint64_t v15 = [v8 descriptor];
        uint64_t v16 = [v15 batchSizePerSequenceStep];
        uint64_t v17 = [v16 objectAtIndexedSubscript:v11];
        uint64_t v14 = [v17 unsignedIntegerValue];
      }
      uint64_t v18 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v14 columns:a6 rowBytes:v22 dataType:268435488];
      uint64_t v19 = [MEMORY[0x1E4F35980] temporaryMatrixWithCommandBuffer:v26 matrixDescriptor:v18];
      objc_msgSend(v19, "setReadCount:", objc_msgSend(v19, "readCount") + a3);
      [v9 addObject:v19];

      ++v11;
    }
    while (v10 != v11);
  }
  id v20 = (void *)[v9 copy];

  return v20;
}

id createMatricesForTNCBufferNoOffset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a1];
  if (a1)
  {
    uint64_t v14 = 4 * a3;
    uint64_t v15 = a1 - 1;
    do
    {
      uint64_t v16 = a2;
      if (v11)
      {
        uint64_t v17 = [v11 objectAtIndexedSubscript:v15];
        uint64_t v16 = [v17 unsignedIntegerValue];
      }
      uint64_t v18 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v16 columns:a4 rowBytes:v14 dataType:268435488];
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v12 descriptor:v18];
      [v13 addObject:v19];

      --v15;
    }
    while (v15 != -1);
  }
  id v20 = (void *)[v13 copy];

  return v20;
}

void GPU_AllocateResourceForMultiGPUTraining(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = [v7 deviceList];
  unint64_t v11 = [v10 count];

  long long v58 = v7;
  if (v11 > 1)
  {
    uint64_t v14 = [v7 deviceList];
    id v12 = [v14 objectAtIndexedSubscript:a4];

    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
    long long v56 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    unint64_t v65 = (void *)[v15 mutableCopy];
    long long v64 = (void *)[v15 mutableCopy];
    long long v63 = (void *)[v15 mutableCopy];
    uint64_t v57 = v8;
    uint64_t v16 = [v8 rnnTrainableWeightGradients];
    uint64_t v67 = [v16 count];
    long long v60 = v9;
    long long v61 = v16;
    if (v67) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = v9;
    }
    uint64_t v59 = [v17 count];
    if (!v59)
    {
LABEL_33:
      uint64_t v51 = (void *)[v56 copy];
      uint64_t v13 = v57;
      [v57 setRemoteGradientBuffers:v51];

      int v52 = (void *)[v65 copy];
      [v57 setLocalGradientMatrices:v52];

      long long v53 = (void *)[v64 copy];
      [v57 setReceivedGradientMatrices:v53];

      uint64_t v54 = (void *)[v63 copy];
      [v57 setMatrixSumKernels:v54];

      long long v55 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      [v57 setAllReducedGradientMatrices:v55];

      [v57 setMultiGPUReduction:1];
      id v9 = v60;
      goto LABEL_34;
    }
    uint64_t v18 = 0;
    uint64_t v62 = 0;
    while (v67)
    {
      uint64_t v19 = [v61 objectAtIndexedSubscript:v62];
      uint64_t v20 = [v19 count];

      uint64_t v66 = v20;
      if (v20) {
        goto LABEL_15;
      }
LABEL_12:
      if (++v62 == v59) {
        goto LABEL_33;
      }
    }
    uint64_t v66 = 1;
LABEL_15:
    uint64_t v21 = 0;
    do
    {
      if (!v67)
      {
        uint64_t v23 = [v60 objectAtIndexedSubscript:v18];
        id v36 = [v23 descriptor];
        uint64_t v25 = [v36 tensorAllocationSizeInBytes];

        unint64_t v37 = [v23 descriptor];
        uint64_t v38 = [v37 shape];
        uint64_t v39 = [v38 count];

        if (v39)
        {
          unint64_t v40 = 0;
          uint64_t v26 = 1;
          do
          {
            long long v41 = [v23 descriptor];
            id v42 = [v41 shape];
            uint64_t v43 = [v42 objectAtIndexedSubscript:v40];
            v26 *= [v43 unsignedIntegerValue];

            ++v40;
            char v44 = [v23 descriptor];
            uint64_t v45 = [v44 shape];
            unint64_t v46 = [v45 count];
          }
          while (v40 < v46);
        }
        else
        {
          uint64_t v26 = 1;
        }
        uint64_t v47 = [v23 descriptor];
        int v48 = [v47 dataType];

        int v49 = v48 - 1;
        uint64_t v27 = 1;
        uint64_t v28 = v26;
        uint64_t v29 = 1073741832;
        switch(v49)
        {
          case 0:
            uint64_t v28 = 4 * v26;
            goto LABEL_31;
          case 2:
            uint64_t v28 = 2 * v26;
            uint64_t v29 = 268435472;
            uint64_t v27 = 1;
            goto LABEL_19;
          case 3:
          case 5:
            goto LABEL_19;
          default:
            id v50 = +[MLCLog framework];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
              GPU_AllocateResourceForMultiGPUTraining_cold_2(&buf, v69, v50);
            }

            uint64_t v28 = 0;
LABEL_31:
            uint64_t v27 = 1;
            goto LABEL_18;
        }
      }
      uint64_t v22 = [v61 objectAtIndexedSubscript:v62];
      uint64_t v23 = [v22 objectAtIndexedSubscript:v21];

      id v24 = [v23 data];
      uint64_t v25 = [v24 allocatedSize];
      uint64_t v26 = [v23 columns];
      uint64_t v27 = [v23 rows];
      uint64_t v28 = [v23 rowBytes];

LABEL_18:
      uint64_t v29 = 268435488;
LABEL_19:

      uint64_t v30 = (void *)[v12 newBufferWithLength:v25 options:32];
      uint64_t v31 = (void *)[v12 newBufferWithLength:v25 options:+[MLCGPUHelper mtlResourceOptions]];
      uint64_t v32 = [MEMORY[0x1E4F35640] matrixDescriptorWithRows:v27 columns:v26 rowBytes:v28 dataType:v29];
      uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v30 descriptor:v32];
      id v34 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v31 descriptor:v32];
      uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F35688]) initWithDevice:v12 count:2 rows:v27 columns:v26 transpose:0];
      [v65 setObject:v33 atIndexedSubscript:v18];
      [v64 setObject:v34 atIndexedSubscript:v18];
      [v63 setObject:v35 atIndexedSubscript:v18++];

      ++v21;
    }
    while (v21 != v66);
    goto LABEL_12;
  }
  id v12 = +[MLCLog framework];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    GPU_AllocateResourceForMultiGPUTraining_cold_1(v58, v12);
  }
  uint64_t v13 = v8;
LABEL_34:
}

id GPU_AllocateMemoryForMomentum(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  unint64_t v7 = [v5 length];
  unint64_t v8 = v7;
  char v9 = 1;
  if (a3 != 268435472) {
    char v9 = 2;
  }
  unint64_t v10 = v7 >> v9;
  id v11 = v5;
  uint64_t v12 = [v11 bytes];

  uint64_t v13 = objc_msgSend(v6, "newBufferWithBytes:length:options:", v12, v8, +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
  uint64_t v14 = [MEMORY[0x1E4F35998] vectorDescriptorWithLength:v10 dataType:a3];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F35990]) initWithBuffer:v13 descriptor:v14];

  return v15;
}

void rotateWeightsTensorBy180Degree(void *a1, void *a2, void *a3)
{
  id v21 = a1;
  id v5 = a3;
  uint64_t v6 = [a2 bytes];
  id v7 = v5;
  uint64_t v8 = [v7 bytes];
  unint64_t v9 = 1;
  unint64_t v10 = [v21 objectAtIndexedSubscript:1];
  unint64_t v11 = [v10 unsignedIntegerValue];

  if ([v21 count] != 2)
  {
    if ([v21 count] == 3)
    {
      uint64_t v12 = [v21 objectAtIndexedSubscript:2];
      uint64_t v13 = [v12 unsignedIntegerValue];
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v15 = [v21 objectAtIndexedSubscript:3];
      uint64_t v13 = [v15 unsignedIntegerValue];

      uint64_t v12 = [v21 objectAtIndexedSubscript:2];
      uint64_t v14 = [v12 unsignedIntegerValue];
    }

    unint64_t v9 = v14 * v13;
  }
  if (v11)
  {
    LODWORD(v16) = 0;
    uint64_t v17 = 0;
    do
    {
      if (v9)
      {
        uint64_t v18 = 0;
        unsigned int v19 = 1;
        do
        {
          *(_DWORD *)(v8 + 4 * (v18 + v17)) = *(_DWORD *)(v6 + 4 * (v17 + v9 + ~v18));
          uint64_t v18 = v19;
        }
        while (v9 > v19++);
      }
      unint64_t v16 = (v16 + 1);
      v17 += v9;
    }
    while (v11 > v16);
  }
}

void GPU_SetPaddingPolicyForLayer(void *a1, void *a2, int a3, uint64_t a4, uint64_t a5)
{
  id v21 = a1;
  id v9 = a2;
  unint64_t v10 = [v21 deviceList];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = [v9 objectAtIndexedSubscript:v12];
      uint64_t v14 = [v13 forwardKernel];
      if (a3 == 1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = +[_MLCGPUConvolutionTransposePadding convolutionTransposeZeroPaddingWithTopAmount:0 bottomAmount:0 leftAmount:0 rightAmount:0 outputPaddingX:0 outputPaddingY:0];
          [v14 setPadding:v20];

          break;
        }
        uint64_t v16 = 1;
      }
      else
      {
        if (a3 == 2)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            +[_MLCGPUConvolutionTransposePadding convolutionTransposeZeroPaddingWithTopAmount:a5 bottomAmount:a5 leftAmount:a4 rightAmount:a4 outputPaddingX:0 outputPaddingY:0];
          }
          else {
          uint64_t v15 = [MEMORY[0x1E4F35900] zeroPaddingWithTopAmount:a5 bottomAmount:a5 leftAmount:a4 rightAmount:a4];
          }
          goto LABEL_13;
        }
        uint64_t v16 = 28;
      }
      uint64_t v15 = [MEMORY[0x1E4F35900] paddingWithMethod:v16];
LABEL_13:
      uint64_t v17 = (void *)v15;
      [v14 setPadding:v15];

      ++v12;
      uint64_t v18 = [v21 deviceList];
      unint64_t v19 = [v18 count];
    }
    while (v12 < v19);
  }
}

uint64_t GPU_GetDataType(int a1)
{
  int v1 = a1 - 1;
  if (a1 - 1) < 6 && ((0x2Du >> v1)) {
    return dword_1DD1F0CA0[v1];
  }
  uint64_t v2 = +[MLCLog framework];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    GPU_GetDataType_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return 268435488;
}

uint64_t GPU_GetDataTypeFromMPSDataType(int a1)
{
  switch(a1)
  {
    case 8:
      return 6;
    case 268435488:
      return 1;
    case 268435472:
      return 3;
  }
  uint64_t v2 = +[MLCLog framework];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    GPU_GetDataType_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  return 0;
}

id createArrayOfMPSMatrixSlicesFromBatch(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v6 = [v4 matrices];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F35640], "matrixDescriptorWithRows:columns:matrices:rowBytes:matrixBytes:dataType:", objc_msgSend(v4, "rows"), objc_msgSend(v4, "columns"), 1, objc_msgSend(v4, "rowBytes"), objc_msgSend(v4, "matrixBytes"), objc_msgSend(v4, "dataType"));
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35618]), "initWithBuffer:offset:descriptor:", v3, objc_msgSend(v4, "matrixBytes") * i, v7);
      [v5 addObject:v9];
    }
  }

  return v5;
}

void convertNCHWToWHCN(void *a1)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = (void *)[v1 copy];
  [v1 removeAllObjects];
  id v3 = [v2 objectAtIndexedSubscript:3];
  v8[0] = v3;
  id v4 = [v2 objectAtIndexedSubscript:2];
  v8[1] = v4;
  uint64_t v5 = [v2 objectAtIndexedSubscript:1];
  v8[2] = v5;
  uint64_t v6 = [v2 objectAtIndexedSubscript:0];
  v8[3] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  [v1 addObjectsFromArray:v7];
}

id makeMPSNDArrayDescriptorFromTensor(void *a1, unint64_t a2)
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [v3 descriptor];
  uint64_t v5 = [v4 shape];

  unint64_t v6 = [v3 calculateBatchSizeToUse];
  if (v6 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v6 / a2;
  }
  switch([v5 count])
  {
    case 1:
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
      v29[0] = v8;
      v29[1] = &unk_1F38767C8;
      v29[2] = &unk_1F38767C8;
      uint64_t v9 = [v5 objectAtIndexedSubscript:0];
      v29[3] = v9;
      unint64_t v10 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v11 = v29;
      goto LABEL_10;
    case 2:
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
      v28[0] = v8;
      v28[1] = &unk_1F38767C8;
      v28[2] = &unk_1F38767C8;
      uint64_t v9 = [v5 objectAtIndexedSubscript:1];
      v28[3] = v9;
      unint64_t v10 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v11 = v28;
LABEL_10:
      unint64_t v19 = [v10 arrayWithObjects:v11 count:4];
      goto LABEL_14;
    case 3:
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
      v27[0] = v8;
      uint64_t v9 = [v5 objectAtIndexedSubscript:1];
      v27[1] = v9;
      v27[2] = &unk_1F38767C8;
      uint64_t v20 = [v5 objectAtIndexedSubscript:2];
      v27[3] = v20;
      unint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
      goto LABEL_13;
    case 4:
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
      v26[0] = v8;
      uint64_t v9 = [v5 objectAtIndexedSubscript:1];
      v26[1] = v9;
      uint64_t v20 = [v5 objectAtIndexedSubscript:2];
      v26[2] = v20;
      id v21 = [v5 objectAtIndexedSubscript:3];
      v26[3] = v21;
      unint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];

LABEL_13:
LABEL_14:

      break;
    default:
      uint64_t v8 = +[MLCLog framework];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        makeMPSNDArrayDescriptorFromTensor_cold_1(v8, v12, v13, v14, v15, v16, v17, v18);
      }
      unint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
      break;
  }

  uint64_t v22 = [v3 descriptor];
  uint64_t DataType = GPU_GetDataType([v22 dataType]);

  id v24 = [MEMORY[0x1E4F35720] descriptorWithDataType:DataType shape:v19];

  return v24;
}

id makeMPSNDArrayFromMTLBuffer(void *a1, void *a2, void *a3, void *a4, unint64_t a5, uint64_t a6)
{
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  uint64_t v14 = GPU_CreateMPSMatrixDescForNDArray(a1, a5, a6);
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v12 descriptor:v14];

  [v13 setPreferPackedRows:1];
  uint64_t v16 = [v15 ndArrayWithCommandBuffer:v11 descriptor:v13 aliasing:1];

  return v16;
}

id GPU_CreateMPSMatrixDescForNDArray(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  unint64_t v6 = [v5 descriptor];
  uint64_t v7 = [v6 shape];

  if ([v7 count] == 1)
  {
    uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1);
    a3 = [v8 unsignedIntegerValue];

    uint64_t v9 = 1;
  }
  else
  {
    if (!a3)
    {
      unint64_t v10 = [v5 calculateBatchSizeToUse];
      if (v10 == 1) {
        a3 = 1;
      }
      else {
        a3 = v10 / a2;
      }
    }
    id v11 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1);
    uint64_t v9 = [v11 unsignedIntegerValue];

    if ((unint64_t)([v7 count] - 3) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      unint64_t v12 = 1;
      do
      {
        id v13 = [v7 objectAtIndexedSubscript:v12];
        a3 *= [v13 unsignedIntegerValue];

        ++v12;
      }
      while (v12 < [v7 count] - 1);
    }
  }
  uint64_t v14 = [v5 descriptor];
  uint64_t v15 = GPU_CreateMPSMatrixDesc(a3, v9, 1, [v14 dataType]);

  return v15;
}

id makeMPSTemporaryNDArrayFromTensor(void *a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = makeMPSNDArrayDescriptorFromTensor(a1, a2);
  uint64_t v7 = [MEMORY[0x1E4F35988] temporaryNDArrayWithCommandBuffer:v5 descriptor:v6];

  return v7;
}

void encodeMPSImageBatchToMPSTemporaryNDArray(void *a1, void *a2, uint64_t a3, void *a4, long long *a5)
{
  id v9 = a4;
  id v10 = a2;
  id v11 = [a1 deviceMemory];
  unint64_t v12 = [v11 objectAtIndexedSubscript:a3];
  uint64_t v13 = [v12 count];

  uint64_t v14 = [v11 objectAtIndexedSubscript:a3];
  uint64_t v15 = objc_msgSend(v14, "subarrayWithRange:", 0, v13);

  long long v16 = *a5;
  uint64_t v17 = *((void *)a5 + 2);
  [v10 importDataWithCommandBuffer:v9 fromImages:v15 offset:&v16];
}

void encodeMPSTemporaryNDArrayToMPSImageBatch(void *a1, void *a2, uint64_t a3, void *a4, long long *a5)
{
  id v9 = a4;
  id v10 = a2;
  id v11 = [a1 deviceMemory];
  unint64_t v12 = [v11 objectAtIndexedSubscript:a3];
  uint64_t v13 = [v12 count];

  uint64_t v14 = [v11 objectAtIndexedSubscript:a3];
  uint64_t v15 = objc_msgSend(v14, "subarrayWithRange:", 0, v13);

  long long v16 = *a5;
  uint64_t v17 = *((void *)a5 + 2);
  [v10 exportDataWithCommandBuffer:v9 toImages:v15 offset:&v16];
}

void GPU_GetTensorWidthAndHeight(void *a1, uint64_t *a2, uint64_t *a3)
{
  id v18 = a1;
  id v5 = [v18 descriptor];
  unint64_t v6 = [v5 shape];
  uint64_t v7 = [v6 count];

  uint64_t v8 = [v18 descriptor];
  id v9 = [v8 shape];
  id v10 = v9;
  if (v7 == 4)
  {
    id v11 = [v9 objectAtIndexedSubscript:3];
    uint64_t v12 = [v11 unsignedIntegerValue];

    uint64_t v13 = [v18 descriptor];
    uint64_t v14 = [v13 shape];
    uint64_t v15 = [v14 objectAtIndexedSubscript:2];
    uint64_t v16 = [v15 unsignedIntegerValue];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v17 = [v9 count];

  if (v17 == 3)
  {
    uint64_t v13 = [v18 descriptor];
    uint64_t v14 = [v13 shape];
    uint64_t v15 = [v14 objectAtIndexedSubscript:2];
    uint64_t v12 = [v15 unsignedIntegerValue];
    uint64_t v16 = 1;
    goto LABEL_5;
  }
  uint64_t v12 = 1;
  uint64_t v16 = 1;
LABEL_7:
  *a2 = v12;
  *a3 = v16;
}

void GPU_GetTensorWidthAndHeightStrides(void *a1, uint64_t *a2, uint64_t *a3)
{
  id v25 = a1;
  id v5 = [v25 descriptor];
  int v6 = [v5 dataType];

  uint64_t v7 = [v25 descriptor];
  uint64_t v8 = [v7 shape];
  uint64_t v9 = [v8 count];

  if (v9 == 4)
  {
    id v10 = [v25 descriptor];
    id v11 = [v10 stride];
    uint64_t v12 = [v11 objectAtIndexedSubscript:3];
    uint64_t v13 = [v12 unsignedIntegerValue];

    uint64_t v14 = [v25 descriptor];
    uint64_t v15 = [v14 stride];
    uint64_t v16 = [v15 objectAtIndexedSubscript:2];
    uint64_t v17 = [v16 unsignedIntegerValue];
LABEL_10:

    goto LABEL_12;
  }
  uint64_t v18 = 1;
  if (v6 == 3) {
    uint64_t v18 = 2;
  }
  if (v6 == 1) {
    uint64_t v13 = 4;
  }
  else {
    uint64_t v13 = v18;
  }
  unint64_t v19 = [v25 descriptor];
  uint64_t v20 = [v19 shape];
  uint64_t v21 = [v20 count];

  if (v21 == 3)
  {
    uint64_t v22 = [v25 descriptor];
    uint64_t v23 = [v22 stride];
    id v24 = [v23 objectAtIndexedSubscript:2];
    uint64_t v13 = [v24 unsignedIntegerValue];

    uint64_t v14 = [v25 descriptor];
    uint64_t v15 = [v14 shape];
    uint64_t v16 = [v15 objectAtIndexedSubscript:2];
    uint64_t v17 = [v16 unsignedIntegerValue] * v13;
    goto LABEL_10;
  }
  uint64_t v17 = v13;
LABEL_12:
  *a2 = v13;
  *a3 = v17;
}

uint64_t GPU_AdjustFeatureChannelBeyondMax(uint64_t *a1, uint64_t *a2, unint64_t *a3, void *a4)
{
  if (*a3) {
    return 0;
  }
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a3 >>= 1;
  *a1 = 2 * v5;
  if (a4) {
    *a4 *= 2;
  }
  unint64_t v6 = *a3;
  if (*a3 > kMaxFeatureChannelMPSImage
    && ((v6 & 1) != 0 || (*a3 = v6 >> 1, *a2 = 2 * v4, *a3 > kMaxFeatureChannelMPSImage)))
  {
    return 0;
  }
  else
  {
    return 1;
  }
}

id deviceParameterWithVectors(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = +[MLCTensorOptimizerDeviceData optimizerDeviceData];
  [v8 setMomentumVectors:v7];

  [v8 setVelocityVectors:v6];
  [v8 setCenterWeightVectors:v5];

  return v8;
}

id GPU_GetDataSourceFromTensors(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = (void *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v2; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        id v6 = objc_msgSend(v5, "deviceDataSources", (void)v8);

        if (v6)
        {
          uint64_t v2 = [v5 deviceDataSources];
          goto LABEL_11;
        }
      }
      uint64_t v2 = (void *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

void GPU_AssociateDataSourceToTensors(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setDeviceDataSources:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void GPU_ScaleMPSImageBatchWithKernel(void *a1, void *a2, void *a3, int a4)
{
  id v10 = a1;
  id v7 = a2;
  uint64_t v8 = a3;
  long long v9 = v8;
  if (a4) {
    MPSImageBatchIncrementReadCount(v8, 1);
  }
  [v10 encodeBatchToCommandBuffer:v7 sourceImages:v9 destinationImages:v9];
}

void GPU_AllocateExportableRunningMeanVariancetatesWithDevice(void *a1, void *a2, void *a3, void *a4, unint64_t a5)
{
  id v33 = a1;
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  long long v12 = v11;
  if (v10)
  {
    uint64_t v13 = [v10 deviceMemory];
    BOOL v14 = [v13 count] <= a5;

    if (v12)
    {
LABEL_3:
      uint64_t v15 = [v12 deviceMemory];
      BOOL v16 = [v15 count] <= a5;

      goto LABEL_6;
    }
  }
  else
  {
    BOOL v14 = 0;
    if (v11) {
      goto LABEL_3;
    }
  }
  BOOL v16 = 0;
LABEL_6:
  if (v14)
  {
    id v17 = [v10 data];
    uint64_t v18 = [v17 bytes];
    unint64_t v19 = [v10 data];
    uint64_t v20 = objc_msgSend(v33, "newBufferWithBytes:length:options:", v18, objc_msgSend(v19, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    uint64_t v21 = [v10 deviceMemory];
    [v21 setObject:v20 atIndexedSubscript:a5];
  }
  if (v16)
  {
    id v22 = [v12 data];
    uint64_t v23 = [v22 bytes];
    id v24 = [v12 data];
    id v25 = objc_msgSend(v33, "newBufferWithBytes:length:options:", v23, objc_msgSend(v24, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    uint64_t v26 = [v12 deviceMemory];
    [v26 setObject:v25 atIndexedSubscript:a5];
  }
  id v27 = objc_alloc(MEMORY[0x1E4F354C8]);
  uint64_t v28 = [v10 deviceMemory];
  uint64_t v29 = [v28 objectAtIndexedSubscript:a5];
  uint64_t v30 = [v12 deviceMemory];
  uint64_t v31 = [v30 objectAtIndexedSubscript:a5];
  uint64_t v32 = (void *)[v27 initWithMean:v29 variance:v31];

  [v9 setMovingState:v32];
}

void GPU_AllocateExportableGammaBetaStatesWithDevice(void *a1, void *a2, void *a3, void *a4, unint64_t a5)
{
  id v33 = a1;
  id v9 = a2;
  unint64_t v10 = a3;
  unint64_t v11 = a4;
  long long v12 = (void *)v11;
  if (!(v10 | v11))
  {
    [v9 setExportableState:0];
    goto LABEL_13;
  }
  if (!v10)
  {
    BOOL v14 = 0;
    if (v11) {
      goto LABEL_5;
    }
LABEL_7:
    BOOL v16 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = [(id)v10 deviceMemory];
  BOOL v14 = [v13 count] <= a5;

  if (!v12) {
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v15 = [v12 deviceMemory];
  BOOL v16 = [v15 count] <= a5;

LABEL_8:
  if (v14)
  {
    id v17 = [(id)v10 data];
    uint64_t v18 = [v17 bytes];
    unint64_t v19 = [(id)v10 data];
    uint64_t v20 = objc_msgSend(v33, "newBufferWithBytes:length:options:", v18, objc_msgSend(v19, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    uint64_t v21 = [(id)v10 deviceMemory];
    [v21 setObject:v20 atIndexedSubscript:a5];
  }
  if (v16)
  {
    id v22 = [v12 data];
    uint64_t v23 = [v22 bytes];
    id v24 = [v12 data];
    id v25 = objc_msgSend(v33, "newBufferWithBytes:length:options:", v23, objc_msgSend(v24, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
    uint64_t v26 = [v12 deviceMemory];
    [v26 setObject:v25 atIndexedSubscript:a5];
  }
  id v27 = objc_alloc(MEMORY[0x1E4F354C0]);
  uint64_t v28 = [v12 deviceMemory];
  uint64_t v29 = [v28 objectAtIndexedSubscript:a5];
  uint64_t v30 = [(id)v10 deviceMemory];
  uint64_t v31 = [v30 objectAtIndexedSubscript:a5];
  uint64_t v32 = (void *)[v27 initWithGamma:v29 beta:v31];

  [v9 setExportableState:v32];
LABEL_13:
}

BOOL GPU_isAppleFamily(void *a1)
{
  id v1 = [a1 debugDescription];
  uint64_t v2 = [v1 capitalizedString];

  BOOL v3 = [v2 rangeOfString:@"Name = Apple"] != 0x7FFFFFFFFFFFFFFFLL;
  return v3;
}

uint64_t GPU_CreateMPSMatrixDesc(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4 = a4 - 1;
  if ((a4 - 1) > 5)
  {
    uint64_t v5 = 268435488;
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v5 = dword_1DD1F0CB8[v4];
    uint64_t v6 = qword_1DD1F0CD0[v4];
  }
  return [MEMORY[0x1E4F35640] matrixDescriptorWithRows:a1 columns:a2 matrices:a3 rowBytes:v6 * a2 matrixBytes:v6 * a2 * a1 dataType:v5];
}

void copyNDArrayToMTLBuffer(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  objc_msgSend(v7, "exportDataWithCommandBuffer:toBuffer:destinationDataType:offset:rowStrides:", v5, v6, objc_msgSend(v7, "dataType"), 0, 0);
}

void GPU_clearTemporaryImageBatchReadCount(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
          if (v7)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v7 readCount]) {
                [v7 setReadCount:0];
              }
            }
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
}

unint64_t GPU_AlignForThreadGroupMemorySize(uint64_t a1)
{
  return (a1 + 15) & 0xFFFFFFFFFFFFFFF0;
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id CPU_CreateUpsampleLayer(uint64_t a1, int a2, char a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v17 = 0u;
  memset(v16, 0, sizeof(v16));
  if (a2 == 1) {
    LODWORD(v16[0]) = 1;
  }
  BYTE8(v17) = a3;
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 length:368];
  memset(v15, 0, sizeof(v15));
  memset(v14, 0, sizeof(v14));
  id v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:176];
  long long v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v14 length:176];
  v19[0] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  uint64_t v18 = v8;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  long long v11 = +[MLCCPUDeviceOps deviceOpsWithType:24 params:v6 inDeltaData:v9 outDeltaData:v10 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  if (v11) {
    [v5 addObject:v11];
  }
  long long v12 = (void *)[v5 copy];

  return v12;
}

uint64_t CPU_CompileUpsampleLayer(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v25 = a3;
  id v27 = [a1 objectAtIndexedSubscript:0];
  id v26 = [v27 params];
  uint64_t v24 = [v26 bytes];
  uint64_t v6 = [v5 objectAtIndexedSubscript:0];
  id v7 = [v6 descriptor];
  long long v8 = [v7 shape];
  uint64_t v9 = [v5 objectAtIndexedSubscript:0];
  long long v10 = [v9 descriptor];
  long long v11 = [v10 stride];
  long long v12 = [v5 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 descriptor];
  int v14 = CPU_BuildBNNSNDArrayDescriptor(v24 + 8, v8, v11, 0, [v13 dataType], 1, 0);

  uint64_t v15 = 0;
  if (v14)
  {
    BOOL v16 = [v25 descriptor];
    long long v17 = [v16 shape];
    uint64_t v18 = [v25 descriptor];
    unint64_t v19 = [v18 stride];
    uint64_t v20 = [v25 descriptor];
    int v21 = CPU_BuildBNNSNDArrayDescriptor(v24 + 184, v17, v19, 0, [v20 dataType], 1, 0);

    uint64_t v15 = 0;
    if (v21)
    {
      memset(v28, 0, sizeof(v28));
      LODWORD(v28[0]) = 1;
      uint64_t v15 = MEMORY[0x1E01B0D80](v24, v28);
      if (v15)
      {
        id v22 = [v5 objectAtIndexedSubscript:0];
        [v27 setSourceStride:CPU_SetBatchStride(v22)];

        [v27 setResultStride:CPU_SetBatchStride(v25)];
      }
    }
  }

  return v15;
}

unint64_t *hashCombine_2(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  long long v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 9;
  do
  {
    long long v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *uint64_t result = v9;
  return result;
}

unint64_t *hashCombine_3(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  long long v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 7;
  do
  {
    long long v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *uint64_t result = v9;
  return result;
}

uint64_t getBNNSConcatLayerTensorDataOffset(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 concatOffset];
  uint64_t v3 = [v1 descriptor];
  uint64_t v4 = [v3 stride];
  uint64_t v5 = [v1 concatDimension];

  uint64_t v6 = [v4 objectAtIndexedSubscript:v5];
  uint64_t v7 = [v6 unsignedIntegerValue] * v2;

  return v7;
}

uint64_t getBNNSSplitLayerTensorDataOffset(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 splitOffset];
  uint64_t v3 = [v1 descriptor];
  uint64_t v4 = [v3 stride];
  uint64_t v5 = [v1 splitDimension];

  uint64_t v6 = [v4 objectAtIndexedSubscript:v5];
  uint64_t v7 = [v6 unsignedIntegerValue] * v2;

  return v7;
}

uint64_t ANE_ValidateConcatUnit(void *a1, void *a2, int a3)
{
  v60[70] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateConcatUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateConcatUnit_onceToken, &__block_literal_global_3);
  }
  if ((ANE_ValidateConcatUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    uint64_t v8 = [v5 count];
    uint64_t v9 = MEMORY[0x1F4188790]();
    if (v9)
    {
      uint64_t v10 = 0;
      long long v11 = &v43[-64 * v9];
      while (1)
      {
        long long v12 = [v5 objectAtIndexedSubscript:v10];
        if (!ANE_BuildANECTensorDesc((uint64_t)v11, v12, a3)) {
          break;
        }

        ++v10;
        v11 += 64;
        if (v8 == v10) {
          goto LABEL_9;
        }
      }
      long long v41 = +[MLCLog framework];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateConcatUnit_cold_4();
      }

      uint64_t v7 = 0;
      goto LABEL_37;
    }
LABEL_9:
    long long v12 = [v6 objectForKeyedSubscript:@"Params"];
    id v52 = 0;
    uint64_t v53 = 0;
    ANECConcatLayerDescInitialize();
    id v52 = [v12 objectForKeyedSubscript:@"Dimension"];

    uint64_t v13 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v51 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v51, v13))
    {
      id v33 = +[MLCLog framework];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateConcatUnit_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);
      }

      uint64_t v7 = 0;
      goto LABEL_36;
    }
    unint64_t v46 = v43;
    uint64_t v49 = 0;
    unint64_t v50 = 0;
    int v14 = ANECValidateConcatLayer();
    uint64_t v7 = v14 == 0;
    id v47 = v6;
    if (v14)
    {
      int v15 = v14;
      BOOL v44 = v14 == 0;
      BOOL v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v60[0]) = 136315906;
        *(void *)((char *)v60 + 4) = "ANE_ValidateConcatUnit";
        WORD2(v60[1]) = 1024;
        *(_DWORD *)((char *)&v60[1] + 6) = v15;
        WORD1(v60[2]) = 2112;
        *(void *)((char *)&v60[2] + 4) = v13;
        WORD2(v60[3]) = 2112;
        *(void *)((char *)&v60[3] + 6) = v6;
        _os_log_error_impl(&dword_1DD0C9000, v16, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)v60, 0x26u);
      }
      uint64_t v45 = v13;

      unint64_t v18 = v50;
      if (v50)
      {
        unint64_t v19 = 0;
        *(void *)&long long v17 = 136315650;
        long long v48 = v17;
        do
        {
          memcpy(v60, (const void *)(v49 + 552 * v19), 0x228uLL);
          uint64_t v20 = v60[0];
          if (v60[0])
          {
            uint64_t v21 = 0;
            do
            {
              id v22 = +[MLCLog framework];
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                uint64_t v23 = v60[v21 + 1];
                int v54 = v48;
                long long v55 = "ANE_ValidateConcatUnit";
                __int16 v56 = 2048;
                uint64_t v57 = v21;
                __int16 v58 = 2112;
                uint64_t v59 = v23;
                _os_log_error_impl(&dword_1DD0C9000, v22, OS_LOG_TYPE_ERROR, "%s: ANE hardware constraint violation %lu: %@", (uint8_t *)&v54, 0x20u);
              }

              ++v21;
            }
            while (v20 != v21);
            unint64_t v18 = v50;
          }
          ++v19;
        }
        while (v19 < v18);
      }
      int v24 = ANECUnitValidatorDelete();
      uint64_t v13 = v45;
      uint64_t v7 = v44;
      if (!v24) {
        goto LABEL_35;
      }
      id v25 = +[MLCLog framework];
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_35:
        id v6 = v47;
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
      id v25 = +[MLCLog framework];
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
LABEL_34:

        goto LABEL_35;
      }
    }
    ANE_ValidateConcatUnit_cold_1(v25, v26, v27, v28, v29, v30, v31, v32);
    goto LABEL_34;
  }
  uint64_t v7 = 0;
LABEL_38:

  return v7;
}

BOOL ANE_BuildANECTensorDesc(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = [v5 descriptor];
  if (a3)
  {
    uint64_t v20 = 0;
    uint64_t v7 = (id *)&v20;
    ANE_GetTensor4DShapeWithOnePrepended(v5, &v20);
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v7 = (id *)&v19;
    ANE_GetTensor4DShapeWithBatchFirst(v5, &v19);
  }
  id v8 = *v7;
  ANECTensorDimsInitialize();
  uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", 0, 0, 0, 0, 0, 0);
  *(void *)&long long v17 = [v9 longValue];

  uint64_t v10 = [v8 objectAtIndexedSubscript:1];
  *((void *)&v17 + 1) = [v10 longValue];

  long long v11 = [v8 objectAtIndexedSubscript:2];
  *(void *)&long long v18 = [v11 longValue];

  long long v12 = [v8 objectAtIndexedSubscript:3];
  *((void *)&v18 + 1) = [v12 longValue];

  ANECTensorDescInitialize();
  uint64_t v13 = ANE_GetANECIRDataTypeWithMLCDataType([v6 dataType]);
  int v14 = (void *)v13;
  if (v13)
  {
    *(void *)a1 = v13;
    *(_OWORD *)(a1 + 8) = v17;
    *(_OWORD *)(a1 + 24) = v18;
    *(void *)(a1 + 40) = 1;
    [v5 setInterleave:1];
    *(void *)(a1 + 48) = 1;
    *(unsigned char *)(a1 + 57) = ([v5 computeFlags] & 2) != 0;
  }
  else
  {
    int v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      ANE_BuildANECTensorDesc_cold_1(v6, (uint64_t)v5, v15);
    }
  }
  return v14 != 0;
}

id softLinkClass_ANEDeviceInfo_1()
{
  if (softLinkClass_ANEDeviceInfo_onceToken_1 != -1) {
    dispatch_once(&softLinkClass_ANEDeviceInfo_onceToken_1, &__block_literal_global_122);
  }
  uint64_t v0 = (void *)softLinkClass_ANEDeviceInfo_softLinkClass_ANEDeviceInfo_1;

  return v0;
}

BOOL ANE_CreateUnitValidator(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = ANECUnitValidatorCreate();
  if (v3 == 10)
  {
    uint64_t v4 = +[MLCLog framework];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ANE_CreateUnitValidator_cold_1();
    }
  }
  return v3 != 10;
}

uint64_t ANE_ValidateConvolutionUnit(void *a1, void *a2, int a3)
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateConvolutionUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateConvolutionUnit_onceToken, &__block_literal_global_6);
  }
  if ((ANE_ValidateConvolutionUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    memset(v74, 0, sizeof(v74));
    if (!ANE_BuildANECTensorDesc((uint64_t)v74, v8, a3))
    {
      uint64_t v30 = +[MLCLog framework];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateConvolutionUnit_cold_4(v30, v31, v32, v33, v34, v35, v36, v37);
      }

      uint64_t v7 = 0;
      goto LABEL_28;
    }
    long long v72 = 0uLL;
    uint64_t v73 = 0;
    ANE_BuildANECKernelSize((uint64_t *)&v72, v6);
    long long v70 = 0uLL;
    uint64_t v71 = 0;
    ANE_BuildANECPadding(&v70, v6);
    int v69 = 0;
    uint64_t v68 = 0;
    ANE_BuildANECStep(&v68, v6);
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    ANECKernelDilationRateInitialize();
    int64x2_t v66 = vdupq_n_s64(1uLL);
    uint64_t v67 = 1;
    uint64_t v10 = [v9 objectForKeyedSubscript:@"KernelDilationX"];

    if (v10)
    {
      long long v11 = [v9 objectForKeyedSubscript:@"KernelDilationX"];
      v66.i64[0] = [v11 longValue];
    }
    long long v12 = [v9 objectForKeyedSubscript:@"KernelDilationY"];

    if (v12)
    {
      uint64_t v13 = [v9 objectForKeyedSubscript:@"KernelDilationY"];
      v66.i64[1] = [v13 longValue];
    }
    long long v64 = 0u;
    long long v65 = 0u;
    ANECConvLayerDescInitialize();
    id v48 = [v9 objectForKeyedSubscript:@"Type"];

    id v49 = [v9 objectForKeyedSubscript:@"KernelMode"];

    id v50 = [v9 objectForKeyedSubscript:@"KernelType"];

    id v51 = [v9 objectForKeyedSubscript:@"PaddingMode"];

    int v14 = [v6 objectForKeyedSubscript:@"OutputChannels"];
    uint64_t v52 = [v14 longValue];

    int v15 = [v6 objectForKeyedSubscript:@"NumGroups"];
    uint64_t v53 = [v15 longValue];

    BOOL v16 = [v9 objectForKeyedSubscript:@"KernelGroupReuse"];
    uint64_t v54 = [v16 BOOLValue];

    long long v55 = v72;
    uint64_t v56 = v73;
    uint64_t v57 = v68;
    int v58 = v69;
    long long v59 = v70;
    uint64_t v60 = v71;
    long long v17 = [v9 objectForKeyedSubscript:@"KernelMutable"];
    int v61 = [v17 BOOLValue];

    int64x2_t v62 = v66;
    uint64_t v63 = v67;
    long long v18 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v47 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v47, v18))
    {
      uint64_t v38 = +[MLCLog framework];
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateConvolutionUnit_cold_3(v38, v39, v40, v41, v42, v43, v44, v45);
      }

      uint64_t v7 = 0;
      goto LABEL_27;
    }
    int v19 = ANECValidateConvLayer();
    uint64_t v7 = v19 == 0;
    if (v19)
    {
      int v20 = v19;
      uint64_t v21 = +[MLCLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateConvolutionUnit";
        __int16 v76 = 1024;
        int v77 = v20;
        __int16 v78 = 2112;
        int v79 = v18;
        __int16 v80 = 2112;
        id v81 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v21, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_27;
      }
      id v22 = +[MLCLog framework];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      id v22 = +[MLCLog framework];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    ANE_ValidateConvolutionUnit_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_26;
  }
  uint64_t v7 = 0;
LABEL_29:

  return v7;
}

void ANE_BuildANECKernelSize(uint64_t *a1, void *a2)
{
  id v3 = a2;
  ANECKernelSizeInitialize();
  id v11 = [v3 objectForKeyedSubscript:@"Params"];

  uint64_t v4 = [v11 objectForKeyedSubscript:@"KernelWidth"];
  uint64_t v5 = [v4 longValue];

  id v6 = [v11 objectForKeyedSubscript:@"KernelHeight"];
  uint64_t v7 = [v6 longValue];

  id v8 = [v11 objectForKeyedSubscript:@"KernelDepth"];

  if (v8)
  {
    uint64_t v9 = [v11 objectForKeyedSubscript:@"KernelDepth"];
    uint64_t v10 = [v9 longValue];
  }
  else
  {
    uint64_t v10 = 1;
  }
  *a1 = v5;
  a1[1] = v7;
  a1[2] = v10;
}

void ANE_BuildANECPadding(_DWORD *a1, void *a2)
{
  id v3 = a2;
  ANECPaddingInitialize();
  id v12 = [v3 objectForKeyedSubscript:@"Params"];

  uint64_t v4 = [v12 objectForKeyedSubscript:@"PadTop"];
  a1[2] = [v4 intValue];

  uint64_t v5 = [v12 objectForKeyedSubscript:@"PadBot"];
  a1[3] = [v5 intValue];

  id v6 = [v12 objectForKeyedSubscript:@"PadLeft"];
  *a1 = [v6 intValue];

  uint64_t v7 = [v12 objectForKeyedSubscript:@"PadRight"];
  a1[1] = [v7 intValue];

  a1[4] = 0;
  id v8 = [v12 objectForKeyedSubscript:@"PadFront"];

  if (v8)
  {
    uint64_t v9 = [v12 objectForKeyedSubscript:@"PadFront"];
    a1[4] = [v9 intValue];
  }
  a1[5] = 0;
  uint64_t v10 = [v12 objectForKeyedSubscript:@"PadBack"];

  if (v10)
  {
    id v11 = [v12 objectForKeyedSubscript:@"PadBack"];
    a1[5] = [v11 intValue];
  }
}

void ANE_BuildANECStep(_DWORD *a1, void *a2)
{
  id v3 = a2;
  ANECStepInitialize();
  id v12 = [v3 objectForKeyedSubscript:@"Params"];

  uint64_t v4 = [v12 objectForKeyedSubscript:@"Step"];
  uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  *a1 = [v5 intValue];

  id v6 = [v12 objectForKeyedSubscript:@"Step"];
  uint64_t v7 = [v6 objectAtIndexedSubscript:1];
  a1[1] = [v7 intValue];

  a1[2] = 1;
  id v8 = [v12 objectForKeyedSubscript:@"Step"];
  uint64_t v9 = [v8 count];

  if (v9 == 3)
  {
    uint64_t v10 = [v12 objectForKeyedSubscript:@"Step"];
    id v11 = [v10 objectAtIndexedSubscript:2];
    a1[2] = [v11 intValue];
  }
}

uint64_t ANE_ValidateInstanceNormUnit(void *a1, void *a2, int a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateInstanceNormUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateInstanceNormUnit_onceToken, &__block_literal_global_38_0);
  }
  if ((ANE_ValidateInstanceNormUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    memset(v42, 0, sizeof(v42));
    if (!ANE_BuildANECTensorDesc((uint64_t)v42, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateInstanceNormUnit_cold_4(v9, v25, v26, v27, v28, v29, v30, v31);
      }
      uint64_t v7 = 0;
      goto LABEL_27;
    }
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    memset(&v41[1], 0, 56);
    ANECInstanceNormLayerDescInitialize();
    uint64_t v10 = [v9 objectForKeyedSubscript:@"Dimension"];
    v41[1] = [v10 count];
    if ([v10 count])
    {
      unint64_t v11 = 0;
      do
      {
        id v12 = [v10 objectAtIndexedSubscript:v11];

        v41[v11++ + 2] = v12;
      }
      while (v11 < [v10 count]);
    }
    uint64_t v13 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    v41[0] = 0;
    if (!ANE_CreateUnitValidator((uint64_t)v41, v13))
    {
      uint64_t v32 = +[MLCLog framework];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateInstanceNormUnit_cold_3(v32, v33, v34, v35, v36, v37, v38, v39);
      }

      uint64_t v7 = 0;
      goto LABEL_26;
    }
    int v14 = ANECValidateInstanceNormLayer();
    uint64_t v7 = v14 == 0;
    if (v14)
    {
      int v15 = v14;
      BOOL v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateInstanceNormUnit";
        __int16 v44 = 1024;
        int v45 = v15;
        __int16 v46 = 2112;
        uint64_t v47 = v13;
        __int16 v48 = 2112;
        id v49 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v16, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_26;
      }
      long long v17 = +[MLCLog framework];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      long long v17 = +[MLCLog framework];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    ANE_ValidateInstanceNormUnit_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_25;
  }
  uint64_t v7 = 0;
LABEL_28:

  return v7;
}

uint64_t ANE_ValidateNeuronUnit(void *a1, void *a2, int a3)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateNeuronUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateNeuronUnit_onceToken, &__block_literal_global_40);
  }
  if ((ANE_ValidateNeuronUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    memset(v50, 0, sizeof(v50));
    if (!ANE_BuildANECTensorDesc((uint64_t)v50, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateNeuronUnit_cold_4(v9, v30, v31, v32, v33, v34, v35, v36);
      }
      uint64_t v7 = 0;
      goto LABEL_26;
    }
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    uint64_t v49 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    ANECNeuronLayerDescInitialize();
    *(void *)&long long v47 = [v9 objectForKeyedSubscript:@"Type"];

    if ((__CFString *)v47 == @"LeakyReLU")
    {
      uint64_t v10 = [v9 objectForKeyedSubscript:@"ReluSlope"];
      __int16 v11 = [v10 shortValue];

      _H0 = v11;
      __asm { FCVT            S0, H0 }
      DWORD2(v47) = _S0;
    }
    uint64_t v18 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v46 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v46, v18))
    {
      uint64_t v37 = +[MLCLog framework];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateNeuronUnit_cold_3(v37, v38, v39, v40, v41, v42, v43, v44);
      }

      uint64_t v7 = 0;
      goto LABEL_25;
    }
    int v19 = ANECValidateNeuronLayer();
    uint64_t v7 = v19 == 0;
    if (v19)
    {
      int v20 = v19;
      uint64_t v21 = +[MLCLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateNeuronUnit";
        __int16 v52 = 1024;
        int v53 = v20;
        __int16 v54 = 2112;
        long long v55 = v18;
        __int16 v56 = 2112;
        id v57 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v21, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_25;
      }
      uint64_t v22 = +[MLCLog framework];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
      uint64_t v22 = +[MLCLog framework];
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    ANE_ValidateNeuronUnit_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_24;
  }
  uint64_t v7 = 0;
LABEL_27:

  return v7;
}

BOOL ANE_ValidatePoolingUnit(void *a1, void *a2, int a3)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidatePoolingUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidatePoolingUnit_onceToken, &__block_literal_global_48);
  }
  if ((ANE_ValidatePoolingUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    memset(v57, 0, sizeof(v57));
    if (!ANE_BuildANECTensorDesc((uint64_t)v57, v8, a3))
    {
      uint64_t v24 = +[MLCLog framework];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        ANE_ValidatePoolingUnit_cold_4(v24, v25, v26, v27, v28, v29, v30, v31);
      }

      BOOL v7 = 0;
      goto LABEL_25;
    }
    long long v55 = 0uLL;
    uint64_t v56 = 0;
    ANE_BuildANECKernelSize((uint64_t *)&v55, v6);
    long long v53 = 0uLL;
    uint64_t v54 = 0;
    ANE_BuildANECPadding(&v53, v6);
    int v52 = 0;
    uint64_t v51 = 0;
    ANE_BuildANECStep(&v51, v6);
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    *(_OWORD *)&v49[12] = 0u;
    long long v50 = 0u;
    ANECPoolLayerDescInitialize();
    id v43 = [v9 objectForKeyedSubscript:@"Type"];

    id v44 = [v9 objectForKeyedSubscript:@"PaddingMode"];

    long long v45 = v55;
    uint64_t v46 = v56;
    uint64_t v47 = v51;
    int v48 = v52;
    *(_OWORD *)uint64_t v49 = v53;
    *(void *)&v49[16] = v54;
    uint64_t v10 = [v9 objectForKeyedSubscript:@"AverageCountExcludePadding"];
    v49[24] = [v10 BOOLValue];

    __int16 v11 = [v6 objectForKeyedSubscript:@"OutputChannels"];
    *(void *)&long long v50 = [v11 longValue];

    DWORD2(v50) = 1065353216;
    id v12 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v42 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v42, v12))
    {
      uint64_t v32 = +[MLCLog framework];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        ANE_ValidatePoolingUnit_cold_3(v32, v33, v34, v35, v36, v37, v38, v39);
      }

      BOOL v7 = 0;
      goto LABEL_24;
    }
    int v13 = ANECValidatePoolLayer();
    BOOL v41 = v13 == 0;
    if (v13)
    {
      int v14 = v13;
      int v15 = +[MLCLog framework];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidatePoolingUnit";
        __int16 v59 = 1024;
        int v60 = v14;
        __int16 v61 = 2112;
        int64x2_t v62 = v12;
        __int16 v63 = 2112;
        id v64 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v15, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      if (!ANECUnitValidatorDelete()) {
        goto LABEL_23;
      }
      BOOL v16 = +[MLCLog framework];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:
        BOOL v7 = v41;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      BOOL v16 = +[MLCLog framework];
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidatePoolingUnit_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_22;
  }
  BOOL v7 = 0;
LABEL_26:

  return v7;
}

uint64_t ANE_ValidateSoftmaxUnit(void *a1, void *a2, int a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateSoftmaxUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateSoftmaxUnit_onceToken, &__block_literal_global_53);
  }
  if ((ANE_ValidateSoftmaxUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    memset(v42, 0, sizeof(v42));
    if (!ANE_BuildANECTensorDesc((uint64_t)v42, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateSoftmaxUnit_cold_4(v9, v23, v24, v25, v26, v27, v28, v29);
      }
      uint64_t v7 = 0;
      goto LABEL_24;
    }
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    long long v40 = 0u;
    long long v41 = 0u;
    ANECSoftmaxLayerDescInitialize();
    v39[1] = 1;
    uint64_t v10 = [v9 objectForKeyedSubscript:@"Dimension"];

    void v39[2] = v10;
    __int16 v11 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    v39[0] = 0;
    if (!ANE_CreateUnitValidator((uint64_t)v39, v11))
    {
      uint64_t v30 = +[MLCLog framework];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateSoftmaxUnit_cold_3(v30, v31, v32, v33, v34, v35, v36, v37);
      }

      uint64_t v7 = 0;
      goto LABEL_23;
    }
    int v12 = ANECValidateSoftmaxLayer();
    uint64_t v7 = v12 == 0;
    if (v12)
    {
      int v13 = v12;
      int v14 = +[MLCLog framework];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateSoftmaxUnit";
        __int16 v44 = 1024;
        int v45 = v13;
        __int16 v46 = 2112;
        uint64_t v47 = v11;
        __int16 v48 = 2112;
        id v49 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v14, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_23;
      }
      int v15 = +[MLCLog framework];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      int v15 = +[MLCLog framework];
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidateSoftmaxUnit_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_22;
  }
  uint64_t v7 = 0;
LABEL_25:

  return v7;
}

uint64_t ANE_ValidateReshapeUnit(void *a1, void *a2, int a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateReshapeUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateReshapeUnit_onceToken, &__block_literal_global_55_0);
  }
  if ((ANE_ValidateReshapeUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    memset(v49, 0, sizeof(v49));
    if (!ANE_BuildANECTensorDesc((uint64_t)v49, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateReshapeUnit_cold_4(v9, v26, v27, v28, v29, v30, v31, v32);
      }
      uint64_t v7 = 0;
      goto LABEL_24;
    }
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    ANECTensorDimsInitialize();
    uint64_t v10 = [v9 objectForKeyedSubscript:@"ReshapedBatch"];
    *(void *)&long long v46 = [v10 longValue];

    uint64_t v48 = 1;
    __int16 v11 = [v9 objectForKeyedSubscript:@"ReshapedChannel"];
    *((void *)&v46 + 1) = [v11 longValue];

    int v12 = [v9 objectForKeyedSubscript:@"ReshapedHeight"];
    *(void *)&long long v47 = [v12 longValue];

    int v13 = [v9 objectForKeyedSubscript:@"ReshapedWidth"];
    *((void *)&v47 + 1) = [v13 longValue];

    ANECReshapeLayerDescInitialize();
    long long v43 = v46;
    long long v44 = v47;
    uint64_t v45 = 1;
    int v14 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v42 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v42, v14))
    {
      uint64_t v33 = +[MLCLog framework];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateReshapeUnit_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);
      }

      uint64_t v7 = 0;
      goto LABEL_23;
    }
    int v15 = ANECValidateReshapeLayer();
    uint64_t v7 = v15 == 0;
    if (v15)
    {
      int v16 = v15;
      uint64_t v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateReshapeUnit";
        __int16 v51 = 1024;
        int v52 = v16;
        __int16 v53 = 2112;
        uint64_t v54 = v14;
        __int16 v55 = 2112;
        id v56 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v17, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_23;
      }
      uint64_t v18 = +[MLCLog framework];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      uint64_t v18 = +[MLCLog framework];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidateReshapeUnit_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_22;
  }
  uint64_t v7 = 0;
LABEL_25:

  return v7;
}

uint64_t ANE_ValidateTransposeUnit(void *a1, void *a2, int a3)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateTransposeUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateTransposeUnit_onceToken, &__block_literal_global_69);
  }
  if ((ANE_ValidateTransposeUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    memset(v47, 0, sizeof(v47));
    if (!ANE_BuildANECTensorDesc((uint64_t)v47, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateTransposeUnit_cold_4(v9, v28, v29, v30, v31, v32, v33, v34);
      }
      uint64_t v7 = 0;
      goto LABEL_27;
    }
    long long v44 = v8;
    id v45 = v5;
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    memset(&v46[1], 0, 88);
    ANECTransposeLayerDescInitialize();
    uint64_t v10 = [v9 objectForKeyedSubscript:@"TransposeDimensions"];
    v46[1] = [v10 count];
    if ([v10 count])
    {
      unint64_t v11 = 0;
      int v12 = &v46[2];
      do
      {
        int v13 = [v10 objectAtIndexedSubscript:v11];
        *(void *)__dst = 0;
        *(void *)&__dst[8] = 0;
        ANECDimensionMappingInitialize();
        int v14 = [v13 objectForKeyedSubscript:@"TransposeSourceDimension"];
        *(void *)__dst = v14;
        int v15 = [v13 objectForKeyedSubscript:@"TransposeDestinationDimension"];
        *(void *)&__dst[8] = v15;
        *v12++ = *(_OWORD *)__dst;

        ++v11;
      }
      while (v11 < [v10 count]);
    }
    int v16 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    v46[0] = 0;
    if (!ANE_CreateUnitValidator((uint64_t)v46, v16))
    {
      uint64_t v35 = +[MLCLog framework];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateTransposeUnit_cold_3(v35, v36, v37, v38, v39, v40, v41, v42);
      }

      uint64_t v7 = 0;
      goto LABEL_26;
    }
    int v17 = ANECValidateTransposeLayer();
    uint64_t v7 = v17 == 0;
    if (v17)
    {
      int v18 = v17;
      uint64_t v19 = +[MLCLog framework];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__dst = 136315906;
        *(void *)&__dst[4] = "ANE_ValidateTransposeUnit";
        *(_WORD *)&__dst[12] = 1024;
        *(_DWORD *)&__dst[14] = v18;
        __int16 v49 = 2112;
        uint64_t v50 = v16;
        __int16 v51 = 2112;
        id v52 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v19, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", __dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_26;
      }
      uint64_t v20 = +[MLCLog framework];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_26:

        id v8 = v44;
        id v5 = v45;
LABEL_27:

        goto LABEL_28;
      }
      uint64_t v20 = +[MLCLog framework];
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    ANE_ValidateTransposeUnit_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_25;
  }
  uint64_t v7 = 0;
LABEL_28:

  return v7;
}

uint64_t ANE_ValidateReductionUnit(void *a1, void *a2, int a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateReductionUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateReductionUnit_onceToken, &__block_literal_global_80);
  }
  if ((ANE_ValidateReductionUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    memset(v48, 0, sizeof(v48));
    if (!ANE_BuildANECTensorDesc((uint64_t)v48, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateReductionUnit_cold_4(v9, v25, v26, v27, v28, v29, v30, v31);
      }
      uint64_t v7 = 0;
      goto LABEL_27;
    }
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    uint64_t v47 = 0;
    memset(v46, 0, sizeof(v46));
    ANECReductionLayerDescInitialize();
    id v42 = [v9 objectForKeyedSubscript:@"Type"];

    long long v43 = @"Bypass";
    uint64_t v44 = 0x3727C5AC3F800000;
    uint64_t v10 = [v9 objectForKeyedSubscript:@"Dimension"];
    uint64_t v45 = [v10 count];
    if ([v10 count])
    {
      unint64_t v11 = 0;
      do
      {
        int v12 = [v10 objectAtIndexedSubscript:v11];
        *((void *)v46 + v11) = v12;

        ++v11;
      }
      while (v11 < [v10 count]);
    }
    int v13 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v41 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v41, v13))
    {
      uint64_t v32 = +[MLCLog framework];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateReductionUnit_cold_3(v32, v33, v34, v35, v36, v37, v38, v39);
      }

      uint64_t v7 = 0;
      goto LABEL_26;
    }
    int v14 = ANECValidateReductionLayer();
    uint64_t v7 = v14 == 0;
    if (v14)
    {
      int v15 = v14;
      int v16 = +[MLCLog framework];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateReductionUnit";
        __int16 v50 = 1024;
        int v51 = v15;
        __int16 v52 = 2112;
        uint64_t v53 = v13;
        __int16 v54 = 2112;
        id v55 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v16, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_26;
      }
      int v17 = +[MLCLog framework];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      int v17 = +[MLCLog framework];
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_25:

        goto LABEL_26;
      }
    }
    ANE_ValidateReductionUnit_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_25;
  }
  uint64_t v7 = 0;
LABEL_28:

  return v7;
}

BOOL ANE_ValidateBroadcastUnit(void *a1, void *a2, void *a3, int a4)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (ANE_ValidateBroadcastUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateBroadcastUnit_onceToken, &__block_literal_global_85);
  }
  if ((ANE_ValidateBroadcastUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    unint64_t v11 = [v7 objectAtIndexedSubscript:0];
    memset(v50, 0, sizeof(v50));
    if (!ANE_BuildANECTensorDesc((uint64_t)v50, v11, a4))
    {
      uint64_t v24 = +[MLCLog framework];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateBroadcastUnit_cold_5(v24, v25, v26, v27, v28, v29, v30, v31);
      }

      BOOL v10 = 0;
      goto LABEL_24;
    }
    memset(v49, 0, sizeof(v49));
    if (ANE_BuildANECTensorDesc((uint64_t)v49, v8, a4))
    {
      int v12 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
      uint64_t v48 = 0;
      if (ANE_CreateUnitValidator((uint64_t)&v48, v12))
      {
        int v13 = ANECValidateBroadcastLayer();
        BOOL v10 = v13 == 0;
        if (v13)
        {
          int v14 = v13;
          int v15 = +[MLCLog framework];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            __dst[0] = 136315906;
            *(void *)&__dst[1] = "ANE_ValidateBroadcastUnit";
            __int16 v52 = 1024;
            int v53 = v14;
            __int16 v54 = 2112;
            id v55 = v12;
            __int16 v56 = 2112;
            id v57 = v9;
            _os_log_error_impl(&dword_1DD0C9000, v15, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
          }

          if (!ANECUnitValidatorDelete()) {
            goto LABEL_23;
          }
          int v16 = +[MLCLog framework];
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        if (ANECUnitValidatorDelete())
        {
          int v16 = +[MLCLog framework];
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
LABEL_29:

            goto LABEL_23;
          }
LABEL_28:
          ANE_ValidateBroadcastUnit_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
          goto LABEL_29;
        }
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      uint64_t v39 = +[MLCLog framework];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateBroadcastUnit_cold_3(v39, v40, v41, v42, v43, v44, v45, v46);
      }
    }
    else
    {
      int v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateBroadcastUnit_cold_4(v12, v32, v33, v34, v35, v36, v37, v38);
      }
    }
    BOOL v10 = 0;
    goto LABEL_23;
  }
  BOOL v10 = 0;
LABEL_25:

  return v10;
}

uint64_t ANE_ValidateElementWiseUnit(void *a1, void *a2, int a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateElementWiseUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateElementWiseUnit_onceToken, &__block_literal_global_87);
  }
  if (ANE_ValidateElementWiseUnit_isAppleNeuralEngineAvailable)
  {
    uint64_t v7 = 0;
    goto LABEL_37;
  }
  uint64_t v8 = [v5 count];
  id v64 = v59;
  uint64_t v9 = MEMORY[0x1F4188790]();
  if (!v9)
  {
LABEL_9:
    int v16 = [v6 objectForKeyedSubscript:@"Params"];
    __asm { FMOV            V0.2S, #1.0 }
    v68[1] = _D0;
    id v69 = [v16 objectForKeyedSubscript:@"Type"];

    uint64_t v22 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    v68[0] = 0;
    if (!ANE_CreateUnitValidator((uint64_t)v68, v22))
    {
      uint64_t v42 = +[MLCLog framework];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateElementWiseUnit_cold_3(v42, v43, v44, v45, v46, v47, v48, v49);
      }

      uint64_t v7 = 0;
      goto LABEL_36;
    }
    id v63 = v6;
    uint64_t v66 = 0;
    unint64_t v67 = 0;
    int v23 = ANECValidateElementWiseLayer();
    uint64_t v7 = v23 == 0;
    if (v23)
    {
      int v24 = v23;
      BOOL v60 = v23 == 0;
      int64x2_t v62 = v16;
      uint64_t v25 = +[MLCLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v76[0]) = 136315906;
        *(void *)((char *)v76 + 4) = "ANE_ValidateElementWiseUnit";
        WORD6(v76[0]) = 1024;
        *(_DWORD *)((char *)v76 + 14) = v24;
        WORD1(v76[1]) = 2112;
        *(void *)((char *)&v76[1] + 4) = v22;
        WORD6(v76[1]) = 2112;
        *(void *)((char *)&v76[1] + 14) = v63;
        _os_log_error_impl(&dword_1DD0C9000, v25, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)v76, 0x26u);
      }
      __int16 v61 = v22;

      unint64_t v27 = v67;
      if (v67)
      {
        unint64_t v28 = 0;
        *(void *)&long long v26 = 136315650;
        long long v65 = v26;
        do
        {
          memcpy(v76, (const void *)(v66 + 552 * v28), 0x228uLL);
          uint64_t v29 = *(void *)&v76[0];
          if (*(void *)&v76[0])
          {
            uint64_t v30 = 0;
            do
            {
              uint64_t v31 = +[MLCLog framework];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                uint64_t v32 = *((void *)v76 + v30 + 1);
                int v70 = v65;
                uint64_t v71 = "ANE_ValidateElementWiseUnit";
                __int16 v72 = 2048;
                uint64_t v73 = v30;
                __int16 v74 = 2112;
                uint64_t v75 = v32;
                _os_log_error_impl(&dword_1DD0C9000, v31, OS_LOG_TYPE_ERROR, "%s: ANE hardware constraint violation %lu: %@", (uint8_t *)&v70, 0x20u);
              }

              ++v30;
            }
            while (v29 != v30);
            unint64_t v27 = v67;
          }
          ++v28;
        }
        while (v28 < v27);
      }
      int v33 = ANECUnitValidatorDelete();
      uint64_t v22 = v61;
      int v16 = v62;
      uint64_t v7 = v60;
      if (!v33) {
        goto LABEL_35;
      }
      uint64_t v34 = +[MLCLog framework];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_35:
        id v6 = v63;
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v34 = +[MLCLog framework];
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
LABEL_34:

        goto LABEL_35;
      }
    }
    ANE_ValidateElementWiseUnit_cold_1(v34, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_34;
  }
  uint64_t v10 = 0;
  unint64_t v11 = &v59[-64 * v9];
  while (1)
  {
    memset(v76, 0, 64);
    int v12 = [v5 objectAtIndexedSubscript:v10];
    BOOL v13 = ANE_BuildANECTensorDesc((uint64_t)v76, v12, a3);

    if (!v13) {
      break;
    }
    long long v14 = v76[1];
    _OWORD *v11 = v76[0];
    v11[1] = v14;
    long long v15 = v76[3];
    void v11[2] = v76[2];
    v11[3] = v15;
    ++v10;
    v11 += 4;
    if (v8 == v10) {
      goto LABEL_9;
    }
  }
  __int16 v50 = +[MLCLog framework];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
    ANE_ValidateElementWiseUnit_cold_4(v50, v51, v52, v53, v54, v55, v56, v57);
  }

  uint64_t v7 = 0;
LABEL_37:

  return v7;
}

uint64_t ANE_ValidateInputViewUnit(void *a1, void *a2, int a3)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateInputViewUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateInputViewUnit_onceToken, &__block_literal_global_89);
  }
  if ((ANE_ValidateInputViewUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:0];
    memset(v47, 0, sizeof(v47));
    if (!ANE_BuildANECTensorDesc((uint64_t)v47, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateInputViewUnit_cold_4(v9, v26, v27, v28, v29, v30, v31, v32);
      }
      uint64_t v7 = 0;
      goto LABEL_24;
    }
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    uint64_t v45 = 0;
    ANECInputViewLayerDescInitialize();
    id v46 = [v9 objectForKeyedSubscript:@"Dimension"];

    uint64_t v10 = [v9 objectForKeyedSubscript:@"Offset"];
    int v11 = [v10 unsignedIntegerValue];

    int v12 = [v9 objectForKeyedSubscript:@"Size"];
    int v13 = [v12 unsignedIntegerValue];

    int v43 = v11;
    int v44 = v13;
    long long v14 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v42 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v42, v14))
    {
      int v33 = +[MLCLog framework];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateInputViewUnit_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);
      }

      uint64_t v7 = 0;
      goto LABEL_23;
    }
    int v15 = ANECValidateInputViewLayer();
    uint64_t v7 = v15 == 0;
    if (v15)
    {
      int v16 = v15;
      uint64_t v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateInputViewUnit";
        __int16 v49 = 1024;
        int v50 = v16;
        __int16 v51 = 2112;
        uint64_t v52 = v14;
        __int16 v53 = 2112;
        id v54 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v17, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_23;
      }
      uint64_t v18 = +[MLCLog framework];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      uint64_t v18 = +[MLCLog framework];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidateInputViewUnit_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_22;
  }
  uint64_t v7 = 0;
LABEL_25:

  return v7;
}

uint64_t ANE_ValidateArgMinMaxUnit(void *a1, void *a2, int a3)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateArgMinMaxUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateArgMinMaxUnit_onceToken, &__block_literal_global_97);
  }
  if ((ANE_ValidateArgMinMaxUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:0];
    memset(v48, 0, sizeof(v48));
    if (!ANE_BuildANECTensorDesc((uint64_t)v48, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateArgMinMaxUnit_cold_4(v9, v26, v27, v28, v29, v30, v31, v32);
      }
      uint64_t v7 = 0;
      goto LABEL_28;
    }
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    uint64_t v47 = 0;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    ANECKernelSizeInitialize();
    ANECStepInitialize();
    ANECPaddingInitialize();
    *(void *)&long long v43 = [v9 objectForKeyedSubscript:@"Mode"];

    uint64_t v10 = [v9 objectForKeyedSubscript:@"KernelHeight"];
    int v11 = v10;
    if (v10) {
      *(void *)&long long v44 = [v10 longValue];
    }
    int v12 = [v9 objectForKeyedSubscript:@"KernelWidth"];
    int v13 = v12;
    if (v12) {
      *((void *)&v43 + 1) = [v12 longValue];
    }
    long long v14 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v42 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v42, v14))
    {
      int v33 = +[MLCLog framework];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateArgMinMaxUnit_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);
      }

      uint64_t v7 = 0;
      goto LABEL_27;
    }
    int v15 = ANECValidateArgMinMaxLayer();
    uint64_t v7 = v15 == 0;
    if (v15)
    {
      int v16 = v15;
      uint64_t v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateArgMinMaxUnit";
        __int16 v50 = 1024;
        int v51 = v16;
        __int16 v52 = 2112;
        __int16 v53 = v14;
        __int16 v54 = 2112;
        id v55 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v17, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_27;
      }
      uint64_t v18 = +[MLCLog framework];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_27:

LABEL_28:
        goto LABEL_29;
      }
      uint64_t v18 = +[MLCLog framework];
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
LABEL_26:

        goto LABEL_27;
      }
    }
    ANE_ValidateArgMinMaxUnit_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_26;
  }
  uint64_t v7 = 0;
LABEL_29:

  return v7;
}

uint64_t ANE_ValidateGOCUnit(void *a1, void *a2, int a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateGOCUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateGOCUnit_onceToken, &__block_literal_global_108);
  }
  if ((ANE_ValidateGOCUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:0];
    memset(v40, 0, sizeof(v40));
    if (!ANE_BuildANECTensorDesc((uint64_t)v40, v8, a3))
    {
      uint64_t v21 = +[MLCLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateGOCUnit_cold_4(v21, v22, v23, v24, v25, v26, v27, v28);
      }

      uint64_t v7 = 0;
      goto LABEL_24;
    }
    int v39 = 0;
    ANECGOCLayerDescInitialize();
    uint64_t v9 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v38 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v38, v9))
    {
      uint64_t v29 = +[MLCLog framework];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateGOCUnit_cold_3(v29, v30, v31, v32, v33, v34, v35, v36);
      }

      uint64_t v7 = 0;
      goto LABEL_23;
    }
    int v10 = ANECValidateGOCLayer();
    uint64_t v7 = v10 == 0;
    if (v10)
    {
      int v11 = v10;
      int v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateGOCUnit";
        __int16 v42 = 1024;
        int v43 = v11;
        __int16 v44 = 2112;
        long long v45 = v9;
        __int16 v46 = 2112;
        id v47 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v12, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      uint64_t v7 = v7;
      if (!ANECUnitValidatorDelete()) {
        goto LABEL_23;
      }
      int v13 = +[MLCLog framework];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      int v13 = +[MLCLog framework];
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_22:

        goto LABEL_23;
      }
    }
    ANE_ValidateGOCUnit_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
    goto LABEL_22;
  }
  uint64_t v7 = 0;
LABEL_25:

  return v7;
}

uint64_t ANE_ValidateMatrixMultUnit(void *a1, void *a2, int a3)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateMatrixMultUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateMatrixMultUnit_onceToken, &__block_literal_global_110);
  }
  if (ANE_ValidateMatrixMultUnit_isAppleNeuralEngineAvailable)
  {
    uint64_t v7 = 0;
    goto LABEL_37;
  }
  uint64_t v8 = [v5 count];
  __int16 v61 = v56;
  uint64_t v9 = MEMORY[0x1F4188790]();
  if (!v9)
  {
LABEL_9:
    uint64_t v16 = [v6 objectForKeyedSubscript:@"Params"];
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    ANECMatrixMultLayerDescInitialize();
    uint64_t v17 = [v16 objectForKeyedSubscript:@"Bias"];
    LOBYTE(v66) = v17 != 0;

    uint64_t v18 = [v6 objectForKeyedSubscript:@"OutputChannels"];
    uint64_t v67 = [v18 longValue];

    uint64_t v19 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v65 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v65, v19))
    {
      int v39 = +[MLCLog framework];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateMatrixMultUnit_cold_3(v39, v40, v41, v42, v43, v44, v45, v46);
      }

      uint64_t v7 = 0;
      goto LABEL_36;
    }
    id v60 = v6;
    uint64_t v63 = 0;
    unint64_t v64 = 0;
    int v20 = ANECValidateMatrixMultLayer();
    uint64_t v7 = v20 == 0;
    if (v20)
    {
      int v21 = v20;
      BOOL v57 = v20 == 0;
      __int16 v59 = v16;
      uint64_t v22 = +[MLCLog framework];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v74[0]) = 136315906;
        *(void *)((char *)v74 + 4) = "ANE_ValidateMatrixMultUnit";
        WORD6(v74[0]) = 1024;
        *(_DWORD *)((char *)v74 + 14) = v21;
        WORD1(v74[1]) = 2112;
        *(void *)((char *)&v74[1] + 4) = v19;
        WORD6(v74[1]) = 2112;
        *(void *)((char *)&v74[1] + 14) = v60;
        _os_log_error_impl(&dword_1DD0C9000, v22, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)v74, 0x26u);
      }
      uint64_t v58 = v19;

      unint64_t v24 = v64;
      if (v64)
      {
        unint64_t v25 = 0;
        *(void *)&long long v23 = 136315650;
        long long v62 = v23;
        do
        {
          memcpy(v74, (const void *)(v63 + 552 * v25), 0x228uLL);
          uint64_t v26 = *(void *)&v74[0];
          if (*(void *)&v74[0])
          {
            uint64_t v27 = 0;
            do
            {
              uint64_t v28 = +[MLCLog framework];
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                uint64_t v29 = *((void *)v74 + v27 + 1);
                int v68 = v62;
                id v69 = "ANE_ValidateMatrixMultUnit";
                __int16 v70 = 2048;
                uint64_t v71 = v27;
                __int16 v72 = 2112;
                uint64_t v73 = v29;
                _os_log_error_impl(&dword_1DD0C9000, v28, OS_LOG_TYPE_ERROR, "%s: ANE hardware constraint violation %lu: %@", (uint8_t *)&v68, 0x20u);
              }

              ++v27;
            }
            while (v26 != v27);
            unint64_t v24 = v64;
          }
          ++v25;
        }
        while (v25 < v24);
      }
      int v30 = ANECUnitValidatorDelete();
      uint64_t v19 = v58;
      uint64_t v16 = v59;
      uint64_t v7 = v57;
      if (!v30) {
        goto LABEL_35;
      }
      uint64_t v31 = +[MLCLog framework];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_35:
        id v6 = v60;
LABEL_36:

        goto LABEL_37;
      }
      uint64_t v31 = +[MLCLog framework];
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_34:

        goto LABEL_35;
      }
    }
    ANE_ValidateMatrixMultUnit_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
    goto LABEL_34;
  }
  uint64_t v10 = 0;
  int v11 = &v56[-64 * v9];
  while (1)
  {
    memset(v74, 0, 64);
    int v12 = [v5 objectAtIndexedSubscript:v10];
    BOOL v13 = ANE_BuildANECTensorDesc((uint64_t)v74, v12, a3);

    if (!v13) {
      break;
    }
    long long v14 = v74[1];
    _OWORD *v11 = v74[0];
    v11[1] = v14;
    long long v15 = v74[3];
    void v11[2] = v74[2];
    v11[3] = v15;
    ++v10;
    v11 += 4;
    if (v8 == v10) {
      goto LABEL_9;
    }
  }
  id v47 = +[MLCLog framework];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
    ANE_ValidateMatrixMultUnit_cold_4(v47, v48, v49, v50, v51, v52, v53, v54);
  }

  uint64_t v7 = 0;
LABEL_37:

  return v7;
}

BOOL ANE_ValidateLayerNormUnit(void *a1, void *a2, int a3)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (ANE_ValidateLayerNormUnit_onceToken != -1) {
    dispatch_once(&ANE_ValidateLayerNormUnit_onceToken, &__block_literal_global_115);
  }
  if ((ANE_ValidateLayerNormUnit_isAppleNeuralEngineAvailable & 1) == 0)
  {
    uint64_t v8 = [v5 objectAtIndexedSubscript:0];
    memset(v49, 0, sizeof(v49));
    if (!ANE_BuildANECTensorDesc((uint64_t)v49, v8, a3))
    {
      uint64_t v9 = +[MLCLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateLayerNormUnit_cold_4(v9, v13, v14, v15, v16, v17, v18, v19);
      }
      BOOL v7 = 0;
      goto LABEL_31;
    }
    uint64_t v9 = [v6 objectForKeyedSubscript:@"Params"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"NumGroups"];
    if (v10)
    {
      int v11 = [v6 objectForKeyedSubscript:@"NumGroups"];
      uint64_t v12 = [v11 unsignedIntegerValue];
    }
    else
    {
      uint64_t v12 = 1;
    }

    uint64_t v48 = 0;
    memset(v47, 0, sizeof(v47));
    long long v46 = 0u;
    ANECLayerNormLayerDescInitialize();
    int v20 = [v9 objectForKeyedSubscript:@"Dimension"];
    *(void *)&long long v46 = [v20 count];
    if ([v20 count])
    {
      unint64_t v21 = 0;
      do
      {
        uint64_t v22 = [v20 objectAtIndexedSubscript:v21];

        *((void *)v47 + v21++) = v22;
      }
      while (v21 < [v20 count]);
    }
    *((void *)&v46 + 1) = v12;
    long long v23 = [softLinkClass_ANEDeviceInfo_1() aneSubType];
    uint64_t v45 = 0;
    if (!ANE_CreateUnitValidator((uint64_t)&v45, v23))
    {
      uint64_t v35 = +[MLCLog framework];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateLayerNormUnit_cold_3(v35, v36, v37, v38, v39, v40, v41, v42);
      }

      BOOL v7 = 0;
      goto LABEL_30;
    }
    int v24 = ANECValidateLayerNormLayer();
    BOOL v44 = v24 == 0;
    if (v24)
    {
      int v25 = v24;
      uint64_t v26 = +[MLCLog framework];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        __dst[0] = 136315906;
        *(void *)&__dst[1] = "ANE_ValidateLayerNormUnit";
        __int16 v51 = 1024;
        int v52 = v25;
        __int16 v53 = 2112;
        uint64_t v54 = v23;
        __int16 v55 = 2112;
        id v56 = v6;
        _os_log_error_impl(&dword_1DD0C9000, v26, OS_LOG_TYPE_ERROR, "%s: error code=%d from ANEC validate API. ANE hardware constraints violated on archType=%@ by unit=%@", (uint8_t *)__dst, 0x26u);
      }

      if (!ANECUnitValidatorDelete()) {
        goto LABEL_29;
      }
      uint64_t v27 = +[MLCLog framework];
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
    }
    else
    {
      if (!ANECUnitValidatorDelete())
      {
LABEL_29:
        BOOL v7 = v44;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      uint64_t v27 = +[MLCLog framework];
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    ANE_ValidateLayerNormUnit_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_28;
  }
  BOOL v7 = 0;
LABEL_32:

  return v7;
}

void __isAppleNeuralEngineAPIAvailable_block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_2 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_2, &__block_literal_global_119);
  }
  if (AppleNeuralEngineLibrary_frameworkLibrary_2 && softLinkClass_ANEDeviceInfo_1())
  {
    char v0 = 1;
  }
  else
  {
    id v1 = +[MLCLog framework];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __isAppleNeuralEngineAPIAvailable_block_invoke_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }

    char v0 = 0;
  }
  isAppleNeuralEngineAPIAvailable_isAvailable = v0;
}

void *__AppleNeuralEngineLibrary_block_invoke_2()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/AppleNeuralEngine.framework/AppleNeuralEngine", 1);
  AppleNeuralEngineLibrary_frameworkLibrary_2 = (uint64_t)result;
  return result;
}

id ANE_BuildReductionParams(int a1, void *a2, unint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  uint64_t v7 = ANE_Get4DReductionDimensions(a3, v5);
  if (!v7)
  {
    uint64_t v13 = 0;
    goto LABEL_27;
  }
  long long v23 = xmmword_1E6CB4BC8;
  long long v24 = *(_OWORD *)off_1E6CB4BD8;
  if ((a1 - 1) < 4)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", @"Reduction", kMLCANENetUnitType[0], v23, v24);
    [v6 setObject:*((void *)&v23 + (a1 - 1)) forKeyedSubscript:@"Type"];
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if ([v7 count])
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = [v7 objectAtIndexedSubscript:v9];
        int v11 = ANE_GetANECIRDimension([v10 unsignedIntegerValue]);

        [v8 addObject:v11];
        ++v9;
      }
      while (v9 < [v7 count]);
    }
    uint64_t v12 = (void *)[v8 copy];
    [v6 setObject:v12 forKeyedSubscript:@"Dimension"];

    goto LABEL_20;
  }
  if ((a1 - 5) > 1)
  {
    uint64_t v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      ANE_BuildReductionParams_cold_1();
    }
  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", @"ArgMinMax", kMLCANENetUnitType[0], v23, v24);
    uint64_t v14 = [v7 objectAtIndexedSubscript:0];
    uint64_t v15 = [v14 unsignedIntegerValue];

    if ((unint64_t)(v15 - 2) < 2)
    {
      uint64_t v16 = @"SpatialArgMax";
      uint64_t v17 = @"SpatialArgMin";
LABEL_16:
      if (a1 == 6) {
        uint64_t v19 = v17;
      }
      else {
        uint64_t v19 = v16;
      }
      [v6 setObject:v19 forKeyedSubscript:@"Mode"];
LABEL_20:
      uint64_t v13 = (void *)[v6 copy];
      goto LABEL_25;
    }
    if (v15 == 1)
    {
      uint64_t v16 = @"ChannelArgMax";
      uint64_t v17 = @"ChannelArgMin";
      goto LABEL_16;
    }
    int v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      ANE_BuildReductionParams_cold_2(v7);
    }
  }
  uint64_t v13 = 0;
LABEL_25:
  for (uint64_t i = 24; i != -8; i -= 8)

LABEL_27:

  return v13;
}

id ANE_Get4DReductionDimensions(unint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 < 5)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    if ([v3 count])
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = [v3 objectAtIndexedSubscript:v6];
        unint64_t v8 = [v7 unsignedIntegerValue];

        uint64_t v11 = 1;
        ANE_GetDimensionIn4DWithOnePrepended(a1, v8, &v11);
        unint64_t v9 = [NSNumber numberWithUnsignedInteger:v11];
        [v4 addObject:v9];

        ++v6;
      }
      while (v6 < [v3 count]);
    }
    id v5 = [v4 copy];
  }
  else
  {
    uint64_t v4 = +[MLCLog framework];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ANE_Get4DReductionDimensions_cold_1(v4);
    }
    id v5 = 0;
  }

  return v5;
}

id ANE_CreateReductionLayer(int a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v7 = ANE_BuildReductionParams(a1, v5, a3);

  if (v7)
  {
    unint64_t v8 = +[_MLCANEReductionParameters reductionUnitParametersWith:v7];
    unint64_t v9 = +[MLCANEDeviceOps deviceOpsWithType:30 params:v8];
    if (v9) {
      [v6 addObject:v9];
    }
    id v10 = v6;
  }
  else
  {
    uint64_t v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      ANE_CreateReductionLayer_cold_1(v11);
    }

    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

id ANE_CompileReductionLayer(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  uint64_t v7 = [a3 parentLayers];
  unint64_t v8 = [v7 objectAtIndexedSubscript:0];

  unint64_t v9 = [v6 objectAtIndexedSubscript:0];

  id v10 = [v9 params];
  uint64_t v11 = [v10 reductionParams];
  uint64_t v12 = (void *)[v11 mutableCopy];

  uint64_t v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v14 = [v5 objectAtIndexedSubscript:0];
  uint64_t v29 = 1;
  uint64_t v30 = 1;
  ANE_GetTensorWidthAndHeightWithOnePrepended(v14, &v30, &v29);
  uint64_t v15 = [v14 descriptor];
  uint64_t v16 = [v15 shape];
  unint64_t v17 = [v16 count];
  uint64_t v18 = [v8 dimensions];
  uint64_t v19 = ANE_Get4DReductionDimensions(v17, v18);

  int v20 = [v8 reductionType];
  if ((v20 - 1) < 4)
  {
    unint64_t v21 = +[_MLCANEPlistBuilder createUnitWithLayer:v8 unitParams:v12];
    if ((ANE_ValidateReductionUnit(v5, v21, 1) & 1) == 0)
    {
      uint64_t v22 = +[MLCLog framework];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        goto LABEL_16;
      }
      goto LABEL_17;
    }
LABEL_14:
    [v13 addObject:v21];

    uint64_t v27 = (void *)[v13 copy];
    goto LABEL_19;
  }
  if ((v20 - 5) > 1)
  {
    unint64_t v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      ANE_CompileReductionLayer_cold_1(v8, v21);
    }
    goto LABEL_18;
  }
  long long v23 = [v19 objectAtIndexedSubscript:0];
  uint64_t v24 = [v23 unsignedIntegerValue];

  if (v24 != 1)
  {
    if (v24 == 3)
    {
      [v12 setObject:&unk_1F38767F8 forKeyedSubscript:@"KernelHeight"];
      uint64_t v26 = [NSNumber numberWithUnsignedInteger:v30];
      [v12 setObject:v26 forKeyedSubscript:@"KernelWidth"];
    }
    else
    {
      if (v24 != 2)
      {
        unint64_t v21 = +[MLCLog framework];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          ANE_CompileReductionLayer_cold_2(v19);
        }
        goto LABEL_18;
      }
      uint64_t v25 = [NSNumber numberWithUnsignedInteger:v29];
      [v12 setObject:v25 forKeyedSubscript:@"KernelHeight"];

      [v12 setObject:&unk_1F38767F8 forKeyedSubscript:@"KernelWidth"];
    }
  }
  unint64_t v21 = +[_MLCANEPlistBuilder createUnitWithLayer:v8 unitParams:v12];
  if (ANE_ValidateArgMinMaxUnit(v5, v21, 1)) {
    goto LABEL_14;
  }
  uint64_t v22 = +[MLCLog framework];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
LABEL_16:
  }
    ANE_CompileReductionLayer_cold_3();
LABEL_17:

LABEL_18:
  uint64_t v27 = 0;
LABEL_19:

  return v27;
}

id ANE_CreateSoftmaxLayer(int a1, unint64_t a2, unint64_t a3)
{
  unint64_t v16 = 1;
  ANE_GetDimensionIn4DWithOnePrepended(a3, a2, (uint64_t *)&v16);
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v5 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [v5 setObject:@"Softmax" forKeyedSubscript:kMLCANENetUnitType[0]];
  id v6 = ANE_GetANECIRDimension(v16);
  [v5 setObject:v6 forKeyedSubscript:@"Dimension"];

  if (a1 == 1)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC08];
    unint64_t v8 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    [v8 setObject:@"Neuron" forKeyedSubscript:kMLCANENetUnitType[0]];
    [v8 setObject:@"Log2" forKeyedSubscript:@"Type"];
    unint64_t v9 = (void *)[v7 mutableCopy];
    [v9 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
    int v15 = 1060205080;
    __int16 v14 = 0;
    ANE_ConvertFp32ToInt16((uint64_t)&v15, &v14);
    id v10 = [NSNumber numberWithShort:v14];
    [v9 setObject:v10 forKeyedSubscript:@"ScaleScalar"];
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v8 = 0;
  }
  uint64_t v11 = +[_MLCANESoftmaxParameters softmaxUnitParametersWith:v5 neuronParams:v8 gocParams:v9];
  uint64_t v12 = +[MLCANEDeviceOps deviceOpsWithType:12 params:v11];
  if (v12) {
    [v4 addObject:v12];
  }

  return v4;
}

id ANE_CompileSoftmaxLayer(void *a1, uint64_t a2, void *a3)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  id v5 = [a3 parentLayers];
  id v6 = [v5 objectAtIndexedSubscript:0];

  uint64_t v7 = [v4 objectAtIndexedSubscript:0];

  unint64_t v8 = [v7 params];
  unint64_t v9 = [v8 softmaxParams];
  id v10 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v11 = +[_MLCANEPlistBuilder createUnitWithLayer:v6 unitParams:v9];
  uint64_t v12 = [v6 sourceTensors];
  char v13 = ANE_ValidateSoftmaxUnit(v12, v11, 1);

  if ((v13 & 1) == 0)
  {
    uint64_t v31 = +[MLCLog framework];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      ANE_CompileSoftmaxLayer_cold_3();
    }

    goto LABEL_27;
  }
  [v10 addObject:v11];
  if ([v6 operation] == 1)
  {
    __int16 v14 = [v6 label];
    int v15 = [v14 stringByAppendingString:@"_0"];

    unint64_t v16 = [v6 label];
    unint64_t v17 = [v16 stringByAppendingString:@"_1"];

    uint64_t v18 = [v6 label];
    uint64_t v39 = [v18 stringByAppendingString:@"_2"];

    [v11 setObject:v15 forKeyedSubscript:@"Name"];
    uint64_t v19 = [v8 neuronParams];
    uint64_t v40 = (void *)v19;
    if (v19)
    {
      int v20 = +[_MLCANEPlistBuilder createUnitWithLayer:v6 unitParams:v19];
      uint64_t v38 = v17;
      [v20 setObject:v17 forKeyedSubscript:@"Name"];
      uint64_t v36 = v15;
      v43[0] = v15;
      unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
      [v20 setObject:v21 forKeyedSubscript:@"Bottom"];

      uint64_t v22 = [v6 sourceTensors];
      char v23 = ANE_ValidateNeuronUnit(v22, v20, 1);

      uint64_t v41 = v20;
      if (v23)
      {
        [v10 addObject:v20];
        uint64_t v24 = [v8 gocParams];
        uint64_t v37 = v24;
        if (v24)
        {
          uint64_t v25 = +[_MLCANEPlistBuilder createUnitWithLayer:v6 unitParams:v24];
          uint64_t v26 = (void *)v39;
          [v25 setObject:v39 forKeyedSubscript:@"Name"];
          uint64_t v42 = v38;
          uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
          [v25 setObject:v27 forKeyedSubscript:@"Bottom"];

          uint64_t v28 = [v6 sourceTensors];
          char v29 = ANE_ValidateGOCUnit(v28, v25, 1);

          if (v29)
          {
            [v10 addObject:v25];
            int v30 = 0;
          }
          else
          {
            uint64_t v33 = +[MLCLog framework];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              ANE_CompileSoftmaxLayer_cold_3();
            }

            int v30 = 1;
          }
          int v15 = v36;
        }
        else
        {
          uint64_t v25 = +[MLCLog framework];
          int v15 = v36;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            ANE_CompileSoftmaxLayer_cold_2(v25);
          }
          int v30 = 1;
          uint64_t v26 = (void *)v39;
        }

        unint64_t v17 = v38;
      }
      else
      {
        uint64_t v37 = +[MLCLog framework];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          ANE_CompileSoftmaxLayer_cold_3();
        }
        int v30 = 1;
        int v15 = v36;
        uint64_t v26 = (void *)v39;
      }
    }
    else
    {
      uint64_t v32 = +[MLCLog framework];
      uint64_t v41 = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        ANE_CompileSoftmaxLayer_cold_1(v32);
      }
      int v30 = 1;
      uint64_t v26 = (void *)v39;
    }

    if (v30)
    {
LABEL_27:
      uint64_t v34 = 0;
      goto LABEL_29;
    }
  }
  uint64_t v34 = (void *)[v10 copy];
LABEL_29:

  return v34;
}

id buildBNNSDescInputWeightMomentumForOneGate(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t v5 = a3 - 1;
  if (!a5) {
    a1 = a2;
  }
  if (a5) {
    uint64_t v5 = 1;
  }
  uint64_t v7 = 1;
  if (a4) {
    uint64_t v7 = 2;
  }
  *((void *)&v10 + 1) = a1;
  *(void *)&long long v11 = a2;
  *((void *)&v11 + 1) = v7;
  *(void *)&long long v12 = v5;
  DWORD1(v20) = 1065353216;
  LODWORD(v19) = 65568;
  DWORD1(v10) = 131328;
  unint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v10 length:176];

  return v8;
}

id buildBNNSDescHiddenWeightMomentumForOneGate(uint64_t a1, unint64_t a2, int a3)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = 1;
  if (a3) {
    uint64_t v3 = 2;
  }
  long long v13 = 0uLL;
  long long v14 = 0uLL;
  long long v11 = 0uLL;
  long long v12 = 0uLL;
  long long v9 = 0uLL;
  long long v10 = 0uLL;
  *((void *)&v6 + 1) = a1;
  *(void *)&long long v7 = a1;
  *((void *)&v7 + 1) = v3;
  long long v8 = a2;
  DWORD1(v16) = 1065353216;
  LODWORD(v15) = 65568;
  DWORD1(v6) = 131328;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v6 length:176];

  return v4;
}

id createNewBNNSNDArrayForLSTM(size_t a1, _OWORD *a2)
{
  long long v2 = a2[9];
  long long v10 = a2[8];
  long long v11 = v2;
  long long v12 = a2[10];
  long long v3 = a2[5];
  v9[4] = a2[4];
  v9[5] = v3;
  long long v4 = a2[7];
  v9[6] = a2[6];
  v9[7] = v4;
  long long v5 = a2[1];
  v9[0] = *a2;
  v9[1] = v5;
  long long v6 = a2[3];
  v9[2] = a2[2];
  v9[3] = v6;
  *((void *)&v10 + 1) = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
  long long v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v9 length:176];

  return v7;
}

BOOL CPU_BuildBNNSLSTMInputAndOutput(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a1[2] = a2;
  a1[4] = a3;
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  uint64_t v11 = a1[3];
  int v12 = *((_DWORD *)a1 + 11);
  id v13 = a5;
  long long v14 = [v13 combinedInputsBuffer];
  int v30 = [v13 combinedOutputsBuffer];

  if (v9 == a4)
  {
    uint64_t v27 = v9;
    if (v12) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    a1[29] = a4;
    a1[30] = a2;
    a1[31] = a3;
    *((_DWORD *)a1 + 92) = 65568;
    a1[51] = v10;
    a1[52] = a2;
    a1[53] = v15;
    a1[54] = v11;
    *((_DWORD *)a1 + 136) = 65568;
    a1[73] = v10;
    a1[74] = a2;
    a1[75] = v15;
    a1[76] = v11;
    uint64_t v26 = v14;
    size_t v16 = v10 * a2 * (v11 << (v12 & 1));
    *((_DWORD *)a1 + 180) = 65568;
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL), 4 * v16, 1);
    id v25 = objc_claimAutoreleasedReturnValue();
    a1[89] = [v25 bytes];
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL), 4 * v16, 1);
    id v28 = objc_claimAutoreleasedReturnValue();
    a1[67] = [v28 bytes];
    uint64_t v24 = a3 * a2;
    uint64_t v29 = a4;
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(a3 * a2 * a4, 4uLL, 0x100004052888210uLL), 4 * a3 * a2 * a4, 1);
    id v17 = objc_claimAutoreleasedReturnValue();
    a1[45] = [v17 bytes];
    a1[95] = v10;
    a1[96] = v15;
    a1[97] = a2;
    a1[98] = a3;
    *((_DWORD *)a1 + 224) = 65568;
    a1[117] = v10;
    a1[118] = a2;
    a1[119] = v15;
    a1[120] = v11;
    *((_DWORD *)a1 + 268) = 65568;
    a1[139] = v10;
    a1[140] = a2;
    a1[141] = v15;
    uint64_t v9 = v27;
    a1[142] = v11;
    *((_DWORD *)a1 + 312) = 65568;
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL), 4 * v16, 1);
    id v18 = objc_claimAutoreleasedReturnValue();
    a1[133] = [v18 bytes];
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v16, 4uLL, 0x100004052888210uLL), 4 * v16, 1);
    id v19 = objc_claimAutoreleasedReturnValue();
    a1[155] = [v19 bytes];
    [v26 addObject:v17];
    [v26 addObject:v28];
    [v26 addObject:v25];
    objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(4 * v10 * (v24 << (v12 & 1)), 0x100004052888210uLL), 4 * v10 * (v24 << (v12 & 1)), 1);
    id v20 = objc_claimAutoreleasedReturnValue();
    a1[111] = [v20 bytes];
    unint64_t v21 = v30;
    [v30 addObject:v20];
    [v30 addObject:v18];
    [v30 addObject:v19];

    a4 = v29;
    long long v14 = v26;
  }
  else
  {
    unint64_t v21 = v30;
    uint64_t v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      CPU_BuildBNNSLSTMInputAndOutput_cold_1(v9, a4, v22);
    }
  }
  return v9 == a4;
}

void setBiasOptimizerData(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v27 = a1;
  id v32 = a2;
  uint64_t v7 = [v27 numLayers];
  unsigned int v8 = [v27 biDirectional];
  uint64_t v9 = [v27 hiddenSize];
  uint64_t v10 = [v27 biasMomentumData];
  uint64_t v26 = a4;
  uint64_t v11 = [v10 objectAtIndexedSubscript:a4];

  id v25 = v11;
  uint64_t v12 = v8;
  uint64_t __n = 4 * v9;
  uint64_t v31 = *(void *)([v25 bytes] + 136);
  uint64_t v13 = v7;
  if (v7)
  {
    uint64_t v14 = v9;
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = 0;
      char v17 = 1;
      do
      {
        char v18 = v17;
        id v19 = (void *)(v31 + 4 * (v16 + (v15 << v12)) * v14);
        id v20 = [v32 objectAtIndexedSubscript:a3 + 4 * (v15 + v16 * v13)];
        unint64_t v21 = [v20 optimizerData];
        uint64_t v22 = [v21 objectAtIndexedSubscript:a5];
        memcpy(v19, (const void *)[v22 bytes], __n);

        if (!v12) {
          break;
        }
        char v17 = 0;
        uint64_t v16 = 1;
      }
      while ((v18 & 1) != 0);
      ++v15;
    }
    while (v15 != v13);
  }
  char v23 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v31 length:__n * (v13 << v12) freeWhenDone:0];
  uint64_t v24 = [v27 biasMomentumDataBytes];
  [v24 setObject:v23 atIndexedSubscript:v26];
}

void setBNNSLSTMGateDesc(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 inputSize];
  uint64_t v5 = [v3 hiddenSize];
  int v6 = [v3 isBidirectional];
  char v7 = v6;
  if (v6) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  unint64_t v9 = [v3 layerCount];
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v8;
  *(void *)(a1 + 32) = 1;
  *(void *)(a1 + 360) = v5;
  *(void *)(a1 + 368) = v5;
  *(void *)(a1 + 376) = v8;
  *(void *)(a1 + 384) = v9;
  *(void *)(a1 + 516) = 1065353216;
  *(void *)(a1 + 164) = 1065353216;
  *(_DWORD *)(a1 + 144) = 65568;
  *(_DWORD *)(a1 + 496) = 65568;
  *(_DWORD *)(a1 + 4) = 131328;
  *(_DWORD *)(a1 + 356) = 131328;
  int v10 = [v3 usesBiases];

  if (v10)
  {
    *(void *)(a1 + 712) = v5;
    *(void *)(a1 + 720) = v8;
    *(void *)(a1 + 728) = v9;
    *(void *)(a1 + 776) = 1;
    *(void *)(a1 + 784) = v5;
    *(void *)(a1 + 792) = v5 << v7;
    *(void *)(a1 + 868) = 1065353216;
    *(_DWORD *)(a1 + 848) = 65568;
    *(_DWORD *)(a1 + 708) = 229376;
  }
  if (v9 >= 2)
  {
    *(void *)(a1 + 184) = v5;
    *(void *)(a1 + 192) = v5;
    *(void *)(a1 + 200) = v8;
    *(void *)(a1 + 208) = v9 - 1;
    *(void *)(a1 + 340) = 1065353216;
    *(_DWORD *)(a1 + 320) = 65568;
    *(_DWORD *)(a1 + 180) = 131328;
  }
}

void addInputWeightPointersToGate(uint64_t a1, void *a2, int a3, unint64_t a4, uint64_t a5, void *a6, int a7)
{
  id v13 = a2;
  id v14 = a6;
  if (!a7)
  {
    unint64_t v22 = a4 - 1;
    char v23 = malloc_type_malloc(8 * ((a4 - 1) << a3), 0x80040B8603338uLL);
    if (v23)
    {
      char v17 = v23;
      uint64_t v38 = 8 * ((a4 - 1) << a3);
      uint64_t v39 = a1;
      id v40 = v14;
      if (a4 >= 2)
      {
        uint64_t v24 = 0;
        uint64_t v25 = a5 + 4;
        uint64_t v41 = 4 * a4;
        do
        {
          uint64_t v26 = objc_msgSend(v13, "objectAtIndexedSubscript:", v25, v38, v39, v40);
          id v27 = [v26 data];
          v17[v24 << a3] = [v27 bytes];

          if (a3)
          {
            id v28 = [v13 objectAtIndexedSubscript:v41 + v25];
            id v29 = [v28 data];
            v17[(v24 << a3) + 1] = [v29 bytes];
          }
          v25 += 4;
          ++v24;
        }
        while (v22 != v24);
      }
      id v14 = v40;
      *(void *)(v39 + 312) = v17;
      size_t v15 = v38;
      goto LABEL_16;
    }
    int v30 = +[MLCLog framework];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
LABEL_20:
    addInputWeightPointersToGate_cold_1(v30, v31, v32, v33, v34, v35, v36, v37);
    goto LABEL_21;
  }
  if (a3) {
    size_t v15 = 16;
  }
  else {
    size_t v15 = 8;
  }
  uint64_t v16 = malloc_type_malloc(v15, 0x80040B8603338uLL);
  if (!v16)
  {
    int v30 = +[MLCLog framework];
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  char v17 = v16;
  char v18 = [v13 objectAtIndexedSubscript:a5];
  id v19 = [v18 data];
  void *v17 = [v19 bytes];

  if (a3)
  {
    id v20 = [v13 objectAtIndexedSubscript:a5 + 4 * a4];
    id v21 = [v20 data];
    v17[1] = [v21 bytes];
  }
  *(void *)(a1 + 136) = v17;
LABEL_16:
  int v30 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v17, v15, 1, v38, v39, v40);
  [v14 addObject:v30];
LABEL_21:
}

id createParameterPointersForGate(void *a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  uint64_t v11 = malloc_type_malloc(8 * (a3 << a4), 0x80040B8603338uLL);
  if (v11)
  {
    uint64_t v12 = v11;
    if (a3)
    {
      uint64_t v13 = 0;
      do
      {
        id v14 = [v9 objectAtIndexedSubscript:a2];
        id v15 = [v14 data];
        v12[v13 << a4] = [v15 bytes];

        if (a4)
        {
          uint64_t v16 = [v9 objectAtIndexedSubscript:4 * a3 + a2];
          id v17 = [v16 data];
          v12[(v13 << a4) + 1] = [v17 bytes];
        }
        ++v13;
        a2 += 4;
      }
      while (a3 != v13);
    }
    char v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:8 * (a3 << a4) freeWhenDone:1];
    [v10 addObject:v18];
  }
  else
  {
    id v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      createParameterPointersForGate_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    char v18 = 0;
  }

  return v18;
}

id createBiDirectionalAndStackedGateWeightData(size_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v24 = a2;
  size_t v20 = a1;
  id v21 = a7;
  uint64_t v12 = (char *)malloc_type_malloc(a1, 0xECD43C9BuLL);
  if (a4)
  {
    uint64_t v13 = 0;
    uint64_t v22 = 4 * a4;
    do
    {
      id v14 = objc_msgSend(v24, "objectAtIndexedSubscript:", a5, v20);
      id v15 = [v14 data];
      memcpy(&v12[4 * (v13 << a3)], (const void *)[v15 bytes], 4 * a6);

      if (a3)
      {
        uint64_t v16 = [v24 objectAtIndexedSubscript:v22 + a5];
        id v17 = [v16 data];
        memcpy(&v12[4 * (v13 << a3) + 4 * a6], (const void *)[v17 bytes], 4 * a6);
      }
      a5 += 4;
      v13 += a6;
      --a4;
    }
    while (a4);
  }
  char v18 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", v12, v20, 1, v20);
  [v21 addObject:v18];

  return v18;
}

NSObject *ANE_CreatePoolingLayer(void *a1, void *a2)
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if ((unint64_t)[v3 dilationRateInX] <= 1
    && (unint64_t)[v3 dilationRateInY] < 2)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    [v13 setObject:@"Pooling" forKeyedSubscript:kMLCANENetUnitType[0]];
    int v14 = [v3 poolingType];
    switch(v14)
    {
      case 1:
        uint64_t v16 = @"Max";
        id v17 = @"Negative";
        goto LABEL_11;
      case 3:
        uint64_t v22 = +[MLCLog framework];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
LABEL_17:
        }
          ANE_CreatePoolingLayer_cold_2(v3);
        break;
      case 2:
        id v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "countIncludesPadding") ^ 1);
        [v13 setObject:v15 forKeyedSubscript:@"AverageCountExcludePadding"];

        uint64_t v16 = @"Avg";
        id v17 = @"Zero";
LABEL_11:
        [v13 setObject:v16 forKeyedSubscript:@"Type"];
        [v13 setObject:v17 forKeyedSubscript:@"PaddingMode"];
        char v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "kernelWidth"));
        [v13 setObject:v18 forKeyedSubscript:@"KernelWidth"];

        id v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "kernelHeight"));
        [v13 setObject:v19 forKeyedSubscript:@"KernelHeight"];

        [v13 setObject:&unk_1F3876810 forKeyedSubscript:@"KernelDepth"];
        size_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "strideInX"));
        id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "strideInY", v20));
        v30[1] = v21;
        v30[2] = &unk_1F3876810;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];

        [v13 setObject:v22 forKeyedSubscript:@"Step"];
        uint64_t v23 = [NSNumber numberWithUnsignedInteger:*a2];
        [v13 setObject:v23 forKeyedSubscript:@"PadLeft"];

        id v24 = [NSNumber numberWithUnsignedInteger:a2[1]];
        [v13 setObject:v24 forKeyedSubscript:@"PadRight"];

        uint64_t v25 = [NSNumber numberWithUnsignedInteger:a2[2]];
        [v13 setObject:v25 forKeyedSubscript:@"PadTop"];

        uint64_t v26 = [NSNumber numberWithUnsignedInteger:a2[3]];
        [v13 setObject:v26 forKeyedSubscript:@"PadBot"];

        [v13 setObject:&unk_1F3876828 forKeyedSubscript:@"PadFront"];
        [v13 setObject:&unk_1F3876828 forKeyedSubscript:@"PadBack"];
        id v27 = +[_MLCANEPoolingParameters poolingUnitParametersWith:v13];
        id v28 = +[MLCANEDeviceOps deviceOpsWithType:11 params:v27];
        if (v28) {
          [v4 addObject:v28];
        }
        uint64_t v12 = v4;

        goto LABEL_19;
      default:
        uint64_t v22 = +[MLCLog framework];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        break;
    }
    uint64_t v12 = MEMORY[0x1E4F1CBF0];
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    ANE_CreatePoolingLayer_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  uint64_t v12 = MEMORY[0x1E4F1CBF0];
LABEL_20:

  return v12;
}

BOOL ANE_ValidatePoolingLayer(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 sourceTensors];
  BOOL v5 = ANE_ValidatePoolingUnit(v4, v3, 1);

  return v5;
}

id ANE_CompilePoolingLayer(void *a1, void *a2, void *a3)
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = a1;
  uint64_t v65 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v8 = [v6 parentLayers];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];

  uint64_t v10 = [v7 objectAtIndexedSubscript:0];

  unint64_t v64 = v10;
  uint64_t v11 = [v10 params];
  uint64_t v12 = [v11 poolingParams];
  uint64_t v13 = (void *)[v12 mutableCopy];

  int v14 = [v5 objectAtIndexedSubscript:0];
  id v15 = [v14 descriptor];
  unint64_t v16 = [v15 dimensionCount];

  if (v16 != 4)
  {
    if (v16 != 3)
    {
      id v29 = +[MLCLog framework];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        ANE_CompilePoolingLayer_cold_1();
      }
LABEL_17:

      int v30 = 0;
      id v27 = v65;
      goto LABEL_22;
    }
    [v13 setObject:&unk_1F3876810 forKeyedSubscript:@"KernelHeight"];
    id v17 = [v13 objectForKeyedSubscript:@"Step"];
    char v18 = (void *)[v17 mutableCopy];

    [v18 setObject:&unk_1F3876810 atIndexedSubscript:1];
    id v19 = (void *)[v18 copy];
    [v13 setObject:v19 forKeyedSubscript:@"Step"];

    [v13 setObject:&unk_1F3876828 forKeyedSubscript:@"PadTop"];
    [v13 setObject:&unk_1F3876828 forKeyedSubscript:@"PadBot"];
  }
  size_t v20 = [v13 objectForKeyedSubscript:@"KernelWidth"];
  uint64_t v21 = [v20 unsignedIntegerValue];

  uint64_t v22 = [v13 objectForKeyedSubscript:@"KernelHeight"];
  uint64_t v23 = [v22 unsignedIntegerValue];

  uint64_t v68 = 0;
  uint64_t v69 = 0;
  id v24 = [v5 objectAtIndexedSubscript:0];
  ANE_GetTensorWidthAndHeightWithBatchFirst(v24, &v69, &v68);

  uint64_t v66 = 0;
  uint64_t v67 = 0;
  ANE_GetTensorWidthAndHeightWithBatchFirst(v6, &v67, &v66);
  if (v21 == v69 && v23 == v68 && v67 == 1 && v66 == 1)
  {
    if (+[MLCPlatformInfo isAneSubTypeVersionGreaterThanOrEqualTo:13])
    {
      uint64_t v25 = [v9 descriptor];
      int v26 = [v25 poolingType];

      if (v26 == 1)
      {
        int v28 = 3;
        id v27 = v65;
      }
      else
      {
        id v27 = v65;
        if (v26 != 2)
        {
          __int16 v51 = +[MLCLog framework];
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            ANE_CompilePoolingLayer_cold_2();
          }

          goto LABEL_21;
        }
        int v28 = 2;
      }
      if (v16 == 4)
      {
        id v29 = &unk_1F3876DE0;
      }
      else
      {
        uint64_t v50 = [NSNumber numberWithUnsignedInteger:2];
        v70[0] = v50;
        id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:1];
      }
      uint64_t v52 = ANE_BuildReductionParams(v28, v29, v16);
      if (v52)
      {
        uint64_t v31 = v52;
        __int16 v53 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v52];
        uint64_t v54 = [v9 sourceTensors];
        char v55 = ANE_ValidateReductionUnit(v54, v53, 1);

        if (v55)
        {
          id v27 = v65;
          [v65 addObject:v53];

          goto LABEL_40;
        }
        uint64_t v63 = +[MLCLog framework];
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          ANE_CompilePoolingLayer_cold_5((uint64_t)v53, (uint64_t)v9, v63);
        }

        goto LABEL_17;
      }
      uint64_t v31 = +[MLCLog framework];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        ANE_CompilePoolingLayer_cold_4(v31, v56, v57, v58, v59, v60, v61, v62);
      }
    }
    else
    {
      id v40 = [v13 objectForKeyedSubscript:@"Step"];
      id v29 = [v40 mutableCopy];

      [v29 setObject:&unk_1F3876810 atIndexedSubscript:0];
      [v29 setObject:&unk_1F3876810 atIndexedSubscript:1];
      id v41 = [v29 copy];
      [v13 setObject:v41 forKeyedSubscript:@"Step"];

      uint64_t v31 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v13];
      if (ANE_ValidatePoolingLayer(v9, v31))
      {
        id v27 = v65;
        [v65 addObject:v31];
LABEL_40:

        goto LABEL_14;
      }
      uint64_t v42 = +[MLCLog framework];
      id v27 = v65;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        ANE_CompilePoolingLayer_cold_6(v42, v43, v44, v45, v46, v47, v48, v49);
      }
    }
  }
  else
  {
    id v29 = +[_MLCANEPlistBuilder createUnitWithLayer:v9 unitParams:v13];
    if (ANE_ValidatePoolingLayer(v9, v29))
    {
      id v27 = v65;
      [v65 addObject:v29];
LABEL_14:

      int v30 = (void *)[v27 copy];
      goto LABEL_22;
    }
    uint64_t v31 = +[MLCLog framework];
    id v27 = v65;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      ANE_CompilePoolingLayer_cold_6(v31, v32, v33, v34, v35, v36, v37, v38);
    }
  }

LABEL_21:
  int v30 = 0;
LABEL_22:

  return v30;
}

id CPU_CreateLossLayer(uint64_t a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  int v4 = [v2 lossType];
  long long v20 = 0u;
  memset(v19, 0, sizeof(v19));
  int v5 = 9;
  switch(v4)
  {
    case 0:
      goto LABEL_20;
    case 1:
      int v5 = 3;
      goto LABEL_20;
    case 2:
      int v7 = 1;
      goto LABEL_11;
    case 3:
      int v7 = 2;
LABEL_11:
      LODWORD(v19[0]) = v7;
      DWORD2(v20) = getBNNSLossReductionFunction([v2 reductionType]);
      goto LABEL_12;
    case 4:
      int v5 = 10;
      goto LABEL_20;
    case 5:
      int v5 = 8;
      goto LABEL_20;
    case 6:
      LODWORD(v19[0]) = 4;
      DWORD2(v20) = getBNNSLossReductionFunction([v2 reductionType]);
      goto LABEL_16;
    case 7:
      int v5 = 7;
      goto LABEL_20;
    case 8:
      int v5 = 6;
LABEL_20:
      LODWORD(v19[0]) = v5;
      DWORD2(v20) = getBNNSLossReductionFunction([v2 reductionType]);
      goto LABEL_21;
    default:
      id v6 = +[MLCLog framework];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        CPU_CreateLossLayer_cold_1();
      }

      LODWORD(v19[0]) = 1;
      DWORD2(v20) = getBNNSLossReductionFunction([v2 reductionType]);
      if (v4 == 6)
      {
LABEL_16:
        [v2 delta];
        goto LABEL_17;
      }
      if (v4 == 3 || v4 == 2)
      {
LABEL_12:
        [v2 labelSmoothing];
LABEL_17:
        HIDWORD(v20) = v8;
      }
LABEL_21:
      uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v19 length:368];
      memset(v18, 0, sizeof(v18));
      memset(v17, 0, sizeof(v17));
      uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v18 length:176];
      uint64_t v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:176];
      v22[0] = v10;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
      uint64_t v21 = v11;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      int v14 = +[MLCCPUDeviceOps deviceOpsWithType:12 params:v9 inDeltaData:v12 outDeltaData:v13 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

      if (v14)
      {
        [v2 weight];
        objc_msgSend(v14, "setLossWeight:");
        [v3 addObject:v14];
      }
      id v15 = (void *)[v3 copy];

      return v15;
  }
}

uint64_t getBNNSLossReductionFunction(unsigned int a1)
{
  if (a1 < 3) {
    return dword_1DD1F0D5C[a1];
  }
  id v2 = +[MLCLog framework];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    getBNNSLossReductionFunction_cold_1();
  }

  return 0;
}

id CPU_CreateYOLOLossLayer(uint64_t a1, void *a2)
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
  LODWORD(v25[0]) = 5;
  int v4 = [v2 spatialSizeLossDescriptor];
  [v4 delta];
  int v28 = v5;

  int BNNSLossReductionFunction = getBNNSLossReductionFunction([v2 reductionType]);
  int v31 = [v2 shouldRescore];
  [v2 scaleSpatialPositionLoss];
  int v32 = v6;
  [v2 scaleSpatialSizeLoss];
  int v33 = v7;
  [v2 scaleObjectConfidenceLoss];
  int v34 = v8;
  [v2 scaleNoObjectConfidenceLoss];
  int v35 = v9;
  [v2 scaleClassLoss];
  int v36 = v10;
  [v2 minimumIOUForObjectPresence];
  int v37 = v11;
  [v2 maximumIOUForObjectAbsence];
  int v38 = v12;
  *(void *)&long long v30 = [v2 anchorBoxCount];
  uint64_t v13 = [v2 anchorBoxes];

  id v14 = v13;
  uint64_t v39 = [v14 bytes];

  id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v25 length:440];
  memset(v24, 0, sizeof(v24));
  memset(v23, 0, sizeof(v23));
  unint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v24 length:176];
  id v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:176];
  v41[0] = v16;
  char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  id v40 = v17;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  long long v20 = +[MLCCPUDeviceOps deviceOpsWithType:18 params:v15 inDeltaData:v18 outDeltaData:v19 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  if (v20) {
    [v3 addObject:v20];
  }
  uint64_t v21 = (void *)[v3 copy];

  return v21;
}

uint64_t CPU_CompileLossLayer(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v25 = [a1 objectAtIndexedSubscript:0];
  id v26 = [v25 params];
  uint64_t v23 = [v26 bytes];
  int v7 = [v5 objectAtIndexedSubscript:0];
  int v8 = [v7 descriptor];
  int v9 = [v8 shape];
  id v24 = v5;
  int v10 = [v5 objectAtIndexedSubscript:0];
  int v11 = [v10 descriptor];
  int v12 = [v11 stride];
  uint64_t v13 = [v5 objectAtIndexedSubscript:0];
  id v14 = [v13 descriptor];
  CPU_BuildBNNSNDArrayDescriptor(v23 + 8, v9, v12, 0, [v14 dataType], 1, 0);

  id v15 = [v6 descriptor];
  unint64_t v16 = [v15 shape];
  id v17 = [v6 descriptor];
  char v18 = [v17 stride];
  id v19 = [v6 descriptor];
  CPU_BuildBNNSNDArrayDescriptor(v23 + 184, v16, v18, 0, [v19 dataType], 1, 0);

  memset(v27, 0, sizeof(v27));
  LODWORD(v27[0]) = 1;
  uint64_t v20 = MEMORY[0x1E01B0D10](v23, v27);
  if (v20)
  {
    uint64_t v21 = [v24 objectAtIndexedSubscript:0];
    [v25 setSourceStride:CPU_SetBatchStride(v21)];

    [v25 setResultStride:CPU_SetBatchStride(v6)];
  }

  return v20;
}

uint64_t CPU_CompileYOLOLossLayer(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v60 = a3;
  uint64_t v59 = [a1 objectAtIndexedSubscript:0];
  id v58 = [v59 params];
  uint64_t v6 = [v58 bytes];
  int v7 = [v5 objectAtIndexedSubscript:0];
  int v8 = [v7 descriptor];
  int v9 = [v8 shape];
  int v10 = [v9 objectAtIndexedSubscript:3];
  *(void *)(v6 + 376) = [v10 unsignedIntegerValue];

  int v11 = [v5 objectAtIndexedSubscript:0];
  int v12 = [v11 descriptor];
  uint64_t v13 = [v12 shape];
  id v14 = [v13 objectAtIndexedSubscript:2];
  *(void *)(v6 + 368) = [v14 unsignedIntegerValue];

  id v15 = [v5 objectAtIndexedSubscript:0];
  unint64_t v16 = [v15 descriptor];
  id v17 = [v16 shape];
  char v18 = [v17 objectAtIndexedSubscript:1];
  *(void *)(v6 + 392) = (unint64_t)[v18 unsignedIntegerValue] / *(void *)(v6 + 384);

  *(_DWORD *)(v6 + 12) = 0x10000;
  id v19 = v5;
  uint64_t v56 = [v5 objectAtIndexedSubscript:0];
  uint64_t v54 = [v56 descriptor];
  __int16 v53 = [v54 shape];
  uint64_t v52 = [v53 objectAtIndexedSubscript:3];
  uint64_t v20 = [v52 unsignedIntegerValue];
  uint64_t v61 = v19;
  uint64_t v21 = [v19 objectAtIndexedSubscript:0];
  uint64_t v22 = [v21 descriptor];
  uint64_t v23 = [v22 shape];
  id v24 = [v23 objectAtIndexedSubscript:2];
  uint64_t v25 = [v24 unsignedIntegerValue] * v20;
  id v26 = [v19 objectAtIndexedSubscript:0];
  id v27 = [v26 descriptor];
  int v28 = [v27 shape];
  long long v29 = [v28 objectAtIndexedSubscript:1];
  *(void *)(v6 + 16) = v25 * [v29 unsignedIntegerValue];

  *(void *)(v6 + 80) = 1;
  *(void *)(v6 + 172) = 1065353216;
  long long v30 = [v61 objectAtIndexedSubscript:0];
  int v31 = [v30 descriptor];
  int v32 = [v31 dataType];

  int v33 = 65552;
  if (v32 == 1)
  {
    int v33 = 65568;
  }
  else if (v32 != 3)
  {
    int v34 = +[MLCLog framework];
    int v35 = v61;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      CPU_CompileYOLOLossLayer_cold_1(v61, v34);
    }

    uint64_t v36 = 0;
    int v37 = v59;
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 152) = v33;
  *(_DWORD *)(v6 + 188) = 0x10000;
  uint64_t v57 = [v60 descriptor];
  char v55 = [v57 shape];
  int v38 = [v55 objectAtIndexedSubscript:3];
  uint64_t v39 = [v38 unsignedIntegerValue];
  id v40 = [v60 descriptor];
  id v41 = [v40 shape];
  uint64_t v42 = [v41 objectAtIndexedSubscript:2];
  uint64_t v43 = [v42 unsignedIntegerValue] * v39;
  uint64_t v44 = [v60 descriptor];
  uint64_t v45 = [v44 shape];
  uint64_t v46 = [v45 objectAtIndexedSubscript:1];
  *(void *)(v6 + 192) = v43 * [v46 unsignedIntegerValue];

  *(void *)(v6 + 256) = 1;
  *(void *)(v6 + 348) = 1065353216;
  uint64_t v47 = [v60 descriptor];
  int v48 = [v47 dataType];

  if (v48 == 1)
  {
    int v49 = 65568;
    int v37 = v59;
  }
  else
  {
    int v37 = v59;
    int v49 = 65552;
    if (v48 != 3)
    {
      uint64_t v50 = +[MLCLog framework];
      int v35 = v61;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        CPU_CompileYOLOLossLayer_cold_2(v60, v50);
      }

      uint64_t v36 = 0;
      goto LABEL_15;
    }
  }
  *(_DWORD *)(v6 + 328) = v49;
  memset(v62, 0, sizeof(v62));
  LODWORD(v62[0]) = 1;
  uint64_t v36 = MEMORY[0x1E01B0D10](v6, v62);
  int v35 = v61;
  if (v36)
  {
    [v37 setSourceStride:*(void *)(v6 + 80) * *(void *)(v6 + 16)];
    [v37 setResultStride:*(void *)(v6 + 256) * *(void *)(v6 + 192)];
  }
LABEL_15:

  return v36;
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

NSString *__cdecl MLCActivationTypeDebugDescription(MLCActivationType activationType)
{
  if ((activationType - 1) > 0x14) {
    return (NSString *)@"None";
  }
  else {
    return &off_1E6CB4BE8[activationType - 1]->isa;
  }
}

NSString *__cdecl MLCArithmeticOperationDebugDescription(MLCArithmeticOperation operation)
{
  if ((operation - 1) > 0x1D) {
    return (NSString *)@"Add";
  }
  else {
    return &off_1E6CB4C90[operation - 1]->isa;
  }
}

__CFString *MLCPredicateTypeDebugDescription(int a1)
{
  if ((a1 - 1) > 5) {
    return @"Equal";
  }
  else {
    return off_1E6CB4D80[a1 - 1];
  }
}

NSString *__cdecl MLCComparisonOperationDebugDescription(MLCComparisonOperation operation)
{
  if ((operation - 1) > 0xB) {
    return (NSString *)@"Equal";
  }
  else {
    return &off_1E6CB4DB0[operation - 1]->isa;
  }
}

NSString *__cdecl MLCPaddingPolicyDebugDescription(MLCPaddingPolicy paddingPolicy)
{
  id v1 = @"Same";
  if (paddingPolicy == MLCPaddingPolicyValid) {
    id v1 = @"Valid";
  }
  if (paddingPolicy == MLCPaddingPolicyUsePaddingSize) {
    return (NSString *)@"Use Padding Size";
  }
  else {
    return &v1->isa;
  }
}

NSString *__cdecl MLCLossTypeDebugDescription(MLCLossType lossType)
{
  if ((lossType - 1) > 8) {
    return (NSString *)@"Absolute Error";
  }
  else {
    return &off_1E6CB4E10[lossType - 1]->isa;
  }
}

NSString *__cdecl MLCReductionTypeDebugDescription(MLCReductionType reductionType)
{
  if ((reductionType - 1) > 9) {
    return (NSString *)@"None";
  }
  else {
    return &off_1E6CB4E58[reductionType - 1]->isa;
  }
}

NSString *__cdecl MLCPaddingTypeDebugDescription(MLCPaddingType paddingType)
{
  if ((paddingType - 1) > 2) {
    return (NSString *)@"Zero";
  }
  else {
    return &off_1E6CB4EA8[paddingType - 1]->isa;
  }
}

NSString *__cdecl MLCConvolutionTypeDebugDescription(MLCConvolutionType convolutionType)
{
  id v1 = @"Standard";
  if (convolutionType == MLCConvolutionTypeTransposed) {
    id v1 = @"Transposed";
  }
  if (convolutionType == MLCConvolutionTypeDepthwise) {
    return (NSString *)@"Depthwise";
  }
  else {
    return &v1->isa;
  }
}

NSString *__cdecl MLCPoolingTypeDebugDescription(MLCPoolingType poolingType)
{
  if ((poolingType - 2) > 2) {
    return (NSString *)@"Max";
  }
  else {
    return &off_1E6CB4EC0[poolingType - 2]->isa;
  }
}

NSString *__cdecl MLCSoftmaxOperationDebugDescription(MLCSoftmaxOperation operation)
{
  if (operation) {
    return (NSString *)@"Log Softmax";
  }
  else {
    return (NSString *)@"Softmax";
  }
}

NSString *__cdecl MLCSampleModeDebugDescription(MLCSampleMode mode)
{
  if (mode) {
    return (NSString *)@"Linear";
  }
  else {
    return (NSString *)@"Nearest";
  }
}

NSString *__cdecl MLCLSTMResultModeDebugDescription(MLCLSTMResultMode mode)
{
  if (mode) {
    return (NSString *)@"Output and States";
  }
  else {
    return (NSString *)@"Output";
  }
}

NSString *__cdecl MLCGradientClippingTypeDebugDescription(MLCGradientClippingType gradientClippingType)
{
  id v1 = @"By Value";
  if (gradientClippingType == MLCGradientClippingTypeByNorm) {
    id v1 = @"By Norm";
  }
  if (gradientClippingType == MLCGradientClippingTypeByGlobalNorm) {
    return (NSString *)@"By Global Norm";
  }
  else {
    return &v1->isa;
  }
}

id CPU_CreateFusedConvolutionNormalizationAndNeuronLayer(float a1, float a2, uint64_t a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, uint64_t a12, unsigned int a13)
{
  v117[1] = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a8;
  id v102 = a9;
  id v103 = a10;
  id v26 = v22;
  id v27 = a11;
  uint64_t v99 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v100 = v27;
  uint64_t v101 = v25;
  if (a13 <= 0x24)
  {
    if (((1 << a13) & 0xC00000) != 0)
    {
      int v29 = 0;
      unsigned int v28 = 1;
      goto LABEL_10;
    }
    if (((1 << a13) & 0xC0000000) != 0)
    {
      int v29 = 0;
      unsigned int v28 = 2;
      goto LABEL_10;
    }
    if (((1 << a13) & 0x1800000000) != 0)
    {
      unsigned int v28 = 3;
      int v29 = 1;
LABEL_10:
      bzero(v110, 0x348uLL);
      CPU_BuildBNNSConvolutionWeightAndBiasParams((uint64_t)v110, v23, v21, v26);
      bzero(v108, 0x468uLL);
      size_t v30 = [v23 outputFeatureChannelCount];
      int v31 = [NSNumber numberWithUnsignedInteger:v30];
      v117[0] = v31;
      int v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:1];
      int v33 = CPU_BuildBNNSNormalizationParams(v28, (uint64_t)v108, v32, v101, v102, v103, v100, a1, a2);

      if (v33 && (!v24 || setBNNSActivation((uint64_t)v109, v24)))
      {
        id v84 = v24;
        if (v29) {
          v109[6] = a12;
        }
        uint64_t v97 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v110 length:840];
        uint64_t v90 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v108 length:1128];
        memset(v107, 0, sizeof(v107));
        memset(v106, 0, sizeof(v106));
        long long v96 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v107 length:176];
        id v95 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v106 length:176];
        int v34 = [v21 descriptor];
        uint64_t v94 = +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v23, 0, 0, [v34 dataType]);

        int v35 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        uint64_t v36 = 3;
        for (uint64_t i = 0; i != 3; ++i)
        {
          int v38 = [v21 descriptor];
          uint64_t v39 = +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v23, 0, 0, [v38 dataType]);
          [v35 setObject:v39 atIndexedSubscript:i];
        }
        uint64_t v93 = v35;
        id v86 = v21;
        uint64_t v83 = v23;
        if (v26)
        {
          id v40 = [v26 descriptor];
          uint64_t v92 = +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v23, 0, [v40 dataType]);

          uint64_t v91 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          uint64_t v41 = 0;
          unint64_t v42 = 0x1E4F1C000;
          do
          {
            uint64_t v43 = [v26 descriptor];
            uint64_t v44 = +[_MLCCPUConvolution createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:](_MLCCPUConvolution, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v23, 0, [v43 dataType]);
            [v91 setObject:v44 atIndexedSubscript:v41];

            ++v41;
          }
          while (v41 != 3);
        }
        else
        {
          uint64_t v91 = 0;
          uint64_t v92 = 0;
          unint64_t v42 = 0x1E4F1C000uLL;
        }
        id v85 = v26;
        int v48 = objc_msgSend(*(id *)(v42 + 2488), "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL), 4 * v30, 1);
        uint64_t v98 = objc_msgSend(*(id *)(v42 + 2488), "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL), 4 * v30, 1);
        int v49 = [NSNumber numberWithUnsignedInteger:v30];
        long long v116 = v49;
        uint64_t v50 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
        __int16 v51 = v103;
        uint64_t v52 = [v103 descriptor];
        uint64_t v89 = v48;
        uint64_t v88 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v50, v48, [v52 dataType], 0);

        unint64_t v53 = 0x1E4F1C000uLL;
        size_t v54 = v30;
        long long v105 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        if (v103)
        {
          uint64_t v55 = 0;
          do
          {
            uint64_t v56 = [NSNumber numberWithUnsignedInteger:v54];
            int v115 = v56;
            uint64_t v57 = [*(id *)(v53 + 2424) arrayWithObjects:&v115 count:1];
            [v51 descriptor];
            uint64_t v58 = v36;
            uint64_t v59 = v51;
            size_t v60 = v54;
            uint64_t v62 = v61 = v53;
            uint64_t v63 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v57, 0, [v62 dataType], 0);
            [v105 setObject:v63 atIndexedSubscript:v55];

            unint64_t v53 = v61;
            size_t v54 = v60;
            __int16 v51 = v59;
            uint64_t v36 = v58;

            ++v55;
          }
          while (v58 != v55);
        }
        unint64_t v64 = [NSNumber numberWithUnsignedInteger:v54];
        long long v114 = v64;
        uint64_t v65 = [*(id *)(v53 + 2424) arrayWithObjects:&v114 count:1];
        unint64_t v66 = v53;
        uint64_t v67 = [v100 descriptor];
        uint64_t v87 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v65, v98, [v67 dataType], 0);

        long long v104 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
        if (v100)
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            uint64_t v69 = [NSNumber numberWithUnsignedInteger:v54];
            long long v113 = v69;
            __int16 v70 = [*(id *)(v66 + 2424) arrayWithObjects:&v113 count:1];
            uint64_t v71 = [v100 descriptor];
            __int16 v72 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v70, 0, [v71 dataType], 0);
            [v104 setObject:v72 atIndexedSubscript:j];
          }
        }
        uint64_t v112 = v96;
        uint64_t v73 = [*(id *)(v66 + 2424) arrayWithObjects:&v112 count:1];
        uint64_t v111 = v95;
        __int16 v74 = [*(id *)(v66 + 2424) arrayWithObjects:&v111 count:1];
        uint64_t v75 = +[MLCCPUDeviceOps deviceOpsWithType:a13 params:v97 inDeltaData:v73 outDeltaData:v74 weightsDeltaData:v94 biasDeltaData:v92 weightsMomentumData:v93 biasMomentumData:v91];

        id v24 = v84;
        id v26 = v85;
        id v25 = v101;
        uint64_t v46 = v102;
        id v23 = v83;
        if (v75)
        {
          [v99 addObject:v75];
          [v75 setFusedPrimitiveParams:v90];
          [v75 setBetaDeltaData:v88];
          [v75 setGammaDeltaData:v87];
          [v75 setBetaDeltaDataBytes:v89];
          [v75 setGammaDeltaDataBytes:v98];
          __int16 v76 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          [v75 setWeightsMomentumDataBytes:v76];

          if (v85)
          {
            uint64_t v77 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            [v75 setBiasMomentumDataBytes:v77];
          }
          [v75 setBetaMomentumData:v105];
          [v75 setGammaMomentumData:v104];
          __int16 v78 = (void *)MEMORY[0x1E4F1CBF0];
          int v79 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          [v75 setBetaMomentumDataBytes:v79];

          __int16 v80 = (void *)[v78 mutableCopy];
          [v75 setGammaMomentumDataBytes:v80];

          if (v101) {
            [v75 setMovingMean:v101];
          }
          if (v102) {
            [v75 setMovingVariance:v102];
          }
          objc_msgSend(v75, "setPaddingPolicy:", objc_msgSend(v83, "paddingPolicy"));
        }
        uint64_t v45 = (void *)[v99 copy];

        id v21 = v86;
        uint64_t v47 = v103;
        id v27 = v100;
      }
      else
      {
        uint64_t v45 = (void *)MEMORY[0x1E4F1CBF0];
        id v25 = v101;
        uint64_t v46 = v102;
        uint64_t v47 = v103;
        id v27 = v100;
      }
      goto LABEL_41;
    }
  }
  if (a13 - 6 < 2)
  {
    int v29 = 0;
    unsigned int v28 = 0;
    goto LABEL_10;
  }
  id v81 = +[MLCLog framework];
  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
    CPU_CreateFusedConvolutionNormalizationAndNeuronLayer_cold_1();
  }

  uint64_t v45 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v46 = v102;
  uint64_t v47 = v103;
LABEL_41:

  return v45;
}

void CPU_BuildBNNSConvolutionWeightAndBiasParams(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v37 = a2;
  id v7 = a3;
  id v8 = a4;
  *(void *)(a1 + 752) = [v37 strideInX];
  *(void *)(a1 + 760) = [v37 strideInY];
  *(void *)(a1 + 768) = [v37 dilationRateInX];
  *(void *)(a1 + 776) = [v37 dilationRateInY];
  if ([v37 usesDepthwiseConvolution]) {
    uint64_t v9 = [v37 inputFeatureChannelCount];
  }
  else {
    uint64_t v9 = [v37 groupCount];
  }
  *(void *)(a1 + 800) = v9;
  *(_DWORD *)(a1 + 180) = 0x40000;
  int v10 = [v7 descriptor];
  int v11 = [v10 shape];
  uint64_t v12 = [v11 count];

  if (v12 == 2)
  {
    *(int64x2_t *)(a1 + 184) = vdupq_n_s64(1uLL);
  }
  else
  {
    uint64_t v13 = [v7 descriptor];
    id v14 = [v13 shape];
    uint64_t v15 = [v14 count];

    unint64_t v16 = [v7 descriptor];
    id v17 = [v16 shape];
    char v18 = v17;
    if (v15 == 3)
    {
      id v19 = [v17 objectAtIndexedSubscript:2];
      *(void *)(a1 + 184) = [v19 unsignedIntegerValue];

      *(void *)(a1 + 192) = 1;
    }
    else
    {
      uint64_t v20 = [v17 objectAtIndexedSubscript:3];
      *(void *)(a1 + 184) = [v20 unsignedIntegerValue];

      id v21 = [v7 descriptor];
      id v22 = [v21 shape];
      id v23 = [v22 objectAtIndexedSubscript:2];
      *(void *)(a1 + 192) = [v23 unsignedIntegerValue];
    }
  }
  unint64_t v24 = *(void *)(a1 + 800);
  unint64_t v25 = [v37 inputFeatureChannelCount];
  if (v24 >= 2) {
    v25 /= *(void *)(a1 + 800);
  }
  *(void *)(a1 + 200) = v25;
  *(void *)(a1 + 208) = [v37 outputFeatureChannelCount];
  uint64_t v26 = *(void *)(a1 + 184);
  uint64_t v27 = *(void *)(a1 + 192);
  *(void *)(a1 + 248) = 1;
  *(void *)(a1 + 256) = v26;
  uint64_t v28 = v27 * v26;
  uint64_t v29 = *(void *)(a1 + 200) * v27 * v26;
  *(void *)(a1 + 264) = v28;
  *(void *)(a1 + 272) = v29;
  id v30 = [v7 data];
  *(void *)(a1 + 312) = [v30 bytes];

  int v31 = [v7 descriptor];
  *(_DWORD *)(a1 + 320) = CPU_BNNSDataType([v31 dataType]);

  *(void *)(a1 + 340) = 1065353216;
  if (v8)
  {
    *(_DWORD *)(a1 + 532) = 0x10000;
    int v32 = [v8 descriptor];
    int v33 = [v32 shape];
    int v34 = [v33 objectAtIndexedSubscript:1];
    *(void *)(a1 + 536) = [v34 unsignedIntegerValue];

    id v35 = [v8 data];
    *(void *)(a1 + 664) = [v35 bytes];

    uint64_t v36 = [v8 descriptor];
    *(_DWORD *)(a1 + 672) = CPU_BNNSDataType([v36 dataType]);

    *(void *)(a1 + 692) = 1065353216;
  }
  if ([v37 paddingPolicy] == 2)
  {
    *(void *)(a1 + 784) = [v37 paddingSizeInX];
    *(void *)(a1 + 792) = [v37 paddingSizeInY];
  }
}

void *CPU_CompileFusedConvolutionNormalizationAndNeuronLayer(void *a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 objectAtIndexedSubscript:0];
  id v8 = [v7 params];
  uint64_t v9 = (void *)[v8 bytes];
  int v10 = [v7 deviceOpType];
  switch(v10)
  {
    case 22:
      int v11 = 0;
      uint64_t v12 = 0x300000000;
      goto LABEL_15;
    case 23:
      uint64_t v12 = 0x300000006;
      goto LABEL_14;
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 32:
    case 33:
    case 34:
      goto LABEL_6;
    case 30:
      int v11 = 0;
      uint64_t v12 = 0x400000000;
      goto LABEL_15;
    case 31:
      uint64_t v12 = 0x400000006;
      goto LABEL_14;
    case 35:
      int v11 = 0;
      uint64_t v12 = 0x500000000;
      goto LABEL_15;
    case 36:
      uint64_t v12 = 0x500000006;
      goto LABEL_14;
    default:
      if (v10 == 6)
      {
        int v11 = 0;
        uint64_t v12 = 0x200000000;
      }
      else
      {
        if (v10 != 7)
        {
LABEL_6:
          uint64_t v13 = +[MLCLog framework];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            CPU_CompileFusedConvolutionNormalizationAndNeuronLayer_cold_1(v7, v13);
          }

          goto LABEL_18;
        }
        uint64_t v12 = 0x200000006;
LABEL_14:
        int v11 = 1;
      }
LABEL_15:
      *(float *)&double v14 = CPU_BuildBNNSConvolutionInputOutputParams(v9, v5, v6, v11, [v7 paddingPolicy]);
      uint64_t v15 = objc_msgSend(v7, "fusedPrimitiveParams", v14);

      id v8 = v15;
      unint64_t v16 = (void *)[v8 bytes];
      v29[0] = v6;
      id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      int v18 = CPU_BuildBNNSNormalizationInputOutputParams((uint64_t)v16, v17, v6, 0);

      if (!v18)
      {
LABEL_18:
        id v22 = 0;
        goto LABEL_22;
      }
      id v19 = [v6 descriptor];
      uint64_t v20 = [v19 shape];
      id v21 = [v20 objectAtIndexedSubscript:1];
      v16[3] = [v21 unsignedIntegerValue];

      memset(&v26, 0, sizeof(v26));
      v26.flags = 1;
      *(void *)filter_type = v12;
      layer_params[0] = v9;
      layer_params[1] = v16;
      id v22 = BNNSFilterCreateFusedLayer(2uLL, filter_type, (const void **)layer_params, &v26);
      if (v22)
      {
        id v23 = [v5 objectAtIndexedSubscript:0];
        [v7 setSourceStride:CPU_SetBatchStride(v23)];

        [v7 setResultStride:CPU_SetBatchStride(v6)];
        [v7 setIsFusedBNNSFilter:1];
      }
      else
      {
        unint64_t v24 = +[MLCLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          CPU_CompileFusedConvolutionNormalizationAndNeuronLayer_cold_2(v24);
        }
      }
LABEL_22:

      return v22;
  }
}

float CPU_BuildBNNSConvolutionInputOutputParams(void *a1, void *a2, void *a3, int a4, int a5)
{
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];
  int v10 = [v9 descriptor];
  int v11 = [v10 shape];
  uint64_t v12 = [v8 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 descriptor];
  double v14 = [v13 stride];
  uint64_t v15 = [v8 objectAtIndexedSubscript:0];

  unint64_t v16 = [v15 descriptor];
  CPU_BuildBNNSNDArrayDescriptor((uint64_t)a1, v11, v14, 0, [v16 dataType], 1, 0);

  id v17 = [v7 descriptor];
  int v18 = [v17 shape];
  id v19 = [v7 descriptor];
  uint64_t v20 = [v19 stride];
  id v21 = [v7 descriptor];

  CPU_BuildBNNSNDArrayDescriptor((uint64_t)(a1 + 44), v18, v20, 0, [v21 dataType], 1, 0);
  if (a5 != 2)
  {
    if (a4)
    {
      uint64_t v23 = a1[2];
      uint64_t v24 = a1[24];
      unint64_t v25 = a1[46];
      float v26 = (float)((float)((float)(unint64_t)((a1[1] - 1) * a1[94])
                          + (float)(unint64_t)((a1[23] - 1) * a1[96]))
                  + 1.0)
          - (float)(unint64_t)a1[45];
      unint64_t v27 = (unint64_t)(float)(v26 * 0.5);
      a1[101] = v27;
      float v28 = v26 - (float)v27;
      float v29 = (float)(unint64_t)((v23 - 1) * a1[95]);
      uint64_t v30 = (v24 - 1) * a1[97];
      a1[102] = (unint64_t)v28;
      float v31 = (float)((float)(v29 + (float)(unint64_t)v30) + 1.0) - (float)v25;
    }
    else
    {
      uint64_t v32 = a1[46];
      unint64_t v33 = a1[2];
      uint64_t v34 = a1[24];
      float v35 = (float)(unint64_t)(a1[94] * a1[45])
          - (float)((float)((float)(unint64_t)a1[1] - (float)(unint64_t)((a1[23] - 1) * a1[96] + 1))
                  + (float)(unint64_t)a1[94]);
      if (v35 < 0.0) {
        float v35 = 0.0;
      }
      unint64_t v36 = (unint64_t)(float)(v35 * 0.5);
      a1[101] = v36;
      a1[102] = (unint64_t)(float)(v35 - (float)v36);
      float v31 = (float)(unint64_t)(a1[95] * v32)
          - (float)((float)((float)v33 - (float)(unint64_t)((v34 - 1) * a1[97] + 1))
                  + (float)(unint64_t)a1[95]);
      if (v31 < 0.0) {
        float v31 = 0.0;
      }
    }
    unint64_t v37 = (unint64_t)(float)(v31 * 0.5);
    a1[103] = v37;
    float result = v31 - (float)v37;
    a1[104] = (unint64_t)result;
  }
  return result;
}

uint64_t CPU_SetOptimizerDataForConvolutionLayer(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = [a2 optimizerData];
  id v8 = [v5 objectAtIndexedSubscript:0];
  if ([v7 count])
  {
    unint64_t v9 = 0;
    do
    {
      int v10 = (void *)MEMORY[0x1E4F1C9B8];
      int v11 = [v7 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v11 bytes];
      uint64_t v13 = [v7 objectAtIndexedSubscript:v9];
      double v14 = objc_msgSend(v10, "dataWithBytesNoCopy:length:freeWhenDone:", v12, objc_msgSend(v13, "length"), 0);
      uint64_t v15 = [v8 weightsMomentumDataBytes];
      [v15 setObject:v14 atIndexedSubscript:v9];

      unint64_t v16 = [v8 weightsMomentumData];
      id v17 = [v16 objectAtIndexedSubscript:v9];

      id v18 = v17;
      uint64_t v19 = [v18 bytes];
      uint64_t v20 = [v7 objectAtIndexedSubscript:v9];
      *(void *)(v19 + 136) = [v20 bytes];

      ++v9;
    }
    while (v9 < [v7 count]);
  }
  if (v6)
  {
    id v35 = v5;
    id v21 = [v6 optimizerData];
    if ([v21 count])
    {
      unint64_t v22 = 0;
      do
      {
        uint64_t v23 = (void *)MEMORY[0x1E4F1C9B8];
        uint64_t v24 = [v21 objectAtIndexedSubscript:v22];
        uint64_t v25 = [v24 bytes];
        float v26 = [v21 objectAtIndexedSubscript:v22];
        unint64_t v27 = objc_msgSend(v23, "dataWithBytesNoCopy:length:freeWhenDone:", v25, objc_msgSend(v26, "length"), 0);
        float v28 = [v8 biasMomentumDataBytes];
        [v28 setObject:v27 atIndexedSubscript:v22];

        float v29 = [v8 biasMomentumData];
        uint64_t v30 = [v29 objectAtIndexedSubscript:v22];

        id v31 = v30;
        uint64_t v32 = [v31 bytes];
        unint64_t v33 = [v21 objectAtIndexedSubscript:v22];
        *(void *)(v32 + 136) = [v33 bytes];

        ++v22;
      }
      while (v22 < [v21 count]);
    }

    id v5 = v35;
  }

  return 1;
}

id CPU_CreateTransposeLayer(uint64_t a1, void *a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  memset(v22, 0, sizeof(v22));
  uint64_t v4 = [v2 count];
  switch(v4)
  {
    case 4:
      id v7 = [v2 objectAtIndexedSubscript:3];
      *(void *)&long long v23 = 3 - [v7 unsignedIntegerValue];

      id v8 = [v2 objectAtIndexedSubscript:2];
      *((void *)&v23 + 1) = 3 - [v8 unsignedIntegerValue];

      unint64_t v9 = [v2 objectAtIndexedSubscript:1];
      *(void *)&long long v24 = 3 - [v9 unsignedIntegerValue];

      id v6 = [v2 objectAtIndexedSubscript:0];
      *((void *)&v24 + 1) = 3 - [v6 unsignedIntegerValue];
      break;
    case 3:
      int v10 = [v2 objectAtIndexedSubscript:2];
      *(void *)&long long v23 = 2 - [v10 unsignedIntegerValue];

      int v11 = [v2 objectAtIndexedSubscript:1];
      *((void *)&v23 + 1) = 2 - [v11 unsignedIntegerValue];

      id v6 = [v2 objectAtIndexedSubscript:0];
      *(void *)&long long v24 = 2 - [v6 unsignedIntegerValue];
      break;
    case 2:
      id v5 = [v2 objectAtIndexedSubscript:1];
      *(void *)&long long v23 = [v5 unsignedIntegerValue] != 1;

      id v6 = [v2 objectAtIndexedSubscript:0];
      *((void *)&v23 + 1) = [v6 unsignedIntegerValue] != 1;
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
  uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:416];
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21 length:176];
  double v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:176];
  v28[0] = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  unint64_t v27 = v14;
  unint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  id v17 = +[MLCCPUDeviceOps deviceOpsWithType:39 params:v12 inDeltaData:v15 outDeltaData:v16 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  if (v17) {
    [v3 addObject:v17];
  }
  id v18 = (void *)[v3 copy];

  return v18;
}

uint64_t CPU_CompileTransposeLayer(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v26 = a3;
  long long v25 = [a1 objectAtIndexedSubscript:0];
  id v27 = [v25 params];
  uint64_t v6 = [v27 bytes];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v7 descriptor];
  unint64_t v9 = [v8 shape];
  int v10 = [v5 objectAtIndexedSubscript:0];
  int v11 = [v10 descriptor];
  uint64_t v12 = [v11 stride];
  uint64_t v13 = [v5 objectAtIndexedSubscript:0];
  double v14 = [v13 descriptor];
  uint64_t v24 = v6;
  LODWORD(v6) = CPU_BuildPermuteBNNSNDArrayDescriptor(v6, v9, v12, 0, [v14 dataType]);

  uint64_t v15 = 0;
  if (v6)
  {
    unint64_t v16 = [v26 descriptor];
    id v17 = [v16 shape];
    id v18 = [v26 descriptor];
    uint64_t v19 = [v18 stride];
    uint64_t v20 = [v26 descriptor];
    int v21 = CPU_BuildPermuteBNNSNDArrayDescriptor(v24 + 176, v17, v19, 0, [v20 dataType]);

    uint64_t v15 = 0;
    if (v21)
    {
      memset(v28, 0, sizeof(v28));
      LODWORD(v28[0]) = 1;
      uint64_t v15 = MEMORY[0x1E01B0D50](v24, v28);
      if (v15)
      {
        unint64_t v22 = [v5 objectAtIndexedSubscript:0];
        [v25 setSourceStride:CPU_SetBatchStride(v22)];

        [v25 setResultStride:CPU_SetBatchStride(v26)];
      }
    }
  }

  return v15;
}

id CPU_CreatePaddingLayer(float a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  _S8 = a1;
  v45[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v43 = 0;
  HIWORD(_S0) = 0;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  memset(v32, 0, sizeof(v32));
  uint64_t v33 = a4;
  uint64_t v34 = a5;
  uint64_t v35 = a6;
  uint64_t v36 = a7;
  switch(a3)
  {
    case 0:
    case 3:
      if (a8 == 3)
      {
        __asm { FCVT            H0, S8 }
        HIDWORD(v43) = _S0;
        goto LABEL_11;
      }
      if (a8 == 1)
      {
        *((float *)&v43 + 1) = _S8;
        goto LABEL_11;
      }
      id v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        CPU_CreatePaddingLayer_cold_2();
      }
      goto LABEL_16;
    case 1:
      int v18 = 1;
      goto LABEL_9;
    case 2:
      int v18 = 2;
LABEL_9:
      LODWORD(v43) = v18;
LABEL_11:
      id v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v32 length:488];
      memset(v31, 0, sizeof(v31));
      memset(v30, 0, sizeof(v30));
      long long v23 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v31 length:176];
      uint64_t v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v30 length:176];
      v45[0] = v23;
      long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
      uint64_t v44 = v24;
      id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      id v27 = +[MLCCPUDeviceOps deviceOpsWithType:14 params:v17 inDeltaData:v25 outDeltaData:v26 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

      if (v27) {
        [v15 addObject:v27];
      }
      float v28 = (void *)[v15 copy];

      break;
    default:
      id v17 = +[MLCLog framework];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        CPU_CreatePaddingLayer_cold_1();
      }
LABEL_16:
      float v28 = 0;
      break;
  }

  return v28;
}

uint64_t CPU_CompilePaddingLayer(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v26 = a3;
  long long v25 = [a1 objectAtIndexedSubscript:0];
  id v27 = [v25 params];
  uint64_t v6 = [v27 bytes];
  id v7 = [v5 objectAtIndexedSubscript:0];
  id v8 = [v7 descriptor];
  unint64_t v9 = [v8 shape];
  int v10 = [v5 objectAtIndexedSubscript:0];
  int v11 = [v10 descriptor];
  uint64_t v12 = [v11 stride];
  uint64_t v13 = [v5 objectAtIndexedSubscript:0];
  double v14 = [v13 descriptor];
  uint64_t v24 = v6;
  LODWORD(v6) = CPU_BuildBNNSNDArrayDescriptor(v6, v9, v12, 0, [v14 dataType], 1, 0);

  uint64_t v15 = 0;
  if (v6)
  {
    unint64_t v16 = [v26 descriptor];
    id v17 = [v16 shape];
    int v18 = [v26 descriptor];
    uint64_t v19 = [v18 stride];
    uint64_t v20 = [v26 descriptor];
    int v21 = CPU_BuildBNNSNDArrayDescriptor(v24 + 176, v17, v19, 0, [v20 dataType], 1, 0);

    uint64_t v15 = 0;
    if (v21)
    {
      memset(v28, 0, sizeof(v28));
      LODWORD(v28[0]) = 1;
      uint64_t v15 = MEMORY[0x1E01B0D40](v24, v28);
      if (v15)
      {
        unint64_t v22 = [v5 objectAtIndexedSubscript:0];
        [v25 setSourceStride:CPU_SetBatchStride(v22)];

        [v25 setResultStride:CPU_SetBatchStride(v26)];
      }
    }
  }

  return v15;
}

unint64_t *hashCombine_4(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 10;
  do
  {
    int v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *float result = v9;
  return result;
}

unint64_t *hashCombine_5(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 15;
  do
  {
    int v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *float result = v9;
  return result;
}

id ANE_CreateMatMulLayer(void *a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v3 = v1;
  if ([v3 transposesX]) {
    uint64_t v4 = &unk_1F3876E88;
  }
  else {
    uint64_t v4 = &unk_1F3876E70;
  }
  id v5 = ANE_BuildTransposeParams(v4);
  if ([v3 transposesY]) {
    uint64_t v6 = &unk_1F3876E88;
  }
  else {
    uint64_t v6 = &unk_1F3876E70;
  }
  id v7 = ANE_BuildTransposeParams(v6);
  id v8 = ANE_BuildTransposeParams(&unk_1F3876E70);
  long long v23 = kMLCANENetUnitType[0];
  v24[0] = @"MatrixMultiplication";
  unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [v3 alpha];
  if (fabsf(v10 + -1.0) <= 0.000001)
  {
    uint64_t v13 = 0;
    goto LABEL_11;
  }
  [v3 alpha];
  int v20 = v11;
  __int16 v19 = 0;
  if (ANE_ConvertFp32ToInt16((uint64_t)&v20, &v19))
  {
    v21[1] = @"ScaleScalar";
    v22[0] = @"GOC";
    v21[0] = kMLCANENetUnitType[0];
    uint64_t v12 = [NSNumber numberWithShort:v19];
    v22[1] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

LABEL_11:
    double v14 = +[_MLCANEMatMulParameters matMulUnitParametersWith:v9 transposeXParams:v5 transposeYParams:v7 finalTransposeParams:v8 gocParams:v13];

    goto LABEL_15;
  }
  uint64_t v15 = +[MLCLog framework];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    ANE_CreateMatMulLayer_cold_2((float *)&v20, v15);
  }

  double v14 = 0;
LABEL_15:

  if (v14)
  {
    unint64_t v16 = +[MLCANEDeviceOps deviceOpsWithType:32 params:v14];
    if (v16) {
      [v2 addObject:v16];
    }
    id v17 = v2;
  }
  else
  {
    unint64_t v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      ANE_CreateMatMulLayer_cold_1(v16);
    }
    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

id ANE_CompileMatMulLayer(void *a1, void *a2, void *a3)
{
  void v183[2] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v153 = a2;
  id v6 = a3;
  id v7 = [v6 parentLayers];
  id v8 = [v7 objectAtIndexedSubscript:0];

  unint64_t v9 = [v5 objectAtIndexedSubscript:0];
  float v10 = [v9 params];
  id v11 = v8;
  id v12 = v10;
  uint64_t v13 = (void *)MEMORY[0x1E01B11E0]();
  v160 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  double v14 = [v11 descriptor];
  v159 = [v11 sourceTensors];
  uint64_t v15 = [v11 resultTensors];
  unint64_t v16 = [v15 objectAtIndexedSubscript:0];

  id v17 = [v16 descriptor];
  int v18 = [v17 dataType];

  unsigned int v139 = v18;
  v154 = ANE_GetANECIRDataTypeWithMLCDataType(v18);
  if (!v154)
  {
    uint64_t v108 = v153;
    v152 = +[MLCLog framework];
    if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR)) {
      ANE_CompileMatMulLayer_cold_1();
    }
    uint64_t v109 = 0;
    goto LABEL_29;
  }
  v151 = v16;
  int v143 = v13;
  uint64_t v145 = v9;
  id v146 = v6;
  id v147 = v5;
  uint64_t v19 = [v12 transposeXParams];
  uint64_t v20 = [v12 transposeYParams];
  v149 = [v12 finalTransposeParams];
  v150 = [v12 matMulParams];
  id v144 = v12;
  v148 = [v12 gocParams];
  v152 = v19;
  v183[0] = v19;
  v183[1] = v20;
  id v141 = (void *)v20;
  v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:2];
  v165[0] = [v14 transposesX];
  v142 = v14;
  v165[1] = [v14 transposesY];
  int v21 = (void *)MEMORY[0x1E4F1CBF0];
  v156 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v157 = (void *)[v21 mutableCopy];
  uint64_t v22 = 0;
  char v23 = 1;
  uint64_t v24 = v160;
  v155 = v11;
  do
  {
    char v25 = v23;
    id v26 = [v159 objectAtIndexedSubscript:v22];
    id v164 = 0;
    ANE_GetTensor4DShapeWithOnePrepended(v26, &v164);
    id v27 = v164;
    float v28 = (void *)[v27 mutableCopy];
    if (v165[v22])
    {
      float v29 = [v27 objectAtIndexedSubscript:3];
      [v28 setObject:v29 atIndexedSubscript:1];

      uint64_t v30 = [v27 objectAtIndexedSubscript:1];
      [v28 setObject:v30 atIndexedSubscript:2];

      id v31 = [v27 objectAtIndexedSubscript:2];
      uint64_t v32 = v28;
      uint64_t v33 = v31;
      uint64_t v34 = 3;
    }
    else
    {
      uint64_t v35 = [v27 objectAtIndexedSubscript:2];
      [v28 setObject:v35 atIndexedSubscript:1];

      id v31 = [v27 objectAtIndexedSubscript:1];
      uint64_t v32 = v28;
      uint64_t v33 = v31;
      uint64_t v34 = 2;
    }
    [v32 setObject:v33 atIndexedSubscript:v34];

    uint64_t v36 = [v158 objectAtIndexedSubscript:v22];
    long long v37 = +[_MLCANEPlistBuilder createUnitWithLayer:v11 unitParams:v36];

    long long v38 = [v11 label];
    long long v39 = objc_msgSend(v38, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v24, "count"));
    [v37 setObject:v39 forKeyedSubscript:@"Name"];

    long long v40 = [v26 label];
    id v182 = v40;
    long long v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v182 count:1];
    [v37 setObject:v41 forKeyedSubscript:@"Bottom"];

    long long v42 = [v26 descriptor];
    uint64_t v43 = [v42 dataType];

    uint64_t v44 = ANE_GetANECIRDataTypeWithMLCDataType(v43);
    if (!v44)
    {
      uint64_t v110 = +[MLCLog framework];
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        ANE_CompileMatMulLayer_cold_2();
      }
      goto LABEL_27;
    }
    [v157 addObject:v44];
    uint64_t v181 = v44;
    uint64_t v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v181 count:1];
    [v37 setObject:v45 forKeyedSubscript:@"InputType"];

    uint64_t v46 = NSNumber;
    uint64_t v47 = [v28 objectAtIndexedSubscript:1];
    uint64_t v48 = objc_msgSend(v46, "numberWithUnsignedInteger:", objc_msgSend(v47, "unsignedIntegerValue"));
    [v37 setObject:v48 forKeyedSubscript:@"OutputChannels"];

    v180 = v26;
    int v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v180 count:1];
    LOBYTE(v48) = ANE_ValidateTransposeUnit(v49, v37, 1);

    if ((v48 & 1) == 0)
    {
      uint64_t v110 = +[MLCLog framework];
      id v11 = v155;
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        ANE_CompileMatMulLayer_cold_9();
      }
LABEL_27:
      unint64_t v16 = v151;
      uint64_t v111 = v141;

      uint64_t v109 = 0;
      goto LABEL_28;
    }
    uint64_t v24 = v160;
    [v160 addObject:v37];
    uint64_t v50 = +[MLCTensor tensorWithShape:v28 dataType:v43];
    [v156 addObject:v50];

    char v23 = 0;
    uint64_t v22 = 1;
    id v11 = v155;
  }
  while ((v25 & 1) != 0);
  id v163 = 0;
  ANE_GetTensor4DShapeWithOnePrepended(v151, &v163);
  id v51 = v163;
  uint64_t v52 = (void *)[v51 mutableCopy];
  unint64_t v53 = [v51 objectAtIndexedSubscript:2];
  [v52 setObject:v53 atIndexedSubscript:1];

  size_t v54 = [v51 objectAtIndexedSubscript:1];
  [v52 setObject:v54 atIndexedSubscript:2];

  id v138 = v51;
  uint64_t v55 = [v51 objectAtIndexedSubscript:1];
  uint64_t v137 = [v55 unsignedIntegerValue];

  uint64_t v56 = +[_MLCANEPlistBuilder createUnitWithLayer:v155 unitParams:v150];
  uint64_t v57 = [v155 label];
  uint64_t v58 = objc_msgSend(v57, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v160, "count"));
  [v56 setObject:v58 forKeyedSubscript:@"Name"];

  uint64_t v59 = [v160 objectAtIndexedSubscript:0];
  size_t v60 = [v59 objectForKeyedSubscript:@"Name"];
  v179[0] = v60;
  unint64_t v61 = [v160 objectAtIndexedSubscript:1];
  uint64_t v62 = [v61 objectForKeyedSubscript:@"Name"];
  v179[1] = v62;
  uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v179 count:2];
  [v56 setObject:v63 forKeyedSubscript:@"Bottom"];

  unint64_t v64 = (void *)[v157 copy];
  [v56 setObject:v64 forKeyedSubscript:@"InputType"];

  uint64_t v65 = NSNumber;
  unint64_t v66 = [v52 objectAtIndexedSubscript:1];
  uint64_t v67 = objc_msgSend(v65, "numberWithUnsignedInteger:", objc_msgSend(v66, "unsignedIntegerValue"));
  [v56 setObject:v67 forKeyedSubscript:@"OutputChannels"];

  if (ANE_ValidateMatrixMultUnit(v156, v56, 1))
  {
    [v160 addObject:v56];
    int v136 = v52;
    long long v37 = +[MLCTensor tensorWithShape:v52 dataType:v139];
    uint64_t v68 = +[_MLCANEPlistBuilder createUnitWithLayer:v155 unitParams:v149];
    uint64_t v69 = [v155 label];
    __int16 v70 = objc_msgSend(v69, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v160, "count"));
    [v68 setObject:v70 forKeyedSubscript:@"Name"];

    int v140 = v56;
    uint64_t v71 = [v56 objectForKeyedSubscript:@"Name"];
    v178 = v71;
    uint64_t v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v178 count:1];
    [v68 setObject:v72 forKeyedSubscript:@"Bottom"];

    id v177 = v154;
    uint64_t v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v177 count:1];
    [v68 setObject:v73 forKeyedSubscript:@"InputType"];

    __int16 v74 = [NSNumber numberWithUnsignedInteger:v137];
    [v68 setObject:v74 forKeyedSubscript:@"OutputChannels"];

    id v176 = v37;
    uint64_t v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v176 count:1];
    LOBYTE(v72) = ANE_ValidateTransposeUnit(v75, v68, 1);

    if ((v72 & 1) == 0)
    {
      long long v113 = +[MLCLog framework];
      uint64_t v111 = v141;
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR)) {
        ANE_CompileMatMulLayer_cold_9();
      }

      uint64_t v109 = 0;
      unint64_t v16 = v151;
      goto LABEL_60;
    }
    __int16 v76 = v160;
    [v160 addObject:v68];
    int v135 = v68;
    if (!v148) {
      goto LABEL_14;
    }
    uint64_t v77 = +[_MLCANEPlistBuilder createUnitWithLayer:v155 unitParams:v148];
    __int16 v78 = [v155 label];
    int v79 = objc_msgSend(v78, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v160, "count"));
    [v77 setObject:v79 forKeyedSubscript:@"Name"];

    __int16 v80 = [v68 objectForKeyedSubscript:@"Name"];
    id v175 = v80;
    uint64_t v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v175 count:1];
    [v77 setObject:v81 forKeyedSubscript:@"Bottom"];

    v174 = v154;
    uint64_t v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v174 count:1];
    [v77 setObject:v82 forKeyedSubscript:@"InputType"];

    uint64_t v83 = [NSNumber numberWithUnsignedInteger:v137];
    [v77 setObject:v83 forKeyedSubscript:@"OutputChannels"];

    id v173 = v151;
    id v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v173 count:1];
    LOBYTE(v81) = ANE_ValidateGOCUnit(v84, v77, 0);

    if (v81)
    {
      [v160 addObject:v77];

      __int16 v76 = v160;
      if ([v159 count] != 3) {
        goto LABEL_58;
      }
LABEL_14:
      id v85 = [v159 objectAtIndexedSubscript:2];
      id v86 = [v85 descriptor];
      int v133 = [v86 dataType];

      v171[0] = kMLCANENetUnitType[0];
      v171[1] = @"Type";
      v172[0] = @"ElementWise";
      v172[1] = @"Add";
      uint64_t v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v172 forKeys:v171 count:2];
      uint64_t v87 = +[_MLCANEPlistBuilder createUnitWithLayer:unitParams:](_MLCANEPlistBuilder, "createUnitWithLayer:unitParams:", v155);
      uint64_t v88 = [v155 label];
      objc_msgSend(v88, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v76, "count"));
      v90 = uint64_t v89 = v76;
      [v87 setObject:v90 forKeyedSubscript:@"Name"];

      uint64_t v91 = objc_msgSend(v89, "objectAtIndexedSubscript:", objc_msgSend(v89, "count") - 1);
      uint64_t v92 = [v91 objectForKeyedSubscript:@"Name"];
      v170[0] = v92;
      uint64_t v93 = v85;
      uint64_t v94 = [v85 label];
      v170[1] = v94;
      id v95 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:2];
      [v87 setObject:v95 forKeyedSubscript:@"Bottom"];

      uint64_t v96 = ANE_GetANECIRDataTypeWithMLCDataType(v133);
      uint64_t v97 = (void *)v96;
      if (v96)
      {
        v169[0] = v154;
        v169[1] = v96;
        uint64_t v98 = [MEMORY[0x1E4F1C978] arrayWithObjects:v169 count:2];
        [v87 setObject:v98 forKeyedSubscript:@"InputType"];

        uint64_t v99 = [NSNumber numberWithUnsignedInteger:v137];
        [v87 setObject:v99 forKeyedSubscript:@"OutputChannels"];

        id v161 = 0;
        id v162 = 0;
        uint64_t v100 = v93;
        int v101 = +[_MLCANEPlistBuilder createBroadcastUnitWithSourceTensor:v93 targetShape:v138 layer:v155 broadcastUnit:&v162 broadcastResultTensor:&v161];
        id v102 = v162;
        uint64_t v132 = v102;
        id v134 = v161;
        if (v101 != 2)
        {
          id v103 = v97;
          __int16 v76 = v160;
          if (v101 == 1)
          {
            v167 = v151;
            v168 = v100;
            long long v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v167 count:2];
            char v105 = ANE_ValidateElementWiseUnit(v104, v87, 1);

            uint64_t v106 = (void *)v131;
            if (v105)
            {
              [v160 addObject:v87];
              int v107 = 0;
              id v11 = v155;
              uint64_t v68 = v135;
            }
            else
            {
              uint64_t v127 = +[MLCLog framework];
              id v11 = v155;
              uint64_t v68 = v135;
              if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR)) {
                ANE_CompileMatMulLayer_cold_5();
              }

              int v107 = 1;
            }
          }
          else
          {
            v126 = +[MLCLog framework];
            uint64_t v68 = v135;
            uint64_t v106 = (void *)v131;
            if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
              ANE_CompileMatMulLayer_cold_4();
            }

            int v107 = 1;
            id v11 = v155;
          }
          uint64_t v97 = v103;
          goto LABEL_54;
        }
        __int16 v76 = v160;
        if (v102)
        {
          __int16 v130 = v97;
          int v115 = [v155 label];
          long long v116 = objc_msgSend(v115, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v160, "count"));
          [v102 setObject:v116 forKeyedSubscript:@"Name"];

          long long v117 = [NSNumber numberWithUnsignedInteger:v137];
          [v102 setObject:v117 forKeyedSubscript:@"OutputChannels"];

          [v160 addObject:v102];
          long long v118 = [v155 label];
          uint64_t v119 = objc_msgSend(v118, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v160, "count"));
          [v87 setObject:v119 forKeyedSubscript:@"Name"];

          uint64_t v120 = objc_msgSend(v160, "objectAtIndexedSubscript:", objc_msgSend(v160, "count") - 2);
          uint64_t v121 = [(id)v120 objectForKeyedSubscript:@"Name"];
          v167 = v121;
          int v122 = [v102 objectForKeyedSubscript:@"Name"];
          v168 = v122;
          v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v167 count:2];
          [v87 setObject:v123 forKeyedSubscript:@"Bottom"];

          v124 = v134;
          v166[0] = v151;
          v166[1] = v134;
          v125 = [MEMORY[0x1E4F1C978] arrayWithObjects:v166 count:2];
          LOBYTE(v120) = ANE_ValidateElementWiseUnit(v125, v87, 1);

          if (v120)
          {
            [v160 addObject:v87];
            int v107 = 0;
            __int16 v76 = v160;
            id v11 = v155;
            uint64_t v68 = v135;
            uint64_t v106 = (void *)v131;
            uint64_t v97 = v130;
          }
          else
          {
            int v129 = +[MLCLog framework];
            id v11 = v155;
            uint64_t v68 = v135;
            uint64_t v106 = (void *)v131;
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR)) {
              ANE_CompileMatMulLayer_cold_5();
            }

            int v107 = 1;
            __int16 v76 = v160;
            uint64_t v97 = v130;
          }
        }
        else
        {
          v128 = +[MLCLog framework];
          if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
            ANE_CompileMatMulLayer_cold_6();
          }

          int v107 = 1;
          id v11 = v155;
          uint64_t v68 = v135;
          uint64_t v106 = (void *)v131;
LABEL_54:
          v124 = v134;
        }
      }
      else
      {
        uint64_t v100 = v85;
        uint64_t v132 = +[MLCLog framework];
        if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
          ANE_CompileMatMulLayer_cold_3();
        }
        int v107 = 1;
        __int16 v76 = v160;
        id v11 = v155;
        uint64_t v68 = v135;
        uint64_t v106 = (void *)v131;
        uint64_t v97 = 0;
      }

      if (v107) {
        uint64_t v109 = 0;
      }
      else {
LABEL_58:
      }
        uint64_t v109 = (void *)[v76 copy];
      unint64_t v16 = v151;
      uint64_t v111 = v141;
LABEL_60:
      id v27 = v136;
      id v26 = v138;
      float v28 = v140;
    }
    else
    {
      long long v114 = +[MLCLog framework];
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
        ANE_CompileMatMulLayer_cold_8();
      }

      uint64_t v109 = 0;
      unint64_t v16 = v151;
      float v28 = v56;
      uint64_t v111 = v141;
      id v27 = v136;
      id v26 = v138;
    }
  }
  else
  {
    float v28 = v56;
    id v27 = v52;
    long long v37 = +[MLCLog framework];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      ANE_CompileMatMulLayer_cold_10();
    }
    uint64_t v109 = 0;
    unint64_t v16 = v151;
    uint64_t v111 = v141;
    id v26 = v138;
  }
LABEL_28:

  id v6 = v146;
  id v5 = v147;
  uint64_t v108 = v153;
  id v12 = v144;
  unint64_t v9 = v145;
  double v14 = v142;
  uint64_t v13 = v143;
LABEL_29:

  return v109;
}

id ANE_CreateConcatLayer(unint64_t a1, unint64_t a2)
{
  unint64_t v9 = 1;
  ANE_GetDimensionIn4DWithOnePrepended(a2, a1, (uint64_t *)&v9);
  id v2 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v3 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [v3 setObject:@"Concat" forKeyedSubscript:kMLCANENetUnitType[0]];
  uint64_t v4 = ANE_GetANECIRDimension(v9);
  [v3 setObject:v4 forKeyedSubscript:@"Dimension"];

  id v5 = +[_MLCANEConcatParameters concatUnitParametersWith:v3];
  id v6 = +[MLCANEDeviceOps deviceOpsWithType:31 params:v5];
  if (v6) {
    [v2 addObject:v6];
  }
  id v7 = (void *)[v2 copy];

  return v7;
}

uint64_t ANE_ValidateConcatLayer(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 sourceTensors];
  uint64_t v5 = ANE_ValidateConcatUnit(v4, v3, 1);

  return v5;
}

id ANE_CompileConcatLayer(void *a1, void *a2, void *a3)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a1;
  id v7 = [a3 parentLayers];
  id v8 = [v7 objectAtIndexedSubscript:0];

  unint64_t v9 = [v6 objectAtIndexedSubscript:0];

  if ([v5 count] != 1)
  {
    float v10 = [v9 params];
    uint64_t v13 = [v10 concatParams];
    id v11 = +[_MLCANEPlistBuilder createUnitWithLayer:v8 unitParams:v13];

    if ((ANE_ValidateConcatLayer(v8, v11) & 1) == 0)
    {
      id v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        ANE_CompileConcatLayer_cold_1();
      }
      goto LABEL_9;
    }
LABEL_6:

    unint64_t v16 = v11;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    goto LABEL_10;
  }
  v17[0] = kMLCANENetUnitType[0];
  v17[1] = @"BiasScalar";
  v18[0] = @"GOC";
  v18[1] = &unk_1F3876A20;
  float v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v11 = +[_MLCANEPlistBuilder createUnitWithLayer:v8 unitParams:v10];
  if (ANE_ValidateGOCUnit(v5, v11, 1)) {
    goto LABEL_6;
  }
  id v12 = +[MLCLog framework];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    ANE_CompileConcatLayer_cold_1();
  }
LABEL_9:

  double v14 = 0;
LABEL_10:

  return v14;
}

id ANE_CreateNormalizationLayer(int a1, void *a2, void *a3, float a4, uint64_t a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  char v23 = (void *)v22;
  switch(a1)
  {
    case 0:
      v165 = 0;
      char v24 = ANE_BuildBatchNormalizationParams(&v165, v17, v18, v19, v20, v21, a4);
      char v25 = v165;
      if ((v24 & 1) == 0)
      {
        uint64_t v59 = +[MLCLog framework];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          ANE_CreateNormalizationLayer_cold_4(v59, v60, v61, v62, v63, v64, v65, v66);
        }

        goto LABEL_27;
      }
      id v163 = v18;
      id v164 = v23;
      id v26 = 0;
      uint64_t v27 = 2;
      if (v16) {
        goto LABEL_82;
      }
      goto LABEL_4;
    case 1:
      id v32 = v17;
      id v33 = v18;
      id v160 = v19;
      id v154 = v20;
      id v152 = v21;
      id v162 = v19;
      id v163 = v18;
      id v164 = v23;
      v157 = v33;
      if ([v32 count] == 1)
      {
        uint64_t v34 = [v32 objectAtIndexedSubscript:0];
        uint64_t v35 = [v34 unsignedIntegerValue];

        if (v157 && v160)
        {
          id v169 = 0;
          char v36 = ANE_BuildBatchNormalizationParams((NSObject **)&v169, v32, v157, v160, v154, v152, a4);
          long long v37 = v169;
          if (v36)
          {
            long long v38 = 0;
LABEL_12:
            long long v39 = v37;
            long long v40 = v38;

            char v41 = 1;
            long long v37 = v39;
            goto LABEL_79;
          }
          long long v38 = +[MLCLog framework];
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            ANE_CreateNormalizationLayer_cold_6(v38, v84, v85, v86, v87, v88, v89, v90);
          }
        }
        else
        {
          uint64_t v151 = v35;
          long long v37 = [MEMORY[0x1E4F1CC08] mutableCopy];
          [v37 setObject:@"InstanceNormalization" forKeyedSubscript:kMLCANENetUnitType[0]];
          id v169 = @"Height";
          uint64_t v170 = @"Width";
          uint64_t v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v169 count:2];
          [v37 setObject:v71 forKeyedSubscript:@"Dimension"];

          float v168 = a4;
          __int16 v167 = 0;
          if (ANE_ConvertFp32ToInt16((uint64_t)&v168, &v167))
          {
            uint64_t v72 = [NSNumber numberWithShort:v167];
            [v37 setObject:v72 forKeyedSubscript:@"Epsilon"];

            long long v38 = 0;
            if (!v154 || !v152) {
              goto LABEL_12;
            }
            id v166 = 0;
            char v73 = ANE_BuildGocParams(&v166, v151, v154, v152);
            long long v38 = v166;
            if (v73)
            {
              if (ANE_CalculateScaleAndBiasForInstanceNorm(v151, v154, v152, a4)) {
                goto LABEL_12;
              }
              __int16 v74 = +[MLCLog framework];
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
                ANE_CreateNormalizationLayer_cold_7(v74, v75, v76, v77, v78, v79, v80, v81);
              }
            }
            else
            {
              __int16 v74 = +[MLCLog framework];
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
                ANE_CreateNormalizationLayer_cold_8(v74, v124, v125, v126, v127, v128, v129, v130);
              }
            }
          }
          else
          {
            long long v38 = +[MLCLog framework];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              ANE_CreateNormalizationLayer_cold_9((uint64_t)&v168);
            }
          }
        }
      }
      else
      {
        long long v37 = +[MLCLog framework];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
          ANE_CreateNormalizationLayer_cold_10(v32, v37);
        }
      }
      long long v39 = 0;
      long long v40 = 0;
      char v41 = 0;
LABEL_79:

      char v25 = v39;
      id v26 = v40;
      if (v41)
      {
        uint64_t v27 = 13;
        goto LABEL_81;
      }
      long long v116 = +[MLCLog framework];
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
        ANE_CreateNormalizationLayer_cold_5(v116, v132, v133, v134, v135, v136, v137, v138);
      }
      goto LABEL_88;
    case 2:
      id v164 = (void *)v22;
      id v42 = v17;
      uint64_t v43 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      uint64_t v44 = [v42 count];

      *(float *)&id v166 = a4;
      LOWORD(v168) = 0;
      id v162 = v19;
      if (ANE_ConvertFp32ToInt16((uint64_t)&v166, &v168))
      {
        if ((unint64_t)(v44 - 1) < 2)
        {
          [v43 setObject:@"InstanceNormalization" forKeyedSubscript:kMLCANENetUnitType[0]];
          char v23 = v164;
          if (v44 == 1)
          {
            id v169 = @"Width";
            uint64_t v45 = (void *)MEMORY[0x1E4F1C978];
            uint64_t v46 = 1;
          }
          else
          {
            id v169 = @"Height";
            uint64_t v170 = @"Width";
            uint64_t v45 = (void *)MEMORY[0x1E4F1C978];
            uint64_t v46 = 2;
          }
          uint64_t v91 = [v45 arrayWithObjects:&v169 count:v46];
          [v43 setObject:v91 forKeyedSubscript:@"Dimension"];

          uint64_t v83 = [NSNumber numberWithShort:SLOWORD(v168)];
LABEL_52:
          [v43 setObject:v83 forKeyedSubscript:@"Epsilon"];

          id v69 = v43;
          char v70 = 1;
LABEL_53:

          char v25 = v69;
          if (v70)
          {
            id v163 = v18;
            id v26 = 0;
            uint64_t v27 = 19;
            goto LABEL_81;
          }
          uint64_t v92 = +[MLCLog framework];
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
            ANE_CreateNormalizationLayer_cold_11(v92, v93, v94, v95, v96, v97, v98, v99);
          }

          id v67 = (id)MEMORY[0x1E4F1CBF0];
          id v19 = v162;
          goto LABEL_97;
        }
        if (v44 == 3)
        {
          [v43 setObject:@"LayerNormalization" forKeyedSubscript:kMLCANENetUnitType[0]];
          id v169 = @"Channel";
          uint64_t v170 = @"Height";
          int v171 = @"Width";
          uint64_t v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v169 count:3];
          [v43 setObject:v82 forKeyedSubscript:@"Dimension"];

          uint64_t v83 = [NSNumber numberWithShort:SLOWORD(v168)];
          char v23 = v164;
          goto LABEL_52;
        }
        uint64_t v100 = +[MLCLog framework];
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
          ANE_CreateNormalizationLayer_cold_12();
        }
      }
      else
      {
        uint64_t v68 = +[MLCLog framework];
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
          ANE_CreateNormalizationLayer_cold_13((uint64_t)&v166);
        }
      }
      id v69 = 0;
      char v70 = 0;
      char v23 = v164;
      goto LABEL_53;
    case 3:
      id v163 = v18;
      id v47 = v17;
      id v48 = v20;
      id v158 = v21;
      id v161 = v48;
      id v162 = v19;
      id v164 = v23;
      if ([v47 count] == 1)
      {
        id v155 = v16;
        int v49 = [v47 objectAtIndexedSubscript:0];
        uint64_t v50 = [v49 unsignedIntegerValue];

        id v51 = [MEMORY[0x1E4F1CC08] mutableCopy];
        [v51 setObject:@"LayerNormalization" forKeyedSubscript:kMLCANENetUnitType[0]];
        id v169 = @"Channel";
        uint64_t v170 = @"Height";
        int v171 = @"Width";
        uint64_t v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v169 count:3];
        [v51 setObject:v52 forKeyedSubscript:@"Dimension"];

        float v168 = a4;
        __int16 v167 = 0;
        if (ANE_ConvertFp32ToInt16((uint64_t)&v168, &v167))
        {
          uint64_t v153 = v50;
          unint64_t v53 = [NSNumber numberWithShort:v167];
          [v51 setObject:v53 forKeyedSubscript:@"Epsilon"];

          size_t v54 = 0;
          if (!v161 || !v158) {
            goto LABEL_23;
          }
          id v166 = 0;
          char v55 = ANE_BuildGocParams(&v166, v153, v161, v158);
          size_t v54 = v166;
          if (v55)
          {
            if (ANE_CalculateScaleAndBiasForInstanceNorm(v153, v161, v158, a4))
            {
LABEL_23:
              uint64_t v56 = v51;
              uint64_t v57 = v54;
              char v58 = 1;
              size_t v54 = v57;
LABEL_69:

              id v16 = v155;
              goto LABEL_70;
            }
            int v101 = +[MLCLog framework];
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
              ANE_CreateNormalizationLayer_cold_15(v101, v109, v110, v111, v112, v113, v114, v115);
            }
          }
          else
          {
            int v101 = +[MLCLog framework];
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
              ANE_CreateNormalizationLayer_cold_16(v101, v102, v103, v104, v105, v106, v107, v108);
            }
          }
        }
        else
        {
          size_t v54 = +[MLCLog framework];
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
            ANE_CreateNormalizationLayer_cold_17((uint64_t)&v168);
          }
        }
        uint64_t v56 = 0;
        uint64_t v57 = 0;
        char v58 = 0;
        goto LABEL_69;
      }
      id v51 = +[MLCLog framework];
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        ANE_CreateNormalizationLayer_cold_18(v47, v51);
      }
      uint64_t v56 = 0;
      uint64_t v57 = 0;
      char v58 = 0;
LABEL_70:

      char v25 = v56;
      id v26 = v57;
      if (v58)
      {
        uint64_t v27 = 23;
LABEL_81:
        id v19 = v162;
        if (v16)
        {
LABEL_82:
          uint64_t v131 = ANE_BuildNeuronParams(v16);
          if (!v131)
          {
            id v31 = +[MLCLog framework];
            char v23 = v164;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              ANE_CreateNormalizationLayer_cold_2(v31, v139, v140, v141, v142, v143, v144, v145);
            }
            id v67 = (id)MEMORY[0x1E4F1CBF0];
            goto LABEL_96;
          }
          id v31 = v131;
          if (a1)
          {
            if (a1 != 1)
            {
              v150 = +[MLCLog framework];
              if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
                ANE_CreateNormalizationLayer_cold_1();
              }

              id v67 = (id)MEMORY[0x1E4F1CBF0];
              char v23 = v164;
              goto LABEL_96;
            }
            id v156 = v17;
            id v159 = v21;
            id v28 = v20;
            id v29 = v19;
            id v30 = v16;
            uint64_t v27 = 14;
          }
          else
          {
            id v156 = v17;
            id v159 = v21;
            id v28 = v20;
            id v29 = v19;
            id v30 = v16;
            uint64_t v27 = 3;
          }
        }
        else
        {
LABEL_4:
          id v156 = v17;
          id v159 = v21;
          id v28 = v20;
          id v29 = v19;
          id v30 = v16;
          id v31 = 0;
        }
        id v146 = +[_MLCANENormalizationParameters normalizationUnitParametersWith:v25 gocParams:v26 neuronParams:v31];
        id v147 = +[MLCANEDeviceOps deviceOpsWithType:v27 params:v146];
        if (v147) {
          [v164 addObject:v147];
        }
        id v67 = v164;

        id v16 = v30;
        id v19 = v29;
        v148 = v28;
        id v17 = v156;
        id v21 = v159;
        char v23 = v164;
        id v20 = v148;
LABEL_96:

        id v18 = v163;
        goto LABEL_97;
      }
      long long v116 = +[MLCLog framework];
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
        ANE_CreateNormalizationLayer_cold_14(v116, v117, v118, v119, v120, v121, v122, v123);
      }
LABEL_88:

      id v67 = (id)MEMORY[0x1E4F1CBF0];
      id v19 = v162;
      id v18 = v163;
      char v23 = v164;
LABEL_97:

      return v67;
    default:
      char v25 = +[MLCLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        ANE_CreateNormalizationLayer_cold_1();
      }
LABEL_27:
      id v67 = (id)MEMORY[0x1E4F1CBF0];
      goto LABEL_97;
  }
}

uint64_t ANE_BuildBatchNormalizationParams(NSObject **a1, void *a2, void *a3, void *a4, void *a5, void *a6, float a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if ([v13 count] != 1)
  {
    id v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      ANE_BuildBatchNormalizationParams_cold_5(v13, v20);
    }
    goto LABEL_27;
  }
  v97[0] = 0;
  id v18 = [v13 objectAtIndexedSubscript:0];
  char v19 = ANE_BuildGocParams(v97, [v18 unsignedIntegerValue], v14, v15);
  id v20 = v97[0];

  if ((v19 & 1) == 0)
  {
    uint64_t v64 = +[MLCLog framework];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      ANE_BuildBatchNormalizationParams_cold_4(v64, v65, v66, v67, v68, v69, v70, v71);
    }

LABEL_27:
    uint64_t v63 = 0;
    goto LABEL_28;
  }
  uint64_t v82 = a1;
  uint64_t v88 = v20;
  id v93 = v13;
  uint64_t v87 = [v13 objectAtIndexedSubscript:0];
  uint64_t v21 = [v87 unsignedIntegerValue];
  id v92 = v14;
  id v22 = v14;
  id v91 = v15;
  id v23 = v15;
  id v90 = v16;
  id v24 = v16;
  id v89 = v17;
  id v25 = v17;
  id v26 = [v22 descriptor];
  uint64_t v27 = [v26 dataType];

  uint64_t v86 = v22;
  id v28 = [v22 data];
  uint64_t v96 = [v28 bytes];

  uint64_t v94 = malloc_type_malloc(+[MLCTensorDescriptor elementByteCount:v27] * v21, 0x7373461AuLL);
  uint64_t v84 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:");
  id v29 = [v23 descriptor];
  uint64_t v30 = [v29 dataType];

  uint64_t v85 = v23;
  id v31 = [v23 data];
  uint64_t v95 = [v31 bytes];

  size_t v32 = +[MLCTensorDescriptor elementByteCount:v30] * v21;
  id v33 = malloc_type_malloc(v32, 0xDF017A91uLL);
  uint64_t v83 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v33 length:v32 freeWhenDone:1];
  if (!v21)
  {
LABEL_21:
    uint64_t v61 = [v86 deviceMemory];
    objc_msgSend(v61, "setObject:atIndexedSubscript:", v84, objc_msgSend(v86, "deviceIndex"));

    uint64_t v62 = [v85 deviceMemory];
    objc_msgSend(v62, "setObject:atIndexedSubscript:", v83, objc_msgSend(v85, "deviceIndex"));

    id v20 = v88;
    void *v82 = v20;
    uint64_t v63 = 1;
    id v14 = v92;
    id v13 = v93;
    id v16 = v90;
    id v15 = v91;
    id v17 = v89;
    goto LABEL_28;
  }
  uint64_t v35 = v21;
  uint64_t v36 = 0;
  double v37 = a7;
  double v38 = a7 + 1.0;
  while (1)
  {
    float TensorValueInFloat = ANE_GetTensorValueInFloat(v96, v27, v36, *(float *)&_D0);
    float v40 = ANE_GetTensorValueInFloat(v95, v30, v36, TensorValueInFloat);
    double v41 = 1.0;
    if (v25)
    {
      id v42 = [v25 data];
      uint64_t v43 = [v42 bytes];
      uint64_t v44 = [v25 descriptor];
      int v45 = [v44 dataType];
      double v41 = ANE_GetTensorValueInFloat(v43, v45, v36, v46);
    }
    if (v24)
    {
      id v47 = [v24 data];
      uint64_t v48 = [v47 bytes];
      int v49 = [v24 descriptor];
      int v50 = [v49 dataType];
      double v52 = ANE_GetTensorValueInFloat(v48, v50, v36, v51);
    }
    else
    {
      double v52 = 0.0;
    }
    _D0 = 1.0 / sqrt(v37 + v40) * v41;
    double v53 = v38 / (fabs(_D0) + v37);
    if (_D0 < 0.0) {
      double v53 = -v53;
    }
    _D1 = -(TensorValueInFloat - v52 * v53);
    if (v27 == 3)
    {
      __asm { FCVT            H1, D1 }
      v94[v36] = _H1;
    }
    else
    {
      if (v27 != 1)
      {
        char v73 = +[MLCLog framework];
        if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      float v55 = _D1;
      *(float *)&v94[2 * v36] = v55;
    }
    if (v30 == 3)
    {
      __asm { FCVT            H0, D0 }
      v33[v36] = LOWORD(_D0);
      goto LABEL_20;
    }
    if (v30 != 1) {
      break;
    }
    *(float *)&_D0 = _D0;
    *(_DWORD *)&v33[2 * v36] = LODWORD(_D0);
LABEL_20:
    if (v35 == ++v36) {
      goto LABEL_21;
    }
  }
  char v73 = +[MLCLog framework];
  if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
    goto LABEL_33;
  }
LABEL_32:
  ANE_BuildBatchNormalizationParams_cold_2();
LABEL_33:
  id v14 = v92;
  id v13 = v93;
  id v16 = v90;
  id v15 = v91;

  __int16 v74 = +[MLCLog framework];
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
    ANE_BuildBatchNormalizationParams_cold_1(v74, v75, v76, v77, v78, v79, v80, v81);
  }

  uint64_t v63 = 0;
  id v20 = v88;
  id v17 = v89;
LABEL_28:

  return v63;
}

id ANE_CompileNormalizationLayer(unsigned int a1, void *a2, void *a3, void *a4)
{
  v177[2] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  float v10 = [v7 objectAtIndexedSubscript:0];
  id v169 = v9;
  id v11 = [v9 parentLayers];
  id v12 = [v11 objectAtIndexedSubscript:0];

  id v13 = [v10 params];
  id v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v15 = [v13 normalizationParams];
  id v16 = (void *)[v15 mutableCopy];

  uint64_t v170 = [v13 gocParams];
  id v17 = [v13 neuronParams];
  if (a1 < 2) {
    goto LABEL_4;
  }
  if (a1 != 2)
  {
    if (a1 != 3)
    {
      uint64_t v34 = +[MLCLog framework];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        ANE_CompileNormalizationLayer_cold_1();
      }

      goto LABEL_65;
    }
LABEL_4:
    id v156 = v8;
    id v158 = v12;
    id v165 = v7;
    id v18 = v12;
    id v19 = v16;
    id v163 = v170;
    id v20 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    objc_opt_class();
    float v168 = v16;
    if (objc_opt_isKindOfClass())
    {
      id v160 = v17;
      id v154 = v13;
      int v21 = 0;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v160 = v17;
        id v154 = v13;
        int v21 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v36 = +[MLCLog framework];
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            ANE_CompileNormalizationLayer_cold_8();
          }
          goto LABEL_60;
        }
        id v160 = v17;
        id v154 = v13;
        int v21 = 3;
      }
    }
    uint64_t v35 = [v18 sourceTensors];
    uint64_t v36 = [v35 objectAtIndexedSubscript:0];

    double v37 = [v36 descriptor];
    uint64_t v38 = [v37 dimensionCount];

    if ((unint64_t)(v38 - 2) < 2)
    {
      uint64_t v145 = (void *)MEMORY[0x1E01B11E0]();
      v177[0] = 0;
      v176[0] = 0;
      BOOL v39 = +[_MLCANEPlistBuilder createReshapeUnitsWithLayer:v18 reshapeUnits:v177 reshapeResultTensors:v176];
      id v153 = v177[0];
      id v40 = v176[0];
      id v151 = v19;
      id v147 = v40;
      if (v39)
      {
        double v41 = v40;
        v149 = v10;
        id v42 = [v18 label];
        uint64_t v43 = objc_msgSend(v42, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v20, "count"));
        uint64_t v44 = [v153 objectAtIndexedSubscript:0];
        [v44 setObject:v43 forKeyedSubscript:@"Name"];

        int v45 = [v153 objectAtIndexedSubscript:0];
        [v20 addObject:v45];

        float v46 = [v41 objectAtIndexedSubscript:0];
        id v47 = ANE_CreateNormUnits(v21, v46, v18, v19, v163);

        if (v47)
        {
          uint64_t v141 = v14;
          if ([v47 count])
          {
            unint64_t v48 = 0;
            do
            {
              int v49 = [v47 objectAtIndexedSubscript:v48];
              int v50 = [v18 label];
              float v51 = objc_msgSend(v50, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v20, "count"));
              [v49 setObject:v51 forKeyedSubscript:@"Name"];

              double v52 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v20, "count") - 1);
              double v53 = [v52 objectForKeyedSubscript:@"Name"];
              v175[0] = v53;
              size_t v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:1];
              [v49 setObject:v54 forKeyedSubscript:@"Bottom"];

              [v20 addObject:v49];
              ++v48;
            }
            while (v48 < [v47 count]);
          }
          float v55 = [v18 label];
          uint64_t v56 = objc_msgSend(v55, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v20, "count"));
          uint64_t v57 = [v153 objectAtIndexedSubscript:1];
          [v57 setObject:v56 forKeyedSubscript:@"Name"];

          char v58 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v20, "count") - 1);
          uint64_t v59 = [v58 objectForKeyedSubscript:@"Name"];
          v174[0] = v59;
          uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:1];
          uint64_t v61 = [v153 objectAtIndexedSubscript:1];
          [v61 setObject:v60 forKeyedSubscript:@"Bottom"];

          uint64_t v62 = [v153 objectAtIndexedSubscript:1];
          [v20 addObject:v62];
          int v63 = 0;
          float v10 = v149;
          id v14 = v141;
          id v17 = v160;
        }
        else
        {
          uint64_t v62 = +[MLCLog framework];
          id v17 = v160;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
            ANE_CompileNormalizationLayer_cold_5();
          }
          int v63 = 1;
          float v10 = v149;
        }
      }
      else
      {
        id v47 = +[MLCLog framework];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          ANE_CompileNormalizationLayer_cold_6();
        }
        int v63 = 1;
        id v17 = v160;
      }

      id v13 = v154;
      if (v63)
      {
        uint64_t v67 = 0;
LABEL_56:
        id v19 = v151;
        goto LABEL_61;
      }
LABEL_55:
      uint64_t v67 = (void *)[v20 copy];
      goto LABEL_56;
    }
    if (v38 != 4)
    {
      uint64_t v66 = +[MLCLog framework];
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        ANE_CompileNormalizationLayer_cold_4();
      }

      uint64_t v67 = 0;
      id v13 = v154;
      id v17 = v160;
LABEL_61:

      id v8 = v156;
      uint64_t v102 = v158;
      id v7 = v165;
      if (!v67)
      {
        id v12 = v158;
        uint64_t v103 = +[MLCLog framework];
        id v16 = v168;
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
          ANE_CompileNormalizationLayer_cold_2();
        }

LABEL_65:
        uint64_t v104 = 0;
LABEL_91:
        uint64_t v129 = v169;
        goto LABEL_92;
      }
      goto LABEL_87;
    }
    uint64_t v64 = ANE_CreateNormUnits(v21, v36, v18, v19, v163);
    if (v64)
    {
      uint64_t v65 = (void *)v64;
      id v151 = v19;
      [v20 addObjectsFromArray:v64];

      id v13 = v154;
      id v17 = v160;
      goto LABEL_55;
    }
    int v101 = +[MLCLog framework];
    id v13 = v154;
    id v17 = v160;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR)) {
      ANE_CompileNormalizationLayer_cold_5();
    }

LABEL_60:
    uint64_t v67 = 0;
    goto LABEL_61;
  }
  id v22 = v12;
  float v168 = v16;
  id v23 = v16;
  id v24 = v10;
  id v25 = v23;
  v148 = v24;
  id v144 = v24;
  id v164 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v26 = v22;
  uint64_t v27 = [v26 normalizedShape];
  uint64_t v28 = [v27 count];

  id v152 = [v26 gamma];
  v150 = [v26 beta];
  uint64_t v143 = v26;
  id v146 = v25;
  if ((unint64_t)(v28 - 1) < 2)
  {
    id v29 = v26;
    uint64_t v30 = v17;
    id v31 = +[_MLCANEPlistBuilder createUnitWithLayer:v29 unitParams:v25];
    size_t v32 = [v29 sourceTensors];
    char v33 = ANE_ValidateInstanceNormUnit(v32, v31, 1);

    if (v33)
    {
      float v10 = v148;
      goto LABEL_34;
    }
    uint64_t v99 = +[MLCLog framework];
    id v17 = v30;
    id v26 = v143;
    float v10 = v148;
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
      ANE_CompileNormalizationLayer_cold_15();
    }

LABEL_48:
    uint64_t v67 = 0;
    goto LABEL_86;
  }
  if (v28 != 3)
  {
    uint64_t v100 = +[MLCLog framework];
    float v10 = v148;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
      ANE_CompileNormalizationLayer_cold_10();
    }

    goto LABEL_48;
  }
  uint64_t v68 = v26;
  uint64_t v30 = v17;
  id v31 = +[_MLCANEPlistBuilder createUnitWithLayer:v68 unitParams:v25];
  uint64_t v69 = [v68 sourceTensors];
  BOOL v70 = ANE_ValidateLayerNormUnit(v69, v31, 1);

  float v10 = v148;
  if (!v70)
  {
    uint64_t v105 = +[MLCLog framework];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
      ANE_CompileNormalizationLayer_cold_16();
    }

    uint64_t v67 = 0;
    id v17 = v30;
    goto LABEL_85;
  }
LABEL_34:
  [v164 addObject:v31];

  id v17 = v30;
  if (!v152 || !v150) {
    goto LABEL_81;
  }
  id v166 = v7;
  id v159 = v12;
  id v71 = v143;
  id v72 = v152;
  id v140 = v150;
  id v73 = v164;
  id v139 = v144;
  if ([v73 count])
  {
    id v161 = v30;
    id v155 = v13;
    __int16 v74 = objc_msgSend(v73, "objectAtIndexedSubscript:", objc_msgSend(v73, "count") - 1);
    [v71 label];
    uint64_t v75 = v138 = v72;
    uint64_t v76 = objc_msgSend(v75, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v73, "count") - 1);
    [v74 setObject:v76 forKeyedSubscript:@"Name"];

    uint64_t v77 = [v71 sourceTensors];
    uint64_t v78 = [v77 objectAtIndexedSubscript:0];

    id v72 = v138;
    uint64_t v79 = ANE_CreateBroadcastedConstantTensor(v138, v78);
    uint64_t v136 = (void *)v79;
    uint64_t v137 = v78;
    if (v79)
    {
      uint64_t v80 = (void *)v79;
      uint64_t v81 = [v139 constantTensors];
      [v81 addObject:v80];

      uint64_t v82 = ANE_CreateBroadcastedConstantTensor(v140, v78);
      if (v82)
      {
        uint64_t v83 = [v139 constantTensors];
        [v83 addObject:v82];

        v176[0] = kMLCANENetUnitType[0];
        v176[1] = @"Type";
        v177[0] = @"ElementWise";
        v177[1] = @"Mult";
        uint64_t v134 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v177 forKeys:v176 count:2];
        +[_MLCANEPlistBuilder createUnitWithLayer:v71 unitParams:v134];
        uint64_t v84 = v135 = v74;
        uint64_t v85 = [v71 label];
        uint64_t v86 = objc_msgSend(v85, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v73, "count"));
        [v84 setObject:v86 forKeyedSubscript:@"Name"];

        uint64_t v87 = [v135 objectForKeyedSubscript:@"Name"];
        v175[0] = v87;
        uint64_t v88 = [v80 label];
        v175[1] = v88;
        id v157 = v8;
        uint64_t v142 = v14;
        id v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v175 count:2];
        [v84 setObject:v89 forKeyedSubscript:@"Bottom"];

        id v90 = v84;
        id v91 = v84;
        __int16 v74 = v135;
        [v73 addObject:v90];
        v173[0] = kMLCANENetUnitType[0];
        v173[1] = @"Type";
        v174[0] = @"ElementWise";
        v174[1] = @"Add";
        uint64_t v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v174 forKeys:v173 count:2];
        id v92 = +[_MLCANEPlistBuilder createUnitWithLayer:v71 unitParams:v133];
        id v93 = [v71 label];
        uint64_t v94 = objc_msgSend(v93, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v73, "count"));
        [v92 setObject:v94 forKeyedSubscript:@"Name"];

        uint64_t v95 = [v91 objectForKeyedSubscript:@"Name"];
        v172[0] = v95;
        uint64_t v96 = [v82 label];
        v172[1] = v96;
        uint64_t v97 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:2];
        [v92 setObject:v97 forKeyedSubscript:@"Bottom"];

        id v14 = v142;
        id v8 = v157;

        [v73 addObject:v92];
        float v10 = v148;

        uint64_t v98 = (void *)v134;
        id v17 = v161;
        id v72 = v138;
      }
      else
      {
        uint64_t v114 = +[MLCLog framework];
        if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR)) {
          ANE_CompileNormalizationLayer_cold_14();
        }
        id v17 = v161;
        id v72 = v138;
        uint64_t v98 = v114;
      }
      BOOL v113 = v82 != 0;
    }
    else
    {
      uint64_t v82 = +[MLCLog framework];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        ANE_CompileNormalizationLayer_cold_13();
      }
      BOOL v113 = 0;
      id v17 = v161;
    }

    id v13 = v155;
  }
  else
  {
    __int16 v74 = +[MLCLog framework];
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
      ANE_CompileNormalizationLayer_cold_12(v74, v106, v107, v108, v109, v110, v111, v112);
    }
    BOOL v113 = 0;
  }

  id v12 = v159;
  id v7 = v166;
  if (!v113)
  {
    uint64_t v115 = +[MLCLog framework];
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR)) {
      ANE_CompileNormalizationLayer_cold_11();
    }

    uint64_t v67 = 0;
  }
  else
  {
LABEL_81:
    uint64_t v67 = (void *)[v164 copy];
  }
LABEL_85:
  id v26 = v143;
LABEL_86:

  uint64_t v102 = v12;
  if (!v67)
  {
    uint64_t v132 = +[MLCLog framework];
    id v16 = v168;
    uint64_t v129 = v169;
    if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR)) {
      ANE_CompileNormalizationLayer_cold_2();
    }

    uint64_t v104 = 0;
    goto LABEL_92;
  }
LABEL_87:
  [v14 addObjectsFromArray:v67];

  if (!v17)
  {
LABEL_90:
    id v12 = v102;
    uint64_t v104 = (void *)[v14 copy];
    id v16 = v168;
    goto LABEL_91;
  }
  [v102 fusedLayers];
  v116 = id v12 = v102;
  uint64_t v117 = [v116 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v119 = [v12 fusedLayers];
    uint64_t v120 = [v119 objectAtIndexedSubscript:0];

    uint64_t v121 = [v120 descriptor];
    uint64_t v122 = ANE_CreateUnitsWithNeuronLayer(v120, v17, [v121 activationType]);

    uint64_t v123 = [v12 label];
    int v171 = v123;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v171 count:1];
    id v167 = v7;
    v124 = id v162 = v17;
    [v122 objectAtIndexedSubscript:0];
    uint64_t v125 = v14;
    uint64_t v126 = v13;
    v128 = uint64_t v127 = v10;
    [v128 setObject:v124 forKeyedSubscript:@"Bottom"];

    float v10 = v127;
    id v13 = v126;
    id v14 = v125;

    id v17 = v162;
    id v7 = v167;

    [v14 addObjectsFromArray:v122];
    uint64_t v102 = v12;
    goto LABEL_90;
  }
  uint64_t v131 = +[MLCLog framework];
  uint64_t v129 = v169;
  if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
    ANE_CompileNormalizationLayer_cold_3(v12, v131);
  }

  uint64_t v104 = 0;
  id v16 = v168;
LABEL_92:

  return v104;
}

uint64_t ANE_BuildGocParams(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1CC08];
  float v10 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  [v10 setObject:@"GOC" forKeyedSubscript:kMLCANENetUnitType[0]];
  id v11 = (void *)[v9 mutableCopy];
  id v12 = [NSNumber numberWithBool:0];
  [v11 setObject:v12 forKeyedSubscript:@"BiasMutable"];

  id v13 = [NSNumber numberWithUnsignedInteger:a2];
  [v11 setObject:v13 forKeyedSubscript:@"BiasCount"];

  id v14 = [v7 descriptor];
  int v15 = [v14 dataType];

  id v16 = ANE_GetANECIRDataTypeWithMLCDataType(v15);
  if (!v16)
  {
    id v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      ANE_BuildGocParams_cold_1();
    }
    goto LABEL_9;
  }
  [v11 setObject:v16 forKeyedSubscript:@"BiasType"];
  id v17 = [NSNumber numberWithBool:0];
  [v11 setObject:v17 forKeyedSubscript:@"ScaleMutable"];

  id v18 = [NSNumber numberWithUnsignedInteger:a2];
  [v11 setObject:v18 forKeyedSubscript:@"ScaleCount"];

  id v19 = [v8 descriptor];
  LODWORD(v17) = [v19 dataType];

  id v20 = ANE_GetANECIRDataTypeWithMLCDataType((int)v17);
  if (!v20)
  {
    id v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      ANE_BuildGocParams_cold_1();
    }

LABEL_9:
    uint64_t v21 = 0;
    goto LABEL_10;
  }
  [v11 setObject:v20 forKeyedSubscript:@"ScaleType"];
  [v10 setObject:v11 forKeyedSubscript:@"BiasScaleGroupData"];
  *a1 = v10;
  uint64_t v21 = 1;
LABEL_10:

  return v21;
}

uint64_t ANE_CalculateScaleAndBiasForInstanceNorm(uint64_t a1, void *a2, void *a3, float a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = [v7 descriptor];
  uint64_t v10 = [v9 dataType];

  id v11 = [v7 data];
  uint64_t v12 = [v11 bytes];

  size_t v13 = +[MLCTensorDescriptor elementByteCount:v10] * a1;
  id v14 = malloc_type_malloc(v13, 0x51A39D83uLL);
  uint64_t v38 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v14 length:v13 freeWhenDone:1];
  int v15 = [v8 descriptor];
  uint64_t v16 = [v15 dataType];

  id v17 = [v8 data];
  uint64_t v18 = [v17 bytes];

  size_t v19 = +[MLCTensorDescriptor elementByteCount:v16] * a1;
  id v20 = malloc_type_malloc(v19, 0x8B7540F8uLL);
  uint64_t v36 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v20 length:v19 freeWhenDone:1];
  if (!a1)
  {
LABEL_12:
    id v29 = objc_msgSend(v7, "deviceMemory", v36);
    uint64_t v30 = (void *)v38;
    objc_msgSend(v29, "setObject:atIndexedSubscript:", v38, objc_msgSend(v7, "deviceIndex"));

    id v31 = [v8 deviceMemory];
    size_t v32 = v37;
    objc_msgSend(v31, "setObject:atIndexedSubscript:", v37, objc_msgSend(v8, "deviceIndex"));

    uint64_t v33 = 1;
    goto LABEL_18;
  }
  uint64_t v22 = 0;
  double v23 = a4;
  while (1)
  {
    _S8 = ANE_GetTensorValueInFloat(v18, v16, v22, *(float *)&_D0);
    _D0 = ANE_GetTensorValueInFloat(v12, v10, v22, _S8) / (v23 + _S8);
    if (v10 == 3)
    {
      __asm { FCVT            H0, D0 }
      v14[v22] = LOWORD(_D0);
    }
    else
    {
      if (v10 != 1)
      {
        uint64_t v34 = +[MLCLog framework];
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      *(float *)&_D0 = _D0;
      *(_DWORD *)&v14[2 * v22] = LODWORD(_D0);
    }
    if (v16 == 3)
    {
      __asm { FCVT            H0, S8 }
      v20[v22] = LOWORD(_D0);
      goto LABEL_11;
    }
    if (v16 != 1) {
      break;
    }
    *(float *)&v20[2 * v22] = _S8;
LABEL_11:
    if (a1 == ++v22) {
      goto LABEL_12;
    }
  }
  uint64_t v34 = +[MLCLog framework];
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
LABEL_16:
  ANE_CalculateScaleAndBiasForInstanceNorm_cold_1();
LABEL_17:

  uint64_t v33 = 0;
  size_t v32 = (void *)v36;
  uint64_t v30 = (void *)v38;
LABEL_18:

  return v33;
}

id ANE_CreateNormUnits(int a1, void *a2, void *a3, void *a4, void *a5)
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  size_t v13 = v12;
  if (a1 == 3)
  {
    id v82 = v10;
    id v22 = v10;
    id v23 = v13;
    id v24 = v11;
    id v25 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    id v26 = v22;
    id v84 = 0;
    ANE_GetTensor4DShapeWithBatchFirst(v9, &v84);
    id v79 = v84;
    uint64_t v27 = [v79 objectAtIndexedSubscript:1];
    uint64_t v28 = [v27 unsignedIntegerValue];

    uint64_t v80 = v24;
    id v29 = +[_MLCANEPlistBuilder createUnitWithLayer:v26 unitParams:v24];
    uint64_t v30 = [NSNumber numberWithUnsignedInteger:v28];
    [v29 setObject:v30 forKeyedSubscript:@"OutputChannels"];

    id v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "groupCount"));
    [v29 setObject:v31 forKeyedSubscript:@"NumGroups"];

    v87[0] = v9;
    size_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
    LOBYTE(v24) = ANE_ValidateLayerNormUnit(v32, v29, 0);

    if ((v24 & 1) == 0)
    {
      id v72 = +[MLCLog framework];
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        ANE_CreateNormUnits_cold_7();
      }

      uint64_t v21 = 0;
      goto LABEL_38;
    }
    [v25 addObject:v29];
    if (v23)
    {
      uint64_t v77 = v13;
      uint64_t v33 = +[_MLCANEPlistBuilder createUnitWithLayer:v26 unitParams:v23];
      uint64_t v34 = [v26 label];
      uint64_t v35 = [v34 stringByAppendingString:@"_0"];
      [v29 setObject:v35 forKeyedSubscript:@"Name"];

      uint64_t v36 = [v26 label];
      double v37 = [v36 stringByAppendingString:@"_1"];
      [v33 setObject:v37 forKeyedSubscript:@"Name"];

      uint64_t v38 = [v29 objectForKeyedSubscript:@"Name"];
      uint64_t v86 = v38;
      uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
      [v33 setObject:v39 forKeyedSubscript:@"Bottom"];

      id v40 = [NSNumber numberWithUnsignedInteger:v28];
      [v33 setObject:v40 forKeyedSubscript:@"OutputChannels"];

      id v85 = v9;
      double v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
      LOBYTE(v39) = ANE_ValidateGOCUnit(v41, v33, 0);

      if ((v39 & 1) == 0)
      {
        __int16 v74 = +[MLCLog framework];
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          ANE_CreateNormUnits_cold_6();
        }

        uint64_t v21 = 0;
        size_t v13 = v77;
        goto LABEL_38;
      }
      [v25 addObject:v33];

      size_t v13 = v77;
    }
    uint64_t v21 = (void *)[v25 copy];
LABEL_38:

    id v11 = v80;
    id v10 = v82;
    goto LABEL_45;
  }
  if (a1 == 1)
  {
    id v42 = v10;
    id v43 = v11;
    id v83 = v13;
    uint64_t v81 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    id v44 = v42;
    id v84 = 0;
    ANE_GetTensor4DShapeWithBatchFirst(v9, &v84);
    id v45 = v84;
    uint64_t v46 = [v44 mean];
    if (v46
      && (id v47 = (void *)v46,
          [v44 variance],
          unint64_t v48 = objc_claimAutoreleasedReturnValue(),
          v48,
          v47,
          v48))
    {
      int v49 = +[_MLCANEPlistBuilder createUnitWithLayer:v44 unitParams:v43];
      int v50 = NSNumber;
      uint64_t v51 = [v45 objectAtIndexedSubscript:1];
      double v52 = objc_msgSend(v50, "numberWithUnsignedInteger:", objc_msgSend((id)v51, "unsignedIntegerValue"));
      [v49 setObject:v52 forKeyedSubscript:@"OutputChannels"];

      v87[0] = v9;
      double v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
      LOBYTE(v51) = ANE_ValidateGOCUnit(v53, v49, 0);

      if (v51)
      {
        size_t v54 = v81;
        [v81 addObject:v49];
LABEL_22:
        uint64_t v60 = v83;
        goto LABEL_39;
      }
      uint64_t v61 = +[MLCLog framework];
      uint64_t v60 = v83;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        ANE_CreateNormUnits_cold_3();
      }
    }
    else
    {
      uint64_t v78 = v13;
      int v49 = +[_MLCANEPlistBuilder createUnitWithLayer:v44 unitParams:v43];
      uint64_t v56 = NSNumber;
      uint64_t v57 = [v45 objectAtIndexedSubscript:1];
      char v58 = objc_msgSend(v56, "numberWithUnsignedInteger:", objc_msgSend((id)v57, "unsignedIntegerValue"));
      [v49 setObject:v58 forKeyedSubscript:@"OutputChannels"];

      v87[0] = v9;
      uint64_t v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
      LOBYTE(v57) = ANE_ValidateInstanceNormUnit(v59, v49, 0);

      if (v57)
      {
        size_t v54 = v81;
        [v81 addObject:v49];
        uint64_t v60 = v83;
        if (!v83)
        {
LABEL_39:

          uint64_t v21 = (void *)[v54 copy];
LABEL_44:

          goto LABEL_45;
        }
        uint64_t v61 = +[_MLCANEPlistBuilder createUnitWithLayer:v44 unitParams:v83];
        uint64_t v62 = [v44 label];
        int v63 = [v62 stringByAppendingString:@"_0"];
        [v49 setObject:v63 forKeyedSubscript:@"Name"];

        uint64_t v64 = [v44 label];
        uint64_t v65 = [v64 stringByAppendingString:@"_1"];
        [v61 setObject:v65 forKeyedSubscript:@"Name"];

        uint64_t v66 = [v49 objectForKeyedSubscript:@"Name"];
        uint64_t v86 = v66;
        uint64_t v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
        [v61 setObject:v67 forKeyedSubscript:@"Bottom"];

        uint64_t v68 = NSNumber;
        uint64_t v69 = [v45 objectAtIndexedSubscript:1];
        BOOL v70 = objc_msgSend(v68, "numberWithUnsignedInteger:", objc_msgSend((id)v69, "unsignedIntegerValue"));
        [v61 setObject:v70 forKeyedSubscript:@"OutputChannels"];

        id v85 = v9;
        id v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v85 count:1];
        LOBYTE(v69) = ANE_ValidateGOCUnit(v71, v61, 0);

        if (v69)
        {
          [v81 addObject:v61];

          size_t v54 = v81;
          size_t v13 = v78;
          goto LABEL_22;
        }
        uint64_t v75 = +[MLCLog framework];
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
          ANE_CreateNormUnits_cold_3();
        }

        size_t v13 = v78;
        uint64_t v60 = v83;
      }
      else
      {
        uint64_t v61 = +[MLCLog framework];
        uint64_t v60 = v83;
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          ANE_CreateNormUnits_cold_4();
        }
      }
    }

    uint64_t v21 = 0;
    size_t v54 = v81;
    goto LABEL_44;
  }
  if (a1)
  {
    float v55 = +[MLCLog framework];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      ANE_CreateNormUnits_cold_1();
    }

    uint64_t v21 = 0;
  }
  else
  {
    id v14 = v12;
    id v84 = 0;
    ANE_GetTensor4DShapeWithBatchFirst(v9, &v84);
    id v15 = v84;
    uint64_t v16 = +[_MLCANEPlistBuilder createUnitWithLayer:v10 unitParams:v11];
    id v17 = NSNumber;
    uint64_t v18 = [v15 objectAtIndexedSubscript:1];
    size_t v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend((id)v18, "unsignedIntegerValue"));
    [v16 setObject:v19 forKeyedSubscript:@"OutputChannels"];

    v87[0] = v9;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:1];
    LOBYTE(v18) = ANE_ValidateGOCUnit(v20, v16, 0);

    if (v18)
    {
      uint64_t v86 = v16;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v86 count:1];
    }
    else
    {
      id v73 = +[MLCLog framework];
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
        ANE_CreateNormUnits_cold_2();
      }

      uint64_t v21 = 0;
    }
    size_t v13 = v14;
  }
LABEL_45:

  return v21;
}

id ANE_CreateBroadcastedConstantTensor(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 descriptor];
  unint64_t v6 = [v5 dimensionCount];

  id v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v8 = v6 - 3;
  if (v6 < 3) {
    unint64_t v8 = 0;
  }
  if (v8 >= v6)
  {
    unint64_t v11 = 1;
  }
  else
  {
    uint64_t v9 = 3;
    if (v6 < 3) {
      uint64_t v9 = v6;
    }
    uint64_t v10 = -v9;
    unint64_t v11 = 1;
    do
    {
      id v12 = [v4 descriptor];
      size_t v13 = [v12 shape];
      id v14 = [v13 objectAtIndexedSubscript:v6 + v10];
      [v7 addObject:v14];

      id v15 = [v4 descriptor];
      uint64_t v16 = [v15 shape];
      id v17 = [v16 objectAtIndexedSubscript:v6 + v10];
      v11 *= [v17 unsignedIntegerValue];
    }
    while (!__CFADD__(v10++, 1));
  }
  id v19 = [v3 data];
  id v20 = (const void *)[v19 bytes];

  uint64_t v21 = [v3 descriptor];
  uint64_t v22 = [v21 dataType];

  unint64_t v23 = +[MLCTensorDescriptor elementByteCount:v22];
  uint64_t v36 = v3;
  id v24 = [v3 descriptor];
  size_t v25 = [v24 tensorAllocationSizeInBytes];

  size_t v26 = v25 / v23;
  unint64_t v27 = v11 / (v25 / v23);
  if (v11 % (v25 / v23))
  {
    uint64_t v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      ANE_CreateBroadcastedConstantTensor_cold_1();
    }

    id v29 = 0;
    uint64_t v30 = v36;
  }
  else
  {
    size_t v31 = v23 * v11;
    size_t v32 = (char *)malloc_type_malloc(v31, 0x25DED30DuLL);
    uint64_t v33 = +[MLCTensorData dataWithBytesNoCopy:v32 length:v31 freeWhenDone:1];
    if (v26 <= v11)
    {
      if (v27 <= 1) {
        unint64_t v27 = 1;
      }
      do
      {
        memcpy(v32, v20, v25);
        v32 += v25;
        --v27;
      }
      while (v27);
    }
    uint64_t v30 = v36;
    uint64_t v34 = [v36 label];
    id v29 = +[_MLCANEPlistBuilder constantTensorWithShape:v7 data:v33 dataType:v22 tensorLabel:v34];
  }

  return v29;
}

void OUTLINED_FUNCTION_6_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

unint64_t *hashCombine_6(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 6;
  do
  {
    unint64_t v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *float result = v9;
  return result;
}

unint64_t *hashCombine_7(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 3;
  do
  {
    unint64_t v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *float result = v9;
  return result;
}

id GPU_CreateSGDOptimizer(void *a1, uint64_t a2, void *a3, float a4)
{
  id v7 = a1;
  id v8 = a3;
  unint64_t v9 = [v7 deviceList];
  uint64_t v10 = [v9 count];

  uint64_t v11 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  id v12 = (void *)v11;
  if (v10)
  {
    uint64_t v13 = 0;
    id v14 = @"sgdMomentumOptimizerUpdate";
    if (a4 == 0.0) {
      id v14 = @"sgdVanillaOptimizerUpdate";
    }
    uint64_t v36 = v14;
    unsigned int v35 = a2;
    uint64_t v33 = (void *)v11;
    uint64_t v34 = v10;
    do
    {
      id v15 = objc_msgSend(v7, "deviceList", v33);
      uint64_t v16 = [v15 objectAtIndexedSubscript:v13];

      id v17 = [v7 gpuLibrary];
      uint64_t v18 = [v17 objectAtIndexedSubscript:v13];
      id v19 = (void *)[v18 newFunctionWithName:v36];

      uint64_t v20 = [v16 newComputePipelineStateWithFunction:v19 error:0];
      if (v20)
      {
        uint64_t v21 = (void *)v20;
        uint64_t v22 = +[MLCDeviceOptimizer deviceOptimizerWithKernel:v20];
        if (v22) {
          [v12 addObject:v22];
        }
        [v22 setGpuOptimizerKernelType:2];
        [v22 setDescriptor:v8];
        [v8 learningRate];
        objc_msgSend(v22, "setLearningRate:");
        *(float *)&double v23 = a4;
        [v22 setMomentumScale:v23];
        [v22 setUsesNesterov:a2];
        [v22 setL2NormBuffer:0];
        if ([v8 gradientClippingType] == 2)
        {
          [v8 customGlobalNorm];
          if (v24 == 0.0)
          {
            size_t v25 = [v7 gpuLibrary];
            size_t v26 = [v25 objectAtIndexedSubscript:v13];
            unint64_t v27 = (void *)[v26 newFunctionWithName:@"compute_l2norm"];

            uint64_t v28 = (void *)[v16 newComputePipelineStateWithFunction:v27 error:0];
            [v22 setComputeL2NormKernel:v28];
            id v29 = [v7 gpuLibrary];
            uint64_t v30 = [v29 objectAtIndexedSubscript:v13];
            id v19 = (void *)[v30 newFunctionWithName:@"sum_l2norm_values_in_buffer"];

            id v12 = v33;
            uint64_t v10 = v34;
            uint64_t v21 = (void *)[v16 newComputePipelineStateWithFunction:v19 error:0];

            a2 = v35;
            [v22 setSumL2NormKernel:v21];
          }
        }
      }
      ++v13;
    }
    while (v10 != v13);
  }
  size_t v31 = (void *)[v12 copy];

  return v31;
}

id GPU_CreateAdamOptimizer(void *a1, uint64_t a2, float a3, float a4, float a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v14 = a1;
  id v15 = a8;
  uint64_t v16 = [v14 deviceList];
  uint64_t v17 = [v16 count];

  id v44 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (v17)
  {
    uint64_t v18 = 0;
    id v19 = @"adamOptimizerUpdate";
    if (a2) {
      id v19 = @"adamWithAmsGradOptimizerUpdate";
    }
    id v45 = v19;
    unsigned int v42 = a2;
    unsigned int v43 = a7;
    id v41 = v15;
    do
    {
      uint64_t v20 = objc_msgSend(v14, "deviceList", v41);
      uint64_t v21 = [v20 objectAtIndexedSubscript:v18];

      uint64_t v22 = [v14 gpuLibrary];
      double v23 = [v22 objectAtIndexedSubscript:v18];
      float v24 = (void *)[v23 newFunctionWithName:v45];

      uint64_t v25 = [v21 newComputePipelineStateWithFunction:v24 error:0];
      if (v25)
      {
        size_t v26 = (void *)v25;
        unint64_t v27 = +[MLCDeviceOptimizer deviceOptimizerWithKernel:v25];
        if (v27) {
          [v44 addObject:v27];
        }
        [v27 setGpuOptimizerKernelType:1];
        [v27 setDescriptor:v15];
        *(float *)&double v28 = a3;
        [v27 setBeta1:v28];
        *(float *)&double v29 = a4;
        [v27 setBeta2:v29];
        *(float *)&double v30 = a5;
        [v27 setEpsilon:v30];
        [v27 setAmsgrad:a2];
        [v27 setDecoupleWeightDecay:a7];
        [v27 setL2NormBuffer:0];
        if ([v15 gradientClippingType] == 2)
        {
          [v15 customGlobalNorm];
          if (v31 == 0.0)
          {
            size_t v32 = [v14 gpuLibrary];
            uint64_t v33 = [v32 objectAtIndexedSubscript:v18];
            uint64_t v34 = v17;
            unsigned int v35 = (void *)[v33 newFunctionWithName:@"compute_l2norm"];

            uint64_t v36 = (void *)[v21 newComputePipelineStateWithFunction:v35 error:0];
            [v27 setComputeL2NormKernel:v36];
            double v37 = [v14 gpuLibrary];
            uint64_t v38 = [v37 objectAtIndexedSubscript:v18];
            float v24 = (void *)[v38 newFunctionWithName:@"sum_l2norm_values_in_buffer"];

            uint64_t v17 = v34;
            id v15 = v41;

            a2 = v42;
            size_t v26 = (void *)[v21 newComputePipelineStateWithFunction:v24 error:0];

            a7 = v43;
            [v27 setSumL2NormKernel:v26];
          }
        }
      }
      ++v18;
    }
    while (v17 != v18);
  }
  uint64_t v39 = (void *)[v44 copy];

  return v39;
}

id GPU_CreateRMSPropOptimizer(void *a1, uint64_t a2, void *a3, float a4, float a5, float a6)
{
  id v11 = a1;
  id v12 = a3;
  uint64_t v13 = [v11 deviceList];
  uint64_t v14 = [v13 count];

  uint64_t v15 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v16 = (void *)v15;
  if (v14)
  {
    uint64_t v17 = 0;
    unsigned int v41 = a2;
    uint64_t v39 = (void *)v15;
    id v40 = v12;
    do
    {
      uint64_t v18 = [v11 deviceList];
      id v19 = [v18 objectAtIndexedSubscript:v17];

      uint64_t v20 = [v11 gpuLibrary];
      uint64_t v21 = [v20 objectAtIndexedSubscript:v17];
      uint64_t v22 = (void *)[v21 newFunctionWithName:@"rmsPropOptimizerUpdate"];

      uint64_t v23 = [v19 newComputePipelineStateWithFunction:v22 error:0];
      if (v23)
      {
        float v24 = (void *)v23;
        uint64_t v25 = +[MLCDeviceOptimizer deviceOptimizerWithKernel:v23];
        if (v25) {
          [v16 addObject:v25];
        }
        [v25 setGpuOptimizerKernelType:3];
        [v25 setDescriptor:v12];
        *(float *)&double v26 = a6;
        [v25 setEpsilon:v26];
        *(float *)&double v27 = a5;
        [v25 setAlpha:v27];
        [v25 setCentered:a2];
        *(float *)&double v28 = a4;
        [v25 setMomentumScale:v28];
        [v25 setL2NormBuffer:0];
        if ([v12 gradientClippingType] == 2)
        {
          [v12 customGlobalNorm];
          if (v29 == 0.0)
          {
            double v30 = [v11 gpuLibrary];
            float v31 = [v30 objectAtIndexedSubscript:v17];
            uint64_t v32 = v14;
            uint64_t v33 = (void *)[v31 newFunctionWithName:@"compute_l2norm"];

            uint64_t v34 = (void *)[v19 newComputePipelineStateWithFunction:v33 error:0];
            [v25 setComputeL2NormKernel:v34];
            unsigned int v35 = [v11 gpuLibrary];
            uint64_t v36 = [v35 objectAtIndexedSubscript:v17];
            uint64_t v22 = (void *)[v36 newFunctionWithName:@"sum_l2norm_values_in_buffer"];

            uint64_t v14 = v32;
            id v12 = v40;

            uint64_t v16 = v39;
            float v24 = (void *)[v19 newComputePipelineStateWithFunction:v22 error:0];

            a2 = v41;
            [v25 setSumL2NormKernel:v24];
          }
        }
      }
      ++v17;
    }
    while (v14 != v17);
  }
  double v37 = (void *)[v16 copy];

  return v37;
}

BOOL ANE_ConvertFp32ToFp16(uint64_t a1, uint64_t a2)
{
  return +[MLCDataHelper convertFp32toFp16:1 fp32Values:a1 fp16Values:a2];
}

BOOL ANE_ConvertFp32ToInt16(uint64_t a1, _WORD *a2)
{
  __int16 v6 = 0;
  BOOL v3 = +[MLCDataHelper convertFp32toFp16:1 fp32Values:a1 fp16Values:&v6];
  if (v3)
  {
    *a2 = v6;
  }
  else
  {
    uint64_t v4 = +[MLCLog framework];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ANE_ConvertFp32ToInt16_cold_1();
    }
  }
  return v3;
}

uint64_t ANE_CompressSparseKernel(void *a1, uint64_t a2, void *a3, void *a4, void *a5, float a6)
{
  id v10 = a1;
  *a5 = 0;
  id v11 = v10;
  uint64_t v12 = [v11 bytes];
  unint64_t v13 = +[MLCTensorDescriptor elementByteCount:a2];
  unint64_t v14 = [v11 length];
  unint64_t v16 = v14;
  unint64_t v17 = v14 / v13;
  if (v13 <= v14)
  {
    uint64_t v18 = 0;
    if (v17 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = v14 / v13;
    }
    do
    {
      float v15 = fabsf(ANE_GetTensorValueInFloat(v12, a2, v18, v15));
      if (v15 > a6) {
        ++*a5;
      }
      ++v18;
    }
    while (v19 != v18);
  }
  if ((float)((float)(v17 - *a5) / (float)v17) >= 0.2)
  {
    unsigned int v42 = a4;
    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc((v17 + 7) >> 3, 1uLL, 0x100004077774924uLL), (v17 + 7) >> 3, 1);
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(*a5 * v13, 0x3AEDEE18uLL), *a5 * v13, 1);
    uint64_t v20 = v22;
    uint64_t v24 = [v20 bytes];
    id v25 = v23;
    uint64_t v26 = [v25 bytes];
    if (v13 <= v16)
    {
      unint64_t v27 = 0;
      uint64_t v28 = 0;
      if (v17 <= 1) {
        uint64_t v29 = 1;
      }
      else {
        uint64_t v29 = v17;
      }
      while (2)
      {
        switch((int)a2)
        {
          case 1:
            float v32 = *(float *)(v12 + 4 * v27);
            if (fabsf(v32) <= a6) {
              goto LABEL_26;
            }
            *(float *)(v26 + 4 * v28) = v32;
            goto LABEL_25;
          case 3:
            short float v33 = *(short float *)(v12 + 2 * v27);
            _H1 = fabsl(v33);
            __asm { FCVT            S1, H1 }
            if (_S1 <= a6) {
              goto LABEL_26;
            }
            *(short float *)(v26 + 2 * v28) = v33;
            goto LABEL_25;
          case 6:
          case 9:
            unsigned int v30 = *(unsigned __int8 *)(v12 + v27);
            float v31 = (float)v30;
            goto LABEL_23;
          case 8:
            LOBYTE(v30) = *(unsigned char *)(v12 + v27);
            float v31 = fabsf((float)(char)v30);
LABEL_23:
            if (v31 <= a6) {
              goto LABEL_26;
            }
            *(unsigned char *)(v26 + v28) = v30;
LABEL_25:
            ++v28;
            *(unsigned char *)(v24 + (v27 >> 3)) |= 1 << (v27 & 7);
LABEL_26:
            if (v29 == ++v27) {
              break;
            }
            continue;
          default:
            unsigned int v41 = +[MLCLog framework];
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
              ANE_CompressSparseKernel_cold_2();
            }

            uint64_t v21 = 0;
            goto LABEL_28;
        }
        break;
      }
    }
    *a3 = v20;
    void *v42 = v25;
    uint64_t v21 = 1;
LABEL_28:
  }
  else
  {
    uint64_t v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      ANE_CompressSparseKernel_cold_1();
    }
    uint64_t v21 = 0;
  }

  return v21;
}

float ANE_GetTensorValueInFloat(uint64_t a1, int a2, uint64_t a3, float a4)
{
  switch(a2)
  {
    case 1:
      float result = *(float *)(a1 + 4 * a3);
      break;
    case 3:
      _H0 = *(_WORD *)(a1 + 2 * a3);
      __asm { FCVT            S0, H0 }
      break;
    case 4:
    case 6:
    case 9:
      LOBYTE(a4) = *(unsigned char *)(a1 + a3);
      float result = (float)LODWORD(a4);
      break;
    case 8:
      float result = (float)*(char *)(a1 + a3);
      break;
    default:
      uint64_t v5 = +[MLCLog framework];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        ANE_GetTensorValueInFloat_cold_1();
      }

      float result = NAN;
      break;
  }
  return result;
}

uint64_t ANE_CalculateImageSizeForTensor(void *a1)
{
  id v1 = a1;
  id v2 = [v1 descriptor];
  BOOL v3 = [v2 shape];
  unint64_t v4 = [v3 count] != 1;

  uint64_t v5 = [v1 descriptor];
  __int16 v6 = [v5 shape];
  unint64_t v7 = [v6 count];

  uint64_t v8 = 1;
  if (v7 > v4)
  {
    do
    {
      unint64_t v9 = [v1 descriptor];
      id v10 = [v9 shape];
      id v11 = [v10 objectAtIndexedSubscript:v4];
      v8 *= [v11 unsignedIntegerValue];

      ++v4;
      uint64_t v12 = [v1 descriptor];
      unint64_t v13 = [v12 shape];
      unint64_t v14 = [v13 count];
    }
    while (v4 < v14);
  }
  float v15 = [v1 descriptor];
  uint64_t v16 = [v15 elementByteCount];

  return v16 * v8;
}

void ANE_GetTensorWidthAndHeightWithOnePrepended(void *a1, uint64_t *a2, uint64_t *a3)
{
  id v5 = a1;
  __int16 v6 = [v5 descriptor];
  uint64_t v7 = [v6 dimensionCount];

  switch(v7)
  {
    case 1:
      uint64_t v8 = [v5 descriptor];
      unint64_t v9 = [v8 shape];
      id v10 = [v9 objectAtIndexedSubscript:0];
      uint64_t v11 = [v10 unsignedIntegerValue];
      uint64_t v12 = 1;
      goto LABEL_10;
    case 2:
      unint64_t v14 = [v5 descriptor];
      float v15 = [v14 shape];
      uint64_t v16 = [v15 objectAtIndexedSubscript:1];
      uint64_t v11 = [v16 unsignedIntegerValue];

      uint64_t v8 = [v5 descriptor];
      unint64_t v17 = [v8 shape];
      unint64_t v9 = v17;
      uint64_t v18 = 0;
      goto LABEL_9;
    case 3:
      uint64_t v19 = [v5 descriptor];
      uint64_t v20 = [v19 shape];
      uint64_t v21 = [v20 objectAtIndexedSubscript:2];
      uint64_t v11 = [v21 unsignedIntegerValue];

      uint64_t v8 = [v5 descriptor];
      unint64_t v17 = [v8 shape];
      unint64_t v9 = v17;
      uint64_t v18 = 1;
      goto LABEL_9;
    case 4:
      uint64_t v22 = [v5 descriptor];
      uint64_t v23 = [v22 shape];
      uint64_t v24 = [v23 objectAtIndexedSubscript:3];
      uint64_t v11 = [v24 unsignedIntegerValue];

      uint64_t v8 = [v5 descriptor];
      unint64_t v17 = [v8 shape];
      unint64_t v9 = v17;
      uint64_t v18 = 2;
LABEL_9:
      id v10 = [v17 objectAtIndexedSubscript:v18];
      uint64_t v12 = [v10 unsignedIntegerValue];
LABEL_10:

      *a2 = v11;
      *a3 = v12;
      break;
    default:
      unint64_t v13 = +[MLCLog framework];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        ANE_GetTensorWidthAndHeightWithOnePrepended_cold_1();
      }

      break;
  }
}

void ANE_GetTensorFeatureChannelsWithOnePrepended(void *a1, uint64_t *a2)
{
  id v11 = a1;
  BOOL v3 = [v11 descriptor];
  uint64_t v4 = [v3 dimensionCount];

  if (v4 == 3)
  {
    id v5 = [v11 descriptor];
    __int16 v6 = [v5 shape];
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if (v4 == 4)
  {
    id v5 = [v11 descriptor];
    __int16 v6 = [v5 shape];
    uint64_t v7 = v6;
    uint64_t v8 = 1;
LABEL_5:
    unint64_t v9 = [v6 objectAtIndexedSubscript:v8];
    uint64_t v10 = [v9 unsignedIntegerValue];

    goto LABEL_7;
  }
  uint64_t v10 = 1;
LABEL_7:
  *a2 = v10;
}

void ANE_GetTensorBatchSizeWithOnePrepended(void *a1, void *a2)
{
  id v7 = a1;
  BOOL v3 = [v7 descriptor];
  if ([v3 dimensionCount] == 4)
  {
    uint64_t v4 = [v7 descriptor];
    id v5 = [v4 shape];
    __int16 v6 = [v5 objectAtIndexedSubscript:0];
    *a2 = [v6 unsignedIntegerValue];
  }
  else
  {
    *a2 = 1;
  }
}

void ANE_GetTensor4DShapeWithOnePrepended(void *a1, void *a2)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 1;
  uint64_t v11 = 1;
  uint64_t v8 = 1;
  uint64_t v9 = 1;
  id v3 = a1;
  ANE_GetTensorWidthAndHeightWithOnePrepended(v3, &v8, &v9);
  ANE_GetTensorFeatureChannelsWithOnePrepended(v3, &v10);
  ANE_GetTensorBatchSizeWithOnePrepended(v3, &v11);

  uint64_t v4 = [NSNumber numberWithUnsignedInteger:v11];
  v12[0] = v4;
  id v5 = [NSNumber numberWithUnsignedInteger:v10];
  v12[1] = v5;
  __int16 v6 = [NSNumber numberWithUnsignedInteger:v9];
  v12[2] = v6;
  id v7 = [NSNumber numberWithUnsignedInteger:v8];
  void v12[3] = v7;
  *a2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
}

void ANE_GetDimensionIn4DWithOnePrepended(unint64_t a1, unint64_t a2, uint64_t *a3)
{
  if (a1 >= 5)
  {
    uint64_t v4 = +[MLCLog framework];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ANE_GetDimensionIn4DWithOnePrepended_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }

LABEL_11:
    uint64_t v12 = -1;
    goto LABEL_12;
  }
  if (a2 >= a1)
  {
    unint64_t v13 = +[MLCLog framework];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      ANE_GetDimensionIn4DWithOnePrepended_cold_2();
    }

    goto LABEL_11;
  }
  *a3 = a2;
  if (a1 > 3) {
    return;
  }
  uint64_t v12 = a2 - a1 + 4;
LABEL_12:
  *a3 = v12;
}

void ANE_GetTensorWidthAndHeightWithBatchFirst(void *a1, uint64_t *a2, uint64_t *a3)
{
  id v15 = a1;
  uint64_t v5 = [v15 descriptor];
  uint64_t v6 = [v5 dimensionCount];

  if (v6 == 3)
  {
    uint64_t v11 = [v15 descriptor];
    uint64_t v12 = [v11 shape];
    unint64_t v13 = [v12 objectAtIndexedSubscript:2];
    uint64_t v10 = [v13 unsignedIntegerValue];
    uint64_t v14 = 1;
    goto LABEL_5;
  }
  if (v6 == 4)
  {
    uint64_t v7 = [v15 descriptor];
    uint64_t v8 = [v7 shape];
    uint64_t v9 = [v8 objectAtIndexedSubscript:3];
    uint64_t v10 = [v9 unsignedIntegerValue];

    uint64_t v11 = [v15 descriptor];
    uint64_t v12 = [v11 shape];
    unint64_t v13 = [v12 objectAtIndexedSubscript:2];
    uint64_t v14 = [v13 unsignedIntegerValue];
LABEL_5:

    goto LABEL_7;
  }
  uint64_t v14 = 1;
  uint64_t v10 = 1;
LABEL_7:
  *a2 = v10;
  *a3 = v14;
}

void ANE_GetTensorFeatureChannelsWithBatchFirst(void *a1, uint64_t *a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 descriptor];
  uint64_t v5 = [v4 dimensionCount];

  if ((unint64_t)(v5 - 2) < 3)
  {
    uint64_t v6 = [v3 descriptor];
    uint64_t v7 = [v6 shape];
    uint64_t v8 = v7;
    uint64_t v9 = 1;
LABEL_5:
    uint64_t v10 = [v7 objectAtIndexedSubscript:v9];
    uint64_t v11 = [v10 unsignedIntegerValue];

    *a2 = v11;
    goto LABEL_9;
  }
  if (v5 == 1)
  {
    uint64_t v6 = [v3 descriptor];
    uint64_t v7 = [v6 shape];
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    goto LABEL_5;
  }
  uint64_t v12 = +[MLCLog framework];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    ANE_GetTensorFeatureChannelsWithBatchFirst_cold_1();
  }

LABEL_9:
}

void ANE_GetTensorBatchSizeWithBatchFirst(void *a1, void *a2)
{
  id v7 = a1;
  id v3 = [v7 descriptor];
  if ([v3 dimensionCount] == 1)
  {
    *a2 = 1;
  }
  else
  {
    uint64_t v4 = [v7 descriptor];
    uint64_t v5 = [v4 shape];
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    *a2 = [v6 unsignedIntegerValue];
  }
}

void ANE_GetTensor4DShapeWithBatchFirst(void *a1, void *a2)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 1;
  uint64_t v11 = 1;
  uint64_t v8 = 1;
  uint64_t v9 = 1;
  id v3 = a1;
  ANE_GetTensorWidthAndHeightWithBatchFirst(v3, &v8, &v9);
  ANE_GetTensorFeatureChannelsWithBatchFirst(v3, &v10);
  ANE_GetTensorBatchSizeWithBatchFirst(v3, &v11);

  uint64_t v4 = [NSNumber numberWithUnsignedInteger:v11];
  v12[0] = v4;
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:v10];
  v12[1] = v5;
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v9];
  v12[2] = v6;
  id v7 = [NSNumber numberWithUnsignedInteger:v8];
  void v12[3] = v7;
  *a2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
}

__CFString *ANE_GetANECIRDimension(unint64_t a1)
{
  if (a1 < 4) {
    return off_1E6CB4ED8[a1];
  }
  id v2 = +[MLCLog framework];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ANE_GetANECIRDimension_cold_1();
  }

  return 0;
}

__CFString *ANE_GetANECIRDataTypeWithMLCDataType(int a1)
{
  int v1 = a1 - 1;
  if (a1 - 1) < 9 && ((0x1ADu >> v1)) {
    return off_1E6CB4EF8[v1];
  }
  id v2 = +[MLCLog framework];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ANE_GetANECIRDataTypeWithMLCDataType_cold_1();
  }

  return 0;
}

id ANE_FindUnitWithType(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"Type", (void)v13);
        if ([v10 isEqualToString:v3])
        {
          id v11 = v9;

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

BOOL ANE_ValidateInterleave(unint64_t a1, unint64_t a2, int a3)
{
  if (a1)
  {
    uint64_t v4 = 0;
    while (kMLCANEIOInterleaves[v4] != a1)
    {
      if (++v4 == 5)
      {
        if (!a3) {
          return 0;
        }
        uint64_t v5 = +[MLCLog framework];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          ANE_ValidateInterleave_cold_5();
        }
        goto LABEL_25;
      }
    }
    if (a2)
    {
      if (a1 <= a2)
      {
        BOOL result = a2 % a1 == 0;
        if (a2 % a1) {
          BOOL v14 = a3 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14) {
          return result;
        }
        uint64_t v5 = +[MLCLog framework];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          ANE_ValidateInterleave_cold_4();
        }
      }
      else
      {
        if (!a3) {
          return 0;
        }
        uint64_t v5 = +[MLCLog framework];
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          ANE_ValidateInterleave_cold_3();
        }
      }
    }
    else
    {
      if (!a3) {
        return 0;
      }
      uint64_t v5 = +[MLCLog framework];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        ANE_ValidateInterleave_cold_2(v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    goto LABEL_25;
  }
  if (a3)
  {
    uint64_t v5 = +[MLCLog framework];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ANE_ValidateInterleave_cold_1();
    }
LABEL_25:
  }
  return 0;
}

unint64_t ANE_GetANEElementByteCount(uint64_t a1)
{
  if (a1 <= 9)
  {
    if (((1 << a1) & 0x358) != 0)
    {
      uint64_t v1 = a1;
LABEL_4:
      return +[MLCTensorDescriptor elementByteCount:v1];
    }
    if (a1 == 1)
    {
      uint64_t v1 = 3;
      goto LABEL_4;
    }
  }
  id v3 = +[MLCLog framework];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ANE_GetANEElementByteCount_cold_1();
  }

  return 0;
}

unint64_t ANE_CalculateRowStrideForTensor(void *a1, unint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = [v3 descriptor];
  uint64_t v19 = 1;
  unint64_t v17 = 1;
  ANE_GetTensorWidthAndHeightWithOnePrepended(v3, &v19, &v18);
  ANE_GetTensorFeatureChannelsWithOnePrepended(v3, (uint64_t *)&v17);

  unint64_t ANEElementByteCount = ANE_GetANEElementByteCount([v4 dataType]);
  if (!ANEElementByteCount)
  {
    uint64_t v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ANE_CalculateRowStrideForTensor_cold_1();
    }
    goto LABEL_8;
  }
  unint64_t v6 = ANEElementByteCount;
  if (!ANE_ValidateInterleave(a2, v17, 1))
  {
    uint64_t v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ANE_CalculateRowStrideForTensor_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);
    }
LABEL_8:

    unint64_t v7 = 0;
    goto LABEL_9;
  }
  unint64_t v7 = ((v6 * a2 * v19 + 63) / 0x40) << 6;
LABEL_9:

  return v7;
}

uint64_t ANE_CalculatePlaneStrideForTensor(void *a1, unint64_t a2)
{
  id v3 = a1;
  unint64_t v4 = ANE_CalculateRowStrideForTensor(v3, a2);
  if (v4)
  {
    unint64_t v5 = v4;
    uint64_t v9 = 1;
    ANE_GetTensorWidthAndHeightWithOnePrepended(v3, &v10, &v9);
    uint64_t v6 = v9 * v5;
  }
  else
  {
    unint64_t v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ANE_CalculatePlaneStrideForTensor_cold_1();
    }

    uint64_t v6 = 0;
  }

  return v6;
}

unint64_t ANE_CalculatePlaneCountForTensor(void *a1, unint64_t a2)
{
  id v17 = 0;
  ANE_GetTensor4DShapeWithOnePrepended(a1, &v17);
  id v3 = v17;
  unint64_t v4 = [v3 objectAtIndexedSubscript:0];
  uint64_t v5 = [v4 unsignedIntegerValue];

  uint64_t v6 = [v3 objectAtIndexedSubscript:1];

  unint64_t v7 = [v6 unsignedIntegerValue];
  if (ANE_ValidateInterleave(a2, v7, 1)) {
    return (a2 + v7 - 1) / a2 * v5;
  }
  uint64_t v9 = +[MLCLog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    ANE_CalculatePlaneCountForTensor_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  return 0;
}

uint64_t ANE_CalculateIOInterleave(void *a1)
{
  id v1 = a1;
  id v2 = [v1 descriptor];
  uint64_t v15 = 1;
  unint64_t v13 = 1;
  ANE_GetTensorWidthAndHeightWithOnePrepended(v1, &v15, &v14);
  ANE_GetTensorFeatureChannelsWithOnePrepended(v1, (uint64_t *)&v13);
  unint64_t ANEElementByteCount = ANE_GetANEElementByteCount([v2 dataType]);
  if (ANEElementByteCount)
  {
    uint64_t v4 = v15 * ANEElementByteCount;
    uint64_t v5 = 1;
    if (v15 * ANEElementByteCount % 0x40)
    {
      unint64_t v6 = ANE_CalculateRowStrideForTensor(v1, 1uLL) - v4;
      uint64_t v7 = 4u;
      unint64_t v8 = v13;
      do
      {
        unint64_t v9 = kMLCANEIOInterleaves[v7];
        if (ANE_ValidateInterleave(v9, v8, 0))
        {
          unint64_t v10 = ANE_CalculateRowStrideForTensor(v1, v9);
          if (v10 - v4 * v9 < v6)
          {
            uint64_t v5 = v9;
            unint64_t v6 = v10 - v4 * v9;
          }
        }
        --v7;
      }
      while (v7 * 8);
    }
  }
  else
  {
    uint64_t v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      ANE_CalculateIOInterleave_cold_1();
    }

    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t ANE_ConvertInputTensor(void *a1, void *a2, char *a3, uint64_t a4, char *a5, unint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  unint64_t v13 = [v11 descriptor];
  uint64_t v14 = [v13 tensorAllocationSizeInBytes];

  if (v14 == a4)
  {
    if ([v12 count])
    {
      uint64_t v15 = [v11 descriptor];
      v107[0] = 0;
      ANE_GetTensor4DShapeWithOnePrepended(v11, v107);
      id v16 = v107[0];
      id v17 = [v16 objectAtIndexedSubscript:0];
      uint64_t v83 = [v17 unsignedIntegerValue];

      uint64_t v18 = [v16 objectAtIndexedSubscript:1];
      unint64_t v84 = [v18 unsignedIntegerValue];

      uint64_t v19 = [v16 objectAtIndexedSubscript:2];
      uint64_t v96 = [v19 unsignedIntegerValue];

      uint64_t v20 = [v16 objectAtIndexedSubscript:3];
      uint64_t v106 = [v20 unsignedIntegerValue];

      uint64_t v104 = a5;
      switch([v15 dimensionCount])
      {
        case 1:
          goto LABEL_14;
        case 2:
          uint64_t v96 = a6;
          goto LABEL_14;
        case 3:
          unint64_t v84 = a6;
          goto LABEL_14;
        case 4:
          uint64_t v83 = a6;
LABEL_14:
          size_t v30 = +[MLCTensorDescriptor elementByteCount:[v15 dataType]];
          unsigned int v31 = [v15 dataType];
          float v32 = [v12 objectForKeyedSubscript:@"Interleave"];
          unint64_t v105 = [v32 unsignedIntegerValue];

          short float v33 = [v12 objectForKeyedSubscript:@"RowStride"];
          unint64_t v102 = [v33 unsignedIntegerValue];

          uint64_t v34 = [v12 objectForKeyedSubscript:@"PlaneStride"];
          unint64_t v100 = [v34 unsignedIntegerValue];

          uint64_t v29 = [v12 objectForKeyedSubscript:@"Type"];
          uint64_t v35 = ANE_ANECDataTypeToMLCDataType(v29);
          uint64_t v36 = v35;
          if ((v31 & 0xFFFFFFFD) == 1 && v35 == 3
            || v31 <= 9 && ((1 << v31) & 0x250) != 0 && (v35 | 2) == 6)
          {
            if ((v31 | 2) == 6) {
              unsigned int v31 = 9;
            }
            if ((v35 | 2) == 6) {
              uint64_t v36 = 9;
            }
          }
          else
          {
            if (v31 != 8 || v35 != 8)
            {
              int v63 = v29;
              uint64_t v64 = +[MLCLog framework];
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
                ANE_ConvertInputTensor_cold_4();
              }

              uint64_t v28 = 0;
              uint64_t v29 = v63;
              goto LABEL_87;
            }
            unsigned int v31 = 8;
          }
          unint64_t v37 = +[MLCTensorDescriptor elementByteCount:v36];
          unint64_t v38 = v105;
          if (!v105)
          {
            unsigned int v43 = +[MLCLog framework];
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
              ANE_ConvertInputTensor_cold_3();
            }

LABEL_34:
            uint64_t v28 = 0;
            goto LABEL_87;
          }
          unint64_t v39 = v37;
          unint64_t v95 = v102 / v37;
          if (v105 == 1)
          {
            uint64_t v40 = v106;
            unint64_t v41 = v84 * v106 * v96 * v83;
            size_t v42 = v41 * v30;
            if (v36 == v31)
            {
              if (v106 == v95)
              {
                memcpy(v104, a3, v41 * v30);
LABEL_86:
                uint64_t v28 = 1;
                goto LABEL_87;
              }
              if (!v42) {
                goto LABEL_86;
              }
              uint64_t v81 = v29;
              size_t v65 = 0;
              size_t v66 = v30 * v106;
              uint64_t v67 = v104;
              do
              {
                memcpy(v67, &a3[v65], v66);
                v65 += v66;
                v67 += v102;
              }
              while (v65 < v42);
              uint64_t v28 = 1;
LABEL_80:
              uint64_t v29 = v81;
              goto LABEL_87;
            }
            if (v106 == v95)
            {
              +[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:");
              goto LABEL_86;
            }
            if (!v42) {
              goto LABEL_86;
            }
            id v78 = v16;
            uint64_t v80 = v29;
            size_t v68 = 0;
            size_t v69 = v30 * v106;
            BOOL v70 = v104;
            do
            {
              +[MLCDataHelper convertFp32toFp16:v40 fp32Values:&a3[v68] fp16Values:v70];
              uint64_t v40 = v106;
              v68 += v69;
              v70 += v102;
            }
            while (v68 < v42);
            uint64_t v28 = 1;
          }
          else
          {
            unint64_t v94 = v100 / v37;
            BOOL v44 = v36 == v31;
            id v45 = a3;
            uint64_t v46 = v106;
            if (!v44)
            {
              if (!v83) {
                goto LABEL_86;
              }
              id v79 = v16;
              uint64_t v81 = v29;
              id v75 = v12;
              id v77 = v11;
              id v73 = v15;
              uint64_t v55 = v84 / v105;
              if (v84 / v105 <= 1) {
                uint64_t v55 = 1;
              }
              uint64_t v87 = 0;
              uint64_t v89 = v55;
              do
              {
                uint64_t v86 = v45;
                if (v38 <= v84)
                {
                  uint64_t v93 = 0;
                  id v91 = v45;
                  do
                  {
                    if (v96)
                    {
                      uint64_t v101 = 0;
                      uint64_t v99 = v91;
                      do
                      {
                        if (v46)
                        {
                          uint64_t v56 = 0;
                          uint64_t v57 = v99;
                          unint64_t v58 = (v87 * v84 / v38 + v93) * v94;
                          do
                          {
                            uint64_t v59 = 0;
                            unint64_t v60 = v101 * v95 + v56 * v38;
                            uint64_t v61 = v57;
                            unint64_t v62 = v38;
                            do
                            {
                              +[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:", 1, v61, &v104[2 * v60 + 2 * v59++ + 2 * v58], v73, v75, v77);
                              v61 += 4 * v106 * v96;
                              --v62;
                            }
                            while (v62);
                            ++v56;
                            v57 += 4;
                            unint64_t v38 = v105;
                            uint64_t v46 = v106;
                          }
                          while (v56 != v106);
                        }
                        v99 += 4 * v106;
                        ++v101;
                      }
                      while (v101 != v96);
                    }
                    v91 += 4 * v106 * v96 * v105;
                    ++v93;
                  }
                  while (v93 != v89);
                }
                id v45 = &v86[4 * v106 * v96 * v84];
                ++v87;
              }
              while (v87 != v83);
              uint64_t v28 = 1;
              uint64_t v15 = v73;
              id v12 = v75;
              id v11 = v77;
              id v16 = v79;
              goto LABEL_80;
            }
            if (!v83) {
              goto LABEL_86;
            }
            id v78 = v16;
            uint64_t v80 = v29;
            id v72 = v15;
            id v74 = v12;
            id v76 = v11;
            uint64_t v47 = v84 / v105;
            if (v84 / v105 <= 1) {
              uint64_t v47 = 1;
            }
            uint64_t v88 = v47;
            size_t v48 = v30 * v106 * v96;
            for (uint64_t i = 0; i != v83; ++i)
            {
              id v85 = v45;
              if (v38 <= v84)
              {
                uint64_t v92 = 0;
                id v90 = v45;
                do
                {
                  if (v96)
                  {
                    uint64_t v98 = 0;
                    __src = v90;
                    do
                    {
                      if (v46)
                      {
                        uint64_t v49 = 0;
                        unint64_t v50 = (i * v84 / v38 + v92) * v94;
                        uint64_t v51 = __src;
                        do
                        {
                          uint64_t v52 = 0;
                          unint64_t v53 = v98 * v95 + v49 * v38;
                          uint64_t v103 = v51;
                          unint64_t v54 = v38;
                          do
                          {
                            memcpy(&v104[(v53 + v52++ + v50) * v39], v51, v30);
                            v51 += v48;
                            --v54;
                          }
                          while (v54);
                          ++v49;
                          uint64_t v51 = &v103[v30];
                          unint64_t v38 = v105;
                          uint64_t v46 = v106;
                        }
                        while (v49 != v106);
                      }
                      __src += v30 * v106;
                      ++v98;
                    }
                    while (v98 != v96);
                  }
                  v90 += v48 * v105;
                  ++v92;
                }
                while (v92 != v88);
              }
              id v45 = &v85[v48 * v84];
            }
            uint64_t v28 = 1;
            id v12 = v74;
            id v11 = v76;
            uint64_t v15 = v72;
          }
          id v16 = v78;
          uint64_t v29 = v80;
LABEL_87:

          goto LABEL_88;
        default:
          uint64_t v29 = +[MLCLog framework];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            ANE_ConvertInputTensor_cold_2(v15);
          }
          goto LABEL_34;
      }
    }
    uint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      ANE_ConvertInputTensor_cold_1(v15, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  else
  {
    uint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      ANE_ConvertInputTensor_cold_5(v11);
    }
  }
  uint64_t v28 = 0;
LABEL_88:

  return v28;
}

uint64_t ANE_ANECDataTypeToMLCDataType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"UInt8"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"Int8"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"Float16"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    id v3 = +[MLCLog framework];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      ANE_ANECDataTypeToMLCDataType_cold_1();
    }

    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t ANE_ReadOutputTensor(void *a1, void *a2, uint64_t a3, char *a4, unint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = [v9 deviceMemory];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    uint64_t v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      ANE_ReadOutputTensor_cold_1();
    }
    goto LABEL_15;
  }
  if ([v9 deviceIndex] != a3)
  {
    uint64_t v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      ANE_ReadOutputTensor_cold_8(v9);
    }
    goto LABEL_15;
  }
  unint64_t v13 = [v9 deviceMemory];
  uint64_t v14 = [v13 objectAtIndexedSubscript:a3];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      ANE_ReadOutputTensor_cold_7(v19, v28, v29, v30, v31, v32, v33, v34);
    }
    goto LABEL_15;
  }
  if (![v10 count])
  {
    uint64_t v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      ANE_ReadOutputTensor_cold_2(v19, v35, v36, v37, v38, v39, v40, v41);
    }
LABEL_15:
    uint64_t v42 = 0;
    goto LABEL_16;
  }
  __dst = a4;
  id v16 = [v10 objectForKeyedSubscript:@"Interleave"];
  unint64_t v108 = [v16 unsignedIntegerValue];

  id v17 = [v10 objectForKeyedSubscript:@"RowStride"];
  unint64_t v107 = [v17 unsignedIntegerValue];

  uint64_t v18 = [v10 objectForKeyedSubscript:@"PlaneStride"];
  unint64_t v102 = [v18 unsignedIntegerValue];

  uint64_t v19 = [v10 objectForKeyedSubscript:@"Type"];
  int v20 = ANE_ANECDataTypeToMLCDataType(v19);
  size_t v21 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:");
  uint64_t v22 = [v9 descriptor];
  v110[0] = 0;
  ANE_GetTensor4DShapeWithOnePrepended(v9, v110);
  id v23 = v110[0];
  uint64_t v24 = [v23 objectAtIndexedSubscript:0];
  uint64_t v87 = [v24 unsignedIntegerValue];

  uint64_t v25 = [v23 objectAtIndexedSubscript:1];
  unint64_t v88 = [v25 unsignedIntegerValue];

  uint64_t v26 = [v23 objectAtIndexedSubscript:2];
  uint64_t v99 = [v26 unsignedIntegerValue];

  uint64_t v27 = [v23 objectAtIndexedSubscript:3];
  uint64_t v109 = [v27 unsignedIntegerValue];

  id v85 = v23;
  switch([v22 dimensionCount])
  {
    case 1:
      goto LABEL_21;
    case 2:
      uint64_t v99 = a5;
      goto LABEL_21;
    case 3:
      unint64_t v88 = a5;
      goto LABEL_21;
    case 4:
      uint64_t v87 = a5;
LABEL_21:
      unint64_t v105 = +[MLCTensorDescriptor elementByteCount:](MLCTensorDescriptor, "elementByteCount:", [v22 dataType]);
      unsigned int v45 = [v22 dataType];
      if (v20 == 3 && (v45 & 0xFFFFFFFD) == 1)
      {
        unint64_t v84 = v22;
        int v46 = 3;
        goto LABEL_28;
      }
      if (v45 <= 9 && ((1 << v45) & 0x250) != 0 && (v20 | 2) == 6)
      {
        unint64_t v84 = v22;
        int v46 = 9;
LABEL_28:
        int v100 = v46;
        if ((v45 | 2) == 6) {
          int v47 = 9;
        }
        else {
          int v47 = v45;
        }
LABEL_34:
        size_t v48 = [v9 deviceMemory];
        uint64_t v49 = [v48 objectAtIndexedSubscript:a3];
        unint64_t v50 = [v49 ioSurfaceObject];
        uint64_t v51 = (__IOSurface *)[v50 ioSurface];

        if (v51)
        {
          IOSurfaceLock(v51, 0, 0);
          BaseAddress = (char *)IOSurfaceGetBaseAddress(v51);
          unint64_t v53 = v108;
          if (v108)
          {
            unint64_t v54 = BaseAddress;
            unint64_t v98 = v107 / v21;
            if (v108 == 1)
            {
              uint64_t v55 = v109;
              unint64_t v56 = v87 * v109 * v88 * v99;
              unint64_t v57 = v105 * v56;
              if (v100 == v47)
              {
                if (v98 == v109)
                {
                  memcpy(__dst, BaseAddress, v105 * v56);
                }
                else if (v57)
                {
                  unint64_t v77 = 0;
                  size_t v78 = v105 * v109;
                  do
                  {
                    memcpy(&__dst[v77], v54, v78);
                    v77 += v78;
                    v54 += v107;
                  }
                  while (v77 < v57);
                }
              }
              else if (v98 == v109)
              {
                +[MLCDataHelper convertFp16toFp32:fp16Values:fp32Values:](MLCDataHelper, "convertFp16toFp32:fp16Values:fp32Values:");
              }
              else if (v57)
              {
                unint64_t v79 = 0;
                do
                {
                  +[MLCDataHelper convertFp16toFp32:v55 fp16Values:v54 fp32Values:&__dst[v79]];
                  uint64_t v55 = v109;
                  v79 += v105 * v109;
                  v54 += v107;
                }
                while (v79 < v57);
              }
              IOSurfaceUnlock(v51, 0, 0);
              uint64_t v42 = 1;
            }
            else
            {
              buffer = v51;
              uint64_t v81 = v19;
              id v82 = v10;
              id v83 = v9;
              unint64_t v97 = v102 / v21;
              uint64_t v60 = v109;
              if (v100 == v47)
              {
                if (v87)
                {
                  uint64_t v86 = 0;
                  uint64_t v61 = v88 / v108;
                  if (v88 / v108 <= 1) {
                    uint64_t v61 = 1;
                  }
                  uint64_t v91 = v61;
                  do
                  {
                    if (v53 <= v88)
                    {
                      uint64_t v95 = 0;
                      uint64_t v93 = __dst;
                      do
                      {
                        if (v99)
                        {
                          uint64_t v103 = 0;
                          uint64_t v101 = v93;
                          do
                          {
                            if (v60)
                            {
                              uint64_t v62 = 0;
                              int v63 = v101;
                              unint64_t v64 = (v86 * v88 / v53 + v95) * v97;
                              do
                              {
                                uint64_t v65 = 0;
                                unint64_t v66 = v103 * v98 + v62 * v53;
                                uint64_t v67 = v63;
                                unint64_t v68 = v53;
                                do
                                {
                                  memcpy(v67, &v54[(v66 + v65++ + v64) * v21], v21);
                                  v67 += v105 * v109 * v99;
                                  --v68;
                                }
                                while (v68);
                                ++v62;
                                v63 += v105;
                                unint64_t v53 = v108;
                                uint64_t v60 = v109;
                              }
                              while (v62 != v109);
                            }
                            v101 += v105 * v109;
                            ++v103;
                          }
                          while (v103 != v99);
                        }
                        v93 += v105 * v109 * v99 * v108;
                        ++v95;
                      }
                      while (v95 != v91);
                    }
                    __dst += v105 * v109 * v99 * v88;
                    ++v86;
                  }
                  while (v86 != v87);
                }
              }
              else if (v87)
              {
                uint64_t v69 = v88 / v108;
                if (v88 / v108 <= 1) {
                  uint64_t v69 = 1;
                }
                uint64_t v90 = 0;
                uint64_t v92 = v69;
                do
                {
                  if (v53 <= v88)
                  {
                    uint64_t v96 = 0;
                    unint64_t v94 = __dst;
                    do
                    {
                      if (v99)
                      {
                        uint64_t v106 = 0;
                        uint64_t v104 = v94;
                        do
                        {
                          if (v60)
                          {
                            uint64_t v70 = 0;
                            id v71 = v104;
                            unint64_t v72 = (v90 * v88 / v53 + v96) * v97;
                            do
                            {
                              uint64_t v73 = 0;
                              unint64_t v74 = v106 * v98 + v70 * v53;
                              id v75 = v71;
                              unint64_t v76 = v53;
                              do
                              {
                                +[MLCDataHelper convertFp16toFp32:fp16Values:fp32Values:](MLCDataHelper, "convertFp16toFp32:fp16Values:fp32Values:", 1, &v54[2 * v74 + 2 * v73++ + 2 * v72], v75, buffer);
                                v75 += 4 * v109 * v99;
                                --v76;
                              }
                              while (v76);
                              ++v70;
                              v71 += 4;
                              unint64_t v53 = v108;
                              uint64_t v60 = v109;
                            }
                            while (v70 != v109);
                          }
                          v104 += 4 * v109;
                          ++v106;
                        }
                        while (v106 != v99);
                      }
                      v94 += 4 * v109 * v99 * v108;
                      ++v96;
                    }
                    while (v96 != v92);
                  }
                  __dst += 4 * v109 * v99 * v88;
                  ++v90;
                }
                while (v90 != v87);
              }
              IOSurfaceUnlock(buffer, 0, 0);
              uint64_t v42 = 1;
              id v10 = v82;
              id v9 = v83;
              uint64_t v19 = v81;
            }
            goto LABEL_95;
          }
          uint64_t v59 = +[MLCLog framework];
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            ANE_ReadOutputTensor_cold_5();
          }

          IOSurfaceUnlock(v51, 0, 0);
        }
        else
        {
          unint64_t v58 = +[MLCLog framework];
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            ANE_ReadOutputTensor_cold_4();
          }
        }
        uint64_t v42 = 0;
LABEL_95:
        uint64_t v22 = v84;
        goto LABEL_96;
      }
      if (v20 == 8 && v45 == 8)
      {
        unint64_t v84 = v22;
        int v100 = 8;
        int v47 = 8;
        goto LABEL_34;
      }
      BOOL v44 = +[MLCLog framework];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        ANE_ReadOutputTensor_cold_6();
      }
LABEL_67:

      uint64_t v42 = 0;
LABEL_96:

      break;
    default:
      BOOL v44 = +[MLCLog framework];
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        ANE_ReadOutputTensor_cold_3(v22);
      }
      goto LABEL_67;
  }
LABEL_16:

  return v42;
}

id ANE_GetDeviceMemoryData(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 deviceMemory];
  uint64_t v3 = [v1 deviceIndex];

  uint64_t v4 = [v2 objectAtIndexedSubscript:v3];

  return v4;
}

uint64_t ANE_CanProgramANECConstantTensorUnit(void *a1)
{
  id v1 = a1;
  unsigned int v2 = [v1 computeFlags];
  uint64_t v4 = 1;
  ANE_GetTensorBatchSizeWithOnePrepended(v1, &v4);

  return (v4 == 1) & (v2 >> 1);
}

BOOL ANE_IsPaddingLayerAndNotCompiledForANE(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  BOOL v2 = (objc_opt_isKindOfClass() & 1) != 0 && !ANE_IsAneCompiledLayer(v1);

  return v2;
}

BOOL ANE_IsAneCompiledLayer(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 device];
  if (v2)
  {
    uint64_t v3 = [v1 device];
    BOOL v4 = [v3 type] == 3;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void ANE_ApplyPaddingSizes(void *a1, void *a2)
{
  id v23 = a2;
  id v3 = a1;
  BOOL v4 = [v23 objectForKeyedSubscript:@"Params"];
  uint64_t v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [v3 paddingTop];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"PadTop"];
  uint64_t v8 = [v7 unsignedIntegerValue] + v6;

  uint64_t v9 = [v3 paddingBottom];
  id v10 = [v5 objectForKeyedSubscript:@"PadBot"];
  uint64_t v11 = [v10 unsignedIntegerValue] + v9;

  uint64_t v12 = [v3 paddingLeft];
  unint64_t v13 = [v5 objectForKeyedSubscript:@"PadLeft"];
  uint64_t v14 = [v13 unsignedIntegerValue] + v12;

  uint64_t v15 = [v3 paddingRight];
  id v16 = [v5 objectForKeyedSubscript:@"PadRight"];
  uint64_t v17 = [v16 unsignedIntegerValue] + v15;

  uint64_t v18 = [NSNumber numberWithUnsignedInteger:v8];
  [v5 setObject:v18 forKeyedSubscript:@"PadTop"];

  uint64_t v19 = [NSNumber numberWithUnsignedInteger:v11];
  [v5 setObject:v19 forKeyedSubscript:@"PadBot"];

  int v20 = [NSNumber numberWithUnsignedInteger:v14];
  [v5 setObject:v20 forKeyedSubscript:@"PadLeft"];

  size_t v21 = [NSNumber numberWithUnsignedInteger:v17];
  [v5 setObject:v21 forKeyedSubscript:@"PadRight"];

  uint64_t v22 = [v5 objectForKeyedSubscript:@"PaddingMode"];
  if ([v22 isEqualToString:@"Negative"]) {
    [v5 setObject:@"Zero" forKeyedSubscript:@"PaddingMode"];
  }
  [v23 setObject:v5 forKeyedSubscript:@"Params"];
}

id ANE_ComputeLiveOutputs(void *a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  BOOL v2 = [MEMORY[0x1E4F1CA80] set];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v3 = v1;
  uint64_t v22 = [v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v3);
        }
        uint64_t v23 = v4;
        uint64_t v5 = *(void **)(*((void *)&v34 + 1) + 8 * v4);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v6 = [v5 resultTensors];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v31;
          uint64_t v24 = v6;
          uint64_t v25 = v5;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v31 != v9) {
                objc_enumerationMutation(v6);
              }
              uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
              uint64_t v12 = [v11 childLayers];
              if (![v12 count] || (objc_msgSend(v5, "isDebuggingEnabled") & 1) != 0)
              {
LABEL_24:

LABEL_25:
                [v2 addObject:v11];
                goto LABEL_26;
              }
              char v13 = [v11 computeFlags];

              if (v13) {
                goto LABEL_25;
              }
              long long v28 = 0u;
              long long v29 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              uint64_t v12 = [v11 childLayers];
              uint64_t v14 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v27;
                while (2)
                {
                  for (uint64_t i = 0; i != v15; ++i)
                  {
                    if (*(void *)v27 != v16) {
                      objc_enumerationMutation(v12);
                    }
                    if (![v3 containsObject:*(void *)(*((void *)&v26 + 1) + 8 * i)])
                    {
                      uint64_t v6 = v24;
                      uint64_t v5 = v25;
                      goto LABEL_24;
                    }
                  }
                  uint64_t v15 = [v12 countByEnumeratingWithState:&v26 objects:v38 count:16];
                  if (v15) {
                    continue;
                  }
                  break;
                }

                uint64_t v6 = v24;
                uint64_t v5 = v25;
              }
              else
              {
              }
LABEL_26:
              ++v10;
            }
            while (v10 != v8);
            uint64_t v18 = [v6 countByEnumeratingWithState:&v30 objects:v39 count:16];
            uint64_t v8 = v18;
          }
          while (v18);
        }

        uint64_t v4 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [v3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v22);
  }

  uint64_t v19 = (void *)[v2 copy];

  return v19;
}

id ANE_ComputeLiveInputs(void *a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  BOOL v2 = [MEMORY[0x1E4F1CA80] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = v1;
  uint64_t v26 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v26)
  {
    uint64_t v4 = *(void *)v33;
    uint64_t v25 = *(void *)v33;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v33 != v4) {
          objc_enumerationMutation(v3);
        }
        uint64_t v27 = v5;
        uint64_t v6 = *(void **)(*((void *)&v32 + 1) + 8 * v5);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v7 = [v6 sourceTensors];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              char v13 = [v12 parentLayers];
              unint64_t v14 = [v13 count];

              if (v14 >= 2)
              {
                uint64_t v23 = +[MLCLog framework];
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
                  ANE_ComputeLiveInputs_cold_1(v12);
                }

                uint64_t v22 = [MEMORY[0x1E4F1CAD0] set];

                goto LABEL_24;
              }
              uint64_t v15 = [v12 parentLayers];
              uint64_t v16 = [v15 count];

              if (v16)
              {
                uint64_t v17 = [v12 parentLayers];
                uint64_t v18 = [v17 objectAtIndexedSubscript:0];
                char v19 = [v3 containsObject:v18];

                if (v19) {
                  continue;
                }
              }
              id v20 = v12;
              if (v20)
              {
                uint64_t v21 = v20;
                [v2 addObject:v20];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }

        uint64_t v5 = v27 + 1;
        uint64_t v4 = v25;
      }
      while (v27 + 1 != v26);
      uint64_t v26 = [v3 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v26);
  }

  uint64_t v22 = (void *)[v2 copy];
LABEL_24:

  return v22;
}

uint64_t ANE_WriteANEModelFiles(void *a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  LODWORD(a2) = arc4random();
  uint64_t v5 = NSString;
  uint64_t v6 = +[MLCStrings tempDirectoryForANEModels];
  uint64_t v7 = [v5 stringWithFormat:@"%@%@-%lu/", v6, @"net", a2];

  uint64_t v8 = [v7 stringByAppendingPathComponent:@"net.plist"];
  uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v37 = 0;
  if ([v9 fileExistsAtPath:v7 isDirectory:&v37])
  {
    if (!v37)
    {
      uint64_t v10 = +[MLCLog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        ANE_WriteANEModelFiles_cold_1((uint64_t)v7, &v37, v10);
      }
LABEL_20:

      ANE_DeleteANEModelDirectory(v7);
LABEL_24:
      uint64_t v25 = 0;
      goto LABEL_29;
    }
  }
  else
  {
    id v36 = 0;
    char v11 = [v9 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v12 = v36;
    char v13 = v12;
    if ((v11 & 1) == 0)
    {
      uint64_t v26 = +[MLCLog framework];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        ANE_WriteANEModelFiles_cold_4();
      }

      goto LABEL_24;
    }
  }
  if (([v3 writeToFile:v8 atomically:1] & 1) == 0)
  {
    uint64_t v10 = +[MLCLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ANE_WriteANEModelFiles_cold_3();
    }
    goto LABEL_20;
  }
  long long v29 = v9;
  long long v30 = v8;
  id v31 = v3;
  [v4 allKeys];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  unint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        char v19 = [v4 objectForKeyedSubscript:*(void *)(*((void *)&v32 + 1) + 8 * i)];
        id v20 = [v19 allKeys];
        uint64_t v21 = [v20 firstObject];

        uint64_t v22 = [v7 stringByAppendingPathComponent:v21];
        uint64_t v23 = [v19 objectForKeyedSubscript:v21];
        if (([v23 writeToFile:v22 atomically:1] & 1) == 0)
        {
          uint64_t v27 = +[MLCLog framework];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            ANE_WriteANEModelFiles_cold_2();
          }

          ANE_DeleteANEModelDirectory(v7);
          uint64_t v25 = 0;
          uint64_t v24 = v14;
          goto LABEL_28;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v42 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  uint64_t v24 = +[MLCLog framework];
  uint64_t v25 = 1;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint8_t buf = 136315394;
    uint64_t v39 = "ANE_WriteANEModelFiles";
    __int16 v40 = 2112;
    uint64_t v41 = v7;
    _os_log_impl(&dword_1DD0C9000, v24, OS_LOG_TYPE_INFO, "%s: wrote ANE Model to directory = %@", buf, 0x16u);
  }
LABEL_28:
  uint64_t v8 = v30;
  id v3 = v31;
  uint64_t v9 = v29;

LABEL_29:
  return v25;
}

void ANE_DeleteANEModelDirectory(void *a1)
{
  id v1 = a1;
  BOOL v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v2 fileExistsAtPath:v1])
  {
    id v6 = 0;
    char v3 = [v2 removeItemAtPath:v1 error:&v6];
    id v4 = v6;
    if ((v3 & 1) == 0)
    {
      uint64_t v5 = +[MLCLog framework];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        ANE_DeleteANEModelDirectory_cold_1();
      }
    }
  }
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

id CPU_CreateOptimizerDeviceDataForTensor(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = +[MLCTensorOptimizerDeviceData optimizerDeviceData];
  uint64_t v7 = [v4 descriptor];
  uint64_t v8 = [v7 shape];
  uint64_t v9 = [v4 descriptor];
  uint64_t v10 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v8, 0, [v9 dataType], 0);
  [v6 setSourceBNNSDesc:v10];

  char v11 = [v4 descriptor];
  id v12 = [v11 shape];
  char v13 = [v4 descriptor];
  unint64_t v14 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v12, 0, [v13 dataType], 0);
  [v6 setGradientBNNSDesc:v14];

  uint64_t v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v6 setMomentumData:v15];

  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v17 = [v4 descriptor];
    uint64_t v18 = [v17 shape];
    char v19 = [v4 descriptor];
    id v20 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v18, 0, [v19 dataType], 0);
    uint64_t v21 = [v6 momentumData];
    [v21 setObject:v20 atIndexedSubscript:i];
  }
  uint64_t v22 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v6 setMomentumDataBytes:v22];

  if ([v5 count])
  {
    unint64_t v23 = 0;
    do
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v25 = [v5 objectAtIndexedSubscript:v23];
      uint64_t v26 = [v25 bytes];
      uint64_t v27 = [v5 objectAtIndexedSubscript:v23];
      long long v28 = objc_msgSend(v24, "dataWithBytesNoCopy:length:freeWhenDone:", v26, objc_msgSend(v27, "length"), 0);
      long long v29 = [v6 momentumDataBytes];
      [v29 setObject:v28 atIndexedSubscript:v23];

      long long v30 = [v6 momentumData];
      id v31 = [v30 objectAtIndexedSubscript:v23];

      id v32 = v31;
      uint64_t v33 = [v32 bytes];
      long long v34 = [v5 objectAtIndexedSubscript:v23];
      *(void *)(v33 + 136) = [v34 bytes];

      ++v23;
    }
    while (v23 < [v5 count]);
  }
  long long v35 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  [v35 addObject:v6];
  id v36 = (void *)[v35 copy];

  return v36;
}

void OUTLINED_FUNCTION_0_7(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void *saveOrRestoreLSTMWeightsAndAccumulatorsHelper(uint64_t a1, uint64_t a2, void *__src, size_t __n, int a5)
{
  uint64_t v5 = (void *)(a1 + 4 * a2);
  if (a5)
  {
    id v6 = __src;
  }
  else
  {
    id v6 = v5;
    uint64_t v5 = __src;
  }
  return memcpy(v6, v5, __n);
}

unint64_t *hashCombine_8(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  id v12 = &a9;
  unint64_t v9 = *result;
  uint64_t v10 = 14;
  do
  {
    char v11 = v12;
    v12 += 8;
    v9 ^= *(void *)v11 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    --v10;
  }
  while (v10);
  *BOOL result = v9;
  return result;
}

id CPU_CreateSGDOptimizer(float a1, uint64_t a2, int a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v8 = malloc_type_calloc(0x30uLL, 1uLL, 0xA2D08676uLL);
  v8[7] = 0;
  if ([v6 appliesGradientClipping])
  {
    unsigned int v9 = [v6 gradientClippingType];
    if (v9 >= 3)
    {
      uint64_t v21 = +[MLCLog framework];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        CPU_CreateSGDOptimizer_cold_2(v6);
      }
      goto LABEL_14;
    }
    v8[7] = v9 + 1;
  }
  [v6 gradientClipMin];
  v8[8] = v10;
  [v6 gradientClipMax];
  v8[9] = v11;
  [v6 maximumClippingNorm];
  v8[10] = v12;
  [v6 customGlobalNorm];
  v8[11] = v13;
  *((unsigned char *)v8 + 16) = a3;
  unsigned int v14 = [v6 regularizationType];
  if (v14 >= 3)
  {
    uint64_t v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      CPU_CreateSGDOptimizer_cold_1(v6);
    }
LABEL_14:

    id v20 = (void *)[v7 copy];
    goto LABEL_15;
  }
  void v8[5] = v14;
  [v6 learningRate];
  _DWORD *v8 = v15;
  *((float *)v8 + 1) = a1;
  [v6 gradientRescale];
  v8[2] = v16;
  [v6 regularizationScale];
  v8[3] = v17;
  if (a3) {
    v8[6] = 1;
  }
  uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:48];
  char v19 = +[MLCDeviceOptimizer deviceOptimizerWithFunction:7 optimizerAlgFields:v18 accumulatorBufferCount:1];
  if (v19) {
    [v7 addObject:v19];
  }
  free(v8);
  id v20 = (void *)[v7 copy];

LABEL_15:

  return v20;
}

id CPU_CreateAdamOptimizer(float a1, float a2, float a3, uint64_t a4, int a5, unint64_t a6, int a7, void *a8)
{
  id v14 = a8;
  int v15 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  int v16 = (float *)malloc_type_calloc(0x34uLL, 1uLL, 0xD286C853uLL);
  v16[8] = 0.0;
  if ([v14 appliesGradientClipping])
  {
    unsigned int v17 = [v14 gradientClippingType];
    if (v17 >= 3)
    {
      uint64_t v33 = +[MLCLog framework];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        CPU_CreateAdamOptimizer_cold_2(v14);
      }
      goto LABEL_24;
    }
    *((_DWORD *)v16 + 8) = v17 + 1;
  }
  [v14 gradientClipMin];
  *((_DWORD *)v16 + 9) = v18;
  [v14 gradientClipMax];
  *((_DWORD *)v16 + 10) = v19;
  [v14 maximumClippingNorm];
  *((_DWORD *)v16 + 11) = v20;
  [v14 customGlobalNorm];
  *((_DWORD *)v16 + 12) = v21;
  unsigned int v22 = [v14 regularizationType];
  if (v22 >= 3)
  {
    uint64_t v33 = +[MLCLog framework];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      CPU_CreateAdamOptimizer_cold_1(v14);
    }
LABEL_24:

    id v32 = (void *)[v15 copy];
    goto LABEL_25;
  }
  *((_DWORD *)v16 + 7) = v22;
  [v14 learningRate];
  *(_DWORD *)int v16 = v23;
  v16[1] = a1;
  v16[2] = a2;
  v16[3] = (float)a6;
  v16[4] = a3;
  [v14 gradientRescale];
  *((_DWORD *)v16 + 5) = v24;
  [v14 regularizationScale];
  *((_DWORD *)v16 + 6) = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v16 length:52];
  if (a5) {
    unsigned int v27 = 12;
  }
  else {
    unsigned int v27 = 10;
  }
  if (a5) {
    unsigned int v28 = 11;
  }
  else {
    unsigned int v28 = 8;
  }
  if (a5) {
    uint64_t v29 = 3;
  }
  else {
    uint64_t v29 = 2;
  }
  if (a7) {
    uint64_t v30 = v27;
  }
  else {
    uint64_t v30 = v28;
  }
  id v31 = +[MLCDeviceOptimizer deviceOptimizerWithFunction:v30 optimizerAlgFields:v26 accumulatorBufferCount:v29];
  if (v31) {
    [v15 addObject:v31];
  }
  free(v16);
  id v32 = (void *)[v15 copy];

LABEL_25:

  return v32;
}

id CPU_CreateRMSPropOptimizer(float a1, float a2, float a3, uint64_t a4, int a5, void *a6)
{
  id v10 = a6;
  int v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  int v12 = (float *)malloc_type_calloc(0x34uLL, 1uLL, 0xA5A980CCuLL);
  v12[8] = 0.0;
  if ([v10 appliesGradientClipping])
  {
    unsigned int v13 = [v10 gradientClippingType];
    if (v13 >= 3)
    {
      unsigned int v27 = +[MLCLog framework];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        CPU_CreateRMSPropOptimizer_cold_2(v10);
      }
      goto LABEL_17;
    }
    *((_DWORD *)v12 + 8) = v13 + 1;
  }
  [v10 gradientClipMin];
  *((_DWORD *)v12 + 9) = v14;
  [v10 gradientClipMax];
  *((_DWORD *)v12 + 10) = v15;
  [v10 maximumClippingNorm];
  *((_DWORD *)v12 + 11) = v16;
  [v10 customGlobalNorm];
  *((_DWORD *)v12 + 12) = v17;
  unsigned int v18 = [v10 regularizationType];
  if (v18 >= 3)
  {
    unsigned int v27 = +[MLCLog framework];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      CPU_CreateRMSPropOptimizer_cold_1(v10);
    }
LABEL_17:

    uint64_t v26 = (void *)[v11 copy];
    goto LABEL_18;
  }
  *((_DWORD *)v12 + 7) = v18;
  [v10 learningRate];
  *(_DWORD *)int v12 = v19;
  v12[1] = a2;
  v12[2] = a3;
  *((unsigned char *)v12 + 12) = a5;
  v12[4] = a1;
  [v10 gradientRescale];
  *((_DWORD *)v12 + 5) = v20;
  [v10 regularizationScale];
  *((_DWORD *)v12 + 6) = v21;
  uint64_t v22 = 1;
  if (a5) {
    uint64_t v22 = 2;
  }
  if (a1 == 0.0) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = v22 + 1;
  }
  int v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:52];
  int v25 = +[MLCDeviceOptimizer deviceOptimizerWithFunction:9 optimizerAlgFields:v24 accumulatorBufferCount:v23];
  if (v25) {
    [v11 addObject:v25];
  }
  free(v12);
  uint64_t v26 = (void *)[v11 copy];

LABEL_18:

  return v26;
}

id CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(void *a1, void *a2, int a3, int a4)
{
  memset(v7, 0, sizeof(v7));
  int v4 = CPU_BuildBNNSNDArrayDescriptor((uint64_t)v7, a1, 0, a2, a3, 1, a4);
  uint64_t v5 = 0;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v7 length:176];
  }

  return v5;
}

uint64_t CPU_BuildBNNSNormalizationParams(unsigned int a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, float a8, float a9)
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  if (v20)
  {
    uint64_t v22 = [v20 data];
    uint64_t v23 = [v20 descriptor];
    int v24 = CPU_BuildBNNSNDArrayDescriptor(a2 + 352, v17, 0, v22, [v23 dataType], 1, a1 == 2);

    if (!v24) {
      goto LABEL_11;
    }
  }
  if (v21
    && ([v21 data],
        int v25 = objc_claimAutoreleasedReturnValue(),
        [v21 descriptor],
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        int v27 = CPU_BuildBNNSNDArrayDescriptor(a2 + 528, v17, 0, v25, [v26 dataType], 1, a1 == 2),
        v26,
        v25,
        !v27))
  {
LABEL_11:
    uint64_t v31 = 0;
  }
  else
  {
    if (a1 > 1) {
      goto LABEL_10;
    }
    if (!v18) {
      goto LABEL_15;
    }
    unsigned int v28 = [v18 data];
    uint64_t v29 = [v18 descriptor];
    int v30 = CPU_BuildBNNSNDArrayDescriptor(a2 + 704, v17, 0, v28, [v29 dataType], 1, 0);

    uint64_t v31 = 0;
    if (v30)
    {
LABEL_15:
      if (!v19) {
        goto LABEL_10;
      }
      id v32 = [v19 data];
      uint64_t v33 = [v19 descriptor];
      int v34 = CPU_BuildBNNSNDArrayDescriptor(a2 + 880, v17, 0, v32, [v33 dataType], 1, 0);

      uint64_t v31 = 0;
      if (v34)
      {
LABEL_10:
        *(float *)(a2 + 1056) = a9;
        *(float *)(a2 + 1060) = a8;
        uint64_t v31 = 1;
      }
    }
  }

  return v31;
}

uint64_t CPU_BuildBNNSNormalizationInputOutputParams(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = a2;
  id v8 = a3;
  unsigned int v9 = [v7 objectAtIndexedSubscript:0];
  id v10 = [v9 descriptor];
  int v11 = [v10 shape];
  int v12 = (void *)[v11 mutableCopy];

  unsigned int v13 = [v7 objectAtIndexedSubscript:0];
  int v14 = [v13 descriptor];
  int v15 = [v14 stride];
  int v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = [v12 count];
  if (a4 == 2)
  {
    if (v17 != 4)
    {
      unint64_t v18 = 0;
      do
      {
        [v12 insertObject:&unk_1F3876BD0 atIndex:1];
        id v19 = [v16 objectAtIndexedSubscript:0];
        [v16 insertObject:v19 atIndex:1];

        ++v18;
      }
      while (v18 < 4 - [v12 count]);
    }
  }
  else if (v17 == 2)
  {
    [v12 insertObject:&unk_1F3876BD0 atIndex:2];
    id v20 = [v16 objectAtIndexedSubscript:1];
    [v16 insertObject:v20 atIndex:2];
  }
  id v21 = [v7 objectAtIndexedSubscript:0];
  uint64_t v22 = [v21 descriptor];
  int v23 = CPU_BuildBNNSNDArrayDescriptor(a1, v12, v16, 0, [v22 dataType], 1, 0);

  if (v23)
  {
    int v24 = [v8 descriptor];
    int v25 = [v24 shape];
    uint64_t v26 = (void *)[v25 mutableCopy];

    int v27 = [v8 descriptor];
    unsigned int v28 = [v27 stride];
    uint64_t v29 = (void *)[v28 mutableCopy];

    uint64_t v30 = [v26 count];
    if (a4 == 2)
    {
      if (v30 != 4)
      {
        unint64_t v31 = 0;
        do
        {
          [v26 insertObject:&unk_1F3876BD0 atIndex:1];
          id v32 = [v29 objectAtIndexedSubscript:0];
          [v29 insertObject:v32 atIndex:1];

          ++v31;
        }
        while (v31 < 4 - [v26 count]);
      }
    }
    else if (v30 == 2)
    {
      [v26 insertObject:&unk_1F3876BD0 atIndex:2];
      int v34 = [v29 objectAtIndexedSubscript:1];
      [v29 insertObject:v34 atIndex:2];
    }
    long long v35 = [v8 descriptor];
    uint64_t v33 = CPU_BuildBNNSNDArrayDescriptor(a1 + 176, v26, v29, 0, [v35 dataType], 1, 0);
  }
  else
  {
    uint64_t v33 = 0;
    uint64_t v26 = v12;
    uint64_t v29 = v16;
  }

  return v33;
}

id CPU_CreateNormalizationLayer(unsigned int a1, float a2, float a3, uint64_t a4, void *a5, void *a6, uint64_t a7, void *a8, void *a9, void *a10, void *a11)
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v19 = a5;
  id v20 = a6;
  id v65 = a8;
  id v67 = a9;
  id v68 = a10;
  id v21 = a11;
  unint64_t v66 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  bzero(v71, 0x468uLL);
  uint64_t v22 = (void *)[v20 mutableCopy];
  if (a1 == 2 && [v20 count] != 3)
  {
    unint64_t v23 = 0;
    do
    {
      [v22 insertObject:&unk_1F3876BD0 atIndex:0];
      ++v23;
    }
    while (v23 < 3 - [v20 count]);
  }
  int v24 = v65;
  int v25 = v67;
  uint64_t v26 = v68;
  if (CPU_BuildBNNSNormalizationParams(a1, (uint64_t)v71, v22, v65, v67, v68, v21, a2, a3))
  {
    int v27 = 2;
    switch(a1)
    {
      case 0u:
        goto LABEL_12;
      case 1u:
        int v27 = 20;
        if (!v19) {
          goto LABEL_18;
        }
        goto LABEL_13;
      case 2u:
        v72[7] = 3 - [v20 count];
        int v27 = 28;
LABEL_12:
        if (v19) {
          goto LABEL_13;
        }
        goto LABEL_18;
      case 3u:
        v72[6] = a7;
        int v27 = 33;
        if (!v19) {
          goto LABEL_18;
        }
LABEL_13:
        if (!setBNNSActivation((uint64_t)v72, v19)) {
          goto LABEL_16;
        }
        if (a1 >= 4)
        {
          unsigned int v28 = +[MLCLog framework];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
LABEL_40:
          }
            CPU_CreateNormalizationLayer_cold_1();
LABEL_41:
          uint64_t v29 = (void *)MEMORY[0x1E4F1CBF0];
        }
        else
        {
          int v27 = dword_1DD1F0ED0[a1];
LABEL_18:
          unsigned int v57 = v27;
          id v58 = v19;
          unint64_t v30 = 0x1E4F1C000uLL;
          uint64_t v63 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v71 length:1128];
          memset(v70, 0, sizeof(v70));
          memset(v69, 0, sizeof(v69));
          uint64_t v62 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v70 length:176];
          uint64_t v61 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v69 length:176];
          if ([v22 count])
          {
            unint64_t v31 = 0;
            size_t v32 = 1;
            do
            {
              uint64_t v33 = [v22 objectAtIndexedSubscript:v31];
              v32 *= [v33 unsignedIntegerValue];

              ++v31;
            }
            while (v31 < [v22 count]);
          }
          else
          {
            size_t v32 = 1;
          }
          int v34 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          uint64_t v35 = 4 * v32;
          if (v68)
          {
            id v36 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v32, 4uLL, 0x100004052888210uLL), 4 * v32, 1);
            unsigned __int8 v37 = [v68 descriptor];
            uint64_t v60 = v36;
            unint64_t v64 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v22, v36, [v37 dataType], a1 == 2);

            for (uint64_t i = 0; i != 3; ++i)
            {
              uint64_t v39 = [v26 descriptor];
              __int16 v40 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v22, 0, [v39 dataType], a1 == 2);
              [v34 setObject:v40 atIndexedSubscript:i];

              uint64_t v26 = v68;
            }
            unint64_t v30 = 0x1E4F1C000;
            uint64_t v35 = 4 * v32;
          }
          else
          {
            unint64_t v64 = 0;
            uint64_t v60 = 0;
          }
          uint64_t v41 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
          if (v21)
          {
            uint64_t v42 = objc_msgSend(*(id *)(v30 + 2488), "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v32, 4uLL, 0x100004052888210uLL), v35, 1);
            uint64_t v43 = [v21 descriptor];
            uint64_t v59 = v42;
            uint64_t v56 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v22, v42, [v43 dataType], a1 == 2);

            for (uint64_t j = 0; j != 3; ++j)
            {
              unsigned int v45 = [v21 descriptor];
              int v46 = CPU_BuildBNNSNDArrayDescriptorForBetaOrGammaDeltas(v22, 0, [v45 dataType], a1 == 2);
              [v41 setObject:v46 atIndexedSubscript:j];
            }
            int v47 = (void *)v56;
          }
          else
          {
            int v47 = 0;
            uint64_t v59 = 0;
          }
          v74[0] = v62;
          size_t v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:1];
          uint64_t v73 = v61;
          uint64_t v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
          unint64_t v50 = +[MLCCPUDeviceOps deviceOpsWithType:v57 params:v63 inDeltaData:v48 outDeltaData:v49 betaDeltaData:v64 gammaDeltaData:v47 betaMomentumData:v34 gammaMomentumData:v41];

          int v24 = v65;
          int v25 = v67;
          if (v50)
          {
            [v66 addObject:v50];
            [v50 setBetaDeltaData:v64];
            [v50 setGammaDeltaData:v47];
            [v50 setBetaDeltaDataBytes:v60];
            [v50 setGammaDeltaDataBytes:v59];
            uint64_t v51 = (void *)MEMORY[0x1E4F1CBF0];
            uint64_t v52 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
            [v50 setBetaMomentumDataBytes:v52];

            unint64_t v53 = (void *)[v51 mutableCopy];
            [v50 setGammaMomentumDataBytes:v53];

            if (v65) {
              [v50 setMovingMean:v65];
            }
            int v25 = v67;
            if (v67) {
              [v50 setMovingVariance:v67];
            }
          }
          unint64_t v54 = v47;
          uint64_t v29 = (void *)[v66 copy];

          id v19 = v58;
          uint64_t v26 = v68;
          unsigned int v28 = v63;
        }

        break;
      default:
        unsigned int v28 = +[MLCLog framework];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          goto LABEL_40;
        }
        goto LABEL_41;
    }
  }
  else
  {
LABEL_16:
    uint64_t v29 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v29;
}

void *CPU_CompileNormalizationLayer(unsigned int a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  unsigned int v9 = [a2 objectAtIndexedSubscript:0];
  id v10 = [v9 params];
  int v11 = (const BNNSLayerParametersNormalization *)[v10 bytes];
  int v12 = 0;
  if (CPU_BuildBNNSNormalizationInputOutputParams((uint64_t)v11, v7, v8, a1))
  {
    memset(&v15, 0, sizeof(v15));
    v15.flags = 1;
    if (a1 > 3)
    {
      int v12 = 0;
    }
    else
    {
      int v12 = BNNSFilterCreateLayerNormalization((BNNSFilterType)(a1 + 2), v11, &v15);
      if (v12)
      {
        unsigned int v13 = objc_msgSend(v7, "objectAtIndexedSubscript:", 0, *(_OWORD *)&v15.flags, *(_OWORD *)&v15.alloc_memory);
        [v9 setSourceStride:CPU_SetBatchStride(v13)];

        [v9 setResultStride:CPU_SetBatchStride(v8)];
      }
    }
  }

  return v12;
}

uint64_t CPU_SetOptimizerDataForNormalizationLayer(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 objectAtIndexedSubscript:0];
  if (v5)
  {
    id v8 = [v5 optimizerData];
    if ([v8 count])
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = (void *)MEMORY[0x1E4F1C9B8];
        int v11 = [v8 objectAtIndexedSubscript:v9];
        uint64_t v12 = [v11 bytes];
        unsigned int v13 = [v8 objectAtIndexedSubscript:v9];
        int v14 = objc_msgSend(v10, "dataWithBytesNoCopy:length:freeWhenDone:", v12, objc_msgSend(v13, "length"), 0);
        BNNSFilterParameters v15 = [v7 betaMomentumDataBytes];
        [v15 setObject:v14 atIndexedSubscript:v9];

        int v16 = [v7 betaMomentumData];
        uint64_t v17 = [v16 objectAtIndexedSubscript:v9];

        id v18 = v17;
        uint64_t v19 = [v18 bytes];
        id v20 = [v8 objectAtIndexedSubscript:v9];
        *(void *)(v19 + 136) = [v20 bytes];

        ++v9;
      }
      while (v9 < [v8 count]);
    }
  }
  if (v6)
  {
    id v21 = [v6 optimizerData];
    if ([v21 count])
    {
      unint64_t v22 = 0;
      do
      {
        unint64_t v23 = (void *)MEMORY[0x1E4F1C9B8];
        int v24 = [v21 objectAtIndexedSubscript:v22];
        uint64_t v25 = [v24 bytes];
        uint64_t v26 = [v21 objectAtIndexedSubscript:v22];
        int v27 = objc_msgSend(v23, "dataWithBytesNoCopy:length:freeWhenDone:", v25, objc_msgSend(v26, "length"), 0);
        unsigned int v28 = [v7 gammaMomentumDataBytes];
        [v28 setObject:v27 atIndexedSubscript:v22];

        uint64_t v29 = [v7 gammaMomentumData];
        unint64_t v30 = [v29 objectAtIndexedSubscript:v22];

        id v31 = v30;
        uint64_t v32 = [v31 bytes];
        uint64_t v33 = [v21 objectAtIndexedSubscript:v22];
        *(void *)(v32 + 136) = [v33 bytes];

        ++v22;
      }
      while (v22 < [v21 count]);
    }
  }
  return 1;
}

id ANE_BuildTransposeParams(void *a1)
{
  void v37[2] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 count];
  char v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  uint64_t v4 = [v1 count];
  if (v4 == 4)
  {
    uint64_t v12 = [v1 objectAtIndexedSubscript:0];
    [v3 setObject:v12 atIndexedSubscript:0];

    unsigned int v13 = [v1 objectAtIndexedSubscript:1];
    [v3 setObject:v13 atIndexedSubscript:1];

    int v14 = [v1 objectAtIndexedSubscript:2];
    [v3 setObject:v14 atIndexedSubscript:2];

    BNNSFilterParameters v15 = [v1 objectAtIndexedSubscript:3];
    [v3 setObject:v15 atIndexedSubscript:3];
  }
  else
  {
    uint64_t v5 = 4 - v2;
    if (v4 == 3)
    {
      [v3 setObject:&unk_1F3876BE8 atIndexedSubscript:0];
      int v16 = NSNumber;
      uint64_t v17 = [v1 objectAtIndexedSubscript:0];
      id v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") + v5);
      [v3 setObject:v18 atIndexedSubscript:1];

      uint64_t v19 = NSNumber;
      id v20 = [v1 objectAtIndexedSubscript:1];
      id v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue") + v5);
      [v3 setObject:v21 atIndexedSubscript:2];

      unint64_t v9 = NSNumber;
      id v10 = v1;
      uint64_t v11 = 2;
    }
    else
    {
      if (v4 != 2)
      {
        unint64_t v23 = +[MLCLog framework];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          ANE_BuildTransposeParams_cold_1(v1, v23);
        }
        uint64_t v33 = 0;
        goto LABEL_23;
      }
      [v3 setObject:&unk_1F3876BE8 atIndexedSubscript:0];
      [v3 setObject:&unk_1F3876C00 atIndexedSubscript:1];
      id v6 = NSNumber;
      id v7 = [v1 objectAtIndexedSubscript:0];
      id v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "unsignedIntegerValue") + v5);
      [v3 setObject:v8 atIndexedSubscript:2];

      unint64_t v9 = NSNumber;
      id v10 = v1;
      uint64_t v11 = 1;
    }
    BNNSFilterParameters v15 = [v10 objectAtIndexedSubscript:v11];
    unint64_t v22 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + v5);
    [v3 setObject:v22 atIndexedSubscript:3];
  }
  unint64_t v23 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  if (![v3 count])
  {
LABEL_15:
    unsigned int v28 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
    [v28 setObject:@"Transpose" forKeyedSubscript:kMLCANENetUnitType[0]];
    id v32 = [v23 copy];
    [v28 setObject:v32 forKeyedSubscript:@"TransposeDimensions"];

    uint64_t v33 = (void *)[v28 copy];
    goto LABEL_22;
  }
  unint64_t v24 = 0;
  while (1)
  {
    uint64_t v25 = [v3 objectAtIndexedSubscript:v24];
    uint64_t v26 = [v25 unsignedIntegerValue];

    if (v24 != v26) {
      break;
    }
LABEL_14:
    if (++v24 >= [v3 count]) {
      goto LABEL_15;
    }
  }
  int v27 = [v3 objectAtIndexedSubscript:v24];
  unsigned int v28 = ANE_GetANECIRDimension([v27 unsignedIntegerValue]);

  uint64_t v29 = ANE_GetANECIRDimension(v24);
  unint64_t v30 = (void *)v29;
  if (v28 && v29)
  {
    v36[0] = @"TransposeSourceDimension";
    v36[1] = @"TransposeDestinationDimension";
    v37[0] = v28;
    v37[1] = v29;
    id v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    [v23 addObject:v31];

    goto LABEL_14;
  }
  int v34 = +[MLCLog framework];
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    ANE_BuildTransposeParams_cold_2(v34);
  }

  uint64_t v33 = 0;
LABEL_22:

LABEL_23:

  return v33;
}

id ANE_CreateTransposeLayer(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  char v3 = ANE_BuildTransposeParams(v1);
  if (v3)
  {
    uint64_t v4 = +[_MLCANETransposeParameters transposeUnitParametersWith:v3];
    uint64_t v5 = +[MLCANEDeviceOps deviceOpsWithType:28 params:v4];
    if (v5) {
      [v2 addObject:v5];
    }
    id v6 = v2;
  }
  else
  {
    id v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ANE_CreateTransposeLayer_cold_1();
    }

    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

id ANE_CompileTransposeLayer(void *a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a1;
  id v7 = [a3 parentLayers];
  id v8 = [v7 objectAtIndexedSubscript:0];

  unint64_t v9 = [v6 objectAtIndexedSubscript:0];

  id v10 = [v9 params];
  uint64_t v11 = [v10 transposeParams];

  uint64_t v12 = +[_MLCANEPlistBuilder createUnitWithLayer:v8 unitParams:v11];
  char v13 = ANE_ValidateTransposeUnit(v5, v12, 1);

  if (v13)
  {
    v17[0] = v12;
    int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  else
  {
    BNNSFilterParameters v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      ANE_CompileTransposeLayer_cold_1();
    }

    int v14 = 0;
  }

  return v14;
}

void sub_1DD1BD78C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v2 - 120), 8);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

unint64_t *hashCombine_9(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char v13 = &a9;
  unint64_t v9 = *result;
  char v10 = 1;
  do
  {
    char v11 = v10;
    uint64_t v12 = v13;
    v13 += 8;
    v9 ^= *(void *)v12 + (v9 << 6) + (v9 >> 2) + 2654435769u;
    char v10 = 0;
  }
  while ((v11 & 1) != 0);
  *BOOL result = v9;
  return result;
}

id ANE_CreateFullyConnectedLayer()
{
  char v0 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v1 = +[MLCANEDeviceOps deviceOpsWithType:7 params:MEMORY[0x1E4F1CC08]];
  if (v1) {
    [v0 addObject:v1];
  }

  return v0;
}

id ANE_CompileFullyConnectedLayer(void *a1, void *a2, void *a3)
{
  v108[3] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1 objectAtIndexedSubscript:0];
  id v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v9 = [v6 parentLayers];
  char v10 = [v9 objectAtIndexedSubscript:0];

  char v11 = [v5 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 descriptor];
  uint64_t v101 = v11;
  if ([v12 dimensionCount] == 4)
  {
    char v13 = [v11 descriptor];
    int v14 = [v13 shape];
    BNNSFilterParameters v15 = [v14 objectAtIndexedSubscript:2];
    if ([v15 unsignedIntegerValue] == 1)
    {
      [v11 descriptor];
      int v16 = v98 = v8;
      [v16 shape];
      uint64_t v17 = v96 = v10;
      id v18 = [v17 objectAtIndexedSubscript:3];
      unint64_t v94 = v7;
      uint64_t v19 = [v18 unsignedIntegerValue];

      char v10 = v96;
      id v8 = v98;

      BOOL v20 = v19 == 1;
      id v7 = v94;
      if (!v20) {
        goto LABEL_12;
      }
      id v21 = v96;
      unint64_t v22 = [v21 descriptor];
      unint64_t v23 = [v21 weights];
      unint64_t v24 = [v21 biases];
      uint64_t v25 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
      if (ANE_BuildConvolutionParams(v25, v22, v23))
      {
        if (v24)
        {
          uint64_t v26 = +[_MLCANEPlistBuilder buildBiasParamsWithBiases:v24];
          if (!v26)
          {
            uint64_t v26 = +[MLCLog framework];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
              ANE_CompileFullyConnectedLayer_cold_3(v26);
            }
LABEL_69:
            int v46 = 0;
LABEL_77:

            char v10 = v96;
            id v8 = v98;
            if (v46) {
              goto LABEL_59;
            }
            unint64_t v88 = +[MLCLog framework];
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
              ANE_CompileFullyConnectedLayer_cold_1();
            }

            goto LABEL_63;
          }
        }
        else
        {
          uint64_t v26 = 0;
        }
        id v85 = ANE_CreateUnitsWithConvolutionLayer(v21, v25, v26);
        int v46 = v85;
        if (v85)
        {
          id v86 = v85;
        }
        else
        {
          uint64_t v87 = +[MLCLog framework];
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
            ANE_CompileFullyConnectedLayer_cold_2();
          }

          id v7 = v94;
        }

        goto LABEL_77;
      }
      uint64_t v26 = +[MLCLog framework];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        ANE_CompileFullyConnectedLayer_cold_4(v26);
      }
      goto LABEL_69;
    }
  }
LABEL_12:
  id v27 = v10;
  id v103 = v7;
  int v100 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v28 = v27;
  uint64_t v104 = [v28 descriptor];
  uint64_t v29 = [v28 sourceTensors];
  unint64_t v102 = [v29 objectAtIndexedSubscript:0];

  unint64_t v105 = [v28 weights];
  unint64_t v30 = [v105 descriptor];
  uint64_t v31 = [v30 dataType];

  id v32 = [v28 biases];
  uint64_t v33 = v32;
  if (!v32
    || ([v32 descriptor],
        int v34 = objc_claimAutoreleasedReturnValue(),
        int v35 = [v34 dataType],
        v34,
        v35 == v31))
  {
    unint64_t v97 = v10;
    uint64_t v99 = v8;
    uint64_t v95 = v7;
    id v91 = v6;
    id v92 = v5;
    uint64_t v36 = [v104 inputFeatureChannelCount];
    unint64_t v37 = [v104 outputFeatureChannelCount];
    if (v33) {
      uint64_t v38 = v36 + 1;
    }
    else {
      uint64_t v38 = v36;
    }
    size_t v39 = v38
        * v37
        * +[MLCTensorDescriptor elementByteCount:v31];
    __int16 v40 = malloc_type_malloc(v39, 0xF9FDDE1EuLL);
    uint64_t v93 = +[MLCTensorData dataWithBytesNoCopy:v40 length:v39 freeWhenDone:1];
    id v41 = [v105 data];
    uint64_t v42 = [v41 bytes];

    if (v33)
    {
      id v43 = [v33 data];
      uint64_t v44 = [v43 bytes];

      if (!v38)
      {
LABEL_47:
        uint64_t v63 = [NSNumber numberWithUnsignedInteger:v38];
        v108[0] = v63;
        v108[1] = &unk_1F3876C48;
        unint64_t v64 = [NSNumber numberWithUnsignedInteger:v37];
        v108[2] = v64;
        uint64_t v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:3];

        unint64_t v66 = [v105 label];
        uint64_t v90 = v65;
        id v67 = +[_MLCANEPlistBuilder constantTensorWithShape:v65 data:v93 dataType:v31 tensorLabel:v66];

        id v68 = [v103 constantTensors];
        [v68 addObject:v67];

        uint64_t v69 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
        [v69 setObject:@"MatrixMultiplication" forKeyedSubscript:kMLCANENetUnitType[0]];
        if (v33)
        {
          LODWORD(v107[0]) = 1065353216;
          __int16 v106 = 0;
          ANE_ConvertFp32ToInt16((uint64_t)v107, &v106);
          uint64_t v70 = [NSNumber numberWithShort:v106];
          [v69 setObject:v70 forKeyedSubscript:@"Bias"];
        }
        id v71 = +[_MLCANEPlistBuilder createUnitWithLayer:v28 unitParams:v69];
        unint64_t v72 = [v71 objectForKeyedSubscript:@"Bottom"];
        uint64_t v73 = [v67 label];
        [v72 addObject:v73];

        unint64_t v74 = [v71 objectForKeyedSubscript:@"InputType"];
        id v75 = [v67 descriptor];
        unint64_t v76 = ANE_GetANECIRDataTypeWithMLCDataType([v75 dataType]);

        [v74 addObject:v76];
        v107[0] = v102;
        v107[1] = v67;
        unint64_t v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:2];
        char v78 = ANE_ValidateMatrixMultUnit(v77, v71, 1);

        if (v78)
        {
          [v100 addObject:v71];
          int v46 = (void *)[v100 copy];
        }
        else
        {
          unint64_t v79 = +[MLCLog framework];
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
            ANE_CompileFullyConnectedLayer_cold_6();
          }

          int v46 = 0;
        }
        id v7 = v95;

        id v6 = v91;
        id v5 = v92;
        char v10 = v97;
        id v8 = v99;
        unsigned int v45 = v93;
        uint64_t v80 = v90;
LABEL_57:

        goto LABEL_58;
      }
    }
    else
    {
      uint64_t v44 = 0;
      if (!v38) {
        goto LABEL_47;
      }
    }
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    if (v37 <= 1) {
      uint64_t v49 = 1;
    }
    else {
      uint64_t v49 = v37;
    }
    uint64_t v50 = v42;
    uint64_t v51 = v42;
    while (1)
    {
      if (v37)
      {
        if ((v31 - 1) > 8 || ((0x1A5u >> (v31 - 1)) & 1) == 0)
        {
          uint64_t v81 = +[MLCLog framework];
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            int v89 = v31;
            uint64_t v80 = v81;
            ANE_CompileFullyConnectedLayer_cold_7(v89, v81);
            int v46 = 0;
            id v6 = v91;
            id v5 = v92;
            id v7 = v95;
            char v10 = v97;
            id v8 = v99;
            unsigned int v45 = v93;
          }
          else
          {
            int v46 = 0;
            id v6 = v91;
            id v7 = v95;
            char v10 = v97;
            id v8 = v99;
            unsigned int v45 = v93;
            uint64_t v80 = v81;
            id v5 = v92;
          }
          goto LABEL_57;
        }
        uint64_t v52 = v47;
        unint64_t v53 = (_WORD *)v42;
        unint64_t v54 = (_DWORD *)v50;
        uint64_t v55 = (unsigned char *)v51;
        uint64_t v56 = v49;
        unsigned int v57 = (_WORD *)v44;
        id v58 = (_DWORD *)v44;
        uint64_t v59 = (unsigned char *)v44;
        do
        {
          switch((int)v31)
          {
            case 1:
              if (v48 == v36) {
                uint64_t v61 = v58;
              }
              else {
                uint64_t v61 = v54;
              }
              v40[v52] = *v61;
              break;
            case 3:
              if (v48 == v36) {
                uint64_t v62 = v57;
              }
              else {
                uint64_t v62 = v53;
              }
              *((_WORD *)v40 + v52) = *v62;
              break;
            default:
              if (v48 == v36) {
                uint64_t v60 = v59;
              }
              else {
                uint64_t v60 = v55;
              }
              *((unsigned char *)v40 + v52) = *v60;
              break;
          }
          ++v59;
          ++v58;
          ++v57;
          v55 += v36;
          v54 += v36;
          v53 += v36;
          ++v52;
          --v56;
        }
        while (v56);
      }
      ++v48;
      ++v51;
      v50 += 4;
      v42 += 2;
      v47 += v37;
      if (v48 == v38) {
        goto LABEL_47;
      }
    }
  }
  unsigned int v45 = +[MLCLog framework];
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    ANE_CompileFullyConnectedLayer_cold_8(v33, v31, v45);
  }
  int v46 = 0;
LABEL_58:

  if (v46)
  {
LABEL_59:
    [v8 addObjectsFromArray:v46];

    id v82 = (void *)[v8 copy];
    goto LABEL_64;
  }
  id v83 = +[MLCLog framework];
  if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
    ANE_CompileFullyConnectedLayer_cold_5();
  }

LABEL_63:
  id v82 = 0;
LABEL_64:

  return v82;
}

void ANE_BuildNeuronParams_cold_1(void *a1)
{
  [a1 activationType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: unsupported activation type=%d", v3, v4, v5, v6, 2u);
}

void ANE_BuildNeuronParams_cold_2(uint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v1, v2, "%s: failed to convert FP32 value=%f to int16", v3, v4, v5, v6, 2u);
}

void ANE_BuildNeuronParams_cold_3(void *a1)
{
  [a1 activationType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: failed to build the parameters for activation type=%d", v3, v4, v5, v6, 2u);
}

void ANE_BuildNeuronParams_cold_8(uint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v1, v2, "%s: failed to convert float value=%f to int16", v3, v4, v5, v6, 2u);
}

void ANE_BuildNeuronParams_cold_11(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_BuildNeuronParams";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: ReLUN with a < 0 or b <= 0 is not supported on AppleNeuralEngine pre-H13 architecture", (uint8_t *)&v1, 0xCu);
}

void ANE_BuildLinearParams_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v1, v2, "%s: failed to convert FP32 value=%f to int16", v3, v4, v5, v6, 2u);
}

void ANE_BuildLinearParams_cold_3(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 a];
  v3[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_DEBUG, "%s: descriptor value a=%.10f is too small(< 1e-4f)", (uint8_t *)v3, 0x16u);
}

void ANE_CreateUnitsWithNeuronLayer_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s unsupported activation type=%d", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithNeuronLayer_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the ANEC IR units of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithNeuronLayer_cold_3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateUnitsWithNeuronLayer_cold_7()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: number of neuron parameter dictionaries should be either 1 or 3 for activation type=%d", v2, v3, v4, v5, v6);
}

void ANE_CreateUnitsWithNeuronLayer_cold_10()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: number of neuron parameter dictionaries should be 2 for activation type=%d", v2, v3, v4, v5, v6);
}

void ANE_CreateUnitsWithNeuronLayer_cold_15()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: number of neuron parameter dictionaries should be 4 for activation type=%d", v2, v3, v4, v5, v6);
}

void ANE_CreateUnitsOfLinear_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateUnitsOfLinear_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: neuron unit=%@ failed validation", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsOfLinear_cold_5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: number of neuron parameter dictionaries should be either 1 or 3 for activation type=%d", v2, v3, v4, v5, v6);
}

void GPU_CreateLossLayer_cold_1(void *a1)
{
  [a1 reductionType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown reduction type %d", v3, v4, v5, v6, 2u);
}

void GPU_CreateLossLayer_cold_2(void *a1)
{
  [a1 lossType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown loss type %d", v3, v4, v5, v6, 2u);
}

void CPU_BNNSDataTypeSizeInBytes_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = "CPU_BNNSDataTypeSizeInBytes";
  OUTLINED_FUNCTION_1_0(&dword_1DD0C9000, a1, a3, "%s: Unsupported data type", (uint8_t *)&v3);
}

void CPU_BNNSDataType_cold_1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  int v3 = "CPU_BNNSDataType";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: Unsupported sources data type (%d)", (uint8_t *)&v2, 0x12u);
}

void CPU_BuildBNNSNDArrayLastMajorDescriptor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  __int16 v4 = "CPU_BuildBNNSNDArrayLastMajorDescriptor";
  OUTLINED_FUNCTION_1_0(&dword_1DD0C9000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
}

void CPU_BuildBNNSNDArrayDescriptor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  __int16 v4 = "CPU_BuildBNNSNDArrayDescriptor";
  OUTLINED_FUNCTION_1_0(&dword_1DD0C9000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
}

void CPU_BuildPermuteBNNSNDArrayDescriptor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  __int16 v4 = "CPU_BuildPermuteBNNSNDArrayDescriptor";
  OUTLINED_FUNCTION_1_0(&dword_1DD0C9000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
}

void CPU_BuildBNNSNDArrayDescriptorRowMajor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  __int16 v4 = "CPU_BuildBNNSNDArrayDescriptorRowMajor";
  OUTLINED_FUNCTION_1_0(&dword_1DD0C9000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
}

void CPU_BuildBNNSNDArrayDescriptorColMajor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  __int16 v4 = "CPU_BuildBNNSNDArrayDescriptorColMajor";
  OUTLINED_FUNCTION_1_0(&dword_1DD0C9000, a1, a3, "%s: Unsupported shape dimensions", (uint8_t *)&v3);
}

void convertDataLayout_cold_1()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: tensor layout conversion without allocation", v4, v5, v6, v7, v8);
}

void convertDataLayout_cold_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: tensorDesc not matching data in layout conversion", v4, v5, v6, v7, v8);
}

void convertDataLayout_cold_3()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: unsupported format for converting", v4, v5, v6, v7, v8);
}

void convertDataLayout_cold_4()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: tensor layout conversion with mismatching source and result tensor", v4, v5, v6, v7, v8);
}

void convertNCHWtoTNC_cold_1(void *a1)
{
  uint64_t v1 = [a1 descriptor];
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v4, v5, "%@: height should be 1 for LSTM input tensor of shape NCHW", v6, v7, v8, v9, v10);
}

void ANE_CreateUpsampleLayer_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: scaleFactorY=%f is not a power-of-2 value and not supported", v2, v3, v4, v5, 2u);
}

void ANE_CreateUpsampleLayer_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: scaleFactorX=%f is not a power-of-2 value and not supported", v2, v3, v4, v5, 2u);
}

void ANE_CreateUpsampleLayer_cold_3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_CreateUpsampleLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: only nearest sample mode is supported", (uint8_t *)&v1, 0xCu);
}

void ANE_CompileUpsampleLayer_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, a2, a3, "%s: unsupported source tensor shape count=%lu", a5, a6, a7, a8, 2u);
}

void ANE_CompileUpsampleLayer_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the upsample units of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileUpsampleLayer_cold_3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create two reshape units for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileUpsampleLayer_cold_4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create upsample units for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CreateUpsampleUnits_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "ANE_CreateUpsampleUnits";
  __int16 v5 = 1024;
  int v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: unsupported data type=%d for tensor=%@", (uint8_t *)&v3, 0x1Cu);
}

void ANE_CreateUpsampleUnits_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the upsample unit that performs 1x1 upsampling of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CreateUpsampleUnits_cold_3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the upsample units each that performs 1x2 upsampling of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CreateUpsampleUnits_cold_4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the upsample units each that performs 2x1 upsampling of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CreateUpsampleUnits_cold_5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the upsample units each that performs 2x2 upsampling of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CreateUpsampleUnitsWithParams_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1DD0C9000, v2, OS_LOG_TYPE_ERROR, "%s: the unit=%@ of layer=%@ failed validation", (uint8_t *)v3, 0x20u);
}

void ANE_CreateSliceLayer_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  v3[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: the number of dimensions=%lu is unsupported", (uint8_t *)v3, 0x16u);
}

void ANE_CreateSliceLayer_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  os_log_t v2 = "ANE_CreateSliceLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: failed to get ANEC IR dimension", (uint8_t *)&v1, 0xCu);
}

void ANE_CreateSliceLayer_cold_3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  os_log_t v2 = "ANE_CreateSliceLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: only stride of 1 is supported", (uint8_t *)&v1, 0xCu);
}

void ANE_CompileSliceLayer_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: unsupported dimension=%lu", (uint8_t *)v1, 0x16u);
}

void ANE_CompileSliceLayer_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "ANE_CompileSliceLayer";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: unit=%@ of layer=%@ failed validation", (uint8_t *)&v3, 0x20u);
}

void ANE_CreateComparisonLayer_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported comparison operation=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileComparisonLayer_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported comparison operation=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileComparisonLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CompileComparisonLayer_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: the number of parameters should be 1 for comparison operation=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileComparisonLayer_cold_4()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CompileComparisonLayer_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, a1, a3, "%s: the number of parameters should be 1 for comparison operation=%d", a5, a6, a7, a8, 2u);
}

void ANE_CompileComparisonLayer_cold_8()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: the number of parameters should be 2 for comparison operation=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileComparisonLayer_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: invalid broadcast status=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileComparisonLayer_cold_10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ConnectBroadcastUnits_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CompileReshapeLayer_cold_1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1DD0C9000, v2, OS_LOG_TYPE_ERROR, "%s: unsupported shape=%@ for result tensor=%@", (uint8_t *)v3, 0x20u);
}

void ANE_CompileReshapeLayer_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: layer=%@ failed validation", (uint8_t *)v1, 0x16u);
}

void GPU_CreateOptimizerDeviceDataForTensor_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "GPU_CreateOptimizerDeviceDataForTensor";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: momentum creation failed", (uint8_t *)&v1, 0xCu);
}

void GPU_CreateOptimizerDeviceVectorDataForTensor_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "GPU_CreateOptimizerDeviceVectorDataForTensor";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: momentum creation failed", (uint8_t *)&v1, 0xCu);
}

void ANE_BuildArithmeticParams_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported arithmetic operation=%d", v2, v3, v4, v5, 2u);
}

void ANE_CreateArithmeticLayer_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: failed to build the ANEC IR parameters for arithmetic operation=%d", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: the neuron unit of layer=%@ failed validation", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: the elementwise unit of layer=%@ failed validation", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: number of arithmetic parameter dictionaries should be 1 for operation=%d", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_4()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the elementwise unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_7()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the neuron unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_8()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: number of arithmetic parameter dictionaries should be 2 for operation=%d", v2, v3, v4, v5, v6);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_9()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_11()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: number of arithmetic parameter dictionaries should be 2 for operation=%d", v2, v3, v4, v5, v6);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_14()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: number of arithmetic parameter dictionaries should be 2 for operation=%d", v2, v3, v4, v5, v6);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_15()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: invalid broadcast status=%d", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithArithmeticOpeartion_cold_16(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_CreateUnitsWithArithmeticOpeartion";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: broadcasting is needed but not supported", (uint8_t *)&v1, 0xCu);
}

void ANE_CompileArithmeticLayer_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the ANEC IR units of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_IsSupportedLayer_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 descriptor];
  [v3 poolingType];
  int v4 = 136315394;
  uint64_t v5 = "includePaddingLayer";
  OUTLINED_FUNCTION_5_0();
  _os_log_debug_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_DEBUG, "%s: unsupported pooling type=%d", (uint8_t *)&v4, 0x12u);
}

void buildANESubgraph_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)uint8_t buf = 136315138;
  *a2 = "getParentLayers";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: Cannot find parents for a layer", buf, 0xCu);
}

void setBNNSActivation_cold_1(void *a1)
{
  [a1 activationType];
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown neuron type %d", v3, v4, v5, v6, 2u);
}

void ANE_BuildConvolutionParams_cold_1(void *a1)
{
  [a1 convolutionType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x12u);
}

void ANE_BuildConvolutionParams_cold_2(void *a1)
{
  [a1 dataType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x1Cu);
}

void ANE_BuildConvolutionParams_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateConvolutionLayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateConvolutionLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateUnitsWithConvolutionLayer_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to calculate padding sizes for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithConvolutionLayer_cold_2()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1DD0C9000, v2, OS_LOG_TYPE_ERROR, "%s: unit=%@ of layer=%@ failed validation", (uint8_t *)v3, 0x20u);
}

void ANE_CreateUnitsWithConvolutionLayer_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateUnitsWithConvolutionLayer_cold_4()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid total padding size on width=%ld", v2, v3, v4, v5, 2u);
}

void ANE_CreateUnitsWithConvolutionLayer_cold_5()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid total padding size on height=%ld", v2, v3, v4, v5, 2u);
}

void ANE_CompileConvolutionLayer_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported source shape count=%lu", v2, v3, v4, v5, 2u);
}

void ANE_CompileConvolutionLayer_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the units of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileConvolutionLayer_cold_3(void *a1)
{
  uint64_t v1 = [a1 fusedLayers];
  uint64_t v2 = [v1 objectAtIndexedSubscript:0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x16u);
}

void ANE_CompileConvolutionLayer_cold_4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the convolution units of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileConvolutionLayer_cold_5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create two reshape units for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileSelectionLayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CompileSelectionLayer_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CompileSelectionLayer_cold_6(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "ANE_CompileSelectionLayer";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: invalid broadcast status=%d", (uint8_t *)&v2, 0x12u);
}

void ANE_CompileSelectionLayer_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CompileSelectionLayer_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void VerifyTensorBeforeRead_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: device memory not allocated for tensor=%@", v2, v3, v4, v5, 2u);
}

void VerifyTensorBeforeRead_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: empty liveIOStatus in tensor=%@", v2, v3, v4, v5, 2u);
}

void VerifyTensorBeforeRead_cold_3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "VerifyTensorBeforeRead";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: Tensor's device memory was not converted to ANE data structure", (uint8_t *)&v1, 0xCu);
}

void GPU_AllocateResourceForMultiGPUTraining_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 deviceList];
  int v4 = 134217984;
  uint64_t v5 = [v3 count];
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "2 GPUs are expected but only %lu GPU is available", (uint8_t *)&v4, 0xCu);
}

void GPU_AllocateResourceForMultiGPUTraining_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "Unsupported data type.", buf, 2u);
}

void GPU_GetDataType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void makeMPSNDArrayDescriptorFromTensor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateConcatUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateConcatUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateConcatUnit_cold_4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: failed to build ANECTensorDesc for sourceTensor=%@", (uint8_t *)v1, 0x16u);
}

void ANE_BuildANECTensorDesc_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = 136315650;
  uint64_t v6 = "ANE_BuildANECTensorDesc";
  __int16 v7 = 1024;
  int v8 = [a1 dataType];
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%s: unsupported data type=%d for tensor=%@", (uint8_t *)&v5, 0x1Cu);
}

void ANE_CreateUnitValidator_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: incorrect platform=%@", (uint8_t *)v1, 0x16u);
}

void ANE_ValidateConvolutionUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateConvolutionUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateConvolutionUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateInstanceNormUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateInstanceNormUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateInstanceNormUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateNeuronUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateNeuronUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateNeuronUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidatePoolingUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidatePoolingUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidatePoolingUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateSoftmaxUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateSoftmaxUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateSoftmaxUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateReshapeUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateReshapeUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateReshapeUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateTransposeUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateTransposeUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateTransposeUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateReductionUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateReductionUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateReductionUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateBroadcastUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateBroadcastUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateBroadcastUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateBroadcastUnit_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateElementWiseUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateElementWiseUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateElementWiseUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateInputViewUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateInputViewUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateInputViewUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateArgMinMaxUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateArgMinMaxUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateArgMinMaxUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateGOCUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateGOCUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateGOCUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateMatrixMultUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateMatrixMultUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateMatrixMultUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateLayerNormUnit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateLayerNormUnit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateLayerNormUnit_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __isAppleNeuralEngineAPIAvailable_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_BuildReductionParams_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: unsupported reduction type=%d", (uint8_t *)v1, 0x12u);
}

void ANE_BuildReductionParams_cold_2(void *a1)
{
  int v1 = [a1 objectAtIndexedSubscript:0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%s: unsupported reduction dimension=%@", v4, v5, v6, v7, 2u);
}

void ANE_Get4DReductionDimensions_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_Get4DReductionDimensions";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: only suppport a source tensor with up to 4 dimensions", (uint8_t *)&v1, 0xCu);
}

void ANE_CreateReductionLayer_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_CreateReductionLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: failed to build the reduction parameters", (uint8_t *)&v1, 0xCu);
}

void ANE_CompileReductionLayer_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 reductionType];
  v3[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: unsupported reduction type=%d", (uint8_t *)v3, 0x12u);
}

void ANE_CompileReductionLayer_cold_2(void *a1)
{
  int v1 = [a1 objectAtIndexedSubscript:0];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%s: unsupported reduction dimension=%@", v4, v5, v6, v7, 2u);
}

void ANE_CompileReductionLayer_cold_3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CompileSoftmaxLayer_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "ANE_CompileSoftmaxLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: nil neuron unit parameters", (uint8_t *)&v1, 0xCu);
}

void ANE_CompileSoftmaxLayer_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  int v2 = "ANE_CompileSoftmaxLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: nil GOC unit parameters", (uint8_t *)&v1, 0xCu);
}

void ANE_CompileSoftmaxLayer_cold_3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
}

void CPU_BuildBNNSLSTMInputAndOutput_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "CPU_BuildBNNSLSTMInputAndOutput";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: LSTM input feature size is %d but source tensor input feature size is %d", (uint8_t *)&v3, 0x18u);
}

void addInputWeightPointersToGate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void createParameterPointersForGate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreatePoolingLayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreatePoolingLayer_cold_2(void *a1)
{
  [a1 poolingType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: unsupported pooling type %d", v3, v4, v5, v6, 2u);
}

void ANE_CompilePoolingLayer_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: unsupported source shape count=%lu", (uint8_t *)v1, 0x16u);
}

void ANE_CompilePoolingLayer_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: unsupported pooling type=%d", (uint8_t *)v1, 0x12u);
}

void ANE_CompilePoolingLayer_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CompilePoolingLayer_cold_5(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 136315650;
  uint64_t v4 = "ANE_CompilePoolingLayer";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: reduction unit=%@ for layer=%@ failed validation", (uint8_t *)&v3, 0x20u);
}

void ANE_CompilePoolingLayer_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CPU_CreateLossLayer_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1DD0C9000, v0, v1, "%s: Unknown loss type %d", (uint8_t *)v2);
}

void getBNNSLossReductionFunction_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1DD0C9000, v0, v1, "%s: Unknown reduction type %d", (uint8_t *)v2);
}

void CPU_CompileYOLOLossLayer_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 objectAtIndexedSubscript:0];
  uint64_t v4 = [v3 descriptor];
  [v4 dataType];
  v6[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1DD0C9000, a2, v5, "%s: Unsupported sources data type %d", (uint8_t *)v6);
}

void CPU_CompileYOLOLossLayer_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 descriptor];
  [v3 dataType];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_1DD0C9000, a2, v4, "%s: Unsupported result data type (%d)", (uint8_t *)v5);
}

void CPU_CreateFusedConvolutionNormalizationAndNeuronLayer_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: Unsupported operation type (%d)", (uint8_t *)v1, 0x12u);
}

void CPU_CompileFusedConvolutionNormalizationAndNeuronLayer_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 deviceOpType];
  v3[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: Unsupported operation type (%d)", (uint8_t *)v3, 0x12u);
}

void CPU_CompileFusedConvolutionNormalizationAndNeuronLayer_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "CPU_CompileFusedConvolutionNormalizationAndNeuronLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: BNNS filter could not be created", (uint8_t *)&v1, 0xCu);
}

void CPU_CreatePaddingLayer_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: Unsupported padding type %d", (uint8_t *)v1, 0x12u);
}

void CPU_CreatePaddingLayer_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: Unsupported data type %d", (uint8_t *)v1, 0x12u);
}

void ANE_CreateMatMulLayer_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_CreateMatMulLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: failed to build Matrix Mult parameters", (uint8_t *)&v1, 0xCu);
}

double ANE_CreateMatMulLayer_cold_2(float *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v2 = *a1;
  int v4 = 136315394;
  uint64_t v5 = "ANE_BuildMatMulParameters";
  __int16 v6 = 2048;
  double v7 = v2;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: failed to convert the FP32 value=%f to int16", (uint8_t *)&v4, 0x16u);
  return result;
}

void ANE_CompileMatMulLayer_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: failed to get the ANEC IR data type from result tensor data type=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileMatMulLayer_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: failed to get the ANEC IR data type from source tensor data type=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileMatMulLayer_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: failed to get the ANEC IR data type from biases data type=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileMatMulLayer_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: invalid broadcasting status=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileMatMulLayer_cold_5()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: elementWise add unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CompileMatMulLayer_cold_6()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: broadcasting bias tensor is needed but not supported. bias tensor=%@, result tensor=%@", v2);
}

void ANE_CompileMatMulLayer_cold_8()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: GOC unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CompileMatMulLayer_cold_9()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: transpose unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CompileMatMulLayer_cold_10()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: matrix mult unit=%@ for layer=%@ failed validation", v2);
}

void ANE_CompileConcatLayer_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateNormalizationLayer_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported norm type=%d", v2, v3, v4, v5, 2u);
}

void ANE_CreateNormalizationLayer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_9(uint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v1, v2, "%s: failed to convert the FP32 value=%f to int16", v3, v4, v5, v6, 2u);
}

void ANE_CreateNormalizationLayer_cold_10(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 count];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_3(&dword_1DD0C9000, a2, v3, "%s: unsupported shape dimensions=%lu for instance normalization", (uint8_t *)v4);
}

void ANE_CreateNormalizationLayer_cold_11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_12()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported normalized shape count=%lu", v2, v3, v4, v5, 2u);
}

void ANE_CreateNormalizationLayer_cold_13(uint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v1, v2, "%s: failed to convert the FP32 value=%f to int16", v3, v4, v5, v6, 2u);
}

void ANE_CreateNormalizationLayer_cold_14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CreateNormalizationLayer_cold_17(uint64_t a1)
{
  OUTLINED_FUNCTION_4(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v1, v2, "%s: failed to convert the FP32 value=%f to int16", v3, v4, v5, v6, 2u);
}

void ANE_CreateNormalizationLayer_cold_18(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 count];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_3(&dword_1DD0C9000, a2, v3, "%s: unsupported shape dimensions=%lu for group normalization", (uint8_t *)v4);
}

void ANE_BuildBatchNormalizationParams_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_BuildBatchNormalizationParams_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
}

void ANE_BuildBatchNormalizationParams_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_BuildBatchNormalizationParams_cold_5(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [a1 count];
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_6_3(&dword_1DD0C9000, a2, v3, "%s: unsupported shape dimensions=%lu for batch normalization", (uint8_t *)v4);
}

void ANE_CompileNormalizationLayer_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported norm type=%d", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the units of layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_3(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 fusedLayers];
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  v6[0] = 136315394;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3(&dword_1DD0C9000, a2, v5, "%s: the fused layer is not a neuron layer.The fused layer=%@", (uint8_t *)v6);
}

void ANE_CompileNormalizationLayer_cold_4()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported source tensor shape count=%lu", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the normalization units for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_6()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create two reshape units for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_8()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_10()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported normalized shape count=%lu", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_11()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the units to apply the gamma and beta used by layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CompileNormalizationLayer_cold_13()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the constant tensor for gamma=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_14()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create the constant tensor for beta=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileNormalizationLayer_cold_15()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the instance normalization unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CompileNormalizationLayer_cold_16()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the layer normalization unit=%@ of layer=%@ failed validation", v2);
}

void ANE_BuildGocParams_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_12(&dword_1DD0C9000, v0, v1, "%s: unsupported data type=%d for tensor=%@", v2);
}

void ANE_CalculateScaleAndBiasForInstanceNorm_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
}

void ANE_CreateNormUnits_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported normalization type=%d", v2, v3, v4, v5, 2u);
}

void ANE_CreateNormUnits_cold_2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the GOC unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateNormUnits_cold_3()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the GOC unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateNormUnits_cold_4()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the instance normalization unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateNormUnits_cold_6()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the GOC unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateNormUnits_cold_7()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the group normalization unit=%@ of layer=%@ failed validation", v2);
}

void ANE_CreateBroadcastedConstantTensor_cold_1()
{
  int v3 = 136315650;
  OUTLINED_FUNCTION_0_2();
  HIWORD(v5) = v0;
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v1, v2, "%s: the size of the constant tensor=%lu is not divisible by the size of source tensor=%lu", v3, v4, v5);
}

void ANE_ConvertFp32ToInt16_cold_1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to convert the FP32 value=%f to FP16", v2, v3, v4, v5, 2u);
}

void ANE_CompressSparseKernel_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v4[0] = 136315650;
  OUTLINED_FUNCTION_11();
  uint64_t v5 = v0;
  __int16 v6 = v1;
  double v7 = v2;
  _os_log_debug_impl(&dword_1DD0C9000, v3, OS_LOG_TYPE_DEBUG, "%s: not a sparse kernel because sparsity=%f is below sparsityThreshold=%f", (uint8_t *)v4, 0x20u);
}

void ANE_CompressSparseKernel_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
}

void ANE_GetTensorValueInFloat_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
}

void ANE_GetTensorWidthAndHeightWithOnePrepended_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported tensor shape count=%lu", v2, v3, v4, v5, 2u);
}

void ANE_GetDimensionIn4DWithOnePrepended_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_GetDimensionIn4DWithOnePrepended_cold_2()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "ANE_GetDimensionIn4DWithOnePrepended";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: dimension=%lu cannot be equal to or greater than tensor shape count=%lu", (const char *)v2, DWORD2(v2), v3);
}

void ANE_GetTensorFeatureChannelsWithBatchFirst_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported tensor shape count=%lu", v2, v3, v4, v5, 2u);
}

void ANE_GetANECIRDimension_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported dimension=%lu", v2, v3, v4, v5, 2u);
}

void ANE_GetANECIRDataTypeWithMLCDataType_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported data type=%d", v2, v3, v4, v5, 2u);
}

void ANE_ValidateInterleave_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid interleave value=%lu", v2, v3, v4, v5, 2u);
}

void ANE_ValidateInterleave_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ValidateInterleave_cold_3()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "ANE_ValidateInterleave";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: invalid interleave (%lu) that exceeds the number of channels (%lu)", (const char *)v2, DWORD2(v2), v3);
}

void ANE_ValidateInterleave_cold_4()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "ANE_ValidateInterleave";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: the number of channels (%lu) must be a multiple of interleave (%lu)", (const char *)v2, DWORD2(v2), v3);
}

void ANE_ValidateInterleave_cold_5()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid interleave value=%lu.The interleave values supported by ANE compiler are 1, 2, 3, 4, and 8", v2, v3, v4, v5, 2u);
}

void ANE_GetANEElementByteCount_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_1DD0C9000, v0, v1, "%s: unsupported data type=%d on AppleNeuralEngine", v2, v3, v4, v5, 2u);
}

void ANE_CalculateRowStrideForTensor_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid element byte count=%lu", v2, v3, v4, v5, 2u);
}

void ANE_CalculateRowStrideForTensor_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CalculatePlaneStrideForTensor_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid row stride=%lu", v2, v3, v4, v5, 2u);
}

void ANE_CalculatePlaneCountForTensor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_CalculateIOInterleave_cold_1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid element byte count=%lu", v2, v3, v4, v5, 2u);
}

void ANE_ConvertInputTensor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ConvertInputTensor_cold_2(void *a1)
{
  [a1 dimensionCount];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v1, v2, "%s: unsupported tensor shape count=%lu", v3, v4, v5, v6, 2u);
}

void ANE_ConvertInputTensor_cold_3()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid interleave value (%lu)", v2, v3, v4, v5, 2u);
}

void ANE_ConvertInputTensor_cold_4()
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_12_0(&dword_1DD0C9000, v0, v1, "%s: unsuppoted data type combination. Source data type=%d, result data type=%d", v2, v3, v4);
}

void ANE_ConvertInputTensor_cold_5(void *a1)
{
  os_log_t v1 = [a1 descriptor];
  [v1 tensorAllocationSizeInBytes];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_1(&dword_1DD0C9000, v2, v3, "%s: sourceBufferLength=%lu does not match tensorAllocationSizeInBytes=%lu", v4, v5, v6, v7, 2u);
}

void ANE_ANECDataTypeToMLCDataType_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: unsupported data type=%@", v2, v3, v4, v5, 2u);
}

void ANE_ReadOutputTensor_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: no device memory allocated for tensor=%@", v2, v3, v4, v5, 2u);
}

void ANE_ReadOutputTensor_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ReadOutputTensor_cold_3(void *a1)
{
  [a1 dimensionCount];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v1, v2, "%s: unsupported tensor shape count=%lu", v3, v4, v5, v6, 2u);
}

void ANE_ReadOutputTensor_cold_4()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: no IOSurface allocated for tensor=%@", v2, v3, v4, v5, 2u);
}

void ANE_ReadOutputTensor_cold_5()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: invalid interleave value (%lu)", v2, v3, v4, v5, 2u);
}

void ANE_ReadOutputTensor_cold_6()
{
  LODWORD(v2) = 136315650;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_12_0(&dword_1DD0C9000, v0, v1, "%s: unsuppoted data type combination. Source data type=%d, result data type=%d", v2, v3, v4);
}

void ANE_ReadOutputTensor_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ANE_ReadOutputTensor_cold_8(void *a1)
{
  [a1 deviceIndex];
  OUTLINED_FUNCTION_3_1(&dword_1DD0C9000, v1, v2, "%s: ANE_ReadOutputTensor() must be called with deviceIndex = %lu, but given deviceIndex = %lu", v3, v4, v5, v6, 2u);
}

void ANE_ComputeLiveInputs_cold_1(void *a1)
{
  uint64_t v1 = [a1 parentLayers];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%s: failed to compute liveins: source tensor is defined by multiple layers = %@", v4, v5, v6, v7, 2u);
}

void ANE_WriteANEModelFiles_cold_1(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "ANE_WriteANEModelFiles";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: baseDirectoryPath=%@ exists : isDirectory=%d", (uint8_t *)&v4, 0x1Cu);
}

void ANE_WriteANEModelFiles_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to write weightFilePath=%@", v2, v3, v4, v5, 2u);
}

void ANE_WriteANEModelFiles_cold_3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to write the ANEC IR plist to plistFilePath=%@", v2, v3, v4, v5, 2u);
}

void ANE_WriteANEModelFiles_cold_4()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "ANE_WriteANEModelFiles";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: failed to create baseDirectoryPath=%@ : error=%@", (void)v2, DWORD2(v2));
}

void ANE_DeleteANEModelDirectory_cold_1()
{
  LODWORD(v2) = 136315650;
  *(void *)((char *)&v2 + 4) = "ANE_DeleteANEModelDirectory";
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2(&dword_1DD0C9000, v0, v1, "%s: failed to delete %@ : error=%@", (void)v2, DWORD2(v2));
}

void CPU_CreateSGDOptimizer_cold_1(void *a1)
{
  [a1 regularizationType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown regularization type type %d", v3, v4, v5, v6, 2u);
}

void CPU_CreateSGDOptimizer_cold_2(void *a1)
{
  [a1 regularizationType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown gradient clipping type %d", v3, v4, v5, v6, 2u);
}

void CPU_CreateAdamOptimizer_cold_1(void *a1)
{
  [a1 regularizationType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown regularization type type %d", v3, v4, v5, v6, 2u);
}

void CPU_CreateAdamOptimizer_cold_2(void *a1)
{
  [a1 regularizationType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown gradient clipping type %d", v3, v4, v5, v6, 2u);
}

void CPU_CreateRMSPropOptimizer_cold_1(void *a1)
{
  [a1 regularizationType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown regularization type type %d", v3, v4, v5, v6, 2u);
}

void CPU_CreateRMSPropOptimizer_cold_2(void *a1)
{
  [a1 regularizationType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v1, v2, "%s: Unknown gradient clipping type %d", v3, v4, v5, v6, 2u);
}

void CPU_CreateNormalizationLayer_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: Unsupported norm type (%d)", (uint8_t *)v1, 0x12u);
}

void ANE_BuildTransposeParams_cold_1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = "ANE_BuildTransposeParams";
  __int16 v5 = 2048;
  uint64_t v6 = [a1 count];
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: unsupported shape count=%lu", (uint8_t *)&v3, 0x16u);
}

void ANE_BuildTransposeParams_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_BuildTransposeParams";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: failed to get ANEC IR dimension", (uint8_t *)&v1, 0xCu);
}

void ANE_CreateTransposeLayer_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: failed to build the transpose parameteres for shape=%@", (uint8_t *)v1, 0x16u);
}

void ANE_CompileTransposeLayer_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DD0C9000, v0, OS_LOG_TYPE_ERROR, "%s: layer=%@ failed validation", (uint8_t *)v1, 0x16u);
}

void ANE_CompileFullyConnectedLayer_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create convolution units for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileFullyConnectedLayer_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create units for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileFullyConnectedLayer_cold_3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_CreateConvolutionUnitsWithFullyConnectedLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: failed to build bias parameters", (uint8_t *)&v1, 0xCu);
}

void ANE_CompileFullyConnectedLayer_cold_4(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "ANE_CreateConvolutionUnitsWithFullyConnectedLayer";
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: failed to build convolution parameters", (uint8_t *)&v1, 0xCu);
}

void ANE_CompileFullyConnectedLayer_cold_5()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_1DD0C9000, v0, v1, "%s: failed to create matrix multiplication units for layer=%@", v2, v3, v4, v5, 2u);
}

void ANE_CompileFullyConnectedLayer_cold_6()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_9();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_1DD0C9000, v2, OS_LOG_TYPE_ERROR, "%s: unit=%@ of layer=%@ failed validation", (uint8_t *)v3, 0x20u);
}

void ANE_CompileFullyConnectedLayer_cold_7(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  uint64_t v3 = "ANE_CreateMatMulUnitsWithFullyConnectedLayer";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: unsupported weight data type=%d", (uint8_t *)&v2, 0x12u);
}

void ANE_CompileFullyConnectedLayer_cold_8(void *a1, int a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = [a1 descriptor];
  int v6 = 136315650;
  uint64_t v7 = "ANE_CreateMatMulUnitsWithFullyConnectedLayer";
  __int16 v8 = 1024;
  int v9 = a2;
  __int16 v10 = 1024;
  int v11 = [v5 dataType];
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%s: different data types between weights and biases are not supported. weight data type=%d, bias data type=%d", (uint8_t *)&v6, 0x18u);
}

uint64_t ANECConcatLayerDescInitialize()
{
  return MEMORY[0x1F4104F60]();
}

uint64_t ANECConvLayerDescInitialize()
{
  return MEMORY[0x1F4104F70]();
}

uint64_t ANECDimensionMappingInitialize()
{
  return MEMORY[0x1F4104F90]();
}

uint64_t ANECGOCLayerDescInitialize()
{
  return MEMORY[0x1F4104FB8]();
}

uint64_t ANECInputViewLayerDescInitialize()
{
  return MEMORY[0x1F4104FF8]();
}

uint64_t ANECInstanceNormLayerDescInitialize()
{
  return MEMORY[0x1F4105010]();
}

uint64_t ANECKernelDilationRateInitialize()
{
  return MEMORY[0x1F4105020]();
}

uint64_t ANECKernelSizeInitialize()
{
  return MEMORY[0x1F4105028]();
}

uint64_t ANECLayerNormLayerDescInitialize()
{
  return MEMORY[0x1F4105038]();
}

uint64_t ANECMatrixMultLayerDescInitialize()
{
  return MEMORY[0x1F4105048]();
}

uint64_t ANECNeuronLayerDescInitialize()
{
  return MEMORY[0x1F4105060]();
}

uint64_t ANECPaddingInitialize()
{
  return MEMORY[0x1F4105078]();
}

uint64_t ANECPoolLayerDescInitialize()
{
  return MEMORY[0x1F4105098]();
}

uint64_t ANECReductionLayerDescInitialize()
{
  return MEMORY[0x1F41050A0]();
}

uint64_t ANECReshapeLayerDescInitialize()
{
  return MEMORY[0x1F41050C8]();
}

uint64_t ANECSoftmaxLayerDescInitialize()
{
  return MEMORY[0x1F41050D8]();
}

uint64_t ANECStepInitialize()
{
  return MEMORY[0x1F4105108]();
}

uint64_t ANECTensorDescInitialize()
{
  return MEMORY[0x1F4105110]();
}

uint64_t ANECTensorDimsInitialize()
{
  return MEMORY[0x1F4105120]();
}

uint64_t ANECTransposeLayerDescInitialize()
{
  return MEMORY[0x1F4105140]();
}

uint64_t ANECUnitValidatorCreate()
{
  return MEMORY[0x1F4105150]();
}

uint64_t ANECUnitValidatorDelete()
{
  return MEMORY[0x1F4105160]();
}

uint64_t ANECValidateArgMinMaxLayer()
{
  return MEMORY[0x1F4105178]();
}

uint64_t ANECValidateBroadcastLayer()
{
  return MEMORY[0x1F4105190]();
}

uint64_t ANECValidateConcatLayer()
{
  return MEMORY[0x1F41051A0]();
}

uint64_t ANECValidateConvLayer()
{
  return MEMORY[0x1F41051B0]();
}

uint64_t ANECValidateElementWiseLayer()
{
  return MEMORY[0x1F41051E0]();
}

uint64_t ANECValidateGOCLayer()
{
  return MEMORY[0x1F41051F8]();
}

uint64_t ANECValidateInputViewLayer()
{
  return MEMORY[0x1F4105210]();
}

uint64_t ANECValidateInstanceNormLayer()
{
  return MEMORY[0x1F4105228]();
}

uint64_t ANECValidateLayerNormLayer()
{
  return MEMORY[0x1F4105230]();
}

uint64_t ANECValidateMatrixMultLayer()
{
  return MEMORY[0x1F4105250]();
}

uint64_t ANECValidateNeuronLayer()
{
  return MEMORY[0x1F4105270]();
}

uint64_t ANECValidatePoolLayer()
{
  return MEMORY[0x1F41052A0]();
}

uint64_t ANECValidateReductionLayer()
{
  return MEMORY[0x1F41052A8]();
}

uint64_t ANECValidateReshapeLayer()
{
  return MEMORY[0x1F41052C0]();
}

uint64_t ANECValidateSoftmaxLayer()
{
  return MEMORY[0x1F41052D8]();
}

uint64_t ANECValidateTransposeLayer()
{
  return MEMORY[0x1F4105318]();
}

int BNNSApplyMultiheadAttention(void *F, size_t batch_size, const void *query, size_t query_stride, const void *key, size_t key_stride, const BNNSNDArrayDescriptor *key_mask, size_t key_mask_stride, const void *value, size_t value_stride, void *output, size_t output_stride, const BNNSNDArrayDescriptor *add_to_attention, size_t *backprop_cache_size, void *backprop_cache, size_t *workspace_size, void *workspace)
{
  return MEMORY[0x1F40D0EE8](F, batch_size, query, query_stride, key, key_stride, key_mask, key_mask_stride);
}

int BNNSApplyMultiheadAttentionBackward(void *F, size_t batch_size, const void *query, size_t query_stride, BNNSMHAProjectionParameters *query_param_delta, const void *key, size_t key_stride, const BNNSNDArrayDescriptor *key_mask, size_t key_mask_stride, BNNSMHAProjectionParameters *key_param_delta, const void *value, size_t value_stride, BNNSMHAProjectionParameters *value_param_delta, const BNNSNDArrayDescriptor *add_to_attention, BNNSNDArrayDescriptor *key_attn_bias_delta, BNNSNDArrayDescriptor *value_attn_bias_delta, const void *output, size_t output_stride, BNNSMHAProjectionParameters *output_param_delta, size_t backprop_cache_size,void *backprop_cache,size_t *workspace_size,void *workspace)
{
  return MEMORY[0x1F40D0EF0](F, batch_size, query, query_stride, query_param_delta, key, key_stride, key_mask);
}

int BNNSArithmeticFilterApplyBackwardBatch(void *filter, size_t batch_size, size_t number_of_inputs, const void **in, const size_t *in_stride, BNNSNDArrayDescriptor **in_delta, const size_t *in_delta_stride, const void *out, const size_t out_stride, BNNSNDArrayDescriptor *out_delta, const size_t out_delta_stride)
{
  return MEMORY[0x1F40D0EF8](filter, batch_size, number_of_inputs, in, in_stride, in_delta, in_delta_stride, out);
}

int BNNSArithmeticFilterApplyBatch(void *filter, size_t batch_size, size_t number_of_inputs, const void **in, const size_t *in_stride, void *out, size_t out_stride)
{
  return MEMORY[0x1F40D0F00](filter, batch_size, number_of_inputs, in, in_stride, out, out_stride);
}

int BNNSCompareTensor(const BNNSNDArrayDescriptor *in0, const BNNSNDArrayDescriptor *in1, BNNSRelationalOperator op, BNNSNDArrayDescriptor *out)
{
  return MEMORY[0x1F40D0F30](in0, in1, *(void *)&op, out);
}

size_t BNNSComputeLSTMTrainingCacheCapacity(const BNNSLayerParametersLSTM *layer_params)
{
  return MEMORY[0x1F40D0F38](layer_params);
}

int BNNSCopy(BNNSNDArrayDescriptor *dest, const BNNSNDArrayDescriptor *src, const BNNSFilterParameters *filter_params)
{
  return MEMORY[0x1F40D0F58](dest, src, filter_params);
}

int BNNSDirectApplyLSTMBatchBackward(const BNNSLayerParametersLSTM *layer_params, const BNNSLayerParametersLSTM *layer_delta_params, const BNNSFilterParameters *filter_params, const void *training_cache_ptr, const size_t training_cache_capacity)
{
  return MEMORY[0x1F40D0FC8](layer_params, layer_delta_params, filter_params, training_cache_ptr, training_cache_capacity);
}

int BNNSDirectApplyLSTMBatchTrainingCaching(const BNNSLayerParametersLSTM *layer_params, const BNNSFilterParameters *filter_params, void *training_cache_ptr, const size_t training_cache_capacity)
{
  return MEMORY[0x1F40D0FD0](layer_params, filter_params, training_cache_ptr, training_cache_capacity);
}

int BNNSFilterApply(void *filter, const void *in, void *out)
{
  return MEMORY[0x1F40D0FF8](filter, in, out);
}

int BNNSFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, const BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *weights_delta, BNNSNDArrayDescriptor *bias_delta)
{
  return MEMORY[0x1F40D1008](filter, batch_size, in, in_stride, in_delta, in_delta_stride, out, out_stride);
}

int BNNSFilterApplyBackwardTwoInputBatch(void *filter, size_t batch_size, const void *inA, size_t inA_stride, BNNSNDArrayDescriptor *inA_delta, size_t inA_delta_stride, const void *inB, size_t inB_stride, BNNSNDArrayDescriptor *inB_delta, size_t inB_delta_stride, const void *out, size_t out_stride, const BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *weights_delta, BNNSNDArrayDescriptor *bias_delta)
{
  return MEMORY[0x1F40D1010](filter, batch_size, inA, inA_stride, inA_delta, inA_delta_stride, inB, inB_stride);
}

int BNNSFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride)
{
  return MEMORY[0x1F40D1018](filter, batch_size, in, in_stride, out, out_stride);
}

int BNNSFilterApplyTwoInputBatch(void *filter, size_t batch_size, const void *inA, size_t inA_stride, const void *inB, size_t inB_stride, void *out, size_t out_stride)
{
  return MEMORY[0x1F40D1030](filter, batch_size, inA, inA_stride, inB, inB_stride, out, out_stride);
}

uint64_t BNNSFilterCreateBatchLayerFullyConnected()
{
  return MEMORY[0x1F40D1038]();
}

void *__cdecl BNNSFilterCreateFusedLayer(const size_t number_of_fused_filters, const BNNSFilterType *filter_type, const void **layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1058](number_of_fused_filters, filter_type, layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerActivation(const BNNSLayerParametersActivation *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1060](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerArithmetic(const BNNSLayerParametersArithmetic *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1068](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerBroadcastMatMul(const BNNSLayerParametersBroadcastMatMul *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1080](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerConvolution(const BNNSLayerParametersConvolution *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1090](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerDropout(const BNNSLayerParametersDropout *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1098](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerGram(const BNNSLayerParametersGram *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10B8](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerLoss(const void *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10C0](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerMultiheadAttention(const BNNSLayerParametersMultiheadAttention *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10C8](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerNormalization(BNNSFilterType normType, const BNNSLayerParametersNormalization *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10D0](*(void *)&normType, layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerPadding(const BNNSLayerParametersPadding *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10D8](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerPermute(const BNNSLayerParametersPermute *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10E0](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerPooling(const BNNSLayerParametersPooling *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10E8](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerReduction(const BNNSLayerParametersReduction *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D10F8](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerResize(const BNNSLayerParametersResize *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1100](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerTransposedConvolution(const BNNSLayerParametersConvolution *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1F40D1110](layer_params, filter_params);
}

void BNNSFilterDestroy(void *filter)
{
}

int BNNSFusedFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor **delta_parameters)
{
  return MEMORY[0x1F40D1148](filter, batch_size, in, in_stride, in_delta, in_delta_stride, out, out_stride);
}

int BNNSFusedFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride, BOOL training)
{
  return MEMORY[0x1F40D1158](filter, batch_size, in, in_stride, out, out_stride, training);
}

int BNNSLossFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *labels, size_t labels_stride, const void *weights, size_t weights_size, const BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride)
{
  return MEMORY[0x1F40D13B0](filter, batch_size, in, in_stride, in_delta, in_delta_stride, labels, labels_stride);
}

int BNNSLossFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, const void *labels, size_t labels_stride, const void *weights, size_t weights_size, void *out, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride)
{
  return MEMORY[0x1F40D13B8](filter, batch_size, in, in_stride, labels, labels_stride, weights, weights_size);
}

int BNNSNormalizationFilterApplyBackwardBatch(void *filter, size_t batch_size, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *beta_delta, BNNSNDArrayDescriptor *gamma_delta)
{
  return MEMORY[0x1F40D1408](filter, batch_size, in_delta, in_delta_stride, out, out_stride, out_delta, out_delta_stride);
}

int BNNSNormalizationFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride, BOOL training)
{
  return MEMORY[0x1F40D1410](filter, batch_size, in, in_stride, out, out_stride, training);
}

int BNNSOptimizerStep(BNNSOptimizerFunction function, const void *OptimizerAlgFields, size_t number_of_parameters, BNNSNDArrayDescriptor **parameters, const BNNSNDArrayDescriptor **gradients, BNNSNDArrayDescriptor **accumulators, const BNNSFilterParameters *filter_params)
{
  return MEMORY[0x1F40D1418](*(void *)&function, OptimizerAlgFields, number_of_parameters, parameters, gradients, accumulators, filter_params);
}

int BNNSPoolingFilterApplyBackwardBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, BNNSNDArrayDescriptor *in_delta, size_t in_delta_stride, const void *out, size_t out_stride, BNNSNDArrayDescriptor *out_delta, size_t out_delta_stride, BNNSNDArrayDescriptor *bias_delta, const size_t *indices, size_t idx_stride)
{
  return MEMORY[0x1F40D1420](filter, batch_size, in, in_stride, in_delta, in_delta_stride, out, out_stride);
}

int BNNSPoolingFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride, size_t *indices, size_t idx_stride)
{
  return MEMORY[0x1F40D1430](filter, batch_size, in, in_stride, out, out_stride, indices, idx_stride);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

void CFRelease(CFTypeRef cf)
{
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1F40E9308](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1F40E9350](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1F40E9358](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9540](buffer, *(void *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1F40E9630](buffer, *(void *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t MPSGetTemporaryBufferFromCommandBufferCache()
{
  return MEMORY[0x1F40EDE80]();
}

NSUInteger MPSImageBatchIncrementReadCount(MPSImageBatch *batch, NSInteger amount)
{
  return MEMORY[0x1F40EDE88](batch, amount);
}

NSUInteger MPSStateBatchIncrementReadCount(MPSStateBatch *batch, NSInteger amount)
{
  return MEMORY[0x1F40EDEA0](batch, amount);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1F40EDE00]();
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x1F40E71C8]();
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x1F40E7240](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1F40C9CE8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

double drand48(void)
{
  MEMORY[0x1F40CBDE8]();
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x1F40CC8B0](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBB0](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x1F40CDC10](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

void srand48(uint64_t a1)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

void vDSP_maxmgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
}

void vDSP_svemg(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D25B0](src, dest, *(void *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1F40D2648](src, dest, *(void *)&flags);
}

void vvpowsf(float *a1, const float *a2, const float *a3, const int *a4)
{
}
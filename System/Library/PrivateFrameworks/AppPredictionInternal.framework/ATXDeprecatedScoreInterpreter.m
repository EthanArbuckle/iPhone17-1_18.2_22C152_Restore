@interface ATXDeprecatedScoreInterpreter
@end

@implementation ATXDeprecatedScoreInterpreter

uint64_t __50___ATXDeprecatedScoreInterpreter_instructionCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    if (!v7)
    {
      [v5 doubleValue];
      v108[0] = MEMORY[0x1E4F143A8];
      v108[1] = 3221225472;
      v108[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2;
      v108[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
      v108[4] = v8;
      v7 = (void *)[v108 copy];
      v9 = _Block_copy(v7);
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
    }
    id v10 = _Block_copy(v7);
    [v6 addObject:v10];
    goto LABEL_50;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    if (!v7)
    {
      id v11 = v5;
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_3;
      v105[3] = &unk_1E68B50A8;
      id v12 = v11;
      id v106 = v12;
      objc_copyWeak(&v107, (id *)(a1 + 56));
      v7 = (void *)[v105 copy];
      v13 = _Block_copy(v7);
      [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v12];

      objc_destroyWeak(&v107);
    }
    id v10 = _Block_copy(v7);
    [v6 addObject:v10];
    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_51:

    return;
  }
  if ([v5 count] != 1)
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    v59 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v58 handleFailureInFunction:v59, @"_ATXDeprecatedScoreInterpreter.m", 305, @"Dictionary must be of size 1, not %lu", objc_msgSend(v5, "count") file lineNumber description];
  }
  v14 = [v5 allKeys];
  v7 = [v14 firstObject];

  id v10 = [v5 objectForKeyedSubscript:v7];
  if ([v7 isEqualToString:@"IfThenElse"])
  {
    if ([v10 count] != 3)
    {
      v61 = [MEMORY[0x1E4F28B00] currentHandler];
      v62 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
      [v61 handleFailureInFunction:v62, @"_ATXDeprecatedScoreInterpreter.m", 312, @"Invalid parameter not satisfying: %@", @"args.count == 3" file lineNumber description];
    }
    v76 = [v10 objectAtIndexedSubscript:0];
    v78 = [v10 objectAtIndexedSubscript:1];
    id v15 = [v10 objectAtIndexedSubscript:2];
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v16 = a1 + 48;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(v17 + 8) + 40));
    v19 = compiledExpressionInstructions(WeakRetained, v78);

    id v20 = objc_loadWeakRetained((id *)(*(void *)(*(void *)v16 + 8) + 40));
    v21 = compiledExpressionInstructions(v20, v15);

    v22 = (void (**)(id, void *, id))objc_loadWeakRetained((id *)(*(void *)(*(void *)v16 + 8) + 40));
    v22[2](v22, v76, v6);

    v102[0] = MEMORY[0x1E4F143A8];
    v102[1] = 3221225472;
    v102[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_4;
    v102[3] = &unk_1E68B50D0;
    id v103 = v21;
    id v104 = v19;
    id v23 = v19;
    id v24 = v21;
    v25 = (void *)[v102 copy];
    v26 = _Block_copy(v25);
    [v6 addObject:v26];

LABEL_20:
LABEL_50:

    goto LABEL_51;
  }
  if ([v7 isEqualToString:@"Default"])
  {
    if ([v10 count] != 2)
    {
      v64 = [MEMORY[0x1E4F28B00] currentHandler];
      v65 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
      [v64 handleFailureInFunction:v65, @"_ATXDeprecatedScoreInterpreter.m", 329, @"Invalid parameter not satisfying: %@", @"args.count == 2" file lineNumber description];
    }
    v76 = [v10 objectAtIndexedSubscript:0];
    v78 = [v10 objectAtIndexedSubscript:1];
    id v27 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    v28 = compiledExpressionInstructions(v27, v78);

    v29 = (void (**)(id, void *, id))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                           + 40));
    v29[2](v29, v76, v6);

    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_5;
    v100[3] = &unk_1E68B50F8;
    v101 = v28;
    id v15 = v28;
    v30 = (void *)[v100 copy];
    v31 = _Block_copy(v30);
    [v6 addObject:v31];

    id v24 = v101;
    goto LABEL_20;
  }
  if ([v7 isEqualToString:@"NeuralNet"])
  {
    v32 = [_ATXNeuralNetwork alloc];
    v33 = [v10 objectAtIndexedSubscript:0];
    v79 = [(_ATXNeuralNetwork *)v32 initWithData:v33];

    uint64_t v34 = objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 1);
    v75 = 0;
    v77 = 0;
LABEL_27:

    id v10 = (id)v34;
    goto LABEL_28;
  }
  if ([v7 isEqualToString:@"IntentInSet"])
  {
    v75 = 0;
    v77 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
    v79 = 0;
    uint64_t v34 = MEMORY[0x1E4F1CBF0];
    goto LABEL_27;
  }
  if ([v7 isEqualToString:@"CoreMLModel"])
  {
    uint64_t v35 = [v10 objectAtIndexedSubscript:0];
    v36 = [v10 objectAtIndexedSubscript:1];
    v37 = [v10 objectAtIndexedSubscript:2];
    v75 = [[_ATXScoreInterpreterCoreMLModel alloc] initWithModelName:v35 features:v36 outputSpecification:v37];
    uint64_t v34 = [(_ATXScoreInterpreterCoreMLModel *)v75 getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:v36 outputSpecification:v37];

    v77 = 0;
    v79 = 0;
    id v10 = (id)v35;
    goto LABEL_27;
  }
  v75 = 0;
  v77 = 0;
  v79 = 0;
LABEL_28:
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v10 = v10;
  uint64_t v38 = [v10 countByEnumeratingWithState:&v96 objects:v109 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v97;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v97 != v39) {
          objc_enumerationMutation(v10);
        }
        uint64_t v41 = *(void *)(*((void *)&v96 + 1) + 8 * v40);
        v42 = (void (**)(id, void, id))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                               + 40));
        v42[2](v42, v41, v6);

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [v10 countByEnumeratingWithState:&v96 objects:v109 count:16];
    }
    while (v38);
  }

  uint64_t v43 = [v10 count];
  if ([v7 isEqualToString:@"Sum"])
  {
    v95[0] = MEMORY[0x1E4F143A8];
    v95[1] = 3221225472;
    v95[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_6;
    v95[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v95[4] = v43;
    v44 = (void *)[v95 copy];
    v45 = _Block_copy(v44);
    [v6 addObject:v45];

LABEL_49:
    goto LABEL_50;
  }
  if ([v7 isEqualToString:@"Product"])
  {
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_7;
    v94[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v94[4] = v43;
    v44 = (void *)[v94 copy];
    v46 = _Block_copy(v44);
    [v6 addObject:v46];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"ValueAtIndexForFeatureArray"])
  {
    v93[0] = MEMORY[0x1E4F143A8];
    v93[1] = 3221225472;
    v93[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_8;
    v93[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v93[4] = v43;
    v44 = (void *)[v93 copy];
    v47 = _Block_copy(v44);
    [v6 addObject:v47];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"NeuralNet"])
  {
    v48 = v92;
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_9;
    v92[3] = &unk_1E68B5120;
    v92[5] = v43;
    v92[4] = v79;
    v49 = (void *)[v92 copy];
    v50 = _Block_copy(v49);
    [v6 addObject:v50];

LABEL_48:
    v44 = (void *)v48[4];
    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"IntentInSet"])
  {
    v48 = v91;
    v91[0] = MEMORY[0x1E4F143A8];
    v91[1] = 3221225472;
    v91[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_10;
    v91[3] = &unk_1E68B50F8;
    v91[4] = v77;
    v51 = (void *)[v91 copy];
    v52 = _Block_copy(v51);
    [v6 addObject:v52];

    goto LABEL_48;
  }
  if ([v7 isEqualToString:@"CoreMLModel"])
  {
    v48 = v90;
    v90[0] = MEMORY[0x1E4F143A8];
    v90[1] = 3221225472;
    v90[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11;
    v90[3] = &unk_1E68B5120;
    v90[5] = v43;
    v90[4] = v75;
    v53 = (void *)[v90 copy];
    v54 = _Block_copy(v53);
    [v6 addObject:v54];

    goto LABEL_48;
  }
  if ([v7 isEqualToString:@"Logarithm"])
  {
    v89[0] = MEMORY[0x1E4F143A8];
    v89[1] = 3221225472;
    v89[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_68;
    v89[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v89[4] = v43;
    v44 = (void *)[v89 copy];
    v55 = _Block_copy(v44);
    [v6 addObject:v55];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"NatLog"])
  {
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_81;
    v88[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v88[4] = v43;
    v44 = (void *)[v88 copy];
    v56 = _Block_copy(v44);
    [v6 addObject:v56];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"Power"])
  {
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_88;
    v87[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v87[4] = v43;
    v44 = (void *)[v87 copy];
    v57 = _Block_copy(v44);
    [v6 addObject:v57];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"Divide"])
  {
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_95;
    v86[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v86[4] = v43;
    v44 = (void *)[v86 copy];
    v60 = _Block_copy(v44);
    [v6 addObject:v60];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"ExpDecay"])
  {
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_102;
    v85[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v85[4] = v43;
    v44 = (void *)[v85 copy];
    v63 = _Block_copy(v44);
    [v6 addObject:v63];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"Threshold"])
  {
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_115;
    v84[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v84[4] = v43;
    v44 = (void *)[v84 copy];
    v66 = _Block_copy(v44);
    [v6 addObject:v66];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"GeometricSum"])
  {
    v83[0] = MEMORY[0x1E4F143A8];
    v83[1] = 3221225472;
    v83[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_119;
    v83[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v83[4] = v43;
    v44 = (void *)[v83 copy];
    v67 = _Block_copy(v44);
    [v6 addObject:v67];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"Sigmoid"])
  {
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_129;
    v82[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v82[4] = v43;
    v44 = (void *)[v82 copy];
    v68 = _Block_copy(v44);
    [v6 addObject:v68];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"ClampToRange"])
  {
    v81[0] = MEMORY[0x1E4F143A8];
    v81[1] = 3221225472;
    v81[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_133;
    v81[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v81[4] = v43;
    v44 = (void *)[v81 copy];
    v69 = _Block_copy(v44);
    [v6 addObject:v69];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"ApplyFeedback"])
  {
    v44 = (void *)[&__block_literal_global_210 copy];
    v70 = _Block_copy(v44);
    [v6 addObject:v70];

    goto LABEL_49;
  }
  if ([v7 isEqualToString:@"RandomUniform"])
  {
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_150;
    v80[3] = &__block_descriptor_40_e43_d16__0___ATXDeprecatedScoreInterpreterCtx_8l;
    v80[4] = v43;
    v44 = (void *)[v80 copy];
    v71 = _Block_copy(v44);
    [v6 addObject:v71];

    goto LABEL_49;
  }
  v72 = __atxlog_handle_default();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
    __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_cold_1();
  }

  v73 = [MEMORY[0x1E4F28B00] currentHandler];
  v74 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
  [v73 handleFailureInFunction:v74, @"_ATXDeprecatedScoreInterpreter.m", 627, @"Undefined function: %@", v7 file lineNumber description];

  __break(1u);
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_3(uint64_t a1, void *a2)
{
  v3 = a2;
  char v9 = 0;
  [v3[502] scoreForKey:*(void *)(a1 + 32) found:&v9];
  if (v9 || ([v3[503] scoreForKey:*(void *)(a1 + 32) found:&v9], v9))
  {
    double v5 = v4;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _evalVariable:*(void *)(a1 + 32) withCtx:v3];
    double v5 = v8;
  }
  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  pop_0(v3);
  if (v4 == -31337.0) {
    goto LABEL_12;
  }
  BOOL v5 = (*(void *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  BOOL v6 = ((*(void *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (v4 >= 0.0)
  {
    BOOL v6 = 0;
    BOOL v5 = 0;
  }
  if ((*(void *)&v4 & 0x7FFFFFFFFFFFFFFFLL) == 0) {
    BOOL v5 = 1;
  }
  int v7 = (*(void *)&v4 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v5;
  if ((*(void *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000) {
    int v7 = 1;
  }
  if ((v7 | v6) == 1) {
LABEL_12:
  }
    double v8 = (void **)(a1 + 32);
  else {
    double v8 = (void **)(a1 + 40);
  }
  double v9 = runInstructionsAndPopResult(*v8, v3);

  return v9;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  pop_0(v3);
  double v5 = v4;
  if (v4 == -31337.0 || (*(void *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    double v5 = runInstructionsAndPopResult(*(void **)(a1 + 32), v3);
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  shouldReturnUndefined_0(v3, *(void *)(a1 + 32));
  unint64_t v4 = *(void *)(a1 + 32);
  if (v5)
  {
    drop_0(v3, v4);
    double v6 = -31337.0;
  }
  else if (v4)
  {
    unint64_t v7 = 0;
    double v6 = 0.0;
    do
    {
      pop_0(v3);
      double v6 = v6 + v8;
      ++v7;
    }
    while (v7 < *(void *)(a1 + 32));
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  shouldReturnUndefined_0(v3, *(void *)(a1 + 32));
  unint64_t v4 = *(void *)(a1 + 32);
  if (v5)
  {
    drop_0(v3, v4);
    double v6 = -31337.0;
  }
  else if (v4)
  {
    unint64_t v7 = 0;
    double v6 = 1.0;
    do
    {
      pop_0(v3);
      double v6 = v6 * v8;
      ++v7;
    }
    while (v7 < *(void *)(a1 + 32));
  }
  else
  {
    double v6 = 1.0;
  }

  return v6;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_8(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(a1 + 32);
  unint64_t v4 = a2;
  shouldReturnUndefined_0(v4, v3);
  if (v5)
  {
    drop_0(v4, *(void *)(a1 + 32));

    return -31337.0;
  }
  else
  {
    unint64_t v7 = *(void *)(a1 + 32);
    double v6 = *(double *)&v4[v4[1] - v7 + 3 + (unint64_t)*(double *)&v4[v4[1] - v7 + 2]];
    drop_0(v4, v7);
  }
  return v6;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_9(uint64_t a1, void *a2)
{
  unint64_t v3 = a2;
  shouldReturnUndefined_0(v3, *(void *)(a1 + 40));
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 40));
    double v5 = -31337.0;
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 40);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    [*(id *)(a1 + 32) predict:&v3[v7 + 2]];
    double v5 = v8;
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_10(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 4032)) {
    return (double)objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  }
  else {
    return 0.0;
  }
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11(uint64_t a1, void *a2)
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  shouldReturnUndefined_0(v3, *(void *)(a1 + 40));
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 40));
    double v5 = -31337.0;
    goto LABEL_26;
  }
  if ([*(id *)(a1 + 32) hasOutputIndexedSubscript])
  {
    pop_0(v3);
    uint64_t v7 = (uint64_t)v6;
  }
  else
  {
    uint64_t v7 = -1;
  }
  uint64_t v38 = v7;
  double v8 = objc_opt_new();
  uint64_t v9 = [*(id *)(a1 + 32) numberOfFeatures];
  if (!v9)
  {
LABEL_17:
    [*(id *)(a1 + 32) predictionForEvaluatedFeatures:v8 withOutputIndexedSubscript:v38];
    double v5 = v22;
    goto LABEL_25;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v39 = v9;
  uint64_t v40 = v8;
  while (1)
  {
    id v12 = [*(id *)(a1 + 32) featureAtIndex:v10 + ~v11];
    v13 = [v12 featureName];
    if ([v12 featureType] == 2)
    {
      pop_0(v3);
      v14 = objc_msgSend(NSNumber, "numberWithDouble:");
      goto LABEL_16;
    }
    if ([v12 featureType] != 5) {
      break;
    }
    uint64_t v41 = v13;
    uint64_t v15 = [v12 multiArraySize];
    id v16 = objc_alloc(MEMORY[0x1E4F1E9A8]);
    uint64_t v17 = [NSNumber numberWithUnsignedInteger:v15];
    v43[0] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
    id v42 = 0;
    v14 = (void *)[v16 initWithShape:v18 dataType:65600 error:&v42];
    id v19 = v42;

    if (v19)
    {
      v30 = __atxlog_handle_default();
      double v8 = v40;
      v13 = v41;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11_cold_1((uint64_t)v19, v30, v31, v32, v33, v34, v35, v36);
      }

      double v5 = -31337.0;
      goto LABEL_24;
    }
    if (v15)
    {
      uint64_t v20 = v15 - 1;
      do
      {
        pop_0(v3);
        v21 = objc_msgSend(NSNumber, "numberWithDouble:");
        [v14 setObject:v21 atIndexedSubscript:v20];

        --v20;
      }
      while (v20 != -1);
    }
    double v8 = v40;
    v13 = v41;
    uint64_t v10 = v39;
LABEL_16:
    [v8 setObject:v14 forKeyedSubscript:v13];

    if (++v11 == v10) {
      goto LABEL_17;
    }
  }
  id v23 = __atxlog_handle_default();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11_cold_2((uint64_t)v13, v23, v24, v25, v26, v27, v28, v29);
  }

  double v5 = -31337.0;
LABEL_24:

LABEL_25:
LABEL_26:

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 2)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v14 handleFailureInFunction:v15, @"_ATXDeprecatedScoreInterpreter.m", 476, @"Invalid parameter not satisfying: %@", @"(2) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (!v4)
  {
    unint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    double v8 = &v3[v7];
    long double v10 = *((double *)v8 + 2);
    long double v9 = *((double *)v8 + 3);
    if (v10 <= 0.0)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
      [v16 handleFailureInFunction:v17, @"_ATXDeprecatedScoreInterpreter.m", 479, @"Invalid parameter not satisfying: %@", @"value > 0" file lineNumber description];
    }
    if (v9 <= 0.0)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      id v19 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
      [v18 handleFailureInFunction:v19, @"_ATXDeprecatedScoreInterpreter.m", 480, @"Invalid parameter not satisfying: %@", @"base > 0" file lineNumber description];
    }
    if (v10 <= 0.0)
    {
      uint64_t v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_ATXScoreInterpreter _runOperator:arity:context:]();
      }
    }
    else
    {
      if (v9 > 0.0)
      {
LABEL_16:
        double v12 = log10(v10);
        double v5 = v12 / log10(v9);
        goto LABEL_17;
      }
      uint64_t v11 = __atxlog_handle_default();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_ATXScoreInterpreter _runOperator:arity:context:]();
      }
    }

    goto LABEL_16;
  }
  drop_0(v3, *(void *)(a1 + 32));
  double v5 = -31337.0;
LABEL_17:

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_81(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 1)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    double v12 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v11 handleFailureInFunction:v12, @"_ATXDeprecatedScoreInterpreter.m", 495, @"Invalid parameter not satisfying: %@", @"(1) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 1uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
    double v5 = -31337.0;
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    long double v8 = *(double *)&v3[v7 + 2];
    if (v8 <= 0.0)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
      [v13 handleFailureInFunction:v14, @"_ATXDeprecatedScoreInterpreter.m", 497, @"Invalid parameter not satisfying: %@", @"value > 0" file lineNumber description];

      long double v9 = __atxlog_handle_default();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_ATXScoreInterpreter _runOperator:arity:context:].cold.5();
      }
    }
    double v5 = log(v8);
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_88(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 2)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v12 handleFailureInFunction:v13, @"_ATXDeprecatedScoreInterpreter.m", 504, @"Invalid parameter not satisfying: %@", @"(2) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
    double v5 = -31337.0;
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    long double v8 = &v3[v7];
    long double v9 = *((double *)v8 + 2);
    long double v10 = *((double *)v8 + 3);
    if (v9 <= 0.0 && (v9 != 0.0 || v10 <= 0.0) && v10 != (double)(int)v10)
    {
      double v14 = *((double *)v8 + 2);
      double v15 = *((double *)v8 + 3);
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v17 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
      [v16 handleFailureInFunction:v17, @"_ATXDeprecatedScoreInterpreter.m", 508, @"Attempted to compute pow(%f, %f)", *(void *)&v14, *(void *)&v15 file lineNumber description];

      v18 = __atxlog_handle_default();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_ATXScoreInterpreter _runOperator:arity:context:].cold.6();
      }

      long double v9 = v14;
      long double v10 = v15;
    }
    double v5 = pow(v9, v10);
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_95(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 2)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    double v12 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v11 handleFailureInFunction:v12, @"_ATXDeprecatedScoreInterpreter.m", 515, @"Invalid parameter not satisfying: %@", @"(2) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    long double v8 = (double *)&v3[v7];
    double v9 = v8[3];
    if (v9 != 0.0)
    {
      double v5 = v8[2] / v9;
      goto LABEL_8;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    double v14 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v13 handleFailureInFunction:v14, @"_ATXDeprecatedScoreInterpreter.m", 518, @"Invalid parameter not satisfying: %@", @"denominator != 0" file lineNumber description];

    double v15 = __atxlog_handle_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_ATXScoreInterpreter _runOperator:arity:context:].cold.4();
    }
  }
  double v5 = -31337.0;
LABEL_8:

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_102(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 3)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v15 handleFailureInFunction:v16, @"_ATXDeprecatedScoreInterpreter.m", 526, @"Invalid parameter not satisfying: %@", @"(3) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 3uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
LABEL_18:
    double v12 = -31337.0;
    goto LABEL_19;
  }
  unint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = v3[1] - v5;
  drop_0(v3, v5);
  unint64_t v7 = (double *)&v3[v6];
  double v9 = v7[2];
  double v8 = v7[3];
  double v10 = v7[4];
  if (v9 < 0.0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v17 handleFailureInFunction:v18, @"_ATXDeprecatedScoreInterpreter.m", 530, @"Invalid parameter not satisfying: %@", @"age >= 0" file lineNumber description];
  }
  if (v8 <= 0.0)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v19 handleFailureInFunction:v20, @"_ATXDeprecatedScoreInterpreter.m", 531, @"Invalid parameter not satisfying: %@", @"halflife > 0" file lineNumber description];
  }
  if (v9 >= 0.0)
  {
    if (v8 <= 0.0)
    {
      v13 = __atxlog_handle_default();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[_ATXScoreInterpreter _runOperator:arity:context:].cold.8();
      }

      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[_ATXScoreInterpreter _runOperator:arity:context:].cold.7();
    }
  }
  double v12 = v10 * exp(v9 * (-0.693147181 / v8));
LABEL_19:

  return v12;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_115(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 2)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v9 handleFailureInFunction:v10, @"_ATXDeprecatedScoreInterpreter.m", 541, @"Invalid parameter not satisfying: %@", @"(2) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
    double v5 = -31337.0;
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    if (*(double *)&v3[v7 + 2] < *(double *)&v3[v7 + 3]) {
      double v5 = 0.0;
    }
    else {
      double v5 = 1.0;
    }
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_119(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 3)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    id v16 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2"];
    [v15 handleFailureInFunction:v16, @"_ATXDeprecatedScoreInterpreter.m", 550, @"Invalid parameter not satisfying: %@", @"(3) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 3uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
LABEL_13:
    double v12 = -31337.0;
    goto LABEL_14;
  }
  unint64_t v5 = *(void *)(a1 + 32);
  unint64_t v6 = v3[1] - v5;
  drop_0(v3, v5);
  unint64_t v7 = (double *)&v3[v6];
  long double v8 = v7[2];
  double v9 = v7[3];
  long double v10 = v7[4];
  if (v10 == 1.0)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2"];
    [v17 handleFailureInFunction:v18, @"_ATXDeprecatedScoreInterpreter.m", 554, @"Invalid parameter not satisfying: %@", @"ratio != 1" file lineNumber description];
  }
  if (v10 < 0.0)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2"];
    [v19 handleFailureInFunction:v20, @"_ATXDeprecatedScoreInterpreter.m", 555, @"Invalid parameter not satisfying: %@", @"ratio >= 0" file lineNumber description];
  }
  if (v10 == 1.0)
  {
    uint64_t v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_119_cold_1();
    }

    goto LABEL_13;
  }
  if (v10 < 0.0 && v8 != (double)(int)v8)
  {
    double v14 = __atxlog_handle_default();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_ATXScoreInterpreter _runOperator:arity:context:]0();
    }
  }
  double v12 = v9 * ((1.0 - pow(v10, v8)) / (1.0 - v10));
LABEL_14:

  return v12;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_129(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 3)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    double v12 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke"];
    [v11 handleFailureInFunction:v12, @"_ATXDeprecatedScoreInterpreter.m", 574, @"Invalid parameter not satisfying: %@", @"(3) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 3uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
    double v5 = -31337.0;
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    long double v8 = (double *)&v3[v7];
    double v9 = v8[3];
    double v5 = v9 / (exp(-(v8[4] * v8[2])) + 1.0);
  }

  return v5;
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_133(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32) != 4)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2"];
    [v16 handleFailureInFunction:v17, @"_ATXDeprecatedScoreInterpreter.m", 581, @"Invalid parameter not satisfying: %@", @"(4) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 4uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
    double v5 = -31337.0;
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    long double v8 = (double *)&v3[v7];
    double v10 = v8[2];
    double v9 = v8[3];
    double v12 = v8[4];
    double v11 = v8[5];
    if (v9 > v11)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      id v19 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"_ATXDeprecatedScoreInterpreter.m", 586, @"ClampToRange: minVal (%f) must be <= defaultVal (%f) ", *(void *)&v9, *(void *)&v11);
    }
    if (v11 > v12)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2"];
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, @"_ATXDeprecatedScoreInterpreter.m", 587, @"ClampToRange: defaultVal (%f) must be <= maxVal (%f) ", *(void *)&v11, *(void *)&v12);
    }
    double v13 = v10;
    if (v10 < v9) {
      double v13 = v9;
    }
    if (v13 >= v12) {
      double v5 = v12;
    }
    else {
      double v5 = v13;
    }
    if (v5 != v10)
    {
      double v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        double v23 = v10;
        __int16 v24 = 2048;
        double v25 = v9;
        __int16 v26 = 2048;
        double v27 = v12;
        __int16 v28 = 2048;
        double v29 = v11;
        __int16 v30 = 2048;
        double v31 = v5;
        _os_log_debug_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEBUG, "ClampToRange(input=%f, min=%f, max=%f, default=%f): input coerced to %f", buf, 0x34u);
      }
    }
  }

  return v5;
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_146(uint64_t a1, void *a2)
{
  id v2 = a2;
  pop_0(v2);
  pop_0(v2);
}

double __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_150(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32) != 2)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    double v13 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2"];
    [v12 handleFailureInFunction:v13, @"_ATXDeprecatedScoreInterpreter.m", 615, @"Invalid parameter not satisfying: %@", @"(2) == arity" file lineNumber description];
  }
  shouldReturnUndefined_0(v3, 2uLL);
  if (v4)
  {
    drop_0(v3, *(void *)(a1 + 32));
    double v5 = -31337.0;
  }
  else
  {
    unint64_t v6 = *(void *)(a1 + 32);
    unint64_t v7 = v3[1] - v6;
    drop_0(v3, v6);
    long double v8 = (double *)&v3[v7];
    double v9 = v8[2];
    double v10 = v8[3];
    if (v9 > v10)
    {
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      double v15 = [NSString stringWithUTF8String:"-[_ATXDeprecatedScoreInterpreter _compileRoot:]_block_invoke_2"];
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"_ATXDeprecatedScoreInterpreter.m", 618, @"RandomUniform: start (%f) must be <= end (%f) ", *(void *)&v9, *(void *)&v10);
    }
    double v5 = v9 + (v10 - v9) * ((double)arc4random_uniform(0xFFFFFFFF) / 4294967300.0);
  }

  return v5;
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Undefined function", v2, v3, v4, v5, v6);
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_11_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __47___ATXDeprecatedScoreInterpreter__compileRoot___block_invoke_2_119_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Attempted to compute GeometricSum with a ratio of 1 -- setting output to _ATXScoreNotSet", v2, v3, v4, v5, v6);
}

@end
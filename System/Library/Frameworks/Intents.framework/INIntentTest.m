@interface INIntentTest
+ (id)executeIntent:(id)a3 withHandler:(id)a4;
@end

@implementation INIntentTest

+ (id)executeIntent:(id)a3 withHandler:(id)a4
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v42 = a4;
  v44 = v5;
  NSLog((NSString *)@"Testing intent:%@ on handler: %@", v5, v42);
  v6 = [[DummyHandlerProvider alloc] initWithHandler:v42];
  v7 = [_INExtensionContext alloc];
  v40 = v6;
  v43 = [(_INExtensionContext *)v7 initWithInputItems:MEMORY[0x1E4F1CBF0] privateIntentHandlerProvider:v6];
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v9 = [v44 identifier];
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke;
  v107[3] = &unk_1E55208F8;
  v10 = v8;
  v108 = v10;
  [(_INExtensionContext *)v43 beginTransactionWithIntentIdentifier:v9 completion:v107];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  v41 = [v44 _intentInstanceDescription];
  LOBYTE(v6) = [v44 _type] == 2;
  v11 = [v41 slotDescriptions];
  v12 = v11;
  if ((v6 & 1) == 0)
  {
    uint64_t v13 = [v11 sortedArrayUsingComparator:&__block_literal_global_20833];

    v12 = (void *)v13;
  }
  v14 = [MEMORY[0x1E4F1CA48] array];
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id v15 = v12;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v103 objects:v109 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v104;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v104 != v17) {
          objc_enumerationMutation(v15);
        }
        v19 = *(void **)(*((void *)&v103 + 1) + 8 * v18);
        if (![v19 isPrivate]) {
          goto LABEL_12;
        }
        if (INIsInternalInstall_onceToken != -1) {
          dispatch_once(&INIsInternalInstall_onceToken, &__block_literal_global_226);
        }
        if (INIsInternalInstall_isInternal)
        {
LABEL_12:
          v20 = [v19 name];
          [v14 addObject:v20];
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v103 objects:v109 count:16];
    }
    while (v16);
  }

  NSLog((NSString *)@"    Resolving parameters: %@", v14);
  NSLog((NSString *)@"    Executing slot resolution...");
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  char v102 = 0;
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__20837;
  v97 = __Block_byref_object_dispose__20838;
  id v98 = 0;
  uint64_t v87 = 0;
  v88 = &v87;
  uint64_t v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__20837;
  v91 = __Block_byref_object_dispose__20838;
  id v92 = 0;
  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);

  v22 = (void *)[v44 copy];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_80;
  v82[3] = &unk_1E5517AC8;
  v84 = &v99;
  v85 = &v93;
  v86 = &v87;
  v23 = v21;
  v83 = v23;
  [(_INExtensionContext *)v43 resolveIntentSlots:v14 forIntent:v22 completionBlock:v82];

  dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  NSLog((NSString *)@"    Updated intent:%@", v94[5]);
  v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend((id)v88[5], "count"));
  v25 = (void *)v88[5];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_2_95;
  v79[3] = &unk_1E5517AF0;
  v81 = &v93;
  id v26 = v24;
  id v80 = v26;
  [v25 enumerateKeysAndObjectsUsingBlock:v79];
  if (!*((unsigned char *)v100 + 24)) {
    [v26 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_100];
  }
  v27 = (void *)[(id)v94[5] copy];
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__20837;
  v77 = __Block_byref_object_dispose__20838;
  id v78 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__20837;
  v71 = __Block_byref_object_dispose__20838;
  id v72 = 0;
  if (*((unsigned char *)v100 + 24))
  {
    dispatch_semaphore_t v28 = dispatch_semaphore_create(0);

    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_4;
    v63[3] = &unk_1E5517B38;
    v65 = &v73;
    v66 = &v67;
    v23 = v28;
    v64 = v23;
    [(_INExtensionContext *)v43 confirmIntent:v27 withCompletion:v63];
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    NSLog((NSString *)@"    Confirmation response:%@ with error: %@", v74[5], v68[5]);
  }
  else
  {
    NSLog((NSString *)@"    Skipping confirmation as parameter resolution was not successful");
  }
  uint64_t v29 = v68[5];
  if (v29) {
    [MEMORY[0x1E4F1CA00] raise:@"Unexpected exception confirming Intent", @"Encountered error confirming intent: \"%@\", error: %@", v27, v29 format];
  }
  v30 = (void *)[(id)v94[5] copy];
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__20837;
  v61 = __Block_byref_object_dispose__20838;
  id v62 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__20837;
  v55 = __Block_byref_object_dispose__20838;
  id v56 = 0;
  v31 = (void *)v74[5];
  if (v31 && [v31 _intentResponseCode] == 1)
  {
    dispatch_semaphore_t v32 = dispatch_semaphore_create(0);

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_5;
    v47[3] = &unk_1E5517B38;
    v49 = &v57;
    v50 = &v51;
    v23 = v32;
    v48 = v23;
    [(_INExtensionContext *)v43 handleIntent:v30 withCompletion:v47];
    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    NSLog((NSString *)@"    Handle response:%@ with error: %@", v58[5], v52[5]);
  }
  else
  {
    NSLog((NSString *)@"    Skipping handle as confirmation was not run or was not successful");
  }
  uint64_t v33 = v52[5];
  if (v33) {
    [MEMORY[0x1E4F1CA00] raise:@"Unexpected exception handling Intent", @"Encountered error handling intent: \"%@\", error: %@", v30, v33 format];
  }
  dispatch_semaphore_t v34 = dispatch_semaphore_create(0);

  v35 = [v44 identifier];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __42__INIntentTest_executeIntent_withHandler___block_invoke_6;
  v45[3] = &unk_1E55208F8;
  v36 = v34;
  v46 = v36;
  [(_INExtensionContext *)v43 completeTransactionWithIntentIdentifier:v35 completion:v45];

  dispatch_semaphore_wait(v36, 0xFFFFFFFFFFFFFFFFLL);
  v37 = [INIntentTestResult alloc];
  v38 = [(INIntentTestResult *)v37 initWithResolvedIntent:v94[5] resolvedParameters:v26 resolvedAllParametersSuccesfully:*((unsigned __int8 *)v100 + 24) confirmResponse:v74[5] handleResponse:v58[5]];

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v93, 8);

  _Block_object_dispose(&v99, 8);

  return v38;
}

intptr_t __42__INIntentTest_executeIntent_withHandler___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_80(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = @"NO";
  if (a2) {
    v9 = @"YES";
  }
  NSLog((NSString *)@"    Slot resolution success:%@", v9);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
  id v15 = v7;

  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v8;
  id v14 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_2_95(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [[INIntentTestResolvedParameter alloc] initWithParameter:v6 forIntent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) extensionContextResolutionResult:v5];

  [*(id *)(a1 + 32) setObject:v7 forKey:v6];
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __42__INIntentTest_executeIntent_withHandler___block_invoke_6(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __42__INIntentTest_executeIntent_withHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v4 = a3;
  id v5 = [v4 extensionContextResolutionResult];
  if ([v5 result] == 1)
  {
    id v6 = [v4 results];

    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:@"Unexpected exception resolving parameter", @"Encountered error resolving parameter: \"%@\"", v7 format];
    }
  }
  else
  {
  }
}

uint64_t __42__INIntentTest_executeIntent_withHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 rank];
  id v6 = [v4 rank];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end
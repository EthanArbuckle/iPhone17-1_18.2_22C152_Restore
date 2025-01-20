@interface CDPDBackupInfoRecoveryFlowController
- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4;
- (CDPDBackupRecoveryErrorProvider)errorProvider;
- (CDPDBackupRecoveryResultsParser)resultParser;
- (NSArray)recoveryRecords;
- (id)_recoveryListFromDevices:(id)a3;
- (void)_updateRecordRecoveryStatusForRecordDictionary:(id)a3;
- (void)beginRecoveryWithCompletion:(id)a3;
- (void)retrieveInflatedDevices:(id)a3;
- (void)secretValidator:(id)a3 didFailRecoveryWithErrors:(id)a4 completion:(id)a5;
- (void)setErrorProvider:(id)a3;
- (void)setRecoveryRecords:(id)a3;
- (void)setResultParser:(id)a3;
@end

@implementation CDPDBackupInfoRecoveryFlowController

- (void)beginRecoveryWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke;
  v6[3] = &unk_26432FA90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CDPDRecoveryFlowController *)self beginRecovery:v6];
}

void __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6
    || [v5 userDidCancel]
    && (_CDPStateError(), (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_3((uint64_t)v7, v8);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9) {
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v7);
    }
  }
  else
  {
    v10 = _CDPLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_2(v5);
    }

    v11 = [*(id *)(a1 + 32) resultParser];
    id v16 = 0;
    v12 = [v11 resultsDictionaryFromRecoveryResult:v5 error:&v16];
    id v13 = v16;

    v14 = _CDPLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_1(v12);
    }

    uint64_t v15 = *(void *)(a1 + 40);
    if (v15) {
      (*(void (**)(uint64_t, void *, id))(v15 + 16))(v15, v12, v13);
    }

    id v7 = 0;
  }
}

- (void)setRecoveryRecords:(id)a3
{
  objc_storeStrong((id *)&self->_recoveryRecords, a3);
  id v5 = a3;
  id v7 = [(CDPDBackupInfoRecoveryFlowController *)self errorProvider];
  uint64_t v6 = [v5 prevailingLocalSecretType];

  [v7 setPrevailingSecret:v6];
}

- (void)retrieveInflatedDevices:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke;
  v7[3] = &unk_26432FB00;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CDPDBackupInfoRecoveryFlowController;
  id v5 = v4;
  [(CDPDRecoveryFlowController *)&v6 retrieveInflatedDevices:v7];
}

void __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F08A98];
  id v9 = a3;
  v10 = [v8 predicateWithBlock:&__block_literal_global_4];
  v11 = [v9 filteredArrayUsingPredicate:v10];

  if (v7)
  {
    v12 = [*(id *)(a1 + 32) errorProvider];
    id v13 = [v12 verficationFailedErrorwithUnderlyingError:v7];

    v14 = [*(id *)(a1 + 32) errorProvider];
    int v15 = [v14 supportsErrorPresentation];

    if (v15)
    {
      id v16 = [*(id *)(a1 + 32) uiProvider];
      v17 = [*(id *)(a1 + 32) recoveryContext];
      v18 = [v17 context];
      v39[0] = MEMORY[0x263EF8330];
      v39[1] = 3221225472;
      v39[2] = __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_3;
      v39[3] = &unk_26432FAD8;
      id v41 = *(id *)(a1 + 40);
      id v40 = v13;
      [v16 cdpContext:v18 showError:v40 withCompletion:v39];

      v19 = v41;
LABEL_4:

LABEL_11:
      goto LABEL_12;
    }
    v25 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_10;
  }
  if (a2 && [v11 count])
  {
    id v13 = [*(id *)(a1 + 32) _recoveryListFromDevices:v11];
    v20 = [v13 objectForKeyedSubscript:&unk_26C9D3010];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      v22 = [*(id *)(a1 + 32) errorProvider];
      v23 = [*(id *)(a1 + 32) errorProvider];
      v24 = [v23 cooldownErrorWithUnderlyingError:0];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_20;
      v37[3] = &unk_26432F318;
      id v38 = *(id *)(a1 + 40);
      [v22 handleSoftLimitError:v24 completion:v37];

      v19 = v38;
      goto LABEL_4;
    }
    v30 = [v13 objectForKeyedSubscript:&unk_26C9D3028];
    v31 = (void *)[v30 copy];
    [*(id *)(a1 + 32) setRecoveryRecords:v31];

    if (![*(id *)(*(void *)(a1 + 32) + 72) count])
    {
      v32 = [*(id *)(a1 + 32) errorProvider];
      v33 = [*(id *)(a1 + 32) errorProvider];
      v34 = [v33 globalHardLimitError];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_24;
      v35[3] = &unk_26432F318;
      id v36 = *(id *)(a1 + 40);
      [v32 handleHardLimitError:v34 completion:v35];

      v19 = v36;
      goto LABEL_4;
    }
    v25 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_10:
    v25();
    goto LABEL_11;
  }
  uint64_t v26 = *(void *)(a1 + 40);
  if (v26)
  {
    v27 = [*(id *)(a1 + 32) errorProvider];
    v28 = _CDPStateError();
    v29 = [v27 recordNotFoundErrorWithUnderlyingError:v28];
    (*(void (**)(uint64_t, void, void, void *))(v26 + 16))(v26, 0, 0, v29);
  }
LABEL_12:
}

BOOL __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 machineID];
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = [v2 recoveryStatus] != 0;
  }

  return v4;
}

uint64_t __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, 0, 0, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__CDPDBackupInfoRecoveryFlowController_retrieveInflatedDevices___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_recoveryListFromDevices:(id)a3
{
  v14[3] = *MEMORY[0x263EF8340];
  v13[0] = &unk_26C9D3028;
  v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  id v5 = [v3 array];
  v14[0] = v5;
  v13[1] = &unk_26C9D3010;
  objc_super v6 = [MEMORY[0x263EFF980] array];
  v14[1] = v6;
  v13[2] = &unk_26C9D3040;
  id v7 = [MEMORY[0x263EFF980] array];
  v14[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__CDPDBackupInfoRecoveryFlowController__recoveryListFromDevices___block_invoke;
  v11[3] = &unk_26432FB28;
  id v9 = v8;
  id v12 = v9;
  [v4 enumerateObjectsUsingBlock:v11];

  return v9;
}

void __65__CDPDBackupInfoRecoveryFlowController__recoveryListFromDevices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "recoveryStatus"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v2 objectForKeyedSubscript:v6];
  [v5 addObject:v4];
}

- (BOOL)secretValidator:(id)a3 shouldContinueValidationAfterError:(id)a4
{
  return objc_msgSend(a4, "isCoolDownError", a3) ^ 1;
}

- (void)secretValidator:(id)a3 didFailRecoveryWithErrors:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(CDPDBackupInfoRecoveryFlowController *)self _updateRecordRecoveryStatusForRecordDictionary:v7];
  id v9 = [v7 allKeys];
  v10 = [(CDPDBackupInfoRecoveryFlowController *)self _recoveryListFromDevices:v9];

  v11 = [v10 objectForKeyedSubscript:&unk_26C9D3010];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    id v13 = [(CDPDBackupInfoRecoveryFlowController *)self errorProvider];
    v14 = [(CDPDBackupInfoRecoveryFlowController *)self errorProvider];
    int v15 = [v14 cooldownErrorWithUnderlyingError:0];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke;
    v45[3] = &unk_26432F318;
    id v46 = v8;
    [v13 handleSoftLimitError:v15 completion:v45];

    id v16 = v46;
  }
  else
  {
    id v16 = [v10 objectForKeyedSubscript:&unk_26C9D3040];
    if ([v16 count])
    {
      v17 = [MEMORY[0x263EFF9C0] set];
      v43[0] = MEMORY[0x263EF8330];
      v43[1] = 3221225472;
      v43[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_2;
      v43[3] = &unk_26432FB28;
      id v18 = v17;
      id v44 = v18;
      [v16 enumerateObjectsUsingBlock:v43];
      recoveryRecords = self->_recoveryRecords;
      v20 = (void *)MEMORY[0x263F08A98];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_3;
      v41[3] = &unk_26432F228;
      id v21 = v18;
      id v42 = v21;
      v22 = [v20 predicateWithBlock:v41];
      v23 = [(NSArray *)recoveryRecords filteredArrayUsingPredicate:v22];
      [(CDPDBackupInfoRecoveryFlowController *)self setRecoveryRecords:v23];

      NSUInteger v24 = [(NSArray *)self->_recoveryRecords count];
      v25 = [(CDPDBackupInfoRecoveryFlowController *)self errorProvider];
      if (v24)
      {
        uint64_t v26 = [v16 firstObject];
        v27 = [v25 hardLimitErrorForRecord:v26];

        v28 = [(CDPDBackupInfoRecoveryFlowController *)self errorProvider];
        LODWORD(v26) = [v28 supportsErrorPresentation];

        if (v26)
        {
          v29 = [(CDPDRecoveryFlowController *)self uiProvider];
          v30 = [(CDPDRecoveryFlowController *)self recoveryContext];
          v31 = [v30 context];
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_5;
          v36[3] = &unk_26432FAD8;
          id v38 = v8;
          id v37 = v7;
          [v29 cdpContext:v31 showError:v27 withCompletion:v36];

          v32 = v38;
        }
        else
        {
          v32 = _CDPStateError();
          (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v32);
        }
      }
      else
      {
        v33 = [(CDPDBackupInfoRecoveryFlowController *)self errorProvider];
        v34 = [v16 firstObject];
        v35 = [v33 globalHardLimitErrorWithRecord:v34];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_4;
        v39[3] = &unk_26432F318;
        id v40 = v8;
        [v25 handleHardLimitError:v35 completion:v39];

        v27 = v40;
      }
    }
    else
    {
      _CDPStateError();
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, id))v8 + 2))(v8, 1, v21);
    }
  }
}

uint64_t __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 recordID];
  [v2 addObject:v3];
}

uint64_t __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 recordID];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__CDPDBackupInfoRecoveryFlowController_secretValidator_didFailRecoveryWithErrors_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  _CDPStateError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)_updateRecordRecoveryStatusForRecordDictionary:(id)a3
{
}

void __87__CDPDBackupInfoRecoveryFlowController__updateRecordRecoveryStatusForRecordDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v4 = a3;
  id v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x263F342B0]])
  {
    id v6 = [v4 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08608]];
  }
  else
  {
    id v7 = v4;
  }

  if ([v7 isICSCRecoveryHardLimitError])
  {
    uint64_t v8 = 2;
  }
  else if ([v7 isRecoveryPETHardLimitError])
  {
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (([v7 isCoolDownError] & 1) != 0 || objc_msgSend(v7, "isRecoveryPETSoftLimitError")) {
    uint64_t v8 = 1;
  }
  [v9 setRecoveryStatus:v8];
}

- (CDPDBackupRecoveryResultsParser)resultParser
{
  return self->_resultParser;
}

- (void)setResultParser:(id)a3
{
}

- (CDPDBackupRecoveryErrorProvider)errorProvider
{
  return self->_errorProvider;
}

- (void)setErrorProvider:(id)a3
{
}

- (NSArray)recoveryRecords
{
  return self->_recoveryRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryRecords, 0);
  objc_storeStrong((id *)&self->_errorProvider, 0);
  objc_storeStrong((id *)&self->_resultParser, 0);
}

void __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 allKeys];
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Recovered data dictionary with keys: %@", v4, v5, v6, v7, 2u);
}

void __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 recoveredInfo];
  OUTLINED_FUNCTION_0_0(&dword_218640000, v2, v3, "Parsing recovered data: %@", v4, v5, v6, v7, 2u);
}

void __68__CDPDBackupInfoRecoveryFlowController_beginRecoveryWithCompletion___block_invoke_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to recover data dictionary: %@", (uint8_t *)&v2, 0xCu);
}

@end
@interface HDMedicationDataDonator
- (BOOL)_checkBuilderAndCancelIfErrorForBuilder:(id)a3 fullStream:(id)a4;
- (BOOL)_medicationUDCHasChangedForUDCArray:(id)a3;
- (BOOL)_registerItemForDonationForConcept:(id)a3 builder:(id)a4 fullStream:(id)a5 error:(id *)a6;
- (BOOL)_registerItemForStream:(id)a3 item:(id)a4 error:(id *)a5;
- (BOOL)donationRequiredOnNextUnlock;
- (BOOL)getDonationRequiredOnNextUnlock;
- (HDMedicationDataDonator)initWithProfile:(id)a3;
- (id)_findPreferredNameForConcept:(id)a3;
- (id)_medicationUserDomainConceptsForProfile:(id)a3 error:(id *)a4;
- (void)_donateActiveConceptsForStream:(id)a3 activeMedications:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_donateIfUDCListChangedForUDCArray:(id)a3 manager:(id)a4;
- (void)_donateWithReason:(id)a3;
- (void)_finishStreamingForStream:(id)a3 completion:(id)a4;
- (void)_performDataDonationForProfile:(id)a3 completion:(id)a4;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)didRecieveThirdPartyMigrationNotification;
- (void)profileDidBecomeReady:(id)a3;
- (void)setDonationRequiredOnNextUnlock:(BOOL)a3;
- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4;
- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4;
@end

@implementation HDMedicationDataDonator

- (HDMedicationDataDonator)initWithProfile:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMedicationDataDonator;
  v5 = [(HDMedicationDataDonator *)&v11 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_profileExtension, v4);
    v6->_donationRequiredOnNextUnlock = 0;
    id v8 = v7;
    v9 = [v4 profile];
    [v9 registerProfileReadyObserver:v6 queue:0];

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (BOOL)getDonationRequiredOnNextUnlock
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_donationRequiredOnNextUnlock;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setDonationRequiredOnNextUnlock:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_donationRequiredOnNextUnlock = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)_performDataDonationForProfile:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((AFDeviceSupportsSiriUOD() & 1) != 0
    || ([MEMORY[0x1E4F2B860] sharedBehavior],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 shouldOverrideSiriUOD],
        v8,
        (v9 & 1) != 0))
  {
    id v19 = 0;
    v10 = [(HDMedicationDataDonator *)self _medicationUserDomainConceptsForProfile:v6 error:&v19];
    id v11 = v19;
    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
      id v18 = v11;
      v13 = [WeakRetained createMedicationsDonatorWithError:&v18];
      id v14 = v18;

      if (v13)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __69__HDMedicationDataDonator__performDataDonationForProfile_completion___block_invoke;
        v15[3] = &unk_1E6338200;
        v15[4] = self;
        id v17 = v7;
        id v16 = v10;
        [v13 donateWithOptions:0 usingDataStream:v15];
      }
      else
      {
        (*((void (**)(id, void, id))v7 + 2))(v7, 0, v14);
      }
    }
    else
    {
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v11);
      id v14 = v11;
    }
  }
  else
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __69__HDMedicationDataDonator__performDataDonationForProfile_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = HKLogMedication();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1BD54A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Preparing to donate all active medications in the user's list.", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) _donateActiveConceptsForStream:v5 activeMedications:*(void *)(a1 + 40) error:v6 completion:*(void *)(a1 + 48)];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__HDMedicationDataDonator__performDataDonationForProfile_completion___block_invoke_cold_1(a1, v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_donateActiveConceptsForStream:(id)a3 activeMedications:(id)a4 error:(id)a5 completion:(id)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v25 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F71FF8]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    while (2)
    {
      uint64_t v18 = 0;
      id v19 = v12;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * v18);
        id v26 = v19;
        BOOL v21 = -[HDMedicationDataDonator _registerItemForDonationForConcept:builder:fullStream:error:](self, "_registerItemForDonationForConcept:builder:fullStream:error:", v20, v13, v10, &v26, v25);
        id v12 = v26;

        if (!v21)
        {
          _HKInitializeLogging();
          v24 = HKLogMedication();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[HDMedicationDataDonator _donateActiveConceptsForStream:activeMedications:error:completion:]((uint64_t)self);
          }

          v23 = v25;
          (*((void (**)(id, void, id))v25 + 2))(v25, 0, v12);

          goto LABEL_13;
        }
        ++v18;
        id v19 = v12;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v22 = self;
  v23 = v25;
  [(HDMedicationDataDonator *)v22 _finishStreamingForStream:v10 completion:v25];
LABEL_13:
}

- (BOOL)_registerItemForDonationForConcept:(id)a3 builder:(id)a4 fullStream:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc(MEMORY[0x1E4F2B200]);
  id v14 = [v10 semanticIdentifier];
  uint64_t v15 = [v14 stringValue];
  uint64_t v16 = (void *)[v13 initWithSemanticIdentifierString:v15];

  uint64_t v17 = [v10 freeTextMedicationName];
  if (v17) {
    [v10 freeTextMedicationName];
  }
  else {
  uint64_t v18 = [(HDMedicationDataDonator *)self _findPreferredNameForConcept:v10];
  }

  id v19 = [v16 underlyingIdentifier];
  id v20 = (id)[v11 setItemType:19 itemId:v19 error:a6];

  if (-[HDMedicationDataDonator _checkBuilderAndCancelIfErrorForBuilder:fullStream:](self, "_checkBuilderAndCancelIfErrorForBuilder:fullStream:", v11, v12)&& (id v21 = (id)[v11 addFieldWithType:850 value:v18 error:a6], -[HDMedicationDataDonator _checkBuilderAndCancelIfErrorForBuilder:fullStream:](self, "_checkBuilderAndCancelIfErrorForBuilder:fullStream:", v11, v12))&& (objc_msgSend(v10, "userSpecifiedName"), v22 = objc_claimAutoreleasedReturnValue(), v23 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(v11,
                                                            "addFieldWithType:value:error:",
                                                            851,
                                                            v22,
                                                            a6)),
        v22,
        [(HDMedicationDataDonator *)self _checkBuilderAndCancelIfErrorForBuilder:v11 fullStream:v12]))
  {
    v24 = [v11 buildItemWithError:a6];
    if (v24)
    {
      BOOL v25 = [(HDMedicationDataDonator *)self _registerItemForStream:v12 item:v24 error:a6];
    }
    else
    {
      [v12 cancel];
      BOOL v25 = 0;
    }
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (BOOL)_registerItemForStream:(id)a3 item:(id)a4 error:(id *)a5
{
  char v7 = [a3 registerItem:a4 error:a5];
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    id v8 = HKLogMedication();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[HDMedicationDataDonator _registerItemForStream:item:error:]((uint64_t)self, a5, v8);
    }
  }
  return v7;
}

- (void)_finishStreamingForStream:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__HDMedicationDataDonator__finishStreamingForStream_completion___block_invoke;
  v8[3] = &unk_1E6338228;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [a3 finish:v8];
}

void __64__HDMedicationDataDonator__finishStreamingForStream_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  id v4 = HKLogMedication();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__HDMedicationDataDonator__finishStreamingForStream_completion___block_invoke_cold_1(a1);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finished data donation.", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_medicationUserDomainConceptsForProfile:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F2B690];
  id v6 = a3;
  int v7 = [v5 medicationUserDomainConceptTypeIdentifier];
  uint64_t v8 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  uint64_t v9 = (void *)MEMORY[0x1E4F65D08];
  v20[0] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v11 = [v9 predicateMatchingAllPredicates:v10];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v13 = [v6 userDomainConceptManager];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__HDMedicationDataDonator__medicationUserDomainConceptsForProfile_error___block_invoke;
  v18[3] = &unk_1E63370A8;
  id v19 = v12;
  id v14 = v12;
  LODWORD(a4) = [v13 enumerateUserDomainConceptsWithPredicate:v11 error:a4 enumerationHandler:v18];

  if (a4) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;

  return v16;
}

uint64_t __73__HDMedicationDataDonator__medicationUserDomainConceptsForProfile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (BOOL)_checkBuilderAndCancelIfErrorForBuilder:(id)a3 fullStream:(id)a4
{
  if (!a3) {
    [a4 cancel];
  }
  return a3 != 0;
}

- (id)_findPreferredNameForConcept:(id)a3
{
  id v3 = [a3 displayNameComponents];
  id v4 = [v3 medicationDisplayName];

  return v4;
}

- (void)profileDidBecomeReady:(id)a3
{
  p_profileExtension = &self->_profileExtension;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v6 = [WeakRetained profile];
  int v7 = [v6 database];
  [v7 addProtectedDataObserver:self];

  id v8 = objc_loadWeakRetained((id *)p_profileExtension);
  uint64_t v9 = [v8 profile];
  id v10 = [v9 userDomainConceptManager];
  [v10 addUserDomainConceptObserver:self queue:0];

  [(HDMedicationDataDonator *)self _donateWithReason:@"Profile did become ready. Triggering data donation."];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(HDMedicationDataDonator *)self donationRequiredOnNextUnlock] && v4)
  {
    [(HDMedicationDataDonator *)self _donateWithReason:@"Did observe protected database becoming ready and donation needed. Triggering data donation."];
  }
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
}

- (void)didRecieveThirdPartyMigrationNotification
{
}

- (void)_donateIfUDCListChangedForUDCArray:(id)a3 manager:(id)a4
{
  if (-[HDMedicationDataDonator _medicationUDCHasChangedForUDCArray:](self, "_medicationUDCHasChangedForUDCArray:", a3, a4))
  {
    [(HDMedicationDataDonator *)self _donateWithReason:@"Did observe change of user domain concept(s) list. Triggering data donation."];
  }
}

- (BOOL)_medicationUDCHasChangedForUDCArray:(id)a3
{
  return objc_msgSend(a3, "hk_containsObjectPassingTest:", &__block_literal_global_17);
}

uint64_t __63__HDMedicationDataDonator__medicationUDCHasChangedForUDCArray___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_donateWithReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogMedication();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1BD54A000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %@", buf, 0x16u);
  }

  [(HDMedicationDataDonator *)self setDonationRequiredOnNextUnlock:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  int v7 = [WeakRetained profile];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__HDMedicationDataDonator__donateWithReason___block_invoke;
  v8[3] = &unk_1E6337EB8;
  v8[4] = self;
  [(HDMedicationDataDonator *)self _performDataDonationForProfile:v7 completion:v8];
}

void __45__HDMedicationDataDonator__donateWithReason___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = HKLogMedication();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __45__HDMedicationDataDonator__donateWithReason___block_invoke_cold_1(a1);
    }

    if (objc_msgSend(v5, "hk_isDatabaseAccessibilityError")) {
      [*(id *)(a1 + 32) setDonationRequiredOnNextUnlock:1];
    }
  }
}

- (BOOL)donationRequiredOnNextUnlock
{
  return self->_donationRequiredOnNextUnlock;
}

- (void).cxx_destruct
{
}

void __69__HDMedicationDataDonator__performDataDonationForProfile_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BD54A000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] [Error] Stream was nil, unable to donate medications.", (uint8_t *)&v3, 0xCu);
}

- (void)_donateActiveConceptsForStream:(uint64_t)a1 activeMedications:error:completion:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v1, v2, "[%{public}@] [Error] Error while registering item for donation, unable to donate medication: %@", (void)v3, DWORD2(v3));
}

- (void)_registerItemForStream:(uint64_t)a1 item:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_1(&dword_1BD54A000, (uint64_t)a2, a3, "[%{public}@] [Error] Failed to register item during data donation %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __64__HDMedicationDataDonator__finishStreamingForStream_completion___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v1, v2, "[%{public}@] [Error] Failed to finish stream during data donation %@", (void)v3, DWORD2(v3));
}

void __45__HDMedicationDataDonator__donateWithReason___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1(&dword_1BD54A000, v1, v2, "[%{public}@] [Error] Failed to donate items due to error: %@", (void)v3, DWORD2(v3));
}

@end
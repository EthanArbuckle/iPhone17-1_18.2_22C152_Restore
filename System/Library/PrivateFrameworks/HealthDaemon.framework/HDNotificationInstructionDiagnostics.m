@interface HDNotificationInstructionDiagnostics
- (BOOL)enumerateAllNotificationInstructionsWithError:(id *)a3 enumerationHandler:(id)a4;
- (HDNotificationInstructionDiagnostics)initWithProfile:(id)a3;
@end

@implementation HDNotificationInstructionDiagnostics

- (HDNotificationInstructionDiagnostics)initWithProfile:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDNotificationInstructionDiagnostics;
  v6 = [(HDNotificationInstructionDiagnostics *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v8 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E4F28D48]);
    formatter = v7->_formatter;
    v7->_formatter = v8;
  }
  return v7;
}

- (BOOL)enumerateAllNotificationInstructionsWithError:(id *)a3 enumerationHandler:(id)a4
{
  id v6 = a4;
  v7 = [(HDProfile *)self->_profile database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105__HDNotificationInstructionDiagnostics_enumerateAllNotificationInstructionsWithError_enumerationHandler___block_invoke;
  v10[3] = &unk_1E62F4620;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:a3 block:v10];

  return (char)a3;
}

BOOL __105__HDNotificationInstructionDiagnostics_enumerateAllNotificationInstructionsWithError_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __105__HDNotificationInstructionDiagnostics_enumerateAllNotificationInstructionsWithError_enumerationHandler___block_invoke_2;
  v9[3] = &unk_1E62F45F8;
  id v6 = *(id *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v6;
  BOOL v7 = +[HDNotificationInstructionEntity enumerateAllNotificationInstructionsWithTransaction:a2 predicate:0 limit:0 ascending:0 error:a3 enumerationHandler:v9];

  return v7;
}

uint64_t __105__HDNotificationInstructionDiagnostics_enumerateAllNotificationInstructionsWithError_enumerationHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = MEMORY[0x1C187C0E0]();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v39 = *(void *)(a1 + 40);
  v40 = (void *)v5;
  v41 = v4;
  if (v6)
  {
    BOOL v7 = (objc_class *)MEMORY[0x1E4F2B270];
    id v8 = v4;
    id v37 = [v7 alloc];
    v42 = [v8 messageIdentifier];
    v9 = *(void **)(v6 + 16);
    v36 = [v8 creationDate];
    id v10 = [v9 stringFromDate:v36];
    id v11 = *(void **)(v6 + 16);
    v35 = [v8 receivedDate];
    v33 = [v11 stringFromDate:v35];
    v12 = *(void **)(v6 + 16);
    v34 = [v8 modificationDate];
    v32 = [v12 stringFromDate:v34];
    v31 = [v8 sendingDeviceName];
    v30 = [v8 sendingDeviceInfo];
    [v8 action];
    v28 = NSStringFromHKNotificationInstructionAction();
    v27 = [v8 clientIdentifier];
    v13 = [v8 categoryIdentifier];
    v14 = *(void **)(v6 + 16);
    v29 = [v8 expirationDate];
    v15 = [v14 stringFromDate:v29];
    v16 = NSString;
    v17 = [v8 criteria];
    v18 = [v16 stringWithFormat:@"%@", v17];
    v19 = NSString;
    LODWORD(v12) = [v8 isInvalid];

    v20 = objc_msgSend(v19, "stringWithFormat:", @"%d", v12);
    v38 = (void *)[v37 initWithMessageIdentifier:v42 creationDate:v10 receivedDate:v33 modificationDate:v32 sendingDeviceName:v31 sendingDeviceInfo:v30 action:v28 clientIdentifier:v27 categoryIdentifier:v13 expirationDate:v15 criteria:v18 isInvalid:v20];
  }
  else
  {
    v38 = 0;
  }
  v43[0] = 0;
  uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, id *))(v39 + 16))(v39, v38, v43);
  id v22 = v43[0];

  if ((v21 & 1) == 0)
  {
    id v23 = v22;
    v24 = v23;
    if (v23)
    {
      if (a3) {
        *a3 = v23;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end
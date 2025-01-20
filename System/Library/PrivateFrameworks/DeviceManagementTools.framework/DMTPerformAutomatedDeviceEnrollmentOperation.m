@interface DMTPerformAutomatedDeviceEnrollmentOperation
+ (BOOL)validateRequest:(id)a3 error:(id *)a4;
- (DMTEnrollmentInitiating)enrollmentInitiator;
- (DMTEnrollmentPrerequisiteReceiving)prerequisiteReceiver;
- (DMTPerformAutomatedDeviceEnrollmentOperation)initWithRequest:(id)a3 prerequisiteReceiver:(id)a4 enrollmentInitiator:(id)a5;
- (void)runWithRequest:(id)a3;
@end

@implementation DMTPerformAutomatedDeviceEnrollmentOperation

- (DMTPerformAutomatedDeviceEnrollmentOperation)initWithRequest:(id)a3 prerequisiteReceiver:(id)a4 enrollmentInitiator:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DMTPerformAutomatedDeviceEnrollmentOperation;
  v11 = [(CATTaskOperation *)&v14 initWithRequest:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_prerequisiteReceiver, a4);
    objc_storeStrong((id *)&v12->_enrollmentInitiator, a5);
  }

  return v12;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___DMTPerformAutomatedDeviceEnrollmentOperation;
  if (!objc_msgSendSuper2(&v16, sel_validateRequest_error_, v6, a4)) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    uint64_t v8 = [v7 nonce];
    if (v8
      && (id v9 = (void *)v8,
          [v7 nonce],
          id v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 length],
          v10,
          v9,
          v11))
    {
      if ([v7 effectiveNetworkConfiguration])
      {
        BOOL v12 = 1;
LABEL_20:

        goto LABEL_21;
      }
      if (_DMTLogGeneral_onceToken_3 != -1) {
        dispatch_once(&_DMTLogGeneral_onceToken_3, &__block_literal_global_4);
      }
      objc_super v14 = (void *)_DMTLogGeneral_logObj_3;
      if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_3, OS_LOG_TYPE_ERROR))
      {
        +[DMTPerformAutomatedDeviceEnrollmentOperation validateRequest:error:](v14, (objc_class *)a1);
        if (a4) {
          goto LABEL_17;
        }
      }
      else if (a4)
      {
LABEL_17:
        v13 = &unk_26E1157C8;
        goto LABEL_12;
      }
    }
    else if (a4)
    {
      v13 = &unk_26E1157A0;
LABEL_12:
      DMTErrorWithCodeAndUserInfo(2, v13);
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
    BOOL v12 = 0;
    goto LABEL_20;
  }
  if (a4)
  {
    DMTErrorWithCodeAndUserInfo(2, &unk_26E115778);
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    BOOL v12 = 0;
  }
LABEL_21:

  return v12;
}

- (void)runWithRequest:(id)a3
{
  id v14 = a3;
  if ([(DMTPerformAutomatedDeviceEnrollmentOperation *)self isExecuting])
  {
    if ([(DMTPerformAutomatedDeviceEnrollmentOperation *)self isCancelled])
    {
      v4 = CATErrorWithCodeAndUserInfo();
      [(DMTPerformAutomatedDeviceEnrollmentOperation *)self endOperationWithError:v4];
    }
    else
    {
      v5 = [(DMTPerformAutomatedDeviceEnrollmentOperation *)self prerequisiteReceiver];
      id v6 = [v14 networkCredential];
      id v7 = [v14 networkPayload];
      uint64_t v8 = [v14 nonce];
      uint64_t v9 = [v14 automationBehavior];
      id v10 = [v14 organizationName];
      uint64_t v11 = [v14 organizationType];
      BOOL v12 = [v14 mdmServerName];
      objc_msgSend(v5, "setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:", v6, v7, v8, v9, v10, v11, v12, objc_msgSend(v14, "effectiveNetworkConfiguration"));

      v13 = [(DMTPerformAutomatedDeviceEnrollmentOperation *)self enrollmentInitiator];
      [v13 beginAutomatedDeviceEnrollment];

      [(DMTPerformAutomatedDeviceEnrollmentOperation *)self endOperationWithResultObject:0];
    }
  }
}

- (DMTEnrollmentPrerequisiteReceiving)prerequisiteReceiver
{
  return self->_prerequisiteReceiver;
}

- (DMTEnrollmentInitiating)enrollmentInitiator
{
  return self->_enrollmentInitiator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentInitiator, 0);
  objc_storeStrong((id *)&self->_prerequisiteReceiver, 0);
}

+ (void)validateRequest:(void *)a1 error:(objc_class *)a2 .cold.1(void *a1, objc_class *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = NSStringFromClass(a2);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_22D3D6000, v3, OS_LOG_TYPE_ERROR, "Both network payloads are missing, failing validation for %{public}@", (uint8_t *)&v5, 0xCu);
}

@end
uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *result = *a2;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_209EDE838();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = a2;
  }
  return result;
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_209EDE838();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t DRSRequestOutcomeForState(uint64_t a1)
{
  if ((unint64_t)(a1 - 4096) < 8) {
    return 3;
  }
  if ((unint64_t)(a1 - 4352) <= 7)
  {
    if (((1 << a1) & 0xED) != 0) {
      return 1;
    }
    return 3;
  }
  if (a1 == 0x2000) {
    return 2;
  }
  else {
    return 0;
  }
}

BOOL DRSRequestStateIsTerminal(uint64_t a1)
{
  return DRSRequestOutcomeForState(a1) != 0;
}

BOOL DRSRequestStateIsErrorOrRejected(uint64_t a1)
{
  return ((DRSRequestOutcomeForState(a1) - 1) & 0xFD) == 0;
}

BOOL DRSRequestStateIsClientFacingError(uint64_t a1)
{
  int v2 = DRSRequestOutcomeForState(a1);
  BOOL v4 = a1 == 4352 || a1 == 4357;
  return v2 == 1 && v4;
}

__CFString *DRSDampeningOutcomeStringForOutcome(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return @"Accepted";
  }
  else {
    return off_263FC9828[a1 - 1];
  }
}

__CFString *DRSRequestDSDecisionStringForDecision(unsigned int a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return off_263FC9868[(char)a1];
  }
}

uint64_t DRSRequestStateForDampeningOutcome(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 8) {
    return 0;
  }
  else {
    return a1 + 4095;
  }
}

uint64_t _deleteFileWithPath(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (v1
    && (char v14 = 0,
        [MEMORY[0x263F08850] defaultManager],
        int v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 fileExistsAtPath:v1 isDirectory:&v14],
        v2,
        v3))
  {
    if (v14)
    {
      BOOL v4 = DPLogHandle_LogManagementError();
      if (os_signpost_enabled(v4))
      {
        *(_DWORD *)buf = 138543362;
        id v16 = v1;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RefusingToDeleteDirectory", "%{public}@ is a directory", buf, 0xCu);
      }

      v5 = DPLogHandle_LogManagementError();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        _deleteFileWithPath_cold_1((uint64_t)v1, v5);
      }
      uint64_t v6 = 0;
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263F08850] defaultManager];
      id v13 = 0;
      uint64_t v6 = [v7 removeItemAtPath:v1 error:&v13];
      v5 = v13;

      if (v6)
      {
        v8 = DPLogHandle_LogManagement();
        if (os_signpost_enabled(v8))
        {
          *(_DWORD *)buf = 138543362;
          id v16 = v1;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DeletedFile", "Deleted %{public}@", buf, 0xCu);
        }
      }
      else
      {
        v8 = DPLogHandle_RequestError();
        if (os_signpost_enabled(v8))
        {
          uint64_t v9 = [v5 localizedDescription];
          unint64_t v10 = (void *)v9;
          int v11 = @"Unknown";
          if (v9) {
            int v11 = (__CFString *)v9;
          }
          *(_DWORD *)buf = 138543618;
          id v16 = v1;
          __int16 v17 = 2114;
          v18 = v11;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemoveFileFailure", "Failed to remove file with path %{public}@ due to error: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

__CFString *DRRequestStateWithoutOutcomeStringForState(uint64_t a1)
{
  if (a1 > 4095)
  {
    switch(a1)
    {
      case 4352:
        id v1 = @"On-receipt work failed";
        break;
      case 4353:
        id v1 = @"Rejected by decision server";
        break;
      case 4354:
        id v1 = @"Log culled/missing";
        break;
      case 4355:
        id v1 = @"Multiple upload failures";
        break;
      case 4356:
        id v1 = @"Customer disabled analytics";
        break;
      case 4357:
        id v1 = @"Log size exceeds cap";
        break;
      case 4358:
        id v1 = @"Invalid state transition";
        break;
      case 4359:
        id v1 = @"Failed to update log file state (mark purgeable and/or delete)";
        break;
      default:
        if (a1 != 0x2000) {
          goto LABEL_12;
        }
        id v1 = @"Uploaded";
        break;
    }
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      id v1 = @"Awaiting upload";
    }
    else if (a1 == 2)
    {
      id v1 = @"Uploading";
    }
    else
    {
LABEL_12:
      id v1 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Unknown state (%#llx"), a1;
    }
  }
  else
  {
    id v1 = @"Awaiting on-receipt work";
  }

  return v1;
}

id DRRequestStateWithOutcomeStringForState(uint64_t a1)
{
  int v2 = DRSRequestOutcomeForState(a1);
  id v3 = [NSString alloc];
  uint64_t v4 = DRRequestStateWithoutOutcomeStringForState(a1);
  v5 = (void *)v4;
  if ((v2 - 1) > 2) {
    uint64_t v6 = @"In-Flight";
  }
  else {
    uint64_t v6 = off_263FC9880[(char)(v2 - 1)];
  }
  uint64_t v7 = (void *)[v3 initWithFormat:@"%@ (%@)", v4, v6];

  return v7;
}

id DRSDictionaryForData(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = 0;
  id v1 = [MEMORY[0x263F08AC0] propertyListWithData:a1 options:0 format:0 error:&v9];
  id v2 = v9;
  if (v2)
  {
    id v3 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v3))
    {
      uint64_t v4 = [v2 localizedDescription];
      *(_DWORD *)buf = 138543362;
      int v11 = v4;
      v5 = "Could not deserialize dictionary due to error: %{public}@";
LABEL_8:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MalformedDictionary", v5, buf, 0xCu);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v1;
      goto LABEL_10;
    }
    id v3 = DPLogHandle_ServiceXPCError();
    if (os_signpost_enabled(v3))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v4 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543362;
      int v11 = v4;
      v5 = "Dict object not of expected class: %{public}@";
      goto LABEL_8;
    }
  }

  id v6 = 0;
LABEL_10:

  return v6;
}

uint64_t DRSRequestExpectedLogStateForState(uint64_t a1, int a2, int a3)
{
  int v6 = DRSRequestOutcomeForState(a1);
  if (!v6 && a2)
  {
    if (!a3 || a1 == 2 && a3 == 1) {
      return 0;
    }
    return a1 != 0;
  }
  if (!v6) {
    return a1 != 0;
  }
  if (v6 == 2) {
    return 2;
  }
  else {
    return 3;
  }
}

void sub_209E7A400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_209E7AC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209E7AFA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E7BAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _minBufferDurationQueue()
{
  if (_minBufferDurationQueue_onceToken != -1) {
    dispatch_once(&_minBufferDurationQueue_onceToken, &__block_literal_global_838);
  }
  v0 = (void *)_minBufferDurationQueue_queue;

  return v0;
}

void ___minBufferDurationQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("DRSTailspin enforce min trace buffer duration queue", 0);
  id v1 = (void *)_minBufferDurationQueue_queue;
  _minBufferDurationQueue_queue = (uint64_t)v0;
}

uint64_t DRSProtoDecisionResultReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = PBReaderReadString();
        v24 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v23;
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        *(unsigned char *)(a1 + 20) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_31;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_33:
        *(unsigned char *)(a1 + 16) = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id DRSRapidErrorWithDescription(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = a1;
  id v2 = NSDictionary;
  id v3 = a1;
  uint64_t v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v5 = [v1 errorWithDomain:@"DRSCKRapidError" code:0 userInfo:v4];

  return v5;
}

id DRSRapidSandboxContainer()
{
  if (DRSRapidSandboxContainer_onceToken != -1) {
    dispatch_once(&DRSRapidSandboxContainer_onceToken, &__block_literal_global_0);
  }
  dispatch_queue_t v0 = (void *)DRSRapidSandboxContainer_container;

  return v0;
}

void __DRSRapidSandboxContainer_block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263EFD620]) initWithContainerIdentifier:@"com.apple.perfpowerservices.rapid" environment:2];
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v2];
  id v1 = (void *)DRSRapidSandboxContainer_container;
  DRSRapidSandboxContainer_container = v0;
}

id DRSRapidProdContainer()
{
  if (DRSRapidProdContainer_onceToken != -1) {
    dispatch_once(&DRSRapidProdContainer_onceToken, &__block_literal_global_15);
  }
  uint64_t v0 = (void *)DRSRapidProdContainer_container;

  return v0;
}

void __DRSRapidProdContainer_block_invoke()
{
  id v2 = (id)[objc_alloc(MEMORY[0x263EFD620]) initWithContainerIdentifier:@"com.apple.perfpowerservices.rapid" environment:1];
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v2];
  id v1 = (void *)DRSRapidProdContainer_container;
  DRSRapidProdContainer_container = v0;
}

void sub_209E7FCE8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

BOOL DRSProtoClientDeviceMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8;
          goto LABEL_25;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
          goto LABEL_25;
        case 3u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 24;
          goto LABEL_25;
        case 4u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
LABEL_25:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0;
          }
LABEL_26:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t DRSProtoFileDescriptionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 16;
      }
      else
      {
        if (v17 == 2)
        {
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)(a1 + 32) |= 1u;
          while (1)
          {
            uint64_t v24 = *v3;
            unint64_t v25 = *(void *)(a2 + v24);
            if (v25 == -1 || v25 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)(a2 + *v7) + v25);
            *(void *)(a2 + v24) = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0) {
              goto LABEL_34;
            }
            v21 += 7;
            BOOL v14 = v22++ >= 9;
            if (v14)
            {
              uint64_t v23 = 0;
              goto LABEL_36;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
          if (*(unsigned char *)(a2 + *v5)) {
            uint64_t v23 = 0;
          }
LABEL_36:
          *(void *)(a1 + 8) = v23;
          continue;
        }
        if (v17 != 1)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
        }
        uint64_t v18 = PBReaderReadString();
        uint64_t v19 = 24;
      }
      uint64_t v20 = *(void **)(a1 + v19);
      *(void *)(a1 + v19) = v18;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL DRSProtoDiagnosticRequestStatsBatchReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 10) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong(a1 + 1, v17);
        if (!PBReaderPlaceMark() || !DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2)) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unint64_t v17 = objc_alloc_init(DRSProtoDiagnosticRequestStats);
    [a1 addRequestsResultsStats:v17];
    if (!PBReaderPlaceMark() || !DRSProtoDiagnosticRequestStatsReadFrom((char *)v17, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t DRSProtoRapidPayloadReplyReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 16;
      }
      else
      {
        if (v17 != 2)
        {
          if (v17 == 1)
          {
            char v18 = 0;
            unsigned int v19 = 0;
            uint64_t v20 = 0;
            *(unsigned char *)(a1 + 28) |= 1u;
            while (1)
            {
              uint64_t v21 = *v3;
              unint64_t v22 = *(void *)(a2 + v21);
              if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
                break;
              }
              char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
              *(void *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0) {
                goto LABEL_34;
              }
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                uint64_t v20 = 0;
                goto LABEL_36;
              }
            }
            *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v20 = 0;
            }
LABEL_36:
            *(unsigned char *)(a1 + 24) = v20 != 0;
          }
          else
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 8;
      }
      char v26 = *(void **)(a1 + v25);
      *(void *)(a1 + v25) = v24;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id DRSSandboxContainer()
{
  if (DRSSandboxContainer_onceToken != -1) {
    dispatch_once(&DRSSandboxContainer_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)DRSSandboxContainer_container;

  return v0;
}

void __DRSSandboxContainer_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFD620]);
  id v3 = (id)[v0 initWithContainerIdentifier:kDRSCloudKitContainerName environment:2];
  uint64_t v1 = [objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v3];
  id v2 = (void *)DRSSandboxContainer_container;
  DRSSandboxContainer_container = v1;
}

id DRSProductionContainer()
{
  if (DRSProductionContainer_onceToken != -1) {
    dispatch_once(&DRSProductionContainer_onceToken, &__block_literal_global_7);
  }
  id v0 = (void *)DRSProductionContainer_container;

  return v0;
}

void __DRSProductionContainer_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFD620]);
  id v3 = (id)[v0 initWithContainerIdentifier:kDRSCloudKitContainerName environment:1];
  uint64_t v1 = [objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v3];
  id v2 = (void *)DRSProductionContainer_container;
  DRSProductionContainer_container = v1;
}

void DRSConfigureOperation(void *a1, void *a2, void *a3)
{
  id v19 = a1;
  v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v19 configuration];
  [v7 setPreferAnonymousRequests:1];

  char v8 = [v19 configuration];
  [v8 setAutomaticallyRetryNetworkFailures:1];

  unsigned int v9 = [v19 configuration];
  [v9 setDiscretionaryNetworkBehavior:0];

  unint64_t v10 = [v19 configuration];
  [v10 setQualityOfService:9];

  uint64_t v11 = [v19 configuration];
  [v11 setContainer:v6];

  unint64_t v12 = [v19 configuration];
  [v12 setXPCActivity:v5];

  if (v5)
  {
    xpc_object_t v13 = xpc_activity_copy_criteria(v5);
    BOOL v14 = v13;
    if (v13)
    {
      int v15 = (const char *)*MEMORY[0x263EF82C8];
      uint64_t v16 = xpc_dictionary_get_value(v13, (const char *)*MEMORY[0x263EF82C8]);

      if (v16)
      {
        BOOL v17 = xpc_dictionary_get_BOOL(v14, v15);
        char v18 = [v19 configuration];
        [v18 setAllowsExpensiveNetworkAccess:!v17];
      }
    }
  }
}

id DRSDeviceMetadata()
{
  if (DRSDeviceMetadata_onceToken != -1) {
    dispatch_once(&DRSDeviceMetadata_onceToken, &__block_literal_global_9);
  }
  id v0 = (void *)DRSDeviceMetadata_deviceMetadata;

  return v0;
}

void __DRSDeviceMetadata_block_invoke()
{
  id v0 = objc_alloc_init(DRSProtoClientDeviceMetadata);
  uint64_t v1 = (void *)DRSDeviceMetadata_deviceMetadata;
  DRSDeviceMetadata_deviceMetadata = (uint64_t)v0;

  id v6 = +[DRSSystemProfile sharedInstance];
  id v2 = [v6 buildVariant];
  [(id)DRSDeviceMetadata_deviceMetadata setBuildVariant:v2];

  id v3 = [v6 deviceCategory];
  [(id)DRSDeviceMetadata_deviceMetadata setDeviceCategory:v3];

  uint64_t v4 = [v6 deviceModel];
  [(id)DRSDeviceMetadata_deviceMetadata setDeviceModel:v4];

  v5 = [v6 platformString];
  [(id)DRSDeviceMetadata_deviceMetadata setPlatform:v5];
}

uint64_t DRValidateCKRecordDictionary(void *a1, void *a2)
{
  v52[1] = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (![v3 count])
  {
    if (a2)
    {
      BOOL v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v51 = *MEMORY[0x263F08320];
      v52[0] = @"'recordDictionary' is nil or empty";
      uint64_t v4 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
      [v17 errorWithDomain:@"MalformedCKRecordDictionaryError" code:0 userInfo:v4];
      uint64_t v16 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    uint64_t v16 = 0;
    goto LABEL_31;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (!v5)
  {
    uint64_t v16 = 1;
    goto LABEL_30;
  }
  uint64_t v6 = v5;
  v33 = a2;
  v34 = v4;
  uint64_t v7 = *(void *)v40;
  uint64_t v32 = *(void *)v40;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v40 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v33)
        {
          uint64_t v25 = (void *)MEMORY[0x263F087E8];
          uint64_t v48 = *MEMORY[0x263F08320];
          v49 = @"'recordDictionary' has a non-NSString key";
          id v11 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          void *v33 = [v25 errorWithDomain:@"MalformedCKRecordDictionaryError" code:0 userInfo:v11];
          goto LABEL_27;
        }
LABEL_28:
        uint64_t v16 = 0;
        goto LABEL_30;
      }
      unint64_t v10 = [v3 objectForKeyedSubscript:v9];
      if (_isSupportedRecordDictionaryValueType(v10)) {
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v33)
        {
          char v26 = NSString;
          v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          v29 = [v26 stringWithFormat:@"'recordDictionary' value of type '%@' for key '%@' is not allowed", v28, v9];

          v30 = (void *)MEMORY[0x263F087E8];
          uint64_t v43 = *MEMORY[0x263F08320];
          v44 = v29;
          v31 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          void *v33 = [v30 errorWithDomain:@"MalformedCKRecordDictionaryError" code:0 userInfo:v31];
        }
        id v11 = v10;
LABEL_27:

        goto LABEL_28;
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v36;
        while (2)
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v11);
            }
            if ((_isSupportedRecordDictionaryValueType(*(void **)(*((void *)&v35 + 1) + 8 * j)) & 1) == 0)
            {
              if (v33)
              {
                char v18 = NSString;
                id v19 = (objc_class *)objc_opt_class();
                uint64_t v20 = NSStringFromClass(v19);
                uint64_t v21 = [v18 stringWithFormat:@"'recordDictionary' value of type '%@' for array with key '%@' is not allowed", v20, v9];

                unint64_t v22 = (void *)MEMORY[0x263F087E8];
                uint64_t v45 = *MEMORY[0x263F08320];
                v46 = v21;
                char v23 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
                void *v33 = [v22 errorWithDomain:@"MalformedCKRecordDictionaryError" code:0 userInfo:v23];
              }
              uint64_t v4 = v34;
              goto LABEL_27;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      uint64_t v4 = v34;
      uint64_t v7 = v32;
LABEL_19:
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v50 count:16];
    uint64_t v16 = 1;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_30:

LABEL_31:
  return v16;
}

uint64_t _isSupportedRecordDictionaryValueType(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

void DRSCoreAnalyticsSendEvent(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = DPLogHandle_Telemetry();
  if (os_signpost_enabled(v5))
  {
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EmittingCATelemetry", "Emitting event %{public}@ with payload:\n%{public}@", (uint8_t *)&v6, 0x16u);
  }

  AnalyticsSendEvent();
}

uint64_t DRSProtoRequestDescriptionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    id v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 40;
          goto LABEL_32;
        case 2u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 32;
          goto LABEL_32;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24;
          goto LABEL_32;
        case 4u:
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          *(unsigned char *)(a1 + 48) |= 1u;
          break;
        case 5u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 16;
LABEL_32:
          char v26 = *(void **)(a1 + v18);
          *(void *)(a1 + v18) = v17;

          continue;
        default:
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          continue;
      }
      while (1)
      {
        uint64_t v23 = *v3;
        unint64_t v24 = *(void *)(a2 + v23);
        if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)(a2 + *v7) + v24);
        *(void *)(a2 + v23) = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_34;
        }
        v20 += 7;
        BOOL v14 = v21++ >= 9;
        if (v14)
        {
          uint64_t v22 = 0;
          goto LABEL_36;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_34:
      if (*(unsigned char *)(a2 + *v5)) {
        uint64_t v22 = 0;
      }
LABEL_36:
      *(void *)(a1 + 8) = v22;
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL DRSProtoDiagnosticRequestStatsBatchReplyReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  int v6 = (int *)MEMORY[0x263F62268];
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
      return v7 == 0;
    }
    if (*(unsigned char *)(a2 + *v5))
    {
      int v7 = 1;
      return v7 == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        LOBYTE(v10) = 0;
        int v7 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v7 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      LOBYTE(v10) = 0;
    }
LABEL_14:
    if (v7) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (v10 & 7) == 4;
    }
    if (v15) {
      return v7 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

BOOL DRSProtoDiagnosticUploadRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 10) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v19 = PBReaderReadString();
        uint64_t v18 = *(DRSProtoRequestDescription **)(a1 + 8);
        *(void *)(a1 + 8) = v19;
        goto LABEL_28;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(DRSProtoRequestDescription);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (DRSProtoRequestDescriptionReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_33;
        }
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = objc_alloc_init(DRSProtoFileDescription);
    [(id)a1 addLogs:v18];
    if (!PBReaderPlaceMark() || (DRSProtoFileDescriptionReadFrom((uint64_t)v18, a2) & 1) == 0)
    {
LABEL_33:

      return 0;
    }
LABEL_26:
    PBReaderRecallMark();
LABEL_28:

    goto LABEL_30;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL DRSProtoTaskingConfigMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3) {
        break;
      }
      if (v17 == 2)
      {
        uint64_t v19 = PBReaderReadString();
        uint64_t v20 = 24;
        goto LABEL_26;
      }
      if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(DRSProtoTaskingDeviceMetadata);
        objc_storeStrong((id *)(a1 + 8), v18);
        if (!PBReaderPlaceMark() || !DRSProtoTaskingDeviceMetadataReadFrom((uint64_t)v18, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v19 = PBReaderReadString();
    uint64_t v20 = 16;
LABEL_26:
    uint64_t v18 = *(DRSProtoTaskingDeviceMetadata **)(a1 + v20);
    *(void *)(a1 + v20) = v19;
LABEL_27:

    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL DRSProtoEnableDataGatheringRequestBatchReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    int v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 10) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        unint64_t v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong(a1 + 1, v17);
        if (!PBReaderPlaceMark() || !DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2)) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    unint64_t v17 = objc_alloc_init(DRSProtoEnableDataGatheringRequest);
    [a1 addDataGatheringRequests:v17];
    if (!PBReaderPlaceMark() || (DRSProtoEnableDataGatheringRequestReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

BOOL DRSProtoDiagnosticRequestStatsReadFrom(char *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  uint64_t v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  int v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      if (v9++ >= 9)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 8;
        goto LABEL_23;
      case 2u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 40;
        goto LABEL_23;
      case 3u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 16;
        goto LABEL_23;
      case 4u:
        uint64_t v17 = PBReaderReadString();
        uint64_t v18 = 24;
LABEL_23:
        uint64_t v19 = *(DRSProtoDiagnosticRequestOutcomeBucket **)&a1[v18];
        *(void *)&a1[v18] = v17;
        goto LABEL_24;
      case 0xAu:
        uint64_t v19 = objc_alloc_init(DRSProtoDiagnosticRequestOutcomeBucket);
        [a1 addOutcomes:v19];
        if (PBReaderPlaceMark()
          && (DRSProtoDiagnosticRequestOutcomeBucketReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_24:

LABEL_25:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_25;
    }
  }
}

void sub_209E8B0F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209E8B534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209E8F0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_209E92154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209E9247C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t DRSRequestDBFilePath(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:kDRSRequestDBFileName];
}

id DRSRequestRemoveDB(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [v1 stringByAppendingPathComponent:kDRSRequestDBFileName];
  id v3 = [v1 stringByAppendingPathComponent:kDRSRequestDBFileWalName];
  id v4 = [v1 stringByAppendingPathComponent:kDRSRequestDBFileShmName];
  uint64_t v5 = _removePathIfExists(v2);
  int v6 = _removePathIfExists(v3);
  uint64_t v7 = _removePathIfExists(v4);
  char v8 = (void *)v7;
  if (v5) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  if (v9 && v7 == 0)
  {
    uint64_t v11 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 138543362;
      char v25 = v1;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemovingRequestDBSuccess", "Removed DB at working directory %{public}@", buf, 0xCu);
    }
    uint64_t v22 = 0;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F089D8] string];
    if (v5)
    {
      uint64_t v12 = [v5 localizedDescription];
      uint64_t v13 = (void *)v12;
      if (v12) {
        uint64_t v14 = (__CFString *)v12;
      }
      else {
        uint64_t v14 = @"Unknown error";
      }
      [v11 appendFormat:@"%@: %@\n", v2, v14];
    }
    if (v6)
    {
      uint64_t v15 = [v6 localizedDescription];
      uint64_t v16 = (void *)v15;
      if (v15) {
        uint64_t v17 = (__CFString *)v15;
      }
      else {
        uint64_t v17 = @"Unknown error";
      }
      [v11 appendFormat:@"%@: %@\n", v3, v17];
    }
    if (v8)
    {
      uint64_t v18 = [v8 localizedDescription];
      uint64_t v19 = (void *)v18;
      if (v18) {
        uint64_t v20 = (__CFString *)v18;
      }
      else {
        uint64_t v20 = @"Unknown error";
      }
      [v11 appendFormat:@"%@: %@\n", v4, v20];
    }
    unsigned int v21 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 138543362;
      char v25 = v11;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RemovingRequestDBFailure", "Failed to remove request DB due to error: %{public}@", buf, 0xCu);
    }

    uint64_t v22 = _coreDataHelperError(v11);
  }

  return v22;
}

id _removePathIfExists(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263F08850] defaultManager];
  if ([v2 fileExistsAtPath:v1])
  {
    id v7 = 0;
    int v3 = [v2 removeItemAtPath:v1 error:&v7];
    id v4 = v7;
    uint64_t v5 = v4;
    if (!v3) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = 0;
LABEL_5:

  return v5;
}

id _coreDataHelperError(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = a1;
  id v2 = NSDictionary;
  id v3 = a1;
  id v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"DRSCoreDataHelperError" code:0 userInfo:v4];

  return v5;
}

uint64_t DRSTaskingDBFilePath(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"DRSTaskingDataModel"];
}

uint64_t DRSCKConfigDBFilePath(void *a1, const char *a2)
{
  return [a1 stringByAppendingPathComponent:@"DRSCKConfigModel"];
}

id _dbFilePath(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 stringByAppendingString:@".sqlite"];
  uint64_t v5 = [v3 stringByAppendingPathComponent:v4];

  return v5;
}

id DRSRequestModelForVersion(int a1, void *a2)
{
  v33[1] = *MEMORY[0x263EF8340];
  if ((a1 - 1) < 3)
  {
    id v3 = off_263FC9C50[(__int16)(a1 - 1)];
    id v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.performance.DiagnosticRequestService"];
    uint64_t v5 = v4;
    if (v4)
    {
      int v6 = [v4 URLForResource:@"DRSDataModel" withExtension:@"momd"];
      if (v6)
      {
        uint64_t v7 = [MEMORY[0x263F086E0] bundleWithURL:v6];
        char v8 = v7;
        if (!v7)
        {
          uint64_t v20 = DPLogHandle_CoreDataError();
          if (os_signpost_enabled(v20))
          {
            unsigned int v21 = [v6 path];
            *(_DWORD *)buf = 138412290;
            v27 = v21;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelBundleCreationFailure", "Failed to create NSBundle from URL: '%@'", buf, 0xCu);
          }
          if (!a2)
          {
            uint64_t v10 = 0;
            goto LABEL_35;
          }
          id v22 = [NSString alloc];
          uint64_t v23 = [v6 path];
          BOOL v9 = (__CFString *)[v22 initWithFormat:@"Failed to create bundle for model URL '%@'", v23];

          _coreDataHelperError(v9);
          uint64_t v10 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        BOOL v9 = [v7 URLForResource:v3 withExtension:@"mom"];
        if (v9)
        {
          uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v9];
          if (!v10)
          {
            uint64_t v11 = DPLogHandle_CoreDataError();
            if (os_signpost_enabled(v11))
            {
              *(_DWORD *)buf = 138543618;
              v27 = v9;
              __int16 v28 = 2112;
              v29 = v3;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelCreationFailure", "Failed instantiate model using URL %{public}@ (model version: '%@')", buf, 0x16u);
            }

            if (a2)
            {
              uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"Failed instantiate model using URL %@", v6];
              uint64_t v13 = (void *)MEMORY[0x263F087E8];
              uint64_t v32 = *MEMORY[0x263F08320];
              v33[0] = v12;
              uint64_t v14 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
              *a2 = [v13 errorWithDomain:@"DRSCoreDataHelperError" code:0 userInfo:v14];
            }
          }
          uint64_t v15 = DPLogHandle_CoreData();
          if (os_signpost_enabled(v15))
          {
            uint64_t v16 = [v10 versionIdentifiers];
            *(_DWORD *)buf = 138543874;
            v27 = v9;
            __int16 v28 = 2112;
            v29 = v3;
            __int16 v30 = 2112;
            v31 = v16;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelCreationSuccess", "Instantiate model using URL %{public}@ (model version: '%@', identifiers: '%@')", buf, 0x20u);
          }
        }
        else
        {
          unint64_t v24 = DPLogHandle_CoreDataError();
          if (os_signpost_enabled(v24))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v3;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelVersionURLFailure", "Failed to get URL for model version '%@'", buf, 0xCu);
          }

          if (!a2)
          {
            uint64_t v10 = 0;
            goto LABEL_34;
          }
          uint64_t v15 = [[NSString alloc] initWithFormat:@"Failed to create URL for model name %@", v3];
          _coreDataHelperError(v15);
          uint64_t v10 = 0;
          *a2 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_34:
        goto LABEL_35;
      }
      uint64_t v19 = DPLogHandle_CoreDataError();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelResourceURLFailure", "Failed to get URL for model bundle", buf, 2u);
      }

      if (a2)
      {
        char v8 = (void *)[[NSString alloc] initWithFormat:@"Failed to create URL for model name %@", @"DRSDataModel"];
        _coreDataHelperError(v8);
        uint64_t v10 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:

        goto LABEL_36;
      }
    }
    else
    {
      int v6 = DPLogHandle_CoreDataError();
      if (os_signpost_enabled(v6))
      {
        *(_DWORD *)buf = 138543362;
        v27 = @"com.apple.performance.DiagnosticRequestService";
        _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FrameworkBundleAccessFailure", "Get bundle for  %{public}@", buf, 0xCu);
      }
    }
    uint64_t v10 = 0;
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v18 = DPLogHandle_CoreDataError();
  if (os_signpost_enabled(v18))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v27) = a1;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRequestModelVersion", "Invalid version: %u", buf, 8u);
  }

  if (a2)
  {
    _coreDataHelperError(@"Invalid Version");
    uint64_t v10 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_37:

  return v10;
}

id _persistentContainerForModel(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  v49[1] = *MEMORY[0x263EF8340];
  id v11 = a1;
  id v32 = a2;
  id v12 = a3;
  uint64_t v13 = [MEMORY[0x263EFF2E8] persistentContainerWithName:v12 managedObjectModel:v11];
  if (v13)
  {
    uint64_t v14 = _dbFilePath(v32, v12);
    uint64_t v15 = [NSURL fileURLWithPath:v14];
    uint64_t v16 = [MEMORY[0x263EFF328] persistentStoreDescriptionWithURL:v15];
    if (v16)
    {
      uint64_t v17 = DPLogHandle_CoreData();
      if (os_signpost_enabled(v17))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v14;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentStoreDescriptionSuccess", "Create NSPersistentStoreDescription with path %{public}@", (uint8_t *)&buf, 0xCu);
      }

      [v16 setReadOnly:a4];
      [v16 setShouldMigrateStoreAutomatically:a5];
      uint64_t v45 = v16;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
      [v13 setPersistentStoreDescriptions:v18];

      dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v41 = 0x3032000000;
      long long v42 = __Block_byref_object_copy__1;
      uint64_t v43 = __Block_byref_object_dispose__1;
      id v44 = 0;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      void v33[2] = ___persistentContainerForModel_block_invoke;
      v33[3] = &unk_263FC9C30;
      p_long long buf = &buf;
      uint64_t v20 = v19;
      v34 = v20;
      [v13 loadPersistentStoresWithCompletionHandler:v33];
      unsigned int v21 = *(void **)(*((void *)&buf + 1) + 40);
      if (v21)
      {
        if (a6) {
          *a6 = v21;
        }
        id v22 = DPLogHandle_CoreDataError();
        if (os_signpost_enabled(v22))
        {
          uint64_t v23 = [*(id *)(*((void *)&buf + 1) + 40) localizedDescription];
          *(_DWORD *)long long v36 = 138543618;
          long long v37 = v14;
          __int16 v38 = 2114;
          long long v39 = v23;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentStoreLoadFailure", "Failed to load persistent store with path '%{public}@' due to error: %{public}@", v36, 0x16u);
        }
        id v24 = 0;
      }
      else
      {
        __int16 v30 = DPLogHandle_CoreData();
        if (os_signpost_enabled(v30))
        {
          *(_DWORD *)long long v36 = 138543362;
          long long v37 = v14;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentStoreLoadSuccess", "Loaded persistent store with path '%{public}@'", v36, 0xCu);
        }

        id v24 = v13;
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v27 = DPLogHandle_CoreDataError();
      if (os_signpost_enabled(v27))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v14;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v27, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentStoreDescriptionFailure", "Failed to create NSPersistentStoreDescription with path %{public}@", (uint8_t *)&buf, 0xCu);
      }

      if (!a6)
      {
        id v24 = 0;
        goto LABEL_24;
      }
      uint64_t v20 = [NSString stringWithFormat:@"Failed to create NSPersistentStoreDescription with path %@", v14];
      __int16 v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v46 = *MEMORY[0x263F08320];
      v47 = v20;
      v29 = [NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      *a6 = [v28 errorWithDomain:@"DRSCoreDataHelperError" code:0 userInfo:v29];

      id v24 = 0;
    }

LABEL_24:
    goto LABEL_25;
  }
  char v25 = DPLogHandle_CoreDataError();
  if (os_signpost_enabled(v25))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = @"DRSDataModel";
    _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PersistentContainerCreationFailure", "Failed to create NSPersistentContainer with name %{public}@", (uint8_t *)&buf, 0xCu);
  }

  if (a6)
  {
    uint64_t v14 = [NSString stringWithFormat:@"Failed to create NSPersistentContainer with name %@", v12, v32];
    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v48 = *MEMORY[0x263F08320];
    v49[0] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v49 forKeys:&v48 count:1];
    [v26 errorWithDomain:@"DRSCoreDataHelperError" code:0 userInfo:v15];
    id v24 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

    goto LABEL_26;
  }
  id v24 = 0;
LABEL_26:

  return v24;
}

void sub_209E93B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void ___persistentContainerForModel_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id DRSRequestPersistentContainerForVersion(int a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  uint64_t v10 = DRSRequestModelForVersion(a1, a5);
  id v11 = v10;
  if (v10)
  {
    id v12 = _persistentContainerForModel(v10, v9, @"DRSDataModel", a3, a4, a5);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

void *DRSRequestPersistentContainer(void *a1, uint64_t a2, void *a3)
{
  return _persistentContainer(a1, @"DRSDataModel", a2, 0, a3);
}

void *_persistentContainer(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  id v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.performance.DiagnosticRequestService"];
  id v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 URLForResource:v10 withExtension:@"momd"];
    if (v13)
    {
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF298]) initWithContentsOfURL:v13];
      uint64_t v15 = v14;
      if (v14)
      {
        a5 = _persistentContainerForModel(v14, v9, v10, a3, a4, a5);
LABEL_17:

        goto LABEL_18;
      }
      dispatch_semaphore_t v19 = DPLogHandle_CoreDataError();
      if (os_signpost_enabled(v19))
      {
        *(_DWORD *)long long buf = 138543362;
        v29 = (__CFString *)v13;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelCreationFailure", "Failed instantiate model using URL %{public}@", buf, 0xCu);
      }

      if (!a5) {
        goto LABEL_17;
      }
      uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"Failed instantiate model using URL %@", v13];
      unsigned int v21 = (void *)MEMORY[0x263F087E8];
      uint64_t v24 = *MEMORY[0x263F08320];
      char v25 = v20;
      id v22 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a5 = [v21 errorWithDomain:@"DRSCoreDataHelperError" code:0 userInfo:v22];

LABEL_16:
      a5 = 0;
      goto LABEL_17;
    }
    uint64_t v16 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ModelResourceFailure", "Failed to get URL for model resource", buf, 2u);
    }

    if (a5)
    {
      uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"Failed to create URL for model name %@", v10];
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v26 = *MEMORY[0x263F08320];
      v27 = v15;
      uint64_t v18 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a5 = [v17 errorWithDomain:@"DRSCoreDataHelperError" code:0 userInfo:v18];

      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v13 = DPLogHandle_CoreDataError();
    if (os_signpost_enabled(v13))
    {
      *(_DWORD *)long long buf = 138543362;
      v29 = @"com.apple.performance.DiagnosticRequestService";
      _os_signpost_emit_with_name_impl(&dword_209E70000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FrameworkBundleAccessFailure", "Get bundle for  %{public}@", buf, 0xCu);
    }
    a5 = 0;
  }
LABEL_18:

  return a5;
}

void *DRSTaskingPersistentContainer(void *a1, uint64_t a2, void *a3)
{
  return _persistentContainer(a1, @"DRSTaskingDataModel", a2, 1, a3);
}

void *DRSCKConfigPersistentContainer(void *a1, uint64_t a2, void *a3)
{
  return _persistentContainer(a1, @"DRSCKConfigModel", a2, 1, a3);
}

void sub_209E95E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_209E96978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_209E976F8(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_209E97B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_209E98FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

void sub_209E9982C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209E9A614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id _acceptingAdminReplyMessage(void *a1)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_BOOL(reply, "AdminRequest_Reply", 1);

  return reply;
}

void sub_209E9BE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E9EAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_209E9ECB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209E9F758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL DRSProtoDiagnosticUploadRequestBatchReadFrom(id *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 10) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong(a1 + 1, v17);
        if (!PBReaderPlaceMark() || !DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2)) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v17 = objc_alloc_init(DRSProtoDiagnosticUploadRequest);
    [a1 addUploadRequests:v17];
    if (!PBReaderPlaceMark() || !DRSProtoDiagnosticUploadRequestReadFrom((uint64_t)v17, a2))
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *DRSStringForServiceState(int a1)
{
  char v1 = @"Waiting for activation";
  if (a1 == 1) {
    char v1 = @"Activated";
  }
  if (a1 == 2) {
    return @"Deactivated";
  }
  else {
    return v1;
  }
}

void DRSRegisterForDeviceUnlockNotification()
{
  if (DRSRegisterForDeviceUnlockNotification_onceToken != -1) {
    dispatch_once(&DRSRegisterForDeviceUnlockNotification_onceToken, &__block_literal_global_5);
  }
}

uint64_t __DRSRegisterForDeviceUnlockNotification_block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  char v1 = (void *)gDRSServiceFirstUnlockSem;
  gDRSServiceFirstUnlockSem = (uint64_t)v0;

  id v2 = MEMORY[0x263EF83A0];

  return notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &_block_invoke_firstUnlockToken, v2, &__block_literal_global_11);
}

uint64_t __DRSRegisterForDeviceUnlockNotification_block_invoke_2()
{
  dispatch_semaphore_t v0 = DPLogHandle_ServiceLifecycle();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)id v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v0, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "FirstUnlockNotification", (const char *)&unk_209EEADD1, v2, 2u);
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)gDRSServiceFirstUnlockSem);
  return notify_cancel(_block_invoke_firstUnlockToken);
}

void DRSWaitForDeviceUnlock()
{
  if (DRSWaitForDeviceUnlock_onceToken != -1) {
    dispatch_once(&DRSWaitForDeviceUnlock_onceToken, &__block_literal_global_13);
  }
}

uint64_t __DRSWaitForDeviceUnlock_block_invoke()
{
  uint64_t result = MKBDeviceUnlockedSinceBoot();
  if (result != 1)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)gDRSServiceFirstUnlockSem, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t result = MKBDeviceUnlockedSinceBoot();
    if (result != 1)
    {
      char v1 = DPLogHandle_ServiceXPCError();
      if (os_signpost_enabled(v1))
      {
        *(_WORD *)id v3 = 0;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v1, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "UnexpectedFirstUnlockNotification", "FATAL ERROR: Service was notified of device unlock, but confirmation of unlock failed", v3, 2u);
      }

      id v2 = DPLogHandle_ServiceXPCError();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
        __DRSWaitForDeviceUnlock_block_invoke_cold_1(v2);
      }

      exit(1);
    }
  }
  return result;
}

BOOL DRSDeviceIsUnlocked()
{
  return MKBDeviceUnlockedSinceBoot() == 1;
}

void DRSConfirmDirectoryIsInitialized(void *a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a1;
  int v6 = a2;
  uint64_t v7 = a3;
  char v8 = [MEMORY[0x263F08850] defaultManager];
  char v38 = 0;
  if ([v8 fileExistsAtPath:v5 isDirectory:&v38])
  {
    if (!v38)
    {
      if (os_signpost_enabled(v7))
      {
        *(_DWORD *)long long buf = 138543362;
        id v40 = v5;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidRequiredDirectory", "FATAL ERROR: %{public}@ exists but is not a directory", buf, 0xCu);
      }
      uint64_t v9 = [[NSString alloc] initWithFormat:@"FATAL ERROR: %@ exists but is not a directory", v5];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        DRSConfirmDirectoryIsInitialized_cold_1(v9, v7);
      }
      goto LABEL_42;
    }
  }
  else
  {
    id v37 = 0;
    char v10 = [v8 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v37];
    id v11 = v37;
    if ((v10 & 1) == 0)
    {
      char v25 = v7;
      if (os_signpost_enabled(v25))
      {
        uint64_t v26 = [v11 localizedDescription];
        v27 = (void *)v26;
        if (v26) {
          __int16 v28 = (__CFString *)v26;
        }
        else {
          __int16 v28 = @"Unknown";
        }
        *(_DWORD *)long long buf = 138543618;
        id v40 = v5;
        __int16 v41 = 2114;
        long long v42 = v28;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RequiredDirectoryFailure", "FATAL ERROR: Failed to create %{public}@ due to error: %{public}@", buf, 0x16u);
      }
      id v29 = [NSString alloc];
      uint64_t v30 = [v11 localizedDescription];
      v31 = (void *)v30;
      if (v30) {
        id v32 = (__CFString *)v30;
      }
      else {
        id v32 = @"Unknown";
      }
      uint64_t v33 = [v29 initWithFormat:@"FATAL ERROR: Failed to create %@ due to error: %@", v5, v32];

      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        DRSConfirmDirectoryIsInitialized_cold_1(v33, v25);
      }
LABEL_42:
      exit(1);
    }
    if (os_signpost_enabled(v6))
    {
      *(_DWORD *)long long buf = 138543362;
      id v40 = v5;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CreatedRequiredDirectory", "Created %{public}@", buf, 0xCu);
    }
  }
  unint64_t v12 = [NSURL fileURLWithPath:v5];
  id v36 = 0;
  uint64_t v13 = *MEMORY[0x263EFF6B0];
  id v35 = 0;
  char v14 = [v12 getResourceValue:&v36 forKey:v13 error:&v35];
  int v15 = v36;
  id v16 = v35;
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 BOOLValue])
    {
      if (os_signpost_enabled(v6))
      {
        *(_DWORD *)long long buf = 138543362;
        id v40 = v5;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingCorrect", "Value for NSURLIsExcludedFromBackupKey of %{public}@ is already correctly set", buf, 0xCu);
      }
LABEL_30:

      goto LABEL_31;
    }
    if (os_signpost_enabled(v7))
    {
      *(_DWORD *)long long buf = 138543618;
      id v40 = v5;
      __int16 v41 = 2114;
      long long v42 = v15;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingIncorrect", "Value for NSURLIsExcludedFromBackupKey of %{public}@ is not correctly set (%{public}@)", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v17 = v7;
    if (os_signpost_enabled(v17))
    {
      uint64_t v18 = [v16 localizedDescription];
      dispatch_semaphore_t v19 = (void *)v18;
      uint64_t v20 = @"Unknown";
      if (v18) {
        uint64_t v20 = (__CFString *)v18;
      }
      *(_DWORD *)long long buf = 138543618;
      id v40 = v5;
      __int16 v41 = 2114;
      long long v42 = v20;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingFetchFailed", "WARNING: Failed to get value for NSURLIsExcludedFromBackupKey for %{public}@ from due to error: %{public}@", buf, 0x16u);
    }
  }

  id v34 = 0;
  char v21 = [v12 setResourceValue:MEMORY[0x263EFFA88] forKey:v13 error:&v34];
  id v16 = v34;
  if ((v21 & 1) == 0)
  {
    int v15 = v7;
    if (os_signpost_enabled(v15))
    {
      uint64_t v22 = [v16 localizedDescription];
      uint64_t v23 = (void *)v22;
      uint64_t v24 = @"Unknown";
      if (v22) {
        uint64_t v24 = (__CFString *)v22;
      }
      *(_DWORD *)long long buf = 138543618;
      id v40 = v5;
      __int16 v41 = 2114;
      long long v42 = v24;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingFailure", "SOFT ERROR: Failed to exclude %{public}@ from backup due to error: %{public}@", buf, 0x16u);
    }
    goto LABEL_30;
  }
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)long long buf = 138543362;
    id v40 = v5;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResourceSettingSuccess", "Set resource to exclude %{public}@ from backup", buf, 0xCu);
  }
LABEL_31:
}

id DRSGetConfigurationDictionary(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v18 = 0;
  dispatch_semaphore_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__3;
  uint64_t v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = __Block_byref_object_copy__3;
  id v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  id v4 = _configAccessQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __DRSGetConfigurationDictionary_block_invoke;
  block[3] = &unk_263FC9C08;
  id v9 = v3;
  char v10 = &v12;
  id v11 = &v18;
  id v5 = v3;
  dispatch_sync(v4, block);

  *a2 = (id) v13[5];
  id v6 = (id)v19[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v6;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

id _configAccessQueue()
{
  if (_configAccessQueue_onceToken != -1) {
    dispatch_once(&_configAccessQueue_onceToken, &__block_literal_global_31);
  }
  dispatch_semaphore_t v0 = (void *)_configAccessQueue_syncQueue;

  return v0;
}

void __DRSGetConfigurationDictionary_block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) stringByAppendingPathComponent:@"DPConfig.plist"];
  char v25 = 0;
  id v3 = [MEMORY[0x263F08850] defaultManager];
  if (![v3 fileExistsAtPath:v2 isDirectory:&v25])
  {
LABEL_12:

    goto LABEL_13;
  }
  if (v25)
  {
    id v4 = DPLogHandle_DPConfigError();
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)long long buf = 138543362;
      v27 = v2;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigFileIsDirectory", "ERROR: Config file at path '%{public}@' is a directory. Clearing it...", buf, 0xCu);
    }

    id v24 = 0;
    char v5 = [v3 removeItemAtPath:v2 error:&v24];
    id v6 = v24;
    id v7 = v24;
    if ((v5 & 1) == 0)
    {
      char v8 = DPLogHandle_DPConfigError();
      if (os_signpost_enabled(v8))
      {
        uint64_t v9 = [v7 localizedDescription];
        char v10 = (void *)v9;
        id v11 = @"Unknown";
        if (v9) {
          id v11 = (__CFString *)v9;
        }
        *(_DWORD *)long long buf = 138543618;
        v27 = v2;
        __int16 v28 = 2114;
        id v29 = v11;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigFileIsDirectoryRemovalFailure", "ERROR: Failed to remove directory at path '%{public}@' due to error: %{public}@", buf, 0x16u);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    }

    goto LABEL_12;
  }

  uint64_t v12 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v2];
  id v23 = 0;
  uint64_t v13 = [NSDictionary dictionaryWithContentsOfURL:v12 error:&v23];
  id v14 = v23;
  id v15 = v23;
  uint64_t v16 = [v13 mutableCopy];
  uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    dispatch_semaphore_t v19 = DPLogHandle_DPConfigError();
    if (os_signpost_enabled(v19))
    {
      uint64_t v20 = [v15 localizedDescription];
      char v21 = (void *)v20;
      uint64_t v22 = @"Unknown";
      if (v20) {
        uint64_t v22 = (__CFString *)v20;
      }
      *(_DWORD *)long long buf = 138543618;
      v27 = v2;
      __int16 v28 = 2114;
      id v29 = v22;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigFileParseFailure", "ERROR: Failed to config file at path '%{public}@' due to error: %{public}@", buf, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v14);
  }

LABEL_13:
}

uint64_t DRSSetConfigurationDictionary(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  *a3 = 0;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  __int16 v28 = __Block_byref_object_dispose__3;
  id v29 = 0;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v7 = [v5 stringByAppendingPathComponent:@"DPConfig.plist"];
  char v8 = _configAccessQueue();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __DRSSetConfigurationDictionary_block_invoke;
  block[3] = &unk_263FC9F58;
  uint64_t v18 = &v20;
  dispatch_semaphore_t v19 = &v24;
  id v15 = v5;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v5;
  dispatch_sync(v8, block);

  *a3 = (id) v25[5];
  uint64_t v12 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void sub_209EA1624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __DRSSetConfigurationDictionary_block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  id v3 = [MEMORY[0x263F08850] defaultManager];
  char v48 = 0;
  if (![v3 fileExistsAtPath:v2 isDirectory:&v48])
  {
LABEL_8:
    id v46 = 0;
    char v10 = [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v46];
    id v9 = v46;
    if (v10)
    {
      id v11 = DPLogHandle_DPConfig();
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)long long buf = 138543362;
        id v50 = v2;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CreatedConfigurationDirectory", "Created %{public}@", buf, 0xCu);
      }

      id v4 = 0;
      char v5 = 1;
      goto LABEL_22;
    }
    uint64_t v12 = DPLogHandle_DPConfigError();
    if (os_signpost_enabled(v12))
    {
      uint64_t v13 = [v9 localizedDescription];
      uint64_t v14 = (void *)v13;
      uint64_t v15 = @"Unknown";
      if (v13) {
        uint64_t v15 = (__CFString *)v13;
      }
      *(_DWORD *)long long buf = 138543618;
      id v50 = v2;
      __int16 v51 = 2114;
      v52 = v15;
      uint64_t v16 = "CreateDirectoryFailure";
      id v17 = "ERROR: Failed to create %{public}@ due to error: %{public}@";
LABEL_20:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v16, v17, buf, 0x16u);

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  if (v48)
  {
    id v4 = 0;
    char v5 = 1;
    goto LABEL_23;
  }
  id v6 = DPLogHandle_DPConfigError();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)long long buf = 138543362;
    id v50 = v2;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigurationDirectoryIsFile", "ERROR: %{public}@ exists but is not a directory", buf, 0xCu);
  }

  id v47 = 0;
  char v7 = [v3 removeItemAtPath:v2 error:&v47];
  id v8 = v47;
  id v9 = v8;
  if (v7)
  {

    goto LABEL_8;
  }
  uint64_t v12 = DPLogHandle_DPConfigError();
  if (os_signpost_enabled(v12))
  {
    uint64_t v18 = [v9 localizedDescription];
    uint64_t v14 = (void *)v18;
    dispatch_semaphore_t v19 = @"Unknown";
    if (v18) {
      dispatch_semaphore_t v19 = (__CFString *)v18;
    }
    *(_DWORD *)long long buf = 138543618;
    id v50 = v2;
    __int16 v51 = 2114;
    v52 = v19;
    uint64_t v16 = "ConfigDirectoryIsFileRemovalFailure";
    id v17 = "ERROR: Failed to remove file that should be the config directory at path '%{public}@' due to error: %{public}@";
    goto LABEL_20;
  }
LABEL_21:

  id v4 = v9;
  char v5 = 0;
  id v9 = v4;
LABEL_22:

LABEL_23:
  id v20 = v4;
  char v21 = v20;
  if (v5)
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v22 = [NSURL fileURLWithPath:*(void *)(a1 + 48)];
      char v23 = *(void **)(a1 + 40);
      id v44 = 0;
      char v24 = [v23 writeToURL:v22 error:&v44];
      id v25 = v44;
      if (v24)
      {
        uint64_t v26 = DPLogHandle_DPConfig();
        if (os_signpost_enabled(v26))
        {
          v27 = *(void **)(a1 + 32);
          __int16 v28 = [*(id *)(a1 + 40) description];
          *(_DWORD *)long long buf = 138543618;
          id v50 = v27;
          __int16 v51 = 2114;
          v52 = v28;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SavedConfiguration", "Saved config to path '%{public}@'. Config:\n%{public}@", buf, 0x16u);
        }
LABEL_33:

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        uint64_t v35 = *(void *)(*(void *)(a1 + 64) + 8);
        id v36 = *(void **)(v35 + 40);
        *(void *)(v35 + 40) = 0;
LABEL_41:

        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v22 = [MEMORY[0x263F08850] defaultManager];
      if (([v22 fileExistsAtPath:*(void *)(a1 + 48)] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8);
        id v25 = *(id *)(v37 + 40);
        *(void *)(v37 + 40) = 0;
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v31 = *(void *)(a1 + 48);
      id v45 = 0;
      char v32 = [v22 removeItemAtPath:v31 error:&v45];
      id v25 = v45;
      uint64_t v26 = DPLogHandle_DPConfigError();
      BOOL v33 = os_signpost_enabled(v26);
      if (v32)
      {
        if (v33)
        {
          id v34 = *(void **)(a1 + 32);
          *(_DWORD *)long long buf = 138543362;
          id v50 = v34;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearedConfigFile", "Cleared config file at path '%{public}@'", buf, 0xCu);
        }
        goto LABEL_33;
      }
      if (v33)
      {
        char v38 = *(void **)(a1 + 32);
        uint64_t v39 = [v25 localizedDescription];
        id v40 = (void *)v39;
        __int16 v41 = @"Unknown";
        if (v39) {
          __int16 v41 = (__CFString *)v39;
        }
        *(_DWORD *)long long buf = 138543618;
        id v50 = v38;
        __int16 v51 = 2114;
        v52 = v41;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearConfigFileFailure", "ERROR: Failed to remove config file at path '%{public}@' due to error: %{public}@", buf, 0x16u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v42 = *(void *)(*(void *)(a1 + 64) + 8);
    id v43 = v25;
    id v36 = *(void **)(v42 + 40);
    *(void *)(v42 + 40) = v43;
    goto LABEL_41;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  uint64_t v29 = *(void *)(*(void *)(a1 + 64) + 8);
  id v30 = v20;
  uint64_t v22 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v30;
LABEL_43:
}

id DRSPidToProcessName(int a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1 < 1)
  {
    char v5 = DPLogHandle_ServiceLifecycleError();
    if (os_signpost_enabled(v5))
    {
      int v9 = 67109120;
      int v10 = a1;
      id v6 = "InvalidPidToProcessName";
      char v7 = "WARNING: Invalid pid (%d) cannot be mapped to a process name";
LABEL_10:
      _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v6, v7, (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t ProcessNameByPID = GetProcessNameByPID();
    id v3 = DPLogHandle_ServiceLifecycle();
    if (os_signpost_enabled(v3))
    {
      int v9 = 67109378;
      int v10 = a1;
      __int16 v11 = 2080;
      uint64_t v12 = ProcessNameByPID;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PidToProcessName", "Mapped client pid %d to process %s", (uint8_t *)&v9, 0x12u);
    }

    if (ProcessNameByPID)
    {
      id v4 = (void *)[[NSString alloc] initWithUTF8String:ProcessNameByPID];
      goto LABEL_12;
    }
    char v5 = DPLogHandle_ServiceLifecycleError();
    if (os_signpost_enabled(v5))
    {
      int v9 = 67109120;
      int v10 = a1;
      id v6 = "GetProcessNameByPIDFailed";
      char v7 = "WARNING: Failed to map pid (%d) to a process name";
      goto LABEL_10;
    }
  }

  id v4 = 0;
LABEL_12:

  return v4;
}

void ___configAccessQueue_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.DiagnosticPipeline configuration access queue", 0);
  char v1 = (void *)_configAccessQueue_syncQueue;
  _configAccessQueue_syncQueue = (uint64_t)v0;
}

uint64_t DRSProtoRapidPayloadReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) >= *(void *)(a2 + (int)*MEMORY[0x263F62288])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  char v7 = (int *)MEMORY[0x263F62268];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v10 >> 3))
    {
      case 1u:
        id v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (PBReaderPlaceMark() && DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2)) {
          goto LABEL_29;
        }
        goto LABEL_44;
      case 2u:
        id v17 = objc_alloc_init(DRSProtoRequestDescription);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (!PBReaderPlaceMark() || (DRSProtoRequestDescriptionReadFrom((uint64_t)v17, a2) & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_29;
      case 3u:
        id v17 = objc_alloc_init(DRSProtoFileDescription);
        objc_storeStrong((id *)(a1 + 24), v17);
        if PBReaderPlaceMark() && (DRSProtoFileDescriptionReadFrom((uint64_t)v17, a2))
        {
LABEL_29:
          PBReaderRecallMark();

LABEL_42:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }
LABEL_44:

        return 0;
      case 4u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 44) |= 1u;
        while (2)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
            *(void *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              BOOL v14 = v20++ >= 9;
              if (v14)
              {
                LODWORD(v21) = 0;
                goto LABEL_41;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_41:
        *(_DWORD *)(a1 + 40) = v21;
        goto LABEL_42;
      case 5u:
        uint64_t v25 = PBReaderReadData();
        uint64_t v26 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v25;

        goto LABEL_42;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_42;
    }
  }
}

uint64_t DRSProtoTaskingConfigCompletionReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    char v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v18 = objc_alloc_init(DRSProtoTaskingConfigMetadata);
              objc_storeStrong((id *)(a1 + 32), v18);
              if (PBReaderPlaceMark() && DRSProtoTaskingConfigMetadataReadFrom((uint64_t)v18, a2))
              {
                PBReaderRecallMark();

                goto LABEL_32;
              }

              return 0;
            case 2u:
              uint64_t v20 = PBReaderReadString();
              uint64_t v21 = 24;
              goto LABEL_26;
            case 3u:
              uint64_t v20 = PBReaderReadString();
              uint64_t v21 = 16;
LABEL_26:
              uint64_t v22 = *(void **)(a1 + v21);
              *(void *)(a1 + v21) = v20;

              goto LABEL_32;
            case 4u:
              *(unsigned char *)(a1 + 40) |= 1u;
              uint64_t v23 = *v3;
              unint64_t v24 = *(void *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + *v4))
              {
                int v25 = *(_DWORD *)(*(void *)(a2 + *v7) + v24);
                *(void *)(a2 + v23) = v24 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v25 = 0;
              }
              *(_DWORD *)(a1 + 8) = v25;
              goto LABEL_32;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_32:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t DRSProtoEnableDataGatheringRequestResponseBatchReadFrom(void *a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    char v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 10)
      {
        BOOL v17 = objc_alloc_init(DRSProtoDecisionResult);
        [a1 addDecisionResults:v17];
        if (!PBReaderPlaceMark() || (DRSProtoDecisionResultReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_209EA52D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, char a19)
{
  objc_destroyWeak(v19);
  _Block_object_dispose(&a19, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t DRSProtoEnableDataGatheringRequestReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    char v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 28) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_35;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            uint64_t v21 = 0;
            goto LABEL_37;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_35:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v21 = 0;
        }
LABEL_37:
        *(unsigned char *)(a1 + 24) = v21 != 0;
      }
      else if (v17 == 2)
      {
        uint64_t v25 = PBReaderReadString();
        uint64_t v26 = *(void **)(a1 + 8);
        *(void *)(a1 + 8) = v25;
      }
      else if (v17 == 1)
      {
        uint64_t v18 = objc_alloc_init(DRSProtoRequestDescription);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || (DRSProtoRequestDescriptionReadFrom((uint64_t)v18, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t DRSProtoDiagnosticRequestOutcomeBucketReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    char v7 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v26 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v27 = *v3;
          unint64_t v28 = *(void *)(a2 + v27);
          if (v28 == -1 || v28 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v7) + v28);
          *(void *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0) {
            goto LABEL_49;
          }
          v24 += 7;
          BOOL v14 = v25++ >= 9;
          if (v14)
          {
            uint64_t v26 = 0;
            goto LABEL_51;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_49:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v26 = 0;
        }
LABEL_51:
        *(void *)(a1 + 8) = v26;
      }
      else
      {
        if (v17 == 2)
        {
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 4u;
          while (1)
          {
            uint64_t v32 = *v3;
            unint64_t v33 = *(void *)(a2 + v32);
            if (v33 == -1 || v33 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v34 = *(unsigned char *)(*(void *)(a2 + *v7) + v33);
            *(void *)(a2 + v32) = v33 + 1;
            v20 |= (unint64_t)(v34 & 0x7F) << v30;
            if ((v34 & 0x80) == 0) {
              goto LABEL_53;
            }
            v30 += 7;
            BOOL v14 = v31++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_55;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_53:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_55:
          uint64_t v36 = 20;
        }
        else
        {
          if (v17 != 1)
          {
            uint64_t result = PBReaderSkipValueWithTag();
            if (!result) {
              return result;
            }
            continue;
          }
          char v18 = 0;
          unsigned int v19 = 0;
          uint64_t v20 = 0;
          *(unsigned char *)(a1 + 24) |= 2u;
          while (1)
          {
            uint64_t v21 = *v3;
            unint64_t v22 = *(void *)(a2 + v21);
            if (v22 == -1 || v22 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_45;
            }
            v18 += 7;
            BOOL v14 = v19++ >= 9;
            if (v14)
            {
              LODWORD(v20) = 0;
              goto LABEL_47;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_45:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v20) = 0;
          }
LABEL_47:
          uint64_t v36 = 16;
        }
        *(_DWORD *)(a1 + v36) = v20;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

__CFString *DRSSystemProfilePlatformStringForPlatform(unsigned int a1)
{
  if (a1 > 6) {
    return @"Unknown";
  }
  else {
    return off_263FCA2D8[(char)a1];
  }
}

id DRSSystemProfileVariantStringForParameters(int a1, int a2, int a3)
{
  id v6 = [NSString alloc];
  char v7 = &stru_26BDF7DE8;
  char v8 = @"Seed";
  if (!a2) {
    char v8 = &stru_26BDF7DE8;
  }
  if (a1)
  {
    unsigned int v9 = @"Internal%@%@";
  }
  else
  {
    char v7 = @"Customer";
    unsigned int v9 = @"%@%@";
  }
  if (a3) {
    char v7 = @"Carrier";
  }
  unint64_t v10 = objc_msgSend(v6, "initWithFormat:", v9, v7, v8);

  return v10;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

uint64_t DRSProtoTaskingSystemMessageReceiptReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    char v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v18 = objc_alloc_init(DRSProtoTaskingDeviceMetadata);
              objc_storeStrong((id *)(a1 + 40), v18);
              if (PBReaderPlaceMark() && DRSProtoTaskingDeviceMetadataReadFrom((uint64_t)v18, a2))
              {
                PBReaderRecallMark();

                goto LABEL_29;
              }

              return 0;
            case 2u:
              uint64_t v20 = PBReaderReadString();
              uint64_t v21 = 48;
              goto LABEL_28;
            case 3u:
              uint64_t v20 = PBReaderReadString();
              uint64_t v21 = 24;
              goto LABEL_28;
            case 4u:
              uint64_t v20 = PBReaderReadString();
              uint64_t v21 = 16;
              goto LABEL_28;
            case 5u:
              uint64_t v20 = PBReaderReadString();
              uint64_t v21 = 8;
LABEL_28:
              unint64_t v22 = *(void **)(a1 + v21);
              *(void *)(a1 + v21) = v20;

              goto LABEL_29;
            case 6u:
              *(unsigned char *)(a1 + 56) |= 1u;
              uint64_t v23 = *v3;
              unint64_t v24 = *(void *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)(a2 + *v4))
              {
                int v25 = *(_DWORD *)(*(void *)(a2 + *v7) + v24);
                *(void *)(a2 + v23) = v24 + 4;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                int v25 = 0;
              }
              *(_DWORD *)(a1 + 32) = v25;
              goto LABEL_29;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_29:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_209EAF4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

__CFString *DRSTaskingStringForTaskingStateChangeReason(unint64_t a1)
{
  if (a1 > 6) {
    return @"Unknown";
  }
  else {
    return off_263FCA420[a1];
  }
}

void sub_209EB2F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_209EB48E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EB509C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DPLogHandle_ClientError()
{
  if (DPLogHandle_ClientError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientError_onceToken, &__block_literal_global_10);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ClientError_handle;

  return v0;
}

id DPLogHandle_AdminError()
{
  if (DPLogHandle_AdminError_onceToken != -1) {
    dispatch_once(&DPLogHandle_AdminError_onceToken, &__block_literal_global_3);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_AdminError_handle;

  return v0;
}

id DPLogHandle_ClientXPCError()
{
  if (DPLogHandle_ClientXPCError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientXPCError_onceToken, &__block_literal_global_6);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ClientXPCError_handle;

  return v0;
}

id DPLogHandle_ClientXPC()
{
  if (DPLogHandle_ClientXPC_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientXPC_onceToken, &__block_literal_global_9_0);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ClientXPC_handle;

  return v0;
}

id DPLogHandle_ClientAPI()
{
  if (DPLogHandle_ClientAPI_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientAPI_onceToken, &__block_literal_global_12);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ClientAPI_handle;

  return v0;
}

id DPLogHandle_ClientAPIError()
{
  if (DPLogHandle_ClientAPIError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientAPIError_onceToken, &__block_literal_global_15_0);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ClientAPIError_handle;

  return v0;
}

id DPLogHandle_CKRecordError()
{
  if (DPLogHandle_CKRecordError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKRecordError_onceToken, &__block_literal_global_18_0);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKRecordError_handle;

  return v0;
}

id DPLogHandle_CKRecord()
{
  if (DPLogHandle_CKRecord_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKRecord_onceToken, &__block_literal_global_21_0);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKRecord_handle;

  return v0;
}

id DPLogHandle_CKRecordUpload()
{
  if (DPLogHandle_CKRecordUpload_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKRecordUpload_onceToken, &__block_literal_global_24);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKRecordUpload_handle;

  return v0;
}

id DPLogHandle_CKInverness()
{
  if (DPLogHandle_CKInverness_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKInverness_onceToken, &__block_literal_global_27);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKInverness_handle;

  return v0;
}

id DPLogHandle_CKInvernessError()
{
  if (DPLogHandle_CKInvernessError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKInvernessError_onceToken, &__block_literal_global_30);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKInvernessError_handle;

  return v0;
}

id DPLogHandle_CKCFUpload()
{
  if (DPLogHandle_CKCFUpload_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKCFUpload_onceToken, &__block_literal_global_33);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKCFUpload_handle;

  return v0;
}

id DPLogHandle_CKCFUploadError()
{
  if (DPLogHandle_CKCFUploadError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKCFUploadError_onceToken, &__block_literal_global_36);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKCFUploadError_handle;

  return v0;
}

id DPLogHandle_ServiceXPCError()
{
  if (DPLogHandle_ServiceXPCError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceXPCError_onceToken, &__block_literal_global_39);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceXPCError_handle;

  return v0;
}

id DPLogHandle_ServiceXPC()
{
  if (DPLogHandle_ServiceXPC_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceXPC_onceToken, &__block_literal_global_42);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceXPC_handle;

  return v0;
}

id DPLogHandle_ServiceLifecycle()
{
  if (DPLogHandle_ServiceLifecycle_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceLifecycle_onceToken, &__block_literal_global_45);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceLifecycle_handle;

  return v0;
}

id DPLogHandle_ServiceLifecycleError()
{
  if (DPLogHandle_ServiceLifecycleError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceLifecycleError_onceToken, &__block_literal_global_48);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceLifecycleError_handle;

  return v0;
}

id DPLogHandle_PermissiveUploadActivity()
{
  if (DPLogHandle_PermissiveUploadActivity_onceToken != -1) {
    dispatch_once(&DPLogHandle_PermissiveUploadActivity_onceToken, &__block_literal_global_51);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_PermissiveUploadActivity_handle;

  return v0;
}

id DPLogHandle_LogManagement()
{
  if (DPLogHandle_LogManagement_onceToken != -1) {
    dispatch_once(&DPLogHandle_LogManagement_onceToken, &__block_literal_global_54);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_LogManagement_handle;

  return v0;
}

id DPLogHandle_LogManagementError()
{
  if (DPLogHandle_LogManagementError_onceToken != -1) {
    dispatch_once(&DPLogHandle_LogManagementError_onceToken, &__block_literal_global_57);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_LogManagementError_handle;

  return v0;
}

id DPLogHandle_DAReporting()
{
  if (DPLogHandle_DAReporting_onceToken != -1) {
    dispatch_once(&DPLogHandle_DAReporting_onceToken, &__block_literal_global_60);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_DAReporting_handle;

  return v0;
}

id DPLogHandle_DAReportingError()
{
  if (DPLogHandle_DAReportingError_onceToken != -1) {
    dispatch_once(&DPLogHandle_DAReportingError_onceToken, &__block_literal_global_63);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_DAReportingError_handle;

  return v0;
}

id DPLogHandle_RequestError()
{
  if (DPLogHandle_RequestError_onceToken != -1) {
    dispatch_once(&DPLogHandle_RequestError_onceToken, &__block_literal_global_66);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_RequestError_handle;

  return v0;
}

id DPLogHandle_Request()
{
  if (DPLogHandle_Request_onceToken != -1) {
    dispatch_once(&DPLogHandle_Request_onceToken, &__block_literal_global_69);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_Request_handle;

  return v0;
}

id DPLogHandle_TailspinError()
{
  if (DPLogHandle_TailspinError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TailspinError_onceToken, &__block_literal_global_72);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TailspinError_handle;

  return v0;
}

id DPLogHandle_Tailspin()
{
  if (DPLogHandle_Tailspin_onceToken != -1) {
    dispatch_once(&DPLogHandle_Tailspin_onceToken, &__block_literal_global_75);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_Tailspin_handle;

  return v0;
}

id DPLogHandle_SubmitLogError()
{
  if (DPLogHandle_SubmitLogError_onceToken != -1) {
    dispatch_once(&DPLogHandle_SubmitLogError_onceToken, &__block_literal_global_78);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_SubmitLogError_handle;

  return v0;
}

id DPLogHandle_SubmitLog()
{
  if (DPLogHandle_SubmitLog_onceToken != -1) {
    dispatch_once(&DPLogHandle_SubmitLog_onceToken, &__block_literal_global_81);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_SubmitLog_handle;

  return v0;
}

id DPLogHandle_SubmitLogToCKContainerError()
{
  if (DPLogHandle_SubmitLogToCKContainerError_onceToken != -1) {
    dispatch_once(&DPLogHandle_SubmitLogToCKContainerError_onceToken, &__block_literal_global_84);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_SubmitLogToCKContainerError_handle;

  return v0;
}

id DPLogHandle_SubmitLogToCKContainer()
{
  if (DPLogHandle_SubmitLogToCKContainer_onceToken != -1) {
    dispatch_once(&DPLogHandle_SubmitLogToCKContainer_onceToken, &__block_literal_global_87);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_SubmitLogToCKContainer_handle;

  return v0;
}

id DPLogHandle_EnableDataGatheringQueryError()
{
  if (DPLogHandle_EnableDataGatheringQueryError_onceToken != -1) {
    dispatch_once(&DPLogHandle_EnableDataGatheringQueryError_onceToken, &__block_literal_global_90);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_EnableDataGatheringQueryError_handle;

  return v0;
}

id DPLogHandle_EnableDataGatheringQuery()
{
  if (DPLogHandle_EnableDataGatheringQuery_onceToken != -1) {
    dispatch_once(&DPLogHandle_EnableDataGatheringQuery_onceToken, &__block_literal_global_93);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_EnableDataGatheringQuery_handle;

  return v0;
}

id DPLogHandle_CoreDataError()
{
  if (DPLogHandle_CoreDataError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CoreDataError_onceToken, &__block_literal_global_96);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CoreDataError_handle;

  return v0;
}

id DPLogHandle_CoreData()
{
  if (DPLogHandle_CoreData_onceToken != -1) {
    dispatch_once(&DPLogHandle_CoreData_onceToken, &__block_literal_global_99);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CoreData_handle;

  return v0;
}

id DPLogHandle_SystemProfileError()
{
  if (DPLogHandle_SystemProfileError_onceToken != -1) {
    dispatch_once(&DPLogHandle_SystemProfileError_onceToken, &__block_literal_global_102);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_SystemProfileError_handle;

  return v0;
}

id DPLogHandle_SystemProfile()
{
  if (DPLogHandle_SystemProfile_onceToken != -1) {
    dispatch_once(&DPLogHandle_SystemProfile_onceToken, &__block_literal_global_105_0);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_SystemProfile_handle;

  return v0;
}

id DPLogHandle_DampeningManager()
{
  if (DPLogHandle_DampeningManager_onceToken != -1) {
    dispatch_once(&DPLogHandle_DampeningManager_onceToken, &__block_literal_global_108);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_DampeningManager_handle;

  return v0;
}

id DPLogHandle_DampeningManagerError()
{
  if (DPLogHandle_DampeningManagerError_onceToken != -1) {
    dispatch_once(&DPLogHandle_DampeningManagerError_onceToken, &__block_literal_global_111);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_DampeningManagerError_handle;

  return v0;
}

id DPLogHandle_TaskingMessage()
{
  if (DPLogHandle_TaskingMessage_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingMessage_onceToken, &__block_literal_global_114);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingMessage_handle;

  return v0;
}

id DPLogHandle_TaskingMessageError()
{
  if (DPLogHandle_TaskingMessageError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingMessageError_onceToken, &__block_literal_global_117);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingMessageError_handle;

  return v0;
}

id DPLogHandle_TaskingDecisionMaker()
{
  if (DPLogHandle_TaskingDecisionMaker_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingDecisionMaker_onceToken, &__block_literal_global_120);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingDecisionMaker_handle;

  return v0;
}

id DPLogHandle_TaskingDecisionMakerError()
{
  if (DPLogHandle_TaskingDecisionMakerError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingDecisionMakerError_onceToken, &__block_literal_global_123);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingDecisionMakerError_handle;

  return v0;
}

id DPLogHandle_ConfigPersistedStore()
{
  if (DPLogHandle_ConfigPersistedStore_onceToken != -1) {
    dispatch_once(&DPLogHandle_ConfigPersistedStore_onceToken, &__block_literal_global_126);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ConfigPersistedStore_handle;

  return v0;
}

id DPLogHandle_ConfigPersistedStoreError()
{
  if (DPLogHandle_ConfigPersistedStoreError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ConfigPersistedStoreError_onceToken, &__block_literal_global_129);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ConfigPersistedStoreError_handle;

  return v0;
}

id DPLogHandle_TaskingManager()
{
  if (DPLogHandle_TaskingManager_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingManager_onceToken, &__block_literal_global_132);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingManager_handle;

  return v0;
}

id DPLogHandle_TaskingManagerError()
{
  if (DPLogHandle_TaskingManagerError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingManagerError_onceToken, &__block_literal_global_135);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingManagerError_handle;

  return v0;
}

id DPLogHandle_TaskingMessageChannel()
{
  if (DPLogHandle_TaskingMessageChannel_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingMessageChannel_onceToken, &__block_literal_global_138);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingMessageChannel_handle;

  return v0;
}

id DPLogHandle_TaskingMessageChannelError()
{
  if (DPLogHandle_TaskingMessageChannelError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingMessageChannelError_onceToken, &__block_literal_global_141);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingMessageChannelError_handle;

  return v0;
}

id DPLogHandle_ClientTaskingXPC()
{
  if (DPLogHandle_ClientTaskingXPC_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientTaskingXPC_onceToken, &__block_literal_global_144);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ClientTaskingXPC_handle;

  return v0;
}

id DPLogHandle_ClientTaskingXPCError()
{
  if (DPLogHandle_ClientTaskingXPCError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientTaskingXPCError_onceToken, &__block_literal_global_147);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ClientTaskingXPCError_handle;

  return v0;
}

id DPLogHandle_ConfigMonitor()
{
  if (DPLogHandle_ConfigMonitor_onceToken != -1) {
    dispatch_once(&DPLogHandle_ConfigMonitor_onceToken, &__block_literal_global_150);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ConfigMonitor_handle;

  return v0;
}

id DPLogHandle_ConfigMonitorError()
{
  if (DPLogHandle_ConfigMonitorError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ConfigMonitorError_onceToken, &__block_literal_global_153);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ConfigMonitorError_handle;

  return v0;
}

id DPLogHandle_ServiceTasking()
{
  if (DPLogHandle_ServiceTasking_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceTasking_onceToken, &__block_literal_global_156);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceTasking_handle;

  return v0;
}

id DPLogHandle_ServiceTaskingError()
{
  if (DPLogHandle_ServiceTaskingError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceTaskingError_onceToken, &__block_literal_global_159);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceTaskingError_handle;

  return v0;
}

id DPLogHandle_ServiceTaskingXPC()
{
  if (DPLogHandle_ServiceTaskingXPC_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceTaskingXPC_onceToken, &__block_literal_global_162);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceTaskingXPC_handle;

  return v0;
}

id DPLogHandle_ServiceTaskingXPCError()
{
  if (DPLogHandle_ServiceTaskingXPCError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceTaskingXPCError_onceToken, &__block_literal_global_165);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceTaskingXPCError_handle;

  return v0;
}

id DPLogHandle_ServiceEventPublisher()
{
  if (DPLogHandle_ServiceEventPublisher_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceEventPublisher_onceToken, &__block_literal_global_168);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceEventPublisher_handle;

  return v0;
}

id DPLogHandle_ServiceEventPublisherError()
{
  if (DPLogHandle_ServiceEventPublisherError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceEventPublisherError_onceToken, &__block_literal_global_171);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_ServiceEventPublisherError_handle;

  return v0;
}

id DPLogHandle_Telemetry()
{
  if (DPLogHandle_Telemetry_onceToken != -1) {
    dispatch_once(&DPLogHandle_Telemetry_onceToken, &__block_literal_global_174);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_Telemetry_handle;

  return v0;
}

id DPLogHandle_TaskingDSTelemetry()
{
  if (DPLogHandle_TaskingDSTelemetry_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingDSTelemetry_onceToken, &__block_literal_global_177);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_TaskingDSTelemetry_handle;

  return v0;
}

id DPLogHandle_CKConfig()
{
  if (DPLogHandle_CKConfig_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKConfig_onceToken, &__block_literal_global_180_0);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKConfig_handle;

  return v0;
}

id DPLogHandle_CKConfigError()
{
  if (DPLogHandle_CKConfigError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKConfigError_onceToken, &__block_literal_global_183);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_CKConfigError_handle;

  return v0;
}

id DPLogHandle_UploadSessionDate()
{
  if (DPLogHandle_UploadSessionDate_onceToken != -1) {
    dispatch_once(&DPLogHandle_UploadSessionDate_onceToken, &__block_literal_global_186);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_UploadSessionDate_handle;

  return v0;
}

id DPLogHandle_UploadSessionDateError()
{
  if (DPLogHandle_UploadSessionDateError_onceToken != -1) {
    dispatch_once(&DPLogHandle_UploadSessionDateError_onceToken, &__block_literal_global_189);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_UploadSessionDateError_handle;

  return v0;
}

id DPLogHandle_DPConfig()
{
  if (DPLogHandle_DPConfig_onceToken != -1) {
    dispatch_once(&DPLogHandle_DPConfig_onceToken, &__block_literal_global_192);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_DPConfig_handle;

  return v0;
}

id DPLogHandle_DPConfigError()
{
  if (DPLogHandle_DPConfigError_onceToken != -1) {
    dispatch_once(&DPLogHandle_DPConfigError_onceToken, &__block_literal_global_195);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_DPConfigError_handle;

  return v0;
}

id DPLogHandle_DRSConfig()
{
  if (DPLogHandle_DRSConfig_onceToken != -1) {
    dispatch_once(&DPLogHandle_DRSConfig_onceToken, &__block_literal_global_198);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_DRSConfig_handle;

  return v0;
}

id DPLogHandle_DRSConfigError()
{
  if (DPLogHandle_DRSConfigError_onceToken != -1) {
    dispatch_once(&DPLogHandle_DRSConfigError_onceToken, &__block_literal_global_201);
  }
  dispatch_queue_t v0 = (void *)DPLogHandle_DRSConfigError_handle;

  return v0;
}

__CFString *DRConfigCompletionTypeString(uint64_t a1)
{
  if (a1 > 4096)
  {
    switch(a1)
    {
      case 8193:
        uint64_t result = @"Invalidated";
        break;
      case 8194:
        uint64_t result = @"Expired";
        break;
      case 8195:
        uint64_t result = @"ExternallyCancelled";
        break;
      case 8196:
        uint64_t result = @"ClientCompleted";
        break;
      default:
        if (a1 != 4097) {
          return @"UnknownCompletionType";
        }
        uint64_t result = @"NotComplete";
        break;
    }
  }
  else if (a1)
  {
    if (a1 == 1)
    {
      return @"Rejected";
    }
    else if (a1 == 2)
    {
      return @"TaskingDisabled";
    }
    else
    {
      return @"UnknownCompletionType";
    }
  }
  else
  {
    return @"Invalid";
  }
  return result;
}

void sub_209EBA318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

id _base64EncodedMD5Digest(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v1 = (id) MEMORY[0x270FA5388]();
    id v2 = (const void *)[v1 UTF8String];
    CC_LONG v3 = [v1 lengthOfBytesUsingEncoding:4];

    CC_MD5(v2, v3, v7);
    id v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:16];
    char v5 = [v4 base64EncodedStringWithOptions:0];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

void sub_209EBBF48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_209EBC374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209EBC8E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EBCF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EBD88C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EBDDB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_209EBE064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EBE9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EBECD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL DRSProtoTaskingDeviceMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  CC_LONG v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    char v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(DRSProtoClientDeviceMetadata);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || !DRSProtoClientDeviceMetadataReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v17 = *(DRSProtoClientDeviceMetadata **)(a1 + 8);
    *(void *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t _oneIsNil(uint64_t a1, uint64_t a2)
{
  return (a1 != 0) ^ (a2 != 0);
}

BOOL DRSProtoTaskingConfigReceiptReadFrom(uint64_t a1, uint64_t a2)
{
  CC_LONG v3 = (int *)MEMORY[0x263F62298];
  id v4 = (int *)MEMORY[0x263F62288];
  char v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    char v7 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 2) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = objc_alloc_init(DRSProtoTaskingConfigMetadata);
        objc_storeStrong((id *)(a1 + 16), v17);
        if (!PBReaderPlaceMark() || !DRSProtoTaskingConfigMetadataReadFrom((uint64_t)v17, a2))
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    uint64_t v18 = PBReaderReadString();
    uint64_t v17 = *(DRSProtoTaskingConfigMetadata **)(a1 + 8);
    *(void *)(a1 + 8) = v18;
LABEL_24:

    goto LABEL_26;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void sub_209EC152C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EC22E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EC2B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _checkCancelNonNil(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    id v4 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v4))
    {
      int v6 = 136446210;
      uint64_t v7 = a2;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRSCancelTaskingMessageFailedInit", "nil '%{public}s' when trying to instantiate 'DRCancelTaskingMessage'", (uint8_t *)&v6, 0xCu);
    }
  }
  return a1 != 0;
}

void sub_209EC3870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DRSTaskingSystemMessageFromJSONData(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v9 = 0;
  id v1 = [MEMORY[0x263F08900] JSONObjectWithData:a1 options:0 error:&v9];
  id v2 = v9;
  if (v1)
  {
    CC_LONG v3 = DRSTaskingSystemMessageFromJSONDict(v1);
  }
  else
  {
    id v4 = DPLogHandle_TaskingManagerError();
    if (os_signpost_enabled(v4))
    {
      uint64_t v5 = [v2 localizedDescription];
      int v6 = (void *)v5;
      uint64_t v7 = @"Unknown";
      if (v5) {
        uint64_t v7 = (__CFString *)v5;
      }
      *(_DWORD *)long long buf = 138543362;
      uint64_t v11 = v7;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONData", "Could not process JSON data due to error %{public}@", buf, 0xCu);
    }
    CC_LONG v3 = 0;
  }

  return v3;
}

id DRSTaskingSystemMessageFromJSONDict(void *a1)
{
  id v1 = a1;
  if (+[DRSTaskingSystemMessage isJSONDictForClass:v1])
  {
    id v2 = DRSTaskingMessage;
LABEL_7:
    CC_LONG v3 = (void *)[[v2 alloc] initWithJSONDict:v1];
    goto LABEL_8;
  }
  if (+[DRSTaskingSystemMessage isJSONDictForClass:v1])
  {
    id v2 = DRSCancelTaskingMessage;
    goto LABEL_7;
  }
  if (+[DRSTaskingSystemMessage isJSONDictForClass:v1])
  {
    id v2 = DRSPopulationPingMessage;
    goto LABEL_7;
  }
  uint64_t v5 = DPLogHandle_TaskingMessageError();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONDict", "Unknown JSON message", v6, 2u);
  }

  CC_LONG v3 = 0;
LABEL_8:

  return v3;
}

NSObject *_dateFromJSONDict(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKeyedSubscript:a2];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CC_LONG v3 = (void *)MEMORY[0x263EFF910];
      [v2 doubleValue];
      id v4 = objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
      uint64_t v5 = v4;
      if (v4)
      {
        uint64_t v5 = v4;
        int v6 = v5;
      }
      else
      {
        uint64_t v7 = DPLogHandle_TaskingMessageError();
        if (os_signpost_enabled(v7)) {
          _os_signpost_emit_unreliably_with_name_impl();
        }

        int v6 = 0;
      }
    }
    else
    {
      uint64_t v5 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v5)) {
        _os_signpost_emit_unreliably_with_name_impl();
      }
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

void sub_209EC4ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EC625C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 128), 8);
  _Unwind_Resume(a1);
}

id _dampeningManagerError(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v1 = (void *)MEMORY[0x263F087E8];
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = a1;
  id v2 = NSDictionary;
  id v3 = a1;
  id v4 = [v2 dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v1 errorWithDomain:@"DRSDampeningManagerError" code:0 userInfo:v4];

  return v5;
}

void sub_209EC743C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209EC95A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209ECBBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_209ECC4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_209ECC8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_209ECD4DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_209ECD874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 104), 8);
  _Unwind_Resume(a1);
}

uint64_t RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.__allocating_init(request:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267605068);
  MEMORY[0x270FA5388]();
  id v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_allocWithZone(v1);
  sub_209ECFC28(a1, (uint64_t)v4, &qword_267605068);
  uint64_t v6 = sub_209EDE808();
  sub_209ECFC8C(a1, &qword_267605068);
  return v6;
}

uint64_t RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.init(request:)(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_267605068);
  MEMORY[0x270FA5388]();
  sub_209ECFC28(a1, (uint64_t)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_267605068);
  uint64_t v3 = sub_209EDE808();
  sub_209ECFC8C(a1, &qword_267605068);
  return v3;
}

void RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.__allocating_init(functionName:request:)()
{
}

void RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.init(functionName:request:)()
{
}

id RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t RapidCloudFunctionServiceAPIAsync.submitRapidPayload(deviceMetadata:payloadMetadata:payloadDescription:uploadAttempts:payload:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v22 = a8;
  uint64_t v21 = a7;
  uint64_t v16 = type metadata accessor for RapidPayload(0);
  MEMORY[0x270FA5388](v16);
  uint64_t v18 = (char *)&v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = a1;
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  int v26 = a4;
  char v27 = BYTE4(a4) & 1;
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  sub_209ECF890();
  sub_209EDE908();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(a10 + 8))(v18, v21, v22, a9, a10);
  return sub_209ECFE10((uint64_t)v18, type metadata accessor for RapidPayload);
}

uint64_t sub_209ECF30C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v50 = a5;
  unint64_t v51 = a7;
  uint64_t v42 = a6;
  uint64_t v43 = a2;
  uint64_t v48 = a4;
  uint64_t v44 = a1;
  uint64_t v45 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v49 = (uint64_t)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FileDescription(0);
  uint64_t v46 = *(void *)(v8 - 8);
  uint64_t v47 = v8;
  uint64_t v9 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v41 = (uint64_t)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v40 = (uint64_t)&v38 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v14 = (char *)&v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for RequestDescription(0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v15);
  uint64_t v39 = (uint64_t)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v38 - v19;
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
  MEMORY[0x270FA5388](v21 - 8);
  uint64_t v23 = (char *)&v38 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v25 = *(void *)(v24 - 8);
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  uint64_t v28 = (char *)&v38 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v26);
  char v30 = (char *)&v38 - v29;
  sub_209ECFC28(v43, (uint64_t)v23, &qword_267605088);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_209ECFC8C((uint64_t)v23, &qword_267605088);
  }
  else
  {
    sub_209ECFD40((uint64_t)v23, (uint64_t)v30, type metadata accessor for ClientDeviceMetadata);
    sub_209ECFDA8((uint64_t)v30, (uint64_t)v28, type metadata accessor for ClientDeviceMetadata);
    RapidPayload.deviceMetadata.setter((uint64_t)v28);
    sub_209ECFE10((uint64_t)v30, type metadata accessor for ClientDeviceMetadata);
  }
  sub_209ECFC28(v45, (uint64_t)v14, &qword_267605080);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_209ECFC8C((uint64_t)v14, &qword_267605080);
  }
  else
  {
    sub_209ECFD40((uint64_t)v14, (uint64_t)v20, type metadata accessor for RequestDescription);
    uint64_t v31 = v39;
    sub_209ECFDA8((uint64_t)v20, v39, type metadata accessor for RequestDescription);
    RapidPayload.payloadMetadata.setter(v31);
    sub_209ECFE10((uint64_t)v20, type metadata accessor for RequestDescription);
  }
  uint64_t v32 = v49;
  sub_209ECFC28(v48, v49, &qword_267605078);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v32, 1, v47) != 1)
  {
    uint64_t v35 = v40;
    sub_209ECFD40(v32, v40, type metadata accessor for FileDescription);
    uint64_t v36 = v41;
    sub_209ECFDA8(v35, v41, type metadata accessor for FileDescription);
    RapidPayload.payloadDescription.setter(v36);
    sub_209ECFE10(v35, type metadata accessor for FileDescription);
    uint64_t result = v50;
    unint64_t v34 = v51;
    if ((v50 & 0x100000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  sub_209ECFC8C(v32, &qword_267605078);
  uint64_t result = v50;
  unint64_t v34 = v51;
  if ((v50 & 0x100000000) == 0) {
LABEL_11:
  }
    uint64_t result = RapidPayload.uploadAttempts.setter(result);
LABEL_12:
  if (v34 >> 60 != 15)
  {
    uint64_t v37 = v42;
    sub_209ECFCE8(v42, v34);
    return RapidPayload.payload.setter(v37, v34);
  }
  return result;
}

uint64_t sub_209ECF848(uint64_t a1)
{
  return sub_209ECF30C(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned int *)(v1 + 40) | ((unint64_t)*(unsigned __int8 *)(v1 + 44) << 32), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

unint64_t sub_209ECF890()
{
  unint64_t result = qword_267605070;
  if (!qword_267605070)
  {
    type metadata accessor for RapidPayload(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267605070);
  }
  return result;
}

uint64_t RapidCloudFunctionServiceAPIAsyncClient.__allocating_init(codeService:)(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t RapidCloudFunctionServiceAPIAsyncClient.init(codeService:)(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

void RapidCloudFunctionServiceAPIAsyncClient.submitRapidPayload(_:completion:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605068);
  uint64_t v3 = MEMORY[0x270FA5388](v2 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  uint64_t v7 = (char *)&v11 - v6;
  sub_209ECFDA8(a1, (uint64_t)&v11 - v6, type metadata accessor for RapidPayload);
  uint64_t v8 = type metadata accessor for RapidPayload(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  objc_allocWithZone((Class)type metadata accessor for RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation());
  sub_209ECFC28((uint64_t)v7, (uint64_t)v5, &qword_267605068);
  uint64_t v9 = (void *)sub_209EDE808();
  sub_209ECFC8C((uint64_t)v7, &qword_267605068);
  id v10 = v9;
  swift_retain();
  sub_209EDE7F8();

  sub_209EDE9F8();
}

uint64_t type metadata accessor for RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation()
{
  uint64_t result = qword_267605538;
  if (!qword_267605538) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t RapidCloudFunctionServiceAPIAsyncClient.deinit()
{
  return v0;
}

uint64_t RapidCloudFunctionServiceAPIAsyncClient.__deallocating_deinit()
{
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t sub_209ECFB68()
{
  return (*(uint64_t (**)(void))(**(void **)v0 + 96))();
}

ValueMetadata *type metadata accessor for RapidCloudFunctionServiceAPI()
{
  return &type metadata for RapidCloudFunctionServiceAPI;
}

uint64_t sub_209ECFBBC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_209ECFBFC()
{
  return type metadata accessor for RapidCloudFunctionServiceAPI.SubmitRapidPayloadOperation();
}

uint64_t type metadata accessor for RapidCloudFunctionServiceAPIAsyncClient()
{
  return self;
}

uint64_t sub_209ECFC28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_209ECFC8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_209ECFCE8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_209ECFD40(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_209ECFDA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_209ECFE10(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t DiagnosticPipelineRapidServiceFunctionsClient.Environment.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL) {
    return 0;
  }
  return result;
}

BOOL sub_209ECFE88(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_209ECFE9C()
{
  return sub_209EDEA58();
}

uint64_t sub_209ECFEE4()
{
  return sub_209EDEA48();
}

uint64_t sub_209ECFF10()
{
  return sub_209EDEA58();
}

uint64_t *sub_209ECFF54@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  unint64_t v3 = *result - 4;
  BOOL v4 = __CFADD__(v3, 3);
  BOOL v5 = v3 < 0xFFFFFFFFFFFFFFFDLL;
  if (!v4) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v5;
  return result;
}

void sub_209ECFF74(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t DiagnosticPipelineRapidServiceFunctionsClient.environment.getter()
{
  return *(void *)(v0 + OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_environment);
}

id DiagnosticPipelineRapidServiceFunctionsClient.__allocating_init(environment:)(uint64_t a1)
{
  id v3 = objc_allocWithZone(v1);
  return DiagnosticPipelineRapidServiceFunctionsClient.init(environment:)(a1);
}

id DiagnosticPipelineRapidServiceFunctionsClient.init(environment:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_environment] = a1;
  char v2 = a1 - 1;
  if ((unint64_t)(a1 - 1) >= 3)
  {
    uint64_t v6 = v1;
    id result = (id)sub_209EDEA28();
    __break(1u);
  }
  else
  {
    id v3 = v1;
    *(void *)&v3[OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_client] = sub_209ED146C(1, v2);
    *(void *)&v3[OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_container] = v4;

    v7.receiver = v3;
    v7.super_class = (Class)type metadata accessor for DiagnosticPipelineRapidServiceFunctionsClient();
    return objc_msgSendSuper2(&v7, sel_init);
  }
  return result;
}

uint64_t type metadata accessor for DiagnosticPipelineRapidServiceFunctionsClient()
{
  return self;
}

uint64_t DiagnosticPipelineRapidServiceFunctionsClient.submitRapidPayload(buildVariant:deviceCategory:deviceModel:platform:teamID:issueCategory:contextDictionaryData:requestTime:build:logType:logSize:fileName:uploadAttempts:payload:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, long long a9, long long a10, long long a11, long long a12, uint64_t a13, long long a14, long long a15, uint64_t a16, int a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v44 = a7;
  uint64_t v45 = a8;
  uint64_t v42 = a5;
  uint64_t v43 = a6;
  uint64_t v40 = a3;
  uint64_t v41 = a4;
  uint64_t v39 = a2;
  uint64_t v59 = a21;
  uint64_t v58 = a20;
  uint64_t v56 = a19;
  uint64_t v55 = a18;
  int v54 = a17;
  uint64_t v53 = a16;
  long long v52 = a15;
  long long v51 = a14;
  uint64_t v50 = a13;
  long long v49 = a12;
  long long v48 = a11;
  long long v47 = a10;
  long long v46 = a9;
  uint64_t v22 = type metadata accessor for RapidPayload(0);
  MEMORY[0x270FA5388](v22);
  uint64_t v24 = (char *)&v38 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for FileDescription(0);
  MEMORY[0x270FA5388](v25);
  uint64_t v27 = (char *)&v38 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = type metadata accessor for RequestDescription(0);
  MEMORY[0x270FA5388](v28);
  char v30 = (char *)&v38 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = type metadata accessor for ClientDeviceMetadata(0);
  MEMORY[0x270FA5388](v31);
  unint64_t v33 = (char *)&v38 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = a1;
  uint64_t v75 = v39;
  uint64_t v76 = v40;
  uint64_t v77 = v41;
  uint64_t v78 = v42;
  uint64_t v79 = v43;
  uint64_t v80 = v44;
  uint64_t v81 = v45;
  sub_209ED09A0(&qword_2676050A8, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
  sub_209EDE908();
  long long v69 = v46;
  long long v70 = v47;
  long long v71 = v48;
  long long v72 = v49;
  uint64_t v73 = v50;
  sub_209ED09A0(&qword_2676050B0, (void (*)(uint64_t))type metadata accessor for RequestDescription);
  sub_209EDE908();
  long long v66 = v51;
  long long v67 = v52;
  uint64_t v68 = v53;
  sub_209ED09A0(&qword_2676050B8, (void (*)(uint64_t))type metadata accessor for FileDescription);
  sub_209EDE908();
  v60 = v33;
  v61 = v30;
  v62 = v27;
  int v63 = v54;
  uint64_t v64 = v55;
  uint64_t v65 = v56;
  sub_209ED09A0((unint64_t *)&qword_267605070, (void (*)(uint64_t))type metadata accessor for RapidPayload);
  sub_209EDE908();
  uint64_t v34 = *(void *)(v57 + OBJC_IVAR___DiagnosticPipelineRapidServiceFunctionsClientObjc_client);
  uint64_t v35 = swift_allocObject();
  *(void *)(v35 + 16) = v58;
  *(void *)(v35 + 24) = v59;
  uint64_t v36 = *(void (**)(char *, void (*)(uint64_t), uint64_t))(*(void *)v34 + 96);
  swift_retain();
  v36(v24, sub_209ED0BE4, v35);
  swift_release();
  sub_209ED1270((uint64_t)v24, type metadata accessor for RapidPayload);
  sub_209ED1270((uint64_t)v27, type metadata accessor for FileDescription);
  sub_209ED1270((uint64_t)v30, type metadata accessor for RequestDescription);
  return sub_209ED1270((uint64_t)v33, type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_209ED05B4()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v7 = v0[9];
  swift_bridgeObjectRetain();
  ClientDeviceMetadata.buildVariant.setter(v1, v2);
  swift_bridgeObjectRetain();
  ClientDeviceMetadata.deviceCategory.setter(v3, v4);
  swift_bridgeObjectRetain();
  ClientDeviceMetadata.deviceModel.setter(v5, v6);
  swift_bridgeObjectRetain();
  return ClientDeviceMetadata.platform.setter(v8, v7);
}

uint64_t sub_209ED0660()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[6];
  unint64_t v6 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v7 = v0[9];
  uint64_t v9 = v0[10];
  swift_bridgeObjectRetain();
  RequestDescription.teamID.setter(v1, v2);
  swift_bridgeObjectRetain();
  RequestDescription.issueCategory.setter(v4, v3);
  if (v6 >> 60 != 15)
  {
    sub_209ECFCE8(v5, v6);
    RequestDescription.contextDictionaryData.setter(v5, v6);
  }
  RequestDescription.requestTime.setter(v8);
  swift_bridgeObjectRetain();
  return RequestDescription.build.setter(v7, v9);
}

uint64_t sub_209ED0728()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  swift_bridgeObjectRetain();
  FileDescription.logType.setter(v1, v2);
  FileDescription.logSize.setter(v3);
  swift_bridgeObjectRetain();
  return FileDescription.fileName.setter(v4, v5);
}

uint64_t sub_209ED07A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, unint64_t a7)
{
  uint64_t v13 = type metadata accessor for FileDescription(0);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for RequestDescription(0);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for ClientDeviceMetadata(0);
  MEMORY[0x270FA5388](v19 - 8);
  uint64_t v21 = (char *)&v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_209ED12D0(a2, (uint64_t)v21, type metadata accessor for ClientDeviceMetadata);
  RapidPayload.deviceMetadata.setter((uint64_t)v21);
  sub_209ED12D0(a3, (uint64_t)v18, type metadata accessor for RequestDescription);
  RapidPayload.payloadMetadata.setter((uint64_t)v18);
  sub_209ED12D0(a4, (uint64_t)v15, type metadata accessor for FileDescription);
  RapidPayload.payloadDescription.setter((uint64_t)v15);
  RapidPayload.uploadAttempts.setter(a5);
  sub_209ECFCE8(a6, a7);
  return RapidPayload.payload.setter(a6, a7);
}

uint64_t sub_209ED0968(uint64_t a1)
{
  return sub_209ED07A8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(_DWORD *)(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56));
}

uint64_t sub_209ED09A0(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_209ED09E8(uint64_t a1, void (*a2)(uint64_t, unint64_t, uint64_t, uint64_t, id))
{
  uint64_t v4 = type metadata accessor for RapidPayloadReply(0);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676050C8);
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = (id *)((char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_209ED11A4(a1, (uint64_t)v9);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v10 = *v9;
    id v11 = *v9;
    a2(0, 0xF000000000000000, 0, 0, v10);
  }
  else
  {
    sub_209ED120C((uint64_t)v9, (uint64_t)v6);
    uint64_t v12 = RapidPayloadReply.replyPayload.getter();
    unint64_t v14 = v13;
    if (RapidPayloadReply.hasFailureReason.getter())
    {
      uint64_t v15 = RapidPayloadReply.failureReason.getter();
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v17 = 0;
    }
    a2(v12, v14, v15, v17, 0);
    swift_bridgeObjectRelease();
    sub_209ED1138(v12, v14);
    sub_209ED1270((uint64_t)v6, type metadata accessor for RapidPayloadReply);
  }
}

uint64_t sub_209ED0BAC()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

void sub_209ED0BE4(uint64_t a1)
{
  sub_209ED09E8(a1, *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, id))(v1 + 16));
}

void sub_209ED0EB4(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = a4;
  if (a2 >> 60 != 15)
  {
    uint64_t v9 = (void *)sub_209EDE7D8();
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v9 = 0;
  if (a4) {
LABEL_5:
  }
    uint64_t v8 = (void *)sub_209EDE9C8();
LABEL_6:
  if (a5) {
    uint64_t v10 = sub_209EDE798();
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = (id)v10;
  (*(void (**)(uint64_t, void *, void *))(a6 + 16))(a6, v9, v8);
}

id DiagnosticPipelineRapidServiceFunctionsClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return objc_msgSend(v1, sel_init);
}

void DiagnosticPipelineRapidServiceFunctionsClient.init()()
{
}

id DiagnosticPipelineRapidServiceFunctionsClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticPipelineRapidServiceFunctionsClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_209ED1094()
{
  unint64_t result = qword_2676050C0;
  if (!qword_2676050C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676050C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DiagnosticPipelineRapidServiceFunctionsClient.Environment()
{
  return &type metadata for DiagnosticPipelineRapidServiceFunctionsClient.Environment;
}

uint64_t sub_209ED10F8()
{
  _Block_release(*(const void **)(v0 + 16));

  return MEMORY[0x270FA0238](v0, 24, 7);
}

void sub_209ED1130(uint64_t a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  sub_209ED0EB4(a1, a2, a3, a4, a5, *(void *)(v5 + 16));
}

uint64_t sub_209ED1138(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_209ED1190(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_209ED1138(a1, a2);
  }
  return a1;
}

uint64_t sub_209ED11A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676050C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_209ED120C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RapidPayloadReply(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_209ED1270(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_209ED12D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

DiagnosticRequestService::RapidCloudFunctionServiceConnection::Environment_optional __swiftcall RapidCloudFunctionServiceConnection.Environment.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 4) {
    return (DiagnosticRequestService::RapidCloudFunctionServiceConnection::Environment_optional)3;
  }
  else {
    return (DiagnosticRequestService::RapidCloudFunctionServiceConnection::Environment_optional)(0x2010003u >> (8 * rawValue));
  }
}

uint64_t RapidCloudFunctionServiceConnection.Environment.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL sub_209ED1364(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_209ED1378()
{
  return sub_209EDEA58();
}

uint64_t sub_209ED13C0()
{
  return sub_209EDEA48();
}

uint64_t sub_209ED13F0()
{
  return sub_209EDEA58();
}

void *sub_209ED1434@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result >= 4uLL) {
    char v2 = 3;
  }
  else {
    char v2 = 0x2010003u >> (8 * *result);
  }
  *a2 = v2;
  return result;
}

void sub_209ED145C(void *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t sub_209ED146C(uint64_t a1, char a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC36340);
  MEMORY[0x270FA5388](v4 - 8);
  unint64_t v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 == 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  v21[0] = 0xD000000000000019;
  v21[1] = 0x8000000209EEAC00;
  sub_209EDE9E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_209EDE9E8();
  swift_bridgeObjectRelease();
  id v8 = objc_allocWithZone(MEMORY[0x263EFD620]);
  uint64_t v9 = (void *)sub_209EDE9C8();
  id v10 = objc_msgSend(v8, sel_initWithContainerIdentifier_environment_, v9, v7);

  id v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFD610]), sel_initWithContainerID_, v10);
  uint64_t v12 = (void *)sub_209EDE9C8();
  id v13 = objc_msgSend(v11, sel_codeServiceWithName_databaseScope_, v12, a1);

  if (a2 != 2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  unint64_t v14 = (void *)sub_209EDE9C8();
  swift_bridgeObjectRelease();
  sub_209EDE7B8();
  uint64_t v15 = sub_209EDE7C8();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v6, 1, v15);
  if (result != 1)
  {
    uint64_t v18 = (void *)sub_209EDE7A8();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v15);
    id v19 = objc_msgSend(v11, sel_codeServiceWithName_serviceInstanceURL_, v14, v18);

    id v13 = v19;
LABEL_8:
    type metadata accessor for RapidCloudFunctionServiceAPIAsyncClient();
    uint64_t v20 = RapidCloudFunctionServiceAPIAsyncClient.__allocating_init(codeService:)((uint64_t)v13);

    return v20;
  }
  __break(1u);
  return result;
}

unint64_t sub_209ED175C()
{
  unint64_t result = qword_2676050D0;
  if (!qword_2676050D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2676050D0);
  }
  return result;
}

ValueMetadata *type metadata accessor for RapidCloudFunctionServiceConnection()
{
  return &type metadata for RapidCloudFunctionServiceConnection;
}

uint64_t getEnumTagSinglePayload for RapidCloudFunctionServiceConnection.Environment(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RapidCloudFunctionServiceConnection.Environment(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x209ED191CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_209ED1944(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_209ED194C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RapidCloudFunctionServiceConnection.Environment()
{
  return &type metadata for RapidCloudFunctionServiceConnection.Environment;
}

uint64_t ClientDeviceMetadata.buildVariant.getter()
{
  return sub_209ED1E6C(type metadata accessor for ClientDeviceMetadata);
}

uint64_t type metadata accessor for ClientDeviceMetadata(uint64_t a1)
{
  return sub_209ED4384(a1, (uint64_t *)&unk_267606780);
}

uint64_t ClientDeviceMetadata.buildVariant.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED1F00(a1, a2, type metadata accessor for ClientDeviceMetadata);
}

uint64_t (*ClientDeviceMetadata.buildVariant.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  unsigned int v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL ClientDeviceMetadata.hasBuildVariant.getter()
{
  return sub_209ED1FE0(type metadata accessor for ClientDeviceMetadata);
}

Swift::Void __swiftcall ClientDeviceMetadata.clearBuildVariant()()
{
}

uint64_t ClientDeviceMetadata.deviceCategory.getter()
{
  return sub_209ED2088(type metadata accessor for ClientDeviceMetadata);
}

uint64_t ClientDeviceMetadata.deviceCategory.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED20FC(a1, a2, type metadata accessor for ClientDeviceMetadata);
}

uint64_t (*ClientDeviceMetadata.deviceCategory.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  unsigned int v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL ClientDeviceMetadata.hasDeviceCategory.getter()
{
  return sub_209ED21DC(type metadata accessor for ClientDeviceMetadata);
}

Swift::Void __swiftcall ClientDeviceMetadata.clearDeviceCategory()()
{
}

uint64_t ClientDeviceMetadata.deviceModel.getter()
{
  return sub_209ED294C(type metadata accessor for ClientDeviceMetadata);
}

uint64_t ClientDeviceMetadata.deviceModel.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED29C0(a1, a2, type metadata accessor for ClientDeviceMetadata);
}

uint64_t (*ClientDeviceMetadata.deviceModel.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  unsigned int v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL ClientDeviceMetadata.hasDeviceModel.getter()
{
  return sub_209ED2AA0(type metadata accessor for ClientDeviceMetadata);
}

Swift::Void __swiftcall ClientDeviceMetadata.clearDeviceModel()()
{
}

uint64_t ClientDeviceMetadata.platform.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32));
  if (v1[1]) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t ClientDeviceMetadata.platform.setter(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*ClientDeviceMetadata.platform.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32);
  *(_DWORD *)(a1 + 24) = v3;
  unsigned int v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL ClientDeviceMetadata.hasPlatform.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32) + 8) != 0;
}

Swift::Void __swiftcall ClientDeviceMetadata.clearPlatform()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for ClientDeviceMetadata(0) + 32));
  swift_bridgeObjectRelease();
  *uint64_t v1 = 0;
  v1[1] = 0;
}

uint64_t (*ClientDeviceMetadata.unknownFields.modify())()
{
  return nullsub_1;
}

int *ClientDeviceMetadata.init()@<X0>(uint64_t a1@<X8>)
{
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t result = (int *)type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v3 = (void *)(a1 + result[5]);
  *uint64_t v3 = 0;
  v3[1] = 0;
  unsigned int v4 = (void *)(a1 + result[6]);
  *unsigned int v4 = 0;
  v4[1] = 0;
  unint64_t v5 = (void *)(a1 + result[7]);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (void *)(a1 + result[8]);
  *uint64_t v6 = 0;
  v6[1] = 0;
  return result;
}

uint64_t variable initialization expression of ClientDeviceMetadata._buildVariant()
{
  return 0;
}

uint64_t variable initialization expression of ClientDeviceMetadata._deviceCategory()
{
  return 0;
}

uint64_t variable initialization expression of ClientDeviceMetadata._deviceModel()
{
  return 0;
}

uint64_t variable initialization expression of ClientDeviceMetadata._platform()
{
  return 0;
}

uint64_t RequestDescription.teamID.getter()
{
  return sub_209ED1E6C(type metadata accessor for RequestDescription);
}

uint64_t sub_209ED1E6C(uint64_t (*a1)(void))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 20));
  if (v2[1]) {
    uint64_t v3 = *v2;
  }
  else {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t type metadata accessor for RequestDescription(uint64_t a1)
{
  return sub_209ED4384(a1, (uint64_t *)&unk_267606790);
}

uint64_t RequestDescription.teamID.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED1F00(a1, a2, type metadata accessor for RequestDescription);
}

uint64_t sub_209ED1F00(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*RequestDescription.teamID.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RequestDescription(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  unsigned int v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL RequestDescription.hasTeamID.getter()
{
  return sub_209ED1FE0(type metadata accessor for RequestDescription);
}

BOOL sub_209ED1FE0(uint64_t (*a1)(void))
{
  return *(void *)(v1 + *(int *)(a1(0) + 20) + 8) != 0;
}

Swift::Void __swiftcall RequestDescription.clearTeamID()()
{
}

uint64_t sub_209ED2030(uint64_t (*a1)(void))
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1(0) + 20));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t RequestDescription.issueCategory.getter()
{
  return sub_209ED2088(type metadata accessor for RequestDescription);
}

uint64_t sub_209ED2088(uint64_t (*a1)(void))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 24));
  if (v2[1]) {
    uint64_t v3 = *v2;
  }
  else {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t RequestDescription.issueCategory.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED20FC(a1, a2, type metadata accessor for RequestDescription);
}

uint64_t sub_209ED20FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*RequestDescription.issueCategory.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RequestDescription(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  unsigned int v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL RequestDescription.hasIssueCategory.getter()
{
  return sub_209ED21DC(type metadata accessor for RequestDescription);
}

BOOL sub_209ED21DC(uint64_t (*a1)(void))
{
  return *(void *)(v1 + *(int *)(a1(0) + 24) + 8) != 0;
}

Swift::Void __swiftcall RequestDescription.clearIssueCategory()()
{
}

uint64_t sub_209ED222C(uint64_t (*a1)(void))
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t RequestDescription.contextDictionaryData.getter()
{
  return sub_209ED4624(type metadata accessor for RequestDescription);
}

uint64_t sub_209ED2284(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_209ECFCE8(a1, a2);
  }
  return a1;
}

uint64_t RequestDescription.contextDictionaryData.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED4694(a1, a2, type metadata accessor for RequestDescription);
}

uint64_t (*RequestDescription.contextDictionaryData.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RequestDescription(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  unsigned int v4 = (uint64_t *)(v1 + v3);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  if (v6 >> 60 == 15) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *v4;
  }
  unint64_t v8 = 0xC000000000000000;
  if (v6 >> 60 != 15) {
    unint64_t v8 = v6;
  }
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v8;
  sub_209ED2284(v5, v6);
  return sub_209ED2324;
}

BOOL RequestDescription.hasContextDictionaryData.getter()
{
  return sub_209ED4808(type metadata accessor for RequestDescription);
}

Swift::Void __swiftcall RequestDescription.clearContextDictionaryData()()
{
}

uint64_t RequestDescription.requestTime.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 32));
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t RequestDescription.requestTime.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for RequestDescription(0);
  uint64_t v4 = v1 + *(int *)(result + 32);
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*RequestDescription.requestTime.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RequestDescription(0) + 32);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_209ED242C;
}

BOOL RequestDescription.hasRequestTime.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 32) + 8) & 1) == 0;
}

Swift::Void __swiftcall RequestDescription.clearRequestTime()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for RequestDescription(0) + 32);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
}

uint64_t RequestDescription.build.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 36));
  if (v1[1]) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t RequestDescription.build.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for RequestDescription(0) + 36));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*RequestDescription.build.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RequestDescription(0) + 36);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL RequestDescription.hasBuild.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 36) + 8) != 0;
}

Swift::Void __swiftcall RequestDescription.clearBuild()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for RequestDescription(0) + 36));
  swift_bridgeObjectRelease();
  *uint64_t v1 = 0;
  v1[1] = 0;
}

uint64_t (*RequestDescription.unknownFields.modify())()
{
  return nullsub_1;
}

double RequestDescription.init()@<D0>(uint64_t a1@<X8>)
{
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v2 = (int *)type metadata accessor for RequestDescription(0);
  uint64_t v3 = (void *)(a1 + v2[5]);
  *uint64_t v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (void *)(a1 + v2[6]);
  *uint64_t v4 = 0;
  v4[1] = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + v2[7]) = xmmword_209EE4510;
  uint64_t v6 = a1 + v2[8];
  *(void *)uint64_t v6 = 0;
  *(unsigned char *)(v6 + 8) = 1;
  unint64_t v7 = (void *)(a1 + v2[9]);
  *unint64_t v7 = 0;
  v7[1] = 0;
  return result;
}

uint64_t variable initialization expression of RequestDescription._teamID()
{
  return 0;
}

uint64_t variable initialization expression of RequestDescription._issueCategory()
{
  return 0;
}

uint64_t variable initialization expression of RequestDescription._contextDictionaryData()
{
  return 0;
}

uint64_t variable initialization expression of RequestDescription._requestTime()
{
  return 0;
}

uint64_t variable initialization expression of RequestDescription._build()
{
  return 0;
}

uint64_t FileDescription.logType.getter()
{
  return sub_209ED1E6C(type metadata accessor for FileDescription);
}

uint64_t type metadata accessor for FileDescription(uint64_t a1)
{
  return sub_209ED4384(a1, (uint64_t *)&unk_2676067A0);
}

uint64_t FileDescription.logType.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED1F00(a1, a2, type metadata accessor for FileDescription);
}

uint64_t (*FileDescription.logType.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for FileDescription(0) + 20);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL FileDescription.hasLogType.getter()
{
  return sub_209ED1FE0(type metadata accessor for FileDescription);
}

Swift::Void __swiftcall FileDescription.clearLogType()()
{
}

uint64_t FileDescription.logSize.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for FileDescription(0) + 24));
  if (v1[8]) {
    return 0;
  }
  else {
    return *(void *)v1;
  }
}

uint64_t FileDescription.logSize.setter(uint64_t a1)
{
  uint64_t result = type metadata accessor for FileDescription(0);
  uint64_t v4 = v1 + *(int *)(result + 24);
  *(void *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 8) = 0;
  return result;
}

uint64_t (*FileDescription.logSize.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 8) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for FileDescription(0) + 24);
  *(_DWORD *)(a1 + 16) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  if (*((unsigned char *)v4 + 8)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *v4;
  }
  *(void *)a1 = v5;
  return sub_209ED242C;
}

uint64_t sub_209ED28BC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8) + *(int *)(result + 16);
  *(void *)uint64_t v1 = *(void *)result;
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

BOOL FileDescription.hasLogSize.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for FileDescription(0) + 24) + 8) & 1) == 0;
}

Swift::Void __swiftcall FileDescription.clearLogSize()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for FileDescription(0) + 24);
  *(void *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 8) = 1;
}

uint64_t FileDescription.fileName.getter()
{
  return sub_209ED294C(type metadata accessor for FileDescription);
}

uint64_t sub_209ED294C(uint64_t (*a1)(void))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 28));
  if (v2[1]) {
    uint64_t v3 = *v2;
  }
  else {
    uint64_t v3 = 0;
  }
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t FileDescription.fileName.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED29C0(a1, a2, type metadata accessor for FileDescription);
}

uint64_t sub_209ED29C0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = (void *)(v3 + *(int *)(a3(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*FileDescription.fileName.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for FileDescription(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

BOOL FileDescription.hasFileName.getter()
{
  return sub_209ED2AA0(type metadata accessor for FileDescription);
}

BOOL sub_209ED2AA0(uint64_t (*a1)(void))
{
  return *(void *)(v1 + *(int *)(a1(0) + 28) + 8) != 0;
}

Swift::Void __swiftcall FileDescription.clearFileName()()
{
}

uint64_t sub_209ED2AF0(uint64_t (*a1)(void))
{
  uint64_t v2 = (void *)(v1 + *(int *)(a1(0) + 28));
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v2 = 0;
  v2[1] = 0;
  return result;
}

uint64_t (*FileDescription.unknownFields.modify())()
{
  return nullsub_1;
}

int *FileDescription.init()@<X0>(uint64_t a1@<X8>)
{
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t result = (int *)type metadata accessor for FileDescription(0);
  uint64_t v3 = (void *)(a1 + result[5]);
  *uint64_t v3 = 0;
  v3[1] = 0;
  uint64_t v4 = a1 + result[6];
  *(void *)uint64_t v4 = 0;
  *(unsigned char *)(v4 + 8) = 1;
  unint64_t v5 = (void *)(a1 + result[7]);
  void *v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t variable initialization expression of FileDescription._logType()
{
  return 0;
}

uint64_t variable initialization expression of FileDescription._logSize()
{
  return 0;
}

uint64_t variable initialization expression of FileDescription._fileName()
{
  return 0;
}

uint64_t RapidPayload.deviceMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(v1 + *(int *)(v6 + 20), (uint64_t)v5, &qword_267605088);
  unint64_t v7 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v7 - 1) + 48))(v5, 1, v7) != 1) {
    return sub_209ED3294((uint64_t)v5, a1, type metadata accessor for ClientDeviceMetadata);
  }
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  unint64_t v8 = (void *)(a1 + v7[5]);
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = (void *)(a1 + v7[6]);
  *uint64_t v9 = 0;
  v9[1] = 0;
  id v10 = (void *)(a1 + v7[7]);
  *id v10 = 0;
  v10[1] = 0;
  id v11 = (void *)(a1 + v7[8]);
  *id v11 = 0;
  v11[1] = 0;
  return sub_209ECFC8C((uint64_t)v5, &qword_267605088);
}

uint64_t type metadata accessor for RapidPayload(uint64_t a1)
{
  return sub_209ED4384(a1, (uint64_t *)&unk_2676067B0);
}

uint64_t RapidPayload.deviceMetadata.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RapidPayload(0) + 20);
  sub_209ECFC8C(v3, &qword_267605088);
  sub_209ED3294(a1, v3, type metadata accessor for ClientDeviceMetadata);
  uint64_t v4 = type metadata accessor for ClientDeviceMetadata(0);
  unint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 0, 1, v4);
}

void (*RapidPayload.deviceMetadata.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
  unint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  v3[2] = v6;
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  id v10 = (char *)malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for RapidPayload(0) + 20);
  *((_DWORD *)v3 + 12) = v11;
  sub_209ECFC28(v1 + v11, (uint64_t)v5, &qword_267605088);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v8 + 48))(v5, 1, v6) == 1)
  {
    _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v12 = &v10[v6[5]];
    *(void *)uint64_t v12 = 0;
    *((void *)v12 + 1) = 0;
    uint64_t v13 = &v10[v6[6]];
    *(void *)uint64_t v13 = 0;
    *((void *)v13 + 1) = 0;
    unint64_t v14 = &v10[v6[7]];
    *(void *)unint64_t v14 = 0;
    *((void *)v14 + 1) = 0;
    uint64_t v15 = &v10[v6[8]];
    *(void *)uint64_t v15 = 0;
    *((void *)v15 + 1) = 0;
    sub_209ECFC8C((uint64_t)v5, &qword_267605088);
  }
  else
  {
    sub_209ED3294((uint64_t)v5, (uint64_t)v10, type metadata accessor for ClientDeviceMetadata);
  }
  return sub_209ED2FA8;
}

void sub_209ED2FA8(uint64_t a1, char a2)
{
}

BOOL RapidPayload.hasDeviceMetadata.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(v0 + *(int *)(v4 + 20), (uint64_t)v3, &qword_267605088);
  uint64_t v5 = type metadata accessor for ClientDeviceMetadata(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_209ECFC8C((uint64_t)v3, &qword_267605088);
  return v6;
}

Swift::Void __swiftcall RapidPayload.clearDeviceMetadata()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 20);
  sub_209ECFC8C(v1, &qword_267605088);
  uint64_t v2 = type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  v3(v1, 1, 1, v2);
}

uint64_t RapidPayload.payloadMetadata.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_267605080);
  uint64_t v7 = (int *)type metadata accessor for RequestDescription(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v7 - 1) + 48))(v5, 1, v7) != 1) {
    return sub_209ED3294((uint64_t)v5, a1, type metadata accessor for RequestDescription);
  }
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v8 = (void *)(a1 + v7[5]);
  void *v8 = 0;
  v8[1] = 0;
  size_t v9 = (void *)(a1 + v7[6]);
  *size_t v9 = 0;
  v9[1] = 0;
  *(_OWORD *)(a1 + v7[7]) = xmmword_209EE4510;
  uint64_t v10 = a1 + v7[8];
  *(void *)uint64_t v10 = 0;
  *(unsigned char *)(v10 + 8) = 1;
  uint64_t v11 = (void *)(a1 + v7[9]);
  *uint64_t v11 = 0;
  v11[1] = 0;
  return sub_209ECFC8C((uint64_t)v5, &qword_267605080);
}

uint64_t sub_209ED3294(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t RapidPayload.payloadMetadata.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RapidPayload(0) + 24);
  sub_209ECFC8C(v3, &qword_267605080);
  sub_209ED3294(a1, v3, type metadata accessor for RequestDescription);
  uint64_t v4 = type metadata accessor for RequestDescription(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 0, 1, v4);
}

void (*RapidPayload.payloadMetadata.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = (int *)type metadata accessor for RequestDescription(0);
  v3[2] = v6;
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = (char *)malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for RapidPayload(0) + 24);
  *((_DWORD *)v3 + 12) = v11;
  sub_209ECFC28(v1 + v11, (uint64_t)v5, &qword_267605080);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v8 + 48))(v5, 1, v6) == 1)
  {
    _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v12 = &v10[v6[5]];
    *(void *)uint64_t v12 = 0;
    *((void *)v12 + 1) = 0;
    uint64_t v13 = &v10[v6[6]];
    *(void *)uint64_t v13 = 0;
    *((void *)v13 + 1) = 0;
    *(_OWORD *)&v10[v6[7]] = xmmword_209EE4510;
    unint64_t v14 = &v10[v6[8]];
    *(void *)unint64_t v14 = 0;
    v14[8] = 1;
    uint64_t v15 = &v10[v6[9]];
    *(void *)uint64_t v15 = 0;
    *((void *)v15 + 1) = 0;
    sub_209ECFC8C((uint64_t)v5, &qword_267605080);
  }
  else
  {
    sub_209ED3294((uint64_t)v5, (uint64_t)v10, type metadata accessor for RequestDescription);
  }
  return sub_209ED357C;
}

void sub_209ED357C(uint64_t a1, char a2)
{
}

uint64_t sub_209ED359C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_209ED3604(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

BOOL RapidPayload.hasPayloadMetadata.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(v0 + *(int *)(v4 + 24), (uint64_t)v3, &qword_267605080);
  uint64_t v5 = type metadata accessor for RequestDescription(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_209ECFC8C((uint64_t)v3, &qword_267605080);
  return v6;
}

Swift::Void __swiftcall RapidPayload.clearPayloadMetadata()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 24);
  sub_209ECFC8C(v1, &qword_267605080);
  uint64_t v2 = type metadata accessor for RequestDescription(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  v3(v1, 1, 1, v2);
}

uint64_t RapidPayload.payloadDescription.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(v1 + *(int *)(v6 + 28), (uint64_t)v5, &qword_267605078);
  uint64_t v7 = (int *)type metadata accessor for FileDescription(0);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(*((void *)v7 - 1) + 48))(v5, 1, v7) != 1) {
    return sub_209ED3294((uint64_t)v5, a1, type metadata accessor for FileDescription);
  }
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v8 = (void *)(a1 + v7[5]);
  void *v8 = 0;
  v8[1] = 0;
  uint64_t v9 = a1 + v7[6];
  *(void *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 8) = 1;
  uint64_t v10 = (void *)(a1 + v7[7]);
  *uint64_t v10 = 0;
  v10[1] = 0;
  return sub_209ECFC8C((uint64_t)v5, &qword_267605078);
}

uint64_t RapidPayload.payloadDescription.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for RapidPayload(0) + 28);
  sub_209ECFC8C(v3, &qword_267605078);
  sub_209ED3294(a1, v3, type metadata accessor for FileDescription);
  uint64_t v4 = type metadata accessor for FileDescription(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(v3, 0, 1, v4);
}

void (*RapidPayload.payloadDescription.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = (int *)type metadata accessor for FileDescription(0);
  v3[2] = v6;
  uint64_t v7 = *((void *)v6 - 1);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = (char *)malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for RapidPayload(0) + 28);
  *((_DWORD *)v3 + 12) = v11;
  sub_209ECFC28(v1 + v11, (uint64_t)v5, &qword_267605078);
  if ((*(unsigned int (**)(void *, uint64_t, int *))(v8 + 48))(v5, 1, v6) == 1)
  {
    _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
    uint64_t v12 = &v10[v6[5]];
    *(void *)uint64_t v12 = 0;
    *((void *)v12 + 1) = 0;
    uint64_t v13 = &v10[v6[6]];
    *(void *)uint64_t v13 = 0;
    v13[8] = 1;
    unint64_t v14 = &v10[v6[7]];
    *(void *)unint64_t v14 = 0;
    *((void *)v14 + 1) = 0;
    sub_209ECFC8C((uint64_t)v5, &qword_267605078);
  }
  else
  {
    sub_209ED3294((uint64_t)v5, (uint64_t)v10, type metadata accessor for FileDescription);
  }
  return sub_209ED3B78;
}

void sub_209ED3B78(uint64_t a1, char a2)
{
}

void sub_209ED3B98(uint64_t a1, char a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = *(void **)a1;
  uint64_t v7 = *(int *)(*(void *)a1 + 48);
  uint64_t v8 = *(void **)(*(void *)a1 + 32);
  size_t v9 = *(void **)(*(void *)a1 + 40);
  uint64_t v10 = *(void *)(*(void *)a1 + 16);
  uint64_t v11 = *(void *)(*(void *)a1 + 24);
  uint64_t v12 = *(void **)(*(void *)a1 + 8);
  uint64_t v13 = **(void **)a1 + v7;
  if (a2)
  {
    sub_209ED359C(*(void *)(*(void *)a1 + 40), (uint64_t)v8, a4);
    sub_209ECFC8C(v13, a3);
    sub_209ED3294((uint64_t)v8, v13, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    sub_209ED3604((uint64_t)v9, a4);
  }
  else
  {
    sub_209ECFC8C(**(void **)a1 + v7, a3);
    sub_209ED3294((uint64_t)v9, v13, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
  }
  free(v9);
  free(v8);
  free(v12);

  free(v6);
}

BOOL RapidPayload.hasPayloadDescription.getter()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
  MEMORY[0x270FA5388](v1 - 8);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(v0 + *(int *)(v4 + 28), (uint64_t)v3, &qword_267605078);
  uint64_t v5 = type metadata accessor for FileDescription(0);
  BOOL v6 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5) != 1;
  sub_209ECFC8C((uint64_t)v3, &qword_267605078);
  return v6;
}

Swift::Void __swiftcall RapidPayload.clearPayloadDescription()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 28);
  sub_209ECFC8C(v1, &qword_267605078);
  uint64_t v2 = type metadata accessor for FileDescription(0);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  v3(v1, 1, 1, v2);
}

uint64_t RapidPayload.uploadAttempts.getter()
{
  uint64_t v1 = (unsigned char *)(v0 + *(int *)(type metadata accessor for RapidPayload(0) + 32));
  if (v1[4]) {
    return 0;
  }
  else {
    return *(unsigned int *)v1;
  }
}

uint64_t RapidPayload.uploadAttempts.setter(int a1)
{
  uint64_t result = type metadata accessor for RapidPayload(0);
  uint64_t v4 = v1 + *(int *)(result + 32);
  *(_DWORD *)uint64_t v4 = a1;
  *(unsigned char *)(v4 + 4) = 0;
  return result;
}

uint64_t (*RapidPayload.uploadAttempts.modify(uint64_t a1))(uint64_t result)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RapidPayload(0) + 32);
  *(_DWORD *)(a1 + 12) = v3;
  uint64_t v4 = (int *)(v1 + v3);
  if (*((unsigned char *)v4 + 4)) {
    int v5 = 0;
  }
  else {
    int v5 = *v4;
  }
  *(_DWORD *)(a1 + 8) = v5;
  return sub_209ED3EFC;
}

uint64_t sub_209ED3EFC(uint64_t result)
{
  uint64_t v1 = *(void *)result + *(int *)(result + 12);
  *(_DWORD *)uint64_t v1 = *(_DWORD *)(result + 8);
  *(unsigned char *)(v1 + 4) = 0;
  return result;
}

BOOL RapidPayload.hasUploadAttempts.getter()
{
  return (*(unsigned char *)(v0 + *(int *)(type metadata accessor for RapidPayload(0) + 32) + 4) & 1) == 0;
}

Swift::Void __swiftcall RapidPayload.clearUploadAttempts()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 32);
  *(_DWORD *)uint64_t v1 = 0;
  *(unsigned char *)(v1 + 4) = 1;
}

uint64_t RapidPayload.payload.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for RapidPayload(0) + 36));
  unint64_t v2 = v1[1];
  if (v2 >> 60 == 15) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = *v1;
  }
  sub_209ED2284(*v1, v2);
  return v3;
}

uint64_t RapidPayload.payload.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(int *)(type metadata accessor for RapidPayload(0) + 36);
  uint64_t result = sub_209ED1190(*(void *)v5, *(void *)(v5 + 8));
  *(void *)uint64_t v5 = a1;
  *(void *)(v5 + 8) = a2;
  return result;
}

uint64_t (*RapidPayload.payload.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RapidPayload(0) + 36);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  if (v6 >> 60 == 15) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *v4;
  }
  unint64_t v8 = 0xC000000000000000;
  if (v6 >> 60 != 15) {
    unint64_t v8 = v6;
  }
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v8;
  sub_209ED2284(v5, v6);
  return sub_209ED2324;
}

BOOL RapidPayload.hasPayload.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for RapidPayload(0) + 36) + 8) >> 60 != 15;
}

Swift::Void __swiftcall RapidPayload.clearPayload()()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for RapidPayload(0) + 36);
  sub_209ED1190(*(void *)v1, *(void *)(v1 + 8));
  *(_OWORD *)uint64_t v1 = xmmword_209EE4510;
}

uint64_t (*RapidPayload.unknownFields.modify())()
{
  return nullsub_1;
}

double RapidPayload.init()@<D0>(uint64_t a1@<X8>)
{
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v2 = (int *)type metadata accessor for RapidPayload(0);
  uint64_t v3 = a1 + v2[5];
  uint64_t v4 = type metadata accessor for ClientDeviceMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  uint64_t v5 = a1 + v2[6];
  uint64_t v6 = type metadata accessor for RequestDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = a1 + v2[7];
  uint64_t v8 = type metadata accessor for FileDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = a1 + v2[8];
  *(_DWORD *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 4) = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + v2[9]) = xmmword_209EE4510;
  return result;
}

uint64_t variable initialization expression of RapidPayload._deviceMetadata@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED4288(type metadata accessor for ClientDeviceMetadata, a1);
}

uint64_t variable initialization expression of RapidPayload._payloadMetadata@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED4288(type metadata accessor for RequestDescription, a1);
}

uint64_t sub_209ED4288@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);

  return v4(a2, 1, 1, v3);
}

uint64_t variable initialization expression of RapidPayload._payloadDescription@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED4288(type metadata accessor for FileDescription, a1);
}

uint64_t variable initialization expression of RapidPayload._uploadAttempts()
{
  return 0x100000000;
}

uint64_t variable initialization expression of RapidPayload._payload()
{
  return 0;
}

uint64_t RapidPayloadReply.success.getter()
{
  return *(unsigned char *)(v0 + *(int *)(type metadata accessor for RapidPayloadReply(0) + 20)) & 1;
}

uint64_t type metadata accessor for RapidPayloadReply(uint64_t a1)
{
  return sub_209ED4384(a1, (uint64_t *)&unk_2676067C0);
}

uint64_t sub_209ED4384(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t RapidPayloadReply.success.setter(char a1)
{
  uint64_t result = type metadata accessor for RapidPayloadReply(0);
  *(unsigned char *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*RapidPayloadReply.success.modify(uint64_t a1))(uint64_t result)
{
  *(void *)a1 = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RapidPayloadReply(0) + 20);
  *(_DWORD *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 12) = *(unsigned char *)(v1 + v3) & 1;
  return sub_209ED4448;
}

uint64_t sub_209ED4448(uint64_t result)
{
  *(unsigned char *)(*(void *)result + *(int *)(result + 8)) = *(unsigned char *)(result + 12);
  return result;
}

BOOL RapidPayloadReply.hasSuccess.getter()
{
  return *(unsigned char *)(v0 + *(int *)(type metadata accessor for RapidPayloadReply(0) + 20)) != 2;
}

Swift::Void __swiftcall RapidPayloadReply.clearSuccess()()
{
  *(unsigned char *)(v0 + *(int *)(type metadata accessor for RapidPayloadReply(0) + 20)) = 2;
}

uint64_t RapidPayloadReply.failureReason.getter()
{
  return sub_209ED2088(type metadata accessor for RapidPayloadReply);
}

uint64_t RapidPayloadReply.failureReason.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED20FC(a1, a2, type metadata accessor for RapidPayloadReply);
}

uint64_t (*RapidPayloadReply.failureReason.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RapidPayloadReply(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return sub_209ED1A30;
}

uint64_t sub_209ED455C(uint64_t *a1, char a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = (void *)(a1[2] + *((int *)a1 + 6));
  uint64_t v4 = *a1;
  if (a2)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    v3[1] = v2;
  }
  return result;
}

BOOL RapidPayloadReply.hasFailureReason.getter()
{
  return sub_209ED21DC(type metadata accessor for RapidPayloadReply);
}

Swift::Void __swiftcall RapidPayloadReply.clearFailureReason()()
{
}

uint64_t RapidPayloadReply.replyPayload.getter()
{
  return sub_209ED4624(type metadata accessor for RapidPayloadReply);
}

uint64_t sub_209ED4624(uint64_t (*a1)(void))
{
  uint64_t v2 = (uint64_t *)(v1 + *(int *)(a1(0) + 28));
  unint64_t v3 = v2[1];
  if (v3 >> 60 == 15) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *v2;
  }
  sub_209ED2284(*v2, v3);
  return v4;
}

uint64_t RapidPayloadReply.replyPayload.setter(uint64_t a1, uint64_t a2)
{
  return sub_209ED4694(a1, a2, type metadata accessor for RapidPayloadReply);
}

uint64_t sub_209ED4694(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6 = v3 + *(int *)(a3(0) + 28);
  uint64_t result = sub_209ED1190(*(void *)v6, *(void *)(v6 + 8));
  *(void *)uint64_t v6 = a1;
  *(void *)(v6 + 8) = a2;
  return result;
}

uint64_t (*RapidPayloadReply.replyPayload.modify(uint64_t a1))()
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for RapidPayloadReply(0) + 28);
  *(_DWORD *)(a1 + 24) = v3;
  uint64_t v4 = (uint64_t *)(v1 + v3);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  if (v6 >> 60 == 15) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *v4;
  }
  unint64_t v8 = 0xC000000000000000;
  if (v6 >> 60 != 15) {
    unint64_t v8 = v6;
  }
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = v8;
  sub_209ED2284(v5, v6);
  return sub_209ED2324;
}

uint64_t sub_209ED4754(uint64_t a1, char a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16) + *(int *)(a1 + 24);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)v3;
  unint64_t v6 = *(void *)(v3 + 8);
  if (a2)
  {
    sub_209ECFCE8(*(void *)a1, v2);
    sub_209ED1190(v5, v6);
    *(void *)uint64_t v3 = v4;
    *(void *)(v3 + 8) = v2;
    return sub_209ED1138(v4, v2);
  }
  else
  {
    uint64_t result = sub_209ED1190(*(void *)v3, *(void *)(v3 + 8));
    *(void *)uint64_t v3 = v4;
    *(void *)(v3 + 8) = v2;
  }
  return result;
}

BOOL RapidPayloadReply.hasReplyPayload.getter()
{
  return sub_209ED4808(type metadata accessor for RapidPayloadReply);
}

BOOL sub_209ED4808(uint64_t (*a1)(void))
{
  return *(void *)(v1 + *(int *)(a1(0) + 28) + 8) >> 60 != 15;
}

Swift::Void __swiftcall RapidPayloadReply.clearReplyPayload()()
{
}

double sub_209ED485C(uint64_t (*a1)(void))
{
  uint64_t v2 = v1 + *(int *)(a1(0) + 28);
  sub_209ED1190(*(void *)v2, *(void *)(v2 + 8));
  double result = 0.0;
  *(_OWORD *)uint64_t v2 = xmmword_209EE4510;
  return result;
}

uint64_t _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_209EDE838();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16);

  return v4(a1, v1, v3);
}

uint64_t _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvs_0(uint64_t a1)
{
  uint64_t v3 = sub_209EDE838();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40);

  return v4(v1, a1, v3);
}

uint64_t (*RapidPayloadReply.unknownFields.modify())()
{
  return nullsub_1;
}

double RapidPayloadReply.init()@<D0>(uint64_t a1@<X8>)
{
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v2 = (int *)type metadata accessor for RapidPayloadReply(0);
  *(unsigned char *)(a1 + v2[5]) = 2;
  uint64_t v3 = (void *)(a1 + v2[6]);
  *uint64_t v3 = 0;
  v3[1] = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + v2[7]) = xmmword_209EE4510;
  return result;
}

uint64_t variable initialization expression of RapidPayloadReply._success()
{
  return 2;
}

uint64_t variable initialization expression of RapidPayloadReply._failureReason()
{
  return 0;
}

uint64_t variable initialization expression of RapidPayloadReply._replyPayload()
{
  return 0;
}

void *ClientDeviceMetadata.protoMessageName.unsafeMutableAddressor()
{
  return &static ClientDeviceMetadata.protoMessageName;
}

unint64_t static ClientDeviceMetadata.protoMessageName.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_209ED4A3C()
{
  uint64_t v0 = sub_209EDE998();
  __swift_allocate_value_buffer(v0, static ClientDeviceMetadata._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static ClientDeviceMetadata._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676051A0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676051A8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_209EE4520;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "build_variant";
  *(void *)(v6 + 8) = 13;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50728];
  uint64_t v8 = sub_209EDE978();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "device_category";
  *(void *)(v10 + 8) = 15;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "device_model";
  *((void *)v12 + 1) = 12;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  unint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)unint64_t v14 = "platform";
  *((void *)v14 + 1) = 8;
  v14[16] = 2;
  v9();
  return sub_209EDE988();
}

uint64_t ClientDeviceMetadata._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_209ED72E8(&qword_267605850, (uint64_t)static ClientDeviceMetadata._protobuf_nameMap);
}

uint64_t static ClientDeviceMetadata._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7360(&qword_267605850, (uint64_t)static ClientDeviceMetadata._protobuf_nameMap, a1);
}

uint64_t ClientDeviceMetadata.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_209EDE868();
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        type metadata accessor for ClientDeviceMetadata(0);
        sub_209EDE898();
        break;
      default:
        continue;
    }
  }
}

uint64_t ClientDeviceMetadata.traverse<A>(visitor:)()
{
  uint64_t result = type metadata accessor for ClientDeviceMetadata(0);
  unint64_t v3 = (int *)result;
  if (*(void *)(v0 + *(int *)(result + 20) + 8)) {
    uint64_t result = sub_209EDE938();
  }
  if (!v1)
  {
    if (*(void *)(v0 + v3[6] + 8)) {
      sub_209EDE938();
    }
    if (*(void *)(v0 + v3[7] + 8)) {
      sub_209EDE938();
    }
    if (*(void *)(v0 + v3[8] + 8)) {
      sub_209EDE938();
    }
    return sub_209EDE818();
  }
  return result;
}

uint64_t ClientDeviceMetadata.hashValue.getter()
{
  return sub_209ED7660((void (*)(void))type metadata accessor for ClientDeviceMetadata, &qword_2676050D8, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_209ED4F3C@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v5 = a1[6];
  unint64_t v6 = (void *)(a2 + a1[5]);
  *unint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (void *)(a2 + v5);
  *uint64_t v7 = 0;
  v7[1] = 0;
  uint64_t v8 = a1[8];
  uint64_t v9 = (void *)(a2 + a1[7]);
  *uint64_t v9 = 0;
  v9[1] = 0;
  unint64_t v10 = (void *)(a2 + v8);
  *unint64_t v10 = 0;
  v10[1] = 0;
  return result;
}

unint64_t sub_209ED4F8C()
{
  return 0xD000000000000014;
}

uint64_t (*sub_209ED4FB4())()
{
  return nullsub_1;
}

uint64_t sub_209ED4FD4()
{
  return ClientDeviceMetadata.decodeMessage<A>(decoder:)();
}

uint64_t sub_209ED4FEC()
{
  return ClientDeviceMetadata.traverse<A>(visitor:)();
}

uint64_t sub_209ED5008(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209ED9918(&qword_267605190, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_209ED5088@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7820(&qword_267605850, (uint64_t)static ClientDeviceMetadata._protobuf_nameMap, a1);
}

uint64_t sub_209ED50AC(uint64_t a1)
{
  uint64_t v2 = sub_209ED9918(&qword_2676050A8, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_209ED511C()
{
  sub_209ED9918(&qword_2676050A8, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);

  return sub_209EDE8F8();
}

void *RequestDescription.protoMessageName.unsafeMutableAddressor()
{
  return &static RequestDescription.protoMessageName;
}

unint64_t static RequestDescription.protoMessageName.getter()
{
  return 0xD000000000000012;
}

uint64_t sub_209ED51C8()
{
  uint64_t v0 = sub_209EDE998();
  __swift_allocate_value_buffer(v0, static RequestDescription._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static RequestDescription._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676051A0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676051A8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_209EE4530;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "team_id";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50728];
  uint64_t v8 = sub_209EDE978();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "issue_category";
  *(void *)(v10 + 8) = 14;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "context_dictionary_data";
  *((void *)v12 + 1) = 23;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  unint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)unint64_t v14 = "request_time";
  *((void *)v14 + 1) = 12;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 5;
  *(void *)uint64_t v15 = "build";
  *(void *)(v15 + 8) = 5;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_209EDE988();
}

uint64_t RequestDescription._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_209ED72E8(&qword_267605858, (uint64_t)static RequestDescription._protobuf_nameMap);
}

uint64_t static RequestDescription._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7360(&qword_267605858, (uint64_t)static RequestDescription._protobuf_nameMap, a1);
}

uint64_t RequestDescription.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_209EDE868();
    uint64_t v3 = v0;
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
      case 2:
      case 5:
        type metadata accessor for RequestDescription(0);
        sub_209EDE898();
        goto LABEL_7;
      case 3:
        type metadata accessor for RequestDescription(0);
        sub_209EDE888();
        goto LABEL_7;
      case 4:
        type metadata accessor for RequestDescription(0);
        sub_209EDE8B8();
LABEL_7:
        uint64_t v3 = 0;
        break;
      default:
        break;
    }
    uint64_t v0 = v3;
  }
}

uint64_t RequestDescription.traverse<A>(visitor:)()
{
  uint64_t result = type metadata accessor for RequestDescription(0);
  uint64_t v3 = (int *)result;
  if (*(void *)(v0 + *(int *)(result + 20) + 8)) {
    uint64_t result = sub_209EDE938();
  }
  if (!v1)
  {
    if (*(void *)(v0 + v3[6] + 8)) {
      sub_209EDE938();
    }
    uint64_t v4 = v0 + v3[7];
    unint64_t v5 = *(void *)(v4 + 8);
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *(void *)v4;
      sub_209ECFCE8(*(void *)v4, *(void *)(v4 + 8));
      sub_209EDE928();
      sub_209ED1190(v6, v5);
    }
    if ((*(unsigned char *)(v0 + v3[8] + 8) & 1) == 0) {
      sub_209EDE958();
    }
    if (*(void *)(v0 + v3[9] + 8)) {
      sub_209EDE938();
    }
    return sub_209EDE818();
  }
  return result;
}

uint64_t RequestDescription.hashValue.getter()
{
  return sub_209ED7660((void (*)(void))type metadata accessor for RequestDescription, &qword_2676050E0, (void (*)(uint64_t))type metadata accessor for RequestDescription);
}

double sub_209ED57AC@<D0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v4 = a1[6];
  unint64_t v5 = (void *)(a2 + a1[5]);
  void *v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (void *)(a2 + v4);
  *uint64_t v6 = 0;
  v6[1] = 0;
  double result = 0.0;
  uint64_t v8 = a1[8];
  *(_OWORD *)(a2 + a1[7]) = xmmword_209EE4510;
  uint64_t v9 = a2 + v8;
  *(void *)uint64_t v9 = 0;
  *(unsigned char *)(v9 + 8) = 1;
  unint64_t v10 = (void *)(a2 + a1[9]);
  *unint64_t v10 = 0;
  v10[1] = 0;
  return result;
}

unint64_t sub_209ED5814()
{
  return 0xD000000000000012;
}

uint64_t sub_209ED5830()
{
  return RequestDescription.decodeMessage<A>(decoder:)();
}

uint64_t sub_209ED5848()
{
  return RequestDescription.traverse<A>(visitor:)();
}

uint64_t sub_209ED5860(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209ED9918(&qword_267605188, (void (*)(uint64_t))type metadata accessor for RequestDescription);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_209ED58DC@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7820(&qword_267605858, (uint64_t)static RequestDescription._protobuf_nameMap, a1);
}

uint64_t sub_209ED5900(uint64_t a1)
{
  uint64_t v2 = sub_209ED9918(&qword_2676050B0, (void (*)(uint64_t))type metadata accessor for RequestDescription);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_209ED596C()
{
  sub_209ED9918(&qword_2676050B0, (void (*)(uint64_t))type metadata accessor for RequestDescription);

  return sub_209EDE8F8();
}

void *FileDescription.protoMessageName.unsafeMutableAddressor()
{
  return &static FileDescription.protoMessageName;
}

uint64_t static FileDescription.protoMessageName.getter()
{
  return 0x63736544656C6946;
}

uint64_t sub_209ED5A1C()
{
  uint64_t v0 = sub_209EDE998();
  __swift_allocate_value_buffer(v0, static FileDescription._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static FileDescription._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676051A0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676051A8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_209EE4540;
  unint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "log_type";
  *(void *)(v6 + 8) = 8;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50728];
  uint64_t v8 = sub_209EDE978();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)unint64_t v10 = "log_size";
  *((void *)v10 + 1) = 8;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "file_name";
  *(void *)(v11 + 8) = 9;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_209EDE988();
}

uint64_t FileDescription._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_209ED72E8(&qword_267605860, (uint64_t)static FileDescription._protobuf_nameMap);
}

uint64_t static FileDescription._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7360(&qword_267605860, (uint64_t)static FileDescription._protobuf_nameMap, a1);
}

uint64_t FileDescription.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_209EDE868();
    if (v0 || (v2 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 3:
        goto LABEL_2;
      case 2:
        type metadata accessor for FileDescription(0);
        sub_209EDE8B8();
        break;
      case 1:
LABEL_2:
        type metadata accessor for FileDescription(0);
        sub_209EDE898();
        break;
    }
    uint64_t v0 = 0;
  }
}

uint64_t FileDescription.traverse<A>(visitor:)()
{
  uint64_t result = type metadata accessor for FileDescription(0);
  uint64_t v3 = result;
  if (*(void *)(v0 + *(int *)(result + 20) + 8)) {
    uint64_t result = sub_209EDE938();
  }
  if (!v1)
  {
    if ((*(unsigned char *)(v0 + *(int *)(v3 + 24) + 8) & 1) == 0) {
      sub_209EDE958();
    }
    if (*(void *)(v0 + *(int *)(v3 + 28) + 8)) {
      sub_209EDE938();
    }
    return sub_209EDE818();
  }
  return result;
}

uint64_t FileDescription.hashValue.getter()
{
  return sub_209ED7660((void (*)(void))type metadata accessor for FileDescription, &qword_2676050E8, (void (*)(uint64_t))type metadata accessor for FileDescription);
}

uint64_t sub_209ED5E98@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v5 = a1[6];
  unint64_t v6 = (void *)(a2 + a1[5]);
  *unint64_t v6 = 0;
  v6[1] = 0;
  uint64_t v7 = a2 + v5;
  *(void *)uint64_t v7 = 0;
  *(unsigned char *)(v7 + 8) = 1;
  uint64_t v8 = (void *)(a2 + a1[7]);
  void *v8 = 0;
  v8[1] = 0;
  return result;
}

uint64_t sub_209ED5EE8()
{
  return 0x63736544656C6946;
}

uint64_t sub_209ED5F0C()
{
  return FileDescription.decodeMessage<A>(decoder:)();
}

uint64_t sub_209ED5F24()
{
  return FileDescription.traverse<A>(visitor:)();
}

uint64_t sub_209ED5F3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209ED9918(&qword_267605180, (void (*)(uint64_t))type metadata accessor for FileDescription);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_209ED5FB8@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7820(&qword_267605860, (uint64_t)static FileDescription._protobuf_nameMap, a1);
}

uint64_t sub_209ED5FDC(uint64_t a1)
{
  uint64_t v2 = sub_209ED9918(&qword_2676050B8, (void (*)(uint64_t))type metadata accessor for FileDescription);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_209ED6048()
{
  sub_209ED9918(&qword_2676050B8, (void (*)(uint64_t))type metadata accessor for FileDescription);

  return sub_209EDE8F8();
}

const char *RapidPayload.protoMessageName.unsafeMutableAddressor()
{
  return "RapidPayload";
}

uint64_t static RapidPayload.protoMessageName.getter()
{
  return 0x7961506469706152;
}

uint64_t sub_209ED60F4()
{
  uint64_t v0 = sub_209EDE998();
  __swift_allocate_value_buffer(v0, static RapidPayload._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static RapidPayload._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676051A0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676051A8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_209EE4530;
  unint64_t v5 = v4 + v3;
  unint64_t v6 = v4 + v3 + v1[14];
  *(void *)(v4 + v3) = 1;
  *(void *)unint64_t v6 = "device_metadata";
  *(void *)(v6 + 8) = 15;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50728];
  uint64_t v8 = sub_209EDE978();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  unint64_t v10 = v5 + v2 + v1[14];
  *(void *)(v5 + v2) = 2;
  *(void *)unint64_t v10 = "payload_metadata";
  *(void *)(v10 + 8) = 16;
  *(unsigned char *)(v10 + 16) = 2;
  v9();
  uint64_t v11 = (void *)(v5 + 2 * v2);
  uint64_t v12 = (char *)v11 + v1[14];
  *uint64_t v11 = 3;
  *(void *)uint64_t v12 = "payload_description";
  *((void *)v12 + 1) = 19;
  v12[16] = 2;
  v9();
  uint64_t v13 = (void *)(v5 + 3 * v2);
  unint64_t v14 = (char *)v13 + v1[14];
  *uint64_t v13 = 4;
  *(void *)unint64_t v14 = "upload_attempts";
  *((void *)v14 + 1) = 15;
  v14[16] = 2;
  v9();
  uint64_t v15 = v5 + 4 * v2 + v1[14];
  *(void *)(v5 + 4 * v2) = 5;
  *(void *)uint64_t v15 = "payload";
  *(void *)(v15 + 8) = 7;
  *(unsigned char *)(v15 + 16) = 2;
  v9();
  return sub_209EDE988();
}

uint64_t RapidPayload._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_209ED72E8(&qword_267605868, (uint64_t)static RapidPayload._protobuf_nameMap);
}

uint64_t static RapidPayload._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7360(&qword_267605868, (uint64_t)static RapidPayload._protobuf_nameMap, a1);
}

uint64_t RapidPayload.decodeMessage<A>(decoder:)()
{
  uint64_t result = sub_209EDE868();
  uint64_t v3 = v0;
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      switch(result)
      {
        case 1:
          type metadata accessor for RapidPayload(0);
          type metadata accessor for ClientDeviceMetadata(0);
          sub_209ED9918(&qword_2676050A8, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
          goto LABEL_13;
        case 2:
          type metadata accessor for RapidPayload(0);
          type metadata accessor for RequestDescription(0);
          unint64_t v5 = (void (*)(uint64_t))type metadata accessor for RequestDescription;
          unint64_t v6 = &qword_2676050B0;
          goto LABEL_12;
        case 3:
          type metadata accessor for RapidPayload(0);
          type metadata accessor for FileDescription(0);
          unint64_t v5 = (void (*)(uint64_t))type metadata accessor for FileDescription;
          unint64_t v6 = &qword_2676050B8;
LABEL_12:
          sub_209ED9918(v6, v5);
LABEL_13:
          uint64_t v4 = v3;
          sub_209EDE8C8();
          goto LABEL_5;
        case 4:
          type metadata accessor for RapidPayload(0);
          uint64_t v4 = v3;
          sub_209EDE8A8();
          goto LABEL_5;
        case 5:
          type metadata accessor for RapidPayload(0);
          uint64_t v4 = v3;
          sub_209EDE888();
LABEL_5:
          uint64_t v3 = v4;
          break;
        default:
          break;
      }
      uint64_t result = sub_209EDE868();
    }
  }
  return result;
}

uint64_t RapidPayload.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t result = sub_209ED6754(v5, a1, a2, a3);
  if (!v4)
  {
    sub_209ED694C(v5, a1, a2, a3);
    sub_209ED6B44(v5, a1, a2, a3);
    uint64_t v10 = type metadata accessor for RapidPayload(0);
    if ((*(unsigned char *)(v5 + *(int *)(v10 + 32) + 4) & 1) == 0) {
      sub_209EDE948();
    }
    uint64_t v11 = v5 + *(int *)(v10 + 36);
    unint64_t v12 = *(void *)(v11 + 8);
    if (v12 >> 60 != 15)
    {
      uint64_t v13 = *(void *)v11;
      sub_209ECFCE8(*(void *)v11, *(void *)(v11 + 8));
      sub_209EDE928();
      sub_209ED1190(v13, v12);
    }
    return sub_209EDE818();
  }
  return result;
}

uint64_t sub_209ED6754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(a1 + *(int *)(v12 + 20), (uint64_t)v7, &qword_267605088);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_209ECFC8C((uint64_t)v7, &qword_267605088);
  }
  sub_209ED3294((uint64_t)v7, (uint64_t)v11, type metadata accessor for ClientDeviceMetadata);
  sub_209ED9918(&qword_2676050A8, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
  sub_209EDE968();
  return sub_209ED3604((uint64_t)v11, type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_209ED694C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RequestDescription(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(a1 + *(int *)(v12 + 24), (uint64_t)v7, &qword_267605080);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_209ECFC8C((uint64_t)v7, &qword_267605080);
  }
  sub_209ED3294((uint64_t)v7, (uint64_t)v11, type metadata accessor for RequestDescription);
  sub_209ED9918(&qword_2676050B0, (void (*)(uint64_t))type metadata accessor for RequestDescription);
  sub_209EDE968();
  return sub_209ED3604((uint64_t)v11, type metadata accessor for RequestDescription);
}

uint64_t sub_209ED6B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v14[1] = a4;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for FileDescription(0);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(a1 + *(int *)(v12 + 28), (uint64_t)v7, &qword_267605078);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1) {
    return sub_209ECFC8C((uint64_t)v7, &qword_267605078);
  }
  sub_209ED3294((uint64_t)v7, (uint64_t)v11, type metadata accessor for FileDescription);
  sub_209ED9918(&qword_2676050B8, (void (*)(uint64_t))type metadata accessor for FileDescription);
  sub_209EDE968();
  return sub_209ED3604((uint64_t)v11, type metadata accessor for FileDescription);
}

uint64_t RapidPayload.hashValue.getter()
{
  return sub_209ED7660((void (*)(void))type metadata accessor for RapidPayload, &qword_2676050F0, (void (*)(uint64_t))type metadata accessor for RapidPayload);
}

double sub_209ED6D88@<D0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v4 = a2 + a1[5];
  uint64_t v5 = type metadata accessor for ClientDeviceMetadata(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  uint64_t v6 = a2 + a1[6];
  uint64_t v7 = type metadata accessor for RequestDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = a2 + a1[7];
  uint64_t v9 = type metadata accessor for FileDescription(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  uint64_t v10 = a1[9];
  uint64_t v11 = a2 + a1[8];
  *(_DWORD *)uint64_t v11 = 0;
  *(unsigned char *)(v11 + 4) = 1;
  double result = 0.0;
  *(_OWORD *)(a2 + v10) = xmmword_209EE4510;
  return result;
}

uint64_t sub_209ED6EB0()
{
  return 0x7961506469706152;
}

uint64_t sub_209ED6ED0()
{
  return RapidPayload.decodeMessage<A>(decoder:)();
}

uint64_t sub_209ED6EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return RapidPayload.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t sub_209ED6F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209ED9918(&qword_267605178, (void (*)(uint64_t))type metadata accessor for RapidPayload);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_209ED6F7C@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7820(&qword_267605868, (uint64_t)static RapidPayload._protobuf_nameMap, a1);
}

uint64_t sub_209ED6FA0(uint64_t a1)
{
  uint64_t v2 = sub_209ED9918((unint64_t *)&qword_267605070, (void (*)(uint64_t))type metadata accessor for RapidPayload);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_209ED700C()
{
  sub_209ED9918((unint64_t *)&qword_267605070, (void (*)(uint64_t))type metadata accessor for RapidPayload);

  return sub_209EDE8F8();
}

void *RapidPayloadReply.protoMessageName.unsafeMutableAddressor()
{
  return &static RapidPayloadReply.protoMessageName;
}

unint64_t static RapidPayloadReply.protoMessageName.getter()
{
  return 0xD000000000000011;
}

uint64_t sub_209ED70B4()
{
  uint64_t v0 = sub_209EDE998();
  __swift_allocate_value_buffer(v0, static RapidPayloadReply._protobuf_nameMap);
  __swift_project_value_buffer(v0, (uint64_t)static RapidPayloadReply._protobuf_nameMap);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2676051A0);
  uint64_t v1 = (int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2676051A8) - 8);
  uint64_t v2 = *(void *)(*(void *)v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(*(void *)v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_209EE4540;
  uint64_t v5 = (void *)(v4 + v3);
  unint64_t v6 = v4 + v3 + v1[14];
  void *v5 = 1;
  *(void *)unint64_t v6 = "success";
  *(void *)(v6 + 8) = 7;
  *(unsigned char *)(v6 + 16) = 2;
  uint64_t v7 = *MEMORY[0x263F50718];
  uint64_t v8 = sub_209EDE978();
  uint64_t v9 = *(void (**)(void))(*(void *)(v8 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v6, v7, v8);
  uint64_t v10 = (char *)v5 + v2 + v1[14];
  *(void *)((char *)v5 + v2) = 2;
  *(void *)uint64_t v10 = "failure_reason";
  *((void *)v10 + 1) = 14;
  v10[16] = 2;
  v9();
  uint64_t v11 = (uint64_t)v5 + 2 * v2 + v1[14];
  *(void *)((char *)v5 + 2 * v2) = 3;
  *(void *)uint64_t v11 = "reply_payload";
  *(void *)(v11 + 8) = 13;
  *(unsigned char *)(v11 + 16) = 2;
  v9();
  return sub_209EDE988();
}

uint64_t RapidPayloadReply._protobuf_nameMap.unsafeMutableAddressor()
{
  return sub_209ED72E8(qword_267605870, (uint64_t)static RapidPayloadReply._protobuf_nameMap);
}

uint64_t sub_209ED72E8(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_209EDE998();

  return __swift_project_value_buffer(v3, a2);
}

uint64_t static RapidPayloadReply._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7360(qword_267605870, (uint64_t)static RapidPayloadReply._protobuf_nameMap, a1);
}

uint64_t sub_209ED7360@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_209EDE998();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t RapidPayloadReply.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = sub_209EDE868();
    uint64_t v1 = v0;
    if (v0 || (v3 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 3:
        type metadata accessor for RapidPayloadReply(0);
        sub_209EDE888();
LABEL_3:
        uint64_t v1 = 0;
        break;
      case 2:
        type metadata accessor for RapidPayloadReply(0);
        sub_209EDE898();
        goto LABEL_3;
      case 1:
        type metadata accessor for RapidPayloadReply(0);
        sub_209EDE878();
        goto LABEL_3;
    }
    uint64_t v0 = v1;
  }
}

uint64_t RapidPayloadReply.traverse<A>(visitor:)()
{
  uint64_t result = type metadata accessor for RapidPayloadReply(0);
  uint64_t v3 = result;
  if (*(unsigned char *)(v0 + *(int *)(result + 20)) != 2) {
    uint64_t result = sub_209EDE918();
  }
  if (!v1)
  {
    if (*(void *)(v0 + *(int *)(v3 + 24) + 8)) {
      sub_209EDE938();
    }
    uint64_t v4 = v0 + *(int *)(v3 + 28);
    unint64_t v5 = *(void *)(v4 + 8);
    if (v5 >> 60 != 15)
    {
      uint64_t v6 = *(void *)v4;
      sub_209ECFCE8(*(void *)v4, *(void *)(v4 + 8));
      sub_209EDE928();
      sub_209ED1190(v6, v5);
    }
    return sub_209EDE818();
  }
  return result;
}

uint64_t RapidPayloadReply.hashValue.getter()
{
  return sub_209ED7660((void (*)(void))type metadata accessor for RapidPayloadReply, &qword_2676050F8, (void (*)(uint64_t))type metadata accessor for RapidPayloadReply);
}

uint64_t sub_209ED7660(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return sub_209EDEA58();
}

double sub_209ED76E8@<D0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0();
  uint64_t v4 = a1[6];
  *(unsigned char *)(a2 + a1[5]) = 2;
  unint64_t v5 = (void *)(a2 + v4);
  void *v5 = 0;
  v5[1] = 0;
  double result = 0.0;
  *(_OWORD *)(a2 + a1[7]) = xmmword_209EE4510;
  return result;
}

unint64_t sub_209ED7734()
{
  return 0xD000000000000011;
}

uint64_t sub_209ED7750()
{
  return RapidPayloadReply.decodeMessage<A>(decoder:)();
}

uint64_t sub_209ED7768()
{
  return RapidPayloadReply.traverse<A>(visitor:)();
}

uint64_t sub_209ED7780(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209ED9918(&qword_267605170, (void (*)(uint64_t))type metadata accessor for RapidPayloadReply);

  return MEMORY[0x270F44AE8](a1, a2, v4);
}

uint64_t sub_209ED77FC@<X0>(uint64_t a1@<X8>)
{
  return sub_209ED7820(qword_267605870, (uint64_t)static RapidPayloadReply._protobuf_nameMap, a1);
}

uint64_t sub_209ED7820@<X0>(void *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_209EDE998();
  uint64_t v6 = __swift_project_value_buffer(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t sub_209ED78BC(uint64_t a1)
{
  uint64_t v2 = sub_209ED9918(&qword_267605148, (void (*)(uint64_t))type metadata accessor for RapidPayloadReply);

  return MEMORY[0x270F44CC0](a1, v2);
}

uint64_t sub_209ED7928()
{
  return sub_209EDEA58();
}

uint64_t sub_209ED7980()
{
  sub_209ED9918(&qword_267605148, (void (*)(uint64_t))type metadata accessor for RapidPayloadReply);

  return sub_209EDE8F8();
}

uint64_t sub_209ED79FC()
{
  return sub_209EDEA58();
}

uint64_t sub_209ED7A54@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_209ECFCE8(a2, a3);
      uint64_t v10 = (char *)sub_209EDE768();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_209EDE788();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_209EDE778();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x209ED7CB8);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_209ED1138(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)sub_209EDE768();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_209EDE788();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_209EDE778();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_209ED7CC8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_209ED7A54((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_209ED7DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_209EDE768();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_209EDE788();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_209EDE778();
  sub_209ED7A54(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_209ED7E58(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x209ED80C0);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_209ECFCE8(a3, a4);
                  sub_209ECFCE8(a1, a2);
                  char v17 = sub_209ED7DA0((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_209ED1138(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_209ECFCE8(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_209ED7DA0(v21, v22, v20, a3, a4);
                  sub_209ED1138(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_209ECFCE8(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_209ECFCE8(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_209ED7CC8(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_209ED1138(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t _s24DiagnosticRequestService17RapidPayloadReplyV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209EDE838();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v32[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v32[-v9];
  uint64_t v11 = type metadata accessor for RapidPayloadReply(0);
  uint64_t v12 = v11;
  uint64_t v13 = *(int *)(v11 + 20);
  int v14 = *(unsigned __int8 *)(a1 + v13);
  int v15 = *(unsigned __int8 *)(a2 + v13);
  if (v14 == 2)
  {
    if (v15 != 2) {
      goto LABEL_20;
    }
  }
  else if (v15 == 2 || ((((v15 & 1) == 0) ^ v14) & 1) == 0)
  {
    goto LABEL_20;
  }
  uint64_t v16 = *(int *)(v11 + 24);
  char v17 = (void *)(a1 + v16);
  uint64_t v18 = *(void *)(a1 + v16 + 8);
  unint64_t v19 = (void *)(a2 + v16);
  uint64_t v20 = v19[1];
  if (!v18)
  {
    if (v20) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  if (!v20) {
    goto LABEL_20;
  }
  BOOL v21 = *v17 == *v19 && v18 == v20;
  if (v21 || (char v22 = 0, (sub_209EDEA18() & 1) != 0))
  {
LABEL_15:
    uint64_t v23 = *(int *)(v12 + 28);
    uint64_t v24 = *(void *)(a1 + v23);
    unint64_t v25 = *(void *)(a1 + v23 + 8);
    __int16 v26 = (uint64_t *)(a2 + v23);
    uint64_t v27 = *v26;
    unint64_t v28 = v26[1];
    if (v25 >> 60 == 15)
    {
      if (v28 >> 60 == 15) {
        goto LABEL_23;
      }
      goto LABEL_19;
    }
    if (v28 >> 60 == 15)
    {
LABEL_19:
      sub_209ED2284(v24, v25);
      sub_209ED2284(v27, v28);
      sub_209ED1190(v24, v25);
      sub_209ED1190(v27, v28);
      goto LABEL_20;
    }
    sub_209ED2284(v24, v25);
    sub_209ED2284(v27, v28);
    int v33 = sub_209ED7E58(v24, v25, v27, v28);
    sub_209ED1190(v27, v28);
    sub_209ED1190(v24, v25);
    if (v33)
    {
LABEL_23:
      char v30 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16);
      v30(v10, a1, v4);
      v30(v8, a2, v4);
      sub_209ED9918(&qword_267605198, MEMORY[0x263F50560]);
      char v22 = sub_209EDE9B8();
      uint64_t v31 = *(void (**)(unsigned char *, uint64_t))(v5 + 8);
      v31(v8, v4);
      v31(v10, v4);
      return v22 & 1;
    }
LABEL_20:
    char v22 = 0;
  }
  return v22 & 1;
}

uint64_t _s24DiagnosticRequestService15FileDescriptionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209EDE838();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = (int *)type metadata accessor for FileDescription(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  int v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_25;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_25;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_209EDEA18() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = v11[6];
    uint64_t v20 = (void *)(a1 + v19);
    char v21 = *(unsigned char *)(a1 + v19 + 8);
    char v22 = (void *)(a2 + v19);
    int v23 = *(unsigned __int8 *)(a2 + v19 + 8);
    if (v21)
    {
      if (!v23) {
        goto LABEL_25;
      }
    }
    else
    {
      if (*v20 != *v22) {
        LOBYTE(v23) = 1;
      }
      if (v23) {
        goto LABEL_25;
      }
    }
    uint64_t v24 = v11[7];
    unint64_t v25 = (void *)(a1 + v24);
    uint64_t v26 = *(void *)(a1 + v24 + 8);
    uint64_t v27 = (void *)(a2 + v24);
    uint64_t v28 = v27[1];
    if (v26)
    {
      if (v28)
      {
        if (*v25 != *v27 || v26 != v28)
        {
          char v18 = 0;
          if ((sub_209EDEA18() & 1) == 0) {
            return v18 & 1;
          }
        }
LABEL_27:
        uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v31(v10, a1, v4);
        v31(v8, a2, v4);
        sub_209ED9918(&qword_267605198, MEMORY[0x263F50560]);
        char v18 = sub_209EDE9B8();
        uint64_t v32 = *(void (**)(char *, uint64_t))(v5 + 8);
        v32(v8, v4);
        v32(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v28)
    {
      goto LABEL_27;
    }
LABEL_25:
    char v18 = 0;
  }
  return v18 & 1;
}

uint64_t _s24DiagnosticRequestService12RapidPayloadV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v111 = a1;
  uint64_t v112 = a2;
  uint64_t v2 = sub_209EDE838();
  uint64_t v92 = *(void *)(v2 - 8);
  uint64_t v93 = v2;
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  v91 = (char *)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v3);
  v90 = (char *)&v90 - v5;
  uint64_t v97 = type metadata accessor for FileDescription(0);
  uint64_t v107 = *(void *)(v97 - 8);
  MEMORY[0x270FA5388](v97);
  uint64_t v94 = (uint64_t)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676051B0);
  MEMORY[0x270FA5388](v96);
  uint64_t v98 = (uint64_t)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  v100 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v105 = (char *)&v90 - v12;
  MEMORY[0x270FA5388](v11);
  v106 = (char *)&v90 - v13;
  uint64_t v14 = type metadata accessor for RequestDescription(0);
  uint64_t v102 = *(void *)(v14 - 8);
  uint64_t v103 = v14;
  MEMORY[0x270FA5388](v14);
  uint64_t v95 = (uint64_t)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676051B8);
  MEMORY[0x270FA5388](v101);
  uint64_t v104 = (uint64_t)&v90 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
  uint64_t v18 = MEMORY[0x270FA5388](v17 - 8);
  uint64_t v99 = (uint64_t)&v90 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v108 = (uint64_t)&v90 - v21;
  MEMORY[0x270FA5388](v20);
  uint64_t v109 = (uint64_t)&v90 - v22;
  uint64_t v23 = type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v24 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v23);
  uint64_t v26 = (char *)&v90 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2676051C0);
  uint64_t v28 = v27 - 8;
  MEMORY[0x270FA5388](v27);
  char v30 = (char *)&v90 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
  uint64_t v32 = MEMORY[0x270FA5388](v31 - 8);
  uint64_t v34 = (char *)&v90 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = MEMORY[0x270FA5388](v32);
  uint64_t v37 = (char *)&v90 - v36;
  MEMORY[0x270FA5388](v35);
  uint64_t v39 = (char *)&v90 - v38;
  uint64_t v40 = type metadata accessor for RapidPayload(0);
  sub_209ECFC28(v111 + *(int *)(v40 + 20), (uint64_t)v39, &qword_267605088);
  v110 = (int *)v40;
  sub_209ECFC28(v112 + *(int *)(v40 + 20), (uint64_t)v37, &qword_267605088);
  uint64_t v41 = (uint64_t)&v30[*(int *)(v28 + 56)];
  sub_209ECFC28((uint64_t)v39, (uint64_t)v30, &qword_267605088);
  sub_209ECFC28((uint64_t)v37, v41, &qword_267605088);
  uint64_t v42 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48);
  if (v42((uint64_t)v30, 1, v23) == 1)
  {
    sub_209ECFC8C((uint64_t)v37, &qword_267605088);
    sub_209ECFC8C((uint64_t)v39, &qword_267605088);
    if (v42(v41, 1, v23) == 1)
    {
      sub_209ECFC8C((uint64_t)v30, &qword_267605088);
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v43 = &qword_2676051C0;
    uint64_t v44 = (uint64_t)v30;
LABEL_22:
    sub_209ECFC8C(v44, v43);
    goto LABEL_23;
  }
  sub_209ECFC28((uint64_t)v30, (uint64_t)v34, &qword_267605088);
  if (v42(v41, 1, v23) == 1)
  {
    sub_209ECFC8C((uint64_t)v37, &qword_267605088);
    sub_209ECFC8C((uint64_t)v39, &qword_267605088);
    sub_209ED3604((uint64_t)v34, type metadata accessor for ClientDeviceMetadata);
    goto LABEL_6;
  }
  sub_209ED3294(v41, (uint64_t)v26, type metadata accessor for ClientDeviceMetadata);
  char v45 = _s24DiagnosticRequestService20ClientDeviceMetadataV2eeoiySbAC_ACtFZ_0((uint64_t)v34, (uint64_t)v26);
  sub_209ED3604((uint64_t)v26, type metadata accessor for ClientDeviceMetadata);
  sub_209ECFC8C((uint64_t)v37, &qword_267605088);
  sub_209ECFC8C((uint64_t)v39, &qword_267605088);
  sub_209ED3604((uint64_t)v34, type metadata accessor for ClientDeviceMetadata);
  sub_209ECFC8C((uint64_t)v30, &qword_267605088);
  if ((v45 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_8:
  long long v46 = v110;
  uint64_t v47 = v111;
  uint64_t v48 = v109;
  sub_209ECFC28(v111 + v110[6], v109, &qword_267605080);
  uint64_t v49 = v112;
  uint64_t v50 = v108;
  sub_209ECFC28(v112 + v46[6], v108, &qword_267605080);
  uint64_t v51 = v104;
  uint64_t v52 = v104 + *(int *)(v101 + 48);
  sub_209ECFC28(v48, v104, &qword_267605080);
  sub_209ECFC28(v50, v52, &qword_267605080);
  uint64_t v53 = v103;
  int v54 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v102 + 48);
  if (v54(v51, 1, v103) == 1)
  {
    sub_209ECFC8C(v50, &qword_267605080);
    sub_209ECFC8C(v48, &qword_267605080);
    int v55 = v54(v52, 1, v53);
    uint64_t v57 = (uint64_t)v106;
    uint64_t v56 = v107;
    uint64_t v58 = (uint64_t)v100;
    uint64_t v59 = (uint64_t)v105;
    if (v55 == 1)
    {
      sub_209ECFC8C(v51, &qword_267605080);
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v43 = &qword_2676051B8;
LABEL_21:
    uint64_t v44 = v51;
    goto LABEL_22;
  }
  uint64_t v60 = v99;
  sub_209ECFC28(v51, v99, &qword_267605080);
  int v61 = v54(v52, 1, v53);
  uint64_t v57 = (uint64_t)v106;
  uint64_t v56 = v107;
  uint64_t v59 = (uint64_t)v105;
  if (v61 == 1)
  {
    sub_209ECFC8C(v108, &qword_267605080);
    sub_209ECFC8C(v109, &qword_267605080);
    sub_209ED3604(v60, type metadata accessor for RequestDescription);
    goto LABEL_13;
  }
  uint64_t v62 = v95;
  sub_209ED3294(v52, v95, type metadata accessor for RequestDescription);
  char v63 = _s24DiagnosticRequestService0B11DescriptionV2eeoiySbAC_ACtFZ_0(v60, v62);
  sub_209ED3604(v62, type metadata accessor for RequestDescription);
  sub_209ECFC8C(v108, &qword_267605080);
  sub_209ECFC8C(v109, &qword_267605080);
  uint64_t v58 = (uint64_t)v100;
  sub_209ED3604(v60, type metadata accessor for RequestDescription);
  sub_209ECFC8C(v51, &qword_267605080);
  if ((v63 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_15:
  uint64_t v64 = v110;
  sub_209ECFC28(v47 + v110[7], v57, &qword_267605078);
  sub_209ECFC28(v49 + v64[7], v59, &qword_267605078);
  uint64_t v51 = v98;
  uint64_t v65 = v98 + *(int *)(v96 + 48);
  sub_209ECFC28(v57, v98, &qword_267605078);
  sub_209ECFC28(v59, v65, &qword_267605078);
  long long v66 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48);
  uint64_t v67 = v97;
  if (v66(v51, 1, v97) != 1)
  {
    sub_209ECFC28(v51, v58, &qword_267605078);
    if (v66(v65, 1, v67) != 1)
    {
      uint64_t v70 = v94;
      sub_209ED3294(v65, v94, type metadata accessor for FileDescription);
      char v71 = _s24DiagnosticRequestService15FileDescriptionV2eeoiySbAC_ACtFZ_0(v58, v70);
      sub_209ED3604(v70, type metadata accessor for FileDescription);
      sub_209ECFC8C(v59, &qword_267605078);
      sub_209ECFC8C(v57, &qword_267605078);
      sub_209ED3604(v58, type metadata accessor for FileDescription);
      sub_209ECFC8C(v51, &qword_267605078);
      if ((v71 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_26;
    }
    sub_209ECFC8C(v59, &qword_267605078);
    sub_209ECFC8C(v57, &qword_267605078);
    sub_209ED3604(v58, type metadata accessor for FileDescription);
    goto LABEL_20;
  }
  sub_209ECFC8C(v59, &qword_267605078);
  sub_209ECFC8C(v57, &qword_267605078);
  if (v66(v65, 1, v67) != 1)
  {
LABEL_20:
    uint64_t v43 = &qword_2676051B0;
    goto LABEL_21;
  }
  sub_209ECFC8C(v51, &qword_267605078);
LABEL_26:
  uint64_t v72 = v110[8];
  uint64_t v73 = (_DWORD *)(v47 + v72);
  char v74 = *(unsigned char *)(v47 + v72 + 4);
  uint64_t v75 = (_DWORD *)(v49 + v72);
  int v76 = *(unsigned __int8 *)(v49 + v72 + 4);
  if (v74)
  {
    if (!v76) {
      goto LABEL_23;
    }
  }
  else
  {
    if (*v73 != *v75) {
      LOBYTE(v76) = 1;
    }
    if (v76) {
      goto LABEL_23;
    }
  }
  uint64_t v77 = v110[9];
  uint64_t v78 = *(void *)(v47 + v77);
  unint64_t v79 = *(void *)(v47 + v77 + 8);
  uint64_t v80 = (uint64_t *)(v49 + v77);
  uint64_t v81 = *v80;
  unint64_t v82 = v80[1];
  if (v79 >> 60 == 15)
  {
    if (v82 >> 60 == 15) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  if (v82 >> 60 == 15)
  {
LABEL_36:
    sub_209ED2284(v78, v79);
    sub_209ED2284(v81, v82);
    sub_209ED1190(v78, v79);
    sub_209ED1190(v81, v82);
    goto LABEL_23;
  }
  sub_209ED2284(v78, v79);
  sub_209ED2284(v81, v82);
  char v83 = sub_209ED7E58(v78, v79, v81, v82);
  sub_209ED1190(v81, v82);
  sub_209ED1190(v78, v79);
  if (v83)
  {
LABEL_38:
    uint64_t v85 = v92;
    uint64_t v84 = v93;
    v86 = *(void (**)(char *, uint64_t, uint64_t))(v92 + 16);
    v87 = v90;
    v86(v90, v47, v93);
    v88 = v91;
    v86(v91, v49, v84);
    sub_209ED9918(&qword_267605198, MEMORY[0x263F50560]);
    char v68 = sub_209EDE9B8();
    v89 = *(void (**)(char *, uint64_t))(v85 + 8);
    v89(v88, v84);
    v89(v87, v84);
    return v68 & 1;
  }
LABEL_23:
  char v68 = 0;
  return v68 & 1;
}

uint64_t _s24DiagnosticRequestService0B11DescriptionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209EDE838();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = &v45[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = &v45[-v9];
  uint64_t v11 = (int *)type metadata accessor for RequestDescription(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_38;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_38;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_209EDEA18() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = v11[6];
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = *(void *)(a1 + v19 + 8);
    uint64_t v22 = (void *)(a2 + v19);
    uint64_t v23 = v22[1];
    if (v21)
    {
      if (!v23) {
        goto LABEL_38;
      }
      if (*v20 != *v22 || v21 != v23)
      {
        char v18 = 0;
        if ((sub_209EDEA18() & 1) == 0) {
          return v18 & 1;
        }
      }
    }
    else if (v23)
    {
      goto LABEL_38;
    }
    uint64_t v47 = v5;
    uint64_t v25 = v11[7];
    uint64_t v26 = *(void *)(a1 + v25);
    unint64_t v27 = *(void *)(a1 + v25 + 8);
    uint64_t v28 = (uint64_t *)(a2 + v25);
    uint64_t v29 = *v28;
    unint64_t v30 = v28[1];
    if (v27 >> 60 == 15)
    {
      if (v30 >> 60 == 15)
      {
LABEL_25:
        uint64_t v31 = v11[8];
        uint64_t v32 = (void *)(a1 + v31);
        char v33 = *(unsigned char *)(a1 + v31 + 8);
        uint64_t v34 = (void *)(a2 + v31);
        int v35 = *(unsigned __int8 *)(a2 + v31 + 8);
        if (v33)
        {
          if (!v35) {
            goto LABEL_38;
          }
        }
        else
        {
          if (*v32 != *v34) {
            LOBYTE(v35) = 1;
          }
          if (v35) {
            goto LABEL_38;
          }
        }
        uint64_t v36 = v11[9];
        uint64_t v37 = (void *)(a1 + v36);
        uint64_t v38 = *(void *)(a1 + v36 + 8);
        uint64_t v39 = (void *)(a2 + v36);
        uint64_t v40 = v39[1];
        if (v38)
        {
          uint64_t v41 = v47;
          if (v40)
          {
            if (*v37 != *v39 || v38 != v40)
            {
              char v18 = 0;
              if ((sub_209EDEA18() & 1) == 0) {
                return v18 & 1;
              }
            }
LABEL_40:
            uint64_t v43 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v41 + 16);
            v43(v10, a1, v4);
            v43(v8, a2, v4);
            sub_209ED9918(&qword_267605198, MEMORY[0x263F50560]);
            char v18 = sub_209EDE9B8();
            uint64_t v44 = *(void (**)(unsigned char *, uint64_t))(v41 + 8);
            v44(v8, v4);
            v44(v10, v4);
            return v18 & 1;
          }
        }
        else
        {
          uint64_t v41 = v47;
          if (!v40) {
            goto LABEL_40;
          }
        }
LABEL_38:
        char v18 = 0;
        return v18 & 1;
      }
    }
    else if (v30 >> 60 != 15)
    {
      sub_209ED2284(v26, v27);
      sub_209ED2284(v29, v30);
      int v46 = sub_209ED7E58(v26, v27, v29, v30);
      sub_209ED1190(v29, v30);
      sub_209ED1190(v26, v27);
      if ((v46 & 1) == 0) {
        goto LABEL_38;
      }
      goto LABEL_25;
    }
    sub_209ED2284(v26, v27);
    sub_209ED2284(v29, v30);
    sub_209ED1190(v26, v27);
    sub_209ED1190(v29, v30);
    goto LABEL_38;
  }
  return v18 & 1;
}

uint64_t _s24DiagnosticRequestService20ClientDeviceMetadataV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209EDE838();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  uint64_t v10 = (char *)&v40 - v9;
  uint64_t v11 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v12 = v11[5];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = *(void *)(a1 + v12 + 8);
  uint64_t v15 = (void *)(a2 + v12);
  uint64_t v16 = v15[1];
  if (!v14)
  {
    if (v16) {
      goto LABEL_37;
    }
    goto LABEL_10;
  }
  if (!v16) {
    goto LABEL_37;
  }
  BOOL v17 = *v13 == *v15 && v14 == v16;
  if (v17 || (char v18 = 0, (sub_209EDEA18() & 1) != 0))
  {
LABEL_10:
    uint64_t v19 = v11[6];
    uint64_t v20 = (void *)(a1 + v19);
    uint64_t v21 = *(void *)(a1 + v19 + 8);
    uint64_t v22 = (void *)(a2 + v19);
    uint64_t v23 = v22[1];
    if (v21)
    {
      if (!v23) {
        goto LABEL_37;
      }
      if (*v20 != *v22 || v21 != v23)
      {
        char v18 = 0;
        if ((sub_209EDEA18() & 1) == 0) {
          return v18 & 1;
        }
      }
    }
    else if (v23)
    {
      goto LABEL_37;
    }
    uint64_t v25 = v11[7];
    uint64_t v26 = (void *)(a1 + v25);
    uint64_t v27 = *(void *)(a1 + v25 + 8);
    uint64_t v28 = (void *)(a2 + v25);
    uint64_t v29 = v28[1];
    if (v27)
    {
      if (!v29) {
        goto LABEL_37;
      }
      if (*v26 != *v28 || v27 != v29)
      {
        char v18 = 0;
        if ((sub_209EDEA18() & 1) == 0) {
          return v18 & 1;
        }
      }
    }
    else if (v29)
    {
      goto LABEL_37;
    }
    uint64_t v31 = v11[8];
    uint64_t v32 = (void *)(a1 + v31);
    uint64_t v33 = *(void *)(a1 + v31 + 8);
    uint64_t v34 = (void *)(a2 + v31);
    uint64_t v35 = v34[1];
    if (v33)
    {
      if (v35)
      {
        if (*v32 != *v34 || v33 != v35)
        {
          char v18 = 0;
          if ((sub_209EDEA18() & 1) == 0) {
            return v18 & 1;
          }
        }
LABEL_39:
        uint64_t v38 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
        v38(v10, a1, v4);
        v38(v8, a2, v4);
        sub_209ED9918(&qword_267605198, MEMORY[0x263F50560]);
        char v18 = sub_209EDE9B8();
        uint64_t v39 = *(void (**)(char *, uint64_t))(v5 + 8);
        v39(v8, v4);
        v39(v10, v4);
        return v18 & 1;
      }
    }
    else if (!v35)
    {
      goto LABEL_39;
    }
LABEL_37:
    char v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_209ED9918(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_209ED9960()
{
  return sub_209ED9918(&qword_267605100, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_209ED99A8()
{
  return sub_209ED9918(&qword_2676050A8, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_209ED99F0()
{
  return sub_209ED9918(&qword_2676050D8, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_209ED9A38()
{
  return sub_209ED9918(&qword_267605108, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
}

uint64_t sub_209ED9A80()
{
  return sub_209ED9918(&qword_267605110, (void (*)(uint64_t))type metadata accessor for RequestDescription);
}

uint64_t sub_209ED9AC8()
{
  return sub_209ED9918(&qword_2676050B0, (void (*)(uint64_t))type metadata accessor for RequestDescription);
}

uint64_t sub_209ED9B10()
{
  return sub_209ED9918(&qword_2676050E0, (void (*)(uint64_t))type metadata accessor for RequestDescription);
}

uint64_t sub_209ED9B58()
{
  return sub_209ED9918(&qword_267605118, (void (*)(uint64_t))type metadata accessor for RequestDescription);
}

uint64_t sub_209ED9BA0()
{
  return sub_209ED9918(&qword_267605120, (void (*)(uint64_t))type metadata accessor for FileDescription);
}

uint64_t sub_209ED9BE8()
{
  return sub_209ED9918(&qword_2676050B8, (void (*)(uint64_t))type metadata accessor for FileDescription);
}

uint64_t sub_209ED9C30()
{
  return sub_209ED9918(&qword_2676050E8, (void (*)(uint64_t))type metadata accessor for FileDescription);
}

uint64_t sub_209ED9C78()
{
  return sub_209ED9918(&qword_267605128, (void (*)(uint64_t))type metadata accessor for FileDescription);
}

uint64_t sub_209ED9CC0()
{
  return sub_209ED9918(&qword_267605130, (void (*)(uint64_t))type metadata accessor for RapidPayload);
}

uint64_t sub_209ED9D08()
{
  return sub_209ED9918((unint64_t *)&qword_267605070, (void (*)(uint64_t))type metadata accessor for RapidPayload);
}

uint64_t sub_209ED9D50()
{
  return sub_209ED9918(&qword_2676050F0, (void (*)(uint64_t))type metadata accessor for RapidPayload);
}

uint64_t sub_209ED9D98()
{
  return sub_209ED9918(&qword_267605138, (void (*)(uint64_t))type metadata accessor for RapidPayload);
}

uint64_t sub_209ED9DE0()
{
  return sub_209ED9918(&qword_267605140, (void (*)(uint64_t))type metadata accessor for RapidPayloadReply);
}

uint64_t sub_209ED9E28()
{
  return sub_209ED9918(&qword_267605148, (void (*)(uint64_t))type metadata accessor for RapidPayloadReply);
}

uint64_t sub_209ED9E70()
{
  return sub_209ED9918(&qword_2676050F8, (void (*)(uint64_t))type metadata accessor for RapidPayloadReply);
}

uint64_t sub_209ED9EB8()
{
  return sub_209ED9918(&qword_267605150, (void (*)(uint64_t))type metadata accessor for RapidPayloadReply);
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientDeviceMetadata(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_209EDE838();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = a3[8];
    char v18 = (uint64_t *)((char *)a1 + v16);
    uint64_t v19 = (uint64_t *)((char *)a2 + v16);
    uint64_t v20 = v19[1];
    void *v18 = *v19;
    v18[1] = v20;
    uint64_t v21 = (uint64_t *)((char *)a1 + v17);
    uint64_t v22 = (uint64_t *)((char *)a2 + v17);
    uint64_t v23 = v22[1];
    *uint64_t v21 = *v22;
    v21[1] = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for ClientDeviceMetadata(uint64_t a1)
{
  uint64_t v2 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ClientDeviceMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v15);
  char v18 = (void *)(a2 + v15);
  uint64_t v19 = v18[1];
  *uint64_t v17 = *v18;
  v17[1] = v19;
  uint64_t v20 = (void *)(a1 + v16);
  uint64_t v21 = (void *)(a2 + v16);
  uint64_t v22 = v21[1];
  *uint64_t v20 = *v21;
  v20[1] = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ClientDeviceMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (void *)(a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[8];
  uint64_t v17 = (void *)(a1 + v16);
  char v18 = (void *)(a2 + v16);
  *uint64_t v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for ClientDeviceMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  return a1;
}

uint64_t assignWithTake for ClientDeviceMetadata(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  char v18 = (void *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  uint64_t v21 = *v19;
  uint64_t v20 = v19[1];
  void *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  uint64_t v22 = a3[8];
  uint64_t v23 = (void *)(a1 + v22);
  uint64_t v24 = (uint64_t *)(a2 + v22);
  uint64_t v26 = *v24;
  uint64_t v25 = v24[1];
  *uint64_t v23 = v26;
  v23[1] = v25;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientDeviceMetadata(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm);
}

uint64_t storeEnumTagSinglePayload for ClientDeviceMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm);
}

uint64_t sub_209EDA468()
{
  uint64_t result = sub_209EDE838();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RequestDescription(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_209EDE838();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (uint64_t *)((char *)a1 + v9);
    uint64_t v14 = (uint64_t *)((char *)a2 + v9);
    uint64_t v15 = v14[1];
    *uint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[7];
    uint64_t v17 = (char *)a1 + v16;
    char v18 = (uint64_t *)((char *)a2 + v16);
    unint64_t v19 = *(uint64_t *)((char *)a2 + v16 + 8);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v19 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
    }
    else
    {
      uint64_t v21 = *v18;
      sub_209ECFCE8(*v18, v19);
      *(void *)uint64_t v17 = v21;
      *((void *)v17 + 1) = v19;
    }
    uint64_t v22 = a3[8];
    uint64_t v23 = a3[9];
    uint64_t v24 = (char *)a1 + v22;
    uint64_t v25 = (char *)a2 + v22;
    *(void *)uint64_t v24 = *(void *)v25;
    v24[8] = v25[8];
    uint64_t v26 = (uint64_t *)((char *)a1 + v23);
    uint64_t v27 = (uint64_t *)((char *)a2 + v23);
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for RequestDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int v5 = (uint64_t *)(a1 + *(int *)(a2 + 28));
  unint64_t v6 = v5[1];
  if (v6 >> 60 != 15) {
    sub_209ED1138(*v5, v6);
  }

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for RequestDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (void *)(a2 + v8);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a1 + v15;
  uint64_t v17 = (uint64_t *)(a2 + v15);
  unint64_t v18 = *(void *)(a2 + v15 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v18 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
  }
  else
  {
    uint64_t v19 = *v17;
    sub_209ECFCE8(*v17, v18);
    *(void *)uint64_t v16 = v19;
    *(void *)(v16 + 8) = v18;
  }
  uint64_t v20 = a3[8];
  uint64_t v21 = a3[9];
  uint64_t v22 = a1 + v20;
  uint64_t v23 = a2 + v20;
  *(void *)uint64_t v22 = *(void *)v23;
  *(unsigned char *)(v22 + 8) = *(unsigned char *)(v23 + 8);
  uint64_t v24 = (void *)(a1 + v21);
  uint64_t v25 = (void *)(a2 + v21);
  uint64_t v26 = v25[1];
  void *v24 = *v25;
  v24[1] = v26;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RequestDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = (uint64_t *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  unint64_t v16 = *(void *)(a2 + v13 + 8);
  if (*(void *)(a1 + v13 + 8) >> 60 != 15)
  {
    if (v16 >> 60 != 15)
    {
      uint64_t v18 = *v15;
      sub_209ECFCE8(v18, v16);
      uint64_t v19 = *v14;
      unint64_t v20 = v14[1];
      *uint64_t v14 = v18;
      v14[1] = v16;
      sub_209ED1138(v19, v20);
      goto LABEL_8;
    }
    sub_209EDA9DC((uint64_t)v14);
    goto LABEL_6;
  }
  if (v16 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
    goto LABEL_8;
  }
  uint64_t v17 = *v15;
  sub_209ECFCE8(v17, v16);
  *uint64_t v14 = v17;
  v14[1] = v16;
LABEL_8:
  uint64_t v21 = a3[8];
  uint64_t v22 = a1 + v21;
  uint64_t v23 = (uint64_t *)(a2 + v21);
  uint64_t v24 = *v23;
  *(unsigned char *)(v22 + 8) = *((unsigned char *)v23 + 8);
  *(void *)uint64_t v22 = v24;
  uint64_t v25 = a3[9];
  uint64_t v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  *uint64_t v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_209EDA9DC(uint64_t a1)
{
  return a1;
}

uint64_t initializeWithTake for RequestDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  *(void *)uint64_t v9 = *(void *)v10;
  *(unsigned char *)(v9 + 8) = *(unsigned char *)(v10 + 8);
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for RequestDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[7];
  uint64_t v18 = (uint64_t *)(a1 + v17);
  uint64_t v19 = (uint64_t *)(a2 + v17);
  unint64_t v20 = *(void *)(a1 + v17 + 8);
  if (v20 >> 60 != 15)
  {
    unint64_t v21 = v19[1];
    if (v21 >> 60 != 15)
    {
      uint64_t v22 = *v18;
      uint64_t *v18 = *v19;
      v18[1] = v21;
      sub_209ED1138(v22, v20);
      goto LABEL_6;
    }
    sub_209EDA9DC((uint64_t)v18);
  }
  *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
LABEL_6:
  uint64_t v23 = a3[8];
  uint64_t v24 = a3[9];
  uint64_t v25 = a1 + v23;
  uint64_t v26 = a2 + v23;
  *(void *)uint64_t v25 = *(void *)v26;
  *(unsigned char *)(v25 + 8) = *(unsigned char *)(v26 + 8);
  uint64_t v27 = (void *)(a1 + v24);
  uint64_t v28 = (uint64_t *)(a2 + v24);
  uint64_t v30 = *v28;
  uint64_t v29 = v28[1];
  void *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_0);
}

uint64_t storeEnumTagSinglePayload for RequestDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_0);
}

uint64_t sub_209EDAC48()
{
  uint64_t result = sub_209EDE838();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for FileDescription(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_209EDE838();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    v13[8] = v14[8];
    *(void *)uint64_t v13 = *(void *)v14;
    uint64_t v15 = a3[7];
    uint64_t v16 = (uint64_t *)((char *)a1 + v15);
    uint64_t v17 = (uint64_t *)((char *)a2 + v15);
    uint64_t v18 = v17[1];
    *uint64_t v16 = *v17;
    v16[1] = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for FileDescription(uint64_t a1)
{
  uint64_t v2 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for FileDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  uint64_t v17 = v16[1];
  *uint64_t v15 = *v16;
  v15[1] = v17;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for FileDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = (uint64_t *)(a2 + v10);
  uint64_t v13 = *v12;
  *(unsigned char *)(v11 + 8) = *((unsigned char *)v12 + 8);
  *(void *)uint64_t v11 = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v14);
  uint64_t v16 = (void *)(a2 + v14);
  *uint64_t v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for FileDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(unsigned char *)(v8 + 8) = *(unsigned char *)(v9 + 8);
  *(void *)uint64_t v8 = *(void *)v9;
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for FileDescription(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = a3[7];
  uint64_t v14 = a1 + v12;
  uint64_t v15 = a2 + v12;
  *(void *)uint64_t v14 = *(void *)v15;
  *(unsigned char *)(v14 + 8) = *(unsigned char *)(v15 + 8);
  uint64_t v16 = (void *)(a1 + v13);
  uint64_t v17 = (uint64_t *)(a2 + v13);
  uint64_t v19 = *v17;
  uint64_t v18 = v17[1];
  *uint64_t v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FileDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_indexTm_1);
}

uint64_t storeEnumTagSinglePayload for FileDescription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_indexTm_1);
}

uint64_t sub_209EDB1B8()
{
  return sub_209EDDF94();
}

uint64_t *initializeBufferWithCopyOfBuffer for RapidPayload(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_209EDE838();
    uint64_t v8 = *(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 16);
    v8((char *)a1, (char *)a2, v7);
    uint64_t v9 = a3[5];
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = (int *)type metadata accessor for ClientDeviceMetadata(0);
    uint64_t v13 = *((void *)v12 - 1);
    v88 = v8;
    uint64_t v89 = v7;
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v13 + 48))(v11, 1, v12))
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
      memcpy(v10, v11, *(void *)(*(void *)(v14 - 8) + 64));
    }
    else
    {
      v8(v10, v11, v7);
      uint64_t v16 = v12[5];
      uint64_t v17 = &v10[v16];
      uint64_t v18 = &v11[v16];
      uint64_t v19 = *((void *)v18 + 1);
      *(void *)uint64_t v17 = *(void *)v18;
      *((void *)v17 + 1) = v19;
      uint64_t v20 = v12[6];
      unint64_t v21 = &v10[v20];
      uint64_t v22 = &v11[v20];
      uint64_t v23 = *((void *)v22 + 1);
      *(void *)unint64_t v21 = *(void *)v22;
      *((void *)v21 + 1) = v23;
      uint64_t v24 = v12[7];
      uint64_t v25 = &v10[v24];
      uint64_t v26 = &v11[v24];
      uint64_t v27 = *((void *)v26 + 1);
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = v27;
      uint64_t v28 = v12[8];
      uint64_t v29 = &v10[v28];
      uint64_t v30 = &v11[v28];
      uint64_t v31 = *((void *)v30 + 1);
      *(void *)uint64_t v29 = *(void *)v30;
      *((void *)v29 + 1) = v31;
      uint64_t v32 = *(void (**)(char *, void, uint64_t, int *))(v13 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v32(v10, 0, 1, v12);
    }
    uint64_t v33 = a3[6];
    uint64_t v34 = (char *)a1 + v33;
    uint64_t v35 = (char *)a2 + v33;
    uint64_t v36 = (int *)type metadata accessor for RequestDescription(0);
    uint64_t v37 = *((void *)v36 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v37 + 48))(v35, 1, v36))
    {
      uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
      memcpy(v34, v35, *(void *)(*(void *)(v38 - 8) + 64));
    }
    else
    {
      uint64_t v87 = v37;
      v88(v34, v35, v89);
      uint64_t v39 = v36[5];
      uint64_t v40 = &v34[v39];
      uint64_t v41 = &v35[v39];
      uint64_t v42 = *((void *)v41 + 1);
      *(void *)uint64_t v40 = *(void *)v41;
      *((void *)v40 + 1) = v42;
      uint64_t v43 = v36[6];
      uint64_t v44 = &v34[v43];
      char v45 = &v35[v43];
      uint64_t v46 = *((void *)v45 + 1);
      *(void *)uint64_t v44 = *(void *)v45;
      *((void *)v44 + 1) = v46;
      uint64_t v47 = v36[7];
      uint64_t v48 = &v34[v47];
      uint64_t v49 = (uint64_t *)&v35[v47];
      unint64_t v50 = *(void *)&v35[v47 + 8];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v50 >> 60 == 15)
      {
        *(_OWORD *)uint64_t v48 = *(_OWORD *)v49;
      }
      else
      {
        uint64_t v51 = *v49;
        sub_209ECFCE8(*v49, v50);
        *(void *)uint64_t v48 = v51;
        *((void *)v48 + 1) = v50;
      }
      uint64_t v52 = v36[8];
      uint64_t v53 = &v34[v52];
      int v54 = &v35[v52];
      *(void *)uint64_t v53 = *(void *)v54;
      v53[8] = v54[8];
      uint64_t v55 = v36[9];
      uint64_t v56 = &v34[v55];
      uint64_t v57 = &v35[v55];
      uint64_t v58 = *((void *)v57 + 1);
      *(void *)uint64_t v56 = *(void *)v57;
      *((void *)v56 + 1) = v58;
      uint64_t v59 = *(void (**)(char *, void, uint64_t, int *))(v87 + 56);
      swift_bridgeObjectRetain();
      v59(v34, 0, 1, v36);
    }
    uint64_t v60 = a3[7];
    int v61 = (char *)a1 + v60;
    uint64_t v62 = (char *)a2 + v60;
    char v63 = (int *)type metadata accessor for FileDescription(0);
    uint64_t v64 = *((void *)v63 - 1);
    if ((*(unsigned int (**)(char *, uint64_t, int *))(v64 + 48))(v62, 1, v63))
    {
      uint64_t v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
      memcpy(v61, v62, *(void *)(*(void *)(v65 - 8) + 64));
    }
    else
    {
      v88(v61, v62, v89);
      uint64_t v66 = v63[5];
      uint64_t v67 = &v61[v66];
      char v68 = &v62[v66];
      uint64_t v69 = *((void *)v68 + 1);
      *(void *)uint64_t v67 = *(void *)v68;
      *((void *)v67 + 1) = v69;
      uint64_t v70 = v63[6];
      char v71 = &v61[v70];
      uint64_t v72 = &v62[v70];
      *(void *)char v71 = *(void *)v72;
      v71[8] = v72[8];
      uint64_t v73 = v63[7];
      char v74 = &v61[v73];
      uint64_t v75 = &v62[v73];
      uint64_t v76 = *((void *)v75 + 1);
      *(void *)char v74 = *(void *)v75;
      *((void *)v74 + 1) = v76;
      uint64_t v77 = *(void (**)(char *, void, uint64_t, int *))(v64 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v77(v61, 0, 1, v63);
    }
    uint64_t v78 = a3[8];
    uint64_t v79 = a3[9];
    uint64_t v80 = (char *)a1 + v78;
    uint64_t v81 = (char *)a2 + v78;
    *(_DWORD *)uint64_t v80 = *(_DWORD *)v81;
    v80[4] = v81[4];
    unint64_t v82 = (char *)a1 + v79;
    char v83 = (uint64_t *)((char *)a2 + v79);
    unint64_t v84 = *(uint64_t *)((char *)a2 + v79 + 8);
    if (v84 >> 60 == 15)
    {
      *(_OWORD *)unint64_t v82 = *(_OWORD *)v83;
    }
    else
    {
      uint64_t v85 = *v83;
      sub_209ECFCE8(*v83, v84);
      *(void *)unint64_t v82 = v85;
      *((void *)v82 + 1) = v84;
    }
  }
  return a1;
}

uint64_t destroy for RapidPayload(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_209EDE838();
  int v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(a1, v4);
  uint64_t v6 = a1 + a2[5];
  uint64_t v7 = type metadata accessor for ClientDeviceMetadata(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7))
  {
    v5(v6, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v8 = a1 + a2[6];
  uint64_t v9 = type metadata accessor for RequestDescription(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v8, 1, v9))
  {
    v5(v8, v4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v10 = (uint64_t *)(v8 + *(int *)(v9 + 28));
    unint64_t v11 = v10[1];
    if (v11 >> 60 != 15) {
      sub_209ED1138(*v10, v11);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v12 = a1 + a2[7];
  uint64_t v13 = type metadata accessor for FileDescription(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v12, 1, v13);
  if (!result)
  {
    v5(v12, v4);
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }
  uint64_t v15 = (uint64_t *)(a1 + a2[9]);
  unint64_t v16 = v15[1];
  if (v16 >> 60 != 15)
  {
    uint64_t v17 = *v15;
    return sub_209ED1138(v17, v16);
  }
  return result;
}

uint64_t initializeWithCopy for RapidPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  unint64_t v11 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v12 = *((void *)v11 - 1);
  uint64_t v87 = (void (*)(char *, char *, uint64_t))v7;
  uint64_t v88 = v6;
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    uint64_t v14 = v11[5];
    uint64_t v15 = &v9[v14];
    unint64_t v16 = &v10[v14];
    uint64_t v17 = *((void *)v16 + 1);
    *(void *)uint64_t v15 = *(void *)v16;
    *((void *)v15 + 1) = v17;
    uint64_t v18 = v11[6];
    uint64_t v19 = &v9[v18];
    uint64_t v20 = &v10[v18];
    uint64_t v21 = *((void *)v20 + 1);
    *(void *)uint64_t v19 = *(void *)v20;
    *((void *)v19 + 1) = v21;
    uint64_t v22 = v11[7];
    uint64_t v23 = &v9[v22];
    uint64_t v24 = &v10[v22];
    uint64_t v25 = *((void *)v24 + 1);
    *(void *)uint64_t v23 = *(void *)v24;
    *((void *)v23 + 1) = v25;
    uint64_t v26 = v11[8];
    uint64_t v27 = &v9[v26];
    uint64_t v28 = &v10[v26];
    uint64_t v29 = *((void *)v28 + 1);
    *(void *)uint64_t v27 = *(void *)v28;
    *((void *)v27 + 1) = v29;
    uint64_t v30 = *(void (**)(char *, void, uint64_t, int *))(v12 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v30(v9, 0, 1, v11);
  }
  uint64_t v31 = a3[6];
  uint64_t v32 = (char *)(a1 + v31);
  uint64_t v33 = (char *)(a2 + v31);
  uint64_t v34 = (int *)type metadata accessor for RequestDescription(0);
  uint64_t v35 = *((void *)v34 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v35 + 48))(v33, 1, v34))
  {
    uint64_t v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
    memcpy(v32, v33, *(void *)(*(void *)(v36 - 8) + 64));
  }
  else
  {
    v86 = a3;
    v87(v32, v33, v6);
    uint64_t v37 = v34[5];
    uint64_t v38 = &v32[v37];
    uint64_t v39 = &v33[v37];
    uint64_t v40 = *((void *)v39 + 1);
    *(void *)uint64_t v38 = *(void *)v39;
    *((void *)v38 + 1) = v40;
    uint64_t v41 = v34[6];
    uint64_t v42 = &v32[v41];
    uint64_t v43 = &v33[v41];
    uint64_t v44 = *((void *)v43 + 1);
    *(void *)uint64_t v42 = *(void *)v43;
    *((void *)v42 + 1) = v44;
    uint64_t v45 = v34[7];
    uint64_t v46 = &v32[v45];
    uint64_t v47 = (uint64_t *)&v33[v45];
    unint64_t v48 = *(void *)&v33[v45 + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v48 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v46 = *(_OWORD *)v47;
    }
    else
    {
      uint64_t v49 = *v47;
      sub_209ECFCE8(*v47, v48);
      *(void *)uint64_t v46 = v49;
      *((void *)v46 + 1) = v48;
    }
    uint64_t v50 = v34[8];
    uint64_t v51 = &v32[v50];
    uint64_t v52 = &v33[v50];
    *(void *)uint64_t v51 = *(void *)v52;
    v51[8] = v52[8];
    uint64_t v53 = v34[9];
    int v54 = &v32[v53];
    uint64_t v55 = &v33[v53];
    uint64_t v56 = *((void *)v55 + 1);
    *(void *)int v54 = *(void *)v55;
    *((void *)v54 + 1) = v56;
    uint64_t v57 = *(void (**)(char *, void, uint64_t, int *))(v35 + 56);
    swift_bridgeObjectRetain();
    v57(v32, 0, 1, v34);
    a3 = v86;
  }
  uint64_t v58 = a3[7];
  uint64_t v59 = (char *)(a1 + v58);
  uint64_t v60 = (char *)(a2 + v58);
  int v61 = (int *)type metadata accessor for FileDescription(0);
  uint64_t v62 = *((void *)v61 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v62 + 48))(v60, 1, v61))
  {
    uint64_t v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
    memcpy(v59, v60, *(void *)(*(void *)(v63 - 8) + 64));
  }
  else
  {
    v87(v59, v60, v88);
    uint64_t v64 = v61[5];
    uint64_t v65 = &v59[v64];
    uint64_t v66 = &v60[v64];
    uint64_t v67 = *((void *)v66 + 1);
    *(void *)uint64_t v65 = *(void *)v66;
    *((void *)v65 + 1) = v67;
    uint64_t v68 = v61[6];
    uint64_t v69 = &v59[v68];
    uint64_t v70 = &v60[v68];
    *(void *)uint64_t v69 = *(void *)v70;
    v69[8] = v70[8];
    uint64_t v71 = v61[7];
    uint64_t v72 = &v59[v71];
    uint64_t v73 = &v60[v71];
    char v74 = a3;
    uint64_t v75 = *((void *)v73 + 1);
    *(void *)uint64_t v72 = *(void *)v73;
    *((void *)v72 + 1) = v75;
    uint64_t v76 = *(void (**)(char *, void, uint64_t, int *))(v62 + 56);
    swift_bridgeObjectRetain();
    a3 = v74;
    swift_bridgeObjectRetain();
    v76(v59, 0, 1, v61);
  }
  uint64_t v77 = a3[8];
  uint64_t v78 = a3[9];
  uint64_t v79 = a1 + v77;
  uint64_t v80 = a2 + v77;
  *(_DWORD *)uint64_t v79 = *(_DWORD *)v80;
  *(unsigned char *)(v79 + 4) = *(unsigned char *)(v80 + 4);
  uint64_t v81 = a1 + v78;
  unint64_t v82 = (uint64_t *)(a2 + v78);
  unint64_t v83 = *(void *)(a2 + v78 + 8);
  if (v83 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v81 = *(_OWORD *)v82;
  }
  else
  {
    uint64_t v84 = *v82;
    sub_209ECFCE8(*v82, v83);
    *(void *)uint64_t v81 = v84;
    *(void *)(v81 + 8) = v83;
  }
  return a1;
}

uint64_t assignWithCopy for RapidPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  uint64_t v137 = *(void *)(v6 - 8);
  uint64_t v138 = v6;
  v136 = *(void (**)(uint64_t, uint64_t))(v137 + 24);
  v136(a1, a2);
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v8, v9, v138);
      uint64_t v15 = v10[5];
      unint64_t v16 = &v8[v15];
      uint64_t v17 = &v9[v15];
      *(void *)unint64_t v16 = *(void *)v17;
      *((void *)v16 + 1) = *((void *)v17 + 1);
      uint64_t v18 = v10[6];
      uint64_t v19 = &v8[v18];
      uint64_t v20 = &v9[v18];
      *(void *)uint64_t v19 = *(void *)v20;
      *((void *)v19 + 1) = *((void *)v20 + 1);
      uint64_t v21 = v10[7];
      uint64_t v22 = &v8[v21];
      uint64_t v23 = &v9[v21];
      *(void *)uint64_t v22 = *(void *)v23;
      *((void *)v22 + 1) = *((void *)v23 + 1);
      uint64_t v24 = v10[8];
      uint64_t v25 = &v8[v24];
      uint64_t v26 = &v9[v24];
      *(void *)uint64_t v25 = *(void *)v26;
      *((void *)v25 + 1) = *((void *)v26 + 1);
      uint64_t v27 = *(void (**)(char *, void, uint64_t, int *))(v11 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v27(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_209ED3604((uint64_t)v8, type metadata accessor for ClientDeviceMetadata);
LABEL_6:
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
    memcpy(v8, v9, *(void *)(*(void *)(v28 - 8) + 64));
    goto LABEL_7;
  }
  ((void (*)(char *, char *, uint64_t))v136)(v8, v9, v138);
  uint64_t v48 = v10[5];
  uint64_t v49 = &v8[v48];
  uint64_t v50 = &v9[v48];
  *(void *)uint64_t v49 = *(void *)v50;
  *((void *)v49 + 1) = *((void *)v50 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v51 = v10[6];
  uint64_t v52 = &v8[v51];
  uint64_t v53 = &v9[v51];
  *(void *)uint64_t v52 = *(void *)v53;
  *((void *)v52 + 1) = *((void *)v53 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v54 = v10[7];
  uint64_t v55 = &v8[v54];
  uint64_t v56 = &v9[v54];
  *(void *)uint64_t v55 = *(void *)v56;
  *((void *)v55 + 1) = *((void *)v56 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v57 = v10[8];
  uint64_t v58 = &v8[v57];
  uint64_t v59 = &v9[v57];
  *(void *)uint64_t v58 = *(void *)v59;
  *((void *)v58 + 1) = *((void *)v59 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v29 = a3[6];
  uint64_t v30 = (char *)(a1 + v29);
  uint64_t v31 = (char *)(a2 + v29);
  uint64_t v32 = (int *)type metadata accessor for RequestDescription(0);
  uint64_t v33 = *((void *)v32 - 1);
  uint64_t v34 = *(uint64_t (**)(char *, uint64_t, int *))(v33 + 48);
  int v35 = v34(v30, 1, v32);
  int v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (v36)
    {
      sub_209ED3604((uint64_t)v30, type metadata accessor for RequestDescription);
      goto LABEL_13;
    }
    uint64_t v60 = a3;
    ((void (*)(char *, char *, uint64_t))v136)(v30, v31, v138);
    uint64_t v61 = v32[5];
    uint64_t v62 = &v30[v61];
    uint64_t v63 = &v31[v61];
    *(void *)uint64_t v62 = *(void *)v63;
    *((void *)v62 + 1) = *((void *)v63 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v64 = v32[6];
    uint64_t v65 = &v30[v64];
    uint64_t v66 = &v31[v64];
    *(void *)uint64_t v65 = *(void *)v66;
    *((void *)v65 + 1) = *((void *)v66 + 1);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v67 = v32[7];
    uint64_t v68 = (uint64_t *)&v30[v67];
    uint64_t v69 = (uint64_t *)&v31[v67];
    unint64_t v70 = *(void *)&v31[v67 + 8];
    if (*(void *)&v30[v67 + 8] >> 60 == 15)
    {
      if (v70 >> 60 != 15)
      {
        uint64_t v71 = *v69;
        sub_209ECFCE8(v71, v70);
        *uint64_t v68 = v71;
        v68[1] = v70;
LABEL_24:
        a3 = v60;
        uint64_t v84 = v32[8];
        uint64_t v85 = &v30[v84];
        v86 = &v31[v84];
        uint64_t v87 = *(void *)v86;
        v85[8] = v86[8];
        *(void *)uint64_t v85 = v87;
        uint64_t v88 = v32[9];
        uint64_t v89 = &v30[v88];
        v90 = &v31[v88];
        *(void *)uint64_t v89 = *(void *)v90;
        *((void *)v89 + 1) = *((void *)v90 + 1);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_25;
      }
    }
    else
    {
      if (v70 >> 60 != 15)
      {
        uint64_t v81 = *v69;
        sub_209ECFCE8(v81, v70);
        uint64_t v82 = *v68;
        unint64_t v83 = v68[1];
        *uint64_t v68 = v81;
        v68[1] = v70;
        sub_209ED1138(v82, v83);
        goto LABEL_24;
      }
      sub_209EDA9DC((uint64_t)v68);
    }
    *(_OWORD *)uint64_t v68 = *(_OWORD *)v69;
    goto LABEL_24;
  }
  if (v36)
  {
LABEL_13:
    uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
    memcpy(v30, v31, *(void *)(*(void *)(v47 - 8) + 64));
    goto LABEL_25;
  }
  v135 = a3;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v30, v31, v138);
  uint64_t v37 = v32[5];
  uint64_t v38 = &v30[v37];
  uint64_t v39 = &v31[v37];
  *(void *)uint64_t v38 = *(void *)v39;
  *((void *)v38 + 1) = *((void *)v39 + 1);
  uint64_t v40 = v32[6];
  uint64_t v41 = &v30[v40];
  uint64_t v42 = &v31[v40];
  *(void *)uint64_t v41 = *(void *)v42;
  *((void *)v41 + 1) = *((void *)v42 + 1);
  uint64_t v43 = v32[7];
  uint64_t v44 = &v30[v43];
  uint64_t v45 = (uint64_t *)&v31[v43];
  unint64_t v46 = *(void *)&v31[v43 + 8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v46 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
  }
  else
  {
    uint64_t v72 = *v45;
    sub_209ECFCE8(*v45, v46);
    *(void *)uint64_t v44 = v72;
    *((void *)v44 + 1) = v46;
  }
  a3 = v135;
  uint64_t v73 = v32[8];
  char v74 = &v30[v73];
  uint64_t v75 = &v31[v73];
  uint64_t v76 = *(void *)v75;
  v74[8] = v75[8];
  *(void *)char v74 = v76;
  uint64_t v77 = v32[9];
  uint64_t v78 = &v30[v77];
  uint64_t v79 = &v31[v77];
  *(void *)uint64_t v78 = *(void *)v79;
  *((void *)v78 + 1) = *((void *)v79 + 1);
  uint64_t v80 = *(void (**)(char *, void, uint64_t, int *))(v33 + 56);
  swift_bridgeObjectRetain();
  v80(v30, 0, 1, v32);
LABEL_25:
  v91 = a3;
  uint64_t v92 = a3[7];
  uint64_t v93 = (char *)(a1 + v92);
  uint64_t v94 = (char *)(a2 + v92);
  uint64_t v95 = (int *)type metadata accessor for FileDescription(0);
  uint64_t v96 = *((void *)v95 - 1);
  uint64_t v97 = *(uint64_t (**)(char *, uint64_t, int *))(v96 + 48);
  int v98 = v97(v93, 1, v95);
  int v99 = v97(v94, 1, v95);
  if (v98)
  {
    if (!v99)
    {
      (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v93, v94, v138);
      uint64_t v100 = v95[5];
      uint64_t v101 = &v93[v100];
      uint64_t v102 = &v94[v100];
      *(void *)uint64_t v101 = *(void *)v102;
      *((void *)v101 + 1) = *((void *)v102 + 1);
      uint64_t v103 = v95[6];
      uint64_t v104 = &v93[v103];
      v105 = &v94[v103];
      char v106 = v105[8];
      *(void *)uint64_t v104 = *(void *)v105;
      v104[8] = v106;
      uint64_t v107 = v95[7];
      uint64_t v108 = &v93[v107];
      uint64_t v109 = &v94[v107];
      *(void *)uint64_t v108 = *(void *)v109;
      *((void *)v108 + 1) = *((void *)v109 + 1);
      v110 = *(void (**)(char *, void, uint64_t, int *))(v96 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v110(v93, 0, 1, v95);
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v99)
  {
    sub_209ED3604((uint64_t)v93, type metadata accessor for FileDescription);
LABEL_30:
    uint64_t v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
    memcpy(v93, v94, *(void *)(*(void *)(v111 - 8) + 64));
    goto LABEL_31;
  }
  ((void (*)(char *, char *, uint64_t))v136)(v93, v94, v138);
  uint64_t v125 = v95[5];
  v126 = &v93[v125];
  v127 = &v94[v125];
  *(void *)v126 = *(void *)v127;
  *((void *)v126 + 1) = *((void *)v127 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v128 = v95[6];
  v129 = &v93[v128];
  v130 = &v94[v128];
  uint64_t v131 = *(void *)v130;
  v129[8] = v130[8];
  *(void *)v129 = v131;
  uint64_t v132 = v95[7];
  v133 = &v93[v132];
  v134 = &v94[v132];
  *(void *)v133 = *(void *)v134;
  *((void *)v133 + 1) = *((void *)v134 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_31:
  uint64_t v112 = v91[8];
  uint64_t v113 = a1 + v112;
  v114 = (int *)(a2 + v112);
  int v115 = *v114;
  *(unsigned char *)(v113 + 4) = *((unsigned char *)v114 + 4);
  *(_DWORD *)uint64_t v113 = v115;
  uint64_t v116 = v91[9];
  v117 = (uint64_t *)(a1 + v116);
  v118 = (uint64_t *)(a2 + v116);
  unint64_t v119 = *(void *)(a2 + v116 + 8);
  if (*(void *)(a1 + v116 + 8) >> 60 != 15)
  {
    if (v119 >> 60 != 15)
    {
      uint64_t v121 = *v118;
      sub_209ECFCE8(v121, v119);
      uint64_t v122 = *v117;
      unint64_t v123 = v117[1];
      uint64_t *v117 = v121;
      v117[1] = v119;
      sub_209ED1138(v122, v123);
      return a1;
    }
    sub_209EDA9DC((uint64_t)v117);
    goto LABEL_36;
  }
  if (v119 >> 60 == 15)
  {
LABEL_36:
    *(_OWORD *)v117 = *(_OWORD *)v118;
    return a1;
  }
  uint64_t v120 = *v118;
  sub_209ECFCE8(v120, v119);
  uint64_t *v117 = v120;
  v117[1] = v119;
  return a1;
}

uint64_t initializeWithTake for RapidPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  uint64_t v8 = a3[5];
  uint64_t v9 = (char *)(a1 + v8);
  uint64_t v10 = (char *)(a2 + v8);
  uint64_t v11 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v12 = *((void *)v11 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v9, (uint64_t)v10, v6);
    *(_OWORD *)&v9[v11[5]] = *(_OWORD *)&v10[v11[5]];
    *(_OWORD *)&v9[v11[6]] = *(_OWORD *)&v10[v11[6]];
    *(_OWORD *)&v9[v11[7]] = *(_OWORD *)&v10[v11[7]];
    *(_OWORD *)&v9[v11[8]] = *(_OWORD *)&v10[v11[8]];
    (*(void (**)(char *, void, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
  }
  uint64_t v14 = a3[6];
  uint64_t v15 = (char *)(a1 + v14);
  unint64_t v16 = (char *)(a2 + v14);
  uint64_t v17 = (int *)type metadata accessor for RequestDescription(0);
  uint64_t v18 = *((void *)v17 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v18 + 48))(v16, 1, v17))
  {
    uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
    memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v15, (uint64_t)v16, v6);
    *(_OWORD *)&v15[v17[5]] = *(_OWORD *)&v16[v17[5]];
    *(_OWORD *)&v15[v17[6]] = *(_OWORD *)&v16[v17[6]];
    *(_OWORD *)&v15[v17[7]] = *(_OWORD *)&v16[v17[7]];
    uint64_t v20 = v17[8];
    uint64_t v21 = &v15[v20];
    uint64_t v22 = &v16[v20];
    *(void *)uint64_t v21 = *(void *)v22;
    v21[8] = v22[8];
    *(_OWORD *)&v15[v17[9]] = *(_OWORD *)&v16[v17[9]];
    (*(void (**)(char *, void, uint64_t, int *))(v18 + 56))(v15, 0, 1, v17);
  }
  uint64_t v23 = a3[7];
  uint64_t v24 = (char *)(a1 + v23);
  uint64_t v25 = (char *)(a2 + v23);
  uint64_t v26 = (int *)type metadata accessor for FileDescription(0);
  uint64_t v27 = *((void *)v26 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v27 + 48))(v25, 1, v26))
  {
    uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
    memcpy(v24, v25, *(void *)(*(void *)(v28 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v24, (uint64_t)v25, v6);
    *(_OWORD *)&v24[v26[5]] = *(_OWORD *)&v25[v26[5]];
    uint64_t v29 = v26[6];
    uint64_t v30 = &v24[v29];
    uint64_t v31 = &v25[v29];
    *(void *)uint64_t v30 = *(void *)v31;
    v30[8] = v31[8];
    *(_OWORD *)&v24[v26[7]] = *(_OWORD *)&v25[v26[7]];
    (*(void (**)(char *, void, uint64_t, int *))(v27 + 56))(v24, 0, 1, v26);
  }
  uint64_t v32 = a3[8];
  uint64_t v33 = a3[9];
  uint64_t v34 = a1 + v32;
  uint64_t v35 = a2 + v32;
  *(_DWORD *)uint64_t v34 = *(_DWORD *)v35;
  *(unsigned char *)(v34 + 4) = *(unsigned char *)(v35 + 4);
  *(_OWORD *)(a1 + v33) = *(_OWORD *)(a2 + v33);
  return a1;
}

uint64_t assignWithTake for RapidPayload(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  uint64_t v108 = *(void *)(v6 - 8);
  uint64_t v109 = v6;
  uint64_t v107 = *(void (**)(uint64_t, uint64_t))(v108 + 40);
  v107(a1, a2);
  uint64_t v7 = a3[5];
  uint64_t v8 = (char *)(a1 + v7);
  uint64_t v9 = (char *)(a2 + v7);
  uint64_t v10 = (int *)type metadata accessor for ClientDeviceMetadata(0);
  uint64_t v11 = *((void *)v10 - 1);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t, int *))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v8, v9, v109);
      *(_OWORD *)&v8[v10[5]] = *(_OWORD *)&v9[v10[5]];
      *(_OWORD *)&v8[v10[6]] = *(_OWORD *)&v9[v10[6]];
      *(_OWORD *)&v8[v10[7]] = *(_OWORD *)&v9[v10[7]];
      *(_OWORD *)&v8[v10[8]] = *(_OWORD *)&v9[v10[8]];
      (*(void (**)(char *, void, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    sub_209ED3604((uint64_t)v8, type metadata accessor for ClientDeviceMetadata);
LABEL_6:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  ((void (*)(char *, char *, uint64_t))v107)(v8, v9, v109);
  uint64_t v50 = v10[5];
  uint64_t v51 = &v8[v50];
  uint64_t v52 = &v9[v50];
  uint64_t v54 = *(void *)v52;
  uint64_t v53 = *((void *)v52 + 1);
  *(void *)uint64_t v51 = v54;
  *((void *)v51 + 1) = v53;
  swift_bridgeObjectRelease();
  uint64_t v55 = v10[6];
  uint64_t v56 = &v8[v55];
  uint64_t v57 = &v9[v55];
  uint64_t v59 = *(void *)v57;
  uint64_t v58 = *((void *)v57 + 1);
  *(void *)uint64_t v56 = v59;
  *((void *)v56 + 1) = v58;
  swift_bridgeObjectRelease();
  uint64_t v60 = v10[7];
  uint64_t v61 = &v8[v60];
  uint64_t v62 = &v9[v60];
  uint64_t v64 = *(void *)v62;
  uint64_t v63 = *((void *)v62 + 1);
  *(void *)uint64_t v61 = v64;
  *((void *)v61 + 1) = v63;
  swift_bridgeObjectRelease();
  uint64_t v65 = v10[8];
  uint64_t v66 = &v8[v65];
  uint64_t v67 = &v9[v65];
  uint64_t v69 = *(void *)v67;
  uint64_t v68 = *((void *)v67 + 1);
  *(void *)uint64_t v66 = v69;
  *((void *)v66 + 1) = v68;
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v16 = a3[6];
  uint64_t v17 = (char *)(a1 + v16);
  uint64_t v18 = (char *)(a2 + v16);
  uint64_t v19 = (int *)type metadata accessor for RequestDescription(0);
  uint64_t v20 = *((void *)v19 - 1);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, int *))(v20 + 48);
  int v22 = v21(v17, 1, v19);
  int v23 = v21(v18, 1, v19);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v17, v18, v109);
      *(_OWORD *)&v17[v19[5]] = *(_OWORD *)&v18[v19[5]];
      *(_OWORD *)&v17[v19[6]] = *(_OWORD *)&v18[v19[6]];
      *(_OWORD *)&v17[v19[7]] = *(_OWORD *)&v18[v19[7]];
      uint64_t v24 = v19[8];
      uint64_t v25 = &v17[v24];
      uint64_t v26 = &v18[v24];
      *(void *)uint64_t v25 = *(void *)v26;
      v25[8] = v26[8];
      *(_OWORD *)&v17[v19[9]] = *(_OWORD *)&v18[v19[9]];
      (*(void (**)(char *, void, uint64_t, int *))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    sub_209ED3604((uint64_t)v17, type metadata accessor for RequestDescription);
LABEL_12:
    uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
    memcpy(v17, v18, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  ((void (*)(char *, char *, uint64_t))v107)(v17, v18, v109);
  uint64_t v70 = v19[5];
  uint64_t v71 = &v17[v70];
  uint64_t v72 = &v18[v70];
  uint64_t v74 = *(void *)v72;
  uint64_t v73 = *((void *)v72 + 1);
  *(void *)uint64_t v71 = v74;
  *((void *)v71 + 1) = v73;
  swift_bridgeObjectRelease();
  uint64_t v75 = v19[6];
  uint64_t v76 = &v17[v75];
  uint64_t v77 = &v18[v75];
  uint64_t v79 = *(void *)v77;
  uint64_t v78 = *((void *)v77 + 1);
  *(void *)uint64_t v76 = v79;
  *((void *)v76 + 1) = v78;
  swift_bridgeObjectRelease();
  uint64_t v80 = v19[7];
  uint64_t v81 = (uint64_t *)&v17[v80];
  uint64_t v82 = (uint64_t *)&v18[v80];
  unint64_t v83 = *(void *)&v17[v80 + 8];
  if (v83 >> 60 != 15)
  {
    unint64_t v84 = v82[1];
    if (v84 >> 60 != 15)
    {
      uint64_t v98 = *v81;
      *uint64_t v81 = *v82;
      v81[1] = v84;
      sub_209ED1138(v98, v83);
      goto LABEL_32;
    }
    sub_209EDA9DC((uint64_t)v81);
  }
  *(_OWORD *)uint64_t v81 = *(_OWORD *)v82;
LABEL_32:
  uint64_t v99 = v19[8];
  uint64_t v100 = &v17[v99];
  uint64_t v101 = &v18[v99];
  *(void *)uint64_t v100 = *(void *)v101;
  v100[8] = v101[8];
  uint64_t v102 = v19[9];
  uint64_t v103 = &v17[v102];
  uint64_t v104 = &v18[v102];
  uint64_t v106 = *(void *)v104;
  uint64_t v105 = *((void *)v104 + 1);
  *(void *)uint64_t v103 = v106;
  *((void *)v103 + 1) = v105;
  swift_bridgeObjectRelease();
LABEL_13:
  uint64_t v28 = a3[7];
  uint64_t v29 = (char *)(a1 + v28);
  uint64_t v30 = (char *)(a2 + v28);
  uint64_t v31 = (int *)type metadata accessor for FileDescription(0);
  uint64_t v32 = *((void *)v31 - 1);
  uint64_t v33 = *(uint64_t (**)(char *, uint64_t, int *))(v32 + 48);
  int v34 = v33(v29, 1, v31);
  int v35 = v33(v30, 1, v31);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v29, v30, v109);
      *(_OWORD *)&v29[v31[5]] = *(_OWORD *)&v30[v31[5]];
      uint64_t v36 = v31[6];
      uint64_t v37 = &v29[v36];
      uint64_t v38 = &v30[v36];
      *(void *)uint64_t v37 = *(void *)v38;
      v37[8] = v38[8];
      *(_OWORD *)&v29[v31[7]] = *(_OWORD *)&v30[v31[7]];
      (*(void (**)(char *, void, uint64_t, int *))(v32 + 56))(v29, 0, 1, v31);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v35)
  {
    sub_209ED3604((uint64_t)v29, type metadata accessor for FileDescription);
LABEL_18:
    uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
    memcpy(v29, v30, *(void *)(*(void *)(v39 - 8) + 64));
    goto LABEL_19;
  }
  ((void (*)(char *, char *, uint64_t))v107)(v29, v30, v109);
  uint64_t v85 = v31[5];
  v86 = &v29[v85];
  uint64_t v87 = &v30[v85];
  uint64_t v89 = *(void *)v87;
  uint64_t v88 = *((void *)v87 + 1);
  *(void *)v86 = v89;
  *((void *)v86 + 1) = v88;
  swift_bridgeObjectRelease();
  uint64_t v90 = v31[6];
  v91 = &v29[v90];
  uint64_t v92 = &v30[v90];
  *(void *)v91 = *(void *)v92;
  v91[8] = v92[8];
  uint64_t v93 = v31[7];
  uint64_t v94 = &v29[v93];
  uint64_t v95 = &v30[v93];
  uint64_t v97 = *(void *)v95;
  uint64_t v96 = *((void *)v95 + 1);
  *(void *)uint64_t v94 = v97;
  *((void *)v94 + 1) = v96;
  swift_bridgeObjectRelease();
LABEL_19:
  uint64_t v40 = a3[8];
  uint64_t v41 = a3[9];
  uint64_t v42 = a1 + v40;
  uint64_t v43 = a2 + v40;
  *(_DWORD *)uint64_t v42 = *(_DWORD *)v43;
  *(unsigned char *)(v42 + 4) = *(unsigned char *)(v43 + 4);
  uint64_t v44 = (uint64_t *)(a1 + v41);
  uint64_t v45 = (uint64_t *)(a2 + v41);
  unint64_t v46 = *(void *)(a1 + v41 + 8);
  if (v46 >> 60 != 15)
  {
    unint64_t v47 = v45[1];
    if (v47 >> 60 != 15)
    {
      uint64_t v48 = *v44;
      uint64_t *v44 = *v45;
      v44[1] = v47;
      sub_209ED1138(v48, v46);
      return a1;
    }
    sub_209EDA9DC((uint64_t)v44);
  }
  *(_OWORD *)uint64_t v44 = *(_OWORD *)v45;
  return a1;
}

uint64_t getEnumTagSinglePayload for RapidPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_209EDD300);
}

uint64_t sub_209EDD300(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }
  else
  {
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
    if (*(_DWORD *)(*(void *)(v11 - 8) + 84) == a2)
    {
      uint64_t v8 = v11;
      uint64_t v12 = *(void *)(v11 - 8);
      uint64_t v13 = a3[5];
    }
    else
    {
      uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
      if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
      {
        uint64_t v8 = v14;
        uint64_t v12 = *(void *)(v14 - 8);
        uint64_t v13 = a3[6];
      }
      else
      {
        uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
        if (*(_DWORD *)(*(void *)(v15 - 8) + 84) != a2)
        {
          uint64_t v17 = *(void *)(a1 + a3[9] + 8) >> 60;
          BOOL v18 = ((4 * v17) & 0xC) == 0;
          unsigned int v19 = ((4 * v17) & 0xC | (v17 >> 2)) ^ 0xF;
          if (v18) {
            return 0;
          }
          else {
            return v19;
          }
        }
        uint64_t v8 = v15;
        uint64_t v12 = *(void *)(v15 - 8);
        uint64_t v13 = a3[7];
      }
    }
    uint64_t v10 = a1 + v13;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }

  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for RapidPayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_209EDD4D8);
}

uint64_t sub_209EDD4D8(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8 = sub_209EDE838();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605088);
    if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
    {
      uint64_t v10 = v13;
      uint64_t v14 = *(void *)(v13 - 8);
      uint64_t v15 = a4[5];
    }
    else
    {
      uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_267605080);
      if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
      {
        uint64_t v10 = v16;
        uint64_t v14 = *(void *)(v16 - 8);
        uint64_t v15 = a4[6];
      }
      else
      {
        uint64_t result = __swift_instantiateConcreteTypeFromMangledName(&qword_267605078);
        if (*(_DWORD *)(*(void *)(result - 8) + 84) != a3)
        {
          BOOL v18 = (void *)(a1 + a4[9]);
          void *v18 = 0;
          v18[1] = (unint64_t)((~a2 >> 2) & 3 | (4 * ~a2)) << 60;
          return result;
        }
        uint64_t v10 = result;
        uint64_t v14 = *(void *)(result - 8);
        uint64_t v15 = a4[7];
      }
    }
    uint64_t v12 = a1 + v15;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }

  return v11(v12, a2, a2, v10);
}

void sub_209EDD69C()
{
  sub_209EDE838();
  if (v0 <= 0x3F)
  {
    sub_209EDD844(319, &qword_267605158, (void (*)(uint64_t))type metadata accessor for ClientDeviceMetadata);
    if (v1 <= 0x3F)
    {
      sub_209EDD844(319, &qword_267605160, (void (*)(uint64_t))type metadata accessor for RequestDescription);
      if (v2 <= 0x3F)
      {
        sub_209EDD844(319, &qword_267605168, (void (*)(uint64_t))type metadata accessor for FileDescription);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_209EDD844(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_209EDEA08();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void *initializeBufferWithCopyOfBuffer for RapidPayloadReply(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (void *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_209EDE838();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((unsigned char *)a1 + a3[5]) = *((unsigned char *)a2 + a3[5]);
    uint64_t v9 = (void *)((char *)a1 + v8);
    uint64_t v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[7];
    uint64_t v13 = (char *)a1 + v12;
    uint64_t v14 = (_OWORD *)((char *)a2 + v12);
    unint64_t v15 = *(void *)((char *)a2 + v12 + 8);
    swift_bridgeObjectRetain();
    if (v15 >> 60 == 15)
    {
      *(_OWORD *)uint64_t v13 = *v14;
    }
    else
    {
      uint64_t v17 = *(void *)v14;
      sub_209ECFCE8(v17, v15);
      *(void *)uint64_t v13 = v17;
      *((void *)v13 + 1) = v15;
    }
  }
  return a1;
}

uint64_t destroy for RapidPayloadReply(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v6 = (uint64_t *)(a1 + *(int *)(a2 + 28));
  unint64_t v7 = v6[1];
  if (v7 >> 60 != 15)
  {
    uint64_t v8 = *v6;
    return sub_209ED1138(v8, v7);
  }
  return result;
}

uint64_t initializeWithCopy for RapidPayloadReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  void *v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[7];
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  unint64_t v14 = *(void *)(v13 + 8);
  swift_bridgeObjectRetain();
  if (v14 >> 60 == 15)
  {
    *(_OWORD *)uint64_t v12 = *(_OWORD *)v13;
  }
  else
  {
    uint64_t v15 = *(void *)v13;
    sub_209ECFCE8(v15, v14);
    *(void *)uint64_t v12 = v15;
    *(void *)(v12 + 8) = v14;
  }
  return a1;
}

uint64_t assignWithCopy for RapidPayloadReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[7];
  uint64_t v11 = (uint64_t *)(a1 + v10);
  uint64_t v12 = (uint64_t *)(a2 + v10);
  unint64_t v13 = *(void *)(a2 + v10 + 8);
  if (*(void *)(a1 + v10 + 8) >> 60 != 15)
  {
    if (v13 >> 60 != 15)
    {
      uint64_t v15 = *v12;
      sub_209ECFCE8(v15, v13);
      uint64_t v16 = *v11;
      unint64_t v17 = v11[1];
      *uint64_t v11 = v15;
      v11[1] = v13;
      sub_209ED1138(v16, v17);
      return a1;
    }
    sub_209EDA9DC((uint64_t)v11);
    goto LABEL_6;
  }
  if (v13 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)uint64_t v11 = *(_OWORD *)v12;
    return a1;
  }
  uint64_t v14 = *v12;
  sub_209ECFCE8(v14, v13);
  *uint64_t v11 = v14;
  v11[1] = v13;
  return a1;
}

uint64_t initializeWithTake for RapidPayloadReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for RapidPayloadReply(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_209EDE838();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(unsigned char *)(a1 + a3[5]) = *(unsigned char *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  void *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[7];
  unint64_t v13 = (uint64_t *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  unint64_t v15 = *(void *)(a1 + v12 + 8);
  if (v15 >> 60 != 15)
  {
    unint64_t v16 = v14[1];
    if (v16 >> 60 != 15)
    {
      uint64_t v17 = *v13;
      *unint64_t v13 = *v14;
      v13[1] = v16;
      sub_209ED1138(v17, v15);
      return a1;
    }
    sub_209EDA9DC((uint64_t)v13);
  }
  *(_OWORD *)unint64_t v13 = *(_OWORD *)v14;
  return a1;
}

uint64_t getEnumTagSinglePayload for RapidPayloadReply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_209EDDDD4);
}

uint64_t sub_209EDDDD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_209EDE838();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for RapidPayloadReply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_209EDDEB8);
}

uint64_t sub_209EDDEB8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_209EDE838();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  }
  return result;
}

uint64_t sub_209EDDF78()
{
  return sub_209EDDF94();
}

uint64_t sub_209EDDF94()
{
  uint64_t result = sub_209EDE838();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void _deleteFileWithPath_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_209E70000, a2, OS_LOG_TYPE_FAULT, "ERROR: File %{public}@ is a directory", (uint8_t *)&v2, 0xCu);
}

void __DRSWaitForDeviceUnlock_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_fault_impl(&dword_209E70000, log, OS_LOG_TYPE_FAULT, "FATAL ERROR: Service was notified of device unlock, but confirmation of unlock failed", v1, 2u);
}

void DRSConfirmDirectoryIsInitialized_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_209E70000, a2, OS_LOG_TYPE_FAULT, "%{public}@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_209EDE768()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_209EDE778()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_209EDE788()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_209EDE798()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_209EDE7A8()
{
  return MEMORY[0x270EEFD28]();
}

uint64_t sub_209EDE7B8()
{
  return MEMORY[0x270EEFF00]();
}

uint64_t sub_209EDE7C8()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_209EDE7D8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_209EDE7E8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_209EDE7F8()
{
  return MEMORY[0x270F16CA0]();
}

uint64_t sub_209EDE808()
{
  return MEMORY[0x270F16CA8]();
}

uint64_t sub_209EDE818()
{
  return MEMORY[0x270F44A18]();
}

uint64_t _s24DiagnosticRequestService20ClientDeviceMetadataV13unknownFields21InternalSwiftProtobuf14UnknownStorageVvpfi_0()
{
  return MEMORY[0x270F44A20]();
}

uint64_t sub_209EDE838()
{
  return MEMORY[0x270F44A28]();
}

uint64_t sub_209EDE848()
{
  return MEMORY[0x270F44AD8]();
}

uint64_t sub_209EDE868()
{
  return MEMORY[0x270F44B10]();
}

uint64_t sub_209EDE878()
{
  return MEMORY[0x270F44B38]();
}

uint64_t sub_209EDE888()
{
  return MEMORY[0x270F44B78]();
}

uint64_t sub_209EDE898()
{
  return MEMORY[0x270F44BF0]();
}

uint64_t sub_209EDE8A8()
{
  return MEMORY[0x270F44C00]();
}

uint64_t sub_209EDE8B8()
{
  return MEMORY[0x270F44C10]();
}

uint64_t sub_209EDE8C8()
{
  return MEMORY[0x270F44C38]();
}

uint64_t sub_209EDE8D8()
{
  return MEMORY[0x270F44C98]();
}

uint64_t sub_209EDE8F8()
{
  return MEMORY[0x270F44CD8]();
}

uint64_t sub_209EDE908()
{
  return MEMORY[0x270F44CE0]();
}

uint64_t sub_209EDE918()
{
  return MEMORY[0x270F44D60]();
}

uint64_t sub_209EDE928()
{
  return MEMORY[0x270F44D88]();
}

uint64_t sub_209EDE938()
{
  return MEMORY[0x270F44DD8]();
}

uint64_t sub_209EDE948()
{
  return MEMORY[0x270F44DE0]();
}

uint64_t sub_209EDE958()
{
  return MEMORY[0x270F44DE8]();
}

uint64_t sub_209EDE968()
{
  return MEMORY[0x270F44E00]();
}

uint64_t sub_209EDE978()
{
  return MEMORY[0x270F44E10]();
}

uint64_t sub_209EDE988()
{
  return MEMORY[0x270F44E18]();
}

uint64_t sub_209EDE998()
{
  return MEMORY[0x270F44E28]();
}

uint64_t sub_209EDE9A8()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_209EDE9B8()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_209EDE9C8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_209EDE9D8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_209EDE9E8()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_209EDE9F8()
{
  return MEMORY[0x270F16CC0]();
}

uint64_t sub_209EDEA08()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_209EDEA18()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_209EDEA28()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_209EDEA38()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_209EDEA48()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_209EDEA58()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

uint64_t DRConfigStringForState()
{
  return MEMORY[0x270F26070]();
}

uint64_t GetProcessNameByPID()
{
  return MEMORY[0x270F241F8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x270F24B58]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x270F58538]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x270F58540]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x270F58558]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x270F58560]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x270F585A0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x270F585B0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x270F585B8]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x270F585D8]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x270F585E0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x270F585F8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x270ED8118]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t tailspin_dump_output_with_options_sync()
{
  return MEMORY[0x270F9B9B8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x270EDBCA8](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCB8](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x270EDBCE8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x270EDBCF0](activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

BOOL xpc_array_get_BOOL(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x270EDBD30](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x270EDBE30]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x270EDC020](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x270EDC080](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_event_publisher_activate()
{
  return MEMORY[0x270EDC198]();
}

uint64_t xpc_event_publisher_create()
{
  return MEMORY[0x270EDC1A0]();
}

uint64_t xpc_event_publisher_fire()
{
  return MEMORY[0x270EDC1A8]();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return MEMORY[0x270EDC1B8]();
}

uint64_t xpc_event_publisher_set_handler()
{
  return MEMORY[0x270EDC1C0]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x270EDC3C8]();
}
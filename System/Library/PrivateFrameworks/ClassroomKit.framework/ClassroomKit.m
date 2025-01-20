id _CRKLogASM()
{
  void *v0;
  uint64_t vars8;

  if (_CRKLogASM_onceToken_1 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_1, &__block_literal_global_2);
  }
  v0 = (void *)_CRKLogASM_logObj_1;

  return v0;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_224C07268(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x224C070FCLL);
  }
  _Unwind_Resume(exception_object);
}

id _CRKLogASM_0()
{
  if (_CRKLogASM_onceToken_2 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_2, &__block_literal_global_4);
  }
  v0 = (void *)_CRKLogASM_logObj_2;

  return v0;
}

uint64_t CRKLogAddStateHandler(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v9 = a3;
  id v4 = v8;
  id v5 = v9;
  uint64_t v6 = os_state_add_handler();

  return v6;
}

_DWORD *__CRKLogAddStateHandler_block_invoke(uint64_t a1)
{
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v2)
  {
    id v15 = 0;
    v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:v2 format:200 options:0 error:&v15];
    id v4 = v15;
    if (v4)
    {
      id v5 = _CRKLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __CRKLogAddStateHandler_block_invoke_cold_1((uint64_t)v4, v5);
      }
      uint64_t v6 = 0;
    }
    else
    {
      v7 = malloc_type_calloc(1uLL, [v3 length] + 200, 0xB21EA881uLL);
      uint64_t v6 = v7;
      if (!v7)
      {
LABEL_15:

        goto LABEL_16;
      }
      _DWORD *v7 = 1;
      v7[1] = [v3 length];
      id v8 = [*(id *)(a1 + 32) dataUsingEncoding:4];
      id v5 = v8;
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = (const void *)[v9 bytes];
        unint64_t v11 = [v9 length];
        if (v11 >= 0x3F) {
          size_t v12 = 63;
        }
        else {
          size_t v12 = v11;
        }
        memcpy(v6 + 34, v10, v12);
      }
      id v13 = v3;
      memcpy(v6 + 50, (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    }

    goto LABEL_15;
  }
  uint64_t v6 = 0;
LABEL_16:

  return v6;
}

id _CRKLogGeneral()
{
  if (_CRKLogGeneral_onceToken != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken, &__block_literal_global_5);
  }
  v0 = (void *)_CRKLogGeneral_logObj;

  return v0;
}

uint64_t CRKLogRemoveStateHandler()
{
  return MEMORY[0x270EDAA80]();
}

void CRTLog(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v9 = (objc_class *)NSString;
  id v10 = a1;
  unint64_t v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  size_t v12 = _CRKLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v11;
    _os_log_impl(&dword_224C00000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }

  id v13 = (FILE **)MEMORY[0x263EF8358];
  v14 = (FILE *)*MEMORY[0x263EF8358];
  id v15 = v11;
  fprintf(v14, "%s\n", (const char *)[v15 UTF8String]);
  fflush(*v13);
}

void CRTLogError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = (objc_class *)NSString;
  id v10 = a1;
  unint64_t v11 = (void *)[[v9 alloc] initWithFormat:v10 arguments:&a9];

  size_t v12 = _CRKLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    CRTLogError_cold_1((uint64_t)v11, v12);
  }

  id v13 = (FILE *)*MEMORY[0x263EF8348];
  id v14 = v11;
  fprintf(v13, "%s\n", (const char *)[v14 UTF8String]);
}

id _CRKLogASM_1()
{
  if (_CRKLogASM_onceToken_3 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_3, &__block_literal_global_6);
  }
  v0 = (void *)_CRKLogASM_logObj_3;

  return v0;
}

id _CRKLogASM_2()
{
  if (_CRKLogASM_onceToken_4 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_4, &__block_literal_global_7);
  }
  v0 = (void *)_CRKLogASM_logObj_4;

  return v0;
}

id _CRKLogASM_3()
{
  if (_CRKLogASM_onceToken_5 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_5, &__block_literal_global_8);
  }
  v0 = (void *)_CRKLogASM_logObj_5;

  return v0;
}

void sub_224C0C074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_0()
{
  if (_CRKLogGeneral_onceToken_0 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_0, &__block_literal_global_9);
  }
  v0 = (void *)_CRKLogGeneral_logObj_0;

  return v0;
}

void sub_224C0D190(_Unwind_Exception *a1)
{
}

void sub_224C0D1B0(void *a1)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void __crk_tokenized_properties_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void __crk_tokenized_properties_block_invoke_0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

id _CRKLogASM_4()
{
  if (_CRKLogASM_onceToken_6 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_6, &__block_literal_global_10);
  }
  v0 = (void *)_CRKLogASM_logObj_6;

  return v0;
}

uint64_t CRKIsClassroomBundleIdentifier(void *a1)
{
  id v1 = a1;
  v2 = CRKAllClassroomBundleIdentifiers();
  uint64_t v3 = [v2 containsObject:v1];

  return v3;
}

id CRKAllClassroomBundleIdentifiers()
{
  v2[2] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.classroom";
  v2[1] = @"com.apple.macos.classroom";
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:2];

  return v0;
}

void __crk_tokenized_properties_block_invoke_1(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void __crk_tokenized_properties_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

id _CRKLogBluetooth()
{
  if (_CRKLogBluetooth_onceToken != -1) {
    dispatch_once(&_CRKLogBluetooth_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)_CRKLogBluetooth_logObj;

  return v0;
}

id _CRKLogASM_5()
{
  if (_CRKLogASM_onceToken_7 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_7, &__block_literal_global_243);
  }
  v0 = (void *)_CRKLogASM_logObj_7;

  return v0;
}

id _CRKLogASM_6()
{
  if (_CRKLogASM_onceToken_8 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_8, &__block_literal_global_14);
  }
  v0 = (void *)_CRKLogASM_logObj_8;

  return v0;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id JSONStringRepresentation(uint64_t a1, unsigned int a2, int a3)
{
  if (a3) {
    uint64_t v3 = a2 | 2;
  }
  else {
    uint64_t v3 = a2;
  }
  id v9 = 0;
  id v4 = [MEMORY[0x263F08900] dataWithJSONObject:a1 options:v3 error:&v9];
  id v5 = v9;
  if (v5)
  {
    if (_CRKLogGeneral_onceToken_1 != -1) {
      dispatch_once(&_CRKLogGeneral_onceToken_1, &__block_literal_global_15);
    }
    id v6 = (void *)_CRKLogGeneral_logObj_1;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_1, OS_LOG_TYPE_ERROR)) {
      JSONStringRepresentation_cold_1(v6, v5);
    }
  }
  if ([v4 length]) {
    v7 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  }
  else {
    v7 = 0;
  }

  return v7;
}

void sub_224C1BA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224C1BFB0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void __crk_tokenized_properties_block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void __crk_tokenized_properties_block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

double CRKRectFromDictionary(void *a1)
{
  id v1 = a1;
  v2 = [v1 objectForKeyedSubscript:@"x"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  [v4 doubleValue];
  double v6 = v5;

  v7 = [v1 objectForKeyedSubscript:@"y"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  [v9 doubleValue];
  uint64_t v10 = [v1 objectForKeyedSubscript:@"width"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = 0;
  }
  id v12 = v11;

  [v12 doubleValue];
  id v13 = [v1 objectForKeyedSubscript:@"height"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;

  [v15 doubleValue];
  return v6;
}

id CRKDictionaryFromRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  v15[4] = *MEMORY[0x263EF8340];
  v14[0] = @"x";
  id v8 = objc_msgSend(NSNumber, "numberWithDouble:");
  v15[0] = v8;
  v14[1] = @"y";
  id v9 = [NSNumber numberWithDouble:a2];
  v15[1] = v9;
  v14[2] = @"width";
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  uint64_t v10 = [NSNumber numberWithDouble:CGRectGetWidth(v17)];
  v15[2] = v10;
  v14[3] = @"height";
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  unint64_t v11 = [NSNumber numberWithDouble:CGRectGetHeight(v18)];
  v15[3] = v11;
  id v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];

  return v12;
}

unint64_t CRKRectHash(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  unint64_t v8 = (unint64_t)a1 ^ (unint64_t)a2 ^ (unint64_t)CGRectGetWidth(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  return v8 ^ (unint64_t)CGRectGetHeight(v10);
}

id _CRKLogGeneral_1()
{
  if (_CRKLogGeneral_onceToken_5 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_5, &__block_literal_global_105);
  }
  v0 = (void *)_CRKLogGeneral_logObj_5;

  return v0;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t CRKIsSimulator()
{
  return 0;
}

uint64_t CRKIsiOS()
{
  return 1;
}

uint64_t CRKIsOSX()
{
  return 0;
}

void __crk_tokenized_properties_block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void __crk_tokenized_properties_block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void __crk_tokenized_properties_block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

id _CRKLogASM_7()
{
  if (_CRKLogASM_onceToken_13 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_13, &__block_literal_global_33);
  }
  v0 = (void *)_CRKLogASM_logObj_13;

  return v0;
}

id _CRKLogSettings()
{
  if (_CRKLogSettings_onceToken != -1) {
    dispatch_once(&_CRKLogSettings_onceToken, &__block_literal_global_296);
  }
  v0 = (void *)_CRKLogSettings_logObj;

  return v0;
}

id _CRKLogGeneral_2()
{
  if (_CRKLogGeneral_onceToken_7 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_7, &__block_literal_global_300);
  }
  v0 = (void *)_CRKLogGeneral_logObj_7;

  return v0;
}

id _CRKLogASM_8()
{
  if (_CRKLogASM_onceToken_14 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_14, &__block_literal_global_35);
  }
  v0 = (void *)_CRKLogASM_logObj_14;

  return v0;
}

void __crk_tokenized_properties_block_invoke_8(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

id _CRKLogASM_9()
{
  if (_CRKLogASM_onceToken_15 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_15, &__block_literal_global_36);
  }
  v0 = (void *)_CRKLogASM_logObj_15;

  return v0;
}

void __crk_tokenized_properties_block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void sub_224C36888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224C37C70(_Unwind_Exception *a1)
{
}

id _CRKLogGeneral_3()
{
  if (_CRKLogGeneral_onceToken_9 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_9, &__block_literal_global_61);
  }
  v0 = (void *)_CRKLogGeneral_logObj_9;

  return v0;
}

void __crk_tokenized_properties_block_invoke_10(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

id _CRKLogBluetooth_0()
{
  if (_CRKLogBluetooth_onceToken_0 != -1) {
    dispatch_once(&_CRKLogBluetooth_onceToken_0, &__block_literal_global_40);
  }
  v0 = (void *)_CRKLogBluetooth_logObj_0;

  return v0;
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id extractErrorFromChange(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = 0;
  switch([v3 status])
  {
    case 0:
    case 1:
      uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
      id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSError * _Nullable extractErrorFromChange(AVOutputContextDestinationChange * _Nonnull __strong, NSString * _Nullable __strong)");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"CRKConcreteOutputDevice.m", 71, @"Should never receve this route setting status %ld", objc_msgSend(v3, "status"));
      goto LABEL_4;
    case 2:
      break;
    case 3:
      uint64_t v7 = 1;
      goto LABEL_9;
    case 4:
      if (a2) {
        uint64_t v7 = 129;
      }
      else {
        uint64_t v7 = 128;
      }
LABEL_9:
      id v4 = CRKErrorWithCodeAndUserInfo(v7, 0);
      break;
    default:
      uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
      id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSError * _Nullable extractErrorFromChange(AVOutputContextDestinationChange * _Nonnull __strong, NSString * _Nullable __strong)");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"CRKConcreteOutputDevice.m", 86, @"Encountered unexpected change", v9);
LABEL_4:

      id v4 = 0;
      break;
  }

  return v4;
}

id _CRKLogASM_10()
{
  if (_CRKLogASM_onceToken_16 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_16, &__block_literal_global_121);
  }
  v0 = (void *)_CRKLogASM_logObj_16;

  return v0;
}

id CRKLocalizedSwiftString(void *a1)
{
  return CRKLocalizedSwiftStringFromTable(a1, @"Localizable");
}

id CRKLocalizedSwiftStringFromTable(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:v5 value:&stru_26D7E7B00 table:v4];

  return v7;
}

void sub_224C3E944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224C41424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogSession()
{
  if (_CRKLogSession_onceToken != -1) {
    dispatch_once(&_CRKLogSession_onceToken, &__block_literal_global_274);
  }
  v0 = (void *)_CRKLogSession_logObj;

  return v0;
}

void sub_224C45C6C(void *a1, int a2)
{
  id v3 = objc_begin_catch(a1);
  if (a2 == 2)
  {
    id v4 = v3;
    id v5 = _CRKLogGeneral_4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[CRKMDMIdentityProvider identity];
    }

    objc_end_catch();
    JUMPOUT(0x224C45C1CLL);
  }
  JUMPOUT(0x224C45C20);
}

id _CRKLogGeneral_4()
{
  if (_CRKLogGeneral_onceToken_12 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_12, &__block_literal_global_50);
  }
  v0 = (void *)_CRKLogGeneral_logObj_12;

  return v0;
}

void sub_224C461D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224C46F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224C470C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogASM_11()
{
  if (_CRKLogASM_onceToken_18 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_18, &__block_literal_global_53);
  }
  v0 = (void *)_CRKLogASM_logObj_18;

  return v0;
}

void sub_224C49AD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id _CRKLogASM_12()
{
  if (_CRKLogASM_onceToken_19 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_19, &__block_literal_global_94);
  }
  v0 = (void *)_CRKLogASM_logObj_19;

  return v0;
}

id _CRKLogBluetooth_1()
{
  if (_CRKLogBluetooth_onceToken_2 != -1) {
    dispatch_once(&_CRKLogBluetooth_onceToken_2, &__block_literal_global_56);
  }
  v0 = (void *)_CRKLogBluetooth_logObj_2;

  return v0;
}

void sub_224C4D958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
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

uint64_t CRKBoolCompare(int a1, int a2)
{
  uint64_t v2 = 1;
  if (!a1) {
    uint64_t v2 = -1;
  }
  if (a1 != a2) {
    return v2;
  }
  else {
    return 0;
  }
}

uint64_t CRKIntegerCompare(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 1;
  if (a1 <= a2) {
    uint64_t v2 = -1;
  }
  if (a1 == a2) {
    return 0;
  }
  else {
    return v2;
  }
}

id _CRKLogGeneral_5()
{
  if (_CRKLogGeneral_onceToken_16 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_16, &__block_literal_global_58);
  }
  v0 = (void *)_CRKLogGeneral_logObj_16;

  return v0;
}

void __crk_tokenized_properties_block_invoke_11(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void sub_224C54C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_6()
{
  if (_CRKLogGeneral_onceToken_17 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_17, &__block_literal_global_120);
  }
  v0 = (void *)_CRKLogGeneral_logObj_17;

  return v0;
}

void sub_224C55138(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_224C58A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
}

id _CRKLogOperation()
{
  if (_CRKLogOperation_onceToken != -1) {
    dispatch_once(&_CRKLogOperation_onceToken, &__block_literal_global_60);
  }
  v0 = (void *)_CRKLogOperation_logObj;

  return v0;
}

uint64_t CRKApplicationInfoServiceXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D832A68];
}

id _identityFunction_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

void sub_224C6204C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_7()
{
  if (_CRKLogGeneral_onceToken_22 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_22, &__block_literal_global_106);
  }
  v0 = (void *)_CRKLogGeneral_logObj_22;

  return v0;
}

void sub_224C622F0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_224C625E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224C63B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224C63D38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

id _CRKLogSettings_0()
{
  if (_CRKLogSettings_onceToken_0 != -1) {
    dispatch_once(&_CRKLogSettings_onceToken_0, &__block_literal_global_69);
  }
  v0 = (void *)_CRKLogSettings_logObj_0;

  return v0;
}

id _CRKLogOperation_0()
{
  if (_CRKLogOperation_onceToken_0 != -1) {
    dispatch_once(&_CRKLogOperation_onceToken_0, &__block_literal_global_156);
  }
  v0 = (void *)_CRKLogOperation_logObj_0;

  return v0;
}

id _CRKLogGeneral_8()
{
  if (_CRKLogGeneral_onceToken_23 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_23, &__block_literal_global_160);
  }
  v0 = (void *)_CRKLogGeneral_logObj_23;

  return v0;
}

id _CRKLogOperation_1()
{
  if (_CRKLogOperation_onceToken_1 != -1) {
    dispatch_once(&_CRKLogOperation_onceToken_1, &__block_literal_global_234);
  }
  v0 = (void *)_CRKLogOperation_logObj_1;

  return v0;
}

id _CRKLogGeneral_9()
{
  if (_CRKLogGeneral_onceToken_24 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_24, &__block_literal_global_238);
  }
  v0 = (void *)_CRKLogGeneral_logObj_24;

  return v0;
}

id _CRKLogASM_13()
{
  if (_CRKLogASM_onceToken_20 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_20, &__block_literal_global_73);
  }
  v0 = (void *)_CRKLogASM_logObj_20;

  return v0;
}

void sub_224C6B304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _CRKLogASM_14()
{
  if (_CRKLogASM_onceToken_21 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_21, &__block_literal_global_74);
  }
  v0 = (void *)_CRKLogASM_logObj_21;

  return v0;
}

void sub_224C6C610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CRKInternetDateFetchingXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D839218];
}

id _CRKLogASM_15()
{
  if (_CRKLogASM_onceToken_22 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_22, &__block_literal_global_77);
  }
  v0 = (void *)_CRKLogASM_logObj_22;

  return v0;
}

void sub_224C6E040(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_224C6ED84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

id _CRKLogGeneral_10()
{
  if (_CRKLogGeneral_onceToken_26 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_26, &__block_literal_global_33_0);
  }
  v0 = (void *)_CRKLogGeneral_logObj_26;

  return v0;
}

id _CRKLogGeneral_11()
{
  if (_CRKLogGeneral_onceToken_27 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_27, &__block_literal_global_80);
  }
  v0 = (void *)_CRKLogGeneral_logObj_27;

  return v0;
}

void __crk_tokenized_properties_block_invoke_12(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void __crk_tokenized_properties_block_invoke_13(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void __crk_tokenized_properties_block_invoke_14(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

uint64_t notificationDidFireCFunction(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 notificationDidFire:a5];
}

id _CRKLogBluetooth_2()
{
  if (_CRKLogBluetooth_onceToken_3 != -1) {
    dispatch_once(&_CRKLogBluetooth_onceToken_3, &__block_literal_global_329);
  }
  v0 = (void *)_CRKLogBluetooth_logObj_3;

  return v0;
}

id _CRKLogASM_16()
{
  if (_CRKLogASM_onceToken_23 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_23, &__block_literal_global_81);
  }
  v0 = (void *)_CRKLogASM_logObj_23;

  return v0;
}

id _CRKLogSession_0()
{
  if (_CRKLogSession_onceToken_0 != -1) {
    dispatch_once(&_CRKLogSession_onceToken_0, &__block_literal_global_84);
  }
  v0 = (void *)_CRKLogSession_logObj_0;

  return v0;
}

void sub_224C774F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

id _CRKLogGeneral_12()
{
  if (_CRKLogGeneral_onceToken_28 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_28, &__block_literal_global_85);
  }
  v0 = (void *)_CRKLogGeneral_logObj_28;

  return v0;
}

void sub_224C78E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
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

id _CRKLogASM_17()
{
  if (_CRKLogASM_onceToken_24 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_24, &__block_literal_global_86);
  }
  v0 = (void *)_CRKLogASM_logObj_24;

  return v0;
}

void __crk_tokenized_properties_block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void __crk_tokenized_properties_block_invoke_16(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

id _CRKLogGeneral_13()
{
  if (_CRKLogGeneral_onceToken_29 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_29, &__block_literal_global_89);
  }
  v0 = (void *)_CRKLogGeneral_logObj_29;

  return v0;
}

__CFString *NSStringFromCRKBookType(unint64_t a1)
{
  if (a1 > 4) {
    return @"UNKNOWN";
  }
  else {
    return off_2646F5258[a1];
  }
}

__CFString *CRKStringForConfigurationType(unint64_t a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return off_2646F5358[a1];
  }
}

id CRKFoundationClasses()
{
  if (CRKFoundationClasses_onceToken != -1) {
    dispatch_once(&CRKFoundationClasses_onceToken, &__block_literal_global_90);
  }
  v0 = (void *)CRKFoundationClasses_result;

  return v0;
}

uint64_t __CRKFoundationClasses_block_invoke()
{
  unint64_t v11 = (void *)MEMORY[0x263EFFA08];
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  CRKFoundationClasses_result = objc_msgSend(v11, "setWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

id _CRKLogASM_18()
{
  if (_CRKLogASM_onceToken_27 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_27, &__block_literal_global_92);
  }
  uint64_t v0 = (void *)_CRKLogASM_logObj_27;

  return v0;
}

uint64_t CRKBooksServiceXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D8200D0];
}

uint64_t CRKStudentDaemonXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D82CF60];
}

void sub_224C82058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id _CRKLogGeneral_14()
{
  if (_CRKLogGeneral_onceToken_30 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_30, &__block_literal_global_95);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_30;

  return v0;
}

id _CRKLogASM_19()
{
  if (_CRKLogASM_onceToken_28 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_28, &__block_literal_global_96);
  }
  uint64_t v0 = (void *)_CRKLogASM_logObj_28;

  return v0;
}

__CFString *NSStringFromCRKIDSAccountStateSummary(unint64_t a1)
{
  if (a1 > 2) {
    return @"UNKNOWN-ThisIsABug";
  }
  else {
    return off_2646F5488[a1];
  }
}

void __crk_tokenized_properties_block_invoke_17(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void _BOMCopierDidGenerateFatalError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = BOMCopierUserData();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [NSString stringWithUTF8String:a2];
  id v6 = [v4 errorFromBOMCopierStatus:1 message:v5];

  uint64_t v7 = _CRKLogOperation_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    _BOMCopierDidGenerateFatalError_cold_1((uint64_t)v3, v6, v7);
  }

  [v3 setStashedError:v6];
}

void _BOMCopierDidGenerateFatalFileError(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = BOMCopierUserData();
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a3 userInfo:0];
  uint64_t v7 = _CRKLogOperation_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = [NSString stringWithUTF8String:a2];
    uint64_t v9 = [v6 verboseDescription];
    int v10 = 138543874;
    unint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    _os_log_error_impl(&dword_224C00000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Encountered FATAL file error for path %{public}@: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [v5 setStashedError:v6];
}

uint64_t _BOMCopierDidGenerateFileError(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = BOMCopierUserData();
  id v6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:a3 userInfo:0];
  uint64_t v7 = _CRKLogOperation_2();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [NSString stringWithUTF8String:a2];
    int v10 = [v6 verboseDescription];
    int v11 = 138543874;
    __int16 v12 = v5;
    __int16 v13 = 2114;
    __int16 v14 = v9;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_error_impl(&dword_224C00000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Encountered file error for path %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
  }
  [v5 setStashedError:v6];

  return 2;
}

uint64_t _BOMCopierDidGenerateFileConflictError(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v3 = BOMCopierUserData();
  uint64_t v4 = _CRKLogOperation_2();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [NSString stringWithUTF8String:a2];
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v3;
    __int16 v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_224C00000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Encountered file conflict for path %{public}@", buf, 0x16u);
  }
  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v7 = [NSString stringWithUTF8String:a2];
  id v15 = 0;
  char v8 = [v6 removeItemAtPath:v7 error:&v15];
  id v9 = v15;

  if (v8)
  {
    uint64_t v10 = 3;
  }
  else
  {
    [v3 setStashedError:v9];
    int v11 = _CRKLogOperation_2();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = [NSString stringWithUTF8String:a2];
      __int16 v14 = [v9 verboseDescription];
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v3;
      __int16 v18 = 2114;
      v19 = v13;
      __int16 v20 = 2114;
      v21 = v14;
      _os_log_error_impl(&dword_224C00000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to resolve file conflict by deleting existing file at path %{public}@. Error: %{public}@", buf, 0x20u);
    }
    uint64_t v10 = 2;
  }

  return v10;
}

id _CRKLogOperation_2()
{
  if (_CRKLogOperation_onceToken_2 != -1) {
    dispatch_once(&_CRKLogOperation_onceToken_2, &__block_literal_global_98);
  }
  uint64_t v0 = (void *)_CRKLogOperation_logObj_2;

  return v0;
}

uint64_t CRKScreenshotServiceXPCInterface()
{
  return [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D8358D8];
}

id _CRKLogGeneral_15()
{
  if (_CRKLogGeneral_onceToken_32 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_32, &__block_literal_global_100);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_32;

  return v0;
}

void __crk_tokenized_properties_block_invoke_18(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x263F08708];
  id v6 = a2;
  id v8 = [v5 whitespaceAndNewlineCharacterSet];
  uint64_t v7 = [v6 stringByTrimmingCharactersInSet:v8];

  [*(id *)(a1 + 32) setObject:v7 atIndexedSubscript:a3];
}

void sub_224C8A580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_224C8C928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void sub_224C8CB28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_16()
{
  if (_CRKLogGeneral_onceToken_35 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_35, &__block_literal_global_104);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_35;

  return v0;
}

void sub_224C8DBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
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

void sub_224C8DDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_17()
{
  if (_CRKLogGeneral_onceToken_36 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_36, &__block_literal_global_105);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_36;

  return v0;
}

id _CRKLogGeneral_18()
{
  if (_CRKLogGeneral_onceToken_37 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_37, &__block_literal_global_109);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_37;

  return v0;
}

void sub_224C990D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

id CRKErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  uint64_t v229 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (CRKErrorWithCodeAndUserInfo_onceToken != -1) {
    dispatch_once(&CRKErrorWithCodeAndUserInfo_onceToken, &__block_literal_global_111);
  }
  uint64_t v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [v3 objectForKeyedSubscript:@"NSDescriptionKey"];

    if (v6) {
      goto LABEL_5;
    }
  }
  if (a1 > 299)
  {
    switch(a1)
    {
      case 300:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The AirPlay route is out of range.";
        break;
      case 350:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"There is no active instructor certificate to vend.";
        break;
      case 351:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The Books Service was unable to parse a book's table of contents.";
        break;
      default:
LABEL_5:
        id v7 = v3;
        id v8 = 0;
        id v9 = 0;
        goto LABEL_253;
    }
LABEL_250:
    id v8 = objc_msgSend(v11, "cat_localizedStringsForKey:value:table:", v12, &stru_26D7E7B00, @"CRKErrors");
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = v3;
    switch(a1)
    {
      case 1:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"An unknown error occurred.";
        goto LABEL_250;
      case 2:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"A parameter was invalid.";
        goto LABEL_250;
      case 3:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The maximum number of retries has been exceeded.";
        goto LABEL_250;
      case 4:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The device could not be found.";
        goto LABEL_250;
      case 5:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The provided item cannot be modified.";
        goto LABEL_250;
      case 6:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The instructor is out of range.";
        goto LABEL_250;
      case 7:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The configuration could not be written.";
        goto LABEL_250;
      case 8:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The resource credential could not be retrieved.";
        goto LABEL_250;
      case 9:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"Failed to create user notification (error code %@).", &stru_26D7E7B00, @"CRKErrors");
        long long v212 = 0u;
        long long v213 = 0u;
        long long v214 = 0u;
        long long v215 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v9 countByEnumeratingWithState:&v212 objects:v228 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v213;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v213 != v15) {
                objc_enumerationMutation(v9);
              }
              uint64_t v17 = *(void *)(*((void *)&v212 + 1) + 8 * i);
              __int16 v18 = [v9 objectForKeyedSubscript:v17];
              v19 = NSString;
              __int16 v20 = [v10 objectForKeyedSubscript:@"kCRKCFUserNotificationErrorCodeKey"];
              uint64_t v21 = [v19 stringWithValidatedFormat:v18, @"%@", 0, v20 validFormatSpecifiers error];
              uint64_t v22 = (void *)v21;
              if (v21) {
                v23 = (__CFString *)v21;
              }
              else {
                v23 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v23 forKeyedSubscript:v17];
            }
            uint64_t v14 = [v9 countByEnumeratingWithState:&v212 objects:v228 count:16];
          }
          while (v14);
        }

        id v3 = v10;
        goto LABEL_233;
      case 10:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to create run loop source.";
        goto LABEL_250;
      case 11:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to create certificate.";
        goto LABEL_250;
      case 12:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"“%@” not found.", &stru_26D7E7B00, @"CRKErrors");
        long long v208 = 0u;
        long long v209 = 0u;
        long long v210 = 0u;
        long long v211 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = [v9 countByEnumeratingWithState:&v208 objects:v227 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v209;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v209 != v26) {
                objc_enumerationMutation(v9);
              }
              uint64_t v28 = *(void *)(*((void *)&v208 + 1) + 8 * j);
              v29 = [v9 objectForKeyedSubscript:v28];
              v30 = NSString;
              v31 = [v3 objectForKeyedSubscript:@"kCRKItemNameErrorKey"];
              uint64_t v32 = [v30 stringWithValidatedFormat:v29, @"%@", 0, v31 validFormatSpecifiers error];
              v33 = (void *)v32;
              if (v32) {
                v34 = (__CFString *)v32;
              }
              else {
                v34 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v34 forKeyedSubscript:v28];

              id v3 = v10;
            }
            uint64_t v25 = [v9 countByEnumeratingWithState:&v208 objects:v227 count:16];
          }
          while (v25);
        }
        goto LABEL_232;
      case 13:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"No app handling URL “%@” was found.", &stru_26D7E7B00, @"CRKErrors");
        long long v204 = 0u;
        long long v205 = 0u;
        long long v206 = 0u;
        long long v207 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = [v9 countByEnumeratingWithState:&v204 objects:v226 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v205;
          do
          {
            for (uint64_t k = 0; k != v36; ++k)
            {
              if (*(void *)v205 != v37) {
                objc_enumerationMutation(v9);
              }
              uint64_t v39 = *(void *)(*((void *)&v204 + 1) + 8 * k);
              v40 = [v9 objectForKeyedSubscript:v39];
              v41 = NSString;
              v42 = [v3 objectForKeyedSubscript:@"kCRKURLStringErrorKey"];
              uint64_t v43 = [v41 stringWithValidatedFormat:v40, @"%@", 0, v42 validFormatSpecifiers error];
              v44 = (void *)v43;
              if (v43) {
                v45 = (__CFString *)v43;
              }
              else {
                v45 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v45 forKeyedSubscript:v39];

              id v3 = v10;
            }
            uint64_t v36 = [v9 countByEnumeratingWithState:&v204 objects:v226 count:16];
          }
          while (v36);
        }
        goto LABEL_232;
      case 14:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"“%@” is an invalid session identifier.", &stru_26D7E7B00, @"CRKErrors");
        long long v200 = 0u;
        long long v201 = 0u;
        long long v202 = 0u;
        long long v203 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v46 = [v9 countByEnumeratingWithState:&v200 objects:v225 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v201;
          do
          {
            for (uint64_t m = 0; m != v47; ++m)
            {
              if (*(void *)v201 != v48) {
                objc_enumerationMutation(v9);
              }
              uint64_t v50 = *(void *)(*((void *)&v200 + 1) + 8 * m);
              v51 = [v9 objectForKeyedSubscript:v50];
              v52 = NSString;
              v53 = [v3 objectForKeyedSubscript:@"kCRKSessionIdentifierStringErrorKey"];
              uint64_t v54 = [v52 stringWithValidatedFormat:v51, @"%@", 0, v53 validFormatSpecifiers error];
              v55 = (void *)v54;
              if (v54) {
                v56 = (__CFString *)v54;
              }
              else {
                v56 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v56 forKeyedSubscript:v50];

              id v3 = v10;
            }
            uint64_t v47 = [v9 countByEnumeratingWithState:&v200 objects:v225 count:16];
          }
          while (v47);
        }
        goto LABEL_232;
      case 15:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"Session “%@” is not active.", &stru_26D7E7B00, @"CRKErrors");
        long long v196 = 0u;
        long long v197 = 0u;
        long long v198 = 0u;
        long long v199 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v57 = [v9 countByEnumeratingWithState:&v196 objects:v224 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v197;
          do
          {
            for (uint64_t n = 0; n != v58; ++n)
            {
              if (*(void *)v197 != v59) {
                objc_enumerationMutation(v9);
              }
              uint64_t v61 = *(void *)(*((void *)&v196 + 1) + 8 * n);
              v62 = [v9 objectForKeyedSubscript:v61];
              v63 = NSString;
              v64 = [v3 objectForKeyedSubscript:@"kCRKSessionIdentifierStringErrorKey"];
              uint64_t v65 = [v63 stringWithValidatedFormat:v62, @"%@", 0, v64 validFormatSpecifiers error];
              v66 = (void *)v65;
              if (v65) {
                v67 = (__CFString *)v65;
              }
              else {
                v67 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v67 forKeyedSubscript:v61];

              id v3 = v10;
            }
            uint64_t v58 = [v9 countByEnumeratingWithState:&v196 objects:v224 count:16];
          }
          while (v58);
        }
        goto LABEL_232;
      case 16:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"No enrollment record found.";
        goto LABEL_250;
      case 17:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Identity certificate not available.";
        goto LABEL_250;
      case 18:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The user declined to receive the item.";
        goto LABEL_250;
      case 19:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"File path “%@” is invalid.", &stru_26D7E7B00, @"CRKErrors");
        long long v192 = 0u;
        long long v193 = 0u;
        long long v194 = 0u;
        long long v195 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v68 = [v9 countByEnumeratingWithState:&v192 objects:v223 count:16];
        if (v68)
        {
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v193;
          do
          {
            for (iuint64_t i = 0; ii != v69; ++ii)
            {
              if (*(void *)v193 != v70) {
                objc_enumerationMutation(v9);
              }
              uint64_t v72 = *(void *)(*((void *)&v192 + 1) + 8 * ii);
              v73 = [v9 objectForKeyedSubscript:v72];
              v74 = NSString;
              v75 = [v3 objectForKeyedSubscript:@"kCRKFilePathErrorKey"];
              uint64_t v76 = [v74 stringWithValidatedFormat:v73, @"%@", 0, v75 validFormatSpecifiers error];
              v77 = (void *)v76;
              if (v76) {
                v78 = (__CFString *)v76;
              }
              else {
                v78 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v78 forKeyedSubscript:v72];

              id v3 = v10;
            }
            uint64_t v69 = [v9 countByEnumeratingWithState:&v192 objects:v223 count:16];
          }
          while (v69);
        }
        goto LABEL_232;
      case 20:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to add certificate to keychain.";
        goto LABEL_250;
      case 21:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"VoiceOver is enabled.";
        goto LABEL_250;
      case 22:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The resource is invalid.";
        goto LABEL_250;
      case 23:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The security level of the user's account is not HSA2.";
        goto LABEL_250;
      case 24:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The user's account is not eligible for the requested feature.";
        goto LABEL_250;
      case 25:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Could not present a UI alert.";
        goto LABEL_250;
      case 26:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The workspace failed to open the URL.";
        goto LABEL_250;
      case 27:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to add a new Classroom identity to the keychain.";
        goto LABEL_250;
      case 28:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to remove a Classroom identity from the keychain.";
        goto LABEL_250;
      case 29:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Multiple errors exist in the underlying error.";
        goto LABEL_250;
      case 30:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to enroll in course.";
        goto LABEL_250;
      case 31:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The attempted action is unsupported in the simulator.";
        goto LABEL_250;
      case 32:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The operation timed out.";
        goto LABEL_250;
      case 33:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The certificate is temporally invalid.";
        goto LABEL_250;
      case 34:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The common name of the certificate is malformed.";
        goto LABEL_250;
      case 35:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"There are no Apple Accounts.";
        goto LABEL_250;
      case 36:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The user identifier contained in the certificate does not match the expected user identifier.";
        goto LABEL_250;
      case 37:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"Property “%@” was never retrieved.", &stru_26D7E7B00, @"CRKErrors");
        long long v188 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        long long v191 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v79 = [v9 countByEnumeratingWithState:&v188 objects:v222 count:16];
        if (v79)
        {
          uint64_t v80 = v79;
          uint64_t v81 = *(void *)v189;
          do
          {
            for (juint64_t j = 0; jj != v80; ++jj)
            {
              if (*(void *)v189 != v81) {
                objc_enumerationMutation(v9);
              }
              uint64_t v83 = *(void *)(*((void *)&v188 + 1) + 8 * jj);
              v84 = [v9 objectForKeyedSubscript:v83];
              v85 = NSString;
              v86 = [v3 objectForKeyedSubscript:@"kCRKPropertyNameErrorKey"];
              uint64_t v87 = [v85 stringWithValidatedFormat:v84, @"%@", 0, v86 validFormatSpecifiers error];
              v88 = (void *)v87;
              if (v87) {
                v89 = (__CFString *)v87;
              }
              else {
                v89 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v89 forKeyedSubscript:v83];

              id v3 = v10;
            }
            uint64_t v80 = [v9 countByEnumeratingWithState:&v188 objects:v222 count:16];
          }
          while (v80);
        }
        goto LABEL_232;
      case 38:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The instructor is quarantined and not permitted to perform this operation.";
        goto LABEL_250;
      case 39:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"A required primitive subsystem is missing.";
        goto LABEL_250;
      case 40:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The public key could not be extracted.";
        goto LABEL_250;
      case 41:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The user canceled the credential renewal attempt.";
        goto LABEL_250;
      case 42:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The credential renewal attempt failed.";
        goto LABEL_250;
      case 43:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Credential renewal has been rate limited.";
        goto LABEL_250;
      case 44:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The account needs more time to process the results of the sign-in.";
        goto LABEL_250;
      case 45:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The status for the IDS ID is unknown. Message sending may or may not succeed.";
        goto LABEL_250;
      case 46:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The status for the IDS ID is invalid. Message sending will not succeed.";
        goto LABEL_250;
      case 47:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The requested action is already in progress.";
        goto LABEL_250;
      case 51:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Partial error from iCloud";
        goto LABEL_250;
      case 52:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Zone does not exist for iCloud operation";
        goto LABEL_250;
      case 53:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Requested item is not found on iCloud";
        goto LABEL_250;
      case 54:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"User not signed into iCloud";
        goto LABEL_250;
      case 55:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"iCloud server unreachable";
        goto LABEL_250;
      case 56:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"This should never happen, error handling must be updated";
        goto LABEL_250;
      case 57:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Releasing resources before they are uploaded to iCloud";
        goto LABEL_250;
      case 58:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"App is too far out of date to interact with iCloud server";
        goto LABEL_250;
      case 59:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Small hiccup on iCloud server, try the operation again";
        goto LABEL_250;
      case 60:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The syncing manager is failing to handle this error";
        goto LABEL_250;
      case 61:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The task is too large for a single iCloud transaction. Divide work in half and try again";
        goto LABEL_250;
      case 62:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Nonrecoverable iCloud syncing failure";
        goto LABEL_250;
      case 63:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"iCloud record modification race";
        goto LABEL_250;
      case 64:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Server token is out of date. Pull update from iCloud";
        goto LABEL_250;
      case 65:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Could not establish a push connection for iCloud container";
        goto LABEL_250;
      case 66:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Could not make the requested engine transition from the current state";
        goto LABEL_250;
      case 67:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Application could not be made visible.";
        goto LABEL_250;
      case 101:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The instructor extension could not be found.";
        goto LABEL_250;
      case 102:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The device's screen is off.";
        goto LABEL_250;
      case 103:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"BTLE not available on this device.";
        goto LABEL_250;
      case 104:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"A user with the identifier (%@) could not be found.", &stru_26D7E7B00, @"CRKErrors");
        long long v168 = 0u;
        long long v169 = 0u;
        long long v170 = 0u;
        long long v171 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v90 = [v9 countByEnumeratingWithState:&v168 objects:v217 count:16];
        if (v90)
        {
          uint64_t v91 = v90;
          uint64_t v92 = *(void *)v169;
          do
          {
            for (kuint64_t k = 0; kk != v91; ++kk)
            {
              if (*(void *)v169 != v92) {
                objc_enumerationMutation(v9);
              }
              uint64_t v94 = *(void *)(*((void *)&v168 + 1) + 8 * kk);
              v95 = [v9 objectForKeyedSubscript:v94];
              v96 = NSString;
              v97 = [v3 objectForKeyedSubscript:@"kCRKInvalidIdentifierErrorKey"];
              uint64_t v98 = [v96 stringWithValidatedFormat:v95, @"%@", 0, v97 validFormatSpecifiers error];
              v99 = (void *)v98;
              if (v98) {
                v100 = (__CFString *)v98;
              }
              else {
                v100 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v100 forKeyedSubscript:v94];

              id v3 = v10;
            }
            uint64_t v91 = [v9 countByEnumeratingWithState:&v168 objects:v217 count:16];
          }
          while (v91);
        }
        goto LABEL_232;
      case 105:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"An error occured while trying to save the user.";
        goto LABEL_250;
      case 106:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"A user is not logged in.";
        goto LABEL_250;
      case 107:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The device is locked.";
        goto LABEL_250;
      case 108:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Feature is restricted by profile.";
        goto LABEL_250;
      case 109:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"An error occurred when obtaining permission to perform the request.";
        goto LABEL_250;
      case 110:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The user denied permission to perform the request.";
        goto LABEL_250;
      case 111:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"Feature “%@” is not modifiable.", &stru_26D7E7B00, @"CRKErrors");
        long long v164 = 0u;
        long long v165 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v101 = [v9 countByEnumeratingWithState:&v164 objects:v216 count:16];
        if (v101)
        {
          uint64_t v102 = v101;
          uint64_t v103 = *(void *)v165;
          do
          {
            for (muint64_t m = 0; mm != v102; ++mm)
            {
              if (*(void *)v165 != v103) {
                objc_enumerationMutation(v9);
              }
              uint64_t v105 = *(void *)(*((void *)&v164 + 1) + 8 * mm);
              v106 = [v9 objectForKeyedSubscript:v105];
              v107 = NSString;
              v108 = [v3 objectForKeyedSubscript:@"kCRKFeatureErrorKey"];
              uint64_t v109 = [v107 stringWithValidatedFormat:v106, @"%@", 0, v108 validFormatSpecifiers error];
              v110 = (void *)v109;
              if (v109) {
                v111 = (__CFString *)v109;
              }
              else {
                v111 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v111 forKeyedSubscript:v105];

              id v3 = v10;
            }
            uint64_t v102 = [v9 countByEnumeratingWithState:&v164 objects:v216 count:16];
          }
          while (v102);
        }
        goto LABEL_232;
      case 112:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The operation is not implemented on the current platform";
        goto LABEL_250;
      case 113:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Unable to fetch today's date.";
        goto LABEL_250;
      case 114:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The student daemon is not available on this platform.";
        goto LABEL_250;
      case 115:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The user is unable to open the item";
        goto LABEL_250;
      case 116:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The device's screen saver is active";
        goto LABEL_250;
      case 117:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The course mascot and color have already been set for this class session";
        goto LABEL_250;
      case 118:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to set metadata for the course";
        goto LABEL_250;
      case 119:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to pause media";
        goto LABEL_250;
      case 120:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to take screenshot";
        goto LABEL_250;
      case 121:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Failed to wake screen";
        goto LABEL_250;
      case 122:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"The app “%@” is not installed.", &stru_26D7E7B00, @"CRKErrors");
        long long v184 = 0u;
        long long v185 = 0u;
        long long v186 = 0u;
        long long v187 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v112 = [v9 countByEnumeratingWithState:&v184 objects:v221 count:16];
        if (v112)
        {
          uint64_t v113 = v112;
          uint64_t v114 = *(void *)v185;
          do
          {
            for (nuint64_t n = 0; nn != v113; ++nn)
            {
              if (*(void *)v185 != v114) {
                objc_enumerationMutation(v9);
              }
              uint64_t v116 = *(void *)(*((void *)&v184 + 1) + 8 * nn);
              v117 = [v9 objectForKeyedSubscript:v116];
              v118 = NSString;
              v119 = [v3 objectForKeyedSubscript:@"kCRKBundleIdentifierErrorKey"];
              uint64_t v120 = [v118 stringWithValidatedFormat:v117, @"%@", 0, v119 validFormatSpecifiers error];
              v121 = (void *)v120;
              if (v120) {
                v122 = (__CFString *)v120;
              }
              else {
                v122 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v122 forKeyedSubscript:v116];

              id v3 = v10;
            }
            uint64_t v113 = [v9 countByEnumeratingWithState:&v184 objects:v221 count:16];
          }
          while (v113);
        }
        goto LABEL_232;
      case 123:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"The provided app “%@” could not be opened.", &stru_26D7E7B00, @"CRKErrors");
        long long v180 = 0u;
        long long v181 = 0u;
        long long v182 = 0u;
        long long v183 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v123 = [v9 countByEnumeratingWithState:&v180 objects:v220 count:16];
        if (v123)
        {
          uint64_t v124 = v123;
          uint64_t v125 = *(void *)v181;
          do
          {
            for (uint64_t i1 = 0; i1 != v124; ++i1)
            {
              if (*(void *)v181 != v125) {
                objc_enumerationMutation(v9);
              }
              uint64_t v127 = *(void *)(*((void *)&v180 + 1) + 8 * i1);
              v128 = [v9 objectForKeyedSubscript:v127];
              v129 = NSString;
              v130 = [v3 objectForKeyedSubscript:@"kCRKBundleIdentifierErrorKey"];
              uint64_t v131 = [v129 stringWithValidatedFormat:v128, @"%@", 0, v130 validFormatSpecifiers error];
              v132 = (void *)v131;
              if (v131) {
                v133 = (__CFString *)v131;
              }
              else {
                v133 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v133 forKeyedSubscript:v127];

              id v3 = v10;
            }
            uint64_t v124 = [v9 countByEnumeratingWithState:&v180 objects:v220 count:16];
          }
          while (v124);
        }
        goto LABEL_232;
      case 124:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"The provided URL “%@” could not be opened.", &stru_26D7E7B00, @"CRKErrors");
        long long v176 = 0u;
        long long v177 = 0u;
        long long v178 = 0u;
        long long v179 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v134 = [v9 countByEnumeratingWithState:&v176 objects:v219 count:16];
        if (v134)
        {
          uint64_t v135 = v134;
          uint64_t v136 = *(void *)v177;
          do
          {
            for (uint64_t i2 = 0; i2 != v135; ++i2)
            {
              if (*(void *)v177 != v136) {
                objc_enumerationMutation(v9);
              }
              uint64_t v138 = *(void *)(*((void *)&v176 + 1) + 8 * i2);
              v139 = [v9 objectForKeyedSubscript:v138];
              v140 = NSString;
              v141 = [v3 objectForKeyedSubscript:@"kCRKURLStringErrorKey"];
              uint64_t v142 = [v140 stringWithValidatedFormat:v139, @"%@", 0, v141 validFormatSpecifiers error];
              v143 = (void *)v142;
              if (v142) {
                v144 = (__CFString *)v142;
              }
              else {
                v144 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v144 forKeyedSubscript:v138];

              id v3 = v10;
            }
            uint64_t v135 = [v9 countByEnumeratingWithState:&v176 objects:v219 count:16];
          }
          while (v135);
        }
        goto LABEL_232;
      case 125:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The volume could not be set.";
        goto LABEL_250;
      case 126:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Canceling Single App Mode timed out.";
        goto LABEL_250;
      case 127:
        uint64_t v161 = a1;
        id v8 = objc_opt_new();
        objc_msgSend((id)CRKErrorWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"Single App Mode could not be initiated for the provided bundle identifier “%@”.", &stru_26D7E7B00, @"CRKErrors");
        long long v172 = 0u;
        long long v173 = 0u;
        long long v174 = 0u;
        long long v175 = 0u;
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v145 = [v9 countByEnumeratingWithState:&v172 objects:v218 count:16];
        if (v145)
        {
          uint64_t v146 = v145;
          uint64_t v147 = *(void *)v173;
          do
          {
            for (uint64_t i3 = 0; i3 != v146; ++i3)
            {
              if (*(void *)v173 != v147) {
                objc_enumerationMutation(v9);
              }
              uint64_t v149 = *(void *)(*((void *)&v172 + 1) + 8 * i3);
              v150 = [v9 objectForKeyedSubscript:v149];
              v151 = NSString;
              v152 = [v3 objectForKeyedSubscript:@"kCRKBundleIdentifierErrorKey"];
              uint64_t v153 = [v151 stringWithValidatedFormat:v150, @"%@", 0, v152 validFormatSpecifiers error];
              v154 = (void *)v153;
              if (v153) {
                v155 = (__CFString *)v153;
              }
              else {
                v155 = @"FORMAT SPECIFIER ERROR";
              }
              [v8 setObject:v155 forKeyedSubscript:v149];

              id v3 = v10;
            }
            uint64_t v146 = [v9 countByEnumeratingWithState:&v172 objects:v218 count:16];
          }
          while (v146);
        }
LABEL_232:

LABEL_233:
        a1 = v161;
        break;
      case 128:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"A password is required to AirPlay to the requested route.";
        goto LABEL_250;
      case 129:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The supplied password for the AirPlay route was incorrect.";
        goto LABEL_250;
      case 130:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The user initated a disconnect of the management session.";
        goto LABEL_250;
      case 131:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The device has been idle for the maximum allowable time.";
        goto LABEL_250;
      case 150:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"ClassKit did not report a known current user for the device";
        goto LABEL_250;
      case 151:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Could not find location with required permissions.";
        goto LABEL_250;
      case 152:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Found several objects matching given object ID.";
        goto LABEL_250;
      case 153:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The same user was requested to be both added to, and removed from, the course.";
        goto LABEL_250;
      case 154:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The connection to the server failed.";
        goto LABEL_250;
      case 155:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"There are too many users to perform the requested operation.";
        goto LABEL_250;
      case 156:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"Your device is not connected to the Internet.";
        goto LABEL_250;
      case 201:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The device is already enrolled.";
        goto LABEL_250;
      case 202:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The student is not enrolled in the course.";
        goto LABEL_250;
      case 203:
        int v11 = (void *)CRKErrorWithCodeAndUserInfo_bundle;
        __int16 v12 = @"The instructor is not known or not trusted.";
        goto LABEL_250;
      default:
        goto LABEL_5;
    }
  }
  id v7 = v3;
  if (v8)
  {
    v156 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v7];
    v162[0] = MEMORY[0x263EF8330];
    v162[1] = 3221225472;
    v162[2] = __CRKErrorWithCodeAndUserInfo_block_invoke_2;
    v162[3] = &unk_2646F5880;
    id v163 = v156;
    id v157 = v156;
    [v8 enumerateKeysAndObjectsUsingBlock:v162];
    uint64_t v158 = [v157 copy];

    id v7 = (id)v158;
  }
LABEL_253:
  v159 = [MEMORY[0x263F087E8] errorWithDomain:@"ClassroomKit.error" code:a1 userInfo:v7];

  return v159;
}

uint64_t __CRKErrorWithCodeAndUserInfo_block_invoke()
{
  CRKErrorWithCodeAndUserInfo_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

void __CRKErrorWithCodeAndUserInfo_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

id _CRKLogGeneral_19()
{
  if (_CRKLogGeneral_onceToken_39 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_39, &__block_literal_global_112);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_39;

  return v0;
}

void sub_224C9CF0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_224C9E488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_224C9E758(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id _CRKLogGeneral_20()
{
  if (_CRKLogGeneral_onceToken_40 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_40, &__block_literal_global_91);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_40;

  return v0;
}

id _CRKLogGeneral_21()
{
  if (_CRKLogGeneral_onceToken_43 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_43, &__block_literal_global_118);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_43;

  return v0;
}

void sub_224CA942C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_224CAA00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
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

void sub_224CAA758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id _CRKLogGeneral_22()
{
  if (_CRKLogGeneral_onceToken_46 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_46, &__block_literal_global_121);
  }
  uint64_t v0 = (void *)_CRKLogGeneral_logObj_46;

  return v0;
}

void __CRKLogAddStateHandler_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Error serializing dictionary for State Capture: %{public}@", (uint8_t *)&v2, 0xCu);
}

void CRTLogError_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void JSONStringRepresentation_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 verboseDescription];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "Error encoding JSON data: %@", (uint8_t *)&v5, 0xCu);
}

void _BOMCopierDidGenerateFatalError_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [a2 verboseDescription];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl(&dword_224C00000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Encountered FATAL error: %{public}@", (uint8_t *)&v6, 0x16u);
}

uint64_t BOMCopierCancelCopy()
{
  return MEMORY[0x270F126A8]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x270F126B0]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x270F126C0]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x270F126C8]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x270F126E8]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x270F126F0]();
}

uint64_t BOMCopierSetFileConflictErrorHandler()
{
  return MEMORY[0x270F126F8]();
}

uint64_t BOMCopierSetFileErrorHandler()
{
  return MEMORY[0x270F12700]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x270F12708]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x270F12710]();
}

uint64_t CATErrorWithCodeAndUserInfo()
{
  return MEMORY[0x270F25E88]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7B28](data, *(void *)&len, md);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

void *__cdecl CFBundleGetFunctionPointerForName(CFBundleRef bundle, CFStringRef functionName)
{
  return (void *)MEMORY[0x270EE45D8](bundle, functionName);
}

Boolean CFBundleLoadExecutable(CFBundleRef bundle)
{
  return MEMORY[0x270EE4620](bundle);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B90]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStreamCreatePairWithSocketToHost(CFAllocatorRef alloc, CFStringRef host, UInt32 port, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x270EE5A68]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F20](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x270F3C980]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x270F3C9B0]();
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4840](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

void IOPMAssertionRetain(IOPMAssertionID theAssertion)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

Protocol *__cdecl NSProtocolFromString(NSString *namestr)
{
  return (Protocol *)MEMORY[0x270EF2B98](namestr);
}

uint64_t NSStringFromCLSASMPrivilegeType()
{
  return MEMORY[0x270EE3128]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SBLockDevice()
{
  return MEMORY[0x270F770F0]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x270F771E8]();
}

uint64_t SBSUndimScreen()
{
  return MEMORY[0x270F77210]();
}

uint64_t SecCertificateCopyCommonNames()
{
  return MEMORY[0x270EFD6F0]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x270EFD758](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x270EFD810]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x270EFD858]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x270EFD860]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x270EFD8F0](*(void *)&status, reserved);
}

uint64_t SecGenerateSelfSignedCertificate()
{
  return MEMORY[0x270EFD940]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x270EFD950](identityRef, privateKeyRef);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x270EFD958]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EFD9B0](key, error);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

OSStatus SecKeyGeneratePair(CFDictionaryRef parameters, SecKeyRef *publicKey, SecKeyRef *privateKey)
{
  return MEMORY[0x270EFDA80](parameters, publicKey, privateKey);
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x270EFDA90](key);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x270EFDCF8](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t archive_entry_free()
{
  return MEMORY[0x270F97D48]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x270F97D78]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x270F97DF0]();
}

uint64_t archive_errno()
{
  return MEMORY[0x270F97E50]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_read_disk_entry_from_file()
{
  return MEMORY[0x270F97EA8]();
}

uint64_t archive_read_disk_new()
{
  return MEMORY[0x270F97EB0]();
}

uint64_t archive_read_disk_set_standard_lookup()
{
  return MEMORY[0x270F97EC0]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x270F97EE0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x270F97FB0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x270F97FE8]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x270F97FF0]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x270F97FF8]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x270F98018]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x270F98088]();
}

uint64_t archive_write_set_options()
{
  return MEMORY[0x270F98090]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
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

int fchflags(int a1, __uint32_t a2)
{
  return MEMORY[0x270ED9898](*(void *)&a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x270ED9B00](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x270ED9B48](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x270ED9B50](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x270ED9B60](a1);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x270ED9C68](a1);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x270ED9EB8](*(void *)&a1.s_addr);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x270EF7E50](endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x270EF7EB0](hostname, port);
}

uint64_t nw_interface_copy_local_address_for_remote_address()
{
  return MEMORY[0x270EF8330]();
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x270EF8380](interface);
}

void nw_path_enumerate_interfaces(nw_path_t path, nw_path_enumerate_interfaces_block_t enumerate_block)
{
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x270EF8928](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create_with_type(nw_interface_type_t required_interface_type)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A10](*(void *)&required_interface_type);
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

Protocol *__cdecl objc_allocateProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x270F9A558](name);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_registerProtocol(Protocol *proto)
{
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
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

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void protocol_addProtocol(Protocol *proto, Protocol *addition)
{
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x270F9AAD0](p);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x270EDB4B8](*(void *)&a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}
id getSKUIItemOfferButtonClass()
{
  id v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t vars8;

  v9 = 0;
  v10 = &v9;
  v11 = 1342177280;
  v12 = 32;
  v8 = getSKUIItemOfferButtonClass_softClass;
  v13 = getSKUIItemOfferButtonClass_softClass;
  if (!getSKUIItemOfferButtonClass_softClass)
  {
    v2 = MEMORY[0x1E4F143A8];
    v3 = -1073741824;
    v4 = 0;
    v5 = __getSKUIItemOfferButtonClass_block_invoke;
    v6 = &unk_1E6D1FD20;
    v7 = &v9;
    __getSKUIItemOfferButtonClass_block_invoke((uint64_t)&v2);
  }
  v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getSKUIItemOfferButtonClass_block_invoke(uint64_t a1)
{
  StoreKitUILibrary();
  Class Class = objc_getClass("SKUIItemOfferButton");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v4 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v3 = (id)[NSString stringWithUTF8String:"Class getSKUIItemOfferButtonClass(void)_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", "SKUIItemOfferButton");

    __break(1u);
    JUMPOUT(0x1DDFE8878);
  }
  getSKUIItemOfferButtonClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t StoreKitUILibrary()
{
  uint64_t v3 = StoreKitUILibraryCore();
  if (!v3)
  {
    id v2 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v1 = (id)[NSString stringWithUTF8String:"void *StoreKitUILibrary(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1DDFE89A0);
  }
  return v3;
}

uint64_t StoreKitUILibraryCore()
{
  if (!StoreKitUILibraryCore_frameworkLibrary) {
    __StoreKitUILibraryCore_block_invoke();
  }
  return StoreKitUILibraryCore_frameworkLibrary;
}

uint64_t __StoreKitUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  StoreKitUILibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 64;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_64_4_0(uint64_t result, uint64_t a2, int a3, uint64_t a4, int a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 64;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 0;
  *(unsigned char *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_64_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 64;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_1DDFE9DEC()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_2_8_32_4_0(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_1DDFEA93C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,int a23,uint64_t a24)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v24 - 56));
  _Unwind_Resume(a1);
}

id _ACUILogSystem()
{
  predicate = (dispatch_once_t *)&_ACUILogSystem_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_0);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)_ACUILogSystem_log;
  return v0;
}

uint64_t __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 66;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_66(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

double UIRectGetMaxX(double a1, double a2, double a3)
{
  return a1 + a3;
}

double CGRound(double a1)
{
  return round(a1);
}

double CGRound_0(double a1)
{
  return round(a1);
}

void sub_1DDFF8CBC()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_66_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t __UseGoogleMail()
{
  predicate = (dispatch_once_t *)&__UseGoogleMail_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_4);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return __UseGoogleMail__useGoogleMail & 1;
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *uint64_t result = 0;
  result[1] = 0;
  return result;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

void sub_1DE00167C()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  id v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  *uint64_t v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1DE003618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,int a21,int a22,_Unwind_Exception *exception_object,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  objc_destroyWeak(&a30);
  objc_destroyWeak((id *)(v30 - 104));
  _Unwind_Resume(a1);
}

id __MailRegionCode()
{
  predicate = (dispatch_once_t *)&__MailRegionCode_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_351);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)__MailRegionCode__regionCode;
  return v0;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_32(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 32;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

id getIMAPAccountClass()
{
  uint64_t v9 = 0;
  v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getIMAPAccountClass_softClass;
  uint64_t v13 = getIMAPAccountClass_softClass;
  if (!getIMAPAccountClass_softClass)
  {
    uint64_t v2 = MEMORY[0x1E4F143A8];
    int v3 = -1073741824;
    int v4 = 0;
    v5 = __getIMAPAccountClass_block_invoke;
    v6 = &unk_1E6D1FD20;
    v7 = &v9;
    __getIMAPAccountClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t __getIMAPAccountClass_block_invoke(uint64_t a1)
{
  IMAPLibrary();
  Class Class = objc_getClass("IMAPAccount");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v4 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v3 = (id)[NSString stringWithUTF8String:"Class getIMAPAccountClass(void)_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", "IMAPAccount");

    __break(1u);
    JUMPOUT(0x1DE00A558);
  }
  getIMAPAccountClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t IMAPLibrary()
{
  uint64_t v3 = IMAPLibraryCore();
  if (!v3)
  {
    id v2 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v1 = (id)[NSString stringWithUTF8String:"void *IMAPLibrary(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1DE00A680);
  }
  return v3;
}

uint64_t IMAPLibraryCore()
{
  if (!IMAPLibraryCore_frameworkLibrary) {
    __IMAPLibraryCore_block_invoke();
  }
  return IMAPLibraryCore_frameworkLibrary;
}

uint64_t __IMAPLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  IMAPLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_66_4_0(uint64_t result, uint64_t a2, int a3, uint64_t a4, int a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 0;
  *(unsigned char *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  return result;
}

void sub_1DE00FC10()
{
  _Unwind_Resume(v0);
}

void sub_1DE010108()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_0_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_1DE010D94(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 48) = a1;
  *(_DWORD *)(v10 - 52) = a2;
  objc_destroyWeak((id *)(v10 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 48));
}

uint64_t __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_64(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  *(unsigned char *)(result + 38) = 64;
  *(unsigned char *)(result + 39) = 8;
  *(void *)(result + 40) = a6;
  return result;
}

uint64_t __os_log_helper_16_2_4_8_32_4_0_8_66_8_66(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t __os_log_helper_16_2_3_8_32_4_0_8_0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

void sub_1DE013F48()
{
  _Unwind_Resume(v0);
}

void sub_1DE014580(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  *(void *)(v9 - 112) = a1;
  *(_DWORD *)(v9 - 116) = a2;
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v9 - 112));
}

void sub_1DE0162EC()
{
  _Unwind_Resume(v0);
}

void sub_1DE016E94()
{
  _Unwind_Resume(v0);
}

void sub_1DE0172B0(uint64_t a1, int a2)
{
  *(void *)(v2 - 88) = a1;
  *(_DWORD *)(v2 - 92) = a2;
  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 88));
}

id _SortIdentities(void *a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id location = 0;
  objc_storeStrong(&location, a1);
  id v41 = 0;
  objc_storeStrong(&v41, a2);
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v23 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v38 = (id)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v41, "count"));
  memset(__b, 0, sizeof(__b));
  id v24 = v41;
  uint64_t v25 = [v24 countByEnumeratingWithState:__b objects:v46 count:16];
  if (v25)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0;
    unint64_t v21 = v25;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(v24);
      }
      id v37 = *(id *)(__b[1] + 8 * v20);
      id v16 = v38;
      id v17 = (id)[v37 lowercaseString];
      objc_msgSend(v16, "addObject:");

      ++v20;
      if (v18 + 1 >= v21)
      {
        uint64_t v20 = 0;
        unint64_t v21 = [v24 countByEnumeratingWithState:__b objects:v46 count:16];
        if (!v21) {
          break;
        }
      }
    }
  }

  memset(v34, 0, sizeof(v34));
  id v14 = location;
  uint64_t v15 = [v14 countByEnumeratingWithState:v34 objects:v45 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)v34[2];
    uint64_t v12 = 0;
    unint64_t v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)v34[2] != v11) {
        objc_enumerationMutation(v14);
      }
      SecIdentityRef v35 = *(SecIdentityRef *)(v34[1] + 8 * v12);
      SecCertificateRef certificateRef = 0;
      unsigned int v32 = 0;
      unsigned int v32 = SecIdentityCopyCertificate(v35, &certificateRef);
      if (v32)
      {
        NSLog(&cfstr_SSecidentityco.isa, "_SortIdentities", v32);
      }
      else if (certificateRef)
      {
        id v43 = (id)SecCertificateCopyRFC822Names();
        id v31 = v43;
        id v30 = v39;
        memset(v28, 0, sizeof(v28));
        id v8 = v31;
        uint64_t v9 = [v8 countByEnumeratingWithState:v28 objects:v44 count:16];
        if (v9)
        {
          uint64_t v5 = *(void *)v28[2];
          uint64_t v6 = 0;
          unint64_t v7 = v9;
          while (1)
          {
            uint64_t v4 = v6;
            if (*(void *)v28[2] != v5) {
              objc_enumerationMutation(v8);
            }
            id v29 = *(id *)(v28[1] + 8 * v6);
            id v27 = (id)[v29 lowercaseString];
            if ([v38 containsObject:v27])
            {
              objc_storeStrong(&v30, v40);
              int v26 = 6;
            }
            else
            {
              int v26 = 0;
            }
            objc_storeStrong(&v27, 0);
            if (v26) {
              break;
            }
            ++v6;
            if (v4 + 1 >= v7)
            {
              uint64_t v6 = 0;
              unint64_t v7 = [v8 countByEnumeratingWithState:v28 objects:v44 count:16];
              if (!v7) {
                break;
              }
            }
          }
        }

        [v30 addObject:v35];
        CFRelease(certificateRef);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [v14 countByEnumeratingWithState:v34 objects:v45 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  [v40 addObjectsFromArray:v39];
  if (![v40 count]) {
    objc_storeStrong(&v40, 0);
  }
  id v3 = v40;
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&location, 0);
  return v3;
}

BOOL _SecIdentityEqual(const void *a1, const void *a2)
{
  BOOL v3 = 0;
  if (a1 == a2)
  {
    return 1;
  }
  else if (a1 && a2)
  {
    return CFEqual(a1, a2) != 0;
  }
  return v3;
}

id _domainForAddress(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v7 = 0;
  *(void *)&long long v6 = [location rangeOfString:@"@"];
  *((void *)&v6 + 1) = v1;
  if ((void)v6 == 0x7FFFFFFFFFFFFFFFLL
    || (long long v10 = v6, (uint64_t)v6 + v1 >= (unint64_t)[location length]))
  {
    objc_storeStrong(&v7, 0);
  }
  else
  {
    long long v9 = v6;
    id v2 = (id)[location substringFromIndex:(void)v6 + *((void *)&v6 + 1)];
    id v3 = v7;
    id v7 = v2;
  }
  id v5 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
  return v5;
}

id ACUIDescriptionFromEmailAddress(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v8 = 0;
  id v7 = _domainForAddress(location);
  id v6 = (id)[v7 componentsSeparatedByString:@"."];
  if ([v6 count] == 1)
  {
    objc_storeStrong(&v8, location);
  }
  else if ([v6 count] == 2)
  {
    id v5 = (id)[v6 objectAtIndexedSubscript:0];
    id v1 = (id)[v5 capitalizedString];
    id v2 = v8;
    id v8 = v1;
  }
  else
  {
    objc_storeStrong(&v8, v7);
  }
  id v4 = v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&location, 0);
  return v4;
}

uint64_t ACUIIsSharedIPadMode()
{
  predicate = (dispatch_once_t *)&ACUIIsSharedIPadMode_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_7);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return ACUIIsSharedIPadMode_isSharedIPadMode & 1;
}

void __ACUIIsSharedIPadMode_block_invoke(void *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = (id)MKBUserTypeDeviceMode();
  id location = (id)[v2[0] objectForKeyedSubscript:*MEMORY[0x1E4F78100]];
  if ([location isEqualToString:*MEMORY[0x1E4F78110]]) {
    ACUIIsSharedIPadMode_isSharedIPadMode = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(v2, 0);
}

id ACUIOrderedDataClassList(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v2 = +[ACUIUtils sortedDataclassesFrom:location];
  objc_storeStrong(&location, 0);
  return v2;
}

id ACUIVisibleAccountTypes()
{
  predicate = (dispatch_once_t *)&ACUIVisibleAccountTypes_token;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_18);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)ACUIVisibleAccountTypes_visibleTypes;
  return v0;
}

void __ACUIVisibleAccountTypes_block_invoke()
{
  v2[14] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F17858];
  v2[1] = *MEMORY[0x1E4F17770];
  v2[2] = *MEMORY[0x1E4F17778];
  id v2[3] = *MEMORY[0x1E4F177E8];
  v2[4] = *MEMORY[0x1E4F17830];
  v2[5] = *MEMORY[0x1E4F17798];
  v2[6] = *MEMORY[0x1E4F177D0];
  v2[7] = *MEMORY[0x1E4F17818];
  v2[8] = *MEMORY[0x1E4F177C0];
  v2[9] = *MEMORY[0x1E4F17878];
  v2[10] = *MEMORY[0x1E4F17740];
  v2[11] = *MEMORY[0x1E4F177F8];
  v2[12] = *MEMORY[0x1E4F177F0];
  v2[13] = *MEMORY[0x1E4F17750];
  id v0 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:14];
  id v1 = (void *)ACUIVisibleAccountTypes_visibleTypes;
  ACUIVisibleAccountTypes_visibleTypes = (uint64_t)v0;
}

id ACUISortedAccountTypes()
{
  predicate = (dispatch_once_t *)&ACUISortedAccountTypes_token;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_21);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  id v0 = (void *)ACUISortedAccountTypes_sortedTypes;
  return v0;
}

void __ACUISortedAccountTypes_block_invoke()
{
  v2[14] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F17750];
  v2[1] = *MEMORY[0x1E4F17798];
  v2[2] = *MEMORY[0x1E4F177D0];
  id v2[3] = *MEMORY[0x1E4F177C0];
  v2[4] = *MEMORY[0x1E4F17878];
  v2[5] = *MEMORY[0x1E4F17740];
  v2[6] = *MEMORY[0x1E4F177F0];
  v2[7] = *MEMORY[0x1E4F177F8];
  v2[8] = *MEMORY[0x1E4F177E8];
  v2[9] = *MEMORY[0x1E4F17830];
  v2[10] = *MEMORY[0x1E4F17818];
  v2[11] = *MEMORY[0x1E4F17770];
  v2[12] = *MEMORY[0x1E4F17778];
  v2[13] = *MEMORY[0x1E4F17858];
  id v0 = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:14];
  id v1 = (void *)ACUISortedAccountTypes_sortedTypes;
  ACUISortedAccountTypes_sortedTypes = (uint64_t)v0;
}

id ACUIFetchSettingTitle(int a1)
{
  if (a1)
  {
    switch(a1)
    {
      case 900:
        id v3 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v7 = (id)[v3 localizedStringForKey:@"15_MIN" value:&stru_1F39EF5C0 table:@"Localizable"];

        break;
      case 1800:
        id v4 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v7 = (id)[v4 localizedStringForKey:@"30_MIN" value:&stru_1F39EF5C0 table:@"Localizable"];

        break;
      case 3600:
        id v5 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v7 = (id)[v5 localizedStringForKey:@"HOURLY" value:&stru_1F39EF5C0 table:@"Localizable"];

        break;
      default:
        id v2 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v7 = (id)[v2 localizedStringForKey:@"OFF" value:&stru_1F39EF5C0 table:@"Localizable"];

        break;
    }
  }
  else
  {
    id v6 = (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v7 = (id)[v6 localizedStringForKey:@"AUTOMATICALLY" value:&stru_1F39EF5C0 table:@"Localizable"];
  }
  return v7;
}

uint64_t ACUIFetchSettingFromNumber(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  unsigned int v2 = [location intValue];
  objc_storeStrong(&location, 0);
  return v2;
}

uint64_t PreferencesExtendedLibrary()
{
  uint64_t v3 = PreferencesExtendedLibraryCore();
  if (!v3)
  {
    id v2 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v1 = (id)[NSString stringWithUTF8String:"void *PreferencesExtendedLibrary(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1DE01E2C8);
  }
  return v3;
}

uint64_t PreferencesExtendedLibraryCore()
{
  if (!PreferencesExtendedLibraryCore_frameworkLibrary) {
    __PreferencesExtendedLibraryCore_block_invoke();
  }
  return PreferencesExtendedLibraryCore_frameworkLibrary;
}

uint64_t __PreferencesExtendedLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PreferencesExtendedLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t iCloudMailUnifiedSettingsLibrary()
{
  uint64_t v3 = iCloudMailUnifiedSettingsLibraryCore();
  if (!v3)
  {
    id v2 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v1 = (id)[NSString stringWithUTF8String:"void *iCloudMailUnifiedSettingsLibrary(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1DE025254);
  }
  return v3;
}

id getiCloudMailUnifiedSettingsProviderObjcClass()
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getiCloudMailUnifiedSettingsProviderObjcClass_softClass;
  uint64_t v13 = getiCloudMailUnifiedSettingsProviderObjcClass_softClass;
  if (!getiCloudMailUnifiedSettingsProviderObjcClass_softClass)
  {
    uint64_t v2 = MEMORY[0x1E4F143A8];
    int v3 = -1073741824;
    int v4 = 0;
    id v5 = __getiCloudMailUnifiedSettingsProviderObjcClass_block_invoke;
    id v6 = &unk_1E6D1FD20;
    id v7 = &v9;
    __getiCloudMailUnifiedSettingsProviderObjcClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t iCloudCalendarUnifiedSettingsLibrary()
{
  uint64_t v3 = iCloudCalendarUnifiedSettingsLibraryCore();
  if (!v3)
  {
    id v2 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v1 = (id)[NSString stringWithUTF8String:"void *iCloudCalendarUnifiedSettingsLibrary(void)"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0x1DE0254C0);
  }
  return v3;
}

id getiCloudCalendarUnifiedSettingsProviderObjcClass()
{
  uint64_t v9 = 0;
  long long v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = getiCloudCalendarUnifiedSettingsProviderObjcClass_softClass;
  uint64_t v13 = getiCloudCalendarUnifiedSettingsProviderObjcClass_softClass;
  if (!getiCloudCalendarUnifiedSettingsProviderObjcClass_softClass)
  {
    uint64_t v2 = MEMORY[0x1E4F143A8];
    int v3 = -1073741824;
    int v4 = 0;
    id v5 = __getiCloudCalendarUnifiedSettingsProviderObjcClass_block_invoke;
    id v6 = &unk_1E6D1FD20;
    id v7 = &v9;
    __getiCloudCalendarUnifiedSettingsProviderObjcClass_block_invoke((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);
  return v1;
}

uint64_t iCloudMailUnifiedSettingsLibraryCore()
{
  if (!iCloudMailUnifiedSettingsLibraryCore_frameworkLibrary) {
    __iCloudMailUnifiedSettingsLibraryCore_block_invoke();
  }
  return iCloudMailUnifiedSettingsLibraryCore_frameworkLibrary;
}

uint64_t __iCloudMailUnifiedSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudMailUnifiedSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __getiCloudMailUnifiedSettingsProviderObjcClass_block_invoke(uint64_t a1)
{
  iCloudMailUnifiedSettingsLibrary();
  Class Class = objc_getClass("iCloudMailUnifiedSettingsProviderObjc");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v4 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v3 = (id)[NSString stringWithUTF8String:"Class getiCloudMailUnifiedSettingsProviderObjcClass(void)_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", "iCloudMailUnifiedSettingsProviderObjc");

    __break(1u);
    JUMPOUT(0x1DE0263E4);
  }
  getiCloudMailUnifiedSettingsProviderObjcClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t iCloudCalendarUnifiedSettingsLibraryCore()
{
  if (!iCloudCalendarUnifiedSettingsLibraryCore_frameworkLibrary) {
    __iCloudCalendarUnifiedSettingsLibraryCore_block_invoke();
  }
  return iCloudCalendarUnifiedSettingsLibraryCore_frameworkLibrary;
}

uint64_t __iCloudCalendarUnifiedSettingsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  iCloudCalendarUnifiedSettingsLibraryCore_frameworkLibrary = result;
  return result;
}

uint64_t __getiCloudCalendarUnifiedSettingsProviderObjcClass_block_invoke(uint64_t a1)
{
  iCloudCalendarUnifiedSettingsLibrary();
  Class Class = objc_getClass("iCloudCalendarUnifiedSettingsProviderObjc");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v4 = (id)[MEMORY[0x1E4F28B00] currentHandler];
    id v3 = (id)[NSString stringWithUTF8String:"Class getiCloudCalendarUnifiedSettingsProviderObjcClass(void)_block_invoke"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", "iCloudCalendarUnifiedSettingsProviderObjc");

    __break(1u);
    JUMPOUT(0x1DE026698);
  }
  getiCloudCalendarUnifiedSettingsProviderObjcClass_softClass Class = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

uint64_t ACDAccountSyncAccountIsSyncable()
{
  return MEMORY[0x1F4106790]();
}

uint64_t ACDAccountSyncDevices()
{
  return MEMORY[0x1F4106798]();
}

uint64_t ACDAccountSyncEnabled()
{
  return MEMORY[0x1F41067A0]();
}

uint64_t ACDAccountSyncMarkAccountDeleted()
{
  return MEMORY[0x1F41067A8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClip(CGContextRef c)
{
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x1F4109310]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1F412FA18]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1F40E7298](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

uint64_t PCSettingsGetClassPollInterval()
{
  return MEMORY[0x1F413F1B0]();
}

uint64_t PCSettingsGetClassPushEnabled()
{
  return MEMORY[0x1F413F1B8]();
}

uint64_t PSSiriImage()
{
  return MEMORY[0x1F4145EB8]();
}

uint64_t SBAddDownloadingIconForDisplayIdentifier()
{
  return MEMORY[0x1F415BFF8]();
}

uint64_t SBGetApplicationNetworkFlags()
{
  return MEMORY[0x1F415C048]();
}

uint64_t SBSCopyLocalizedApplicationNameForDisplayIdentifier()
{
  return MEMORY[0x1F415C320]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x1F415C450]();
}

uint64_t SBSetApplicationNetworkFlags()
{
  return MEMORY[0x1F415C478]();
}

uint64_t SecCertificateCopyProperties()
{
  return MEMORY[0x1F40F6B30]();
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x1F40F6B38]();
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1F40F6B68](certificate);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1F40F6DB8](identityRef, certificateRef);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1F4102BC0](category);
}

uint64_t _ACLogSystem()
{
  return MEMORY[0x1F40D31B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1F40E7328](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
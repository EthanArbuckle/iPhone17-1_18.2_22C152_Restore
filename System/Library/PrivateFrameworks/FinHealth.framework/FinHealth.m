void sub_23677584C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  uint64_t v23;

  _Block_object_dispose((const void *)(v23 - 96), 8);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236775D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  _Block_object_dispose(&a23, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2367774D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2367780C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_236779DBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Block_object_dispose(&STACK[0x250], 8);
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

void sub_23677B0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 152), 8);
  _Block_object_dispose((const void *)(v10 - 120), 8);
  _Unwind_Resume(a1);
}

FHPaymentRingSuggestionRequest *RequestFromPKAccountSummary(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, unsigned int a8)
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  id v14 = a1;
  id v99 = a2;
  id v98 = a3;
  id v97 = a4;
  id v96 = a5;
  id v15 = a6;
  uint64_t v16 = objc_alloc_init(FHPaymentRingSuggestionRequest);
  uint64_t v17 = objc_alloc_init(FHStatementDetails);
  uint64_t v18 = objc_alloc_init(FHStatementDetails);
  v19 = objc_opt_new();
  v20 = [v14 creditDetails];
  unsigned int v21 = [v20 isInMonthOfMerge];

  id v100 = v15;
  v101 = v18;
  if (objc_opt_class())
  {
    unsigned int v93 = a8;
    id v22 = v14;
    v23 = [v22 details];
    [v23 creditDetails];
    v24 = unsigned int v92 = v21;
    v25 = [v24 accountSummary];
    v26 = [v25 currentStatement];
    v27 = [v26 openingDate];
    [(FHStatementDetails *)v17 setOpeningDate:v27];

    v28 = [v22 details];
    v29 = [v28 creditDetails];
    v30 = [v29 accountSummary];
    v31 = [v30 currentStatement];
    v32 = [v31 closingDate];
    [(FHStatementDetails *)v17 setClosingDate:v32];

    v33 = [v22 details];
    v34 = [v33 creditDetails];
    v35 = [v34 accountSummary];
    v36 = [v35 balanceSummary];
    v37 = [v36 openingDate];
    [(FHStatementDetails *)v101 setOpeningDate:v37];

    v38 = [v22 details];
    v39 = [v38 creditDetails];
    v40 = [v39 accountSummary];
    v41 = [v40 balanceSummary];
    v42 = [v41 closingDate];
    [(FHStatementDetails *)v101 setClosingDate:v42];

    v43 = [v22 details];
    v44 = [v43 creditDetails];
    v45 = [v44 accountSummary];
    v46 = [v45 creditLimit];
    [(FHStatementDetails *)v17 setCreditLimit:v46];

    v47 = [v22 details];
    v48 = [v47 creditDetails];
    v49 = [v48 accountSummary];
    v50 = [v49 currentBalance];
    [(FHStatementDetails *)v17 setCurrentBalance:v50];

    v51 = [v22 details];
    v52 = [v51 creditDetails];
    v53 = [v52 accountSummary];
    v54 = [v53 adjustedBalance];
    [(FHStatementDetails *)v17 setCurrentBalanceForMonthZero:v54];

    v55 = [v22 details];
    v56 = [v55 creditDetails];
    v57 = [v56 accountSummary];
    v58 = [v57 currentStatement];
    v59 = [v58 minimumDue];
    [(FHStatementDetails *)v17 setMinimumDue:v59];

    v60 = [v22 details];
    v61 = [v60 creditDetails];
    v62 = [v61 accountSummary];
    v63 = [v62 remainingMinimumPayment];
    [(FHStatementDetails *)v17 setRemainingMinimumPayment:v63];

    v64 = [v22 details];
    v65 = [v64 creditDetails];
    v66 = [v65 accountSummary];
    v67 = [v66 currentStatement];
    v68 = [v67 statementBalance];
    [(FHStatementDetails *)v17 setStatementBalance:v68];

    v69 = [v22 details];
    v70 = [v69 creditDetails];
    v71 = [v70 accountSummary];
    v72 = [v71 remainingStatementBalance];
    [(FHStatementDetails *)v17 setRemainingStatementBalance:v72];

    v73 = [v22 details];
    v74 = [v73 creditDetails];
    v75 = [v74 accountSummary];
    v76 = [v75 remainingStatementBalanceForInterestCalculation];
    [(FHStatementDetails *)v17 setCombinedBalance:v76];

    v77 = [v22 details];

    v78 = [v77 creditDetails];
    v79 = [v78 accountSummary];
    v80 = [v79 currentStatement];
    v81 = [v80 identifier];
    [(FHStatementDetails *)v17 setCurrentStatementIdentifier:v81];

    id v15 = v100;
    uint64_t v18 = v101;
    [(FHStatementDetails *)v17 setIsMonthZero:a7];
    [(FHStatementDetails *)v17 setIsMonthOne:v93];
    [(FHStatementDetails *)v17 setIsMonthOfMerge:v92];
  }
  if (objc_opt_class())
  {
    v94 = v16;
    id v82 = v15;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    uint64_t v83 = [v82 countByEnumeratingWithState:&v102 objects:v106 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v84; ++i)
        {
          if (*(void *)v103 != v85) {
            objc_enumerationMutation(v82);
          }
          v87 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          v88 = objc_alloc_init(FHPaymentRingData);
          v89 = [v87 transactionDate];
          [(FHPaymentRingData *)v88 setTransactionDate:v89];

          v90 = [v87 transactionAmount];
          [(FHPaymentRingData *)v88 setTransactionAmount:v90];

          -[FHPaymentRingData setPaymentAmountCategory:](v88, "setPaymentAmountCategory:", [v87 suggestedAmountCategory]);
          [v19 addObject:v88];
        }
        uint64_t v84 = [v82 countByEnumeratingWithState:&v102 objects:v106 count:16];
      }
      while (v84);
    }

    uint64_t v16 = v94;
    id v15 = v100;
    uint64_t v18 = v101;
  }
  [(FHPaymentRingSuggestionRequest *)v16 setCurrentStatement:v17];
  [(FHPaymentRingSuggestionRequest *)v16 setPreviousStatement:v18];
  [(FHPaymentRingSuggestionRequest *)v16 setPreviousStatementPaymentsSum:v99];
  [(FHPaymentRingSuggestionRequest *)v16 setCurrentStatementPaymentsSum:v98];
  [(FHPaymentRingSuggestionRequest *)v16 setStatementPurchasesSum:v97];
  [(FHPaymentRingSuggestionRequest *)v16 setMerchantCategoryTransactionSums:v96];
  [(FHPaymentRingSuggestionRequest *)v16 setPaymentDetails:v19];

  return v16;
}

id ResponseToPKBillPaymentSuggestion(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = objc_alloc(MEMORY[0x263F5BDE0]);
        uint64_t v10 = objc_msgSend(v8, "amount", (void)v13);
        v11 = objc_msgSend(v9, "initWithAmount:category:", v10, objc_msgSend(v8, "category"));

        objc_msgSend(v11, "setMerchantCategory:", objc_msgSend(v8, "merchantCategory"));
        [v2 addObject:v11];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t FHPaymentRingSuggestionCategoryFromString()
{
  return MEMORY[0x270F28B88]();
}

uint64_t FHPaymentRingSuggestionCategoryToString()
{
  return MEMORY[0x270F28B90]();
}

uint64_t FinHealthLogObject()
{
  return MEMORY[0x270F28BA8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}
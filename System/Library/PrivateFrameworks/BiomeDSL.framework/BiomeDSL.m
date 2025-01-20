id BMDSLValueForKeyPath(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  unint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  unsigned char v32[128];
  uint64_t v33;
  uint64_t vars8;

  v33 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  v4 = a2;
  v5 = +[BMDSLGraphValidator currentProcessValidator];
  if ([v5 passthrough])
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      BMDSLValueForKeyPath_cold_1();
    }

    v7 = [v3 valueForKeyPath:v4];
    goto LABEL_34;
  }
  v8 = [v5 validKeyPaths];
  v9 = v8;
  if (v8) {
    v10 = v8;
  }
  else {
    v10 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  v11 = v10;

  [v4 componentsSeparatedByString:@"."];
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)[v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    v14 = 0;
    v15 = *(void *)v29;
    while (2)
    {
      v16 = 0;
      v17 = (unint64_t)v13 + v14;
      do
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        if (![v11 containsObject:*(void *)(*((void *)&v28 + 1) + 8 * (void)v16)])
        {
          v17 = (unint64_t)v16 + v14;
          goto LABEL_18;
        }
        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = (void *)[v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
      v14 = v17;
      if (v13) {
        continue;
      }
      break;
    }
LABEL_18:

    if (!v17)
    {
      v13 = 0;
      v20 = v3;
      goto LABEL_23;
    }
    v18 = objc_msgSend(v12, "subarrayWithRange:", 0, v17);
    v19 = [v18 componentsJoinedByString:@"."];
    v20 = [v3 valueForKeyPath:v19];

    v13 = v20;
  }
  else
  {
    v17 = 0;
    v18 = v12;
    v20 = v3;
  }

LABEL_23:
  if (v17 >= [v12 count])
  {
    v7 = v13;
  }
  else
  {
    v27 = [v12 objectAtIndexedSubscript:v17];
    v21 = v20;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [v21 objectForKeyedSubscript:v27];
      v23 = v17 + 1;
      if (v23 >= [v12 count])
      {
        v22 = v22;
        v7 = v22;
      }
      else
      {
        v26 = objc_msgSend(v12, "subarrayWithRange:", v23, objc_msgSend(v12, "count") - v23);
        v24 = [v26 componentsJoinedByString:@"."];
        v7 = BMDSLValueForKeyPath(v22, v24);
      }
    }
    else
    {
      v22 = __biome_log_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        BMDSLValueForKeyPath_cold_2();
      }
      v7 = 0;
    }
  }
LABEL_34:

  return v7;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id BMDSLFilterCast(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      BMDSLFilterCast_cold_1((uint64_t)v3, a2, v5);
    }

    id v4 = 0;
  }

  return v4;
}

uint64_t BMDSLFilterCheckResponds(void *a1, const char *a2)
{
  id v3 = a1;
  char v4 = objc_opt_respondsToSelector();
  if ((v4 & 1) == 0)
  {
    v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      BMDSLFilterCheckResponds_cold_1((uint64_t)v3, a2, v5);
    }
  }
  return v4 & 1;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1B308B498(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

id BMDSLRegisterJSONTransformerNameFromEncodingDescriptor(void *a1)
{
  id v1 = a1;
  if (!JSONTransformerNamesByEncodingDescriptor)
  {
    uint64_t v2 = objc_opt_new();
    id v3 = (void *)JSONTransformerNamesByEncodingDescriptor;
    JSONTransformerNamesByEncodingDescriptor = v2;
  }
  uint64_t v4 = [@"JSONValueTransformer:" stringByAppendingString:v1];
  [(id)JSONTransformerNamesByEncodingDescriptor setObject:v4 forKeyedSubscript:v1];

  return v4;
}

uint64_t BMDSLJSONTransformerNameFromEncodingDescriptor(uint64_t a1)
{
  return [(id)JSONTransformerNamesByEncodingDescriptor objectForKeyedSubscript:a1];
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id BMDSLValidateDictionary(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  v10 = [v8 objectForKeyedSubscript:@"name"];
  v11 = v10;
  if (v10 && ([v10 isEqual:v7] & 1) != 0)
  {
    v12 = [v8 objectForKeyedSubscript:@"version"];
    if (v12
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ([MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a2],
          v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v12 isEqualToNumber:v13],
          v13,
          (v14 & 1) != 0))
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = v9;
      uint64_t v15 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v27 = *(void *)v30;
        while (2)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v30 != v27) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v19 = [v8 objectForKeyedSubscript:v18];
            uint64_t v20 = [obj objectForKeyedSubscript:v18];
            if (!v19 || (objc_opt_isKindOfClass() & 1) == 0)
            {
              v26 = [NSString stringWithFormat:@"missing or bad value for %@: %@. expected %@", v18, v19, v20];
              v21 = BMDSLDecodeError((uint64_t)v26);

              goto LABEL_18;
            }
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v16) {
            continue;
          }
          break;
        }
      }

      v21 = 0;
    }
    else
    {
      v22 = NSString;
      v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:a2];
      v24 = [v22 stringWithFormat:@"incompatible version (%@) for %@, expected: %@", v12, v7, v23];
      v21 = BMDSLDecodeError((uint64_t)v24);
    }
  }
  else
  {
    v12 = [NSString stringWithFormat:@"expected 'name' to be %@", v7];
    v21 = BMDSLDecodeError((uint64_t)v12);
  }
LABEL_18:

  return v21;
}

id BMDSLDecodeError(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v1 = [NSString stringWithFormat:@"Error decoding BMDSL operation, %@", a1];
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = v1;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:4864 userInfo:v4];

  return v5;
}

void sub_1B3094EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBMDSLPersistentDerivativesClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLPersistentDerivatives");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLPersistentDerivativesClass_block_invoke_cold_1();
  }
  getBMDSLPersistentDerivativesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void BiomeStreamsLibrary()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0[0] = 0;
  if (!BiomeStreamsLibraryCore_frameworkLibrary)
  {
    v0[1] = (void *)MEMORY[0x1E4F143A8];
    v0[2] = (void *)3221225472;
    v0[3] = __BiomeStreamsLibraryCore_block_invoke;
    v0[4] = &__block_descriptor_40_e5_v8__0l;
    v0[5] = v0;
    long long v1 = xmmword_1E60217F0;
    uint64_t v2 = 0;
    BiomeStreamsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeStreamsLibraryCore_frameworkLibrary) {
    BiomeStreamsLibrary_cold_1(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t __BiomeStreamsLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeStreamsLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getBMDSLStreamPublisherClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLStreamPublisher");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLStreamPublisherClass_block_invoke_cold_1();
  }
  getBMDSLStreamPublisherClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableMapClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLTableMap");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLTableMapClass_block_invoke_cold_1();
  }
  getBMDSLTableMapClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableStreamClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLTableStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLTableStreamClass_block_invoke_cold_1();
  }
  getBMDSLTableStreamClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableAggregatorClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLTableAggregator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLTableAggregatorClass_block_invoke_cold_1();
  }
  getBMDSLTableAggregatorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLKeyPathRowTransformClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLKeyPathRowTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLKeyPathRowTransformClass_block_invoke_cold_1();
  }
  getBMDSLKeyPathRowTransformClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableUpsertSubscriberClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLTableUpsertSubscriber");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLTableUpsertSubscriberClass_block_invoke_cold_1();
  }
  getBMDSLTableUpsertSubscriberClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableSQLQueryTransformClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLTableSQLQueryTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLTableSQLQueryTransformClass_block_invoke_cold_1();
  }
  getBMDSLTableSQLQueryTransformClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMDSLTableTransformClass_block_invoke(uint64_t a1)
{
  BiomeStreamsLibrary();
  Class result = objc_getClass("BMDSLTableTransform");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMDSLTableTransformClass_block_invoke_cold_1();
  }
  getBMDSLTableTransformClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getBMTableSchemaClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!BiomeFlexibleStorageLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __BiomeFlexibleStorageLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6021828;
    uint64_t v5 = 0;
    BiomeFlexibleStorageLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BiomeFlexibleStorageLibraryCore_frameworkLibrary) {
    __getBMTableSchemaClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BMTableSchema");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getBMTableSchemaClass_block_invoke_cold_2();
  }
  getBMTableSchemaClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __BiomeFlexibleStorageLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  BiomeFlexibleStorageLibraryCore_frameworkLibrary = result;
  return result;
}

void BMDSLValueForKeyPath_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_1B3086000, v0, v1, "BMDSLValueForKeyPath allowing keyPath by passthrough for %@", v2, v3, v4, v5, v6);
}

void BMDSLValueForKeyPath_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B3086000, v0, OS_LOG_TYPE_ERROR, "Encountered non-allowed key %@ in BMDSLValueForKeyPath(...)", v1, 0xCu);
}

void BMDSLValueForKeyPath_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_1B3086000, v0, v1, "Unknown key when evaluating BMDSLValueForKeyPath(...) with keypath %@ on %@");
}

void BMDSLFilterCast_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B3086000, log, OS_LOG_TYPE_ERROR, "Unrecognized type %@ (expected %@) when evaluating BMDSLFilter isIncluded", (uint8_t *)&v3, 0x16u);
}

void BMDSLFilterCheckResponds_cold_1(uint64_t a1, SEL aSelector, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  __int16 v5 = NSStringFromSelector(aSelector);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1B3086000, a3, OS_LOG_TYPE_ERROR, "Unrecognized type %@ (doesn't respond to %@) when evaluating BMDSLFilter isIncluded", (uint8_t *)&v6, 0x16u);
}

void __getBMDSLPersistentDerivativesClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLPersistentDerivativesClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 18, @"Unable to find class %s", "BMDSLPersistentDerivatives");

  __break(1u);
}

void BiomeStreamsLibrary_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *BiomeStreamsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMDSLJSONAllowedClasses.m", 14, @"%s", *a1);

  __break(1u);
}

void __getBMDSLStreamPublisherClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLStreamPublisherClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 19, @"Unable to find class %s", "BMDSLStreamPublisher");

  __break(1u);
}

void __getBMDSLTableMapClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLTableMapClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 21, @"Unable to find class %s", "BMDSLTableMap");

  __break(1u);
}

void __getBMDSLTableStreamClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLTableStreamClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 23, @"Unable to find class %s", "BMDSLTableStream");

  __break(1u);
}

void __getBMDSLTableAggregatorClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLTableAggregatorClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 20, @"Unable to find class %s", "BMDSLTableAggregator");

  __break(1u);
}

void __getBMDSLKeyPathRowTransformClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLKeyPathRowTransformClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 17, @"Unable to find class %s", "BMDSLKeyPathRowTransform");

  __break(1u);
}

void __getBMDSLTableUpsertSubscriberClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLTableUpsertSubscriberClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 25, @"Unable to find class %s", "BMDSLTableUpsertSubscriber");

  __break(1u);
}

void __getBMDSLTableSQLQueryTransformClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLTableSQLQueryTransformClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 22, @"Unable to find class %s", "BMDSLTableSQLQueryTransform");

  __break(1u);
}

void __getBMDSLTableTransformClass_block_invoke_cold_1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMDSLTableTransformClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 24, @"Unable to find class %s", "BMDSLTableTransform");

  __break(1u);
}

void __getBMTableSchemaClass_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *BiomeFlexibleStorageLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"BMDSLJSONAllowedClasses.m", 15, @"%s", *a1);

  __break(1u);
}

void __getBMTableSchemaClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getBMTableSchemaClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMDSLJSONAllowedClasses.m", 26, @"Unable to find class %s", "BMTableSchema");

  __break(1u);
  CFNumberCreate(v2, v3, v4);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __biome_log_for_category()
{
  return MEMORY[0x1F410C868]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1F4181518](cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
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

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1F4181788](name);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1F40CD610]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1F40CD628]();
}
uint64_t DBHIsClassOverridingSelector(void *a1, uint64_t a2)
{
  id v4;
  id v5;
  BOOL v6;
  id v8;
  BOOL v9;

  v4 = [a1 superclass];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  if (v4)
  {
    v5 = [a1 methodForSelector:a2];
    v6 = v5 != [v4 methodForSelector:a2];
  }
  else
  {
    v6 = 1;
  }
  if (objc_opt_class() == a1)
  {
    v9 = 1;
  }
  else
  {
    v8 = [a1 methodForSelector:a2];
    v9 = v8 != [(id)objc_opt_class() methodForSelector:a2];
  }
  return v6 & v9;
}

BOOL DBHIsInstanceOverridingNSObjectSelector(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 methodForSelector:a2];
    BOOL v5 = v4 != [(id)objc_opt_class() methodForSelector:a2];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

BOOL DBHIsClassOverridingNSObjectSelector(void *a1, uint64_t a2)
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v4 = [a1 methodForSelector:a2];
  return v4 != [(id)objc_opt_class() methodForSelector:a2];
}

void sub_33C0(_Unwind_Exception *a1)
{
}

NSString *DBGBoolString(unsigned int a1)
{
  return +[NSString stringWithFormat:@"%d", a1];
}

NSString *DBGFloatString(float a1)
{
  return +[NSString stringWithFormat:@"%a", a1];
}

NSString *DBGDoubleString(double a1)
{
  return +[NSString stringWithFormat:@"%la", *(void *)&a1];
}

NSString *DBGIntString(uint64_t a1)
{
  return +[NSString stringWithFormat:@"%d", a1];
}

NSString *DBGUnsignedIntString(uint64_t a1)
{
  return +[NSString stringWithFormat:@"%u", a1];
}

NSString *DBGLongString(uint64_t a1)
{
  return +[NSString stringWithFormat:@"%ld", a1];
}

NSString *DBGUnsignedLongString(uint64_t a1)
{
  return +[NSString stringWithFormat:@"%lx", a1];
}

NSString *DBGLongLongString(uint64_t a1)
{
  return +[NSString stringWithFormat:@"%lld", a1];
}

NSString *DBGUnsignedLongLongString(uint64_t a1)
{
  return +[NSString stringWithFormat:@"%llx", a1];
}

NSString *DBGIntegerString(uint64_t a1)
{
  return +[NSString stringWithFormat:@"%ld", a1];
}

NSString *DBGUnsignedIntegerString(uint64_t a1)
{
  return +[NSString stringWithFormat:@"%lx", a1];
}

NSString *DBGCGFloatString(double a1)
{
  return +[NSString stringWithFormat:@"%la", *(void *)&a1];
}

id DebugHierarchyClassesConformingToProtocol(void *a1)
{
  v1 = a1;
  v2 = +[NSMutableArray array];
  uint32_t v3 = _dyld_image_count();
  if (v3)
  {
    uint32_t v4 = v3;
    for (uint32_t i = 0; i != v4; ++i)
    {
      image_header = _dyld_get_image_header(i);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __DebugHierarchyClassesConformingToProtocol_block_invoke;
      block[3] = &unk_241D8;
      id v9 = v2;
      objc_enumerateClasses(image_header, 0, v1, 0, block);
    }
  }

  return v2;
}

id __DebugHierarchyClassesConformingToProtocol_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id DebugHierarchyEntryPointClasses()
{
  v0 = DebugHierarchyClassesConformingToProtocol(&OBJC_PROTOCOL___DebugHierarchyEntryPoint);
  v1 = DebugHierarchyClassesConformingToProtocol(&OBJC_PROTOCOL___DebugHierarchyEntryPoint_Fallback);
  v2 = +[NSSet setWithArray:v0];
  uint32_t v3 = [v2 setByAddingObjectsFromArray:v1];
  uint32_t v4 = [v3 allObjects];

  return v4;
}

id DebugHierarchyMetaDataProviderClasses()
{
  v0 = DebugHierarchyClassesConformingToProtocol(&OBJC_PROTOCOL___DebugHierarchyMetaDataProvider);
  v1 = DebugHierarchyClassesConformingToProtocol(&OBJC_PROTOCOL___DebugHierarchyMetaDataProvider_Fallback);
  v2 = +[NSSet setWithArray:v0];
  uint32_t v3 = [v2 setByAddingObjectsFromArray:v1];
  uint32_t v4 = [v3 allObjects];

  return v4;
}

id DBGGroupDict(void *a1, void *a2)
{
  v7[0] = @"groupingID";
  v7[1] = @"debugHierarchyObjects";
  v8[0] = a1;
  v8[1] = a2;
  id v3 = a2;
  id v4 = a1;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

void sub_943C(_Unwind_Exception *a1)
{
}

int64_t DebugHierarchyVisibilityForObject(void *a1, int64_t a2)
{
  id v3 = a1;
  if (+[DebugHierarchyObjectProtocolHelper objectImplements_debugHierarchyVisibility:v3])
  {
    int64_t v4 = +[DebugHierarchyObjectProtocolHelper debugHierarchyVisibilityOfObject:v3];
  }
  else
  {
    int64_t v4 = 1;
  }
  if (v4 > a2) {
    a2 = v4;
  }

  return a2;
}

void sub_A5B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    v11 = [v9 requestContext];
    v12 = [v11 request];
    +[NSError debugHierarchyErrorFromException:caughtDuringRequest:forMethodSignature:](NSError, "debugHierarchyErrorFromException:caughtDuringRequest:forMethodSignature:", v10, v12, "-[DebugHierarchyRequestExecutor runWithError:]");
    *a9 = (id)objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0xA52CLL);
  }
  _Unwind_Resume(exception_object);
}

id DebugHierarchyRequestsOSLog()
{
  if (DebugHierarchyRequestsOSLog___dvt_lazy_init_predicate != -1) {
    dispatch_once(&DebugHierarchyRequestsOSLog___dvt_lazy_init_predicate, &__block_literal_global_138);
  }
  v0 = (void *)DebugHierarchyRequestsOSLog___dvt_lazy_init_variable;
  return v0;
}

id DebugHierarchyResponseDataForException(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  v7 = [v6 callStackSymbols];
  v8 = +[NSString stringWithFormat:@"%@\n%@", v6, v7];

  id v9 = DebugHierarchyResponseDataForGenericError(@"Exception gathering debug hierarchy information.", v8, v5, a3);

  return v9;
}

id DebugHierarchyResponseDataForGenericError(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = v9;
  if (!v9)
  {
    id v10 = +[DebugHierarchyRequest requestWithDiscoveryType:0 actions:&__NSArray0__struct completion:&__block_literal_global];
  }
  if (a4)
  {
    a4 = +[NSString stringWithCString:a4 encoding:4];
  }
  v11 = +[DebugHierarchyLogEntry errorLogEntryWithTitle:v7 message:v8 methodSignature:a4];
  [v10 addLogEntry:v11];
  v21 = @"request";
  v12 = [v10 dictionaryRepresentation];
  v22 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  id v20 = 0;
  v14 = [v13 generateJSONDataWithError:&v20];
  id v15 = v20;
  v16 = v15;
  if (v15)
  {
    v17 = [v15 localizedDescription];
    NSLog(&cfstr_Debughierarchy_12.isa, v17);
  }
  v18 = [v9 formattedResponseDataForRawRequestResultData:v14];

  return v18;
}

BOOL DebugHierarchyBitMaskComparison(uint64_t a1, uint64_t a2, uint64_t a3)
{
  switch(a3)
  {
    case 0:
      return 1;
    case 1:
      BOOL v4 = (a2 & ~a1) == 0;
      goto LABEL_8;
    case 2:
      return (a2 & a1) != 0;
    case 3:
      BOOL v4 = (a2 & a1) == 0;
      goto LABEL_8;
    case 4:
      BOOL v4 = a2 == a1;
LABEL_8:
      BOOL result = v4;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

id DebugHierarchyJSONProcessingOSLog()
{
  if (DebugHierarchyJSONProcessingOSLog___dvt_lazy_init_predicate != -1) {
    dispatch_once(&DebugHierarchyJSONProcessingOSLog___dvt_lazy_init_predicate, &__block_literal_global_20);
  }
  v0 = (void *)DebugHierarchyJSONProcessingOSLog___dvt_lazy_init_variable;
  return v0;
}

objc_class *DebugHierarchyRequestActionClassForDictionary(void *a1)
{
  v1 = [a1 objectForKeyedSubscript:@"actionClass"];
  Class v2 = NSClassFromString(v1);
  if ([(objc_class *)v2 conformsToProtocol:&OBJC_PROTOCOL___DebugHierarchyRequestAction])id v3 = v2; {
  else
  }
    id v3 = 0;

  return v3;
}

id DebugHierarchyRequestActionForDictionary(void *a1)
{
  id v1 = a1;
  Class v2 = DebugHierarchyRequestActionClassForDictionary(v1);
  if (v2)
  {
    id v3 = [(objc_class *)v2 actionWithDictionary:v1];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_E044()
{
}

void sub_F09C(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    +[NSError debugHierarchyErrorFromException:caughtDuringRequest:forMethodSignature:](NSError, "debugHierarchyErrorFromException:caughtDuringRequest:forMethodSignature:", v3, 0, "+[DebugHierarchyRequest(TargetHubAdditions) requestWithBase64Data:error:]");
    void *v2 = (id)objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0xF068);
  }
  _Unwind_Resume(exception_object);
}

id DebugHierarchyGzipOSLog()
{
  if (DebugHierarchyGzipOSLog___dvt_lazy_init_predicate != -1) {
    dispatch_once(&DebugHierarchyGzipOSLog___dvt_lazy_init_predicate, &__block_literal_global_63);
  }
  v0 = (void *)DebugHierarchyGzipOSLog___dvt_lazy_init_variable;
  return v0;
}

void sub_11F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void _DBGViewHierarchyInitialize()
{
  id v0 = +[DebugHierarchyTargetHub sharedHub];
  [v0 registerForDarwinNotifications];
}

id DebugHierarchyRequestsOSLog_0()
{
  if (DebugHierarchyRequestsOSLog___dvt_lazy_init_predicate_0 != -1) {
    dispatch_once(&DebugHierarchyRequestsOSLog___dvt_lazy_init_predicate_0, &__block_literal_global_149);
  }
  id v0 = (void *)DebugHierarchyRequestsOSLog___dvt_lazy_init_variable_0;
  return v0;
}

id _DBGStructureOfDictionaryDescriptionWithFormat(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"font"])
  {
    id v7 = @"familyName";
    id v8 = @"fontName";
    v16 = @"public.plain-text";
    v17 = @"public.plain-text";
    id v9 = @"pointSize";
    id v10 = @"ascender";
    v18 = @"CGf";
    v19 = @"CGf";
    v11 = @"descender";
    v12 = @"capHeight";
    id v20 = @"CGf";
    v21 = @"CGf";
    v13 = @"xHeight";
    v14 = @"lineHeight";
    v22 = @"CGf";
    v23 = @"CGf";
    id v15 = @"leading";
    v24 = @"CGf";
    uint64_t v2 = 9;
LABEL_3:
    id v3 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v7 count:v2];
    goto LABEL_7;
  }
  if (([v1 isEqualToString:@"color"] & 1) != 0
    || [v1 isEqualToString:@"patternImageColor"])
  {
    id v7 = @"componentValues";
    BOOL v4 = [@"key:" stringByAppendingString:@"componentValuesFormat"];
    v16 = v4;
    v17 = @"public.plain-text";
    id v8 = @"colorSpaceName";
    id v9 = @"patternImageData";
    id v5 = [@"key:" stringByAppendingString:@"patternImageFormat"];
    v18 = v5;
    v19 = @"public.plain-text";
    id v10 = @"colorName";
    v11 = @"catalogName";
    v12 = @"catalogBundleID";
    id v20 = @"public.plain-text";
    v21 = @"public.plain-text";
    id v3 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v7 count:6];

    goto LABEL_7;
  }
  if ([v1 isEqualToString:@"image"])
  {
    id v7 = @"imageData";
    id v8 = @"metadata";
    v16 = @"public.data";
    v17 = @"custom";
LABEL_14:
    uint64_t v2 = 2;
    goto LABEL_3;
  }
  if ([v1 isEqualToString:@"objectInfo"])
  {
    id v7 = @"className";
    id v8 = @"memoryAddress";
    v16 = @"public.plain-text";
    v17 = @"public.plain-text";
    goto LABEL_14;
  }
  id v3 = 0;
LABEL_7:

  return v3;
}

void DBGClearCachedFormatSpecifiers()
{
  DBGCachedFormatSpecifiers();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 removeAllObjects];
}

id DBGCachedFormatSpecifiers()
{
  if (DBGCachedFormatSpecifiers_onceToken != -1) {
    dispatch_once(&DBGCachedFormatSpecifiers_onceToken, &__block_literal_global_3);
  }
  id v0 = (void *)DBGCachedFormatSpecifiers_dict;
  return v0;
}

id DBGSpecifiersFromFormatString(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v4 = 0;
    goto LABEL_8;
  }
  uint64_t v2 = DBGCachedFormatSpecifiers();
  id v3 = [v2 objectForKeyedSubscript:v1];

  if (!v3)
  {
    id v5 = +[NSScanner scannerWithString:v1];
    [v5 setCharactersToBeSkipped:0];
    id v6 = +[NSMutableArray arrayWithCapacity:8];
    id v7 = +[NSCharacterSet characterSetWithCharactersInString:@","];
    v23 = +[NSCharacterSet characterSetWithCharactersInString:@"\","];
    v22 = +[NSCharacterSet characterSetWithCharactersInString:@"\""];
    if ([v5 isAtEnd])
    {
LABEL_6:
      id v4 = [v6 copy];
      id v8 = DBGCachedFormatSpecifiers();
      [v8 setObject:v4 forKeyedSubscript:v1];

      id v3 = 0;
      goto LABEL_7;
    }
    while (1)
    {
      id v10 = +[NSCharacterSet whitespaceCharacterSet];
      id v26 = 0;
      [v5 scanUpToCharactersFromSet:v10 intoString:&v26];
      id v11 = v26;

      v12 = +[NSCharacterSet whitespaceCharacterSet];
      v13 = [v11 stringByTrimmingCharactersInSet:v12];

      if ((unint64_t)[v13 length] < 2)
      {
        if ([v5 isAtEnd]) {
          goto LABEL_15;
        }
      }
      else
      {
        v14 = objc_msgSend(v13, "substringFromIndex:", (char *)objc_msgSend(v13, "length") - 1);
        if ([v14 isEqualToString:@","])
        {

LABEL_15:
          [v13 stringByTrimmingCharactersInSet:v7];
          v13 = id v15 = v13;
          goto LABEL_16;
        }
        unsigned __int8 v19 = [v5 isAtEnd];

        if (v19) {
          goto LABEL_15;
        }
      }
      id v25 = 0;
      [v5 scanUpToCharactersFromSet:v23 intoString:&v25];
      id v15 = v25;
      id v20 = 0;
      if (([v5 isAtEnd] & 1) == 0)
      {
        id v20 = objc_msgSend(v1, "substringWithRange:", objc_msgSend(v5, "scanLocation"), 1);
      }
      if ([v20 isEqualToString:@"\""])
      {
        objc_msgSend(v5, "setScanLocation:", (char *)objc_msgSend(v5, "scanLocation") + 1);
        id v24 = 0;
        [v5 scanUpToCharactersFromSet:v22 intoString:&v24];
        id v16 = v24;
        goto LABEL_29;
      }
      if ([v15 length])
      {
        v21 = +[NSCharacterSet whitespaceCharacterSet];
        id v16 = [v15 stringByTrimmingCharactersInSet:v21];

LABEL_29:
        if (v16) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }

LABEL_16:
LABEL_17:
      id v16 = +[NSNull null];
LABEL_18:
      v17 = +[DebugHierarchyFormatSpecifier specifierWithFormat:v13 label:v16];
      [v6 addObject:v17];

      if (([v5 isAtEnd] & 1) == 0)
      {
        v18 = +[NSCharacterSet alphanumericCharacterSet];
        [v5 scanUpToCharactersFromSet:v18 intoString:0];
      }
      if ([v5 isAtEnd]) {
        goto LABEL_6;
      }
    }
  }
  id v4 = v3;
LABEL_7:

LABEL_8:
  return v4;
}

id DBGEncodeDictionaryAsJSONCompatibleDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __DBGEncodeDictionaryAsJSONCompatibleDictionary_block_invoke;
  v10[3] = &unk_244C0;
  id v11 = v4;
  id v12 = v3;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v13;
  id v6 = v3;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = [v5 copy];

  return v8;
}

void __DBGEncodeDictionaryAsJSONCompatibleDictionary_block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] objectForKeyedSubscript:v3];
  if ([v4 hasPrefix:@"key:"])
  {
    id v5 = a1[5];
    id v6 = [v4 substringFromIndex:4];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    id v4 = (void *)v7;
  }
  id v8 = [a1[5] objectForKeyedSubscript:v3];
  id v11 = 0;
  id v9 = DBGEncodeValueAsJSONCompatibleValue(v8, v4, &v11);
  id v10 = v11;
  [a1[6] setObject:v9 forKeyedSubscript:v3];

  if (v10)
  {
    [a1[6] removeObjectForKey:v3];
    NSLog(&cfstr_ErrorFailedToE.isa, v3, v4);
  }
}

id DBGEncodeValueAsJSONCompatibleValue(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v6 isEqualToString:@"custom"]) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v5;
    id v10 = DBGSpecifiersFromFormatString(v6);
    id v11 = [v9 count];
    if (v11 == [v10 count])
    {
      v33 = a3;
      id v34 = v6;
      id v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
      if ([v9 count])
      {
        uint64_t v13 = 0;
        while (1)
        {
          v14 = [v9 objectAtIndexedSubscript:v13];
          id v15 = [v10 objectAtIndexedSubscript:v13];
          id v16 = [v15 format];
          id v36 = 0;
          v17 = DBGEncodeValueAsJSONCompatibleValue(v14, v16, &v36);
          id v18 = v36;
          [v12 addObject:v17];

          if (v18) {
            break;
          }

          if ((unint64_t)[v9 count] <= ++v13) {
            goto LABEL_30;
          }
        }
        if (v33) {
          void *v33 = v18;
        }
      }
LABEL_30:
      id v8 = [v12 copy];
      id v6 = v34;
    }
    else
    {
      if (!a3)
      {
        id v8 = 0;
LABEL_32:

LABEL_33:
        goto LABEL_34;
      }
      id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Mismatch between number of values (%lu) and number of format specifiers (%lu).\nValue: %@\nFormat: %@", [v9 count], objc_msgSend(v10, "count"), v9, v6);
      NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
      v42 = v12;
      unsigned __int8 v19 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v20 = +[NSError errorWithDomain:@"DebugHierarchyJSONEncodingErrorDomain" code:2 userInfo:v19];

      id v21 = v20;
      *a3 = v21;

      id v8 = 0;
    }

    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    _DBGStructureOfDictionaryDescriptionWithFormat(v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      DBGEncodeDictionaryAsJSONCompatibleDictionary(v5, v9);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = +[NSString stringWithFormat:@"Unsupported dictionary structure described with format: %@ for value: %@", v6, v5];
      NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
      v40 = v23;
      id v24 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      id v25 = +[NSError errorWithDomain:@"DebugHierarchyJSONEncodingErrorDomain" code:1 userInfo:v24];

      if (a3 && v25) {
        *a3 = v25;
      }

      id v8 = 0;
    }
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = 0;
    id v8 = [v5 dbgStringForType:v6 error:&v35];
    id v22 = v35;
    id v9 = v22;
    if (a3 && v22) {
      *a3 = v22;
    }
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 string];
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_2:
    id v7 = v5;
LABEL_3:
    id v8 = v7;
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v5 base64EncodedStringWithOptions:0];
    goto LABEL_3;
  }
  if (a3)
  {
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = +[NSString stringWithFormat:@"Unsupported type: %@ of value: %@", v28, v5];

    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    v38 = v29;
    v30 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v31 = +[NSError errorWithDomain:@"DebugHierarchyJSONEncodingErrorDomain" code:1 userInfo:v30];

    id v32 = v31;
    *a3 = v32;
  }
  id v8 = 0;
LABEL_34:

  return v8;
}

id DBGDecodeDictionaryFromJSONCompatibleDictionary(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __DBGDecodeDictionaryFromJSONCompatibleDictionary_block_invoke;
  v10[3] = &unk_244C0;
  id v11 = v4;
  id v12 = v3;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = v13;
  id v6 = v3;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = [v5 copy];

  return v8;
}

void __DBGDecodeDictionaryFromJSONCompatibleDictionary_block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] objectForKeyedSubscript:v3];
  if ([v4 hasPrefix:@"key:"])
  {
    id v5 = a1[5];
    id v6 = [v4 substringFromIndex:4];
    uint64_t v7 = [v5 objectForKeyedSubscript:v6];

    id v4 = (void *)v7;
  }
  id v8 = [a1[5] objectForKeyedSubscript:v3];
  id v11 = 0;
  id v9 = DBGDecodeValueFromJSONCompatibleValue(v8, v4, &v11);
  id v10 = v11;
  [a1[6] setObject:v9 forKeyedSubscript:v3];

  if (v10)
  {
    [a1[6] removeObjectForKey:v3];
    NSLog(&cfstr_ErrorFailedToD.isa, v3, v4);
  }
}

id DBGDecodeValueFromJSONCompatibleValue(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if ([v6 isEqualToString:@"custom"])
  {
    id v7 = v5;
    goto LABEL_43;
  }
  id v8 = DBGSpecifiersFromFormatString(v6);
  if ((unint64_t)[v8 count] < 2)
  {
    if ([v8 count] != (char *)&dword_0 + 1) {
      goto LABEL_17;
    }
    id v18 = [v8 firstObject];
    id v9 = [v18 format];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v5;
      if ([v9 isEqualToString:@"b"])
      {
        +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v12 dbgBoolValue]);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_35:
        id v7 = v19;
        goto LABEL_40;
      }
      if ([v9 isEqualToString:@"CGf"])
      {
        [v12 dbgCGFloatValue];
LABEL_25:
        +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if ([v9 isEqualToString:@"f"])
      {
        [v12 dbgFloatValue];
        +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if ([v9 isEqualToString:@"d"])
      {
        [v12 dbgDoubleValue];
        goto LABEL_25;
      }
      if ([v9 isEqualToString:@"integer"])
      {
        +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 dbgIntegerValue]);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if ([v9 isEqualToString:@"uinteger"])
      {
        +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 dbgUnsignedIntegerValue]);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if ([v9 isEqualToString:@"public.plain-text"])
      {
        id v19 = v12;
        id v12 = v19;
        goto LABEL_35;
      }
      if ([v9 isEqualToString:@"attrStr"])
      {
        id v19 = [objc_alloc((Class)NSAttributedString) initWithString:v12];
        goto LABEL_35;
      }
      if ([v9 isEqualToString:@"public.data"])
      {
        id v19 = [v12 dbgDataValue];
        goto LABEL_35;
      }
      if ([v9 isEqualToString:@"i"])
      {
        +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 dbgIntValue]);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if ([v9 isEqualToString:@"ui"])
      {
        uint64_t v36 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v12 dbgUnsignedIntValue]);
LABEL_70:
        id v7 = (id)v36;
        goto LABEL_40;
      }
      if ([v9 isEqualToString:@"l"])
      {
        uint64_t v36 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v12 dbgLongValue]);
        goto LABEL_70;
      }
      if ([v9 isEqualToString:@"ul"])
      {
        uint64_t v36 = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", [v12 dbgUnsignedLongValue]);
        goto LABEL_70;
      }
      if ([v9 isEqualToString:@"ll"])
      {
        uint64_t v36 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v12 dbgLongLongValue]);
        goto LABEL_70;
      }
      if ([v9 isEqualToString:@"ull"])
      {
        uint64_t v36 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v12 dbgUnsignedLongLongValue]);
        goto LABEL_70;
      }
      if (!a3)
      {
        id v7 = 0;
        goto LABEL_40;
      }
      v29 = +[NSString stringWithFormat:@"Unsupported typeSpecifier: %@ of string value: %@", v9, v12];
      NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
      v45 = v29;
      v30 = &v45;
      v31 = &v44;
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      _DBGStructureOfDictionaryDescriptionWithFormat(v6);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        DBGDecodeDictionaryFromJSONCompatibleDictionary(v5, v12);
        id v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      if (a3)
      {
        v29 = +[NSString stringWithFormat:@"Unsupported dictionary structure described with format: %@ for value: %@", v6, v5];
        NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
        v43 = v29;
        v30 = &v43;
        v31 = &v42;
LABEL_38:
        id v32 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v31 count:1];
        v33 = +[NSError errorWithDomain:@"DebugHierarchyJSONDecodingErrorDomain" code:1 userInfo:v32];

        id v34 = v33;
        *a3 = v34;
      }
    }
    else
    {
      if (!a3) {
        goto LABEL_28;
      }
      id v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      id v12 = +[NSString stringWithFormat:@"Unsupported type: %@ of value: %@", v25, v5];

      NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
      id v41 = v12;
      id v26 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v27 = +[NSError errorWithDomain:@"DebugHierarchyJSONDecodingErrorDomain" code:1 userInfo:v26];

      id v28 = v27;
      *a3 = v28;
    }
    id v7 = 0;
    goto LABEL_40;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v5;
    id v10 = [v9 count];
    if (v10 == [v8 count])
    {
      +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      if ([v9 count])
      {
        NSErrorUserInfoKey v37 = a3;
        id v38 = v5;
        unint64_t v11 = 0;
        while (1)
        {
          id v12 = [v9 objectAtIndexedSubscript:v11];
          id v13 = v8;
          id v14 = [v8 objectAtIndexedSubscript:v11];
          id v15 = [v14 format];
          id v39 = 0;
          id v16 = DBGDecodeValueFromJSONCompatibleValue(v12, v15, &v39);
          id v17 = v39;
          [v7 addObject:v16];

          if (v17) {
            break;
          }

          ++v11;
          id v8 = v13;
          if ((unint64_t)[v9 count] <= v11)
          {
            id v5 = v38;
            goto LABEL_41;
          }
        }
        if (v37) {
          *NSErrorUserInfoKey v37 = v17;
        }

        id v8 = v13;
        id v5 = v38;
        goto LABEL_32;
      }
LABEL_41:

      goto LABEL_42;
    }
    if (a3)
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Mismatch between number of values (%lu) and number of format specifiers (%lu).\nValue: %@\nFormat: %@", [v9 count], objc_msgSend(v8, "count"), v9, v6);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
      id v49 = v12;
      id v22 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
      v23 = +[NSError errorWithDomain:@"DebugHierarchyJSONDecodingErrorDomain" code:2 userInfo:v22];

      id v14 = v23;
      id v7 = 0;
      *a3 = v14;
LABEL_32:

      goto LABEL_40;
    }
LABEL_28:
    id v7 = 0;
    goto LABEL_41;
  }
  if (a3)
  {
    id v9 = +[NSString stringWithFormat:@"Multiple format specifiers (%@) paired with non-array type value: %@", v6, v5];
    NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
    id v47 = v9;
    id v20 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    id v21 = +[NSError errorWithDomain:@"DebugHierarchyJSONDecodingErrorDomain" code:2 userInfo:v20];

    id v12 = v21;
    id v7 = 0;
    *a3 = v12;
LABEL_40:

    goto LABEL_41;
  }
LABEL_17:
  id v7 = 0;
LABEL_42:

LABEL_43:
  return v7;
}

id DBGSerializePropertyDescriptionAsJSON(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 objectForKeyedSubscript:@"propertyValue"];
  id v5 = v3;
  if (v4)
  {
    objc_opt_class();
    id v5 = v3;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [v3 objectForKeyedSubscript:@"propertyFormat"];
      if ([v6 length])
      {
        id v15 = 0;
        id v7 = DBGEncodeValueAsJSONCompatibleValue(v4, v6, &v15);
        id v8 = v15;
        id v9 = v8;
        if (a2 && v8) {
          *a2 = v8;
        }
        id v10 = [v3 mutableCopy];
        [v10 setObject:v7 forKeyedSubscript:@"propertyValue"];
        id v5 = [v10 copy];
      }
      else
      {
        id v9 = [v3 mutableCopy];
        [v9 removeObjectForKey:@"propertyValue"];
        id v5 = [v9 copy];

        if (!a2)
        {
LABEL_11:

          goto LABEL_12;
        }
        unint64_t v11 = [v3 objectForKeyedSubscript:@"propertyName"];
        id v7 = +[NSString stringWithFormat:@"Format has zero length. Discarding value for property: %@.", v11];

        NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
        id v17 = v7;
        id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
        id v13 = +[NSError errorWithDomain:@"DebugHierarchyJSONEncodingErrorDomain" code:1 userInfo:v12];

        id v10 = v13;
        *a2 = v10;
      }

      goto LABEL_11;
    }
  }
LABEL_12:

  return v5;
}

id DBGSerializePropertyDescriptionsAsJSON(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint32_t i = 0; i != v7; uint32_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v16 = 0;
        unint64_t v11 = DBGSerializePropertyDescriptionAsJSON(v10, &v16);
        id v12 = v16;
        if (v12)
        {
          id v14 = v12;
          if (a2) {
            *a2 = v12;
          }

          id v13 = 0;
          goto LABEL_15;
        }
        if (v11) {
          [v4 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = [v4 copy];
LABEL_15:

  return v13;
}

id DBGDeserializePropertyDictionaryFromJSON(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 objectForKeyedSubscript:@"propertyValue"];
  id v5 = v3;
  if (v4)
  {
    id v6 = [v3 objectForKeyedSubscript:@"propertyFormat"];
    id v5 = v3;
    if ([v6 length])
    {
      id v12 = 0;
      id v7 = DBGDecodeValueFromJSONCompatibleValue(v4, v6, &v12);
      id v8 = v12;
      id v9 = v8;
      if (a2 && v8) {
        *a2 = v8;
      }
      id v10 = [v3 mutableCopy];
      [v10 setObject:v7 forKeyedSubscript:@"propertyValue"];
      id v5 = [v10 copy];
    }
  }

  return v5;
}

id DBGDeserializePropertyDictionariesFromJSON(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (uint32_t i = 0; i != v7; uint32_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v16 = 0;
        unint64_t v11 = DBGDeserializePropertyDictionaryFromJSON(v10, &v16);
        id v12 = v16;
        if (v12)
        {
          id v14 = v12;
          if (a2) {
            *a2 = v12;
          }

          id v13 = 0;
          goto LABEL_15;
        }
        if (v11) {
          [v4 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v13 = [v4 copy];
LABEL_15:

  return v13;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return _CGColorGetColorSpace(color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return _CGColorGetComponents(color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return _CGColorGetNumberOfComponents(color);
}

CFTypeID CGColorGetTypeID(void)
{
  return _CGColorGetTypeID();
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return _CGColorSpaceCopyName(space);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return _CGColorSpaceGetModel(space);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CFTypeID CGImageGetTypeID(void)
{
  return _CGImageGetTypeID();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return __dyld_get_image_header(image_index);
}

uint32_t _dyld_image_count(void)
{
  return __dyld_image_count();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int deflate(z_streamp strm, int flush)
{
  return _deflate(strm, flush);
}

int deflateEnd(z_streamp strm)
{
  return _deflateEnd(strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return _deflateInit2_(strm, level, method, windowBits, memLevel, strategy, version, stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

int inflate(z_streamp strm, int flush)
{
  return _inflate(strm, flush);
}

int inflateEnd(z_streamp strm)
{
  return _inflateEnd(strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return _inflateInit2_(strm, windowBits, version, stream_size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerateClasses(const void *image, const char *namePrefix, Protocol *conformingTo, Class subclassing, void *block)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL object_isClass(id obj)
{
  return _object_isClass(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return _xpc_dictionary_get_data(xdict, key, length);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__entryPointClasses(void *a1, const char *a2, ...)
{
  return [a1 _entryPointClasses];
}

id objc_msgSend__executeRequestActionsWithCrawler(void *a1, const char *a2, ...)
{
  return [a1 _executeRequestActionsWithCrawler];
}

id objc_msgSend__executeRequestActionsWithKnownObjects(void *a1, const char *a2, ...)
{
  return [a1 _executeRequestActionsWithKnownObjects];
}

id objc_msgSend__reindexAllTypes(void *a1, const char *a2, ...)
{
  return [a1 _reindexAllTypes];
}

id objc_msgSend__topLevelTypes(void *a1, const char *a2, ...)
{
  return [a1 _topLevelTypes];
}

id objc_msgSend_actionExecutor(void *a1, const char *a2, ...)
{
  return [a1 actionExecutor];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_additionalGroupingIDs(void *a1, const char *a2, ...)
{
  return [a1 additionalGroupingIDs];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 alphanumericCharacterSet];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_childGroupingID(void *a1, const char *a2, ...)
{
  return [a1 childGroupingID];
}

id objc_msgSend_clearAllRequestsAndData(void *a1, const char *a2, ...)
{
  return [a1 clearAllRequestsAndData];
}

id objc_msgSend_closestTypeVendingAChildGroupingID(void *a1, const char *a2, ...)
{
  return [a1 closestTypeVendingAChildGroupingID];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_compressDuringTransport(void *a1, const char *a2, ...)
{
  return [a1 compressDuringTransport];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextRuntimeInfo(void *a1, const char *a2, ...)
{
  return [a1 contextRuntimeInfo];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_crawlEntryPointClasses(void *a1, const char *a2, ...)
{
  return [a1 crawlEntryPointClasses];
}

id objc_msgSend_crawlTopLevelGroups(void *a1, const char *a2, ...)
{
  return [a1 crawlTopLevelGroups];
}

id objc_msgSend_crawlerOptions(void *a1, const char *a2, ...)
{
  return [a1 crawlerOptions];
}

id objc_msgSend_currentReply(void *a1, const char *a2, ...)
{
  return [a1 currentReply];
}

id objc_msgSend_currentRequestInBase64(void *a1, const char *a2, ...)
{
  return [a1 currentRequestInBase64];
}

id objc_msgSend_currentResponseFileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 currentResponseFileDescriptor];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dbgBoolValue(void *a1, const char *a2, ...)
{
  return [a1 dbgBoolValue];
}

id objc_msgSend_dbgCGFloatValue(void *a1, const char *a2, ...)
{
  return [a1 dbgCGFloatValue];
}

id objc_msgSend_dbgDataValue(void *a1, const char *a2, ...)
{
  return [a1 dbgDataValue];
}

id objc_msgSend_dbgDoubleValue(void *a1, const char *a2, ...)
{
  return [a1 dbgDoubleValue];
}

id objc_msgSend_dbgFloatValue(void *a1, const char *a2, ...)
{
  return [a1 dbgFloatValue];
}

id objc_msgSend_dbgIntValue(void *a1, const char *a2, ...)
{
  return [a1 dbgIntValue];
}

id objc_msgSend_dbgIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 dbgIntegerValue];
}

id objc_msgSend_dbgLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 dbgLongLongValue];
}

id objc_msgSend_dbgLongValue(void *a1, const char *a2, ...)
{
  return [a1 dbgLongValue];
}

id objc_msgSend_dbgUnsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 dbgUnsignedIntValue];
}

id objc_msgSend_dbgUnsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 dbgUnsignedIntegerValue];
}

id objc_msgSend_dbgUnsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 dbgUnsignedLongLongValue];
}

id objc_msgSend_dbgUnsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 dbgUnsignedLongValue];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugHierarchyAdditionalGroupingIDs(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyAdditionalGroupingIDs];
}

id objc_msgSend_debugHierarchyChildGroupingID(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyChildGroupingID];
}

id objc_msgSend_debugHierarchyEnumDescriptions(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyEnumDescriptions];
}

id objc_msgSend_debugHierarchyGroupingIDs(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyGroupingIDs];
}

id objc_msgSend_debugHierarchyOptionDescriptions(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyOptionDescriptions];
}

id objc_msgSend_debugHierarchyPropertyDescriptions(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyPropertyDescriptions];
}

id objc_msgSend_debugHierarchyVersion(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyVersion];
}

id objc_msgSend_debugHierarchyVisibility(void *a1, const char *a2, ...)
{
  return [a1 debugHierarchyVisibility];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_environmentInfo(void *a1, const char *a2, ...)
{
  return [a1 environmentInfo];
}

id objc_msgSend_exactTypes(void *a1, const char *a2, ...)
{
  return [a1 exactTypes];
}

id objc_msgSend_exactTypesAreExclusive(void *a1, const char *a2, ...)
{
  return [a1 exactTypesAreExclusive];
}

id objc_msgSend_executeFinalStandaloneActions(void *a1, const char *a2, ...)
{
  return [a1 executeFinalStandaloneActions];
}

id objc_msgSend_executeInitialStandaloneActions(void *a1, const char *a2, ...)
{
  return [a1 executeInitialStandaloneActions];
}

id objc_msgSend_finalActions(void *a1, const char *a2, ...)
{
  return [a1 finalActions];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_formattedSummary(void *a1, const char *a2, ...)
{
  return [a1 formattedSummary];
}

id objc_msgSend_globalRuntimeInfo(void *a1, const char *a2, ...)
{
  return [a1 globalRuntimeInfo];
}

id objc_msgSend_groupVisibilityMask(void *a1, const char *a2, ...)
{
  return [a1 groupVisibilityMask];
}

id objc_msgSend_groupingIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 groupingIdentifiers];
}

id objc_msgSend_groupingIdentifiersAreExclusive(void *a1, const char *a2, ...)
{
  return [a1 groupingIdentifiersAreExclusive];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierToObjectDescriptionMap(void *a1, const char *a2, ...)
{
  return [a1 identifierToObjectDescriptionMap];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialActions(void *a1, const char *a2, ...)
{
  return [a1 initialActions];
}

id objc_msgSend_initiatorVersion(void *a1, const char *a2, ...)
{
  return [a1 initiatorVersion];
}

id objc_msgSend_instanceProperties(void *a1, const char *a2, ...)
{
  return [a1 instanceProperties];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return [a1 isAtEnd];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_keysToArchiveViaKVC(void *a1, const char *a2, ...)
{
  return [a1 keysToArchiveViaKVC];
}

id objc_msgSend_knownObjectsMap(void *a1, const char *a2, ...)
{
  return [a1 knownObjectsMap];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_logicalType(void *a1, const char *a2, ...)
{
  return [a1 logicalType];
}

id objc_msgSend_logs(void *a1, const char *a2, ...)
{
  return [a1 logs];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_maximumObjectCount(void *a1, const char *a2, ...)
{
  return [a1 maximumObjectCount];
}

id objc_msgSend_maximumObjectDepth(void *a1, const char *a2, ...)
{
  return [a1 maximumObjectDepth];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_metaData(void *a1, const char *a2, ...)
{
  return [a1 metaData];
}

id objc_msgSend_metaDataProviderClassesForEnums(void *a1, const char *a2, ...)
{
  return [a1 metaDataProviderClassesForEnums];
}

id objc_msgSend_metaDataProviderClassesForEnumsAreExclusive(void *a1, const char *a2, ...)
{
  return [a1 metaDataProviderClassesForEnumsAreExclusive];
}

id objc_msgSend_metaDataProviderClassesForOptions(void *a1, const char *a2, ...)
{
  return [a1 metaDataProviderClassesForOptions];
}

id objc_msgSend_metaDataProviderClassesForOptionsAreExclusive(void *a1, const char *a2, ...)
{
  return [a1 metaDataProviderClassesForOptionsAreExclusive];
}

id objc_msgSend_methodSignature(void *a1, const char *a2, ...)
{
  return [a1 methodSignature];
}

id objc_msgSend_moduleName(void *a1, const char *a2, ...)
{
  return [a1 moduleName];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameIncludingModules(void *a1, const char *a2, ...)
{
  return [a1 nameIncludingModules];
}

id objc_msgSend_needsCompatibilityConversion(void *a1, const char *a2, ...)
{
  return [a1 needsCompatibilityConversion];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectActions(void *a1, const char *a2, ...)
{
  return [a1 objectActions];
}

id objc_msgSend_objectDiscovery(void *a1, const char *a2, ...)
{
  return [a1 objectDiscovery];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_objectIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 objectIdentifiers];
}

id objc_msgSend_objectIdentifiersAreExclusive(void *a1, const char *a2, ...)
{
  return [a1 objectIdentifiersAreExclusive];
}

id objc_msgSend_openXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 openXPCConnection];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_optionsComparisonStyle(void *a1, const char *a2, ...)
{
  return [a1 optionsComparisonStyle];
}

id objc_msgSend_parentType(void *a1, const char *a2, ...)
{
  return [a1 parentType];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_propertyNames(void *a1, const char *a2, ...)
{
  return [a1 propertyNames];
}

id objc_msgSend_propertyNamesAreExclusive(void *a1, const char *a2, ...)
{
  return [a1 propertyNamesAreExclusive];
}

id objc_msgSend_registerForDarwinNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForDarwinNotifications];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestContext(void *a1, const char *a2, ...)
{
  return [a1 requestContext];
}

id objc_msgSend_requestResponse(void *a1, const char *a2, ...)
{
  return [a1 requestResponse];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rootItems(void *a1, const char *a2, ...)
{
  return [a1 rootItems];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_runtimeInfo(void *a1, const char *a2, ...)
{
  return [a1 runtimeInfo];
}

id objc_msgSend_runtimeTypeName(void *a1, const char *a2, ...)
{
  return [a1 runtimeTypeName];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return [a1 scanLocation];
}

id objc_msgSend_serializedRepresentation(void *a1, const char *a2, ...)
{
  return [a1 serializedRepresentation];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_severity(void *a1, const char *a2, ...)
{
  return [a1 severity];
}

id objc_msgSend_sharedHub(void *a1, const char *a2, ...)
{
  return [a1 sharedHub];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusMessageActivityPhrase(void *a1, const char *a2, ...)
{
  return [a1 statusMessageActivityPhrase];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_strongToWeakObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToWeakObjectsMapTable];
}

id objc_msgSend_subtypes(void *a1, const char *a2, ...)
{
  return [a1 subtypes];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return [a1 superclass];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_topLevelGroups(void *a1, const char *a2, ...)
{
  return [a1 topLevelGroups];
}

id objc_msgSend_topLevelPropertyDescriptions(void *a1, const char *a2, ...)
{
  return [a1 topLevelPropertyDescriptions];
}

id objc_msgSend_typeMap(void *a1, const char *a2, ...)
{
  return [a1 typeMap];
}

id objc_msgSend_types(void *a1, const char *a2, ...)
{
  return [a1 types];
}

id objc_msgSend_typesAreExclusive(void *a1, const char *a2, ...)
{
  return [a1 typesAreExclusive];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_visibility(void *a1, const char *a2, ...)
{
  return [a1 visibility];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}
void sub_19B02FFDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

id _UTGetAllCoreTypesConstants()
{
  v0 = &UniformTypeIdentifiers::CoreTypes::constants;
  v1 = (__objc2_class ***)v5;
  uint64_t v2 = 5504;
  do
  {
    *v1++ = v0;
    v0 += 4;
    v2 -= 32;
  }
  while (v2);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithObjects:v5 count:172];

  return v3;
}

void sub_19B030244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B030354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_19B030414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B030480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B030528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::Type::getExportedType(__CFString *this, NSString *a2, UTType *a3, NSBundle *a4)
{
  v6 = __UTFindCoreTypesConstantWithIdentifier(this, 0x7FFFFFFFFFFFFFFFuLL);
  if (!v6)
  {
    v7 = a2;
    if (!a2)
    {
      v7 = [MEMORY[0x1E4F28B50] mainBundle];
    }
    v6 = +[_UTRuntimeConstantType typeWithIdentifier:this bundle:v7 infoPlistKey:*MEMORY[0x1E4F224E0]];
    if (!a2) {
  }
    }

  return v6;
}

void sub_19B0305DC(_Unwind_Exception *exception_object)
{
  if (!v1) {

  }
  _Unwind_Resume(exception_object);
}

void sub_19B030708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __UTGetDeclarationStatusFromInfoPlist(void *a1, int a2, void *a3, void *a4)
{
  v8 = (void *)MEMORY[0x19F387810]();
  if (a3)
  {
    id v9 = a3;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28B50] mainBundle];
  }
  v10 = v9;
  v11 = [v9 objectForInfoDictionaryKey:*MEMORY[0x1E4F224E0]];
  v12 = [v10 objectForInfoDictionaryKey:*MEMORY[0x1E4F224E8]];
  v13 = v12;
  if (a2)
  {
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v14 = v11;
  }
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 1;
  v33[0] = (void *)MEMORY[0x1E4F143A8];
  v33[1] = (void *)3221225472;
  v33[2] = ___ZN22UniformTypeIdentifiers13RuntimeIssuesL27checkListsForTypeIdentifierEP8NSStringP7NSArrayIP12NSDictionaryIS2_P11objc_objectEESA__block_invoke;
  v33[3] = &unk_1E583EE90;
  v33[4] = a1;
  v33[5] = &v35;
  UniformTypeIdentifiers::RuntimeIssues::enumerateTypeIdentifiersInDeclarationsArray(v12, (uint64_t)v33);
  if (*((_DWORD *)v36 + 6))
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = ___ZN22UniformTypeIdentifiers13RuntimeIssuesL27checkListsForTypeIdentifierEP8NSStringP7NSArrayIP12NSDictionaryIS2_P11objc_objectEESA__block_invoke_2;
    v34[3] = &unk_1E583EE90;
    v34[4] = a1;
    v34[5] = &v35;
    UniformTypeIdentifiers::RuntimeIssues::enumerateTypeIdentifiersInDeclarationsArray(v14, (uint64_t)v34);
    uint64_t v15 = *((unsigned int *)v36 + 6);
  }
  else
  {
    uint64_t v15 = 0;
  }
  _Block_object_dispose(&v35, 8);

  if (v15 && !_UTEnableAllRuntimeIssues)
  {
    if (a4) {
      v17 = (UniformTypeIdentifiers::RuntimeIssues *)dyld_image_header_containing_address();
    }
    else {
      v17 = 0;
    }
    if (!UniformTypeIdentifiers::RuntimeIssues::isBinaryTheCaller(v17, v16))
    {
      int v18 = backtrace(v33, 8);
      if (v18 < 1)
      {
LABEL_24:
        v17 = 0;
      }
      else
      {
        uint64_t v20 = v18;
        v21 = v33;
        while (1)
        {
          if (*v21 != a4)
          {
            v17 = *v21 ? (UniformTypeIdentifiers::RuntimeIssues *)dyld_image_header_containing_address() : 0;
            if (UniformTypeIdentifiers::RuntimeIssues::isBinaryTheCaller(v17, v19)) {
              break;
            }
          }
          ++v21;
          if (!--v20) {
            goto LABEL_24;
          }
        }
      }
    }
    if (!v17) {
      return 0;
    }
    if ((UniformTypeIdentifiers::RuntimeIssues *)_dyld_get_prog_image_header() != v17)
    {
      uint64_t v22 = dyld_image_path_containing_address();
      if (v22)
      {
        uint64_t v23 = v22;
        v24 = (void *)MEMORY[0x19F387810]();
        v25 = [MEMORY[0x1E4F28B50] mainBundle];
        v26 = [v25 bundleURL];

        uint64_t v27 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:v23 isDirectory:0 relativeToURL:0];
        v28 = (void *)v27;
        if (v26 && v27 && [v26 hasDirectoryPath])
        {
          v29 = [v28 path];
          v30 = [v26 path];
          int v31 = [v29 hasPrefix:v30];

          if (v31) {
            return v15;
          }
        }
        else
        {
        }
      }
      return 0;
    }
  }
  return v15;
}

void sub_19B030AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B030ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void UniformTypeIdentifiers::RuntimeIssues::enumerateTypeIdentifiersInDeclarationsArray(void *a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (_NSIsNSArray() && [a1 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = a1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      uint64_t v7 = *MEMORY[0x1E4F225F0];
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [v9 objectForKeyedSubscript:v7];
            if (_NSIsNSString())
            {
              char v11 = 0;
              (*(void (**)(uint64_t, void *, char *))(a2 + 16))(a2, v10, &v11);
              if (v11)
              {

                goto LABEL_16;
              }
            }
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
}

void sub_19B0310FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL ___ZN22UniformTypeIdentifiers13RuntimeIssuesL27checkListsForTypeIdentifierEP8NSStringP7NSArrayIP12NSDictionaryIS2_P11objc_objectEESA__block_invoke(uint64_t a1, __CFString *a2, unsigned char *a3)
{
  BOOL result = _UTIdentifiersAreEqual(*(__CFString **)(a1 + 32), a2);
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

void sub_19B0314BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Unwind_Resume(a1);
}

void _UTDetachTypeRecords(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void _UTDetachTypeRecords(UTTypeRecord *const __unsafe_unretained *const, NSUInteger)");
    [v5 handleFailureInFunction:v6, @"UTType.mm", 989, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];
  }
  if (qword_1EB20A668 != -1) {
    dispatch_once(&qword_1EB20A668, &__block_literal_global_2);
  }
  if (_MergedGlobals_2)
  {
    id v4 = (void *)MEMORY[0x1E4F22468];
    [v4 resolveAllPropertiesOfRecords:a1 count:a2 andDetachOnQueue:0];
  }
}

void sub_19B031658(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B031774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _UTTaggedTypeCreate(void *a1)
{
  if (!a1)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"_UTTaggedType *_UTTaggedTypeCreate(UTTypeRecord *const __strong _Nonnull)"];
    [v16 handleFailureInFunction:v17, @"UTTaggedType.mm", 276, @"Invalid parameter not satisfying: %@", @"typeRecord != nil" file lineNumber description];
  }
  if ([a1 isDynamic])
  {
    if (qword_1EB20A648 != -1) {
      dispatch_once(&qword_1EB20A648, &__block_literal_global_0);
    }
    if (_MergedGlobals_0 == 1)
    {
      uint64_t v2 = [a1 preferredTagOfClass:@"public.filename-extension"];
      if (v2)
      {
        v3 = [(_UTConstantType *)&off_1EB2090D0 identifier];
        char v4 = [a1 isChildOfTypeIdentifier:v3];

        if (v4)
        {
          int v5 = 0;
        }
        else
        {
          uint64_t v7 = [(_UTConstantType *)&off_1EB209CF0 identifier];
          int v8 = [a1 isChildOfTypeIdentifier:v7];

          if (!v8) {
            goto LABEL_21;
          }
          int v5 = 1;
        }
        *(_DWORD *)((char *)v19 + 3) = 0;
        v19[0] = 0;
        long long v18 = xmmword_19B03C8B0;
        int v9 = objc_msgSend(v2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v19, 6, 0, 4, 0, 0, objc_msgSend(v2, "length"), &v18);
        if (*((void *)&v18 + 1)) {
          int v10 = 0;
        }
        else {
          int v10 = v9;
        }
        if (v10 == 1)
        {
          int v11 = BYTE2(v19[1]) & 0xFE | v5;
          BYTE2(v19[1]) = BYTE2(v19[1]) & 0xFE | v5;
          unint64_t v12 = v19[0] | ((unint64_t)(LOWORD(v19[1]) | (v11 << 16)) << 32);
          if (v12)
          {
            unint64_t v13 = (8 * (v12 & 0xFFFFFFFFFFFFFLL)) | 0x8680000000000007;
            unint64_t v14 = *MEMORY[0x1E4FBA8E0] ^ v13;
            if ((~v14 & 0xC000000000000007) != 0) {
              unint64_t v13 = v14 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E4FBA8D0] + (v14 & 7));
            }
            id v6 = (id)v13;
            goto LABEL_22;
          }
        }
      }
LABEL_21:
      id v6 = 0;
LABEL_22:

      return v6;
    }
  }
  return 0;
}

void sub_19B0319D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _UTTypeGetForIdentifier(__CFString *a1, int a2)
{
  if (!a1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    int v8 = objc_msgSend(NSString, "stringWithUTF8String:", "UTType *_UTTypeGetForIdentifier(NSString *const __strong, BOOL)");
    [v7 handleFailureInFunction:v8, @"UTType.mm", 101, @"Invalid parameter not satisfying: %@", @"identifier != nil" file lineNumber description];
  }
  char v4 = __UTFindCoreTypesConstantWithIdentifier(a1, 0x7FFFFFFFFFFFFFFFuLL);
  if (!v4)
  {
    if (a2) {
      [MEMORY[0x1E4F22490] typeRecordWithPotentiallyUndeclaredIdentifier:a1];
    }
    else {
    int v5 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:a1];
    }
    if (v5)
    {
      char v4 = +[UTType _typeWithTypeRecord:v5 detachTypeRecord:1 findConstant:0];
    }
    else
    {
      char v4 = 0;
    }
  }

  return v4;
}

void sub_19B031B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__objc2_class **__UTFindCoreTypesConstantWithIdentifier(__CFString *a1, unint64_t a2)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    int v8 = [MEMORY[0x1E4F28B00] currentHandler];
    int v9 = objc_msgSend(NSString, "stringWithUTF8String:", "CFTypeRef __UTFindCoreTypesConstantWithIdentifier(NSString *const __strong _Nonnull, NSInteger)");
    [v8 handleFailureInFunction:v9, @"UTCoreTypes.mm", 241, @"Invalid parameter not satisfying: %@", @"identifier != nil" file lineNumber description];

    if ((a2 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
    return 0;
  }
  if ((a2 & 0x8000000000000000) != 0) {
    return 0;
  }
LABEL_3:
  if (a2 > 0xAB
    || (char v4 = &UniformTypeIdentifiers::CoreTypes::constants + 4 * a2,
        [v4 identifier],
        int v5 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        BOOL v6 = _UTIdentifiersAreEqual(a1, v5),
        v5,
        !v6))
  {
    if (qword_1EB20A680 != -1) {
      dispatch_once(&qword_1EB20A680, &__block_literal_global_3);
    }
    v11[2] = a1;
    v11[3] = 0;
    v11[0] = _UTCoreType;
    uint64_t v7 = [(id)qword_1EB20A678 indexOfObject:v11];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    else {
      return &UniformTypeIdentifiers::CoreTypes::constants + 4 * v7;
    }
  }
  return v4;
}

void sub_19B031D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t UniformTypeIdentifiers::Type::isTagValid(UniformTypeIdentifiers::Type *this, __CFString *a2, NSString *a3)
{
  if (this)
  {
    if (a2) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL isTagValid(NSString *const __strong, NSString *const __strong)");
    [v6 handleFailureInFunction:v7, @"UTType.mm", 1003, @"Invalid parameter not satisfying: %@", @"tag != nil" file lineNumber description];

    if (a2) {
      goto LABEL_3;
    }
  }
  int v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  int v9 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL isTagValid(NSString *const __strong, NSString *const __strong)");
  [v8 handleFailureInFunction:v9, @"UTType.mm", 1004, @"Invalid parameter not satisfying: %@", @"tagClass != nil" file lineNumber description];

LABEL_3:
  uint64_t result = [(UniformTypeIdentifiers::Type *)this length];
  if (result)
  {
    if (_UTIdentifiersAreEqual(a2, @"public.filename-extension"))
    {
      return ([(UniformTypeIdentifiers::Type *)this containsString:@"."] & 1) == 0
          && _CFExtensionIsValidToAppend() != 0;
    }
    else if (_UTIdentifiersAreEqual(a2, @"public.mime-type"))
    {
      return [(UniformTypeIdentifiers::Type *)this containsString:@"/"];
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void sub_19B031F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _UTCoreTypesConstantSetTypeRecordIfNil(uint64_t a1, void *a2)
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v6 = *(void *)(a1 + 8);
  char v4 = (id *)(a1 + 8);
  uint64_t v5 = v6;
  if (!v6) {
    objc_storeStrong(v4, a2);
  }
  os_unfair_recursive_lock_unlock();
  return v5 == 0;
}

BOOL ___ZN22UniformTypeIdentifiers13RuntimeIssuesL27checkListsForTypeIdentifierEP8NSStringP7NSArrayIP12NSDictionaryIS2_P11objc_objectEESA__block_invoke_2(uint64_t a1, __CFString *a2, unsigned char *a3)
{
  BOOL result = _UTIdentifiersAreEqual(*(__CFString **)(a1 + 32), a2);
  if (result)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
    *a3 = 1;
  }
  return result;
}

BOOL UniformTypeIdentifiers::RuntimeIssues::isBinaryTheCaller(UniformTypeIdentifiers::RuntimeIssues *this, const mach_header *a2)
{
  BOOL result = 0;
  if (this && this != (UniformTypeIdentifiers::RuntimeIssues *)&dword_19B02E000)
  {
    if (os_unfair_lock_trylock((os_unfair_lock_t)&_MergedGlobals_4))
    {
      char v4 = (UniformTypeIdentifiers::RuntimeIssues *)qword_1EB20A6D0;
      if (!qword_1EB20A6D0)
      {
        char v4 = (UniformTypeIdentifiers::RuntimeIssues *)[(objc_class *)objc_getClass("_UTSwiftOverlayRuntimeIssuesAssistant") dsoHandle];
        qword_1EB20A6D0 = (uint64_t)v4;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_4);
    }
    else
    {
      char v4 = (UniformTypeIdentifiers::RuntimeIssues *)[(objc_class *)objc_getClass("_UTSwiftOverlayRuntimeIssuesAssistant") dsoHandle];
    }
    return v4 != this;
  }
  return result;
}

void sub_19B0320AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0321D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B03225C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t _UTIdentifierGetHashCode(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 maximumLengthOfBytesUsingEncoding:4];
  std::vector<char>::size_type v3 = v2 + 1;
  if (v2 == -1)
  {
    unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:1167:34)]");
    [v13 handleFailureInFunction:v14, @"UTType.mm", 1151, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];

LABEL_3:
    bzero(&v16, 0x400uLL);
    *(void *)__x = 0;
    if (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v16, v3, __x, 4, 0, 0, objc_msgSend(v1, "length"), 0))
    {
      unint64_t v4 = *(void *)__x;
      if (*(void *)__x)
      {
        uint64_t v5 = &v16;
        do
        {
          LOBYTE(v5->__begin_) = __tolower(LOBYTE(v5->__begin_));
          uint64_t v5 = (std::vector<char> *)((char *)v5 + 1);
          --v4;
        }
        while (v4);
        unint64_t v6 = *(void *)__x;
      }
      else
      {
        unint64_t v6 = 0;
      }
      unint64_t v11 = std::__string_view_hash<char>::operator()[abi:ne180100]((uint64_t *)&v16, v6);
    }
    else
    {
      unint64_t v11 = 0;
    }
    goto LABEL_20;
  }
  if (v3 <= 0x400) {
    goto LABEL_3;
  }
  __x[0] = 0;
  std::vector<char>::vector(&v16, v3, __x);
  *(void *)__x = 0;
  int v7 = objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v16.__begin_, v3, __x, 4, 0, 0, objc_msgSend(v1, "length"), 0);
  begin = (uint64_t *)v16.__begin_;
  if (!v7)
  {
    unint64_t v11 = 0;
    if (!v16.__begin_) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  unint64_t v9 = *(void *)__x;
  if (*(void *)__x)
  {
    do
    {
      *(unsigned char *)begin = __tolower(*(unsigned __int8 *)begin);
      begin = (uint64_t *)((char *)begin + 1);
      --v9;
    }
    while (v9);
    unint64_t v10 = *(void *)__x;
    begin = (uint64_t *)v16.__begin_;
  }
  else
  {
    unint64_t v10 = 0;
  }
  unint64_t v11 = std::__string_view_hash<char>::operator()[abi:ne180100](begin, v10);
  if (begin)
  {
LABEL_19:
    v16.__end_ = (std::vector<char>::pointer)begin;
    operator delete(begin);
  }
LABEL_20:

  return v11;
}

void sub_19B03248C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  _Unwind_Resume(a1);
}

unint64_t std::__string_view_hash<char>::operator()[abi:ne180100](uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v32 + v35 + v36 + a2;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v36 + a2 + v33 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v34 + v37 + v45;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v58 + v56 + v67 + v57;
      uint64_t v49 = __ROR8__(v58 + v56 + v67, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * ((v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * ((a2 + (8 * *(_DWORD *)a1)) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (a1 == (uint64_t *)((char *)a1 + a2)) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

void sub_19B0329B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _UTIdentifiersAreEqual(__CFString *theString, __CFString *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (theString == a2) {
    return 1;
  }
  BOOL v3 = 0;
  if (!theString || !a2) {
    return v3;
  }
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  uint64_t v6 = CFStringGetCStringPtr(a2, 0x8000100u);
  if (CStringPtr)
  {
    uint64_t v7 = v6;
    if (v6)
    {
      uint64_t v8 = (std::vector<char> *)CStringPtr;
      return strcasecmp((const char *)v8, v7) == 0;
    }
  }
  uint64_t v10 = [(__CFString *)theString maximumLengthOfBytesUsingEncoding:4];
  std::vector<char>::size_type v11 = [(__CFString *)a2 maximumLengthOfBytesUsingEncoding:4] + 1;
  BOOL v12 = __CFADD__(v10, 1);
  std::vector<char>::size_type v13 = v10 + 1;
  if (!v12)
  {
    if (v13 <= 0x400) {
      goto LABEL_12;
    }
    LOBYTE(__x[0].__begin_) = 0;
    std::vector<char>::vector(&v23, v13, (const std::vector<char>::value_type *)__x);
    if (v11)
    {
      if (v11 > 0x400)
      {
        v22[0] = 0;
        std::vector<char>::vector(__x, v11, v22);
        uint64_t v21 = 0;
        *(void *)uint64_t v22 = 0;
        BOOL v3 = -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](theString, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v23.__begin_, v13, v22, 4, 0, 0, -[__CFString length](theString, "length"), 0)&& -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](a2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __x[0].__begin_, v11, &v21, 4, 0, 0,
                             [(__CFString *)a2 length],
                             0)
          && *(void *)v22 == v21
          && strcasecmp(v23.__begin_, __x[0].__begin_) == 0;
        if (__x[0].__begin_)
        {
          __x[0].__end_ = __x[0].__begin_;
          operator delete(__x[0].__begin_);
        }
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:871:91)]");
      [v19 handleFailureInFunction:v20, @"UTType.mm", 1151, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];
    }
    bzero(__x, 0x400uLL);
    uint64_t v21 = 0;
    *(void *)uint64_t v22 = 0;
    BOOL v3 = -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](theString, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v23.__begin_, v13, v22, 4, 0, 0, -[__CFString length](theString, "length"), 0)&& -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](a2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __x, v11, &v21, 4, 0, 0,
                         [(__CFString *)a2 length],
                         0)
      && *(void *)v22 == v21
      && strcasecmp(v23.__begin_, (const char *)__x) == 0;
LABEL_40:
    std::vector<char>::pointer begin = v23.__begin_;
    if (!v23.__begin_) {
      return v3;
    }
    v23.__end_ = v23.__begin_;
LABEL_42:
    operator delete(begin);
    return v3;
  }
  uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:871:37)]");
  [v15 handleFailureInFunction:v16, @"UTType.mm", 1151, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];

LABEL_12:
  bzero(&v23, 0x400uLL);
  if (!v11)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v18 = objc_msgSend(NSString, "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:871:91)]");
    [v17 handleFailureInFunction:v18, @"UTType.mm", 1151, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];

LABEL_14:
    bzero(__x, 0x400uLL);
    uint64_t v21 = 0;
    *(void *)uint64_t v22 = 0;
    if (!-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](theString, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v23, v13, v22, 4, 0, 0, -[__CFString length](theString, "length"), 0)|| !-[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](a2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __x, v11, &v21, 4, 0, 0,
                          [(__CFString *)a2 length],
                          0)
      || *(void *)v22 != v21)
    {
      return 0;
    }
    uint64_t v8 = &v23;
    uint64_t v7 = (const char *)__x;
    return strcasecmp((const char *)v8, v7) == 0;
  }
  if (v11 <= 0x400) {
    goto LABEL_14;
  }
  v22[0] = 0;
  std::vector<char>::vector(__x, v11, v22);
  uint64_t v21 = 0;
  *(void *)uint64_t v22 = 0;
  BOOL v3 = -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](theString, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v23, v13, v22, 4, 0, 0, -[__CFString length](theString, "length"), 0)&& -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](a2, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __x[0].__begin_, v11, &v21, 4, 0, 0,
                       [(__CFString *)a2 length],
                       0)
    && *(void *)v22 == v21
    && strcasecmp((const char *)&v23, __x[0].__begin_) == 0;
  std::vector<char>::pointer begin = __x[0].__begin_;
  if (__x[0].__begin_)
  {
    __x[0].__end_ = __x[0].__begin_;
    goto LABEL_42;
  }
  return v3;
}

void sub_19B032EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_19B033054(void *a1)
{
}

void sub_19B03306C(_Unwind_Exception *a1)
{
}

void sub_19B033114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_UTRuntimeConstantType;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void ___ZN22UniformTypeIdentifiers4TypeL23shouldDetachTypeRecordsEv_block_invoke()
{
  v0 = getenv("_UTShouldDetachTypeRecords");
  if (v0)
  {
    id v1 = [NSString stringWithUTF8String:v0];
    _MergedGlobals_2 = [v1 BOOLValue];
  }
  else
  {
    _MergedGlobals_2 = [MEMORY[0x1E4F22468] hasDatabaseAccess];
  }
}

void sub_19B0331D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN22UniformTypeIdentifiers14TaggedPointersL26registerTaggedPointerClassEv_block_invoke()
{
  if (*MEMORY[0x1E4FBA8D8])
  {
    objc_lookUpClass("_UTTaggedType");
    uint64_t result = _objc_registerTaggedPointerClass();
    _MergedGlobals_0 = 1;
  }
  return result;
}

void sub_19B0333A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0335F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(UniformTypeIdentifiers::ModelCode *a1, UniformTypeIdentifiers::ModelCode *a2, char a3)
{
  uint64_t v5 = a1;
  v30[1] = *MEMORY[0x1E4F143B8];
  if ((a3 & 2) != 0)
  {
    if (!a1
      || (v30[0] = a1,
          [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1],
          a1 = (UniformTypeIdentifiers::ModelCode *)objc_claimAutoreleasedReturnValue(),
          (uint64_t v7 = a1) == 0))
    {
      UniformTypeIdentifiers::ModelCode::getCurrentDeviceModelCodes(a1);
      a1 = (UniformTypeIdentifiers::ModelCode *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = a1;
      if (!a1)
      {
        if ((a3 & 1) == 0) {
          goto LABEL_26;
        }
LABEL_27:
        if (qword_1EB20A610 != -1) {
          dispatch_once(&qword_1EB20A610, &__block_literal_global_68);
        }
        uint64_t v15 = UniformTypeIdentifiers::ModelCode::log(a1);
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
        if (v16)
        {
          uint64_t v19 = v5;
          if (!v5)
          {
            uint64_t v19 = UniformTypeIdentifiers::ModelCode::getCurrentDeviceModelCodes((UniformTypeIdentifiers::ModelCode *)v16);
          }
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v19;
          __int16 v25 = 2114;
          uint64_t v26 = qword_1EB20A608;
          __int16 v27 = 2048;
          uint64_t v28 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass;
          _os_log_debug_impl(&dword_19B02E000, v15, OS_LOG_TYPE_DEBUG, "Current device model code %@ is unknown: falling back to device class %{public}@ / %lli", buf, 0x20u);
          if (!v5) {
        }
          }
        uint64_t v14 = (id *)_UTTypeDevice;
        uint64_t v17 = (id *)&_UTTypeiPhone;
        switch(UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass)
        {
          case -1:
          case 5:
          case 8:
            goto LABEL_42;
          case 1:
            goto LABEL_40;
          case 2:
            uint64_t v17 = (id *)&_UTTypeiPodTouch;
            goto LABEL_40;
          case 3:
            uint64_t v17 = (id *)&_UTTypeiPad;
            goto LABEL_40;
          case 4:
            uint64_t v17 = (id *)&_UTTypeAppleTV;
            goto LABEL_40;
          case 6:
            uint64_t v17 = (id *)&_UTTypeAppleWatch;
            goto LABEL_40;
          case 7:
            uint64_t v17 = (id *)&_UTTypeHomePod;
            goto LABEL_40;
          case 9:
            uint64_t v17 = (id *)&_UTTypeMac;
            goto LABEL_40;
          case 11:
            uint64_t v17 = (id *)&_UTTypeAppleVisionPro;
LABEL_40:
            id v6 = *v17;
            if (!v6) {
              goto LABEL_41;
            }
            goto LABEL_43;
          default:
            if (qword_1EB20A618 != -1) {
              dispatch_once(&qword_1EB20A618, &__block_literal_global_77);
            }
LABEL_41:
            uint64_t v14 = (id *)_UTTypeDevice;
            break;
        }
        goto LABEL_42;
      }
    }
    *(void *)buf = *(void *)a2;
    *(_DWORD *)&buf[8] = *((_DWORD *)a2 + 2);
    if (!buf[8])
    {
      uint64_t HardwareColorForCurrentDevice = UniformTypeIdentifiers::ModelCode::getHardwareColorForCurrentDevice(a1);
      if (v9)
      {
        buf[8] = 1;
        *(void *)buf = HardwareColorForCurrentDevice;
      }
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = v7;
    uint64_t v11 = [(UniformTypeIdentifiers::ModelCode *)v10 countByEnumeratingWithState:&v20 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
LABEL_12:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(*(void **)(*((void *)&v20 + 1) + 8 * v13), (UniformTypeIdentifiers::ModelCode *)buf);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        if (v6) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [(UniformTypeIdentifiers::ModelCode *)v10 countByEnumeratingWithState:&v20 objects:v29 count:16];
          if (v11) {
            goto LABEL_12;
          }
          goto LABEL_18;
        }
      }
    }
    else
    {
LABEL_18:
      id v6 = 0;
    }
  }
  else
  {
    if (!a1)
    {
LABEL_26:
      id v6 = 0;
      goto LABEL_43;
    }
    UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(a1, a2);
    a1 = (UniformTypeIdentifiers::ModelCode *)objc_claimAutoreleasedReturnValue();
    id v6 = a1;
  }
  if (v6) {
    goto LABEL_43;
  }
  if ((a3 & 1) == 0) {
    goto LABEL_26;
  }
  if ((a3 & 2) != 0) {
    goto LABEL_27;
  }
  if (!v5) {
    goto LABEL_26;
  }
  uint64_t v14 = (id *)&_UTTypeAppleDevice;
LABEL_42:
  id v6 = *v14;
LABEL_43:

  return v6;
}

void sub_19B033980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B033ADC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B033BAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B033C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(void *a1, UniformTypeIdentifiers::ModelCode *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (*((unsigned char *)a2 + 8))
    {
      uint64_t v16 = UniformTypeIdentifiers::ModelCode::getHardwareColorSuffix(a2, (const UTHardwareColor *)a2);
    }
    else
    {
      uint64_t v16 = 0;
    }
    unint64_t v4 = objc_msgSend(a1, "mutableCopy", a1);
    if (v4)
    {
      while ([v4 length])
      {
        if (v16)
        {
          objc_msgSend(v4, "stringByAppendingString:");
          id v5 = (id)objc_claimAutoreleasedReturnValue();
          if (!v5) {
            goto LABEL_38;
          }
        }
        else
        {
          id v5 = v4;
        }
        uint64_t v17 = v5;
        uint64_t v18 = +[UTType typeWithTag:tagClass:conformingToType:](UTType, "typeWithTag:tagClass:conformingToType:");
        if (v18 && ([v18 isDeclared] & 1) != 0)
        {
          id v3 = v18;
        }
        else if (*((unsigned char *)a2 + 8))
        {
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id obj = +[UTType typesWithTag:v4 tagClass:@"com.apple.device-model-code" conformingToType:&off_1EB20A410];
          uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v6)
          {
            uint64_t v7 = *(void *)v22;
LABEL_18:
            uint64_t v8 = 0;
            while (1)
            {
              if (*(void *)v22 != v7) {
                objc_enumerationMutation(obj);
              }
              char v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
              if (v9)
              {
                if ([*(id *)(*((void *)&v21 + 1) + 8 * v8) isDeclared])
                {
                  unint64_t v10 = [v9 _getEnclosureColors:v20 count:16];
                  if (v10)
                  {
                    unint64_t v11 = 0;
                    do
                    {
                      if (!*((unsigned char *)a2 + 8)) {
                        std::__throw_bad_optional_access[abi:ne180100]();
                      }
                      if (_UTHardwareColorsAreEqual(v20[v11], *(void *)a2)) {
                        id v3 = v9;
                      }
                      else {
                        id v3 = 0;
                      }
                      ++v11;
                    }
                    while (v11 < v10 && !v3);
                    if (v3) {
                      break;
                    }
                  }
                }
              }
              if (++v8 == v6)
              {
                uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
                if (v6) {
                  goto LABEL_18;
                }
                goto LABEL_34;
              }
            }
          }
          else
          {
LABEL_34:
            id v3 = 0;
          }
        }
        else
        {
          id v3 = 0;
        }

        if (v3)
        {

          goto LABEL_43;
        }
LABEL_38:
        objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length", v5) - 1, 1);
      }
    }

    if (*((unsigned char *)a2 + 8))
    {
      v25[0] = 0;
      v25[8] = 0;
      uint64_t v12 = (void *)v16;
      UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCodeAndHardwareColorWithoutResolvingCurrentDevice(v15, v25);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v3 = 0;
LABEL_43:
      uint64_t v12 = (void *)v16;
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

void sub_19B033F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_19B034074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B034550(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _UTPrintModelCodesForCurrentDevice(UniformTypeIdentifiers::ModelCode *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  UniformTypeIdentifiers::ModelCode::getCurrentDeviceModelCodes(a1);
  uint64_t v2 = (UniformTypeIdentifiers::ModelCode *)objc_claimAutoreleasedReturnValue();
  uint64_t HardwareColorForCurrentDevice = UniformTypeIdentifiers::ModelCode::getHardwareColorForCurrentDevice(v2);
  int v14 = (int)v3;
  if ((_BYTE)v3)
  {
    UniformTypeIdentifiers::ModelCode::getHardwareColorSuffix((UniformTypeIdentifiers::ModelCode *)&HardwareColorForCurrentDevice, v3);
    unint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      goto LABEL_6;
    }
  }
  else
  {
    fputs("No enclosure color. If this hardware has different enclosure colors, please file a firmware radar.\n", (FILE *)a1);
  }
  unint64_t v4 = &stru_1EEABA4F8;
LABEL_6:
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v2;
  uint64_t v6 = [(UniformTypeIdentifiers::ModelCode *)v5 countByEnumeratingWithState:&v9 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        fprintf((FILE *)a1, "%s%s\n", (const char *)[*(id *)(*((void *)&v9 + 1) + 8 * i) UTF8String], (const char *)-[__CFString UTF8String](objc_retainAutorelease(v4), "UTF8String"));
      }
      uint64_t v6 = [(UniformTypeIdentifiers::ModelCode *)v5 countByEnumeratingWithState:&v9 objects:v15 count:16];
    }
    while (v6);
  }
}

void sub_19B034750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::ModelCode::getCurrentDeviceModelCodes(UniformTypeIdentifiers::ModelCode *this)
{
  if (qword_1EB20A600 != -1) {
    dispatch_once(&qword_1EB20A600, &__block_literal_global_57);
  }
  id v1 = (void *)qword_1EB20A5F8;

  return v1;
}

uint64_t UniformTypeIdentifiers::ModelCode::getHardwareColorForCurrentDevice(UniformTypeIdentifiers::ModelCode *this)
{
  if (qword_1EB20A5F0 != -1) {
    dispatch_once(&qword_1EB20A5F0, &__block_literal_global_49);
  }
  return qword_1EB20A630;
}

id UniformTypeIdentifiers::ModelCode::getHardwareColorSuffix(UniformTypeIdentifiers::ModelCode *this, const UTHardwareColor *a2)
{
  if (*(unsigned char *)this == 1)
  {
    uint64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"@ECOLOR=%llu", *((int *)this + 1), v4, v5);
  }
  else if (*(unsigned char *)this)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"@ECOLOR=%i,%i,%i", *((unsigned __int8 *)this + 4), *((unsigned __int8 *)this + 5), *((unsigned __int8 *)this + 6));
  }

  return v2;
}

BOOL _UTHardwareColorGetCurrentEnclosureColor(UniformTypeIdentifiers::ModelCode *a1)
{
  uint64_t HardwareColorForCurrentDevice = UniformTypeIdentifiers::ModelCode::getHardwareColorForCurrentDevice(a1);
  if (a1 && v3) {
    *(void *)a1 = HardwareColorForCurrentDevice;
  }
  return v3 != 0;
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x1E4FBA4F8] + 16;
}

uint64_t ___ZN22UniformTypeIdentifiers9ModelCodeL20getModelCodeOverrideEPU8__strongP8NSStringPNSt3__18optionalI15UTHardwareColorEE_block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  _MergedGlobals = result;
  return result;
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL32getHardwareColorForCurrentDeviceEv_block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  id v1 = v0;
  if (v0)
  {
    uint64_t v2 = [v0 unsignedLongLongValue];
    unsigned __int8 v3 = 0;
    char v4 = 1;
    unint64_t v5 = (v2 << 32) & 0xFF0000000000 | ((unint64_t)v2 << 48) | ((unint64_t)BYTE2(v2) << 32);
  }
  else
  {
    uint64_t v6 = (void *)MGCopyAnswer();
    uint64_t v7 = v6;
    if (v6)
    {
      unint64_t v5 = [v6 longLongValue] << 32;
      char v4 = 1;
      unsigned __int8 v3 = 1;
    }
    else
    {
      unsigned __int8 v3 = 0;
      char v4 = 0;
      unint64_t v5 = 0;
    }
  }
  qword_1EB20A630 = v5 & 0xFFFFFFFFFFFFFF00 | v3;
  LOBYTE(dword_1EB20A638) = v4;
}

void sub_19B034A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL26getCurrentDeviceModelCodesEv_block_invoke()
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    v0 = (void *)MGCopyAnswer();
    if (v0) {
      [v4 addObject:v0];
    }

    id v1 = (void *)MGCopyAnswer();
    if (v1) {
      [v4 addObject:v1];
    }

    if ([v4 count])
    {
      uint64_t v2 = [v4 copy];
      unsigned __int8 v3 = (void *)qword_1EB20A5F8;
      qword_1EB20A5F8 = v2;
    }
  }
}

void sub_19B034B14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  long long v11 = v10;

  _Unwind_Resume(a1);
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL26getDeviceTypeWithModelCodeEP8NSStringRKNSt3__18optionalI15UTHardwareColorEENS0_7OptionsE_block_invoke()
{
  v0 = (void *)MGCopyAnswer();
  id v1 = v0;
  if (v0) {
    UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass = [v0 unsignedLongLongValue];
  }

  uint64_t v2 = MGCopyAnswer();
  unsigned __int8 v3 = (void *)qword_1EB20A608;
  qword_1EB20A608 = v2;
}

void sub_19B034BB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::ModelCode::log(UniformTypeIdentifiers::ModelCode *this)
{
  if (qword_1EB20A628 != -1) {
    dispatch_once(&qword_1EB20A628, &__block_literal_global_79);
  }
  id v1 = (void *)qword_1EB20A620;

  return v1;
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL26getDeviceTypeWithModelCodeEP8NSStringRKNSt3__18optionalI15UTHardwareColorEENS0_7OptionsE_block_invoke_75(UniformTypeIdentifiers::ModelCode *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = qword_1EB20A608;
  uint64_t v2 = UniformTypeIdentifiers::ModelCode::log(a1);
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  if (v1)
  {
    if (v3)
    {
      int v7 = 138543618;
      uint64_t v8 = qword_1EB20A608;
      __int16 v9 = 2048;
      uint64_t v10 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass;
      id v4 = "Unknown device class %{public}@ / %lli -- please send a bug report to UniformTypeIdentifiers to add support.";
      unint64_t v5 = v2;
      uint32_t v6 = 22;
LABEL_7:
      _os_log_error_impl(&dword_19B02E000, v5, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v7, v6);
    }
  }
  else if (v3)
  {
    int v7 = 134217984;
    uint64_t v8 = UniformTypeIdentifiers::ModelCode::getDeviceTypeWithModelCode(NSString *,std::optional<UTHardwareColor> const&,UniformTypeIdentifiers::ModelCode::Options)::deviceClass;
    id v4 = "Unknown device class %lli -- please send a bug report to UniformTypeIdentifiers to add support.";
    unint64_t v5 = v2;
    uint32_t v6 = 12;
    goto LABEL_7;
  }
}

void ___ZN22UniformTypeIdentifiers9ModelCodeL3logEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.uti", "modelcode");
  uint64_t v1 = (void *)qword_1EB20A620;
  qword_1EB20A620 = (uint64_t)v0;
}

void sub_19B034E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B034F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B035260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B035394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  for (uint64_t i = 16; i != -8; i -= 8)

  _Unwind_Resume(a1);
}

void sub_19B0354B4(_Unwind_Exception *a1)
{
  BOOL v3 = v2;

  _Unwind_Resume(a1);
}

void sub_19B0359F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::Accessory::log(UniformTypeIdentifiers::Accessory *this)
{
  if (qword_1EB20A658 != -1) {
    dispatch_once(&qword_1EB20A658, &__block_literal_global_1);
  }
  uint64_t v1 = (void *)_MergedGlobals_1;

  return v1;
}

void ___ZN22UniformTypeIdentifiers9AccessoryL3logEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.uti", "accessory");
  uint64_t v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;
}

void sub_19B035B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B035C34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B035C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B035CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B035D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B035EF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0362B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,void *__p,uint64_t a34)
{
  if (__p)
  {
    a34 = (uint64_t)__p;
    operator delete(__p);
  }

  _Block_object_dispose(&a26, 8);
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

void sub_19B03644C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19B03652C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B036594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0365F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0366C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B036734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B036860(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0369B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B036D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_19B036E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19B036F60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19B037000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void UniformTypeIdentifiers::Type::detachTypeRecordsInTypes<NSMutableSet<UTType *> * {__strong}>(void *a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (qword_1EB20A668 != -1) {
    dispatch_once(&qword_1EB20A668, &__block_literal_global_2);
  }
  if (_MergedGlobals_2)
  {
    unint64_t v2 = [v1 count];
    if (v2)
    {
      if (v2 > 0x80)
      {
        v23[0] = 0;
        std::vector<UTTypeRecord *>::vector(__p, v2, v23);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v11 = v1;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v23 count:16];
        if (v12)
        {
          uint64_t v13 = 0;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              unint64_t v16 = (unint64_t)*(id *)(*((void *)&v24 + 1) + 8 * i);
              uint64_t v17 = (void *)v16;
              if ((v16 & 0x8000000000000000) == 0 && [(id)v16 _constantIndex] < 0)
              {
                id v18 = (id)[v17 _typeRecord];
                if (v18) {
                  *((void *)__p[0] + v13++) = v18;
                }
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v23 count:16];
          }
          while (v12);

          if (v13) {
            _UTDetachTypeRecords((uint64_t)__p[0], v13);
          }
        }
        else
        {
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      else
      {
        bzero(v23, 0x400uLL);
        *(_OWORD *)__p = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v3 = v1;
        uint64_t v4 = [v3 countByEnumeratingWithState:__p objects:&v24 count:16];
        if (v4)
        {
          uint64_t v5 = 0;
          uint64_t v6 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v4; ++j)
            {
              if (*(void *)v20 != v6) {
                objc_enumerationMutation(v3);
              }
              unint64_t v8 = (unint64_t)*((id *)__p[1] + j);
              __int16 v9 = (void *)v8;
              if ((v8 & 0x8000000000000000) == 0 && objc_msgSend((id)v8, "_constantIndex", __p[0]) < 0)
              {
                id v10 = (id)[v9 _typeRecord];
                if (v10) {
                  v23[v5++] = (uint64_t)v10;
                }
              }
            }
            uint64_t v4 = [v3 countByEnumeratingWithState:__p objects:&v24 count:16];
          }
          while (v4);

          if (v5) {
            _UTDetachTypeRecords((uint64_t)v23, v5);
          }
        }
        else
        {
        }
      }
    }
  }
}

void sub_19B0372C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_19B037434(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_19B0374D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19B037520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B037568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0375B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B037608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B037704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B037800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0378AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B0379A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B037D24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_19B037E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B037ECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B037FC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::Type::getImportedType(UniformTypeIdentifiers::Type *this, NSString *a2, UTType *a3, NSBundle *a4)
{
  uint64_t v6 = (void *)MEMORY[0x1E4F22490];
  int v7 = [(NSString *)a2 identifier];
  unint64_t v8 = [v6 typeRecordForImportedTypeWithIdentifier:this conformingToIdentifier:v7];

  if (v8)
  {
    __int16 v9 = +[UTType _typeWithTypeRecord:v8 detachTypeRecord:1 findConstant:1];
  }
  else
  {
    id v10 = a3;
    if (!a3)
    {
      id v10 = [MEMORY[0x1E4F28B50] mainBundle];
    }
    __int16 v9 = +[_UTRuntimeConstantType typeWithIdentifier:this bundle:v10 infoPlistKey:*MEMORY[0x1E4F224E8]];
    if (!a3) {
  }
    }

  return v9;
}

void sub_19B03813C(_Unwind_Exception *a1)
{
  if (!v1) {

  }
  _Unwind_Resume(a1);
}

void sub_19B038250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _UTIdentifierGetCanonicalRepresentation(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [v1 maximumLengthOfBytesUsingEncoding:4];
  std::vector<char>::size_type v3 = v2 + 1;
  if (v2 == -1)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void withFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 1024UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/UniformTypeIdentifiers/Framework/UTType.mm:1167:34)]");
    [v10 handleFailureInFunction:v11, @"UTType.mm", 1151, @"Invalid parameter not satisfying: %@", @"count > 0" file lineNumber description];

LABEL_3:
    bzero(&v13, 0x400uLL);
    *(void *)__x = 0;
    if (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v13, v3, __x, 4, 0, 0, objc_msgSend(v1, "length"), 0))
    {
      uint64_t v4 = *(void *)__x;
      if (*(void *)__x)
      {
        uint64_t v5 = &v13;
        do
        {
          LOBYTE(v5->__begin_) = __tolower(LOBYTE(v5->__begin_));
          uint64_t v5 = (std::vector<char> *)((char *)v5 + 1);
          --v4;
        }
        while (v4);
        uint64_t v4 = *(void *)__x;
      }
      uint64_t v6 = (void *)[[NSString alloc] initWithBytes:&v13 length:v4 encoding:4];
    }
    else
    {
      uint64_t v6 = 0;
    }
    goto LABEL_18;
  }
  if (v3 <= 0x400) {
    goto LABEL_3;
  }
  __x[0] = 0;
  std::vector<char>::vector(&v13, v3, __x);
  *(void *)__x = 0;
  if (objc_msgSend(v1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13.__begin_, v3, __x, 4, 0, 0, objc_msgSend(v1, "length"), 0))
  {
    uint64_t v8 = *(void *)__x;
    std::vector<char>::pointer begin = v13.__begin_;
    if (*(void *)__x)
    {
      do
      {
        uint64_t *begin = __tolower(*begin);
        ++begin;
        --v8;
      }
      while (v8);
      uint64_t v8 = *(void *)__x;
      std::vector<char>::pointer begin = v13.__begin_;
    }
    uint64_t v6 = (void *)[[NSString alloc] initWithBytes:begin length:v8 encoding:4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v13.__begin_)
  {
    v13.__end_ = v13.__begin_;
    operator delete(v13.__begin_);
  }
LABEL_18:

  return v6;
}

void sub_19B038584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  _Unwind_Resume(a1);
}

void sub_19B0387C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *std::vector<UTTypeRecord *>::vector(void *a1, unint64_t a2, uint64_t *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2 >> 61) {
    std::vector<UTTypeRecord *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v6 = 8 * a2;
  int v7 = operator new(8 * a2);
  *a1 = v7;
  a1[1] = v7;
  uint64_t v8 = &v7[a2];
  a1[2] = v8;
  uint64_t v9 = *a3;
  do
  {
    *v7++ = v9;
    v6 -= 8;
  }
  while (v6);
  a1[1] = v8;
  return a1;
}

void sub_19B038894(_Unwind_Exception *exception_object)
{
  std::vector<char>::size_type v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<UTTypeRecord *>::__throw_length_error[abi:ne180100]()
{
}

void __clang_call_terminate(void *a1)
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_19B038924(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

std::vector<char> *__cdecl std::vector<char>::vector(std::vector<char> *this, std::vector<char>::size_type __n, const std::vector<char>::value_type *__x)
{
  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if ((__n & 0x8000000000000000) != 0) {
    std::vector<UTTypeRecord *>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v6 = (char *)operator new(__n);
  this->__begin_ = v6;
  this->__end_ = v6;
  int v7 = &v6[__n];
  this->__end_cap_.__value_ = &v6[__n];
  memset(v6, *(unsigned __int8 *)__x, __n);
  this->__end_ = v7;
  return this;
}

void sub_19B038A0C(_Unwind_Exception *exception_object)
{
  std::vector<char>::size_type v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_19B038F04(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

id UniformTypeIdentifiers::CoreTypes::log(UniformTypeIdentifiers::CoreTypes *this)
{
  if (qword_1EB20A698 != -1) {
    dispatch_once(&qword_1EB20A698, &__block_literal_global_793);
  }
  uint64_t v1 = (void *)qword_1EB20A690;

  return v1;
}

void __UNIFORM_TYPE_IDENTIFIERS_FAILED_TO_REALIZE_A_COMPILE_TIME_CONSTANT_TYPE_OBJECT__(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[2];
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    uint64_t v4 = UniformTypeIdentifiers::CoreTypes::log((UniformTypeIdentifiers::CoreTypes *)isKindOfClass);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      std::vector<char> v13 = a1;
      __int16 v14 = 2114;
      uint64_t v15 = v2;
      _os_log_error_impl(&dword_19B02E000, v4, OS_LOG_TYPE_ERROR, "Failed to realize static UTType instance %p for identifier %{public}@. Please file a bug. The type should be present in Core Types.", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = (UniformTypeIdentifiers::CoreTypes *)dladdr(a1, &__s);
    if (v5 && __s.dli_fname)
    {
      uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
      int v7 = [v6 stringWithFileSystemRepresentation:__s.dli_fname length:strlen(__s.dli_fname)];

      uint64_t v8 = [v7 lastPathComponent];
      uint64_t v9 = [v7 stringByDeletingLastPathComponent];
      id v10 = UniformTypeIdentifiers::CoreTypes::log(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218754;
        std::vector<char> v13 = a1;
        __int16 v14 = 2114;
        uint64_t v15 = v2;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        __int16 v18 = 2114;
        uint64_t v19 = v8;
        _os_log_error_impl(&dword_19B02E000, v10, OS_LOG_TYPE_ERROR, "Failed to realize static UTType instance %p for identifier %{public}@. The type was defined in the binary %@/%{public}@. If that is an Apple binary, please file a bug.", buf, 0x2Au);
      }
    }
    else
    {
      int v7 = UniformTypeIdentifiers::CoreTypes::log(v5);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        std::vector<char> v13 = a1;
        __int16 v14 = 2114;
        uint64_t v15 = v2;
        _os_log_error_impl(&dword_19B02E000, v7, OS_LOG_TYPE_ERROR, "Failed to realize static UTType instance %p for identifier %{public}@. The faulting component was unknown at runtime.", buf, 0x16u);
      }
    }
  }
}

void sub_19B039228(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN22UniformTypeIdentifiers9CoreTypesL3logEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.uti", "static");
  uint64_t v1 = (void *)qword_1EB20A690;
  qword_1EB20A690 = (uint64_t)v0;
}

id _typeIdentifierFromUTType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 identifier];
  if (![v2 length])
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString *_typeIdentifierFromUTType(UTType *__strong)"];
    [v4 handleFailureInFunction:v5, @"NSItemProvider+UTType.m", 17, @"Content type %@ has an invalid type identifier.", v1 file lineNumber description];
  }

  return v2;
}

id _utTypesFromTypeIdentifiers(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    uint64_t v8 = MEMORY[0x1E4F14500];
    *(void *)&long long v5 = 138543362;
    long long v13 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = +[UTType _typeWithIdentifier:allowUndeclared:](UTType, "_typeWithIdentifier:allowUndeclared:", v10, 1, v13, (void)v14);
        if (v11)
        {
          [v2 addObject:v11];
        }
        else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v13;
          uint64_t v19 = v10;
          _os_log_error_impl(&dword_19B02E000, v8, OS_LOG_TYPE_ERROR, "NSItemProvider contains an invalid type identifier “%{public}@” which will be ignored.", buf, 0xCu);
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  return v2;
}

void _UTSetRuntimeIssueCatcher(uint64_t a1)
{
  if (qword_1EB20A6B8 != -1) {
    dispatch_once(&qword_1EB20A6B8, &__block_literal_global_4);
  }
  uint64_t v2 = MEMORY[0x19F3879E0](a1);
  id v3 = (void *)qword_1EB20A6A8;
  qword_1EB20A6A8 = v2;
}

void __UNIFORM_TYPE_IDENTIFIER_WAS_NOT_DECLARED_IN_INFO_PLIST_OF_BUNDLE__(uint64_t a1, int a2, void *a3, int a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v8 = v7;
  }
  uint64_t v9 = UniformTypeIdentifiers::RuntimeIssues::runtimeIssueLog(v7);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_FAULT);
  if (a4 == 2)
  {
    if (v10)
    {
      if (a2) {
        id v11 = "exported";
      }
      else {
        id v11 = "imported";
      }
      uint64_t v12 = [(UniformTypeIdentifiers::RuntimeIssues *)v8 bundleURL];
      uint64_t v13 = [v12 lastPathComponent];
      long long v14 = (void *)v13;
      if (a2) {
        long long v15 = "imported";
      }
      else {
        long long v15 = "exported";
      }
      int v19 = 138544130;
      uint64_t v20 = a1;
      __int16 v21 = 2082;
      long long v22 = v11;
      __int16 v23 = 2114;
      uint64_t v24 = v13;
      __int16 v25 = 2082;
      long long v26 = v15;
      _os_log_fault_impl(&dword_19B02E000, v9, OS_LOG_TYPE_FAULT, "Type \"%{public}@\" was expected to be %{public}s in the Info.plist of %{public}@, but it was %{public}s instead.", (uint8_t *)&v19, 0x2Au);
    }
  }
  else if (v10)
  {
    if (a2) {
      long long v16 = "exported";
    }
    else {
      long long v16 = "imported";
    }
    long long v17 = [(UniformTypeIdentifiers::RuntimeIssues *)v8 bundleURL];
    __int16 v18 = [v17 lastPathComponent];
    int v19 = 138543874;
    uint64_t v20 = a1;
    __int16 v21 = 2082;
    long long v22 = v16;
    __int16 v23 = 2114;
    uint64_t v24 = (uint64_t)v18;
    _os_log_fault_impl(&dword_19B02E000, v9, OS_LOG_TYPE_FAULT, "Type \"%{public}@\" was expected to be declared and %{public}s in the Info.plist of %{public}@, but it was not found.", (uint8_t *)&v19, 0x20u);
  }
}

void sub_19B03AC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id UniformTypeIdentifiers::RuntimeIssues::runtimeIssueLog(UniformTypeIdentifiers::RuntimeIssues *this)
{
  if (qword_1EB20A6C8 != -1) {
    dispatch_once(&qword_1EB20A6C8, &__block_literal_global_6);
  }
  id v1 = (void *)qword_1EB20A6C0;

  return v1;
}

void _ZZZ25_UTSetRuntimeIssueCatcherEUb_EN3__08__invokeEP28os_log_fault_callback_info_s(UniformTypeIdentifiers::RuntimeIssues *a1)
{
  id v1 = a1;
  if (off_1EB20A6B0) {
    a1 = (UniformTypeIdentifiers::RuntimeIssues *)off_1EB20A6B0(a1);
  }
  if (qword_1EB20A6A8)
  {
    uint64_t v2 = (void *)*((void *)v1 + 1);
    id v3 = UniformTypeIdentifiers::RuntimeIssues::runtimeIssueLog(a1);

    if (v2 == v3)
    {
      uint64_t v4 = qword_1EB20A6A8;
      uint64_t v5 = *((void *)v1 + 5);
      if (v5)
      {
        uint64_t v6 = [NSString stringWithUTF8String:v5];
      }
      else
      {
        uint64_t v6 = @"?";
      }
      uint64_t v7 = v6;
      (*(void (**)(uint64_t))(v4 + 16))(v4);
      if (v5)
      {
      }
    }
  }
}

void sub_19B03ADC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (v10) {

  }
  _Unwind_Resume(exception_object);
}

void ___ZN22UniformTypeIdentifiers13RuntimeIssuesL15runtimeIssueLogEv_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.runtime-issues", "Type Declaration Issues");
  id v1 = (void *)qword_1EB20A6C0;
  qword_1EB20A6C0 = (uint64_t)v0;
}

uint64_t _UTHardwareColorMakeWithRGBComponents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (a2 << 40) | (a3 << 48) | (a1 << 32);
}

uint64_t _UTHardwareColorMakeWithIndex(uint64_t a1)
{
  return (a1 << 32) | 1;
}

BOOL _UTHardwareColorsAreEqual(uint64_t a1, uint64_t a2)
{
  if (a1 != a2) {
    return 0;
  }
  if (a1 != 1)
  {
    if (!(_BYTE)a1) {
      return WORD2(a1) == WORD2(a2) && BYTE6(a1) == BYTE6(a2);
    }
    return 0;
  }
  return HIDWORD(a1) == HIDWORD(a2);
}

id _UTHardwareColorGetDebugDescription(unint64_t a1)
{
  unint64_t v1 = HIBYTE(a1);
  if (a1 == 1)
  {
    uint64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<indexed hardware color> { %li }", (v1 << 24) | (BYTE6(a1) << 16) | (BYTE5(a1) << 8) | BYTE4(a1), v4, v5);
  }
  else if ((_BYTE)a1)
  {
    uint64_t v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<hardware color type %u> { %016llx }", a1, a1 | ((unint64_t)((v1 << 24) | (BYTE6(a1) << 16) | (BYTE5(a1) << 8) | BYTE4(a1)) << 32), v5);
  }
  else
  {
    uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"<RGB hardware color> { r = %u, g = %u, b = %u }", BYTE4(a1), BYTE5(a1), BYTE6(a1)];
  }

  return v2;
}

void sub_19B03B0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B03B4E4(_Unwind_Exception *a1)
{
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

void sub_19B03B650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_19B03B7A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_19B03B8F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

Boolean UTTypeIsDynamic(CFStringRef inUTI)
{
  return MEMORY[0x1F40DEE78](inUTI);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFExtensionIsValidToAppend()
{
  return MEMORY[0x1F40D8DC0]();
}

uint64_t _CFGetPathExtensionRangesFromPathComponent()
{
  return MEMORY[0x1F40D8DE8]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1F40D9490]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

uint64_t _UTTypeCopyDescriptionLocalizationDictionary()
{
  return MEMORY[0x1F40DEED8]();
}

uint64_t _UTTypeCopyKindStringDictionaryForNonMaterializedItem()
{
  return MEMORY[0x1F40DEEF0]();
}

uint64_t _UTTypeCopyKindStringForNonMaterializedItem()
{
  return MEMORY[0x1F40DEEF8]();
}

uint64_t _UTTypeCreateDynamicIdentifierForTaggedPointerObject()
{
  return MEMORY[0x1F40DEF08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1F40C9E38]();
}

uint64_t _objc_registerTaggedPointerClass()
{
  return MEMORY[0x1F4181438]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x1F41814E8](cls, outCount);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1F4181510](cls, extraBytes);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1F4181530](cls);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1F4181538](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1F4181558](cls);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1F40CBE68]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CBE70]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1F41815B8](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1F41815C0](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1F41815C8](v);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

uint64_t os_log_set_fault_callback()
{
  return MEMORY[0x1F40CD388]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1F40CD5F0](lock);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2C0](__str, __endptr, *(void *)&__base);
}
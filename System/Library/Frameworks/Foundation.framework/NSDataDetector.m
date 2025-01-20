@interface NSDataDetector
+ (BOOL)supportsSecureCoding;
+ (NSDataDetector)dataDetectorWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (NSDataDetector)initWithCoder:(id)a3;
- (NSDataDetector)initWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (NSDataDetector)initWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error;
- (NSTextCheckingTypes)checkingTypes;
- (id)description;
- (id)pattern;
- (unint64_t)numberOfCaptureGroups;
- (unint64_t)options;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateMatchesInString:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 usingBlock:(id)a6;
@end

@implementation NSDataDetector

- (void)enumerateMatchesInString:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 usingBlock:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  __int16 v9 = a4;
  v80[1] = *(CFTypeRef *)MEMORY[0x1E4F143B8];
  unint64_t v13 = [a3 length];
  __int16 v61 = [(NSDataDetector *)self checkingTypes];
  char v75 = 0;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  char v74 = 0;
  uint64_t v67 = 0;
  v68 = &v67;
  uint64_t v69 = 0x2020000000;
  NSUInteger v62 = location;
  NSUInteger v70 = location;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __68__NSDataDetector_enumerateMatchesInString_options_range_usingBlock___block_invoke;
  v64[3] = &unk_1E51FBC20;
  BOOL v65 = (v9 & 4) != 0;
  char v66 = v9 & 1;
  v64[4] = a6;
  v64[5] = &v67;
  v59 = (void (**)(id, NSLinkCheckingResult *, void, char *))a6;
  v64[6] = &v71;
  id v60 = a3;
  if (!a3)
  {
    v51 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v51);
  }
  if (v13 < length || location > v13 - length)
  {
    v52 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range or index out of bounds", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v52);
  }
  int v14 = 0;
  internal = self->super._internal;
  atomic_compare_exchange_strong(&self->super._checkout, (unsigned int *)&v14, 1u);
  BOOL v58 = v14 == 0;
  v56 = self;
  if (v14) {
    internal = (void *)off_1EB1EDC80((v61 & 0x1818) == 0, 1, 0);
  }
  if (!internal)
  {
    int v47 = 0;
    int v16 = 0;
    if ((v9 & 2) == 0) {
      goto LABEL_129;
    }
    goto LABEL_121;
  }
  if ((v9 & 5) != 0) {
    off_1EB1EDC88(internal, v64);
  }
  int v16 = 0;
  if (off_1EB1EDC90(internal, a3, location, length))
  {
    char v17 = 0;
    if (!v75)
    {
      char v17 = 0;
      NSUInteger v63 = location + length;
      while (1)
      {
        if (*((unsigned char *)v72 + 24))
        {
LABEL_114:
          int v16 = 0;
          goto LABEL_117;
        }
        if (off_1EB1EDC98)
        {
          CFArrayRef v18 = (const __CFArray *)off_1EB1EDC98(internal, 3);
        }
        else if (off_1EB1EDCA0)
        {
          CFArrayRef v18 = (const __CFArray *)off_1EB1EDCA0(internal, 1);
        }
        else
        {
          if (!off_1EB1EDCA8) {
            goto LABEL_116;
          }
          CFArrayRef v18 = (const __CFArray *)off_1EB1EDCA8(internal);
        }
        CFArrayRef v19 = v18;
        if (!v18)
        {
LABEL_116:
          int v16 = 1;
          goto LABEL_117;
        }
        if (CFArrayGetCount(v18) < 1)
        {
          CFRelease(v19);
          goto LABEL_116;
        }
        ValueAtIndex = CFArrayGetValueAtIndex(v19, 0);
        uint64_t v21 = off_1EB1EDCB0(ValueAtIndex);
        NSUInteger v23 = v21 + v22;
        if (v63 == v21 + v22) {
          char v17 = 1;
        }
        if ((v9 & 4) == 0 || v21 <= v68[3])
        {
          uint64_t v24 = off_1EB1EDCB0(ValueAtIndex);
          uint64_t v26 = v25;
          uint64_t v27 = off_1EB1EDCD8(ValueAtIndex);
          if (v27 != -1 && v28 >= 1)
          {
            uint64_t v29 = v27 + v28 <= v24 + v26 ? v28 : v26;
            uint64_t v30 = v27 + v28 <= v24 + v26 ? v27 : v24;
            if (v27 >= v24)
            {
              uint64_t v26 = v29;
              uint64_t v24 = v30;
            }
          }
          if (v24 >= v62 && v24 + v26 <= v63) {
            break;
          }
        }
LABEL_106:
        CFRelease(v19);
        if (v75) {
          goto LABEL_114;
        }
        v68[3] = v23;
        if (v63 <= v23) {
          goto LABEL_114;
        }
        int v16 = 0;
        if (!off_1EB1EDC90(internal, v60, v23, v63 - v23) || v75) {
          goto LABEL_117;
        }
      }
      v31 = (void *)off_1EB1EDCD0(ValueAtIndex);
      if ((v61 & 0x20) != 0
        && (!off_1EB1EDCF8
          ? (cf = (void *)off_1EB1EDCF0(ValueAtIndex))
          : (cf = (void *)off_1EB1EDCF8(ValueAtIndex, 0)),
            cf))
      {
        if (([@"PhoneNumber" isEqualToString:v31] & 1) == 0
          && ([@"QuotedShortPhoneNumber" isEqualToString:v31] & 1) == 0
          && ([@"UnquotedShortPhoneNumber" isEqualToString:v31] & 1) == 0)
        {
          v34 = (NSLinkCheckingResult *)[MEMORY[0x1E4F1CB10] URLWithString:cf];
          if (v34
            || (v34 = (NSLinkCheckingResult *)objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", (id)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)objc_msgSend(cf, "stringByReplacingPercentEscapesUsingEncoding:", 4), @"#", 0, 0x8000100u))) != 0)
          {
            v34 = -[NSLinkCheckingResult initWithRange:URL:]([NSLinkCheckingResult alloc], "initWithRange:URL:", v24, v26, v34);
          }
LABEL_100:
          CFRelease(cf);
LABEL_101:
          if (v34)
          {
            if ((v9 & 0x2000) != 0) {
              v46 = 0;
            }
            else {
              v46 = v34;
            }
            v59[2](v59, v46, 4 * (v17 & 1u), &v75);
          }
          goto LABEL_106;
        }
        char v55 = 0;
      }
      else
      {
        cf = 0;
        char v55 = 1;
      }
      if ((v61 & 0x10) != 0
        && (([@"FullAddress" isEqualToString:v31] & 1) != 0
         || [@"SignatureBlock" isEqualToString:v31]))
      {
        v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        addAddressResultsToComponents((uint64_t)ValueAtIndex, v32);
        if ([v32 count])
        {
          v33 = [NSAddressCheckingResult alloc];
          goto LABEL_56;
        }
        goto LABEL_67;
      }
      if ((v61 & 0x1000) != 0 && [@"FlightInformation" isEqualToString:v31])
      {
        v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        addAddressResultsToComponents((uint64_t)ValueAtIndex, v32);
        if ([v32 count])
        {
          v33 = [NSTransitInformationCheckingResult alloc];
LABEL_56:
          v34 = -[NSAddressCheckingResult initWithRange:components:underlyingResult:](v33, "initWithRange:components:underlyingResult:", v24, v26, v32, ValueAtIndex);
          goto LABEL_99;
        }
        goto LABEL_67;
      }
      if ((v61 & 0x800) != 0 && [@"PhoneNumber" isEqualToString:v31])
      {
        v80[0] = 0;
        if (off_1EB1EDD10 && off_1EB1EDD10(ValueAtIndex, v80, 0) && v80[0]
          || (v35 = (const void *)off_1EB1EDCE8(ValueAtIndex), (v80[0] = v35) != 0) && (CFRetain(v35), v80[0]))
        {
          CFTypeID TypeID = CFStringGetTypeID();
          if (TypeID == CFGetTypeID(v80[0]))
          {
            v37 = [NSPhoneNumberCheckingResult alloc];
            v34 = -[NSPhoneNumberCheckingResult initWithRange:phoneNumber:underlyingResult:](v37, "initWithRange:phoneNumber:underlyingResult:", v24, v26, v80[0], ValueAtIndex);
          }
          else
          {
            v34 = 0;
          }
          CFTypeRef v45 = v80[0];
          if (v80[0]) {
LABEL_98:
          }
            CFRelease(v45);
LABEL_99:
          if (v55) {
            goto LABEL_101;
          }
          goto LABEL_100;
        }
      }
      else if ((v61 & 8) != 0 {
             && (([@"Date" isEqualToString:v31] & 1) != 0
      }
              || ([@"Time" isEqualToString:v31] & 1) != 0
              || ([@"DateTime" isEqualToString:v31] & 1) != 0
              || ([@"DateDuration" isEqualToString:v31] & 1) != 0
              || ([@"TimeDuration" isEqualToString:v31] & 1) != 0
              || [@"Timestamp" isEqualToString:v31]))
      {
        CFTypeRef v79 = 0;
        v80[0] = 0;
        v77 = 0;
        CFTypeRef v78 = 0;
        uint64_t v54 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v38 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
        char v76 = 0;
        [v31 rangeOfString:@"Duration"];
        if (!v39 || !off_1EB1EDD08(ValueAtIndex, v80, &v78, &v79, &v77, &v76, v54, v38)) {
          off_1EB1EDD00(ValueAtIndex, v54, v38, &v76, v80, &v78);
        }
        CFTypeRef v40 = v80[0];
        double v41 = 0.0;
        if (v80[0] && v79)
        {
          double v42 = MEMORY[0x185304BC0]();
          double v41 = v42 - MEMORY[0x185304BC0](v80[0]);
          CFTypeRef v40 = v80[0];
        }
        if (v40)
        {
          v43 = [NSDateCheckingResult alloc];
          if (v78) {
            CFTypeRef v44 = v78;
          }
          else {
            CFTypeRef v44 = v77;
          }
          LOWORD(v53) = v76 == 0;
          v34 = [(NSDateCheckingResult *)v43 initWithRange:v24 date:v26 timeZone:v80[0] duration:v44 referenceDate:v54 underlyingResult:ValueAtIndex timeIsSignificant:v41 timeIsApproximate:v53];
          if (v80[0]) {
            CFRelease(v80[0]);
          }
        }
        else
        {
          v34 = 0;
        }
        if (v78) {
          CFRelease(v78);
        }
        if (v79) {
          CFRelease(v79);
        }
        CFTypeRef v45 = v77;
        if (v77) {
          goto LABEL_98;
        }
        goto LABEL_99;
      }
LABEL_67:
      v34 = 0;
      goto LABEL_99;
    }
  }
  else
  {
    char v17 = 0;
  }
LABEL_117:
  if ((v9 & 1) != 0 || (v9 & 4) != 0) {
    off_1EB1EDC88(internal, 0);
  }
  int v47 = v17 & 1;
  if ((v9 & 2) != 0)
  {
LABEL_121:
    if (!v75 && !*((unsigned char *)v72 + 24))
    {
      BOOL v48 = v47 == 0;
      uint64_t v49 = 2;
      if (!v48) {
        uint64_t v49 = 6;
      }
      if (v16) {
        uint64_t v50 = v49 | 0x10;
      }
      else {
        uint64_t v50 = v49;
      }
      v59[2](v59, 0, v50, &v75);
    }
  }
LABEL_129:
  if (internal)
  {
    if (v58)
    {
      off_1EB1EDCC8(internal);
      atomic_fetch_and(&v56->super._checkout, 0);
    }
    else
    {
      CFRelease(internal);
    }
  }
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
}

- (NSTextCheckingTypes)checkingTypes
{
  return self->_types;
}

- (NSDataDetector)initWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((checkingTypes & 0x1838) == 0)
  {
    int v14 = +[NSString stringWithFormat:@"%@: no data detector types specified", _NSMethodExceptionProem((objc_class *)self, a2)];

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v14 userInfo:0]);
  }
  v15.receiver = self;
  v15.super_class = (Class)NSDataDetector;
  v7 = [(NSDataDetector *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v7->_types = checkingTypes;
    qword_1EB1EDCC0 = (uint64_t)_NSFaultInObject(&qword_1EB1EDCC0, 0, (uint64_t)&__block_literal_global_72);
    [(id)qword_1EB1EDCC0 lock];
    if ((_MergedGlobals_146 & 1) == 0)
    {
      __int16 v9 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/DataDetectorsCore.framework/DataDetectorsCore" fileSystemRepresentation], 256);
      qword_1EB1EDCB8 = (uint64_t)v9;
      if (v9)
      {
        off_1EB1EDC80 = (uint64_t (*)(void, void, void))dlsym(v9, "DDScannerCreate");
        off_1EB1EDCC8 = (uint64_t (*)(void))dlsym((void *)qword_1EB1EDCB8, "DDScannerReset");
        off_1EB1EDC90 = (uint64_t (*)(void, void, void, void))dlsym((void *)qword_1EB1EDCB8, "DDScannerScanStringWithRange");
        off_1EB1EDC88 = (uint64_t (*)(void, void))dlsym((void *)qword_1EB1EDCB8, "DDScannerSetProgressReportingBlock");
        off_1EB1EDCA8 = (uint64_t (*)(void))dlsym((void *)qword_1EB1EDCB8, "DDScannerCopyResults");
        off_1EB1EDCA0 = (uint64_t (*)(void, void))dlsym((void *)qword_1EB1EDCB8, "DDScannerCopyResultsCheckOverlap");
        off_1EB1EDC98 = (uint64_t (*)(void, void))dlsym((void *)qword_1EB1EDCB8, "DDScannerCopyResultsWithOptions");
        off_1EB1EDCD0 = (uint64_t (*)(void))dlsym((void *)qword_1EB1EDCB8, "DDResultGetType");
        off_1EB1EDCB0 = (uint64_t (*)(void))dlsym((void *)qword_1EB1EDCB8, "DDResultGetRange");
        off_1EB1EDCD8 = (uint64_t (*)(void))dlsym((void *)qword_1EB1EDCB8, "DDResultGetRangeForURLification");
        off_1EB1EDCE0 = (uint64_t (*)(void))dlsym((void *)qword_1EB1EDCB8, "DDResultGetSubResults");
        off_1EB1EDCE8 = (uint64_t (*)(void))dlsym((void *)qword_1EB1EDCB8, "DDResultGetValue");
        *(void *)&xmmword_1EB1EDCF0 = dlsym((void *)qword_1EB1EDCB8, "DDResultCopyExtractedURL");
        *((void *)&xmmword_1EB1EDCF0 + 1) = dlsym((void *)qword_1EB1EDCB8, "DDResultCopyExtractedURLWithOptions");
        off_1EB1EDD00 = (uint64_t (*)(void, void, void, void, void, void))dlsym((void *)qword_1EB1EDCB8, "DDResultCopyExtractedDateFromReferenceDate");
        off_1EB1EDD08 = (uint64_t (*)(void, void, void, void, void, void, void, void))dlsym((void *)qword_1EB1EDCB8, "DDResultCopyExtractedStartDateEndDate");
        off_1EB1EDD10 = (uint64_t (*)(void, void, void))dlsym((void *)qword_1EB1EDCB8, "DDResultCopyPhoneValue");
      }
      BOOL v10 = 0;
      _MergedGlobals_146 = 1;
      if (off_1EB1EDC80)
      {
        if (off_1EB1EDCC8)
        {
          if (off_1EB1EDC90)
          {
            if (off_1EB1EDC88)
            {
              BOOL v10 = 0;
              if ((unint64_t)off_1EB1EDCA8 | (unint64_t)off_1EB1EDCA0 | (unint64_t)off_1EB1EDC98)
              {
                if (off_1EB1EDCD0)
                {
                  if (off_1EB1EDCB0)
                  {
                    if (off_1EB1EDCD8)
                    {
                      if (off_1EB1EDCE0)
                      {
                        if (off_1EB1EDCE8)
                        {
                          BOOL v10 = 0;
                          if (xmmword_1EB1EDCF0 != 0)
                          {
                            if (off_1EB1EDD00) {
                              BOOL v10 = off_1EB1EDD08 != 0;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      byte_1EB1EDC79 = v10;
    }
    [(id)qword_1EB1EDCC0 unlock];
    int v11 = byte_1EB1EDC79;
    if (byte_1EB1EDC79)
    {
      uint64_t v12 = off_1EB1EDC80((checkingTypes & 0x1818) == 0, 1, error);
      v8->super._internal = (void *)v12;
      if (v12) {
        return v8;
      }
    }
    else if (v8->super._internal)
    {
      return v8;
    }
    if (error && !v11) {
      *error = +[NSError errorWithDomain:@"NSCocoaErrorDomain" code:256 userInfo:0];
    }
    [(NSDataDetector *)v8 dealloc];
    return 0;
  }
  return v8;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

+ (NSDataDetector)dataDetectorWithTypes:(NSTextCheckingTypes)checkingTypes error:(NSError *)error
{
  v4 = (void *)[objc_alloc((Class)a1) initWithTypes:checkingTypes error:error];

  return (NSDataDetector *)v4;
}

- (NSDataDetector)initWithPattern:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v6 = +[NSString stringWithFormat:@"%@: Not valid for NSDataDetector", _NSMethodExceptionProem((objc_class *)self, a2)];

  objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
}

- (void)encodeWithCoder:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  NSTextCheckingTypes v4 = [(NSDataDetector *)self checkingTypes];
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInt64:v4 forKey:@"NSCheckingTypes"];
  }
  else
  {
    v5[0] = v4;
    [a3 encodeValueOfObjCType:"Q" at:v5];
  }
}

- (NSDataDetector)initWithCoder:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if ([a3 allowsKeyedCoding])
  {
    uint64_t v6 = [a3 decodeInt64ForKey:@"NSCheckingTypes"];
    return [(NSDataDetector *)self initWithTypes:v6 error:0];
  }
  v11[0] = 0;
  uint64_t v7 = [a3 versionForClassName:@"NSDataDetector"];
  if (v7 == 1)
  {
    [a3 decodeValueOfObjCType:"Q" at:v11 size:8];
    uint64_t v6 = v11[0];
    return [(NSDataDetector *)self initWithTypes:v6 error:0];
  }
  uint64_t v9 = v7;
  BOOL v10 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)@"%@: class version %ld cannot read instances archived with version %ld", v10, 1, v9);
  [(NSDataDetector *)self dealloc];
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSTextCheckingTypes v5 = [(NSDataDetector *)self checkingTypes];
  return v5 == [a3 checkingTypes];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  internal = self->super._internal;
  if (internal)
  {
    CFRelease(internal);
    self->super._internal = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSDataDetector;
  [(NSRegularExpression *)&v4 dealloc];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSDataDetector;
  return +[NSString stringWithFormat:@"%@ 0x%llx", [(NSRegularExpression *)&v3 description], self->_types];
}

- (id)pattern
{
  return 0;
}

- (unint64_t)options
{
  return 0;
}

- (unint64_t)numberOfCaptureGroups
{
  return 1;
}

uint64_t __68__NSDataDetector_enumerateMatchesInString_options_range_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 56) && *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < a2 >> 32) {
    return 0;
  }
  uint64_t v2 = 1;
  if (*(unsigned char *)(a1 + 57)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return v2;
}

@end
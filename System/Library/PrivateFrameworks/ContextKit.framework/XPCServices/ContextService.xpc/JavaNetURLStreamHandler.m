@interface JavaNetURLStreamHandler
+ (const)__metadata;
+ (id)__annotations_setURLWithJavaNetURL_withNSString_withNSString_withInt_withNSString_withNSString_;
+ (id)relativePathWithNSString:(id)a3 withNSString:(id)a4;
- (BOOL)equalsWithJavaNetURL:(id)a3 withJavaNetURL:(id)a4;
- (BOOL)hostsEqualWithJavaNetURL:(id)a3 withJavaNetURL:(id)a4;
- (BOOL)sameFileWithJavaNetURL:(id)a3 withJavaNetURL:(id)a4;
- (id)getHostAddressWithJavaNetURL:(id)a3;
- (id)openConnectionWithJavaNetURL:(id)a3;
- (id)openConnectionWithJavaNetURL:(id)a3 withJavaNetProxy:(id)a4;
- (id)toExternalFormWithJavaNetURL:(id)a3;
- (id)toExternalFormWithJavaNetURL:(id)a3 withBoolean:(BOOL)a4;
- (int)getDefaultPort;
- (int)hashCodeWithJavaNetURL:(id)a3;
- (void)parseURLWithJavaNetURL:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6;
- (void)setURLWithJavaNetURL:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withNSString:(id)a7 withNSString:(id)a8;
- (void)setURLWithJavaNetURL:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9 withNSString:(id)a10 withNSString:(id)a11;
@end

@implementation JavaNetURLStreamHandler

- (id)openConnectionWithJavaNetURL:(id)a3
{
  return 0;
}

- (id)openConnectionWithJavaNetURL:(id)a3 withJavaNetProxy:(id)a4
{
  v4 = new_JavaLangUnsupportedOperationException_init();
  objc_exception_throw(v4);
}

- (void)parseURLWithJavaNetURL:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  if (!a3) {
    goto LABEL_33;
  }
  v7 = self;
  if (*((JavaNetURLStreamHandler **)a3 + 1) != self)
  {
    v45 = new_JavaLangSecurityException_initWithNSString_(@"Only a URL's stream handler is permitted to mutate it");
    goto LABEL_39;
  }
  uint64_t v8 = *(void *)&a6;
  uint64_t FirstOfWithNSString_withNSString_withInt_withInt = *(void *)&a5;
  if (a6 < a5)
  {
    v45 = new_JavaLangStringIndexOutOfBoundsException_initWithNSString_withInt_withInt_(a4);
    goto LABEL_39;
  }
  if (!a4) {
LABEL_33:
  }
    JreThrowNullPointerException();
  if (![a4 regionMatches:*(void *)&a5 aString:@"//" otherOffset:0 count:2])
  {
    id v57 = [a3 getAuthority];
    id v56 = [a3 getUserInfo];
    CFStringRef v15 = (const __CFString *)[a3 getHost];
    if (v15) {
      CFStringRef v16 = v15;
    }
    else {
      CFStringRef v16 = &stru_10048C1F8;
    }
    CFStringRef v55 = v16;
    uint64_t v17 = (uint64_t)[a3 getPort];
    v18 = (__CFString *)[a3 getPath];
    id v19 = [a3 getQuery];
    id v20 = [a3 getRef];
    goto LABEL_19;
  }
  uint64_t v11 = (FirstOfWithNSString_withNSString_withInt_withInt + 2);
  uint64_t FirstOfWithNSString_withNSString_withInt_withInt = LibcoreNetUrlUrlUtils_findFirstOfWithNSString_withNSString_withInt_withInt_(a4, @"/?#", v11, v8);
  id v12 = [a4 substring:v11 endIndex:FirstOfWithNSString_withNSString_withInt_withInt];
  uint64_t v13 = LibcoreNetUrlUrlUtils_findFirstOfWithNSString_withNSString_withInt_withInt_(a4, @"@", v11, FirstOfWithNSString_withNSString_withInt_withInt);
  if (v13 == FirstOfWithNSString_withNSString_withInt_withInt)
  {
    id v14 = 0;
  }
  else
  {
    int v21 = v13;
    id v14 = [a4 substring:v11 endIndex:v13];
    uint64_t v11 = (v21 + 1);
  }
  uint64_t v22 = LibcoreNetUrlUrlUtils_findFirstOfWithNSString_withNSString_withInt_withInt_(a4, @"]", v11, FirstOfWithNSString_withNSString_withInt_withInt);
  uint64_t v23 = v11;
  if (v22 != FirstOfWithNSString_withNSString_withInt_withInt)
  {
    uint64_t v24 = v22;
    int v25 = LibcoreNetUrlUrlUtils_findFirstOfWithNSString_withNSString_withInt_withInt_(a4, @":", v11, v22);
    uint64_t v23 = v24;
    if (v25 == v24)
    {
      [a4 substring:v11 endIndex:(v24 + 1)];
      CFStringRef v53 = JreStrcat("$$", v46, v47, v48, v49, v50, v51, v52, @"Expected an IPv6 address: ");
LABEL_38:
      v45 = new_JavaLangIllegalArgumentException_initWithNSString_((uint64_t)v53);
LABEL_39:
      objc_exception_throw(v45);
    }
  }
  uint64_t v26 = LibcoreNetUrlUrlUtils_findFirstOfWithNSString_withNSString_withInt_withInt_(a4, @":", v23, FirstOfWithNSString_withNSString_withInt_withInt);
  id v56 = v14;
  id v57 = v12;
  CFStringRef v55 = (const __CFString *)[a4 substring:v11 endIndex:v26];
  if ((int)v26 + 1 >= (int)FirstOfWithNSString_withNSString_withInt_withInt)
  {
    v18 = 0;
    id v19 = 0;
    id v20 = 0;
    uint64_t v17 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  id v27 = objc_msgSend(a4, "substring:endIndex:");
  uint64_t v17 = JavaLangInteger_parseIntWithNSString_(v27, v28, v29, v30, v31, v32, v33, v34);
  if ((v17 & 0x80000000) != 0)
  {
    CFStringRef v53 = JreStrcat("$I", v35, v36, v37, v38, v39, v40, v41, @"port < 0: ");
    goto LABEL_38;
  }
  v18 = 0;
  id v19 = 0;
  id v20 = 0;
LABEL_19:
  if ((int)FirstOfWithNSString_withNSString_withInt_withInt >= (int)v8) {
    goto LABEL_29;
  }
  v54 = v7;
  while (1)
  {
    unsigned int v42 = [a4 charAtWithInt:FirstOfWithNSString_withNSString_withInt_withInt];
    if (v42 == 63)
    {
      uint64_t v43 = LibcoreNetUrlUrlUtils_findFirstOfWithNSString_withNSString_withInt_withInt_(a4, @"#", FirstOfWithNSString_withNSString_withInt_withInt, v8);
      id v19 = [a4 substring:(FirstOfWithNSString_withNSString_withInt_withInt + 1) endIndex:v43];
      goto LABEL_25;
    }
    if (v42 == 35) {
      break;
    }
    uint64_t v43 = LibcoreNetUrlUrlUtils_findFirstOfWithNSString_withNSString_withInt_withInt_(a4, @"?#", FirstOfWithNSString_withNSString_withInt_withInt, v8);
    v18 = sub_10027BAC0(v18, (__CFString *)[a4 substring:FirstOfWithNSString_withNSString_withInt_withInt endIndex:v43]);
    id v19 = 0;
LABEL_25:
    uint64_t FirstOfWithNSString_withNSString_withInt_withInt = v43;
    if ((int)v43 >= (int)v8)
    {
      id v20 = 0;
      goto LABEL_28;
    }
  }
  id v20 = [a4 substring:(FirstOfWithNSString_withNSString_withInt_withInt + 1) endIndex:v8];
LABEL_28:
  v7 = v54;
LABEL_29:
  if (v18) {
    v44 = v18;
  }
  else {
    v44 = &stru_10048C1F8;
  }
  -[JavaNetURLStreamHandler setURLWithJavaNetURL:withNSString:withNSString:withInt:withNSString:withNSString:withNSString:withNSString:withNSString:](v7, "setURLWithJavaNetURL:withNSString:withNSString:withInt:withNSString:withNSString:withNSString:withNSString:withNSString:", a3, [a3 getProtocol], v55, v17, v57, v56, LibcoreNetUrlUrlUtils_authoritySafePathWithNSString_withNSString_(v57, v44), v19, v20);
}

+ (id)relativePathWithNSString:(id)a3 withNSString:(id)a4
{
  return sub_10027BAC0(a3, (__CFString *)a4);
}

- (void)setURLWithJavaNetURL:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withNSString:(id)a7 withNSString:(id)a8
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (*((JavaNetURLStreamHandler **)a3 + 1) != self)
  {
    uint64_t v8 = new_JavaLangSecurityException_init();
    objc_exception_throw(v8);
  }
  [a3 setWithNSString:a4 withNSString:a5 withInt:*(void *)&a6 withNSString:a7 withNSString:a8];
}

- (void)setURLWithJavaNetURL:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withNSString:(id)a7 withNSString:(id)a8 withNSString:(id)a9 withNSString:(id)a10 withNSString:(id)a11
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  if (*((JavaNetURLStreamHandler **)a3 + 1) != self)
  {
    uint64_t v11 = new_JavaLangSecurityException_init();
    objc_exception_throw(v11);
  }
  objc_msgSend(a3, "setWithNSString:withNSString:withInt:withNSString:withNSString:withNSString:withNSString:withNSString:", a4, a5, *(void *)&a6, a7, a8, a9);
}

- (id)toExternalFormWithJavaNetURL:(id)a3
{
  return [(JavaNetURLStreamHandler *)self toExternalFormWithJavaNetURL:a3 withBoolean:0];
}

- (id)toExternalFormWithJavaNetURL:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = new_JavaLangStringBuilder_init();
  if (!a3) {
    goto LABEL_27;
  }
  v7 = v6;
  -[JavaLangStringBuilder appendWithNSString:](v6, "appendWithNSString:", [a3 getProtocol]);
  [(JavaLangStringBuilder *)v7 appendWithChar:58];
  id v8 = [a3 getAuthority];
  if (!v8)
  {
    id v11 = [a3 getFile];
    if (!v11) {
      goto LABEL_17;
    }
    id v10 = v11;
    if (v4) {
      goto LABEL_11;
    }
LABEL_16:
    [(JavaLangStringBuilder *)v7 appendWithNSString:v10];
    goto LABEL_17;
  }
  id v9 = v8;
  [(JavaLangStringBuilder *)v7 appendWithNSString:@"//"];
  if (!v4)
  {
    [(JavaLangStringBuilder *)v7 appendWithNSString:v9];
    id v10 = [a3 getFile];
    if (!v10) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if ((atomic_load_explicit(JavaNetURI__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!JavaNetURI_AUTHORITY_ENCODER_) {
    goto LABEL_27;
  }
  [(id)JavaNetURI_AUTHORITY_ENCODER_ appendPartiallyEncodedWithJavaLangStringBuilder:v7 withNSString:v9];
  id v10 = [a3 getFile];
  if (!v10) {
    goto LABEL_17;
  }
LABEL_11:
  if ((atomic_load_explicit(JavaNetURI__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!JavaNetURI_FILE_AND_QUERY_ENCODER_) {
    goto LABEL_27;
  }
  [(id)JavaNetURI_FILE_AND_QUERY_ENCODER_ appendPartiallyEncodedWithJavaLangStringBuilder:v7 withNSString:v10];
LABEL_17:
  id v12 = [a3 getRef];
  if (!v12) {
    goto LABEL_24;
  }
  id v13 = v12;
  [(JavaLangStringBuilder *)v7 appendWithChar:35];
  if (v4)
  {
    if ((atomic_load_explicit(JavaNetURI__initialized, memory_order_acquire) & 1) == 0) {
      objc_opt_class();
    }
    if (JavaNetURI_ALL_LEGAL_ENCODER_)
    {
      [(id)JavaNetURI_ALL_LEGAL_ENCODER_ appendPartiallyEncodedWithJavaLangStringBuilder:v7 withNSString:v13];
      goto LABEL_24;
    }
LABEL_27:
    JreThrowNullPointerException();
  }
  [(JavaLangStringBuilder *)v7 appendWithNSString:v13];
LABEL_24:
  return [(JavaLangStringBuilder *)v7 description];
}

- (BOOL)equalsWithJavaNetURL:(id)a3 withJavaNetURL:(id)a4
{
  if (!-[JavaNetURLStreamHandler sameFileWithJavaNetURL:withJavaNetURL:](self, "sameFileWithJavaNetURL:withJavaNetURL:"))return 0; {
  if (!a3 || (id v6 = [a3 getRef], !a4))
  }
    JreThrowNullPointerException();
  if (!LibcoreUtilObjects_equalWithId_withId_((uint64_t)v6, (uint64_t)[a4 getRef])) {
    return 0;
  }
  id v7 = [a3 getQuery];
  id v8 = [a4 getQuery];
  return LibcoreUtilObjects_equalWithId_withId_((uint64_t)v7, (uint64_t)v8);
}

- (int)getDefaultPort
{
  return -1;
}

- (id)getHostAddressWithJavaNetURL:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v3 = [a3 getHost];
  BOOL v4 = v3;
  if (v3 && [v3 length]) {
    return JavaNetInetAddress_getByNameWithNSString_(v4);
  }
  else {
    return 0;
  }
}

- (int)hashCodeWithJavaNetURL:(id)a3
{
  id v3 = [(JavaNetURLStreamHandler *)self toExternalFormWithJavaNetURL:a3];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 hash];
}

- (BOOL)hostsEqualWithJavaNetURL:(id)a3 withJavaNetURL:(id)a4
{
  if (!a3 || (id v5 = [a3 getHost], !a4)) {
    JreThrowNullPointerException();
  }
  id v6 = v5;
  id v7 = [a4 getHost];
  if (v6 == v7) {
    return 1;
  }
  if (!v6) {
    return 0;
  }
  return [v6 equalsIgnoreCase:v7];
}

- (BOOL)sameFileWithJavaNetURL:(id)a3 withJavaNetURL:(id)a4
{
  if (!a3 || (id v7 = [a3 getProtocol], !a4)) {
    JreThrowNullPointerException();
  }
  if (!LibcoreUtilObjects_equalWithId_withId_((uint64_t)v7, (uint64_t)[a4 getProtocol])) {
    return 0;
  }
  if (![(JavaNetURLStreamHandler *)self hostsEqualWithJavaNetURL:a3 withJavaNetURL:a4])return 0; {
  unsigned int v8 = [a3 getEffectivePort];
  }
  if (v8 != [a4 getEffectivePort]) {
    return 0;
  }
  id v9 = [a3 getFile];
  id v10 = [a4 getFile];
  return LibcoreUtilObjects_equalWithId_withId_((uint64_t)v9, (uint64_t)v10);
}

+ (id)__annotations_setURLWithJavaNetURL_withNSString_withNSString_withInt_withNSString_withNSString_
{
  id v3 = objc_alloc_init(JavaLangDeprecated);
  return +[IOSObjectArray arrayWithObjects:&v3 count:1 type:JavaLangAnnotationAnnotation_class_()];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100479378;
}

@end
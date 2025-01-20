@interface JavaUtilLocale
+ (const)__metadata;
+ (id)getAvailableLocales;
+ (id)getDefault;
+ (id)getISOCountries;
+ (id)getISOLanguages;
+ (id)toNewStringWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
+ (void)initialize;
+ (void)setDefaultWithJavaUtilLocale:(id)a3;
- (BOOL)isEqual:(id)a3;
- (JavaUtilLocale)initWithBoolean:(BOOL)a3 withNSString:(id)a4 withNSString:(id)a5;
- (JavaUtilLocale)initWithNSString:(id)a3;
- (JavaUtilLocale)initWithNSString:(id)a3 withNSString:(id)a4;
- (JavaUtilLocale)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5;
- (id)clone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)getCountry;
- (id)getDisplayCountry;
- (id)getDisplayCountryWithJavaUtilLocale:(id)a3;
- (id)getDisplayLanguage;
- (id)getDisplayLanguageWithJavaUtilLocale:(id)a3;
- (id)getDisplayName;
- (id)getDisplayNameWithJavaUtilLocale:(id)a3;
- (id)getDisplayVariant;
- (id)getDisplayVariantWithJavaUtilLocale:(id)a3;
- (id)getISO3Country;
- (id)getISO3Language;
- (id)getLanguage;
- (id)getVariant;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation JavaUtilLocale

- (JavaUtilLocale)initWithBoolean:(BOOL)a3 withNSString:(id)a4 withNSString:(id)a5
{
  return self;
}

- (JavaUtilLocale)initWithNSString:(id)a3
{
  JavaUtilLocale_initWithNSString_withNSString_withNSString_((id *)&self->super.isa, a3, &stru_10048C1F8, &stru_10048C1F8, v3, v4, v5, v6);
  return self;
}

- (JavaUtilLocale)initWithNSString:(id)a3 withNSString:(id)a4
{
  JavaUtilLocale_initWithNSString_withNSString_withNSString_((id *)&self->super.isa, a3, a4, &stru_10048C1F8, v4, v5, v6, v7);
  return self;
}

- (JavaUtilLocale)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  JavaUtilLocale_initWithNSString_withNSString_withNSString_((id *)&self->super.isa, a3, a4, a5, (uint64_t)a5, v5, v6, v7);
  return self;
}

- (id)clone
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLocale;
  return [(JavaUtilLocale *)&v3 clone];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v6) = 0;
      return v6;
    }
    objc_opt_class();
    if (!a3) {
      JreThrowNullPointerException();
    }
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      JreThrowClassCastException();
    }
    languageCode = self->languageCode_;
    if (!languageCode) {
      goto LABEL_16;
    }
    unsigned int v6 = [(NSString *)languageCode isEqual:*((void *)a3 + 2)];
    if (!v6) {
      return v6;
    }
    countryCode = self->countryCode_;
    if (!countryCode) {
      goto LABEL_16;
    }
    unsigned int v6 = [(NSString *)countryCode isEqual:*((void *)a3 + 1)];
    if (!v6) {
      return v6;
    }
    variantCode = self->variantCode_;
    if (!variantCode) {
LABEL_16:
    }
      JreThrowNullPointerException();
    uint64_t v9 = *((void *)a3 + 3);
    LOBYTE(v6) = [(NSString *)variantCode isEqual:v9];
  }
  return v6;
}

+ (id)getAvailableLocales
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return LibcoreIcuICU_getAvailableLocales();
}

- (id)getCountry
{
  return self->countryCode_;
}

+ (id)getDefault
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return (id)qword_1005609F0;
}

- (id)getDisplayCountry
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = qword_1005609F0;
  return [(JavaUtilLocale *)self getDisplayCountryWithJavaUtilLocale:v3];
}

- (id)getDisplayCountryWithJavaUtilLocale:(id)a3
{
  countryCode = self->countryCode_;
  if (!countryCode) {
    goto LABEL_12;
  }
  if ([(NSString *)countryCode isEmpty]) {
    return &stru_10048C1F8;
  }
  id v7 = -[JavaUtilLocale description]_0((void **)&self->super.isa);
  if (!a3) {
    goto LABEL_12;
  }
  uint64_t v8 = (uint64_t)v7;
  id v9 = -[JavaUtilLocale description]_0((void **)a3);
  id result = LibcoreIcuICU_getDisplayCountryNativeWithNSString_withNSString_(v8, (uint64_t)v9);
  if (result) {
    return result;
  }
  id v10 = -[JavaUtilLocale description]_0((void **)&self->super.isa);
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!qword_1005609F0) {
LABEL_12:
  }
    JreThrowNullPointerException();
  id v11 = -[JavaUtilLocale description]_0((void **)qword_1005609F0);
  return LibcoreIcuICU_getDisplayCountryNativeWithNSString_withNSString_((uint64_t)v10, (uint64_t)v11);
}

- (id)description
{
  v1 = a1 + 4;
  if (a1[4]) {
    return a1[4];
  }
  uint64_t v3 = (__CFString *)sub_10018DB78(a1[2], a1[1], a1[3]);
  return JreStrongAssign(v1, v3);
}

- (id)getDisplayLanguage
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = qword_1005609F0;
  return [(JavaUtilLocale *)self getDisplayLanguageWithJavaUtilLocale:v3];
}

- (id)getDisplayLanguageWithJavaUtilLocale:(id)a3
{
  languageCode = self->languageCode_;
  if (!languageCode) {
    goto LABEL_14;
  }
  if ([(NSString *)languageCode isEmpty]) {
    return &stru_10048C1F8;
  }
  id v7 = -[JavaUtilLocale description]_0((void **)&self->super.isa);
  if ([(NSString *)self->languageCode_ isEqual:@"tl"]) {
    id v7 = (void *)sub_10018DB78(@"fil", self->countryCode_, self->variantCode_);
  }
  if (!a3) {
    goto LABEL_14;
  }
  id v8 = -[JavaUtilLocale description]_0((void **)a3);
  id result = LibcoreIcuICU_getDisplayLanguageNativeWithNSString_withNSString_((uint64_t)v7, (uint64_t)v8);
  if (result) {
    return result;
  }
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!qword_1005609F0) {
LABEL_14:
  }
    JreThrowNullPointerException();
  id v9 = -[JavaUtilLocale description]_0((void **)qword_1005609F0);
  return LibcoreIcuICU_getDisplayLanguageNativeWithNSString_withNSString_((uint64_t)v7, (uint64_t)v9);
}

- (id)getDisplayName
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = qword_1005609F0;
  return [(JavaUtilLocale *)self getDisplayNameWithJavaUtilLocale:v3];
}

- (id)getDisplayNameWithJavaUtilLocale:(id)a3
{
  uint64_t v5 = new_JavaLangStringBuilder_init();
  languageCode = self->languageCode_;
  if (!languageCode) {
    goto LABEL_32;
  }
  unsigned __int8 v7 = [(NSString *)languageCode isEmpty];
  if (v7)
  {
    unsigned int v8 = 0;
  }
  else
  {
    id v9 = [(JavaUtilLocale *)self getDisplayLanguageWithJavaUtilLocale:a3];
    if (!v9) {
      goto LABEL_32;
    }
    id v10 = v9;
    if ([(NSString *)v9 isEmpty]) {
      id v10 = self->languageCode_;
    }
    [(JavaLangStringBuilder *)v5 appendWithNSString:v10];
    unsigned int v8 = 1;
  }
  countryCode = self->countryCode_;
  if (!countryCode) {
    goto LABEL_32;
  }
  if ([(NSString *)countryCode isEmpty]) {
    goto LABEL_16;
  }
  if ((v7 & 1) == 0) {
    -[JavaLangStringBuilder appendWithNSString:](v5, "appendWithNSString:", @" (");
  }
  v12 = [(JavaUtilLocale *)self getDisplayCountryWithJavaUtilLocale:a3];
  if (!v12) {
LABEL_32:
  }
    JreThrowNullPointerException();
  v13 = v12;
  if ([(NSString *)v12 isEmpty]) {
    v13 = self->countryCode_;
  }
  [(JavaLangStringBuilder *)v5 appendWithNSString:v13];
  ++v8;
LABEL_16:
  variantCode = self->variantCode_;
  if (!variantCode) {
    goto LABEL_32;
  }
  if ([(NSString *)variantCode isEmpty]) {
    goto LABEL_27;
  }
  if (v8 == 1)
  {
    CFStringRef v15 = CFSTR(" (");
  }
  else
  {
    if (v8 != 2) {
      goto LABEL_23;
    }
    CFStringRef v15 = @",";
  }
  [(JavaLangStringBuilder *)v5 appendWithNSString:v15];
LABEL_23:
  v16 = [(JavaUtilLocale *)self getDisplayVariantWithJavaUtilLocale:a3];
  if (!v16) {
    goto LABEL_32;
  }
  v17 = v16;
  if ([(NSString *)v16 isEmpty]) {
    v17 = self->variantCode_;
  }
  [(JavaLangStringBuilder *)v5 appendWithNSString:v17];
  ++v8;
LABEL_27:
  if (v8 >= 2) {
    [(JavaLangStringBuilder *)v5 appendWithNSString:@""]);
  }
  return [(JavaLangStringBuilder *)v5 description];
}

- (id)getDisplayVariant
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v3 = qword_1005609F0;
  return [(JavaUtilLocale *)self getDisplayVariantWithJavaUtilLocale:v3];
}

- (id)getDisplayVariantWithJavaUtilLocale:(id)a3
{
  variantCode = self->variantCode_;
  if (!variantCode) {
    goto LABEL_13;
  }
  if (![(NSString *)variantCode length]) {
    return self->variantCode_;
  }
  id v6 = -[JavaUtilLocale description]_0((void **)&self->super.isa);
  if (!a3) {
    goto LABEL_13;
  }
  uint64_t v7 = (uint64_t)v6;
  id v8 = -[JavaUtilLocale description]_0((void **)a3);
  id result = LibcoreIcuICU_getDisplayVariantNativeWithNSString_withNSString_(v7, (uint64_t)v8);
  if (result) {
    return result;
  }
  id v10 = -[JavaUtilLocale description]_0((void **)&self->super.isa);
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (!qword_1005609F0) {
LABEL_13:
  }
    JreThrowNullPointerException();
  id v11 = -[JavaUtilLocale description]_0((void **)qword_1005609F0);
  return LibcoreIcuICU_getDisplayVariantNativeWithNSString_withNSString_((uint64_t)v10, (uint64_t)v11);
}

- (id)getISO3Country
{
}

- (id)getISO3Language
{
}

+ (id)getISOCountries
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return LibcoreIcuICU_getISOCountries();
}

+ (id)getISOLanguages
{
  if ((atomic_load_explicit(JavaUtilLocale__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  return LibcoreIcuICU_getISOLanguages();
}

- (id)getLanguage
{
  return self->languageCode_;
}

- (id)getVariant
{
  return self->variantCode_;
}

- (unint64_t)hash
{
  objc_sync_enter(self);
  countryCode = self->countryCode_;
  if (!countryCode
    || (unsigned int v4 = [(NSString *)countryCode hash], (languageCode = self->languageCode_) == 0)
    || (unsigned int v6 = [(NSString *)languageCode hash], (variantCode = self->variantCode_) == 0))
  {
    JreThrowNullPointerException();
  }
  unint64_t v8 = (int)(v6 + v4 + [(NSString *)variantCode hash]);
  objc_sync_exit(self);
  return v8;
}

+ (void)setDefaultWithJavaUtilLocale:(id)a3
{
}

+ (id)toNewStringWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5
{
  return (id)sub_10018DB78(a3, a4, a5);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilLocale;
  [(JavaUtilLocale *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilLocale *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = sub_10018E734(@"en", @"CA");
    JreStrongAssignAndConsume(&JavaUtilLocale_CANADA_, v2);
    id v3 = sub_10018E734(@"fr", @"CA");
    JreStrongAssignAndConsume(&JavaUtilLocale_CANADA_FRENCH_, v3);
    unsigned int v4 = sub_10018E734(@"zh", @"CN");
    JreStrongAssignAndConsume(&JavaUtilLocale_CHINA_, v4);
    uint64_t v5 = sub_10018E734(@"zh", &stru_10048C1F8);
    JreStrongAssignAndConsume(&JavaUtilLocale_CHINESE_, v5);
    unsigned int v6 = sub_10018E734(@"en", &stru_10048C1F8);
    JreStrongAssignAndConsume((id *)&JavaUtilLocale_ENGLISH_, v6);
    uint64_t v7 = sub_10018E734(@"fr", @"FR");
    JreStrongAssignAndConsume(&JavaUtilLocale_FRANCE_, v7);
    unint64_t v8 = sub_10018E734(@"fr", &stru_10048C1F8);
    JreStrongAssignAndConsume(&JavaUtilLocale_FRENCH_, v8);
    id v9 = sub_10018E734(@"de", &stru_10048C1F8);
    JreStrongAssignAndConsume(&JavaUtilLocale_GERMAN_, v9);
    id v10 = sub_10018E734(@"de", @"DE");
    JreStrongAssignAndConsume(&JavaUtilLocale_GERMANY_, v10);
    id v11 = sub_10018E734(@"it", &stru_10048C1F8);
    JreStrongAssignAndConsume(&JavaUtilLocale_ITALIAN_, v11);
    v12 = sub_10018E734(@"it", @"IT");
    JreStrongAssignAndConsume(&JavaUtilLocale_ITALY_, v12);
    v13 = sub_10018E734(@"ja", @"JP");
    JreStrongAssignAndConsume(&JavaUtilLocale_JAPAN_, v13);
    v14 = sub_10018E734(@"ja", &stru_10048C1F8);
    JreStrongAssignAndConsume(&JavaUtilLocale_JAPANESE_, v14);
    CFStringRef v15 = sub_10018E734(@"ko", @"KR");
    JreStrongAssignAndConsume(&JavaUtilLocale_KOREA_, v15);
    v16 = sub_10018E734(@"ko", &stru_10048C1F8);
    JreStrongAssignAndConsume(&JavaUtilLocale_KOREAN_, v16);
    v17 = sub_10018E734(@"zh", @"CN");
    JreStrongAssignAndConsume(&JavaUtilLocale_PRC_, v17);
    v18 = sub_10018E734(&stru_10048C1F8, &stru_10048C1F8);
    JreStrongAssignAndConsume((id *)&JavaUtilLocale_ROOT_, v18);
    v19 = sub_10018E734(@"zh", @"CN");
    JreStrongAssignAndConsume(&JavaUtilLocale_SIMPLIFIED_CHINESE_, v19);
    v20 = sub_10018E734(@"zh", @"TW");
    JreStrongAssignAndConsume(&JavaUtilLocale_TAIWAN_, v20);
    v21 = sub_10018E734(@"zh", @"TW");
    JreStrongAssignAndConsume(&JavaUtilLocale_TRADITIONAL_CHINESE_, v21);
    v22 = sub_10018E734(@"en", @"GB");
    JreStrongAssignAndConsume(&JavaUtilLocale_UK_, v22);
    v23 = sub_10018E734(@"en", @"US");
    JreStrongAssignAndConsume((id *)&JavaUtilLocale_US_, v23);
    JreStrongAssign((id *)&qword_1005609F0, (void *)JavaUtilLocale_US_);
    id PropertyWithNSString_withNSString = JavaLangSystem_getPropertyWithNSString_withNSString_(@"user.language", @"en");
    id v25 = JavaLangSystem_getPropertyWithNSString_withNSString_(@"user.region", @"US");
    id v26 = JavaLangSystem_getPropertyWithNSString_withNSString_(@"user.variant", (uint64_t)&stru_10048C1F8);
    v27 = [JavaUtilLocale alloc];
    JavaUtilLocale_initWithNSString_withNSString_withNSString_((id *)&v27->super.isa, PropertyWithNSString_withNSString, v25, v26, v28, v29, v30, v31);
    JreStrongAssignAndConsume((id *)&qword_1005609F0, v27);
    atomic_store(1u, (unsigned __int8 *)JavaUtilLocale__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10040DC60;
}

@end
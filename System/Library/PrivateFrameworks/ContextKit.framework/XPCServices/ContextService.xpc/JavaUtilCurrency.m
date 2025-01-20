@interface JavaUtilCurrency
+ (const)__metadata;
+ (id)getInstanceWithJavaUtilLocale:(id)a3;
+ (id)getInstanceWithNSString:(id)a3;
+ (void)initialize;
- (JavaUtilCurrency)initWithNSString:(id)a3;
- (NSString)description;
- (id)getCurrencyCode;
- (id)getSymbol;
- (id)getSymbolWithJavaUtilLocale:(id)a3;
- (int)getDefaultFractionDigits;
- (void)dealloc;
@end

@implementation JavaUtilCurrency

- (JavaUtilCurrency)initWithNSString:(id)a3
{
  return self;
}

+ (id)getInstanceWithNSString:(id)a3
{
  return JavaUtilCurrency_getInstanceWithNSString_(a3);
}

+ (id)getInstanceWithJavaUtilLocale:(id)a3
{
  return JavaUtilCurrency_getInstanceWithJavaUtilLocale_(a3);
}

- (id)getCurrencyCode
{
  return self->currencyCode_;
}

- (id)getSymbol
{
  uint64_t Default = JavaUtilLocale_getDefault();
  return [(JavaUtilCurrency *)self getSymbolWithJavaUtilLocale:Default];
}

- (id)getSymbolWithJavaUtilLocale:(id)a3
{
  if (!a3) {
    goto LABEL_12;
  }
  id v5 = [a3 getCountry];
  if (!v5) {
    goto LABEL_12;
  }
  if (![v5 length])
  {
    p_currencyCode = &self->currencyCode_;
    return *p_currencyCode;
  }
  v6 = LibcoreIcuLocaleData_getWithJavaUtilLocale_(a3);
  if (!v6 || (v7 = v6, (internationalCurrencySymbol = v6->internationalCurrencySymbol_) == 0)) {
LABEL_12:
  }
    JreThrowNullPointerException();
  currencyCode = self->currencyCode_;
  p_currencyCode = &self->currencyCode_;
  if ([(NSString *)internationalCurrencySymbol isEqual:currencyCode])
  {
    p_currencyCode = &v7->currencySymbol_;
  }
  else
  {
    id result = LibcoreIcuICU_getCurrencySymbolWithNSString_((uint64_t)[a3 description]);
    if (result) {
      return result;
    }
  }
  return *p_currencyCode;
}

- (int)getDefaultFractionDigits
{
  currencyCode = self->currencyCode_;
  if (!currencyCode) {
    JreThrowNullPointerException();
  }
  if ([(NSString *)currencyCode isEqual:@"XXX"]) {
    return -1;
  }
  id v5 = self->currencyCode_;
  return LibcoreIcuICU_getCurrencyFractionDigitsWithNSString_((uint64_t)v5);
}

- (NSString)description
{
  return self->currencyCode_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilCurrency;
  [(JavaUtilCurrency *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = new_JavaUtilHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100560C90, v2);
    objc_super v3 = new_JavaUtilHashMap_init();
    JreStrongAssignAndConsume((id *)&qword_100560C98, v3);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilCurrency__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042E590;
}

@end
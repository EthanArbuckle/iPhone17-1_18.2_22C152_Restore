@interface CRPhoneSearch
+ (id)copyCountryCode;
+ (id)copyNormalizedPhoneNumber:(__CFString *)a3 countryCode:(__CFString *)a4;
- (BOOL)hasPrefix:(id)a3;
- (BOOL)isEqualToPhoneNumber:(id)a3;
- (BOOL)matchesUTF8String:(const char *)a3 matchType:(unint64_t)a4;
- (CRPhoneSearch)init;
- (CRPhoneSearch)initWithSearchString:(id)a3;
- (id)_copyInterpretationsForPhoneNumber:(id)a3;
- (void)dealloc;
@end

@implementation CRPhoneSearch

+ (id)copyCountryCode
{
  id result = (id)CPPhoneNumberCopyActiveCountryCode();
  if (!result)
  {
    return (id)_CPPhoneNumberCopyHomeCountryCode();
  }
  return result;
}

+ (id)copyNormalizedPhoneNumber:(__CFString *)a3 countryCode:(__CFString *)a4
{
  v5 = (const char *)PNCopyBestGuessNormalizedNumberForCountry();
  CFStringRef v6 = CFStringCreateWithCStringNoCopy(kCFAllocatorDefault, v5, 0x8000100u, kCFAllocatorMalloc);
  v7 = (const void *)CFPhoneNumberCreate();
  id String = (id)CFPhoneNumberCreateString();
  if (!String)
  {
    id String = (id)CFPhoneNumberCreateString();
    if (!String) {
      id String = [(__CFString *)a3 lowercaseString];
    }
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v6) {
    CFRelease(v6);
  }
  return String;
}

- (CRPhoneSearch)init
{
  return [(CRPhoneSearch *)self initWithSearchString:&stru_10002D980];
}

- (CRPhoneSearch)initWithSearchString:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRPhoneSearch;
  v3 = [(CRPhoneSearch *)&v5 init];
  if (v3)
  {
    v3->_countryCode = (NSString *)[(id)objc_opt_class() copyCountryCode];
    v3->_searchid String = (NSString *)_PNCreateStringByStrippingFormattingAndNotVisiblyAllowable();
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRPhoneSearch;
  [(CRPhoneSearch *)&v3 dealloc];
}

- (id)_copyInterpretationsForPhoneNumber:(id)a3
{
  id v3 = [(id)objc_opt_class() copyNormalizedPhoneNumber:a3 countryCode:self->_countryCode];
  v4 = (void *)_PNCopyIndexStringsForAddressBookSearch();

  return v4;
}

- (BOOL)isEqualToPhoneNumber:(id)a3
{
  if (-[NSString isEqualToString:](self->_searchString, "isEqualToString:")) {
    return 1;
  }
  id v6 = [(CRPhoneSearch *)self _copyInterpretationsForPhoneNumber:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([(NSString *)self->_searchString isEqualToString:*(void *)(*((void *)&v12 + 1) + 8 * i)])
        {
          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (BOOL)hasPrefix:(id)a3
{
  if (-[NSString hasPrefix:](self->_searchString, "hasPrefix:")) {
    return 1;
  }
  id v6 = [(CRPhoneSearch *)self _copyInterpretationsForPhoneNumber:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v6, "reverseObjectEnumerator", 0);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) hasPrefix:self->_searchString])
        {
          BOOL v5 = 1;
          goto LABEL_13;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v5 = 0;
LABEL_13:

  return v5;
}

- (BOOL)matchesUTF8String:(const char *)a3 matchType:(unint64_t)a4
{
  id v6 = [objc_alloc((Class)NSString) initWithBytesNoCopy:a3 length:strlen(a3) encoding:4 freeWhenDone:0];
  if (a4 == 1)
  {
    unsigned __int8 v8 = [(CRPhoneSearch *)self hasPrefix:v6];
    goto LABEL_5;
  }
  BOOL v7 = 0;
  if (!a4)
  {
    unsigned __int8 v8 = [(CRPhoneSearch *)self isEqualToPhoneNumber:v6];
LABEL_5:
    BOOL v7 = v8;
  }

  return v7;
}

@end
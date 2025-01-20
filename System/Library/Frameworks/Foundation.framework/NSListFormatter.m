@interface NSListFormatter
+ (NSString)localizedStringByJoiningStrings:(NSArray *)strings;
- (NSFormatter)itemFormatter;
- (NSListFormatter)init;
- (NSListFormatter)initWithLocale:(id)a3;
- (NSLocale)locale;
- (NSString)stringForObjectValue:(id)obj;
- (__CFListFormatter)_listFormatter;
- (id)_stringFromStringArray:(id)a3;
- (void)dealloc;
- (void)setItemFormatter:(NSFormatter *)itemFormatter;
- (void)setLocale:(NSLocale *)locale;
@end

@implementation NSListFormatter

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  listFormatter = self->_listFormatter;
  if (listFormatter) {
    CFRelease(listFormatter);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSListFormatter;
  [(NSListFormatter *)&v4 dealloc];
}

- (NSListFormatter)init
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];

  return [(NSListFormatter *)self initWithLocale:v3];
}

- (NSListFormatter)initWithLocale:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSListFormatter;
  objc_super v4 = [(NSListFormatter *)&v6 init];
  if (v4) {
    v4->_locale = (NSLocale *)[a3 copy];
  }
  return v4;
}

- (void)setLocale:(NSLocale *)locale
{
  uint64_t v3 = self->_locale;
  if (v3 != locale)
  {
    self->_locale = (NSLocale *)[(NSLocale *)locale copy];

    listFormatter = self->_listFormatter;
    if (listFormatter)
    {
      CFRelease(listFormatter);
      self->_listFormatter = 0;
    }
  }
}

- (NSLocale)locale
{
  result = self->_locale;
  if (!result)
  {
    result = (NSLocale *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "autoupdatingCurrentLocale"), "copy");
    self->_locale = result;
  }
  return result;
}

- (__CFListFormatter)_listFormatter
{
  result = self->_listFormatter;
  if (!result)
  {
    [(NSListFormatter *)self locale];
    result = (__CFListFormatter *)_CFListFormatterCreate();
    self->_listFormatter = result;
  }
  return result;
}

- (NSString)stringForObjectValue:(id)obj
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!obj) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v14 = [(NSListFormatter *)self locale];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [(NSFormatter *)self->_itemFormatter stringForObjectValue:v10];
        if (!v11
          && ((objc_opt_respondsToSelector() & 1) == 0
           || (v11 = (NSString *)[v10 descriptionWithLocale:v14]) == 0)
          && ((objc_opt_respondsToSelector() & 1) == 0
           || (v11 = (NSString *)[v10 localizedDescription]) == 0))
        {
          v11 = (NSString *)objc_msgSend(v10, "description", v11);
          if (!v11)
          {
            v12 = 0;
            goto LABEL_19;
          }
        }
        [v5 addObject:v11];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  v12 = [(NSListFormatter *)self _stringFromStringArray:v5];
LABEL_19:

  return v12;
}

- (id)_stringFromStringArray:(id)a3
{
  [(NSListFormatter *)self _listFormatter];
  StringByJoiningStrings = (void *)_CFListFormatterCreateStringByJoiningStrings();

  return StringByJoiningStrings;
}

+ (NSString)localizedStringByJoiningStrings:(NSArray *)strings
{
  objc_super v4 = -[NSListFormatter initWithLocale:]([NSListFormatter alloc], "initWithLocale:", [MEMORY[0x1E4F1CA20] currentLocale]);
  id v5 = [(NSListFormatter *)v4 _stringFromStringArray:strings];

  return v5;
}

- (NSFormatter)itemFormatter
{
  return (NSFormatter *)objc_getProperty(self, a2, 24, 1);
}

- (void)setItemFormatter:(NSFormatter *)itemFormatter
{
}

@end
@interface AMPICUNumberFormatter
- (AMPICUNumberFormatter)init;
- (AMPICUNumberFormatter)initWithExtendedStyle:(unint64_t)a3 locale:(id)a4;
- (BOOL)_localeHasChanged;
- (BOOL)usesGroupingSeparator;
- (NSLocale)locale;
- (NSString)_currencyCodeBeingUsed;
- (NSString)_localeIdentifierBeingUsed;
- (id)stringFromNumber:(id)a3;
- (unint64_t)extendedStyle;
- (void)_icuNumberFormatter;
- (void)dealloc;
- (void)setExtendedStyle:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setUsesGroupingSeparator:(BOOL)a3;
- (void)set_currencyCodeBeingUsed:(id)a3;
- (void)set_icuNumberFormatter:(void *)a3;
- (void)set_localeIdentifierBeingUsed:(id)a3;
@end

@implementation AMPICUNumberFormatter

- (AMPICUNumberFormatter)init
{
  return [(AMPICUNumberFormatter *)self initWithExtendedStyle:0 locale:0];
}

- (AMPICUNumberFormatter)initWithExtendedStyle:(unint64_t)a3 locale:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AMPICUNumberFormatter;
  v7 = [(AMPICUNumberFormatter *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_extendedStyle = a3;
    [(AMPICUNumberFormatter *)v7 setLocale:v6];
    v9 = v8;
  }

  return v8;
}

- (void)dealloc
{
  if ([(AMPICUNumberFormatter *)self _icuNumberFormatter])
  {
    [(AMPICUNumberFormatter *)self _icuNumberFormatter];
    unum_close();
    [(AMPICUNumberFormatter *)self set_icuNumberFormatter:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)AMPICUNumberFormatter;
  [(AMPICUNumberFormatter *)&v3 dealloc];
}

- (void)setLocale:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  }
  id obj = v4;
  if (([v4 isEqual:self->_locale] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_locale, obj);
    [(AMPICUNumberFormatter *)self setExtendedStyle:self->_extendedStyle];
  }
}

- (BOOL)usesGroupingSeparator
{
  objc_super v3 = [(AMPICUNumberFormatter *)self _icuNumberFormatter];
  if (v3)
  {
    [(AMPICUNumberFormatter *)self _icuNumberFormatter];
    LOBYTE(v3) = unum_getAttribute() != 0;
  }
  return (char)v3;
}

- (void)setUsesGroupingSeparator:(BOOL)a3
{
  if ([(AMPICUNumberFormatter *)self _icuNumberFormatter])
  {
    [(AMPICUNumberFormatter *)self _icuNumberFormatter];
    unum_setAttribute();
  }
}

- (void)setExtendedStyle:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v5 = [(AMPICUNumberFormatter *)self locale];
  if (!v5)
  {
    v5 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  }
  id v6 = [v5 localeIdentifier];
  [(AMPICUNumberFormatter *)self set_localeIdentifierBeingUsed:v6];

  [(AMPICUNumberFormatter *)self set_currencyCodeBeingUsed:0];
  if (v5)
  {
    id v7 = [(AMPICUNumberFormatter *)self _localeIdentifierBeingUsed];
    v8 = (unsigned char *)[v7 UTF8String];

    if (v8)
    {
      if (*v8)
      {
        if ([(AMPICUNumberFormatter *)self _icuNumberFormatter])
        {
          [(AMPICUNumberFormatter *)self _icuNumberFormatter];
          unum_close();
          [(AMPICUNumberFormatter *)self set_icuNumberFormatter:0];
        }
        self->_extendedStyle = a3;
        v9 = 0;
        int v10 = 0;
        switch(a3)
        {
          case 0uLL:
            break;
          case 1uLL:
            v9 = 0;
            int v10 = 0;
            break;
          case 2uLL:
          case 3uLL:
            [v5 currencyCode];
            v9 = int v10 = 1;
            break;
          default:
            v9 = 0;
            int v10 = 0;
            self->_extendedStyle = 0;
            break;
        }
        [(AMPICUNumberFormatter *)self set_currencyCodeBeingUsed:v9];
        int v15 = 0;
        [(AMPICUNumberFormatter *)self set_icuNumberFormatter:unum_open()];
        if ([(AMPICUNumberFormatter *)self _icuNumberFormatter])
        {
          unint64_t v11 = [v9 length];
          unint64_t v12 = v11;
          if (v11) {
            int v13 = v10;
          }
          else {
            int v13 = 0;
          }
          if (v13 == 1 && v11 <= 0x10)
          {
            [v9 getCharacters:v16];
            v16[v12] = 0;
            v14 = [(AMPICUNumberFormatter *)self _icuNumberFormatter];
            if ((self->_extendedStyle & 0xFFFFFFFFFFFFFFFELL) == 2) {
              (*((void (**)(void **, _WORD *, int *))*v14 + 31))(v14, v16, &v15);
            }
          }
          int v15 = 0;
          [(AMPICUNumberFormatter *)self _icuNumberFormatter];
          unum_toPattern();
          [(AMPICUNumberFormatter *)self _icuNumberFormatter];
          unum_setAttribute();
          [(AMPICUNumberFormatter *)self _icuNumberFormatter];
          unum_setContext();
        }
      }
    }
  }
}

- (BOOL)_localeHasChanged
{
  objc_super v3 = [(AMPICUNumberFormatter *)self locale];
  if (!v3)
  {
    objc_super v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  }
  id v4 = [v3 localeIdentifier];
  v5 = [(AMPICUNumberFormatter *)self _localeIdentifierBeingUsed];
  char v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    if ((self->_extendedStyle & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      id v7 = [v3 currencyCode];
    }
    else
    {
      id v7 = 0;
    }
    v9 = [(AMPICUNumberFormatter *)self _currencyCodeBeingUsed];
    if ([v7 length] || objc_msgSend(v9, "length"))
    {
      if (![v7 length] && objc_msgSend(v9, "length")
        || [v7 length] && !objc_msgSend(v9, "length"))
      {
        LOBYTE(v8) = 1;
      }
      else
      {
        int v8 = [v7 isEqualToString:v9] ^ 1;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (id)stringFromNumber:(id)a3
{
  v19[192] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(AMPICUNumberFormatter *)self _icuNumberFormatter])
  {
    unint64_t v11 = 0;
    goto LABEL_22;
  }
  if ([(AMPICUNumberFormatter *)self _localeHasChanged]) {
    [(AMPICUNumberFormatter *)self setExtendedStyle:self->_extendedStyle];
  }
  LODWORD(v17[0]) = 0;
  objc_msgSend(v4, "stringValue", v17[0]);
  id v5 = objc_claimAutoreleasedReturnValue();
  strcpy((char *)v17 + 6, (const char *)[v5 UTF8String]);

  [(AMPICUNumberFormatter *)self _icuNumberFormatter];
  strlen((const char *)v17 + 6);
  int v6 = unum_formatDecimal();
  uint64_t v7 = v6;
  int v8 = v17[0];
  v9 = (CFAllocatorRef *)MEMORY[0x1E4F1CFB0];
  if (LODWORD(v17[0]) == 15 || v6 >= 769)
  {
    int v10 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 2 * (v6 + 2), 0);
    [(AMPICUNumberFormatter *)self _icuNumberFormatter];
    strlen((const char *)v17 + 6);
    uint64_t v7 = (int)unum_formatDecimal();
    int v8 = 0;
  }
  else
  {
    int v10 = 0;
  }
  if (v8 <= 0)
  {
    if (v10) {
      unint64_t v12 = v10;
    }
    else {
      unint64_t v12 = &v18;
    }
    int v13 = [(AMPICUNumberFormatter *)self locale];
    CFStringRef v14 = (const __CFString *)MEMORY[0x1E4E53690]();
    BOOL v15 = CFLocaleGetLanguageCharacterDirection(v14) == kCFLocaleLanguageDirectionRightToLeft;

    if (v15)
    {
      *(_WORD *)unint64_t v12 = 8207;
      ++v7;
    }
    else if (v10)
    {
      unint64_t v12 = v10 + 2;
    }
    else
    {
      unint64_t v12 = (char *)v19;
    }
    unint64_t v11 = [NSString stringWithCharacters:v12 length:v7];
    if (!v10) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  unint64_t v11 = 0;
  if (v10) {
LABEL_21:
  }
    CFAllocatorDeallocate(*v9, v10);
LABEL_22:

  return v11;
}

- (unint64_t)extendedStyle
{
  return self->_extendedStyle;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)_icuNumberFormatter
{
  return self->__icuNumberFormatter;
}

- (void)set_icuNumberFormatter:(void *)a3
{
  self->__icuNumberFormatter = a3;
}

- (NSString)_localeIdentifierBeingUsed
{
  return self->__localeIdentifierBeingUsed;
}

- (void)set_localeIdentifierBeingUsed:(id)a3
{
}

- (NSString)_currencyCodeBeingUsed
{
  return self->__currencyCodeBeingUsed;
}

- (void)set_currencyCodeBeingUsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currencyCodeBeingUsed, 0);
  objc_storeStrong((id *)&self->__localeIdentifierBeingUsed, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
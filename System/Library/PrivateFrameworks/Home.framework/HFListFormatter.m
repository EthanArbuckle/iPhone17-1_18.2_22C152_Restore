@interface HFListFormatter
- (NSLocale)locale;
- (UListFormatter)formatter;
- (id)_formatAndListWithElements:(id)a3;
- (id)_formatOrListWithElements:(id)a3;
- (id)_formatSentenceListWithElements:(id)a3;
- (id)stringForObjectValue:(id)a3;
- (unint64_t)listStyle;
- (void)_invaildateFormatter;
- (void)dealloc;
- (void)setFormatter:(UListFormatter *)a3;
- (void)setListStyle:(unint64_t)a3;
- (void)setLocale:(id)a3;
@end

@implementation HFListFormatter

- (void)dealloc
{
  [(HFListFormatter *)self _invaildateFormatter];
  v3.receiver = self;
  v3.super_class = (Class)HFListFormatter;
  [(HFListFormatter *)&v3 dealloc];
}

- (void)_invaildateFormatter
{
  if ([(HFListFormatter *)self formatter])
  {
    [(HFListFormatter *)self formatter];
    ulistfmt_close();
    [(HFListFormatter *)self setFormatter:0];
  }
}

- (NSLocale)locale
{
  locale = self->_locale;
  if (locale)
  {
    objc_super v3 = locale;
  }
  else
  {
    objc_super v3 = [MEMORY[0x263EFF960] currentLocale];
  }
  return v3;
}

- (void)setLocale:(id)a3
{
  v5 = (NSLocale *)a3;
  p_locale = &self->_locale;
  if (self->_locale != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_locale, a3);
    p_locale = (NSLocale **)[(HFListFormatter *)self _invaildateFormatter];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_locale, v5);
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v7 = 0;
    goto LABEL_12;
  }
  id v5 = v4;
  if ([(HFListFormatter *)self listStyle] == 1)
  {
    uint64_t v6 = [(HFListFormatter *)self _formatOrListWithElements:v5];
  }
  else if ([(HFListFormatter *)self listStyle])
  {
    if ([(HFListFormatter *)self listStyle] != 2)
    {
      v7 = 0;
      goto LABEL_11;
    }
    uint64_t v6 = [(HFListFormatter *)self _formatSentenceListWithElements:v5];
  }
  else
  {
    uint64_t v6 = [(HFListFormatter *)self _formatAndListWithElements:v5];
  }
  v7 = (void *)v6;
LABEL_11:

LABEL_12:
  return v7;
}

- (id)_formatSentenceListWithElements:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 count];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__HFListFormatter__formatSentenceListWithElements___block_invoke;
  v8[3] = &unk_2640998A0;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = v5;
  [v3 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __51__HFListFormatter__formatSentenceListWithElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) appendFormat:@"%@", a2];
  uint64_t v6 = a1 + 32;
  uint64_t v5 = *(void **)(a1 + 32);
  if (*(void *)(v6 + 8) - 1 == a3) {
    v7 = @"HFSentenceListFormatTerminator";
  }
  else {
    v7 = @"HFSentenceListFormatSeparator";
  }
  _HFLocalizedStringWithDefaultValue(v7, v7, 1);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 appendFormat:@"%@", v8];
}

- (id)_formatOrListWithElements:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 count];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__HFListFormatter__formatOrListWithElements___block_invoke;
  v8[3] = &unk_2640998A0;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = v5;
  [v3 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __45__HFListFormatter__formatOrListWithElements___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) appendFormat:@"%@", a2];
  unint64_t v5 = *(void *)(a1 + 40);
  if (v5 - a3 < 3)
  {
    if (v5 >= 3 && v5 - a3 == 2)
    {
      id v6 = *(void **)(a1 + 32);
      v7 = @"HFOrListFormatSeparatorFinal";
    }
    else
    {
      if (a3 || v5 != 2) {
        return;
      }
      id v6 = *(void **)(a1 + 32);
      v7 = @"HFOrListFormatSeparatorFinalTwoElements";
    }
  }
  else
  {
    id v6 = *(void **)(a1 + 32);
    v7 = @"HFOrListFormatSeparator";
  }
  _HFLocalizedStringWithDefaultValue(v7, v7, 1);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v6 appendFormat:@"%@", v9];
}

- (id)_formatAndListWithElements:(id)a3
{
  v30[500] = *MEMORY[0x263EF8340];
  id v28 = a3;
  int v29 = 0;
  if ([(HFListFormatter *)self formatter]) {
    goto LABEL_3;
  }
  id v4 = [(HFListFormatter *)self locale];
  unint64_t v5 = [v4 localeIdentifier];
  [v5 getCString:v30 maxLength:100 encoding:4];

  [(HFListFormatter *)self setFormatter:ulistfmt_open()];
  id v6 = 0;
  if ([(HFListFormatter *)self formatter])
  {
LABEL_3:
    v27[0] = self;
    id v7 = v28;
    unint64_t v8 = objc_msgSend(v28, "count", v27[0]);
    if (v8 >= 0x64) {
      uint64_t v9 = 100;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = [v28 count];
    v27[1] = v27;
    MEMORY[0x270FA5388](v10);
    v13 = (id *)((char *)v27 - v12);
    if (v11 >= 0x200) {
      size_t v14 = 512;
    }
    else {
      size_t v14 = v11;
    }
    bzero((char *)v27 - v12, v14);
    uint64_t v15 = [v7 count];
    MEMORY[0x270FA5388](v15);
    v17 = (char *)v27 - v16;
    if (v9)
    {
      uint64_t v18 = 0;
      while (1)
      {
        v19 = [v28 objectAtIndexedSubscript:v18];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        unint64_t v20 = [v19 length];
        if (v20 >= 0x1F4) {
          uint64_t v21 = 500;
        }
        else {
          uint64_t v21 = v20;
        }
        v22 = malloc_type_malloc(2 * v21, 0x1000040BDFB0063uLL);
        objc_msgSend(v19, "getCharacters:range:", v22, 0, v21);
        v13[v18] = v22;
        *(_DWORD *)&v17[4 * v18] = v21;

        if (v9 == ++v18) {
          goto LABEL_16;
        }
      }
      if (v18)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          v25 = v13[i];
          if (v25) {
            free(v25);
          }
        }
      }

      id v6 = 0;
    }
    else
    {
LABEL_16:
      [v27[0] formatter];
      for (int j = ulistfmt_format(); v9; --v9)
      {
        if (*v13) {
          free(*v13);
        }
        ++v13;
      }
      if (v29 < 1)
      {
        id v6 = [NSString stringWithCharacters:v30 length:j];
      }
      else
      {
        id v6 = 0;
      }
    }
  }

  return v6;
}

- (unint64_t)listStyle
{
  return self->_listStyle;
}

- (void)setListStyle:(unint64_t)a3
{
  self->_listStyle = a3;
}

- (UListFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(UListFormatter *)a3
{
  self->_formatter = a3;
}

- (void).cxx_destruct
{
}

@end
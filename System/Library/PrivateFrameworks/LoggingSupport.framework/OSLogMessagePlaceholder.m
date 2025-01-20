@interface OSLogMessagePlaceholder
- (NSArray)tokens;
- (NSString)rawString;
- (NSString)type;
- (NSString)typeNamespace;
- (OSLogMessagePlaceholder)initWithPlaceholderStruct:(os_log_fmt_cspec_s *)a3;
- (int)precision;
- (int)width;
- (void)dealloc;
@end

@implementation OSLogMessagePlaceholder

- (OSLogMessagePlaceholder)initWithPlaceholderStruct:(os_log_fmt_cspec_s *)a3
{
  if (!a3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)OSLogMessagePlaceholder;
  result = [(OSLogMessagePlaceholder *)&v5 init];
  if (result) {
    result->_placeholder = a3;
  }
  return result;
}

- (void)dealloc
{
  placeholderString = self->_placeholderString;
  if (placeholderString) {

  }
  placeholderTokens = self->_placeholderTokens;
  if (placeholderTokens) {

  }
  v5.receiver = self;
  v5.super_class = (Class)OSLogMessagePlaceholder;
  [(OSLogMessagePlaceholder *)&v5 dealloc];
}

- (NSString)typeNamespace
{
  if (!self->_placeholder->var9) {
    return 0;
  }
  v2 = (void *)[[NSString alloc] initWithBytesNoCopy:self->_placeholder->var9 length:self->_placeholder->var4 encoding:4 freeWhenDone:0];
  return (NSString *)v2;
}

- (NSString)type
{
  if (!self->_placeholder->var10) {
    return 0;
  }
  v2 = (void *)[[NSString alloc] initWithBytesNoCopy:self->_placeholder->var10 length:self->_placeholder->var5 encoding:4 freeWhenDone:0];
  return (NSString *)v2;
}

- (NSArray)tokens
{
  placeholderTokens = self->_placeholderTokens;
  if (!placeholderTokens)
  {
    if (!strncmp(self->_placeholder->var0, "%{", 2uLL))
    {
      placeholderTokens = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v5 = self->_placeholder->var0 + 2;
      v6 = &v5[strspn(v5, ", ")];
      size_t v7 = strcspn(v6, ",}");
      if (v7)
      {
        size_t v8 = v7;
        uint64_t v9 = MEMORY[0x1E4F14390];
        do
        {
          if (!*v6 || *v6 == 125) {
            break;
          }
          size_t v10 = v8 - 1;
          while (v10 != -1)
          {
            unsigned int v11 = v6[v10];
            if ((v11 & 0x80000000) != 0) {
              int v12 = __maskrune(v11, 0x4000uLL);
            }
            else {
              int v12 = *(_DWORD *)(v9 + 4 * v11 + 60) & 0x4000;
            }
            --v10;
            if (!v12)
            {
              size_t v13 = v10 + 2;
              goto LABEL_18;
            }
          }
          size_t v13 = 0;
LABEL_18:
          v14 = (void *)[[NSString alloc] initWithBytesNoCopy:v6 length:v13 encoding:4 freeWhenDone:0];
          [(NSArray *)placeholderTokens addObject:v14];

          v15 = &v6[v8];
          if (!*v15) {
            break;
          }
          if (*v15 == 125) {
            break;
          }
          v6 = &v15[strspn(v15, ", }")];
          size_t v8 = strcspn(v6, ",}");
        }
        while (v8);
      }
    }
    else
    {
      placeholderTokens = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    self->_placeholderTokens = placeholderTokens;
  }
  return placeholderTokens;
}

- (NSString)rawString
{
  result = self->_placeholderString;
  if (!result)
  {
    result = (NSString *)[[NSString alloc] initWithBytesNoCopy:self->_placeholder->var0 length:self->_placeholder->var3 encoding:4 freeWhenDone:0];
    self->_placeholderString = result;
  }
  return result;
}

- (int)precision
{
  return self->_placeholder->var8;
}

- (int)width
{
  return self->_placeholder->var7;
}

@end
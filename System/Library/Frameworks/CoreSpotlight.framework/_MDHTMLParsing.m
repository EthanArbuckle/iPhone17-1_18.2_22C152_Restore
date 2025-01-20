@interface _MDHTMLParsing
+ (void)initialize;
- (_MDHTMLParsing)initWithEncoding:(unint64_t)a3;
- (void)appendNewline;
- (void)appendText:(const char *)a3 length:(unint64_t)a4;
- (void)appendUnichars:(const unsigned __int16 *)a3 length:(unint64_t)a4;
- (void)dealloc;
@end

@implementation _MDHTMLParsing

- (void)appendText:(const char *)a3 length:(unint64_t)a4
{
  if (!self->hiddenCount)
  {
    unint64_t uniCharLen = self->uniCharLen;
    if (uniCharLen < self->indexingLimit)
    {
      v7 = a3;
      if (self->newLineLength != a4 || (int v8 = memcmp(a3, self->newLineBuffer, a4), uniCharLen) || v8)
      {
        unint64_t uniCharSize = self->uniCharSize;
        if (uniCharLen + a4 > uniCharSize)
        {
          do
          {
            if (uniCharSize) {
              uniCharSize *= 2;
            }
            else {
              unint64_t uniCharSize = 4096;
            }
          }
          while (uniCharLen + a4 > uniCharSize);
          self->unint64_t uniCharSize = uniCharSize;
          self->uniChars = (unsigned __int16 *)malloc_type_realloc(self->uniChars, 2 * uniCharSize, 0x1000040BDFB0063uLL);
        }
        if (self->sourceCFEncoding == 134217984)
        {
          if ((uint64_t)a4 >= 1)
          {
            v10 = &v7[a4];
            v11 = v7;
            do
            {
              int v13 = *v11++;
              unsigned __int8 v12 = v13;
              LOWORD(v14) = v13;
              if (v13 < 0)
              {
                unint64_t v17 = (unint64_t)v12 >> 4;
                if ((v17 & 0xC) == 8) {
                  goto LABEL_29;
                }
                uint64_t v18 = utf8_len_table[v17];
                if (&v7[v18] > v10) {
                  return;
                }
                unsigned int v19 = utf8_first_char_mask[v18] & v14;
                if ((v17 & 0xC) == 0xC)
                {
                  if (v18 <= 2) {
                    int v20 = 2;
                  }
                  else {
                    int v20 = utf8_len_table[v17];
                  }
                  int v21 = v20 - 1;
                  do
                  {
                    char v22 = *v11++;
                    unsigned int v14 = v22 & 0x3F | (v19 << 6);
                    unsigned int v19 = v14;
                    --v21;
                  }
                  while (v21);
                }
                else
                {
                  v14 &= utf8_first_char_mask[v18];
                }
                if (v17 == 15)
                {
                  unint64_t v23 = self->uniCharLen;
                  v24 = &self->uniChars[v23];
                  unsigned __int16 *v24 = (v14 >> 10) - 10304;
                  self->unint64_t uniCharLen = v23 + 2;
                  v24[1] = v14 & 0x3FF | 0xDC00;
                  goto LABEL_29;
                }
              }
              uniChars = self->uniChars;
              unint64_t v16 = self->uniCharLen;
              self->unint64_t uniCharLen = v16 + 1;
              uniChars[v16] = v14;
LABEL_29:
              v7 = v11;
            }
            while (v11 < v10);
          }
        }
        else if (!CFStringEncodingBytesToUnicode())
        {
          self->unint64_t uniCharLen = self->uniCharLen;
        }
      }
    }
  }
}

- (void)appendNewline
{
  __int16 v2 = 10;
  [(_MDHTMLParsing *)self appendUnichars:&v2 length:1];
}

- (void)appendUnichars:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  if (!self->hiddenCount)
  {
    unint64_t uniCharLen = self->uniCharLen;
    if (uniCharLen < self->indexingLimit && (a4 != 1 || uniCharLen || *a3 != 10))
    {
      unint64_t uniCharSize = self->uniCharSize;
      if (uniCharLen + a4 <= uniCharSize)
      {
        uniChars = self->uniChars;
      }
      else
      {
        do
        {
          if (uniCharSize) {
            uniCharSize *= 2;
          }
          else {
            unint64_t uniCharSize = 4096;
          }
        }
        while (uniCharLen + a4 > uniCharSize);
        self->unint64_t uniCharSize = uniCharSize;
        uniChars = (unsigned __int16 *)malloc_type_realloc(self->uniChars, 2 * uniCharSize, 0x1000040BDFB0063uLL);
        self->uniChars = uniChars;
        unint64_t uniCharLen = self->uniCharLen;
      }
      memcpy(&uniChars[uniCharLen], a3, 2 * a4);
      self->uniCharLen += a4;
    }
  }
}

- (_MDHTMLParsing)initWithEncoding:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MDHTMLParsing;
  v4 = [(_MDHTMLParsing *)&v8 init];
  v4->sourceEncoding = a3;
  v4->sourceCFEncoding = CFStringConvertNSStringEncodingToEncoding(a3);
  [@"\n" getBytes:v4->newLineBuffer, 8, &v4->newLineLength, a3, 0, 0, objc_msgSend(@"\n", "length"), 0 maxLength usedLength encoding options range remainingRange];
  uint64_t v5 = objc_opt_new();
  attributes = v4->attributes;
  v4->attributes = (NSMutableDictionary *)v5;

  return v4;
}

- (void)dealloc
{
  uniChars = self->uniChars;
  if (uniChars) {
    free(uniChars);
  }
  v4.receiver = self;
  v4.super_class = (Class)_MDHTMLParsing;
  [(_MDHTMLParsing *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->metaContent, 0);
  objc_storeStrong((id *)&self->metaHttpEquiv, 0);
  objc_storeStrong((id *)&self->metaName, 0);

  objc_storeStrong((id *)&self->attributes, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    CFAllocatorContext v2 = *(CFAllocatorContext *)byte_1EDBB1D60;
    sHTMLDataDeallocator = (uint64_t)CFAllocatorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &v2);
  }
}

@end
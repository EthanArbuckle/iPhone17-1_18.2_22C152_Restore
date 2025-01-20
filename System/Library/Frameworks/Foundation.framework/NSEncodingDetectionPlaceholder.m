@interface NSEncodingDetectionPlaceholder
+ (id)placeholderForDetector:(id)a3;
- (NSString)string;
- (char)bytes;
- (id)debugDescription;
- (unint64_t)bytesLength;
- (unint64_t)nsEncoding;
- (unsigned)cfEncoding;
- (void)dealloc;
@end

@implementation NSEncodingDetectionPlaceholder

- (unint64_t)nsEncoding
{
  return self->nsEncoding;
}

- (unsigned)cfEncoding
{
  return self->cfEncoding;
}

- (NSString)string
{
  return self->string;
}

- (char)bytes
{
  return self->bytesStart;
}

- (unint64_t)bytesLength
{
  return self->bytesLength;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  bytes = self->bytes;
  if (bytes)
  {
    free(bytes);
    self->bytes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSEncodingDetectionPlaceholder;
  [(NSEncodingDetectionPlaceholder *)&v4 dealloc];
}

+ (id)placeholderForDetector:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  if (qword_1EB1ED120 != -1) {
    dispatch_once(&qword_1EB1ED120, &__block_literal_global);
  }
  uint64_t v4 = [a3 nsEncoding];
  unsigned int v5 = [a3 cfEncoding];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_89);
  id v6 = (id)[(id)qword_1EB1ED128 objectForKey:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_89);
  if (!v6)
  {
    size_t v8 = [@"#<^_NSEDR_^#<" lengthOfBytesUsingEncoding:v4];
    p_isa = (void *)v8;
    if (!v8) {
      return p_isa;
    }
    v19[0] = 0;
    if (v5 - 2080 > 2)
    {
      v11 = (unsigned __int16 *)malloc_type_malloc(v8, 0x100004077774924uLL);
      if ([@"#<^_NSEDR_^#<" getBytes:v11, p_isa, v19, v4, 0, 0, objc_msgSend(@"#<^_NSEDR_^#<", "length"), 0 maxLength usedLength encoding options range remainingRange])
      {
        HIDWORD(v14) = v5 - 256;
        LODWORD(v14) = v5 - 256;
        unsigned int v13 = v14 >> 26;
        if (v13 <= 7)
        {
          if (((1 << v13) & 0x31) != 0)
          {
            int v16 = *v11;
            if (v16 != 65534 && v16 != 65279) {
              goto LABEL_12;
            }
            v12 = v11 + 1;
            uint64_t v15 = v19[0] - 2;
          }
          else if (((1 << v13) & 0xC8) != 0)
          {
            if (*(_DWORD *)v11 != 65534 && *(_DWORD *)v11 != 65279) {
              goto LABEL_12;
            }
            v12 = v11 + 2;
            uint64_t v15 = v19[0] - 4;
          }
          else
          {
            if (v13 != 2) {
              goto LABEL_12;
            }
            uint64_t v15 = v19[0] - 3;
            if (v19[0] < 3uLL
              || *(unsigned __int8 *)v11 != 239
              || *((unsigned __int8 *)v11 + 1) != 187
              || *((unsigned __int8 *)v11 + 2) != 191)
            {
              goto LABEL_12;
            }
            v12 = (unsigned __int16 *)((char *)v11 + 3);
          }
          v19[0] = v15;
          goto LABEL_27;
        }
LABEL_12:
        v12 = v11;
LABEL_27:
        p_isa = 0;
        if (v11)
        {
          if (v12)
          {
            v17 = objc_alloc_init(NSEncodingDetectionPlaceholder);
            p_isa = &v17->super.isa;
            if (v17)
            {
              v17->nsEncoding = v4;
              v17->cfEncoding = v5;
              v17->string = (NSString *)@"#<^_NSEDR_^#<";
              p_isa[4] = v11;
              p_isa[5] = v19[0];
              p_isa[6] = v12;
              v18 = p_isa;
              os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_89);
              [(id)qword_1EB1ED128 setObject:p_isa forKey:v5];
              os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_89);
            }
          }
        }
        return p_isa;
      }
    }
    else
    {
      v10 = (unsigned __int16 *)malloc_type_malloc(v8 + 3, 0xDC9280E4uLL);
      if (!v10) {
        return 0;
      }
      v11 = v10;
      unsigned __int16 *v10 = 10267;
      *((unsigned char *)v10 + 2) = 66;
      if ([@"#<^_NSEDR_^#<" getBytes:(char *)v10 + 3, p_isa, v19, v4, 0, 0, objc_msgSend(@"#<^_NSEDR_^#<", "length"), 0 maxLength usedLength encoding options range remainingRange])
      {
        v19[0] += 3;
        goto LABEL_12;
      }
    }
    free(v11);
    return 0;
  }

  return v6;
}

NSMapTable *__57__NSEncodingDetectionPlaceholder_placeholderForDetector___block_invoke()
{
  result = [[NSMapTable alloc] initWithKeyOptions:1282 valueOptions:0 capacity:16];
  qword_1EB1ED128 = (uint64_t)result;
  return result;
}

- (id)debugDescription
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSEncodingDetectionPlaceholder;
  return +[NSString stringWithFormat:@"%@ string:\"%@\" nsEncoding:%lu cfEncoding:%u bytes:%p bytesLength:%lu bytesStart:%p", [(NSEncodingDetectionPlaceholder *)&v3 debugDescription], self->string, self->nsEncoding, self->cfEncoding, self->bytes, self->bytesLength, self->bytesStart];
}

@end
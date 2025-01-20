@interface NEHasher
+ (id)hashObject:(id)a3;
+ (id)hashObject:(id)a3 withClassPrefixWhitelist:(id)a4;
- (BOOL)allowsKeyedCoding;
- (BOOL)containsValueForKey:(id)a3;
- (BOOL)decodeBoolForKey:(id)a3;
- (NEHasher)init;
- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4;
- (double)decodeDoubleForKey:(id)a3;
- (float)decodeFloatForKey:(id)a3;
- (id)decodeDataObject;
- (id)finishHashing;
- (int)decodeInt32ForKey:(id)a3;
- (int)decodeIntForKey:(id)a3;
- (int64_t)decodeInt64ForKey:(id)a3;
- (int64_t)decodeIntegerForKey:(id)a3;
- (int64_t)versionForClassName:(id)a3;
- (void)dealloc;
- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4;
- (void)encodeBool:(BOOL)a3 forKey:(id)a4;
- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4;
- (void)encodeDataObject:(id)a3;
- (void)encodeDouble:(double)a3 forKey:(id)a4;
- (void)encodeFloat:(float)a3 forKey:(id)a4;
- (void)encodeInt32:(int)a3 forKey:(id)a4;
- (void)encodeInt64:(int64_t)a3 forKey:(id)a4;
- (void)encodeInt:(int)a3 forKey:(id)a4;
- (void)encodeInteger:(int64_t)a3 forKey:(id)a4;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
@end

@implementation NEHasher

- (void).cxx_destruct
{
}

- (int)decodeIntForKey:(id)a3
{
  int v4 = 0;
  [(NEHasher *)self decodeValueOfObjCType:"i" at:&v4 size:4];
  return v4;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  int64_t v4 = 0;
  [(NEHasher *)self decodeValueOfObjCType:"q" at:&v4 size:8];
  return v4;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  int64_t v4 = 0;
  [(NEHasher *)self decodeValueOfObjCType:"q" at:&v4 size:8];
  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  int v4 = 0;
  [(NEHasher *)self decodeValueOfObjCType:"i" at:&v4 size:4];
  return v4;
}

- (float)decodeFloatForKey:(id)a3
{
  float v4 = 0.0;
  [(NEHasher *)self decodeValueOfObjCType:"f" at:&v4 size:4];
  return v4;
}

- (double)decodeDoubleForKey:(id)a3
{
  double v4 = 0.0;
  [(NEHasher *)self decodeValueOfObjCType:"d" at:&v4 size:8];
  return v4;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(unint64_t *)a4
{
  v5 = self;

  return (const char *)[(NEHasher *)v5 decodeBytesWithReturnedLength:a4];
}

- (BOOL)decodeBoolForKey:(id)a3
{
  BOOL v4 = 0;
  [(NEHasher *)self decodeValueOfObjCType:"B" at:&v4 size:1];
  return v4;
}

- (id)decodeDataObject
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NEHasherInvalidOperationException" reason:@"NEHasher cannot be used as a decoder" userInfo:0];
  objc_exception_throw(v2);
}

- (void)decodeValueOfObjCType:(const char *)a3 at:(void *)a4
{
  id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"NEHasherInvalidOperationException" reason:@"NEHasher cannot be used as a decoder" userInfo:0];
  objc_exception_throw(v4);
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  int64_t v4 = a3;
  [(NEHasher *)self encodeValueOfObjCType:"q" at:&v4];
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  int v4 = a3;
  [(NEHasher *)self encodeValueOfObjCType:"i" at:&v4];
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  int64_t v4 = a3;
  [(NEHasher *)self encodeValueOfObjCType:"q" at:&v4];
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  float v4 = a3;
  [(NEHasher *)self encodeValueOfObjCType:"f" at:&v4];
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  int v4 = a3;
  [(NEHasher *)self encodeValueOfObjCType:"i" at:&v4];
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  double v4 = a3;
  [(NEHasher *)self encodeValueOfObjCType:"d" at:&v4];
}

- (void)encodeBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a3 && a4)
  {
    if (self) {
      self = (NEHasher *)self->_sha1Context;
    }
    CC_SHA1_Update((CC_SHA1_CTX *)self, a3, a4);
  }
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  [(NEHasher *)self encodeValueOfObjCType:"B" at:&v4];
}

- (void)encodeDataObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    if ([v4 length])
    {
      if (self) {
        self = (NEHasher *)self->_sha1Context;
      }
      id v5 = v6;
      CC_SHA1_Update((CC_SHA1_CTX *)self, (const void *)[v5 bytes], objc_msgSend(v5, "length"));
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (!a4) {
    return;
  }
  id v5 = self;
  int v6 = *a3;
  if (v6 == 64)
  {
    id v7 = *(id *)a4;
    v8 = v7;
    if (!v7)
    {
LABEL_42:

      return;
    }
    if (isa_nsdictionary(v7))
    {
      id v9 = v8;
      [v9 allKeys];
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v66 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v59;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v59 != v13) {
              objc_enumerationMutation(v10);
            }
            if (!isa_nsstring(*(void **)(*((void *)&v58 + 1) + 8 * i)))
            {

              v15 = ne_log_obj();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(data) = 0;
                _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "Not hashing dictionary containing one or more non-string keys", (uint8_t *)&data, 2u);
              }
              goto LABEL_39;
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      v15 = [v10 sortedArrayUsingSelector:NSSelectorFromString(&cfstr_Compare.isa)];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v54 objects:v65 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v55;
        do
        {
          for (uint64_t j = 0; j != v17; ++j)
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = [v9 objectForKeyedSubscript:*(void *)(*((void *)&v54 + 1) + 8 * j)];
            [(NEHasher *)v5 encodeObject:v20];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v54 objects:v65 count:16];
        }
        while (v17);
      }
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    if (isa_nsarray(v8))
    {
      id v9 = v8;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v22 = [v9 countByEnumeratingWithState:&v50 objects:v64 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v51;
        do
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v51 != v24) {
              objc_enumerationMutation(v9);
            }
            [(NEHasher *)v5 encodeObject:*(void *)(*((void *)&v50 + 1) + 8 * k)];
          }
          uint64_t v23 = [v9 countByEnumeratingWithState:&v50 objects:v64 count:16];
        }
        while (v23);
      }
LABEL_41:

      goto LABEL_42;
    }
    if (isa_nsdata(v8))
    {
      [(NEHasher *)v5 encodeDataObject:v8];
      goto LABEL_42;
    }
    if (isa_nsstring(v8))
    {
      v28 = (const char *)[v8 UTF8String];
      if (v5) {
LABEL_59:
      }
        id v5 = (NEHasher *)v5->_sha1Context;
    }
    else
    {
      if (isa_nsnumber(v8))
      {
        [v8 doubleValue];
        *(void *)&long long data = v32;
        if (v5) {
          sha1Context = v5->_sha1Context;
        }
        else {
          sha1Context = 0;
        }
        p_long long data = (const char *)&data;
        CC_LONG v29 = 8;
        goto LABEL_69;
      }
      if (isa_nsuuid(v8))
      {
        long long data = 0uLL;
        [v8 getUUIDBytes:&data];
        if (v5) {
          sha1Context = v5->_sha1Context;
        }
        else {
          sha1Context = 0;
        }
        p_long long data = (const char *)&data;
        CC_LONG v29 = 16;
        goto LABEL_69;
      }
      if (!isa_nsurl(v8))
      {
        if (isa_neclass())
        {
          [v8 encodeWithCoder:v5];
        }
        else
        {
          if (v5) {
            id Property = objc_getProperty(v5, v34, 16, 1);
          }
          else {
            id Property = 0;
          }
          if ([Property count])
          {
            v36 = (objc_class *)objc_opt_class();
            NSStringFromClass(v36);
            id v9 = (id)objc_claimAutoreleasedReturnValue();
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            if (v5) {
              id v38 = objc_getProperty(v5, v37, 16, 1);
            }
            else {
              id v38 = 0;
            }
            id v10 = v38;
            uint64_t v39 = [v10 countByEnumeratingWithState:&v46 objects:v62 count:16];
            if (v39)
            {
              uint64_t v40 = v39;
              uint64_t v41 = *(void *)v47;
              while (2)
              {
                for (uint64_t m = 0; m != v40; ++m)
                {
                  if (*(void *)v47 != v41) {
                    objc_enumerationMutation(v10);
                  }
                  if (objc_msgSend(v9, "hasPrefix:", *(void *)(*((void *)&v46 + 1) + 8 * m), (void)v46))
                  {
                    [v8 encodeWithCoder:v5];
                    goto LABEL_40;
                  }
                }
                uint64_t v40 = [v10 countByEnumeratingWithState:&v46 objects:v62 count:16];
                if (v40) {
                  continue;
                }
                break;
              }
            }
          }
          v43 = ne_log_obj();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            v44 = (objc_class *)objc_opt_class();
            v45 = NSStringFromClass(v44);
            LODWORD(data) = 138412290;
            *(void *)((char *)&data + 4) = v45;
            _os_log_debug_impl(&dword_19DDAF000, v43, OS_LOG_TYPE_DEBUG, "Not hashing value with class %@", (uint8_t *)&data, 0xCu);
          }
        }
        goto LABEL_42;
      }
      id v33 = [v8 absoluteString];
      v28 = (const char *)[v33 UTF8String];

      if (v5) {
        goto LABEL_59;
      }
    }
    CC_LONG v29 = strlen(v28);
    sha1Context = (CC_SHA1_CTX *)v5;
    p_long long data = v28;
LABEL_69:
    CC_SHA1_Update(sha1Context, p_data, v29);
    goto LABEL_42;
  }
  CC_LONG v21 = 1;
  if (v6 > 80)
  {
    switch(v6)
    {
      case 'c':
        goto LABEL_47;
      case 'd':
      case 'l':
        goto LABEL_46;
      case 'e':
      case 'f':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
        goto LABEL_54;
      case 'i':
        goto LABEL_27;
      default:
        if (v6 == 81 || v6 == 113) {
          goto LABEL_46;
        }
        goto LABEL_54;
    }
  }
  if ((v6 - 66) >= 2)
  {
    if (v6 == 73)
    {
LABEL_27:
      CC_LONG v21 = 4;
    }
    else
    {
      if (v6 != 76)
      {
LABEL_54:
        v27 = ne_log_obj();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(data) = 136315138;
          *(void *)((char *)&data + 4) = a3;
          _os_log_debug_impl(&dword_19DDAF000, v27, OS_LOG_TYPE_DEBUG, "Not hashing value with type %s", (uint8_t *)&data, 0xCu);
        }

        return;
      }
LABEL_46:
      CC_LONG v21 = 8;
    }
  }
LABEL_47:
  if (self) {
    v26 = self->_sha1Context;
  }
  else {
    v26 = 0;
  }

  CC_SHA1_Update(v26, a4, v21);
}

- (int64_t)versionForClassName:(id)a3
{
  return 0;
}

- (BOOL)containsValueForKey:(id)a3
{
  return 0;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)dealloc
{
  if (self)
  {
    sha1Context = self->_sha1Context;
    if (sha1Context) {
      free(sha1Context);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NEHasher;
  [(NEHasher *)&v4 dealloc];
}

- (NEHasher)init
{
  v5.receiver = self;
  v5.super_class = (Class)NEHasher;
  id v2 = [(NEHasher *)&v5 init];
  if (v2)
  {
    v3 = (CC_SHA1_CTX *)malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
    v2->_sha1Context = v3;
    CC_SHA1_Init(v3);
  }
  return v2;
}

+ (id)hashObject:(id)a3 withClassPrefixWhitelist:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(NEHasher);
  id v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v6, 16);
    [(NEHasher *)v9 encodeRootObject:v5];
    id v10 = -[NEHasher finishHashing]((uint64_t)v9);
  }
  else
  {
    [0 encodeRootObject:v5];
    id v10 = 0;
  }

  return v10;
}

- (id)finishHashing
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1 && (id v2 = *(CC_SHA1_CTX **)(a1 + 8)) != 0)
  {
    CC_SHA1_Final(md, v2);
    v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
    free(*(void **)(a1 + 8));
    *(void *)(a1 + 8) = 0;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)hashObject:(id)a3
{
  id v3 = a3;
  objc_super v4 = objc_alloc_init(NEHasher);
  [(NEHasher *)v4 encodeRootObject:v3];

  id v5 = -[NEHasher finishHashing]((uint64_t)v4);

  return v5;
}

@end
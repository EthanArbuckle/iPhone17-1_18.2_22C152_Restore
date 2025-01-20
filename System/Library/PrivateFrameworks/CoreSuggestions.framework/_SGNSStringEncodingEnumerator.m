@interface _SGNSStringEncodingEnumerator
- (_SGNSStringEncodingEnumerator)initWithString:(id)a3 encoding:(unint64_t)a4 nullTerminated:(BOOL)a5;
- (id)nextObject;
- (id)nullTerminationIfNeeded;
@end

@implementation _SGNSStringEncodingEnumerator

- (void).cxx_destruct
{
}

- (id)nextObject
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_remaining = &self->_remaining;
  if (!self->_remaining.length)
  {
    uint64_t v4 = [(_SGNSStringEncodingEnumerator *)self nullTerminationIfNeeded];
    goto LABEL_5;
  }
  if (self->_needsBOM)
  {
    self->_needsBOM = 0;
    uint64_t v4 = bomData();
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_14;
  }
  v6 = (void *)MEMORY[0x1A6265250]();
  bzero(v13, 0x1000uLL);
  unint64_t v12 = 0;
  _NSRange v11 = (_NSRange)0;
  if (-[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self->_string, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13, 4096, &v12, self->_encoding, 0, p_remaining->location, p_remaining->length, &v11))
  {
    if (!v11.length)
    {
      unint64_t v7 = v12;
      if (v12 <= 0xFFF && self->_needsNullTermination)
      {
        self->_needsNullTermination = 0;
        unint64_t v12 = v7 + 1;
        v13[v7] = 0;
      }
    }
    _NSRange *p_remaining = v11;
    id v8 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v9 = [v8 initWithBytes:v13 length:v12];
  }
  else
  {
    uint64_t v9 = [(_SGNSStringEncodingEnumerator *)self nullTerminationIfNeeded];
  }
  v5 = (void *)v9;
LABEL_14:

  return v5;
}

- (id)nullTerminationIfNeeded
{
  if (self->_needsNullTermination)
  {
    self->_needsNullTermination = 0;
    v2 = nullByteData();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (_SGNSStringEncodingEnumerator)initWithString:(id)a3 encoding:(unint64_t)a4 nullTerminated:(BOOL)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SGNSStringEncodingEnumerator;
  v10 = [(_SGNSStringEncodingEnumerator *)&v14 init];
  _NSRange v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_string, a3);
    v11->_encoding = a4;
    uint64_t v12 = [v9 length];
    v11->_remaining.location = 0;
    v11->_remaining.length = v12;
    v11->_needsBOM = a4 == 10;
    v11->_needsNullTermination = a5;
  }

  return v11;
}

@end
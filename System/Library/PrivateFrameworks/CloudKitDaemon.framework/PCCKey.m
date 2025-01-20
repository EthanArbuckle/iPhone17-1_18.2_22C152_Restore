@interface PCCKey
- (PCCKey)init;
- (id)decrypt:(id)a3;
- (id)encrypt:(id)a3;
- (pcc_invocation_key)secret;
- (void)clear;
- (void)dealloc;
- (void)setSecret:(pcc_invocation_key *)a3;
@end

@implementation PCCKey

- (PCCKey)init
{
  v4.receiver = self;
  v4.super_class = (Class)PCCKey;
  v2 = [(PCCKey *)&v4 init];
  if (v2) {
    v2->_secret = (pcc_invocation_key *)sub_1C504C93C();
  }
  return v2;
}

- (id)encrypt:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_length(v4, v5, v6);
  id v8 = v4;
  uint64_t v11 = objc_msgSend_bytes(v8, v9, v10);

  uint64_t v16 = v7 + 32;
  v12 = malloc_type_malloc(v7 + 32, 0x347E0090uLL);
  if (v12)
  {
    v13 = v12;
    if (sub_1C504CD10((uint64_t)self->_secret, v11, v7, (uint64_t)v12, &v16))
    {
      free(v13);
      v12 = 0;
    }
    else
    {
      v12 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v14, (uint64_t)v13, v16, 1);
    }
  }
  return v12;
}

- (id)decrypt:(id)a3
{
  id v4 = a3;
  unint64_t v7 = objc_msgSend_length(v4, v5, v6);
  id v8 = v4;
  uint64_t v11 = objc_msgSend_bytes(v8, v9, v10);

  if (v7 >= 0x20) {
    size_t v12 = v7 - 32;
  }
  else {
    size_t v12 = 0;
  }
  size_t v17 = v12;
  v13 = malloc_type_malloc(v12, 0xB6BB72D3uLL);
  if (v13)
  {
    v14 = v13;
    if (sub_1C504CE78((uint64_t)self->_secret, v11, v7, (uint64_t)v13, &v17))
    {
      free(v14);
      v13 = 0;
    }
    else
    {
      v13 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v15, (uint64_t)v14, v17, 1);
    }
  }
  return v13;
}

- (void)clear
{
}

- (void)dealloc
{
  objc_msgSend_clear(self, a2, v2);
  secret = self->_secret;
  cc_clear();
  free(secret);
  v5.receiver = self;
  v5.super_class = (Class)PCCKey;
  [(PCCKey *)&v5 dealloc];
}

- (pcc_invocation_key)secret
{
  return self->_secret;
}

- (void)setSecret:(pcc_invocation_key *)a3
{
  self->_secret = a3;
}

@end
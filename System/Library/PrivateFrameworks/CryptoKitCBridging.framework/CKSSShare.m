@interface CKSSShare
- (CKSSShare)initWithParams:(ccss_shamir_parameters *)a3 share:(ccss_shamir_share *)a4;
- (CKSSShare)initWithParams:(ccss_shamir_parameters *)a3 x:(unsigned int)a4 y:(id)a5;
- (ccss_shamir_share)share;
- (id)y;
- (unsigned)x;
- (void)dealloc;
@end

@implementation CKSSShare

- (CKSSShare)initWithParams:(ccss_shamir_parameters *)a3 x:(unsigned int)a4 y:(id)a5
{
  id v6 = a5;
  v12.receiver = self;
  v12.super_class = (Class)CKSSShare;
  v7 = [(CKSSShare *)&v12 init];
  if (v7
    && (size_t v8 = ccss_sizeof_share(),
        v7->_share_size = v8,
        v7->_share = (ccss_shamir_share *)malloc_type_malloc(v8, 0xE4DEA011uLL),
        ccss_shamir_share_init(),
        id v9 = v6,
        [v9 bytes],
        [v9 length],
        ccss_shamir_share_import()))
  {
    free(v7->_share);
    printf("Failed on import with share import");
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (CKSSShare)initWithParams:(ccss_shamir_parameters *)a3 share:(ccss_shamir_share *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CKSSShare;
  v5 = [(CKSSShare *)&v9 init];
  if (v5)
  {
    size_t v6 = ccss_sizeof_share();
    v5->_share_size = v6;
    v7 = (ccss_shamir_share *)malloc_type_malloc(v6, 0x9EABD7B7uLL);
    v5->_share = v7;
    memcpy(v7, a4, v5->_share_size);
  }
  return v5;
}

- (unsigned)x
{
  id v2 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:ccss_shamir_share_sizeof_y()];
  [v2 mutableBytes];
  [v2 length];
  ccss_shamir_share_export();

  return 0;
}

- (id)y
{
  id v2 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:ccss_shamir_share_sizeof_y()];
  [v2 mutableBytes];
  [v2 length];
  if (ccss_shamir_share_export()) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }

  return v3;
}

- (ccss_shamir_share)share
{
  return self->_share;
}

- (void)dealloc
{
  cc_clear();
  free(self->_share);
  v3.receiver = self;
  v3.super_class = (Class)CKSSShare;
  [(CKSSShare *)&v3 dealloc];
}

@end
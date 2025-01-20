@interface CKCBCorecryptoECPoint
+ (unint64_t)compressedx962PointByteCountForCurveParameters:(ccec_cp *)a3;
+ (unint64_t)groupOrderByteCountForCP:(ccec_cp *)a3;
- (BOOL)isEqual:(id)a3;
- (CKCBCorecryptoECPoint)initWithGeneratorForCP:(ccec_cp *)a3;
- (CKCBCorecryptoECPoint)initWithPublicKey:(ccec_pub_ctx *)a3;
- (ccec_affine_point)point;
- (ccec_cp)group;
- (id)add:(id)a3 corecryptoError:(int *)a4;
- (id)initFromPublicKeyBytes:(id)a3 inGroup:(ccec_cp *)a4 compressed:(BOOL)a5 corecryptoError:(int *)a6;
- (id)initPoint:(ccec_affine_point *)a3 onGroup:(ccec_cp *)a4;
- (id)multiply:(id)a3 corecryptoError:(int *)a4;
- (id)serializedPublicKey:(BOOL)a3;
- (id)sub:(id)a3 corecryptoError:(int *)a4;
- (unint64_t)pointAllocationSizeForGroup:(ccec_cp *)a3;
- (void)dealloc;
@end

@implementation CKCBCorecryptoECPoint

- (unint64_t)pointAllocationSizeForGroup:(ccec_cp *)a3
{
  return 3 * ((unint64_t)(cczp_bitlen() + 7) >> 3);
}

- (id)initPoint:(ccec_affine_point *)a3 onGroup:(ccec_cp *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKCBCorecryptoECPoint;
  id result = [(CKCBCorecryptoECPoint *)&v7 init];
  if (result)
  {
    *((void *)result + 1) = a4;
    *((void *)result + 2) = a3;
  }
  return result;
}

- (id)initFromPublicKeyBytes:(id)a3 inGroup:(ccec_cp *)a4 compressed:(BOOL)a5 corecryptoError:(int *)a6
{
  BOOL v7 = a5;
  v20[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v12 = (void *)MEMORY[0x1F4188790](v9, v10, v11);
  v14 = (char *)v20 - v13;
  [v12 length];
  id v15 = v9;
  [v15 bytes];
  if (v7) {
    int v16 = ccec_compressed_x962_import_pub();
  }
  else {
    int v16 = ccec_raw_import_pub();
  }
  *a6 = v16;
  if (v16)
  {
    cc_clear();
    v17 = 0;
  }
  else
  {
    v18 = [(CKCBCorecryptoECPoint *)self initWithPublicKey:v14];
    cc_clear();
    self = v18;
    v17 = self;
  }

  return v17;
}

- (CKCBCorecryptoECPoint)initWithGeneratorForCP:(ccec_cp *)a3
{
  size_t v5 = -[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:");
  v6 = malloc_type_malloc(v5, 0xA1D9AA7CuLL);
  BOOL v7 = (char *)&a3[1] + 16 * a3->var0 + 8 * a3->var0;
  bzero(v6, v5);
  memcpy(v6, v7, 16 * a3->var0);
  return (CKCBCorecryptoECPoint *)[(CKCBCorecryptoECPoint *)self initPoint:v6 onGroup:a3];
}

- (CKCBCorecryptoECPoint)initWithPublicKey:(ccec_pub_ctx *)a3
{
  v4 = &a3->var1[1];
  var0 = a3->var0;
  size_t v6 = [(CKCBCorecryptoECPoint *)self pointAllocationSizeForGroup:a3->var0];
  BOOL v7 = malloc_type_malloc(v6, 0x16B7CB37uLL);
  memcpy(v7, v4, v6);
  cc_clear();
  return (CKCBCorecryptoECPoint *)[(CKCBCorecryptoECPoint *)self initPoint:v7 onGroup:var0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  size_t v5 = [(CKCBCorecryptoECPoint *)self group];
  if (v5 == (ccec_cp *)[v4 group])
  {
    [(CKCBCorecryptoECPoint *)self group];
    [(CKCBCorecryptoECPoint *)self point];
    [v4 point];
    BOOL v6 = ccn_cmp() == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)serializedPublicKey:(BOOL)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  group = self->_group;
  uint64_t v6 = cczp_bitlen();
  unint64_t v9 = (unint64_t)(v6 + 7) >> 3;
  if (a3)
  {
    MEMORY[0x1F4188790](v6, v7, v8);
    *(void *)((char *)v16 - v10) = group;
    memcpy((char *)&v16[2] - v10, self->_point, 2 * v9);
    id v11 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:ccec_compressed_x962_export_pub_size()];
    [v11 mutableBytes];
    int v12 = ccec_compressed_x962_export_pub();
    cc_clear();
    if (v12) {
      id v13 = 0;
    }
    else {
      id v13 = v11;
    }
  }
  else
  {
    id v14 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:2 * v9];
    [v14 mutableBytes];
    ccn_write_uint_padded_ct();
    id v13 = v14;
    [v13 mutableBytes];
    ccn_write_uint_padded_ct();
  }
  return v13;
}

+ (unint64_t)groupOrderByteCountForCP:(ccec_cp *)a3
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

+ (unint64_t)compressedx962PointByteCountForCurveParameters:(ccec_cp *)a3
{
  return ccec_compressed_x962_export_pub_size();
}

- (id)add:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CKCBCorecryptoECPoint *)self group];
  if (v7 != (ccec_cp *)[v6 group] || (uint64_t v8 = ccrng(), *a4))
  {
    id v11 = 0;
    goto LABEL_4;
  }
  group = self->_group;
  uint64_t v14 = MEMORY[0x1F4188790](v8, v9, v10);
  MEMORY[0x1F4188790](v14, v15, v16);
  [(CKCBCorecryptoECPoint *)self point];
  int v17 = ccec_projectify();
  *a4 = v17;
  if (v17 || ([v6 point], int v18 = ccec_projectify(), (*a4 = v18) != 0))
  {
    cc_clear();
LABEL_10:
    cc_clear();
LABEL_11:
    id v11 = 0;
    goto LABEL_4;
  }
  *a4 = ccec_full_add();
  cc_clear();
  if (*a4) {
    goto LABEL_10;
  }
  v19 = malloc_type_malloc([(CKCBCorecryptoECPoint *)self pointAllocationSizeForGroup:group], 0x4349E20AuLL);
  *a4 = ccec_affinify();
  cc_clear();
  if (*a4)
  {
    free(v19);
    goto LABEL_11;
  }
  id v11 = [[CKCBCorecryptoECPoint alloc] initPoint:v19 onGroup:group];
LABEL_4:

  return v11;
}

- (id)sub:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CKCBCorecryptoECPoint *)self group];
  if (v7 != (ccec_cp *)[v6 group] || (uint64_t v8 = ccrng(), *a4))
  {
    id v11 = 0;
    goto LABEL_4;
  }
  group = self->_group;
  uint64_t v14 = MEMORY[0x1F4188790](v8, v9, v10);
  MEMORY[0x1F4188790](v14, v15, v16);
  [(CKCBCorecryptoECPoint *)self point];
  int v17 = ccec_projectify();
  *a4 = v17;
  if (v17 || ([v6 point], int v18 = ccec_projectify(), (*a4 = v18) != 0))
  {
    cc_clear();
LABEL_10:
    cc_clear();
LABEL_11:
    id v11 = 0;
    goto LABEL_4;
  }
  *a4 = ccec_full_sub();
  cc_clear();
  if (*a4) {
    goto LABEL_10;
  }
  v19 = malloc_type_malloc([(CKCBCorecryptoECPoint *)self pointAllocationSizeForGroup:group], 0x173E04EuLL);
  *a4 = ccec_affinify();
  cc_clear();
  if (*a4)
  {
    free(v19);
    goto LABEL_11;
  }
  id v11 = [[CKCBCorecryptoECPoint alloc] initPoint:v19 onGroup:group];
LABEL_4:

  return v11;
}

- (id)multiply:(id)a3 corecryptoError:(int *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CKCBCorecryptoECPoint *)self group];
  if (v7 != (ccec_cp *)[v6 group] || (uint64_t v8 = ccrng(), *a4))
  {
    id v11 = 0;
    goto LABEL_4;
  }
  group = self->_group;
  uint64_t v14 = MEMORY[0x1F4188790](v8, v9, v10);
  MEMORY[0x1F4188790](v14, v15, v16);
  [(CKCBCorecryptoECPoint *)self point];
  int v17 = ccec_projectify();
  *a4 = v17;
  if (v17)
  {
    cc_clear();
LABEL_10:
    cc_clear();
LABEL_11:
    id v11 = 0;
    goto LABEL_4;
  }
  [v6 corecryptoScalar];
  *a4 = ccec_mult_blinded();
  cc_clear();
  if (*a4) {
    goto LABEL_10;
  }
  int v18 = malloc_type_malloc([(CKCBCorecryptoECPoint *)self pointAllocationSizeForGroup:group], 0xFA8B0956uLL);
  *a4 = ccec_affinify();
  cc_clear();
  if (*a4)
  {
    free(v18);
    goto LABEL_11;
  }
  id v11 = [[CKCBCorecryptoECPoint alloc] initPoint:v18 onGroup:group];
LABEL_4:

  return v11;
}

- (void)dealloc
{
  if (self->_point)
  {
    rsize_t v3 = [(CKCBCorecryptoECPoint *)self pointAllocationSizeForGroup:[(CKCBCorecryptoECPoint *)self group]];
    memset_s(self->_point, v3, 0, v3);
    free(self->_point);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKCBCorecryptoECPoint;
  [(CKCBCorecryptoECPoint *)&v4 dealloc];
}

- (ccec_cp)group
{
  return self->_group;
}

- (ccec_affine_point)point
{
  return self->_point;
}

@end
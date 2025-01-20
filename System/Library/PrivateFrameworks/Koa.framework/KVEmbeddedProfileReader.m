@interface KVEmbeddedProfileReader
- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4;
- (KVEmbeddedProfileReader)initWithData:(id)a3 profile:(const Profile *)a4 profileInfo:(id)a5;
- (NSString)description;
- (id)data;
- (id)profileInfo;
@end

@implementation KVEmbeddedProfileReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSString)description
{
  v5 = objc_msgSend_stringWithFormat_(NSString, a2, @"profile format: %@ info: %@", v2, v3, v4, @"Binary Embedded", self->_profileInfo);

  return (NSString *)v5;
}

- (id)profileInfo
{
  return self->_profileInfo;
}

- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4
{
  v6 = (uint64_t (**)(id, void *))a4;
  profile = self->_profile;
  v8 = &profile[-*(int *)profile->var0];
  if (*(unsigned __int16 *)v8->var0 >= 7u
    && (uint64_t v9 = *(unsigned __int16 *)v8[6].var0) != 0
    && (v10 = &profile[v9],
        uint64_t v11 = *(unsigned int *)v10->var0,
        v13 = &v10[v11 + 4],
        uint64_t v12 = *(unsigned int *)v10[v11].var0,
        v12))
  {
    uint64_t v14 = 4 * v12;
    while (1)
    {
      uint64_t v15 = *(unsigned int *)v13->var0;
      v16 = [KVEmbeddedDatasetReader alloc];
      v19 = objc_msgSend_initWithData_dataset_error_(v16, v17, (uint64_t)self->_data, (uint64_t)&v13[v15], (uint64_t)a3, v18);
      if (!v19 || (v6[2](v6, v19) & 1) == 0) {
        break;
      }

      v13 += 4;
      v14 -= 4;
      if (!v14) {
        goto LABEL_8;
      }
    }

    BOOL v20 = 0;
  }
  else
  {
LABEL_8:
    BOOL v20 = 1;
  }

  return v20;
}

- (id)data
{
  return self->_data;
}

- (KVEmbeddedProfileReader)initWithData:(id)a3 profile:(const Profile *)a4 profileInfo:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KVEmbeddedProfileReader;
  uint64_t v11 = [(KVEmbeddedProfileReader *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    v12->_profile = a4;
    objc_storeStrong((id *)&v12->_profileInfo, a5);
  }

  return v12;
}

@end
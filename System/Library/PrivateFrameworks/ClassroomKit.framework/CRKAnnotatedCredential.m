@interface CRKAnnotatedCredential
- (BOOL)isEqual:(id)a3;
- (CRKAnnotatedCredential)initWithCredential:(id)a3 annotation:(id)a4;
- (CRKKeychainItem)credential;
- (NSDictionary)annotation;
- (id)description;
- (unint64_t)hash;
@end

@implementation CRKAnnotatedCredential

- (CRKAnnotatedCredential)initWithCredential:(id)a3 annotation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRKAnnotatedCredential;
  v9 = [(CRKAnnotatedCredential *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credential, a3);
    uint64_t v11 = [v8 copy];
    annotation = v10->_annotation;
    v10->_annotation = (NSDictionary *)v11;
  }
  return v10;
}

- (unint64_t)hash
{
  v3 = [(CRKAnnotatedCredential *)self credential];
  uint64_t v4 = [v3 hash];
  v5 = [(CRKAnnotatedCredential *)self annotation];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(@"credential, annotation", "componentsSeparatedByString:", @",");
  unint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_11;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  id v8 = self;
  v9 = (CRKAnnotatedCredential *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKAnnotatedCredential *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          v17 = v9;
          uint64_t v18 = [(CRKAnnotatedCredential *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKAnnotatedCredential *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CRKAnnotatedCredential *)self credential];
  unint64_t v6 = [(CRKAnnotatedCredential *)self annotation];
  id v7 = [v3 stringWithFormat:@"<%@: %p { credential = %@, annotation = %@ }>", v4, self, v5, v6];

  return v7;
}

- (CRKKeychainItem)credential
{
  return self->_credential;
}

- (NSDictionary)annotation
{
  return self->_annotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotation, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

@end
@interface RAWTIFFIFDTable
- (NSDictionary)mNamespace;
- (NSDictionary)mNamespaceReverse;
- (RAWTIFFIFDTable)initWithValueBlock:(id)a3 forwardNamespace:(id)a4 reverseNamespace:(id)a5;
- (id)mValueBlock;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)setMNamespace:(id)a3;
- (void)setMNamespaceReverse:(id)a3;
- (void)setMValueBlock:(id)a3;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation RAWTIFFIFDTable

- (RAWTIFFIFDTable)initWithValueBlock:(id)a3 forwardNamespace:(id)a4 reverseNamespace:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)RAWTIFFIFDTable;
  v11 = [(RAWTIFFIFDTable *)&v23 init];
  v15 = v11;
  if (v11)
  {
    objc_msgSend_setMValueBlock_(v11, v12, (uint64_t)v8, v13, v14);
    objc_msgSend_setMNamespace_(v15, v16, (uint64_t)v9, v17, v18);
    objc_msgSend_setMNamespaceReverse_(v15, v19, (uint64_t)v10, v20, v21);
  }

  return v15;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  (*((void (**)(void))self->mValueBlock + 2))();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, a3, v8, v9);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_mNamespaceReverse(self, v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4, v11, v12);

  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"TagID", v15, v16);
  uint64_t v18 = (*((void (**)(void))self->mValueBlock + 2))();
  unsigned int v23 = objc_msgSend_unsignedIntValue(v17, v19, v20, v21, v22);
  v27 = objc_msgSend_objectAtIndexedSubscript_(v18, v24, v23, v25, v26);

  return v27;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
}

- (id)mValueBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMValueBlock:(id)a3
{
}

- (NSDictionary)mNamespace
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMNamespace:(id)a3
{
}

- (NSDictionary)mNamespaceReverse
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMNamespaceReverse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNamespaceReverse, 0);
  objc_storeStrong((id *)&self->mNamespace, 0);

  objc_storeStrong(&self->mValueBlock, 0);
}

@end
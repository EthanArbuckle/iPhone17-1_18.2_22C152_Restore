@interface CKXVersionedReaderWriterStore
+ (BOOL)versionSupported:(unsigned __int8)a3;
- (CKXBinding)binding;
- (CKXORCReader)orcReader;
- (CKXORCWriter)orcWriter;
- (CKXVersionedReaderWriterStore)initWithBinding:(id)a3 optionsByReaderWriterClass:(id)a4;
- (NSDictionary)optionsByReaderWriterClass;
- (id)createReaderForVersionIfNecessary:(unsigned __int8)a3;
- (id)createWriterForVersionIfNecessary:(unsigned __int8)a3;
- (id)readerForVersion:(unsigned __int8)a3;
- (id)writerForVersion:(unsigned __int8)a3;
- (void)setBinding:(id)a3;
- (void)setOptionsByReaderWriterClass:(id)a3;
- (void)setOrcReader:(id)a3;
- (void)setOrcWriter:(id)a3;
@end

@implementation CKXVersionedReaderWriterStore

+ (BOOL)versionSupported:(unsigned __int8)a3
{
  return (a3 & 0xFE) == 2;
}

- (CKXVersionedReaderWriterStore)initWithBinding:(id)a3 optionsByReaderWriterClass:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKXVersionedReaderWriterStore;
  v9 = [(CKXVersionedReaderWriterStore *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_binding, a3);
    objc_storeStrong((id *)&v10->_optionsByReaderWriterClass, a4);
  }

  return v10;
}

- (id)readerForVersion:(unsigned __int8)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_createReaderForVersionIfNecessary_, a3);
}

- (id)writerForVersion:(unsigned __int8)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_createWriterForVersionIfNecessary_, a3);
}

- (id)createReaderForVersionIfNecessary:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = objc_opt_class();
  int v9 = objc_msgSend_versionSupported_(v5, v6, v3);
  v10 = 0;
  if ((v3 & 0xFE) == 2 && v9)
  {
    v11 = objc_msgSend_orcReader(self, v7, v8);

    if (!v11)
    {
      v14 = [CKXORCReader alloc];
      v17 = objc_msgSend_binding(self, v15, v16);
      v20 = objc_msgSend_schema(v17, v18, v19);
      v23 = objc_msgSend_binding(self, v21, v22);
      v26 = objc_msgSend_orcHelpers(v23, v24, v25);
      v29 = objc_msgSend_optionsByReaderWriterClass(self, v27, v28);
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      v33 = objc_msgSend_objectForKeyedSubscript_(v29, v32, (uint64_t)v31);
      v35 = objc_msgSend_initWithSchema_helpers_options_(v14, v34, (uint64_t)v20, v26, v33);
      objc_msgSend_setOrcReader_(self, v36, (uint64_t)v35);
    }
    v10 = objc_msgSend_orcReader(self, v12, v13);
  }
  return v10;
}

- (id)createWriterForVersionIfNecessary:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  v5 = objc_opt_class();
  int v9 = objc_msgSend_versionSupported_(v5, v6, v3);
  v10 = 0;
  if ((v3 & 0xFE) == 2 && v9)
  {
    v11 = objc_msgSend_orcWriter(self, v7, v8);

    if (!v11)
    {
      v14 = [CKXORCWriter alloc];
      v17 = objc_msgSend_binding(self, v15, v16);
      v20 = objc_msgSend_schema(v17, v18, v19);
      v23 = objc_msgSend_binding(self, v21, v22);
      v26 = objc_msgSend_orcHelpers(v23, v24, v25);
      v29 = objc_msgSend_optionsByReaderWriterClass(self, v27, v28);
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      v33 = objc_msgSend_objectForKeyedSubscript_(v29, v32, (uint64_t)v31);
      v35 = objc_msgSend_initWithSchema_helpers_options_(v14, v34, (uint64_t)v20, v26, v33);
      objc_msgSend_setOrcWriter_(self, v36, (uint64_t)v35);
    }
    v10 = objc_msgSend_orcWriter(self, v12, v13);
  }
  return v10;
}

- (CKXORCReader)orcReader
{
  return self->_orcReader;
}

- (void)setOrcReader:(id)a3
{
}

- (CKXORCWriter)orcWriter
{
  return self->_orcWriter;
}

- (void)setOrcWriter:(id)a3
{
}

- (CKXBinding)binding
{
  return self->_binding;
}

- (void)setBinding:(id)a3
{
}

- (NSDictionary)optionsByReaderWriterClass
{
  return self->_optionsByReaderWriterClass;
}

- (void)setOptionsByReaderWriterClass:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsByReaderWriterClass, 0);
  objc_storeStrong((id *)&self->_binding, 0);
  objc_storeStrong((id *)&self->_orcWriter, 0);
  objc_storeStrong((id *)&self->_orcReader, 0);
}

@end
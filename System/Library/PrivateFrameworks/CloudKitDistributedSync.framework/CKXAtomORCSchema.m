@interface CKXAtomORCSchema
- (CKXAtomORCSchema)initWithBinding:(id)a3 formatVersion:(unsigned __int8)a4;
- (CKXORCHelpers)implementation;
- (id)generateSchema;
- (unint64_t)listColumnIndexForReference:(unint64_t)a3;
- (unint64_t)structReferenceIndexForReference:(unint64_t)a3;
- (unint64_t)topLevelIndexForStruct:(unint64_t)a3;
- (unint64_t)valueColumnIndexForField:(unint64_t)a3;
- (void)configureColumnsWithRootColumn:(void *)a3;
@end

@implementation CKXAtomORCSchema

- (CKXAtomORCSchema)initWithBinding:(id)a3 formatVersion:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CKXAtomORCSchema;
  v10 = [(CKXAtomORCSchema *)&v21 init];
  if (v10)
  {
    if (v4 < 2)
    {
      implementation = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v8, v9);
      v16 = CKDSStringForBackingStoreFormatVersion(v4, v15);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(implementation, v17, (uint64_t)a2, v10, @"CKXAtomORCSchema.mm", 471, @"Invalid format version for ORC schema: %@", v16);

LABEL_9:
      goto LABEL_10;
    }
    if (v4 == 2)
    {
      v18 = [CKXAtomORCSchemaFormatVersionORC alloc];
      uint64_t v13 = objc_msgSend_initWithBinding_(v18, v19, (uint64_t)v7);
      goto LABEL_8;
    }
    if (v4 == 3)
    {
      v11 = [CKXAtomORCSchemaFormatVersionORCv2 alloc];
      uint64_t v13 = objc_msgSend_initWithBinding_(v11, v12, (uint64_t)v7);
LABEL_8:
      implementation = v10->_implementation;
      v10->_implementation = (CKXORCHelpers *)v13;
      goto LABEL_9;
    }
  }
LABEL_10:

  return v10;
}

- (id)generateSchema
{
  return (id)objc_msgSend_generateSchema(self->_implementation, a2, v2);
}

- (void)configureColumnsWithRootColumn:(void *)a3
{
}

- (unint64_t)topLevelIndexForStruct:(unint64_t)a3
{
  return objc_msgSend_topLevelIndexForStruct_(self->_implementation, a2, a3);
}

- (unint64_t)structReferenceIndexForReference:(unint64_t)a3
{
  return objc_msgSend_structReferenceIndexForReference_(self->_implementation, a2, a3);
}

- (unint64_t)listColumnIndexForReference:(unint64_t)a3
{
  return objc_msgSend_listColumnIndexForReference_(self->_implementation, a2, a3);
}

- (unint64_t)valueColumnIndexForField:(unint64_t)a3
{
  return objc_msgSend_valueColumnIndexForField_(self->_implementation, a2, a3);
}

- (CKXORCHelpers)implementation
{
  return self->_implementation;
}

- (void).cxx_destruct
{
}

@end
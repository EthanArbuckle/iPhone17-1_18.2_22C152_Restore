@interface CKXAtomORCSchemaFormatVersionORCv2
- (CKXAtomBindingImplementation)binding;
- (CKXAtomORCSchemaFormatVersionORCv2)initWithBinding:(id)a3;
- (id)generateSchema;
- (unint64_t)listColumnIndexForReference:(unint64_t)a3;
- (unint64_t)structReferenceIndexForReference:(unint64_t)a3;
- (unint64_t)topLevelIndexForStruct:(unint64_t)a3;
- (unint64_t)valueColumnIndexForField:(unint64_t)a3;
- (void)configureColumnsWithRootColumn:(void *)a3;
@end

@implementation CKXAtomORCSchemaFormatVersionORCv2

- (CKXAtomORCSchemaFormatVersionORCv2)initWithBinding:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKXAtomORCSchemaFormatVersionORCv2;
  v6 = [(CKXAtomORCSchemaFormatVersionORCv2 *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_binding, a3);
  }

  return v7;
}

- (id)generateSchema
{
  v2 = objc_opt_new();
  objc_msgSend_appendString_(v2, v3, @"struct<");
  objc_msgSend_appendString_(v2, v4, @"__site_identifier:struct<");
  objc_msgSend_appendString_(v2, v5, @"identifier:binary,");
  objc_msgSend_appendString_(v2, v6, @"modifier:binary,");
  objc_msgSend_appendString_(v2, v7, @">,");
  objc_msgSend_appendString_(v2, v8, @"__timestamp:struct<");
  objc_msgSend_appendString_(v2, v9, @"__site_identifier_row:bigint,");
  objc_msgSend_appendString_(v2, v10, @"clock:bigint,");
  objc_msgSend_appendString_(v2, v11, @">,");
  objc_msgSend_appendString_(v2, v12, @"__reference:struct<");
  objc_msgSend_appendString_(v2, v13, @"__timestamp_row:bigint,");
  objc_msgSend_appendString_(v2, v14, @"__location_row:bigint,");
  objc_msgSend_appendString_(v2, v15, @">,");
  objc_msgSend_appendString_(v2, v16, @"__atom:struct<");
  objc_msgSend_appendString_(v2, v17, @"version:bigint,");
  objc_msgSend_appendString_(v2, v18, @"__timestamp_row:bigint,");
  objc_msgSend_appendString_(v2, v19, @"references:array<__reference_row:bigint>,");
  objc_msgSend_appendString_(v2, v20, @"atom_type:bigint,");
  objc_msgSend_appendString_(v2, v21, @"value:binary,");
  objc_msgSend_appendString_(v2, v22, @">,");
  objc_msgSend_appendString_(v2, v23, @"__location:struct<");
  objc_msgSend_appendString_(v2, v24, @"identifier:binary,");
  objc_msgSend_appendString_(v2, v25, @">,");
  objc_msgSend_appendString_(v2, v26, @">");
  return v2;
}

- (void)configureColumnsWithRootColumn:(void *)a3
{
  id v5 = *(const void **)(*((void *)a3 + 10)
                      + 8 * objc_msgSend_topLevelIndexForStruct_(self, a2, self->_binding->tokens.location));
  if (v5)
  {
    v7 = __dynamic_cast(v5, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v8, (uint64_t)v7, 1, 0, &unk_1F387CF60);
  }
  else
  {
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v6, 0, 1, 0, &unk_1F387CF60);
  }
  v10 = *(const void **)(*((void *)a3 + 10)
                       + 8 * objc_msgSend_topLevelIndexForStruct_(self, v9, self->_binding->tokens.siteIdentifier));
  if (v10)
  {
    v12 = __dynamic_cast(v10, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v13, (uint64_t)v12, 1, 0, &unk_1F387CF80);
  }
  else
  {
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v11, 0, 1, 0, &unk_1F387CF80);
  }
  v15 = *(const void **)(*((void *)a3 + 10)
                       + 8 * objc_msgSend_topLevelIndexForStruct_(self, v14, self->_binding->tokens.timestamp));
  if (v15)
  {
    v17 = __dynamic_cast(v15, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v18, (uint64_t)v17, 1, 0, &unk_1F387CFA0);
  }
  else
  {
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v16, 0, 1, 0, &unk_1F387CFA0);
  }
  v20 = *(const void **)(*((void *)a3 + 10)
                       + 8 * objc_msgSend_topLevelIndexForStruct_(self, v19, self->_binding->tokens.reference));
  if (v20)
  {
    v22 = __dynamic_cast(v20, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v23, (uint64_t)v22, 1, 0, &unk_1F387CFC0);
  }
  else
  {
    objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v21, 0, 1, 0, &unk_1F387CFC0);
  }
  v25 = *(const void **)(*((void *)a3 + 10)
                       + 8 * objc_msgSend_topLevelIndexForStruct_(self, v24, self->_binding->tokens.atom));
  if (v25) {
    v27 = __dynamic_cast(v25, (const struct __class_type_info *)&unk_1F3878268, (const struct __class_type_info *)&unk_1F3878310, 0);
  }
  else {
    v27 = 0;
  }
  objc_msgSend_enumerateColumn_includingRoot_shallow_withBlock_(CKXORCUtilities, v26, (uint64_t)v27, 1, 0, &unk_1F387CFE0);
}

- (unint64_t)topLevelIndexForStruct:(unint64_t)a3
{
  binding = self->_binding;
  if (binding->tokens.siteIdentifier == a3) {
    return 0;
  }
  if (binding->tokens.timestamp == a3) {
    return 1;
  }
  if (binding->tokens.reference == a3) {
    return 2;
  }
  if (binding->tokens.atom == a3) {
    return 3;
  }
  if (binding->tokens.location == a3) {
    return 4;
  }
  v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CKXAtomORCSchema.mm", 376, @"Invalid struct %lu", a3);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)structReferenceIndexForReference:(unint64_t)a3
{
  binding = self->_binding;
  if (binding->tokens.timestamp_siteIdentifier == a3) {
    return 0;
  }
  if (binding->tokens.atom_timestamp == a3) {
    return 1;
  }
  if (binding->tokens.reference_timestamp == a3) {
    return 0;
  }
  if (binding->tokens.reference_location == a3) {
    return 1;
  }
  v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CKXAtomORCSchema.mm", 398, @"Invalid field %lu", a3);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)listColumnIndexForReference:(unint64_t)a3
{
  if (self->_binding->tokens.atom_references == a3) {
    return 2;
  }
  v7 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v7, v8, (uint64_t)a2, self, @"CKXAtomORCSchema.mm", 412, @"Invalid field %lu", a3);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)valueColumnIndexForField:(unint64_t)a3
{
  binding = self->_binding;
  if (binding->tokens.siteIdentifier_identifier == a3) {
    return 0;
  }
  if (binding->tokens.siteIdentifier_modifier == a3 || binding->tokens.timestamp_clock == a3) {
    return 1;
  }
  if (binding->tokens.atom_version == a3) {
    return 0;
  }
  if (binding->tokens.atom_atom_type == a3) {
    return 3;
  }
  if (binding->tokens.atom_value == a3) {
    return 4;
  }
  if (binding->tokens.location_identifier == a3) {
    return 0;
  }
  v8 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], a2, a3);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, self, @"CKXAtomORCSchema.mm", 441, @"Invalid field %lu", a3);

  return 0x7FFFFFFFFFFFFFFFLL;
}

- (CKXAtomBindingImplementation)binding
{
  return self->_binding;
}

- (void).cxx_destruct
{
}

@end
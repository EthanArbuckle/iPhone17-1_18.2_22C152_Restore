@interface HDReplaceObjectIdentifierOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDReplaceObjectIdentifierOperation)initWithCoder:(id)a3;
- (HDReplaceObjectIdentifierOperation)initWithWithObjectIdentifier:(id)a3 replacementIdentifier:(id)a4 schemaIdentifier:(id)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDReplaceObjectIdentifierOperation

- (HDReplaceObjectIdentifierOperation)initWithWithObjectIdentifier:(id)a3 replacementIdentifier:(id)a4 schemaIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDReplaceObjectIdentifierOperation;
  v11 = [(HDReplaceObjectIdentifierOperation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    objectIdentifier = v11->_objectIdentifier;
    v11->_objectIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    replacementIdentifier = v11->_replacementIdentifier;
    v11->_replacementIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    schemaIdentifier = v11->_schemaIdentifier;
    v11->_schemaIdentifier = (NSString *)v16;
  }
  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objectIdentifier = self->_objectIdentifier;
  schemaIdentifier = self->_schemaIdentifier;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__HDReplaceObjectIdentifierOperation_performWithProfile_transaction_error___block_invoke;
  v25[3] = &unk_1E62FB1C0;
  id v11 = v8;
  id v26 = v11;
  if (+[HDAttachmentReferenceEntity enumerateReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesForObjectIdentifier:schemaIdentifier:transaction:error:enumerationHandler:", objectIdentifier, schemaIdentifier, v7, a5, v25)&& +[HDAttachmentReferenceEntity deleteReferences:v11 cloudStatus:0 transaction:v7 error:a5])
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __75__HDReplaceObjectIdentifierOperation_performWithProfile_transaction_error___block_invoke_2;
    v24[3] = &unk_1E630B2D0;
    v24[4] = self;
    objc_msgSend(v11, "hk_map:", v24);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = +[HDAttachmentReferenceEntity _insertReference:databaseTransaction:error:](HDAttachmentReferenceEntity, "_insertReference:databaseTransaction:error:", *(void *)(*((void *)&v20 + 1) + 8 * i), v7, a5, (void)v20);

          if (!v17)
          {
            BOOL v18 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    BOOL v18 = 1;
LABEL_14:
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

uint64_t __75__HDReplaceObjectIdentifierOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __75__HDReplaceObjectIdentifierOperation_performWithProfile_transaction_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 referenceWithObjectIdentifier:*(void *)(*(void *)(a1 + 32) + 24)];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDReplaceObjectIdentifierOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"object_identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replacement_identifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema_identifier"];

  id v8 = [(HDReplaceObjectIdentifierOperation *)self initWithWithObjectIdentifier:v5 replacementIdentifier:v6 schemaIdentifier:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDReplaceObjectIdentifierOperation;
  id v4 = a3;
  [(HDJournalEntry *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_objectIdentifier, @"object_identifier", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_replacementIdentifier forKey:@"replacement_identifier"];
  [v4 encodeObject:self->_schemaIdentifier forKey:@"schema_identifier"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaIdentifier, 0);
  objc_storeStrong((id *)&self->_replacementIdentifier, 0);

  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
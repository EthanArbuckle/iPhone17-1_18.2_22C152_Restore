@interface HDConceptIndexEntry
- (BOOL)isEqual:(id)a3;
- (HDConceptIndexEntry)init;
- (HDConceptIndexEntry)initWithSampleUUID:(id)a3 conceptIdentifier:(int64_t)a4 conceptVersion:(int64_t)a5 keyPath:(id)a6 compoundIndex:(unint64_t)a7 type:(unint64_t)a8 ontologyVersion:(id)a9;
- (HKOntologyVersion)ontologyVersion;
- (NSString)keyPath;
- (NSUUID)sampleUUID;
- (id)description;
- (int64_t)conceptIdentifier;
- (int64_t)conceptVersion;
- (unint64_t)compoundIndex;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation HDConceptIndexEntry

- (HDConceptIndexEntry)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDConceptIndexEntry)initWithSampleUUID:(id)a3 conceptIdentifier:(int64_t)a4 conceptVersion:(int64_t)a5 keyPath:(id)a6 compoundIndex:(unint64_t)a7 type:(unint64_t)a8 ontologyVersion:(id)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a9;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
LABEL_8:
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HDConceptIndexEntry.m", 30, @"Invalid parameter not satisfying: %@", @"keyPath != nil" object file lineNumber description];

    if (v18) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"HDConceptIndexEntry.m", 29, @"Invalid parameter not satisfying: %@", @"sampleUUID != nil" object file lineNumber description];

  if (!v17) {
    goto LABEL_8;
  }
LABEL_3:
  if (v18) {
    goto LABEL_4;
  }
LABEL_9:
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"HDConceptIndexEntry.m", 31, @"Invalid parameter not satisfying: %@", @"ontologyVersion != nil" object file lineNumber description];

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)HDConceptIndexEntry;
  v19 = [(HDConceptIndexEntry *)&v30 init];
  if (v19)
  {
    uint64_t v20 = [v16 copy];
    sampleUUID = v19->_sampleUUID;
    v19->_sampleUUID = (NSUUID *)v20;

    v19->_conceptIdentifier = a4;
    v19->_conceptVersion = a5;
    uint64_t v22 = [v17 copy];
    keyPath = v19->_keyPath;
    v19->_keyPath = (NSString *)v22;

    v19->_compoundIndex = a7;
    v19->_type = a8;
    uint64_t v24 = [v18 copy];
    ontologyVersion = v19->_ontologyVersion;
    v19->_ontologyVersion = (HKOntologyVersion *)v24;
  }
  return v19;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p sampleUUID=%@, conceptIdentifier=%lld, conceptVersion=%lld, keyPath='%@', compoundIndex=%llu, type=%lu, ontologyVersion=%@>", v5, self, self->_sampleUUID, self->_conceptIdentifier, self->_conceptVersion, self->_keyPath, self->_compoundIndex, self->_type, self->_ontologyVersion];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_sampleUUID hash];
  int8x16_t v9 = *(int8x16_t *)&self->_conceptIdentifier;
  NSUInteger v4 = [(NSString *)self->_keyPath hash];
  int8x16_t v8 = *(int8x16_t *)&self->_compoundIndex;
  uint64_t v5 = [(HKOntologyVersion *)self->_ontologyVersion hash];
  int8x16_t v6 = veorq_s8(v9, v8);
  return *(void *)&veor_s8(*(int8x8_t *)v6.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL)) ^ v5 ^ v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (HDConceptIndexEntry *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      sampleUUID = self->_sampleUUID;
      uint64_t v7 = [(HDConceptIndexEntry *)v5 sampleUUID];
      if (sampleUUID == (NSUUID *)v7)
      {
      }
      else
      {
        int8x16_t v8 = (void *)v7;
        uint64_t v9 = [(HDConceptIndexEntry *)v5 sampleUUID];
        if (!v9) {
          goto LABEL_23;
        }
        v10 = (void *)v9;
        v11 = self->_sampleUUID;
        v12 = [(HDConceptIndexEntry *)v5 sampleUUID];
        LODWORD(v11) = [(NSUUID *)v11 isEqual:v12];

        if (!v11) {
          goto LABEL_24;
        }
      }
      int64_t conceptIdentifier = self->_conceptIdentifier;
      if (conceptIdentifier != [(HDConceptIndexEntry *)v5 conceptIdentifier]) {
        goto LABEL_24;
      }
      int64_t conceptVersion = self->_conceptVersion;
      if (conceptVersion != [(HDConceptIndexEntry *)v5 conceptVersion]) {
        goto LABEL_24;
      }
      keyPath = self->_keyPath;
      uint64_t v17 = [(HDConceptIndexEntry *)v5 keyPath];
      if (keyPath == (NSString *)v17)
      {
      }
      else
      {
        int8x16_t v8 = (void *)v17;
        uint64_t v18 = [(HDConceptIndexEntry *)v5 keyPath];
        if (!v18) {
          goto LABEL_23;
        }
        v19 = (void *)v18;
        uint64_t v20 = self->_keyPath;
        v21 = [(HDConceptIndexEntry *)v5 keyPath];
        LODWORD(v20) = [(NSString *)v20 isEqualToString:v21];

        if (!v20) {
          goto LABEL_24;
        }
      }
      unint64_t compoundIndex = self->_compoundIndex;
      if (compoundIndex != [(HDConceptIndexEntry *)v5 compoundIndex]) {
        goto LABEL_24;
      }
      unint64_t type = self->_type;
      if (type != [(HDConceptIndexEntry *)v5 type]) {
        goto LABEL_24;
      }
      ontologyVersion = self->_ontologyVersion;
      uint64_t v25 = [(HDConceptIndexEntry *)v5 ontologyVersion];
      if (ontologyVersion == (HKOntologyVersion *)v25)
      {

LABEL_28:
        BOOL v13 = 1;
        goto LABEL_25;
      }
      int8x16_t v8 = (void *)v25;
      uint64_t v26 = [(HDConceptIndexEntry *)v5 ontologyVersion];
      if (v26)
      {
        v27 = (void *)v26;
        v28 = self->_ontologyVersion;
        v29 = [(HDConceptIndexEntry *)v5 ontologyVersion];
        LOBYTE(v28) = [(HKOntologyVersion *)v28 isEqual:v29];

        if (v28) {
          goto LABEL_28;
        }
LABEL_24:
        BOOL v13 = 0;
LABEL_25:

        goto LABEL_26;
      }
LABEL_23:

      goto LABEL_24;
    }
    BOOL v13 = 0;
  }
LABEL_26:

  return v13;
}

- (NSUUID)sampleUUID
{
  return self->_sampleUUID;
}

- (int64_t)conceptIdentifier
{
  return self->_conceptIdentifier;
}

- (int64_t)conceptVersion
{
  return self->_conceptVersion;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (unint64_t)compoundIndex
{
  return self->_compoundIndex;
}

- (unint64_t)type
{
  return self->_type;
}

- (HKOntologyVersion)ontologyVersion
{
  return self->_ontologyVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ontologyVersion, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong((id *)&self->_sampleUUID, 0);
}

@end
@interface HDSummarySharingEntry
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaused;
- (HDCodableSummarySharingEntry)codableEntry;
- (HDSummarySharingEntry)initWithCodableEntry:(id)a3 CNContactIdentifier:(id)a4 isPaused:(BOOL)a5;
- (HDSummarySharingEntry)initWithCoder:(id)a3;
- (NSString)CNContactIdentifier;
- (id)description;
- (id)sharingEntry;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDSummarySharingEntry

- (HDSummarySharingEntry)initWithCodableEntry:(id)a3 CNContactIdentifier:(id)a4 isPaused:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSummarySharingEntry;
  v11 = [(HDSummarySharingEntry *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_codableEntry, a3);
    uint64_t v13 = [v10 copy];
    CNContactIdentifier = v12->_CNContactIdentifier;
    v12->_CNContactIdentifier = (NSString *)v13;

    v12->_isPaused = a5;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p codableEntry=%@, contactIdentifier=%@, isPaused=%d", v5, self, self->_codableEntry, self->_CNContactIdentifier, self->_isPaused];

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSummarySharingEntry *)self->_codableEntry hash];
  return [(NSString *)self->_CNContactIdentifier hash] ^ v3 ^ self->_isPaused;
}

- (BOOL)isEqual:(id)a3
{
  v7 = (HDSummarySharingEntry *)a3;
  if (self == v7)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      codableEntry = self->_codableEntry;
      id v10 = [(HDSummarySharingEntry *)v8 codableEntry];
      if (codableEntry != v10)
      {
        uint64_t v11 = [(HDSummarySharingEntry *)v8 codableEntry];
        if (!v11)
        {
          BOOL v14 = 0;
          goto LABEL_22;
        }
        v12 = (void *)v11;
        uint64_t v13 = self->_codableEntry;
        v5 = [(HDSummarySharingEntry *)v8 codableEntry];
        if (![(HDCodableSummarySharingEntry *)v13 isEqual:v5])
        {
          BOOL v14 = 0;
LABEL_21:

          goto LABEL_22;
        }
        v24 = v12;
      }
      CNContactIdentifier = self->_CNContactIdentifier;
      objc_super v16 = [(HDSummarySharingEntry *)v8 CNContactIdentifier];
      if (CNContactIdentifier != v16)
      {
        uint64_t v17 = [(HDSummarySharingEntry *)v8 CNContactIdentifier];
        if (!v17)
        {

          BOOL v14 = 0;
          goto LABEL_20;
        }
        unint64_t v3 = (void *)v17;
        v18 = v5;
        v19 = self->_CNContactIdentifier;
        uint64_t v20 = [(HDSummarySharingEntry *)v8 CNContactIdentifier];
        v21 = v19;
        v5 = v18;
        v4 = (void *)v20;
        if (![(NSString *)v21 isEqualToString:v20])
        {
          BOOL v14 = 0;
          goto LABEL_15;
        }
      }
      BOOL isPaused = self->_isPaused;
      BOOL v14 = isPaused == [(HDSummarySharingEntry *)v8 isPaused];
      if (CNContactIdentifier != v16)
      {
LABEL_15:
        v12 = v24;

        if (codableEntry == v10) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }

LABEL_20:
      v12 = v24;
      if (codableEntry != v10) {
        goto LABEL_21;
      }
LABEL_22:

      goto LABEL_23;
    }
    BOOL v14 = 0;
  }
LABEL_23:

  return v14;
}

- (id)sharingEntry
{
  unint64_t v3 = [(HDCodableSummarySharingEntry *)self->_codableEntry sharingEntry];
  [v3 _setCNContactIdentifier:self->_CNContactIdentifier];
  [v3 _setIsPaused:self->_isPaused];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  codableEntry = self->_codableEntry;
  id v5 = a3;
  [v5 encodeObject:codableEntry forKey:@"CodableEntry"];
  [v5 encodeObject:self->_CNContactIdentifier forKey:@"CNContactIdentifier"];
  [v5 encodeBool:self->_isPaused forKey:@"IsPaused"];
}

- (HDSummarySharingEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CodableEntry"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CNContactIdentifier"];
  uint64_t v7 = [v4 decodeBoolForKey:@"IsPaused"];

  v8 = [(HDSummarySharingEntry *)self initWithCodableEntry:v5 CNContactIdentifier:v6 isPaused:v7];
  return v8;
}

- (HDCodableSummarySharingEntry)codableEntry
{
  return self->_codableEntry;
}

- (NSString)CNContactIdentifier
{
  return self->_CNContactIdentifier;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CNContactIdentifier, 0);

  objc_storeStrong((id *)&self->_codableEntry, 0);
}

@end
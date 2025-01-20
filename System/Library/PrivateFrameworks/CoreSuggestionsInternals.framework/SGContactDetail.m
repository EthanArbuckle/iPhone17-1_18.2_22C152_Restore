@interface SGContactDetail
+ (id)contactDetail:(id)a3 label:(id)a4 type:(unint64_t)a5 recordId:(id)a6 duplicateKey:(id)a7 sourceKey:(id)a8 context:(id)a9 extractionInfo:(id)a10;
+ (id)contactDetailFromEntity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactDetail:(id)a3;
- (NSString)context;
- (NSString)label;
- (NSString)normalizedValue;
- (NSString)sourceKey;
- (NSString)value;
- (SGContactDetail)initWithValue:(id)a3 label:(id)a4 type:(unint64_t)a5 recordId:(id)a6 duplicateKey:(id)a7 sourceKey:(id)a8 context:(id)a9 extractionInfo:(id)a10;
- (SGDuplicateKey)duplicateKey;
- (SGExtractionInfo)extractionInfo;
- (SGRecordId)recordId;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation SGContactDetail

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateKey, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sourceKey, 0);
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
  objc_storeStrong((id *)&self->_normalizedValue, 0);
}

- (SGDuplicateKey)duplicateKey
{
  return self->_duplicateKey;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)sourceKey
{
  return self->_sourceKey;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)value
{
  return self->_value;
}

- (unint64_t)type
{
  return self->_type;
}

- (SGRecordId)recordId
{
  return self->_recordId;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_value hash];
  return [(SGRecordId *)self->_recordId hash] - v3 + 32 * v3;
}

- (BOOL)isEqualToContactDetail:(id)a3
{
  v4 = (id *)a3;
  value = self->_value;
  v6 = (NSString *)v4[4];
  if (value == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = value;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_15;
    }
  }
  label = self->_label;
  v11 = (NSString *)v4[5];
  if (label == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = label;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_15;
    }
  }
  recordId = self->_recordId;
  v16 = (SGRecordId *)v4[2];
  if (recordId == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = recordId;
    char v19 = [(SGRecordId *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_15;
    }
  }
  context = self->_context;
  v21 = (NSString *)v4[8];
  if (context == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = context;
    char v24 = [(NSString *)v23 isEqual:v22];

    if ((v24 & 1) == 0)
    {
LABEL_15:
      char v25 = 0;
      goto LABEL_21;
    }
  }
  v26 = self->_sourceKey;
  v27 = v26;
  if (v26 == v4[7]) {
    char v25 = 1;
  }
  else {
    char v25 = -[NSString isEqual:](v26, "isEqual:");
  }

LABEL_21:
  return v25;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGContactDetail *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGContactDetail *)self isEqualToContactDetail:v5];

  return v6;
}

- (NSString)normalizedValue
{
  normalizedValue = self->_normalizedValue;
  if (!normalizedValue)
  {
    switch(self->_type)
    {
      case 0uLL:
        SGNormalizePhoneNumber();
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 1uLL:
        SGNormalizeAddress(self->_value);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 2uLL:
        SGNormalizeEmailAddress();
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 3uLL:
        SGNormalizeInstantMessageAddress(self->_value);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 4uLL:
        SGNormalizeSocialProfileIdentifier(self->_value);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      case 5uLL:
        v4 = self->_value;
        goto LABEL_11;
      case 6uLL:
        SGNormalizeBirthday(self->_value);
        v4 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v5 = self->_normalizedValue;
        self->_normalizedValue = v4;

        normalizedValue = self->_normalizedValue;
        break;
      default:
        normalizedValue = 0;
        break;
    }
  }
  return normalizedValue;
}

- (SGContactDetail)initWithValue:(id)a3 label:(id)a4 type:(unint64_t)a5 recordId:(id)a6 duplicateKey:(id)a7 sourceKey:(id)a8 context:(id)a9 extractionInfo:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (v15)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_8:
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"SGContactDetail.m", 150, @"Invalid parameter not satisfying: %@", @"duplicateKey" object file lineNumber description];

    if (v21) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"SGContactDetail.m", 149, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

  if (!v18) {
    goto LABEL_8;
  }
LABEL_3:
  if (v21) {
    goto LABEL_4;
  }
LABEL_9:
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"SGContactDetail.m", 151, @"Invalid parameter not satisfying: %@", @"extractionInfo" object file lineNumber description];

LABEL_4:
  v39.receiver = self;
  v39.super_class = (Class)SGContactDetail;
  v22 = [(SGContactDetail *)&v39 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    value = v22->_value;
    v22->_value = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    label = v22->_label;
    v22->_label = (NSString *)v25;

    v22->_type = a5;
    uint64_t v27 = [v17 copy];
    recordId = v22->_recordId;
    v22->_recordId = (SGRecordId *)v27;

    uint64_t v29 = [v20 copy];
    context = v22->_context;
    v22->_context = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    sourceKey = v22->_sourceKey;
    v22->_sourceKey = (NSString *)v31;

    objc_storeStrong((id *)&v22->_duplicateKey, a7);
    objc_storeStrong((id *)&v22->_extractionInfo, a10);
  }

  return v22;
}

+ (id)contactDetailFromEntity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"SGContactDetail.m", 187, @"Invalid parameter not satisfying: %@", @"entity" object file lineNumber description];
  }
  BOOL v6 = [v5 duplicateKey];
  unint64_t v7 = [v6 entityType];

  if (v7 > 0x17) {
    goto LABEL_13;
  }
  if (((1 << v7) & 0xB88FC0) != 0)
  {
    uint64_t v33 = [v5 title];
    v8 = [v5 duplicateKey];
    v35 = [v8 contactDetailKey];
    char v9 = [v35 label];
    v34 = [v5 duplicateKey];
    uint64_t v10 = SGEntityTypeToContactDetailType([v34 entityType]);
    v11 = [v5 recordId];
    v12 = [v5 duplicateKey];
    v13 = [v5 sourceKey];
    char v14 = [v5 content];
    id v15 = [v5 extractionInfo];
    id v16 = (void *)v33;
    id v17 = +[SGContactDetail contactDetail:v33 label:v9 type:v10 recordId:v11 duplicateKey:v12 sourceKey:v13 context:v14 extractionInfo:v15];

    id v18 = v8;
    goto LABEL_6;
  }
  if (v7 == 4)
  {
    id v20 = [v5 duplicateKey];
    id v21 = [v20 identityKey];

    id v16 = v21;
    id v18 = [v21 uniqueIdentifier];
    uint64_t v22 = [v21 type];
    uint64_t v23 = v22 - 1;
    if (unint64_t)(v22 - 1) < 5 && ((0x1Du >> v23))
    {
      uint64_t v27 = qword_1CA8D0D20[v23];
    }
    else
    {
      [MEMORY[0x1E4F28B00] currentHandler];
      v25 = char v24 = v18;
      v26 = [NSString stringWithUTF8String:"SGContactDetailType SGIdentityKeyTypeToContactDetailType(SGIdentityKeyType)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"SGContactDetail.m", 129, @"Unhandled identity key type %u", v22);

      id v18 = v24;
      uint64_t v27 = -1;
    }
    v28 = [v5 recordId];
    uint64_t v29 = [v5 duplicateKey];
    v30 = [v5 sourceKey];
    uint64_t v31 = [v5 extractionInfo];
    id v17 = +[SGContactDetail contactDetail:v18 label:0 type:v27 recordId:v28 duplicateKey:v29 sourceKey:v30 context:0 extractionInfo:v31];
  }
  else
  {
LABEL_13:
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = [v5 duplicateKey];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SGContactDetail.m", 227, @"Cannot construct SGContactDetail from entity of type %lld", objc_msgSend(v18, "entityType"));
    id v17 = 0;
  }
LABEL_6:

  return v17;
}

+ (id)contactDetail:(id)a3 label:(id)a4 type:(unint64_t)a5 recordId:(id)a6 duplicateKey:(id)a7 sourceKey:(id)a8 context:(id)a9 extractionInfo:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a4;
  id v22 = a3;
  uint64_t v23 = [[SGContactDetail alloc] initWithValue:v22 label:v21 type:a5 recordId:v20 duplicateKey:v19 sourceKey:v18 context:v17 extractionInfo:v16];

  return v23;
}

@end
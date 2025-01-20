@interface HDCodableAuthorizationRequestMessage
+ (id)codableAuthorizationRequestWithRecord:(id)a3;
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasRequestIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)requestIdentifier;
- (NSString)appBundleIdentifier;
- (id)_objectTypeForCode:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedReadTypes;
- (id)decodedWriteTypes;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)typesToReadAtIndex:(unint64_t)a3;
- (int64_t)typesToReads;
- (int64_t)typesToWriteAtIndex:(unint64_t)a3;
- (int64_t)typesToWrites;
- (unint64_t)hash;
- (unint64_t)typesToReadsCount;
- (unint64_t)typesToWritesCount;
- (void)addTypesToRead:(int64_t)a3;
- (void)addTypesToWrite:(int64_t)a3;
- (void)clearTypesToReads;
- (void)clearTypesToWrites;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setTypesToReads:(int64_t *)a3 count:(unint64_t)a4;
- (void)setTypesToWrites:(int64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableAuthorizationRequestMessage

- (id)decodedReadTypes
{
  unint64_t v3 = [(HDCodableAuthorizationRequestMessage *)self typesToReadsCount];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      v6 = -[HDCodableAuthorizationRequestMessage _objectTypeForCode:](self, [(HDCodableAuthorizationRequestMessage *)self typesToReadAtIndex:i]);
      if (v6) {
        [v4 addObject:v6];
      }
    }
  }
  v7 = (void *)[v4 copy];

  return v7;
}

- (id)_objectTypeForCode:(void *)a1
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (_HKValidDataTypeCode())
    {
      a1 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:a2];
    }
    else
    {
      _HKInitializeLogging();
      unint64_t v3 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        int v5 = 134217984;
        uint64_t v6 = a2;
        _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "Codable authorization request contains an invalid object type code (%ld) which will be ignored.", (uint8_t *)&v5, 0xCu);
      }
      a1 = 0;
    }
  }

  return a1;
}

- (id)decodedWriteTypes
{
  unint64_t v3 = [(HDCodableAuthorizationRequestMessage *)self typesToWritesCount];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v6 = -[HDCodableAuthorizationRequestMessage _objectTypeForCode:](self, [(HDCodableAuthorizationRequestMessage *)self typesToWriteAtIndex:i]);
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v4 addObject:v6];
        }
      }
    }
  }

  return v4;
}

+ (id)codableAuthorizationRequestWithRecord:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(HDCodableAuthorizationRequestMessage);
  int v5 = [v3 source];
  uint64_t v6 = [v5 bundleIdentifier];

  if (v6)
  {
    uint64_t v7 = [v3 source];
    v8 = [v7 bundleIdentifier];
    [(HDCodableAuthorizationRequestMessage *)v4 setAppBundleIdentifier:v8];
  }
  v9 = [v3 sessionIdentifier];

  if (v9)
  {
    v10 = [v3 sessionIdentifier];
    v11 = objc_msgSend(v10, "hk_dataForUUIDBytes");
    [(HDCodableAuthorizationRequestMessage *)v4 setRequestIdentifier:v11];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v12 = [v3 typesRequiringReadAuthorization];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        -[HDCodableAuthorizationRequestMessage addTypesToRead:](v4, "addTypesToRead:", [*(id *)(*((void *)&v27 + 1) + 8 * i) code]);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v14);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v17 = objc_msgSend(v3, "typesRequiringShareAuthorization", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        -[HDCodableAuthorizationRequestMessage addTypesToWrite:](v4, "addTypesToWrite:", [*(id *)(*((void *)&v23 + 1) + 8 * j) code]);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v19);
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)HDCodableAuthorizationRequestMessage;
  [(HDCodableAuthorizationRequestMessage *)&v3 dealloc];
}

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasRequestIdentifier
{
  return self->_requestIdentifier != 0;
}

- (unint64_t)typesToReadsCount
{
  return self->_typesToReads.count;
}

- (int64_t)typesToReads
{
  return self->_typesToReads.list;
}

- (void)clearTypesToReads
{
}

- (void)addTypesToRead:(int64_t)a3
{
}

- (int64_t)typesToReadAtIndex:(unint64_t)a3
{
  p_typesToReads = &self->_typesToReads;
  unint64_t count = self->_typesToReads.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_typesToReads->list[a3];
}

- (void)setTypesToReads:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)typesToWritesCount
{
  return self->_typesToWrites.count;
}

- (int64_t)typesToWrites
{
  return self->_typesToWrites.list;
}

- (void)clearTypesToWrites
{
}

- (void)addTypesToWrite:(int64_t)a3
{
}

- (int64_t)typesToWriteAtIndex:(unint64_t)a3
{
  p_typesToWrites = &self->_typesToWrites;
  unint64_t count = self->_typesToWrites.count;
  if (count <= a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_typesToWrites->list[a3];
}

- (void)setTypesToWrites:(int64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableAuthorizationRequestMessage;
  id v4 = [(HDCodableAuthorizationRequestMessage *)&v8 description];
  int v5 = [(HDCodableAuthorizationRequestMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier) {
    [v3 setObject:appBundleIdentifier forKey:@"appBundleIdentifier"];
  }
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier) {
    [v4 setObject:requestIdentifier forKey:@"requestIdentifier"];
  }
  uint64_t v7 = PBRepeatedInt64NSArray();
  [v4 setObject:v7 forKey:@"typesToRead"];

  objc_super v8 = PBRepeatedInt64NSArray();
  [v4 setObject:v8 forKey:@"typesToWrite"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableAuthorizationRequestMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_requestIdentifier)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if (self->_typesToReads.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v8;
      ++v5;
    }
    while (v5 < self->_typesToReads.count);
  }
  p_typesToWrites = &self->_typesToWrites;
  if (p_typesToWrites->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_typesToWrites->count);
  }
}

- (void)copyTo:(id)a3
{
  id v10 = a3;
  if (self->_appBundleIdentifier) {
    objc_msgSend(v10, "setAppBundleIdentifier:");
  }
  if (self->_requestIdentifier) {
    objc_msgSend(v10, "setRequestIdentifier:");
  }
  if ([(HDCodableAuthorizationRequestMessage *)self typesToReadsCount])
  {
    [v10 clearTypesToReads];
    unint64_t v4 = [(HDCodableAuthorizationRequestMessage *)self typesToReadsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v10, "addTypesToRead:", -[HDCodableAuthorizationRequestMessage typesToReadAtIndex:](self, "typesToReadAtIndex:", i));
    }
  }
  if ([(HDCodableAuthorizationRequestMessage *)self typesToWritesCount])
  {
    [v10 clearTypesToWrites];
    unint64_t v7 = [(HDCodableAuthorizationRequestMessage *)self typesToWritesCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v10, "addTypesToWrite:", -[HDCodableAuthorizationRequestMessage typesToWriteAtIndex:](self, "typesToWriteAtIndex:", j));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  unint64_t v7 = (void *)v5[7];
  v5[7] = v6;

  uint64_t v8 = [(NSData *)self->_requestIdentifier copyWithZone:a3];
  v9 = (void *)v5[8];
  v5[8] = v8;

  PBRepeatedInt64Copy();
  PBRepeatedInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((appBundleIdentifier = self->_appBundleIdentifier, !((unint64_t)appBundleIdentifier | v4[7]))
     || -[NSString isEqual:](appBundleIdentifier, "isEqual:"))
    && ((requestIdentifier = self->_requestIdentifier, !((unint64_t)requestIdentifier | v4[8]))
     || -[NSData isEqual:](requestIdentifier, "isEqual:"))
    && PBRepeatedInt64IsEqual())
  {
    char IsEqual = PBRepeatedInt64IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_appBundleIdentifier hash];
  uint64_t v4 = [(NSData *)self->_requestIdentifier hash] ^ v3;
  uint64_t v5 = PBRepeatedInt64Hash();
  return v4 ^ v5 ^ PBRepeatedInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  v11 = v4;
  if (v4[7])
  {
    -[HDCodableAuthorizationRequestMessage setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    uint64_t v4 = v11;
  }
  if (v4[8])
  {
    -[HDCodableAuthorizationRequestMessage setRequestIdentifier:](self, "setRequestIdentifier:");
    uint64_t v4 = v11;
  }
  uint64_t v5 = [v4 typesToReadsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[HDCodableAuthorizationRequestMessage addTypesToRead:](self, "addTypesToRead:", [v11 typesToReadAtIndex:i]);
  }
  uint64_t v8 = [v11 typesToWritesCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[HDCodableAuthorizationRequestMessage addTypesToWrite:](self, "addTypesToWrite:", [v11 typesToWriteAtIndex:j]);
  }
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSData)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end
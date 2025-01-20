@interface CCSetChangeBookmark
+ (BOOL)supportsSecureCoding;
+ (int)currentBookmarkVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSetChangeBookmark:(id)a3;
- (CCSet)set;
- (CCSetChangeBookmark)init;
- (CCSetChangeBookmark)initWithCoder:(id)a3;
- (CCSetChangeBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4 resourceVersion:(int64_t)a5 lastDeltaDate:(int64_t)a6 set:(id)a7;
- (CKDistributedTimestampStateVector)contentVector;
- (CKDistributedTimestampStateVector)metaContentVector;
- (NSString)description;
- (int)bookmarkVersion;
- (int64_t)lastDeltaDate;
- (int64_t)resourceVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CCSetChangeBookmark

- (CCSetChangeBookmark)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

- (CCSetChangeBookmark)initWithContentVector:(id)a3 metaContentVector:(id)a4 resourceVersion:(int64_t)a5 lastDeltaDate:(int64_t)a6 set:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)CCSetChangeBookmark;
  v16 = [(CCSetChangeBookmark *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_contentVector, a3);
    objc_storeStrong((id *)&v17->_metaContentVector, a4);
    v17->_bookmarkVersion = 2;
    v17->_resourceVersion = a5;
    v17->_lastDeltaDate = a6;
    objc_storeStrong((id *)&v17->_set, a7);
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CCSetChangeBookmark *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CCSetChangeBookmark *)self isEqualToSetChangeBookmark:v5];

  return v6;
}

- (BOOL)isEqualToSetChangeBookmark:(id)a3
{
  id v4 = a3;
  int64_t resourceVersion = self->_resourceVersion;
  if (resourceVersion == [v4 resourceVersion]
    && (int bookmarkVersion = self->_bookmarkVersion, bookmarkVersion == [v4 bookmarkVersion])
    && (int64_t lastDeltaDate = self->_lastDeltaDate, lastDeltaDate == [v4 lastDeltaDate]))
  {
    set = self->_set;
    v9 = [v4 set];
    if ([(CCSet *)set isEqual:v9])
    {
      contentVector = self->_contentVector;
      v11 = [v4 contentVector];
      if ([(CKDistributedTimestampStateVector *)contentVector isEqual:v11])
      {
        metaContentVector = self->_metaContentVector;
        id v13 = [v4 metaContentVector];
        char v14 = [(CKDistributedTimestampStateVector *)metaContentVector isEqual:v13];
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3 = [(CKDistributedTimestampStateVector *)self->_contentVector hash];
  uint64_t v4 = [(CKDistributedTimestampStateVector *)self->_metaContentVector hash] ^ v3;
  v5 = [NSNumber numberWithLongLong:self->_resourceVersion];
  uint64_t v6 = v4 ^ [v5 hash];
  v7 = [NSNumber numberWithInt:self->_bookmarkVersion];
  uint64_t v8 = [v7 hash];
  v9 = [NSNumber numberWithLongLong:self->_lastDeltaDate];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  unint64_t v11 = v10 ^ [(CCSet *)self->_set hash];

  return v11;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  set = self->_set;
  v5 = CCDateFormattedStringFromTimeMicros(self->_resourceVersion);
  uint64_t v6 = CCDateFormattedStringFromTimeMicros(self->_lastDeltaDate);
  v7 = [v3 stringWithFormat:@"Bookmark for Cascade Set: %@ created: %@ lastDelta: %@ <bv:%u> sharedItemCount: %lu localItemInstanceCount: %lu", set, v5, v6, self->_bookmarkVersion, +[CCDatabaseSetChangeEnumerator sharedItemCountFromBookmark:](CCDatabaseSetChangeEnumerator, "sharedItemCountFromBookmark:", self), +[CCDatabaseSetChangeEnumerator localItemInstanceCountFromBookmark:](CCDatabaseSetChangeEnumerator, "localItemInstanceCountFromBookmark:", self)];

  return (NSString *)v7;
}

+ (int)currentBookmarkVersion
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_contentVector forKey:@"c"];
  [v4 encodeObject:self->_metaContentVector forKey:@"m"];
  [v4 encodeInt64:self->_resourceVersion forKey:@"r"];
  [v4 encodeInt32:self->_bookmarkVersion forKey:@"b"];
  [v4 encodeInt64:self->_lastDeltaDate forKey:@"d"];
  set = self->_set;
  p_set = &self->_set;
  v7 = set;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [CCSet alloc];
    uint64_t v9 = [(CCSet *)*p_set itemType];
    uint64_t v10 = [(CCSet *)*p_set personaIdentifier];
    unint64_t v11 = [(CCSet *)*p_set descriptors];
    uint64_t v12 = [(CCSet *)*p_set options];
    id v16 = 0;
    uint64_t v13 = [(CCSet *)v8 initWithItemType:v9 personaIdentifier:v10 descriptors:v11 options:v12 error:&v16];
    id v14 = v16;

    if (!v13)
    {
      id v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(CCSetChangeBookmark *)(uint64_t *)p_set encodeWithCoder:v15];
      }
    }
    v7 = (CCSet *)v13;
  }
  [v4 encodeObject:v7 forKey:@"s"];
}

- (CCSetChangeBookmark)initWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"r"];
  uint64_t v6 = [v4 decodeInt32ForKey:@"b"];
  uint64_t v7 = [v4 decodeInt64ForKey:@"d"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
  if (v8)
  {
    uint64_t v9 = [v4 decodeObjectOfClass:getCKDistributedTimestampStateVectorClass() forKey:@"c"];
    if (v9)
    {
      uint64_t v10 = [v4 decodeObjectOfClass:getCKDistributedTimestampStateVectorClass() forKey:@"m"];
      if (v10)
      {
        self = [(CCSetChangeBookmark *)self initWithContentVector:v9 metaContentVector:v10 resourceVersion:v5 lastDeltaDate:v7 set:v8];
        unint64_t v11 = self;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v13 = __biome_log_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v15 = objc_msgSend(NSString, "stringWithFormat:", @"versions: {resource: %lld bookmark: %d}", v5, v6);
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        __int16 v18 = 2112;
        objc_super v19 = v15;
        _os_log_error_impl(&dword_249B92000, v13, OS_LOG_TYPE_ERROR, "Bookmark for set: %@ missing metacontent vector. %@", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"versions: {resource: %lld bookmark: %d}", v5, v6);
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        __int16 v18 = 2112;
        objc_super v19 = v12;
        _os_log_error_impl(&dword_249B92000, v10, OS_LOG_TYPE_ERROR, "Bookmark for set: %@ missing content vector. %@", buf, 0x16u);
      }
    }
    unint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v9 = __biome_log_for_category();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    [(CCSetChangeBookmark *)v5 initWithCoder:v9];
  }
  unint64_t v11 = 0;
LABEL_15:

  return v11;
}

- (CKDistributedTimestampStateVector)contentVector
{
  return self->_contentVector;
}

- (CKDistributedTimestampStateVector)metaContentVector
{
  return self->_metaContentVector;
}

- (int64_t)resourceVersion
{
  return self->_resourceVersion;
}

- (int)bookmarkVersion
{
  return self->_bookmarkVersion;
}

- (int64_t)lastDeltaDate
{
  return self->_lastDeltaDate;
}

- (CCSet)set
{
  return self->_set;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_set, 0);
  objc_storeStrong((id *)&self->_metaContentVector, 0);

  objc_storeStrong((id *)&self->_contentVector, 0);
}

- (void)encodeWithCoder:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Failed to copy serialized set: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithCoder:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v4 = objc_msgSend(NSString, "stringWithFormat:", @"versions: {resource: %lld bookmark: %d}", a1, a2);
  *(_DWORD *)buf = 138412290;
  __int16 v6 = v4;
  _os_log_error_impl(&dword_249B92000, a3, OS_LOG_TYPE_ERROR, "Bookmark missing set %@", buf, 0xCu);
}

@end
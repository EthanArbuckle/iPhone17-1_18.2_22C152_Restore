@interface CNProviderMetadata
+ (BOOL)supportsSecureCoding;
+ (id)log;
- (BOOL)isContentEnumerated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMoreComing;
- (BOOL)isResetRequested;
- (CNProviderMetadata)init;
- (CNProviderMetadata)initWithCoder:(id)a3;
- (CNProviderMetadata)initWithDataRepresentation:(id)a3;
- (CNProviderMetadata)initWithVersion:(int64_t)a3 displayName:(id)a4 userInfo:(id)a5 isResetRequested:(BOOL)a6 isContentEnumerated:(BOOL)a7 itemAnchor:(id)a8 itemOffset:(int64_t)a9 isMoreComing:(BOOL)a10;
- (NSData)dataRepresentation;
- (NSData)itemAnchor;
- (NSDictionary)userInfo;
- (NSString)displayName;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)itemOffset;
- (int64_t)version;
- (void)dataRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIsContentEnumerated:(BOOL)a3;
- (void)setIsMoreComing:(BOOL)a3;
- (void)setIsResetRequested:(BOOL)a3;
- (void)setItemAnchor:(id)a3;
- (void)setItemOffset:(int64_t)a3;
- (void)setUserInfo:(id)a3;
- (void)setVersion:(int64_t)a3;
@end

@implementation CNProviderMetadata

+ (id)log
{
  if (log_cn_once_token_0_3 != -1) {
    dispatch_once(&log_cn_once_token_0_3, &__block_literal_global_55);
  }
  v2 = (void *)log_cn_once_object_0_3;

  return v2;
}

uint64_t __25__CNProviderMetadata_log__block_invoke()
{
  log_cn_once_object_0_3 = (uint64_t)os_log_create("com.apple.contacts", "CNProviderMetadata");

  return MEMORY[0x1F41817F8]();
}

- (CNProviderMetadata)init
{
  LOBYTE(v3) = 0;
  return [(CNProviderMetadata *)self initWithVersion:1 displayName:0 userInfo:0 isResetRequested:0 isContentEnumerated:0 itemAnchor:0 itemOffset:0 isMoreComing:v3];
}

- (CNProviderMetadata)initWithDataRepresentation:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F28DC0];
    id v5 = a3;
    id v24 = 0;
    v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v24];

    id v7 = v24;
    if (v6)
    {
      uint64_t v8 = [v6 version];
      v9 = [v6 displayName];
      v10 = [v6 userInfo];
      uint64_t v11 = [v6 isResetRequested];
      uint64_t v12 = [v6 isContentEnumerated];
      v13 = [v6 itemAnchor];
      uint64_t v14 = [v6 itemOffset];
      LOBYTE(v23) = [v6 isMoreComing];
      self = [(CNProviderMetadata *)self initWithVersion:v8 displayName:v9 userInfo:v10 isResetRequested:v11 isContentEnumerated:v12 itemAnchor:v13 itemOffset:v14 isMoreComing:v23];

      v15 = self;
    }
    else
    {
      v9 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[CNProviderMetadata initWithDataRepresentation:]((uint64_t)v7, v9, v16, v17, v18, v19, v20, v21);
      }
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (CNProviderMetadata)initWithVersion:(int64_t)a3 displayName:(id)a4 userInfo:(id)a5 isResetRequested:(BOOL)a6 isContentEnumerated:(BOOL)a7 itemAnchor:(id)a8 itemOffset:(int64_t)a9 isMoreComing:(BOOL)a10
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  v31.receiver = self;
  v31.super_class = (Class)CNProviderMetadata;
  uint64_t v20 = [(CNProviderMetadata *)&v31 init];
  uint64_t v21 = v20;
  if (!v20)
  {
LABEL_7:
    v22 = 0;
    goto LABEL_8;
  }
  if (a3 >= 2)
  {
    uint64_t v23 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CNProviderMetadata initWithVersion:displayName:userInfo:isResetRequested:isContentEnumerated:itemAnchor:itemOffset:isMoreComing:](a3, v23, v24, v25, v26, v27, v28, v29);
    }

    goto LABEL_7;
  }
  v20->_version = a3;
  objc_storeStrong((id *)&v20->_displayName, a4);
  objc_storeStrong((id *)&v21->_userInfo, a5);
  v21->_isResetRequested = a6;
  v21->_isContentEnumerated = a7;
  objc_storeStrong((id *)&v21->_itemAnchor, a8);
  v21->_itemOffset = a9;
  v21->_isMoreComing = a10;
  v22 = v21;
LABEL_8:

  return v22;
}

- (NSData)dataRepresentation
{
  id v13 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v13];
  id v3 = v13;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(CNProviderMetadata *)(uint64_t)v3 dataRepresentation];
    }
  }

  return (NSData *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNProviderMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v20 = [v3 decodeIntegerForKey:@"version"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  unsigned int v19 = [v3 decodeBoolForKey:@"isResetRequested"];
  unsigned int v18 = [v3 decodeBoolForKey:@"isContentEnumerated"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"itemAnchor"];
  uint64_t v6 = [v3 decodeIntegerForKey:@"itemOffset"];
  char v7 = [v3 decodeBoolForKey:@"isMoreComing"];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  uint64_t v14 = [v3 decodeDictionaryWithKeysOfClasses:v8 objectsOfClasses:v13 forKey:@"userInfo"];

  LOBYTE(v17) = v7;
  v15 = [(CNProviderMetadata *)self initWithVersion:v20 displayName:v4 userInfo:v14 isResetRequested:v19 isContentEnumerated:v18 itemAnchor:v5 itemOffset:v6 isMoreComing:v17];

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
  [v5 encodeBool:self->_isResetRequested forKey:@"isResetRequested"];
  [v5 encodeBool:self->_isContentEnumerated forKey:@"isContentEnumerated"];
  [v5 encodeObject:self->_itemAnchor forKey:@"itemAnchor"];
  [v5 encodeInteger:self->_itemOffset forKey:@"itemOffset"];
  [v5 encodeBool:self->_isMoreComing forKey:@"isMoreComing"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CNProviderMetadata);
  [(CNProviderMetadata *)v4 setVersion:[(CNProviderMetadata *)self version]];
  id v5 = [(CNProviderMetadata *)self displayName];
  [(CNProviderMetadata *)v4 setDisplayName:v5];

  uint64_t v6 = [(CNProviderMetadata *)self userInfo];
  [(CNProviderMetadata *)v4 setUserInfo:v6];

  [(CNProviderMetadata *)v4 setIsResetRequested:[(CNProviderMetadata *)self isResetRequested]];
  [(CNProviderMetadata *)v4 setIsContentEnumerated:[(CNProviderMetadata *)self isContentEnumerated]];
  char v7 = [(CNProviderMetadata *)self itemAnchor];
  [(CNProviderMetadata *)v4 setItemAnchor:v7];

  [(CNProviderMetadata *)v4 setItemOffset:[(CNProviderMetadata *)self itemOffset]];
  [(CNProviderMetadata *)v4 setIsMoreComing:[(CNProviderMetadata *)self isMoreComing]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNProviderMetadata *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    int64_t v5 = [(CNProviderMetadata *)self version];
    if (v5 != [(CNProviderMetadata *)v4 version]) {
      goto LABEL_14;
    }
    unint64_t v6 = (unint64_t)[(CNProviderMetadata *)self displayName];
    unint64_t v7 = (unint64_t)[(CNProviderMetadata *)v4 displayName];
    if (v6 | v7)
    {
      if (![(id)v6 isEqual:v7]) {
        goto LABEL_14;
      }
    }
    if (((unint64_t v8 = (unint64_t)[(CNProviderMetadata *)self userInfo],
           unint64_t v9 = (unint64_t)[(CNProviderMetadata *)v4 userInfo],
           !(v8 | v9))
       || [(id)v8 isEqual:v9])
      && (BOOL v10 = [(CNProviderMetadata *)self isResetRequested],
          v10 == [(CNProviderMetadata *)v4 isResetRequested])
      && (BOOL v11 = [(CNProviderMetadata *)self isContentEnumerated],
          v11 == [(CNProviderMetadata *)v4 isContentEnumerated])
      && ((unint64_t v12 = (unint64_t)[(CNProviderMetadata *)self itemAnchor],
           unint64_t v13 = (unint64_t)[(CNProviderMetadata *)v4 itemAnchor],
           !(v12 | v13))
       || [(id)v12 isEqual:v13])
      && (int64_t v14 = [(CNProviderMetadata *)self itemOffset],
          v14 == [(CNProviderMetadata *)v4 itemOffset]))
    {
      BOOL v15 = [(CNProviderMetadata *)self isMoreComing];
      BOOL v16 = v15 ^ [(CNProviderMetadata *)v4 isMoreComing] ^ 1;
    }
    else
    {
LABEL_14:
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (BOOL)isResetRequested
{
  return self->_isResetRequested;
}

- (void)setIsResetRequested:(BOOL)a3
{
  self->_isResetRequested = a3;
}

- (BOOL)isContentEnumerated
{
  return self->_isContentEnumerated;
}

- (void)setIsContentEnumerated:(BOOL)a3
{
  self->_isContentEnumerated = a3;
}

- (NSData)itemAnchor
{
  return self->_itemAnchor;
}

- (void)setItemAnchor:(id)a3
{
}

- (int64_t)itemOffset
{
  return self->_itemOffset;
}

- (void)setItemOffset:(int64_t)a3
{
  self->_itemOffset = a3;
}

- (BOOL)isMoreComing
{
  return self->_isMoreComing;
}

- (void)setIsMoreComing:(BOOL)a3
{
  self->_isMoreComing = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_int64_t version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemAnchor, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

- (void)initWithDataRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithVersion:(uint64_t)a1 displayName:(NSObject *)a2 userInfo:(uint64_t)a3 isResetRequested:(uint64_t)a4 isContentEnumerated:(uint64_t)a5 itemAnchor:(uint64_t)a6 itemOffset:(uint64_t)a7 isMoreComing:(uint64_t)a8 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)dataRepresentation
{
}

@end
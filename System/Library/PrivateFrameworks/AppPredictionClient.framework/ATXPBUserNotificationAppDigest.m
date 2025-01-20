@interface ATXPBUserNotificationAppDigest
+ (Class)appMarqueeGroupsType;
+ (Class)nonAppMarqueeGroupsType;
- (BOOL)hasBundleId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appMarqueeGroups;
- (NSMutableArray)nonAppMarqueeGroups;
- (NSString)bundleId;
- (id)appMarqueeGroupsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)nonAppMarqueeGroupsAtIndex:(unint64_t)a3;
- (unint64_t)appMarqueeGroupsCount;
- (unint64_t)hash;
- (unint64_t)nonAppMarqueeGroupsCount;
- (void)addAppMarqueeGroups:(id)a3;
- (void)addNonAppMarqueeGroups:(id)a3;
- (void)clearAppMarqueeGroups;
- (void)clearNonAppMarqueeGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppMarqueeGroups:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setNonAppMarqueeGroups:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUserNotificationAppDigest

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)clearAppMarqueeGroups
{
}

- (void)addAppMarqueeGroups:(id)a3
{
  id v4 = a3;
  appMarqueeGroups = self->_appMarqueeGroups;
  id v8 = v4;
  if (!appMarqueeGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_appMarqueeGroups;
    self->_appMarqueeGroups = v6;

    id v4 = v8;
    appMarqueeGroups = self->_appMarqueeGroups;
  }
  [(NSMutableArray *)appMarqueeGroups addObject:v4];
}

- (unint64_t)appMarqueeGroupsCount
{
  return [(NSMutableArray *)self->_appMarqueeGroups count];
}

- (id)appMarqueeGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appMarqueeGroups objectAtIndex:a3];
}

+ (Class)appMarqueeGroupsType
{
  return (Class)objc_opt_class();
}

- (void)clearNonAppMarqueeGroups
{
}

- (void)addNonAppMarqueeGroups:(id)a3
{
  id v4 = a3;
  nonAppMarqueeGroups = self->_nonAppMarqueeGroups;
  id v8 = v4;
  if (!nonAppMarqueeGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_nonAppMarqueeGroups;
    self->_nonAppMarqueeGroups = v6;

    id v4 = v8;
    nonAppMarqueeGroups = self->_nonAppMarqueeGroups;
  }
  [(NSMutableArray *)nonAppMarqueeGroups addObject:v4];
}

- (unint64_t)nonAppMarqueeGroupsCount
{
  return [(NSMutableArray *)self->_nonAppMarqueeGroups count];
}

- (id)nonAppMarqueeGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_nonAppMarqueeGroups objectAtIndex:a3];
}

+ (Class)nonAppMarqueeGroupsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotificationAppDigest;
  id v4 = [(ATXPBUserNotificationAppDigest *)&v8 description];
  v5 = [(ATXPBUserNotificationAppDigest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  if ([(NSMutableArray *)self->_appMarqueeGroups count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_appMarqueeGroups, "count"));
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v7 = self->_appMarqueeGroups;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"appMarqueeGroups"];
  }
  if ([(NSMutableArray *)self->_nonAppMarqueeGroups count])
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_nonAppMarqueeGroups, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_nonAppMarqueeGroups;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "dictionaryRepresentation", (void)v21);
          [v13 addObject:v19];
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v16);
    }

    [v4 setObject:v13 forKey:@"nonAppMarqueeGroups"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationAppDigestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_appMarqueeGroups;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_nonAppMarqueeGroups;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_bundleId) {
    objc_msgSend(v12, "setBundleId:");
  }
  if ([(ATXPBUserNotificationAppDigest *)self appMarqueeGroupsCount])
  {
    [v12 clearAppMarqueeGroups];
    unint64_t v4 = [(ATXPBUserNotificationAppDigest *)self appMarqueeGroupsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ATXPBUserNotificationAppDigest *)self appMarqueeGroupsAtIndex:i];
        [v12 addAppMarqueeGroups:v7];
      }
    }
  }
  if ([(ATXPBUserNotificationAppDigest *)self nonAppMarqueeGroupsCount])
  {
    [v12 clearNonAppMarqueeGroups];
    unint64_t v8 = [(ATXPBUserNotificationAppDigest *)self nonAppMarqueeGroupsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ATXPBUserNotificationAppDigest *)self nonAppMarqueeGroupsAtIndex:j];
        [v12 addNonAppMarqueeGroups:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_bundleId copyWithZone:a3];
  uint64_t v7 = (void *)v5[2];
  v5[2] = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v8 = self->_appMarqueeGroups;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addAppMarqueeGroups:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = self->_nonAppMarqueeGroups;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v18), "copyWithZone:", a3, (void)v21);
        [v5 addNonAppMarqueeGroups:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[2]))
     || -[NSString isEqual:](bundleId, "isEqual:"))
    && ((appMarqueeGroups = self->_appMarqueeGroups, !((unint64_t)appMarqueeGroups | v4[1]))
     || -[NSMutableArray isEqual:](appMarqueeGroups, "isEqual:")))
  {
    nonAppMarqueeGroups = self->_nonAppMarqueeGroups;
    if ((unint64_t)nonAppMarqueeGroups | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](nonAppMarqueeGroups, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  uint64_t v4 = [(NSMutableArray *)self->_appMarqueeGroups hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_nonAppMarqueeGroups hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[ATXPBUserNotificationAppDigest setBundleId:](self, "setBundleId:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ATXPBUserNotificationAppDigest *)self addAppMarqueeGroups:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ATXPBUserNotificationAppDigest addNonAppMarqueeGroups:](self, "addNonAppMarqueeGroups:", *(void *)(*((void *)&v15 + 1) + 8 * j), (void)v15);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSMutableArray)appMarqueeGroups
{
  return self->_appMarqueeGroups;
}

- (void)setAppMarqueeGroups:(id)a3
{
}

- (NSMutableArray)nonAppMarqueeGroups
{
  return self->_nonAppMarqueeGroups;
}

- (void)setNonAppMarqueeGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonAppMarqueeGroups, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_appMarqueeGroups, 0);
}

- (id)initFromJSON:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXPBUserNotificationAppDigest *)self init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 objectForKeyedSubscript:@"bundleId"];
    uint64_t v8 = +[ATXJSONHelper unwrapObject:v7];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v8;

    id v10 = [v6 objectForKeyedSubscript:@"appMarqueeGroups"];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = [[ATXPBUserNotificationDigestNotificationGroup alloc] initFromJSON:*(void *)(*((void *)&v27 + 1) + 8 * v14)];
          [(ATXPBUserNotificationAppDigest *)v5 addAppMarqueeGroups:v15];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }
    long long v16 = [v6 objectForKeyedSubscript:@"nonAppMarqueeGroups"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = [[ATXPBUserNotificationDigestNotificationGroup alloc] initFromJSON:*(void *)(*((void *)&v23 + 1) + 8 * v20)];
          [(ATXPBUserNotificationAppDigest *)v5 addNonAppMarqueeGroups:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }
  }
  return v5;
}

- (id)jsonRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"bundleId";
  NSUInteger v3 = +[ATXJSONHelper wrapObject:self->_bundleId];
  v11[0] = v3;
  v10[1] = @"appMarqueeGroups";
  id v4 = [(NSMutableArray *)self->_appMarqueeGroups _pas_mappedArrayWithTransform:&__block_literal_global_80];
  id v5 = +[ATXJSONHelper wrapObject:v4];
  v11[1] = v5;
  v10[2] = @"nonAppMarqueeGroups";
  id v6 = [(NSMutableArray *)self->_nonAppMarqueeGroups _pas_mappedArrayWithTransform:&__block_literal_global_16_0];
  uint64_t v7 = +[ATXJSONHelper wrapObject:v6];
  v11[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

uint64_t __58__ATXPBUserNotificationAppDigest_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

uint64_t __58__ATXPBUserNotificationAppDigest_JSON__jsonRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

@end
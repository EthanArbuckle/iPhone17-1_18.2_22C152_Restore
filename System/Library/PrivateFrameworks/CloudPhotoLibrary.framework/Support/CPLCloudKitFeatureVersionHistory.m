@interface CPLCloudKitFeatureVersionHistory
+ (Class)featureVersionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)featureVersions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureVersionAtIndex:(unint64_t)a3;
- (unint64_t)featureVersionsCount;
- (unint64_t)hash;
- (void)addFeatureVersion:(id)a3;
- (void)clearFeatureVersions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeatureVersions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CPLCloudKitFeatureVersionHistory

- (void)clearFeatureVersions
{
}

- (void)addFeatureVersion:(id)a3
{
  id v4 = a3;
  featureVersions = self->_featureVersions;
  id v8 = v4;
  if (!featureVersions)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_featureVersions;
    self->_featureVersions = v6;

    id v4 = v8;
    featureVersions = self->_featureVersions;
  }
  [(NSMutableArray *)featureVersions addObject:v4];
}

- (unint64_t)featureVersionsCount
{
  return (unint64_t)[(NSMutableArray *)self->_featureVersions count];
}

- (id)featureVersionAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_featureVersions objectAtIndex:a3];
}

+ (Class)featureVersionType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CPLCloudKitFeatureVersionHistory;
  v3 = [(CPLCloudKitFeatureVersionHistory *)&v7 description];
  id v4 = [(CPLCloudKitFeatureVersionHistory *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if ([(NSMutableArray *)self->_featureVersions count])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_featureVersions, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = self->_featureVersions;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"featureVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CPLCloudKitFeatureVersionHistoryReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_featureVersions;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(CPLCloudKitFeatureVersionHistory *)self featureVersionsCount])
  {
    [v8 clearFeatureVersions];
    unint64_t v4 = [(CPLCloudKitFeatureVersionHistory *)self featureVersionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(CPLCloudKitFeatureVersionHistory *)self featureVersionAtIndex:i];
        [v8 addFeatureVersion:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->_featureVersions;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyWithZone:", a3, (void)v13);
        [v5 addFeatureVersion:v11];

        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    featureVersions = self->_featureVersions;
    if ((unint64_t)featureVersions | v4[1]) {
      unsigned __int8 v6 = -[NSMutableArray isEqual:](featureVersions, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_featureVersions hash];
}

- (void)mergeFrom:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *((id *)a3 + 1);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        -[CPLCloudKitFeatureVersionHistory addFeatureVersion:](self, "addFeatureVersion:", *(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSMutableArray)featureVersions
{
  return self->_featureVersions;
}

- (void)setFeatureVersions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
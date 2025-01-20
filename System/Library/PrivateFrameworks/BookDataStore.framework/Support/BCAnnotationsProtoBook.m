@interface BCAnnotationsProtoBook
+ (Class)annotationType;
- (BOOL)hasAssetVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)annotations;
- (NSString)appVersion;
- (NSString)assetID;
- (NSString)assetVersion;
- (id)annotationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)annotationsCount;
- (unint64_t)hash;
- (void)addAnnotation:(id)a3;
- (void)clearAnnotations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setAssetID:(id)a3;
- (void)setAssetVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCAnnotationsProtoBook

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)clearAnnotations
{
}

- (void)addAnnotation:(id)a3
{
  id v4 = a3;
  annotations = self->_annotations;
  id v8 = v4;
  if (!annotations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_annotations;
    self->_annotations = v6;

    id v4 = v8;
    annotations = self->_annotations;
  }
  [(NSMutableArray *)annotations addObject:v4];
}

- (unint64_t)annotationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_annotations count];
}

- (id)annotationAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_annotations objectAtIndex:a3];
}

+ (Class)annotationType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)BCAnnotationsProtoBook;
  v3 = [(BCAnnotationsProtoBook *)&v7 description];
  id v4 = [(BCAnnotationsProtoBook *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  assetID = self->_assetID;
  if (assetID) {
    [v3 setObject:assetID forKey:@"assetID"];
  }
  appVersion = self->_appVersion;
  if (appVersion) {
    [v4 setObject:appVersion forKey:@"appVersion"];
  }
  assetVersion = self->_assetVersion;
  if (assetVersion) {
    [v4 setObject:assetVersion forKey:@"assetVersion"];
  }
  if ([(NSMutableArray *)self->_annotations count])
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_annotations, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v9 = self->_annotations;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"annotation"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006BE24((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_assetID) {
    sub_1001E9B20();
  }
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_appVersion) {
    sub_1001E9B4C();
  }
  PBDataWriterWriteStringField();
  if (self->_assetVersion) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_annotations;
  objc_super v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  [v8 setAssetID:self->_assetID];
  [v8 setAppVersion:self->_appVersion];
  if (self->_assetVersion) {
    objc_msgSend(v8, "setAssetVersion:");
  }
  if ([(BCAnnotationsProtoBook *)self annotationsCount])
  {
    [v8 clearAnnotations];
    unint64_t v4 = [(BCAnnotationsProtoBook *)self annotationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(BCAnnotationsProtoBook *)self annotationAtIndex:i];
        [v8 addAnnotation:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_assetID copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_appVersion copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_assetVersion copyWithZone:a3];
  long long v11 = (void *)v5[4];
  v5[4] = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v12 = self->_annotations;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v16), "copyWithZone:", a3, (void)v19);
        [v5 addAnnotation:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((assetID = self->_assetID, !((unint64_t)assetID | v4[3]))
     || -[NSString isEqual:](assetID, "isEqual:"))
    && ((appVersion = self->_appVersion, !((unint64_t)appVersion | v4[2]))
     || -[NSString isEqual:](appVersion, "isEqual:"))
    && ((assetVersion = self->_assetVersion, !((unint64_t)assetVersion | v4[4]))
     || -[NSString isEqual:](assetVersion, "isEqual:")))
  {
    annotations = self->_annotations;
    if ((unint64_t)annotations | v4[1]) {
      unsigned __int8 v9 = -[NSMutableArray isEqual:](annotations, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetID hash];
  unint64_t v4 = [(NSString *)self->_appVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_assetVersion hash];
  return v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_annotations hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[BCAnnotationsProtoBook setAssetID:](self, "setAssetID:");
  }
  if (*((void *)v4 + 2)) {
    -[BCAnnotationsProtoBook setAppVersion:](self, "setAppVersion:");
  }
  if (*((void *)v4 + 4)) {
    -[BCAnnotationsProtoBook setAssetVersion:](self, "setAssetVersion:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[BCAnnotationsProtoBook addAnnotation:](self, "addAnnotation:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSMutableArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
}

@end
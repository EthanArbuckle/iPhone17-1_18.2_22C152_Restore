@interface BCMutableCollectionDetail
+ (BOOL)supportsSecureCoding;
- (BCMutableCollectionDetail)initWithCloudData:(id)a3;
- (BCMutableCollectionDetail)initWithCoder:(id)a3;
- (BCMutableCollectionDetail)initWithCollectionID:(id)a3;
- (BCMutableCollectionDetail)initWithRecord:(id)a3;
- (BOOL)hidden;
- (NSString)collectionDescription;
- (NSString)collectionID;
- (NSString)description;
- (NSString)name;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (int)sortMode;
- (int)sortOrder;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionDescription:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSortMode:(int)a3;
- (void)setSortOrder:(int)a3;
@end

@implementation BCMutableCollectionDetail

- (BCMutableCollectionDetail)initWithCollectionID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001EA600();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableCollectionDetail;
  id v5 = [(BCMutableCloudData *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    self = (BCMutableCollectionDetail *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v6;
LABEL_7:
  }
  return (BCMutableCollectionDetail *)v5;
}

- (BCMutableCollectionDetail)initWithCloudData:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BCMutableCollectionDetail;
  id v6 = [(BCMutableCloudData *)&v19 initWithCloudData:v5];
  if (v6)
  {
    v7 = BUProtocolCast();
    v8 = v7;
    if (v7)
    {
      objc_super v9 = [v7 collectionID];
      v10 = (NSString *)[v9 copy];
      collectionID = v6->_collectionID;
      v6->_collectionID = v10;

      v12 = [v8 name];
      if (v12)
      {
        v3 = [v8 name];
        v13 = (__CFString *)[v3 copy];
      }
      else
      {
        v13 = &stru_10026BED0;
      }
      objc_storeStrong((id *)&v6->_name, v13);
      if (v12)
      {
      }
      v15 = [v8 collectionDescription];
      v16 = (NSString *)[v15 copy];
      collectionDescription = v6->_collectionDescription;
      v6->_collectionDescription = v16;

      v6->_hidden = [v8 hidden];
      v6->_sortOrder = [v8 sortOrder];
      v6->_sortMode = [v8 sortMode];
    }
    else
    {
      v14 = sub_1000083A0();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1001EA634();
      }

      id v6 = 0;
    }
  }
  return v6;
}

- (BCMutableCollectionDetail)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v12 = sub_1000083A0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001EA668();
    }
    id v5 = 0;
    goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)BCMutableCollectionDetail;
  id v5 = [(BCMutableCloudData *)&v15 initWithRecord:v4];
  if (v5)
  {
    uint64_t v6 = +[BCCloudData localIdentifierFromRecord:v4];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v6;

    uint64_t v8 = [v4 objectForKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    uint64_t v10 = [v4 objectForKey:@"collectionDescription"];
    collectionDescription = v5->_collectionDescription;
    v5->_collectionDescription = (NSString *)v10;

    self = [v4 objectForKey:@"hidden"];
    v5->_hidden = [(BCMutableCollectionDetail *)self BOOLValue];
    v12 = [v4 objectForKey:@"sortOrder"];
    v5->_sortOrder = [v12 intValue];
    v13 = [v4 objectForKey:@"sortMode"];
    v5->_sortMode = [v13 intValue];

LABEL_7:
  }

  return v5;
}

- (NSString)description
{
  v3 = [(BCMutableCollectionDetail *)self collectionID];
  id v4 = [(BCMutableCollectionDetail *)self name];
  id v5 = [(BCMutableCollectionDetail *)self collectionDescription];
  if ([(BCMutableCollectionDetail *)self hidden]) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  v7 = +[NSString stringWithFormat:@"collectionID: %@, Name: %@, Description: %@ hidden:%@ sortOrder:%d sortMode:%d", v3, v4, v5, v6, [(BCMutableCollectionDetail *)self sortOrder], [(BCMutableCollectionDetail *)self sortMode]];

  return (NSString *)v7;
}

- (id)recordType
{
  return @"collectionDetail";
}

- (id)zoneName
{
  return @"CollectionZone";
}

- (id)configuredRecordFromAttributes
{
  v12.receiver = self;
  v12.super_class = (Class)BCMutableCollectionDetail;
  v3 = [(BCMutableCloudData *)&v12 configuredRecordFromAttributes];
  if (v3)
  {
    id v4 = [(BCMutableCollectionDetail *)self name];
    [v3 setObject:v4 forKey:@"name"];

    id v5 = [(BCMutableCollectionDetail *)self collectionDescription];
    [v3 setObject:v5 forKey:@"collectionDescription"];

    CFStringRef v6 = +[NSNumber numberWithBool:[(BCMutableCollectionDetail *)self hidden]];
    [v3 setObject:v6 forKey:@"hidden"];

    v7 = +[NSNumber numberWithInt:[(BCMutableCollectionDetail *)self sortOrder]];
    [v3 setObject:v7 forKey:@"sortOrder"];

    uint64_t v8 = +[NSNumber numberWithInt:[(BCMutableCollectionDetail *)self sortMode]];
    [v3 setObject:v8 forKey:@"sortMode"];
  }
  else
  {
    objc_super v9 = [(BCMutableCloudData *)self privacyDelegate];
    unsigned int v10 = [v9 establishedSalt];

    if (!v10) {
      goto LABEL_7;
    }
    uint64_t v8 = sub_1000083A0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001EA69C(self);
    }
  }

LABEL_7:
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BCMutableCollectionDetail;
  id v4 = a3;
  [(BCMutableCloudData *)&v7 encodeWithCoder:v4];
  id v5 = [(BCMutableCollectionDetail *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  CFStringRef v6 = [(BCMutableCollectionDetail *)self collectionDescription];
  [v4 encodeObject:v6 forKey:@"collectionDescription"];

  objc_msgSend(v4, "encodeBool:forKey:", -[BCMutableCollectionDetail hidden](self, "hidden"), @"hidden");
  objc_msgSend(v4, "encodeInt:forKey:", -[BCMutableCollectionDetail sortOrder](self, "sortOrder"), @"sortOrder");
  objc_msgSend(v4, "encodeInt:forKey:", -[BCMutableCollectionDetail sortMode](self, "sortMode"), @"sortMode");
}

- (BCMutableCollectionDetail)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BCMutableCollectionDetail;
  id v5 = [(BCMutableCloudData *)&v14 initWithCoder:v4];
  CFStringRef v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(BCMutableCloudData *)v5 localRecordID];
    collectionID = v6->_collectionID;
    v6->_collectionID = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v6->_name;
    v6->_name = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionDescription"];
    collectionDescription = v6->_collectionDescription;
    v6->_collectionDescription = (NSString *)v11;

    v6->_hidden = [v4 decodeBoolForKey:@"hidden"];
    v6->_sortOrder = [v4 decodeIntForKey:@"sortOrder"];
    v6->_sortMode = [v4 decodeIntForKey:@"sortMode"];
  }

  return v6;
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)collectionDescription
{
  return self->_collectionDescription;
}

- (void)setCollectionDescription:(id)a3
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
}

- (int)sortMode
{
  return self->_sortMode;
}

- (void)setSortMode:(int)a3
{
  self->_sortMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
}

@end
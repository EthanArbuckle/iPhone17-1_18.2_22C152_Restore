@interface BCMutableCollectionMember
+ (BOOL)supportsSecureCoding;
- (BCMutableCollectionMember)initWithCloudData:(id)a3;
- (BCMutableCollectionMember)initWithCoder:(id)a3;
- (BCMutableCollectionMember)initWithCollectionMemberID:(id)a3;
- (BCMutableCollectionMember)initWithRecord:(id)a3;
- (NSString)collectionMemberID;
- (NSString)description;
- (id)configuredRecordFromAttributes;
- (id)recordType;
- (id)zoneName;
- (int)sortOrder;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionMemberID:(id)a3;
- (void)setSortOrder:(int)a3;
@end

@implementation BCMutableCollectionMember

- (BCMutableCollectionMember)initWithCollectionMemberID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v7 = sub_1000083A0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001EA83C();
    }

    id v5 = 0;
    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)BCMutableCollectionMember;
  id v5 = [(BCMutableCloudData *)&v9 init];
  if (v5)
  {
    id v6 = [v4 copy];
    self = (BCMutableCollectionMember *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v6;
LABEL_7:
  }
  return (BCMutableCollectionMember *)v5;
}

- (BCMutableCollectionMember)initWithCloudData:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BCMutableCollectionMember;
  id v5 = [(BCMutableCloudData *)&v13 initWithCloudData:v4];
  if (v5)
  {
    id v6 = BUProtocolCast();
    v7 = v6;
    if (v6)
    {
      v8 = [v6 collectionMemberID];
      objc_super v9 = (NSString *)[v8 copy];
      collectionMemberID = v5->_collectionMemberID;
      v5->_collectionMemberID = v9;

      v5->_sortOrder = [v7 sortOrder];
      if (v5->_collectionMemberID)
      {
LABEL_9:

        goto LABEL_10;
      }
      v11 = sub_1000083A0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001EA8A4();
      }
    }
    else
    {
      v11 = sub_1000083A0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001EA870();
      }
    }

    id v5 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (BCMutableCollectionMember)initWithRecord:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    objc_super v9 = sub_1000083A0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001EA8D8();
    }

    id v5 = 0;
    goto LABEL_11;
  }
  v11.receiver = self;
  v11.super_class = (Class)BCMutableCollectionMember;
  id v5 = [(BCMutableCloudData *)&v11 initWithRecord:v4];
  if (v5)
  {
    uint64_t v6 = +[BCCloudData localIdentifierFromRecord:v4];
    collectionMemberID = v5->_collectionMemberID;
    v5->_collectionMemberID = (NSString *)v6;

    if (!v5->_collectionMemberID)
    {
      v8 = sub_1000083A0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001EA90C();
      }
    }
    self = [v4 objectForKey:@"sortOrder"];
    v5->_sortOrder = [(BCMutableCollectionMember *)self intValue];
LABEL_11:
  }
  return v5;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BCMutableCollectionMember *)self collectionMemberID];
  uint64_t v6 = [(BCMutableCollectionMember *)self sortOrder];
  v7 = [(BCMutableCloudData *)self modificationDate];
  v8 = +[NSString stringWithFormat:@"<%@: %p> collectionMemberID: %@, sortOrder:%d modificationDate:%@", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (id)recordType
{
  return @"collectionMember";
}

- (id)zoneName
{
  return @"CollectionZone";
}

- (id)configuredRecordFromAttributes
{
  v6.receiver = self;
  v6.super_class = (Class)BCMutableCollectionMember;
  v3 = [(BCMutableCloudData *)&v6 configuredRecordFromAttributes];
  id v4 = +[NSNumber numberWithInt:[(BCMutableCollectionMember *)self sortOrder]];
  [v3 setObject:v4 forKey:@"sortOrder"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BCMutableCollectionMember;
  id v4 = a3;
  [(BCMutableCloudData *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt:forKey:", -[BCMutableCollectionMember sortOrder](self, "sortOrder", v5.receiver, v5.super_class), @"sortOrder");
}

- (BCMutableCollectionMember)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCMutableCollectionMember;
  objc_super v5 = [(BCMutableCloudData *)&v10 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(BCMutableCloudData *)v5 localRecordID];
    collectionMemberID = v6->_collectionMemberID;
    v6->_collectionMemberID = (NSString *)v7;

    v6->_sortOrder = [v4 decodeIntForKey:@"sortOrder"];
  }

  return v6;
}

- (NSString)collectionMemberID
{
  return self->_collectionMemberID;
}

- (void)setCollectionMemberID:(id)a3
{
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
}

- (void).cxx_destruct
{
}

@end
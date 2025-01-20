@interface IMCollaborationNotice
+ (BOOL)supportsSecureCoding;
+ (id)noticeWithGUIDString:(id)a3 sender:(id)a4 metadata:(id)a5 date:(id)a6 dateViewed:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsEphemeralDismissal;
- (IMCollaborationNotice)initWithCoder:(id)a3;
- (IMCollaborationNotice)initWithGUIDString:(id)a3 sender:(id)a4 metadata:(id)a5 date:(id)a6 dateViewed:(id)a7;
- (IMCollaborationNoticeMetadata)metadata;
- (NSDate)date;
- (NSDate)dateViewed;
- (NSString)guidString;
- (NSString)senderHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateViewed:(id)a3;
- (void)setGuidString:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setSenderHandle:(id)a3;
@end

@implementation IMCollaborationNotice

+ (id)noticeWithGUIDString:(id)a3 sender:(id)a4 metadata:(id)a5 date:(id)a6 dateViewed:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[IMCollaborationNotice alloc] initWithGUIDString:v15 sender:v14 metadata:v13 date:v12 dateViewed:v11];

  return v16;
}

- (IMCollaborationNotice)initWithGUIDString:(id)a3 sender:(id)a4 metadata:(id)a5 date:(id)a6 dateViewed:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IMCollaborationNotice;
  v17 = [(IMCollaborationNotice *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_guidString, a3);
    objc_storeStrong((id *)&v18->_senderHandle, a4);
    objc_storeStrong((id *)&v18->_date, a6);
    objc_storeStrong((id *)&v18->_dateViewed, a7);
    objc_storeStrong((id *)&v18->_metadata, a5);
  }

  return v18;
}

- (BOOL)wantsEphemeralDismissal
{
  v2 = [(IMCollaborationNotice *)self metadata];
  uint64_t v3 = [v2 type];

  return (v3 & 0xFFFFFFFFFFFFFFFELL) != 8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IMCollaborationNotice *)a3;
  if (v4 == self)
  {
    char v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(IMCollaborationNotice *)self guidString];
      v7 = [(IMCollaborationNotice *)v5 guidString];
      int v8 = [v6 isEqual:v7];

      if (!v8) {
        goto LABEL_10;
      }
      v9 = [(IMCollaborationNotice *)self senderHandle];
      v10 = [(IMCollaborationNotice *)v5 senderHandle];
      int v11 = [v9 isEqualToString:v10];

      if (!v11) {
        goto LABEL_10;
      }
      id v12 = [(IMCollaborationNotice *)self metadata];
      id v13 = [(IMCollaborationNotice *)v5 metadata];
      int v14 = [v12 isEqual:v13];

      if (!v14) {
        goto LABEL_10;
      }
      id v15 = [(IMCollaborationNotice *)self date];
      id v16 = [(IMCollaborationNotice *)v5 date];
      int v17 = [v15 isEqualToDate:v16];

      if (v17)
      {
        v18 = [(IMCollaborationNotice *)self dateViewed];
        v19 = [(IMCollaborationNotice *)v5 dateViewed];
        char v20 = [v18 isEqualToDate:v19];
      }
      else
      {
LABEL_10:
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3 = [(IMCollaborationNotice *)self guidString];
  uint64_t v4 = [v3 hash];
  v5 = [(IMCollaborationNotice *)self senderHandle];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(IMCollaborationNotice *)self date];
  uint64_t v8 = [v7 hash];
  v9 = [(IMCollaborationNotice *)self metadata];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  int v11 = [(IMCollaborationNotice *)self dateViewed];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(IMCollaborationNotice *)self guidString];
  [v4 encodeObject:v5 forKey:@"id"];

  uint64_t v6 = [(IMCollaborationNotice *)self senderHandle];
  [v4 encodeObject:v6 forKey:@"s"];

  v7 = [(IMCollaborationNotice *)self metadata];
  [v4 encodeObject:v7 forKey:@"m"];

  uint64_t v8 = [(IMCollaborationNotice *)self date];
  [v4 encodeObject:v8 forKey:@"d"];

  id v9 = [(IMCollaborationNotice *)self dateViewed];
  [v4 encodeObject:v9 forKey:@"ds"];
}

- (IMCollaborationNotice)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMCollaborationNotice;
  v5 = [(IMCollaborationNotice *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
    [(IMCollaborationNotice *)v5 setGuidString:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
    [(IMCollaborationNotice *)v5 setSenderHandle:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"m"];
    [(IMCollaborationNotice *)v5 setMetadata:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
    [(IMCollaborationNotice *)v5 setDate:v9];

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ds"];
    [(IMCollaborationNotice *)v5 setDateViewed:v10];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(IMCollaborationNotice *)self guidString];
  [v4 setGuidString:v5];

  uint64_t v6 = [(IMCollaborationNotice *)self senderHandle];
  [v4 setSenderHandle:v6];

  v7 = [(IMCollaborationNotice *)self metadata];
  [v4 setMetadata:v7];

  uint64_t v8 = [(IMCollaborationNotice *)self date];
  [v4 setDate:v8];

  id v9 = [(IMCollaborationNotice *)self dateViewed];
  [v4 setDateViewed:v9];

  return v4;
}

- (NSString)guidString
{
  return self->_guidString;
}

- (void)setGuidString:(id)a3
{
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
}

- (IMCollaborationNoticeMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDate)dateViewed
{
  return self->_dateViewed;
}

- (void)setDateViewed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateViewed, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);

  objc_storeStrong((id *)&self->_guidString, 0);
}

@end
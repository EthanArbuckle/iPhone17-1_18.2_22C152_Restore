@interface GTReplayUpdateLibraryCache
+ (BOOL)supportsSecureCoding;
- (GTReplayUpdateLibraryCache)initWithCoder:(id)a3;
- (NSData)data;
- (NSString)uuid;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation GTReplayUpdateLibraryCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayUpdateLibraryCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTReplayUpdateLibraryCache;
  v5 = [(GTReplayRequest *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GTReplayUpdateLibraryCache;
  id v4 = a3;
  [(GTReplayRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, @"uuid", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_data forKey:@"data"];
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
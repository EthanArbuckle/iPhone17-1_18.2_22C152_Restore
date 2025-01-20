@interface MPMediaBooklet
- (NSString)name;
- (NSString)redownloadParams;
- (id)description;
- (int64_t)fileSize;
- (int64_t)storeItemID;
- (unint64_t)itemPersistentID;
- (void)setFileSize:(int64_t)a3;
- (void)setItemPersistentID:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setRedownloadParams:(id)a3;
- (void)setStoreItemID:(int64_t)a3;
@end

@implementation MPMediaBooklet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->redownloadParams, 0);

  objc_storeStrong((id *)&self->name, 0);
}

- (void)setFileSize:(int64_t)a3
{
  self->fileSize = a3;
}

- (int64_t)fileSize
{
  return self->fileSize;
}

- (void)setRedownloadParams:(id)a3
{
}

- (NSString)redownloadParams
{
  return self->redownloadParams;
}

- (void)setStoreItemID:(int64_t)a3
{
  self->storeItemID = a3;
}

- (int64_t)storeItemID
{
  return self->storeItemID;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->name;
}

- (void)setItemPersistentID:(unint64_t)a3
{
  self->itemPersistentID = a3;
}

- (unint64_t)itemPersistentID
{
  return self->itemPersistentID;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPMediaBooklet *)self name];
  v6 = [v3 stringWithFormat:@"<%@: %p ['%@', storeID=%lld]>", v4, self, v5, -[MPMediaBooklet storeItemID](self, "storeItemID")];

  return v6;
}

@end
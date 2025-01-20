@interface MSASPersonModelItem
- (BOOL)isEqual:(id)a3;
- (MSASAlbum)album;
- (NSObject)object;
- (NSString)albumGUID;
- (id)copyWithZone:(_NSZone *)a3;
- (int)errorCount;
- (void)setAlbum:(id)a3;
- (void)setAlbumGUID:(id)a3;
- (void)setErrorCount:(int)a3;
- (void)setObject:(id)a3;
@end

@implementation MSASPersonModelItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_object, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_album, 0);
}

- (void)setObject:(id)a3
{
}

- (NSObject)object
{
  return self->_object;
}

- (void)setAlbumGUID:(id)a3
{
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbum:(id)a3
{
}

- (MSASAlbum)album
{
  return self->_album;
}

- (void)setErrorCount:(int)a3
{
  self->_errorCount = a3;
}

- (int)errorCount
{
  return self->_errorCount;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MSASPersonModelItem);
  [(MSASPersonModelItem *)v4 setErrorCount:[(MSASPersonModelItem *)self errorCount]];
  v5 = [(MSASPersonModelItem *)self object];
  [(MSASPersonModelItem *)v4 setObject:v5];

  v6 = [(MSASPersonModelItem *)self album];
  [(MSASPersonModelItem *)v4 setAlbum:v6];

  v7 = [(MSASPersonModelItem *)self albumGUID];
  [(MSASPersonModelItem *)v4 setAlbumGUID:v7];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    object = self->_object;
    v6 = [v4 object];

    char v7 = [object isEqual:v6];
    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MSASPersonModelItem;
    BOOL v9 = [(MSASPersonModelItem *)&v10 isEqual:v4];

    return v9;
  }
}

@end
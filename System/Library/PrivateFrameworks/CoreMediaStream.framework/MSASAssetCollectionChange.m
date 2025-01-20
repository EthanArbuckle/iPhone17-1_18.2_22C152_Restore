@interface MSASAssetCollectionChange
- (BOOL)wasDeleted;
- (NSString)GUID;
- (NSString)ctag;
- (id)description;
- (void)setCtag:(id)a3;
- (void)setGUID:(id)a3;
- (void)setWasDeleted:(BOOL)a3;
@end

@implementation MSASAssetCollectionChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

- (void)setCtag:(id)a3
{
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setGUID:(id)a3
{
}

- (NSString)GUID
{
  return self->_GUID;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MSASAssetCollectionChange;
  v4 = [(MSASAssetCollectionChange *)&v10 description];
  GUID = self->_GUID;
  ctag = self->_ctag;
  v7 = [NSString MSStringWithBool:self->_wasDeleted];
  v8 = [v3 stringWithFormat:@"%@: GUID : %@, ctag: %@, was deleted: %@", v4, GUID, ctag, v7];

  return v8;
}

@end
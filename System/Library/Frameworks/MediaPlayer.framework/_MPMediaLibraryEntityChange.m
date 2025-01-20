@interface _MPMediaLibraryEntityChange
- (MPMediaEntity)entity;
- (NSString)anchor;
- (_MPMediaLibraryEntityChange)initWithEntity:(id)a3 anchor:(id)a4 deletionType:(int64_t)a5;
- (int64_t)deletionType;
@end

@implementation _MPMediaLibraryEntityChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);

  objc_storeStrong((id *)&self->_entity, 0);
}

- (int64_t)deletionType
{
  return self->_deletionType;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (MPMediaEntity)entity
{
  return self->_entity;
}

- (_MPMediaLibraryEntityChange)initWithEntity:(id)a3 anchor:(id)a4 deletionType:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_MPMediaLibraryEntityChange;
  v11 = [(_MPMediaLibraryEntityChange *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entity, a3);
    uint64_t v13 = [v10 copy];
    anchor = v12->_anchor;
    v12->_anchor = (NSString *)v13;

    v12->_deletionType = a5;
  }

  return v12;
}

@end
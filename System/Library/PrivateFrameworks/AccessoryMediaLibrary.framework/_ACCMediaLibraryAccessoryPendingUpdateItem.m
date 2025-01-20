@interface _ACCMediaLibraryAccessoryPendingUpdateItem
- (BOOL)isEqual:(id)a3;
- (NSString)libraryUID;
- (NSString)revision;
- (_ACCMediaLibraryAccessoryPendingUpdateItem)initWithLibrary:(id)a3 revision:(id)a4 type:(int)a5 item:(id)a6;
- (id)description;
- (id)item;
- (int)type;
- (void)dealloc;
@end

@implementation _ACCMediaLibraryAccessoryPendingUpdateItem

- (_ACCMediaLibraryAccessoryPendingUpdateItem)initWithLibrary:(id)a3 revision:(id)a4 type:(int)a5 item:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_ACCMediaLibraryAccessoryPendingUpdateItem;
  v14 = [(_ACCMediaLibraryAccessoryPendingUpdateItem *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_libraryUID, a3);
    objc_storeStrong((id *)&v15->_revision, a4);
    v15->_type = a5;
    objc_storeStrong(&v15->_item, a6);
  }

  return v15;
}

- (void)dealloc
{
  libraryUID = self->_libraryUID;
  self->_libraryUID = 0;

  revision = self->_revision;
  self->_revision = 0;

  id item = self->_item;
  self->_id item = 0;

  v6.receiver = self;
  v6.super_class = (Class)_ACCMediaLibraryAccessoryPendingUpdateItem;
  [(_ACCMediaLibraryAccessoryPendingUpdateItem *)&v6 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_ACCMediaLibraryAccessoryPendingUpdateItem>[libraryUID=%@ revision=%@ type=%u]", self->_libraryUID, self->_revision, self->_type];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [v5 libraryUID];
    if ([v6 isEqualToString:self->_libraryUID])
    {
      v7 = [v5 revision];
      if ([v7 isEqualToString:self->_revision]) {
        BOOL v8 = [v5 type] == self->_type;
      }
      else {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (NSString)libraryUID
{
  return self->_libraryUID;
}

- (NSString)revision
{
  return self->_revision;
}

- (int)type
{
  return self->_type;
}

- (id)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_item, 0);
  objc_storeStrong((id *)&self->_revision, 0);

  objc_storeStrong((id *)&self->_libraryUID, 0);
}

@end
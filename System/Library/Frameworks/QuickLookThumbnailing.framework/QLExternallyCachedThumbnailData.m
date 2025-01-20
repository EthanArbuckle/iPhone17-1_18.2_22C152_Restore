@interface QLExternallyCachedThumbnailData
- (BOOL)isEqual:(id)a3;
- (NSData)versionIdentifier;
- (NSString)description;
- (NSString)fileExtension;
- (NSString)itemIdentifier;
- (id)initFromPQLResultSet:(id)a3 error:(id *)a4;
- (unint64_t)size;
@end

@implementation QLExternallyCachedThumbnailData

- (id)initFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)QLExternallyCachedThumbnailData;
  v6 = [(QLExternallyCachedThumbnailData *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [v5 stringAtIndex:0];
    itemIdentifier = v6->_itemIdentifier;
    v6->_itemIdentifier = (NSString *)v7;

    uint64_t v9 = [v5 dataAtIndex:1];
    versionIdentifier = v6->_versionIdentifier;
    v6->_versionIdentifier = (NSData *)v9;

    uint64_t v11 = [v5 stringAtIndex:2];
    fileExtension = v6->_fileExtension;
    v6->_fileExtension = (NSString *)v11;

    v6->_size = [v5 unsignedIntegerAtIndex:3];
  }

  return v6;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@:%p id:%@ vi:%@ fe: %@>", v5, self, self->_itemIdentifier, self->_versionIdentifier, self->_fileExtension];

  return (NSString *)v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (QLExternallyCachedThumbnailData *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      itemIdentifier = self->_itemIdentifier;
      uint64_t v7 = [(QLExternallyCachedThumbnailData *)v5 itemIdentifier];
      if ([(NSString *)itemIdentifier isEqualToString:v7])
      {
        versionIdentifier = self->_versionIdentifier;
        uint64_t v9 = [(QLExternallyCachedThumbnailData *)v5 versionIdentifier];
        if ([(NSData *)versionIdentifier isEqualToData:v9])
        {
          fileExtension = self->_fileExtension;
          uint64_t v11 = [(QLExternallyCachedThumbnailData *)v5 fileExtension];
          char v12 = [(NSString *)fileExtension isEqualToString:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSData)versionIdentifier
{
  return self->_versionIdentifier;
}

- (NSString)fileExtension
{
  return self->_fileExtension;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_versionIdentifier, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
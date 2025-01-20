@interface _UIDocumentPickerContainerItemThumbnailKey
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSObject)primaryKey;
- (_UIDocumentPickerContainerItemThumbnailKey)initWithPrimaryKey:(id)a3 size:(CGSize)a4 scale:(double)a5;
- (double)scale;
- (unint64_t)hash;
@end

@implementation _UIDocumentPickerContainerItemThumbnailKey

- (_UIDocumentPickerContainerItemThumbnailKey)initWithPrimaryKey:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerContainerItemThumbnailKey;
  v11 = [(_UIDocumentPickerContainerItemThumbnailKey *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_primaryKey, a3);
    v12->_size.CGFloat width = width;
    v12->_size.CGFloat height = height;
    v12->_scale = a5;
  }

  return v12;
}

- (unint64_t)hash
{
  v3 = [(_UIDocumentPickerContainerItemThumbnailKey *)self primaryKey];
  uint64_t v4 = [v3 hash];

  [(_UIDocumentPickerContainerItemThumbnailKey *)self size];
  unint64_t v6 = (unint64_t)v5 - v4 + 32 * v4;
  [(_UIDocumentPickerContainerItemThumbnailKey *)self size];
  unint64_t v8 = (unint64_t)v7 - v6 + 32 * v6;
  [(_UIDocumentPickerContainerItemThumbnailKey *)self scale];
  return (unint64_t)v9 - v8 + 32 * v8 + 923521;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_UIDocumentPickerContainerItemThumbnailKey *)a3;
  double v5 = v4;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = v5;
    double v7 = [(_UIDocumentPickerContainerItemThumbnailKey *)self primaryKey];
    unint64_t v8 = [(_UIDocumentPickerContainerItemThumbnailKey *)v6 primaryKey];
    if ([v7 isEqual:v8])
    {
      [(_UIDocumentPickerContainerItemThumbnailKey *)self size];
      double v10 = v9;
      double v12 = v11;
      [(_UIDocumentPickerContainerItemThumbnailKey *)v6 size];
      BOOL v14 = 0;
      if (v10 == v15 && v12 == v13)
      {
        [(_UIDocumentPickerContainerItemThumbnailKey *)self scale];
        double v17 = v16;
        [(_UIDocumentPickerContainerItemThumbnailKey *)v6 scale];
        BOOL v14 = v17 == v18;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (NSObject)primaryKey
{
  return self->_primaryKey;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (void).cxx_destruct
{
}

@end
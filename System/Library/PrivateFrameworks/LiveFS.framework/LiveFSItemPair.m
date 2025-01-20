@interface LiveFSItemPair
+ (id)newWithParent:(id)a3 fname:(id)a4;
+ (id)newWithParent:(id)a3 fname:(id)a4 caseSensitivity:(BOOL)a5;
- (BOOL)isEqual:(id)a3;
- (LiveFSItemPair)initWithParent:(id)a3 fname:(id)a4 caseSensitivity:(BOOL)a5;
- (NSString)filename;
- (NSString)itemId;
- (unint64_t)hash;
@end

@implementation LiveFSItemPair

+ (id)newWithParent:(id)a3 fname:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[LiveFSItemPair alloc] initWithParent:v6 fname:v5 caseSensitivity:1];

  return v7;
}

+ (id)newWithParent:(id)a3 fname:(id)a4 caseSensitivity:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = [[LiveFSItemPair alloc] initWithParent:v8 fname:v7 caseSensitivity:v5];

  return v9;
}

- (LiveFSItemPair)initWithParent:(id)a3 fname:(id)a4 caseSensitivity:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_itemId, a3);
  if (v5)
  {
    v11 = (NSString *)v10;
  }
  else
  {
    v11 = [v10 lowercaseString];
  }
  filename = self->_filename;
  self->_filename = v11;

  return self;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_itemId hash];
  return [(NSString *)self->_filename hash] - v3 + (v3 << 7);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    itemId = self->_itemId;
    id v6 = [v4 itemId];
    if ([(NSString *)itemId isEqualToString:v6])
    {
      filename = self->_filename;
      id v8 = [v4 filename];
      BOOL v9 = [(NSString *)filename isEqualToString:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (NSString)itemId
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);

  objc_storeStrong((id *)&self->_itemId, 0);
}

@end
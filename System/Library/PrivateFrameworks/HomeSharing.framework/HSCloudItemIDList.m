@interface HSCloudItemIDList
+ (BOOL)supportsSecureCoding;
- (HSCloudItemIDList)init;
- (HSCloudItemIDList)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)count;
- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateCloudItemIDsUsingBlock:(id)a3;
- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5;
@end

@implementation HSCloudItemIDList

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idTypes, 0);
  objc_storeStrong((id *)&self->_itemIDs, 0);
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_itemIDs count];
}

- (void)enumerateCloudItemIDsUsingBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, char *))a3;
  if (v4)
  {
    char v13 = 0;
    uint64_t v5 = [(NSMutableArray *)self->_itemIDs count];
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = v5 - 1;
      do
      {
        v8 = [(NSMutableArray *)self->_itemIDs objectAtIndex:v6];
        uint64_t v9 = [v8 unsignedLongLongValue];

        v10 = [(NSMutableArray *)self->_idTypes objectAtIndex:v6];
        uint64_t v11 = [v10 integerValue];

        v4[2](v4, v9, v11, v6, &v13);
        if (v13) {
          break;
        }
      }
      while (v7 != v6++);
    }
  }
}

- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5
{
  itemIDs = self->_itemIDs;
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableArray *)itemIDs insertObject:v9 atIndex:a5];

  idTypes = self->_idTypes;
  id v11 = [NSNumber numberWithInteger:a4];
  [(NSMutableArray *)idTypes insertObject:v11 atIndex:a5];
}

- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4
{
  itemIDs = self->_itemIDs;
  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableArray *)itemIDs addObject:v7];

  idTypes = self->_idTypes;
  id v9 = [NSNumber numberWithInteger:a4];
  [(NSMutableArray *)idTypes addObject:v9];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p Item ID Count = %lu>", objc_opt_class(), self, -[NSMutableArray count](self->_itemIDs, "count")];
}

- (void)encodeWithCoder:(id)a3
{
  itemIDs = self->_itemIDs;
  id v5 = a3;
  [v5 encodeObject:itemIDs forKey:@"HSCloudItemIDListItemIDs"];
  [v5 encodeObject:self->_idTypes forKey:@"HSCloudItemIDListIDTypes"];
}

- (HSCloudItemIDList)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HSCloudItemIDList;
  id v5 = [(HSCloudItemIDList *)&v17 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"HSCloudItemIDListItemIDs"];
    itemIDs = v5->_itemIDs;
    v5->_itemIDs = (NSMutableArray *)v9;

    id v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    char v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"HSCloudItemIDListIDTypes"];
    idTypes = v5->_idTypes;
    v5->_idTypes = (NSMutableArray *)v14;
  }
  return v5;
}

- (HSCloudItemIDList)init
{
  v8.receiver = self;
  v8.super_class = (Class)HSCloudItemIDList;
  v2 = [(HSCloudItemIDList *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    itemIDs = v2->_itemIDs;
    v2->_itemIDs = v3;

    id v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    idTypes = v2->_idTypes;
    v2->_idTypes = v5;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
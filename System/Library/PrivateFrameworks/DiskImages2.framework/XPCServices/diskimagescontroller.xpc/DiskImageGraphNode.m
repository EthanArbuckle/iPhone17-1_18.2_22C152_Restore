@interface DiskImageGraphNode
+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4;
+ (id)GraphNodeWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (BOOL)deleteImage;
- (BOOL)isCache;
- (DiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6;
- (DiskImageGraphNode)initWithTag:(id)a3 UUID:(id)a4 parentNode:(id)a5 metadata:(id)a6 isCache:(BOOL)a7;
- (DiskImageGraphNode)parent;
- (NSDictionary)metadata;
- (NSMutableArray)children;
- (NSMutableDictionary)pstackDict;
- (NSString)tag;
- (NSUUID)UUID;
- (NSUUID)parentUUID;
- (id)URL;
- (id)getChildren;
- (id)getDescendants;
- (id)toDIShadowNode;
- (id)toDictionary;
- (void)addDecendantsToArray:(id)a3;
- (void)setChildren:(id)a3;
- (void)setIsCache:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setParent:(id)a3;
- (void)setPstackDict:(id)a3;
- (void)setTag:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation DiskImageGraphNode

- (id)toDIShadowNode
{
  v3 = [DIShadowNode alloc];
  v4 = [(DiskImageGraphNode *)self URL];
  v5 = [(DIShadowNode *)v3 initWithURL:v4 isCache:[(DiskImageGraphNode *)self isCache]];

  return v5;
}

+ (BOOL)validateWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned __int8 v6 = 0;
  if ([v5 validateAndPopObjectForKey:@"Tag" className:objc_opt_class() isOptional:0 error:a4])
  {
    unsigned __int8 v6 = 0;
    if ([v5 validateAndPopObjectForKey:@"UUID" className:objc_opt_class() isOptional:0 error:a4])
    {
      if ([v5 validateAndPopObjectForKey:@"ParentUUID" className:objc_opt_class() isOptional:1 error:a4]&& objc_msgSend(v5, "validateAndPopObjectForKey:className:isOptional:error:", @"Metadata", objc_opt_class(), 1, a4))
      {
        unsigned __int8 v6 = [v5 validateAndPopObjectForKey:@"IsCache" className:objc_opt_class() isOptional:0 error:a4];
      }
      else
      {
        unsigned __int8 v6 = 0;
      }
    }
  }

  return v6;
}

- (DiskImageGraphNode)initWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DiskImageGraphNode;
  v9 = [(DiskImageGraphNode *)&v29 init];
  if (v9)
  {
    uint64_t v10 = [v8 objectForKey:@"Tag"];
    tag = v9->_tag;
    v9->_tag = (NSString *)v10;

    id v12 = objc_alloc((Class)NSUUID);
    v13 = [v8 objectForKey:@"UUID"];
    v14 = (NSUUID *)[v12 initWithUUIDString:v13];
    UUID = v9->_UUID;
    v9->_UUID = v14;

    v16 = [v8 objectForKey:@"IsCache"];
    v9->_isCache = [v16 BOOLValue];

    if (v6) {
      v17 = v8;
    }
    else {
      v17 = 0;
    }
    objc_storeStrong((id *)&v9->_pstackDict, v17);
    v18 = [v8 objectForKey:@"ParentUUID"];

    if (v18)
    {
      id v19 = objc_alloc((Class)NSUUID);
      v20 = [v8 objectForKey:@"ParentUUID"];
      v21 = (NSUUID *)[v19 initWithUUIDString:v20];
      parentUUID = v9->_parentUUID;
      v9->_parentUUID = v21;
    }
    v23 = [v8 objectForKey:@"Metadata"];

    if (v23)
    {
      uint64_t v24 = [v8 objectForKey:@"Metadata"];
      metadata = v9->_metadata;
      v9->_metadata = (NSDictionary *)v24;
    }
    v26 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    children = v9->_children;
    v9->_children = v26;
  }
  return v9;
}

+ (id)GraphNodeWithDictionary:(id)a3 updateChangesToDict:(BOOL)a4 workDir:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [v10 objectForKeyedSubscript:@"PluginName"];

  id v12 = off_10019CFB0;
  if (v11) {
    id v12 = off_10019D0F0;
  }
  id v13 = [objc_alloc(*v12) initWithDictionary:v10 updateChangesToDict:v7 workDir:v9 error:a6];

  return v13;
}

- (DiskImageGraphNode)initWithTag:(id)a3 UUID:(id)a4 parentNode:(id)a5 metadata:(id)a6 isCache:(BOOL)a7
{
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)DiskImageGraphNode;
  v16 = [(DiskImageGraphNode *)&v24 init];
  v17 = v16;
  if (v16)
  {
    if (v12) {
      v18 = v12;
    }
    else {
      v18 = &stru_1001C72F8;
    }
    objc_storeStrong((id *)&v16->_tag, v18);
    objc_storeStrong((id *)&v17->_UUID, a4);
    objc_storeStrong((id *)&v17->_parent, a5);
    uint64_t v19 = [v14 UUID];
    parentUUID = v17->_parentUUID;
    v17->_parentUUID = (NSUUID *)v19;

    objc_storeStrong((id *)&v17->_metadata, a6);
    v17->_isCache = a7;
    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    children = v17->_children;
    v17->_children = v21;
  }
  return v17;
}

- (void)setTag:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_tag, a3);
  id v5 = [(DiskImageGraphNode *)self pstackDict];

  if (v5)
  {
    BOOL v6 = [(DiskImageGraphNode *)self pstackDict];
    [v6 setObject:v7 forKey:@"Tag"];
  }
}

- (void)setUUID:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_UUID, a3);
  id v5 = [(DiskImageGraphNode *)self pstackDict];

  if (v5)
  {
    BOOL v6 = [(DiskImageGraphNode *)self pstackDict];
    id v7 = [v8 UUIDString];
    [v6 setObject:v7 forKey:@"UUID"];
  }
}

- (void)setParent:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_parent, a3);
  id v5 = [v11 UUID];
  parentUUID = self->_parentUUID;
  self->_parentUUID = v5;

  id v7 = [(DiskImageGraphNode *)self pstackDict];

  if (v7)
  {
    id v8 = [(DiskImageGraphNode *)self pstackDict];
    id v9 = [v11 UUID];
    id v10 = [v9 UUIDString];
    [v8 setObject:v10 forKey:@"ParentUUID"];
  }
}

- (void)setMetadata:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_metadata, a3);
  id v5 = [(DiskImageGraphNode *)self pstackDict];

  if (v5)
  {
    BOOL v6 = [(DiskImageGraphNode *)self pstackDict];
    [v6 setObject:v7 forKey:@"Metadata"];
  }
}

- (void)setIsCache:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isCache = a3;
  id v5 = [(DiskImageGraphNode *)self pstackDict];

  if (v5)
  {
    id v7 = [(DiskImageGraphNode *)self pstackDict];
    BOOL v6 = +[NSNumber numberWithBool:v3];
    [v7 setObject:v6 forKey:@"IsCache"];
  }
}

- (id)getDescendants
{
  BOOL v3 = [(DiskImageGraphNode *)self children];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  [(DiskImageGraphNode *)self addDecendantsToArray:v4];
  return v4;
}

- (void)addDecendantsToArray:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(DiskImageGraphNode *)self children];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v4 addObject:v10];
        [v10 addDecendantsToArray:v4];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)toDictionary
{
  id v3 = objc_alloc((Class)NSMutableDictionary);
  id v4 = [(DiskImageGraphNode *)self tag];
  id v5 = [(DiskImageGraphNode *)self UUID];
  id v6 = [v5 UUIDString];
  id v7 = +[NSNumber numberWithBool:[(DiskImageGraphNode *)self isCache]];
  id v8 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"Tag", v6, @"UUID", v7, @"IsCache", 0);

  id v9 = [(DiskImageGraphNode *)self parentUUID];

  if (v9)
  {
    id v10 = [(DiskImageGraphNode *)self parentUUID];
    long long v11 = [v10 UUIDString];
    [v8 setObject:v11 forKey:@"ParentUUID"];
  }
  long long v12 = [(DiskImageGraphNode *)self metadata];

  if (v12)
  {
    long long v13 = [(DiskImageGraphNode *)self metadata];
    [v8 setObject:v13 forKey:@"Metadata"];
  }
  return v8;
}

- (BOOL)deleteImage
{
  return 0;
}

- (id)URL
{
  return 0;
}

- (id)getChildren
{
  v2 = [(DiskImageGraphNode *)self children];
  id v3 = [v2 copy];

  return v3;
}

- (NSString)tag
{
  return self->_tag;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)isCache
{
  return self->_isCache;
}

- (NSMutableDictionary)pstackDict
{
  return self->_pstackDict;
}

- (void)setPstackDict:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (DiskImageGraphNode)parent
{
  return self->_parent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_pstackDict, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end
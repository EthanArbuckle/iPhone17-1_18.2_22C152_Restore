@interface EMMessageChangeAction
+ (BOOL)supportsSecureCoding;
- (EMMessageChangeAction)initWithCoder:(id)a3;
- (EMMessageChangeAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
- (EMMessageChangeAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
- (EMMessageChangeAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5;
- (EMQuery)query;
- (NSArray)objectIDs;
- (NSString)ef_publicDescription;
- (int64_t)actor;
- (int64_t)origin;
- (int64_t)signpostType;
- (void)encodeWithCoder:(id)a3;
- (void)setActor:(int64_t)a3;
- (void)setObjectIDs:(id)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setQuery:(id)a3;
@end

@implementation EMMessageChangeAction

- (EMMessageChangeAction)initWithMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMMessageChangeAction;
  v9 = [(EMMessageChangeAction *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend(v8, "ef_map:", &__block_literal_global_31);
    objectIDs = v9->_objectIDs;
    v9->_objectIDs = (NSArray *)v10;

    v9->_origin = a4;
    v9->_actor = a5;
  }

  return v9;
}

id __63__EMMessageChangeAction_initWithMessageListItems_origin_actor___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 objectID];
  return v2;
}

- (EMMessageChangeAction)initWithObjectIDs:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMMessageChangeAction;
  uint64_t v10 = [(EMMessageChangeAction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_objectIDs, a3);
    v11->_origin = a4;
    v11->_actor = a5;
  }

  return v11;
}

- (EMMessageChangeAction)initWithQuery:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EMMessageChangeAction;
  uint64_t v10 = [(EMMessageChangeAction *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_query, a3);
    v11->_origin = a4;
    v11->_actor = a5;
  }

  return v11;
}

- (int64_t)signpostType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageChangeAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EMMessageChangeAction;
  v5 = [(EMMessageChangeAction *)&v14 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"EFPropertyKey_objectIDs"];
    objectIDs = v5->_objectIDs;
    v5->_objectIDs = (NSArray *)v9;

    v5->_origin = [v4 decodeIntegerForKey:@"EFPropertyKey_origin"];
    v5->_actor = [v4 decodeIntegerForKey:@"EFPropertyKey_actor"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_query"];
    query = v5->_query;
    v5->_query = (EMQuery *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(EMMessageChangeAction *)self objectIDs];
  [v6 encodeObject:v4 forKey:@"EFPropertyKey_objectIDs"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[EMMessageChangeAction origin](self, "origin"), @"EFPropertyKey_origin");
  objc_msgSend(v6, "encodeInteger:forKey:", -[EMMessageChangeAction actor](self, "actor"), @"EFPropertyKey_actor");
  v5 = [(EMMessageChangeAction *)self query];
  [v6 encodeObject:v5 forKey:@"EFPropertyKey_query"];
}

- (NSString)ef_publicDescription
{
  v3 = [(EMMessageChangeAction *)self objectIDs];
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 stringWithFormat:@"<%@: %p> objectIDs (%lu): %@", v6, self, objc_msgSend(v3, "count"), v3];

  return (NSString *)v7;
}

- (int64_t)origin
{
  return self->_origin;
}

- (void)setOrigin:(int64_t)a3
{
  self->_origin = a3;
}

- (int64_t)actor
{
  return self->_actor;
}

- (void)setActor:(int64_t)a3
{
  self->_actor = a3;
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
}

@end
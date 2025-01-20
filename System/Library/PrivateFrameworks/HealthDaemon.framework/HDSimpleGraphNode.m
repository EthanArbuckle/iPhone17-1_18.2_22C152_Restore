@interface HDSimpleGraphNode
- (HDSimpleGraphNode)init;
- (HDSimpleGraphNode)initWithRowID:(int64_t)a3 attributes:(id)a4 relationships:(id)a5;
- (HDSimpleGraphNode)initWithRowID:(int64_t)a3 attributes:(id)a4 relationships:(id)a5 version:(int64_t)a6 slots:(unint64_t)a7 deleted:(BOOL)a8;
- (NSArray)attributes;
- (NSArray)relationships;
- (id)description;
@end

@implementation HDSimpleGraphNode

- (HDSimpleGraphNode)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDSimpleGraphNode)initWithRowID:(int64_t)a3 attributes:(id)a4 relationships:(id)a5 version:(int64_t)a6 slots:(unint64_t)a7 deleted:(BOOL)a8
{
  BOOL v8 = a8;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HDSimpleGraphNode;
  v17 = [(HDSimpleGraphObject *)&v20 initWithRowID:a3 version:a6 slots:a7 deleted:v8];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_attributes, a4);
    objc_storeStrong((id *)&v18->_relationships, a5);
  }

  return v18;
}

- (HDSimpleGraphNode)initWithRowID:(int64_t)a3 attributes:(id)a4 relationships:(id)a5
{
  return [(HDSimpleGraphNode *)self initWithRowID:a3 attributes:a4 relationships:a5 version:0 slots:0 deleted:0];
}

- (id)description
{
  attributes = self->_attributes;
  if (attributes)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[NSArray count](attributes, "count"));
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = @"nil";
  }
  relationships = self->_relationships;
  if (relationships)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%ld", -[NSArray count](relationships, "count"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"nil";
  }
  v7 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)HDSimpleGraphNode;
  BOOL v8 = [(HDSimpleGraphObject *)&v11 description];
  v9 = [v7 stringWithFormat:@"<%@ attributes:%@, relationships:%@>", v8, v4, v6];

  return v9;
}

- (NSArray)attributes
{
  return self->_attributes;
}

- (NSArray)relationships
{
  return self->_relationships;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationships, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
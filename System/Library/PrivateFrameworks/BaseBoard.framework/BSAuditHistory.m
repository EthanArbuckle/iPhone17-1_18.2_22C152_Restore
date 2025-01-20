@interface BSAuditHistory
+ (BOOL)supportsSecureCoding;
- (BOOL)hasItems;
- (BSAuditHistory)init;
- (BSAuditHistory)initWithCoder:(id)a3;
- (BSAuditHistory)initWithXPCDictionary:(id)a3;
- (NSArray)items;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)addItem:(id)a3;
- (void)addItemWithFormat:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSAuditHistory

- (void)addItem:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableArray *)self->_items addObject:v4];
  }
}

- (BSAuditHistory)init
{
  v6.receiver = self;
  v6.super_class = (Class)BSAuditHistory;
  v2 = [(BSAuditHistory *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v2->_items;
    v2->_items = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

- (void)addItemWithFormat:(id)a3
{
  id v4 = a3;
  v5 = (void *)[[NSString alloc] initWithFormat:v4 arguments:&v8];
  items = self->_items;
  v7 = +[BSAuditHistoryItem itemWithString:v5];
  [(NSMutableArray *)items addObject:v7];
}

- (NSArray)items
{
  return (NSArray *)self->_items;
}

- (BOOL)hasItems
{
  return [(NSMutableArray *)self->_items count] != 0;
}

- (BSAuditHistory)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(BSAuditHistory *)self init];
  objc_super v6 = v5;
  if (v5)
  {
    items = v5->_items;
    uint64_t v8 = BSCreateDeserializedArrayFromXPCDictionaryWithKey(v4, "items", &__block_literal_global_27);
    [(NSMutableArray *)items addObjectsFromArray:v8];
  }
  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BSAuditHistory)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BSAuditHistory *)self init];
  if (v5)
  {
    if (qword_1EB21B380 != -1) {
      dispatch_once(&qword_1EB21B380, &__block_literal_global_29);
    }
    objc_super v6 = [v4 decodeObjectOfClasses:_MergedGlobals_33 forKey:@"items"];
    [(NSMutableArray *)v5->_items addObjectsFromArray:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[(NSMutableArray *)self->_items copy];
  [v5 encodeObject:v4 forKey:@"items"];
}

- (id)succinctDescription
{
  v2 = [(BSAuditHistory *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[NSMutableArray count](self->_items, "count"), @"itemCount");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BSAuditHistory *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(BSAuditHistory *)self succinctDescriptionBuilder];
  [v5 appendArraySection:self->_items withName:0 multilinePrefix:v4 skipIfEmpty:1];

  return v5;
}

@end
@interface MGOutstandingQuery
- (BOOL)requiresTopology;
- (MGOutstandingQuery)initWithPredicate:(id)a3;
- (NSPredicate)predicate;
- (NSUUID)identifier;
@end

@implementation MGOutstandingQuery

- (MGOutstandingQuery)initWithPredicate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MGOutstandingQuery;
  v5 = [(MGOutstandingQuery *)&v11 init];
  if (v5)
  {
    v6 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    identifier = v5->_identifier;
    v5->_identifier = v6;

    uint64_t v8 = [v4 copy];
    predicate = v5->_predicate;
    v5->_predicate = (NSPredicate *)v8;

    v5->_requiresTopology = ![(NSPredicate *)v5->_predicate mg_requiresCurrentDevice];
  }

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (BOOL)requiresTopology
{
  return self->_requiresTopology;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
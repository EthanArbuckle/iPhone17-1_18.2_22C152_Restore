@interface PDDatabaseWhereClause
- (void)setBindings:(id)a3;
- (void)setKeyPrefix:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setSqlString:(id)a3;
@end

@implementation PDDatabaseWhereClause

- (void)setPredicate:(id)a3
{
}

- (void)setBindings:(id)a3
{
}

- (void)setSqlString:(id)a3
{
}

- (void)setKeyPrefix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPrefix, 0);
  objc_storeStrong((id *)&self->_sqlString, 0);
  objc_storeStrong((id *)&self->_bindings, 0);

  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
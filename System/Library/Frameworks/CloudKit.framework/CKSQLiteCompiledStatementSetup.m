@interface CKSQLiteCompiledStatementSetup
@end

@implementation CKSQLiteCompiledStatementSetup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_orderBySQL, 0);
  objc_storeStrong((id *)&self->_wherePredicate, 0);

  objc_storeStrong((id *)&self->_sql, 0);
}

@end
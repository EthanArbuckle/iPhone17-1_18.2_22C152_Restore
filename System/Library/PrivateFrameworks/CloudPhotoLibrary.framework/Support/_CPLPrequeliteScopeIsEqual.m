@interface _CPLPrequeliteScopeIsEqual
+ (void)initialize;
- (NSData)sql;
- (_CPLPrequeliteScopeIsEqual)initWithIdentifier:(id)a3;
- (id)bindValuesToKeepAlive;
- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4;
@end

@implementation _CPLPrequeliteScopeIsEqual

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [objc_alloc((Class)NSData) initWithBytes:"scopeIdentifier = ?" length:19];
    uint64_t v3 = qword_1002DBE40;
    qword_1002DBE40 = (uint64_t)v2;
    _objc_release_x1(v2, v3);
  }
}

- (_CPLPrequeliteScopeIsEqual)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_CPLPrequeliteScopeIsEqual;
  v5 = [(_CPLPrequeliteScopeIsEqual *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = v6;
  }
  return v5;
}

- (NSData)sql
{
  return (NSData *)(id)qword_1002DBE40;
}

- (int)bindWithStatement:(sqlite3_stmt *)a3 startingAtIndex:(int)a4
{
  return 1;
}

- (id)bindValuesToKeepAlive
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

@end
@interface IDSFirewallDatabase
- (IDSFirewallDatabase)init;
- (IDSFirewallDatabase)initWithFilename:(id)a3;
- (NSString)filename;
- (void)deleteDatabase;
- (void)setFilename:(id)a3;
@end

@implementation IDSFirewallDatabase

- (IDSFirewallDatabase)init
{
  return [(IDSFirewallDatabase *)self initWithFilename:0];
}

- (IDSFirewallDatabase)initWithFilename:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IDSFirewallDatabase;
  v5 = [(IDSFirewallDatabase *)&v8 init];
  v6 = v5;
  if (v5) {
    [(IDSFirewallDatabase *)v5 setFilename:v4];
  }

  return v6;
}

- (void)deleteDatabase
{
  v3 = [(IDSFirewallDatabase *)self filename];

  if (v3)
  {
    id v4 = [(IDSFirewallDatabase *)self filename];
    CSDBSqliteDeleteDatabase();
  }
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
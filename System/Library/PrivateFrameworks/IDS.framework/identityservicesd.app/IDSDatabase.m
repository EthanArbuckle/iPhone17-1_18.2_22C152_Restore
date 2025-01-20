@interface IDSDatabase
- (IDSDatabase)init;
- (IDSDatabase)initWithDataProtectionClass:(unsigned int)a3;
- (IDSDatabase)initWithDataProtectionClass:(unsigned int)a3 filename:(id)a4;
- (NSString)filename;
- (unsigned)dataProtectionClass;
- (void)deleteDatabase;
- (void)ensureDatabaseIsInitialized;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setFilename:(id)a3;
@end

@implementation IDSDatabase

- (IDSDatabase)init
{
  return [(IDSDatabase *)self initWithDataProtectionClass:0];
}

- (IDSDatabase)initWithDataProtectionClass:(unsigned int)a3
{
  return [(IDSDatabase *)self initWithDataProtectionClass:*(void *)&a3 filename:0];
}

- (IDSDatabase)initWithDataProtectionClass:(unsigned int)a3 filename:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)IDSDatabase;
  v7 = [(IDSDatabase *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(IDSDatabase *)v7 setFilename:v6];
    [(IDSDatabase *)v8 setDataProtectionClass:v4];
  }

  return v8;
}

- (void)ensureDatabaseIsInitialized
{
  v3 = [(IDSDatabase *)self filename];

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1003E6168;
    v4[3] = &unk_100985030;
    v4[4] = self;
    v3 = objc_retainBlock(v4);
  }
  sub_1003E5794(1, self, v3);
}

- (void)deleteDatabase
{
  v3 = [(IDSDatabase *)self filename];

  if (v3)
  {
    id v4 = [(IDSDatabase *)self filename];
    CSDBSqliteDeleteDatabase();
  }
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
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
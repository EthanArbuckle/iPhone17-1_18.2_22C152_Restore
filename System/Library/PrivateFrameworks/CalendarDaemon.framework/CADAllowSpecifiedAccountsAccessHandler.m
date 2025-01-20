@interface CADAllowSpecifiedAccountsAccessHandler
- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5;
- (CADAllowSpecifiedAccountsAccessHandler)initWithAllowedSourceIdentifiers:(id)a3 databaseDataProvider:(id)a4;
- (NSSet)allowedSourceIdentifiers;
@end

@implementation CADAllowSpecifiedAccountsAccessHandler

- (CADAllowSpecifiedAccountsAccessHandler)initWithAllowedSourceIdentifiers:(id)a3 databaseDataProvider:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADAllowSpecifiedAccountsAccessHandler;
  v7 = [(CADAccountAccessHandler *)&v11 initWithDatabaseDataProvider:a4];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    allowedSourceIdentifiers = v7->_allowedSourceIdentifiers;
    v7->_allowedSourceIdentifiers = (NSSet *)v8;
  }
  return v7;
}

- (BOOL)isActionAllowed:(unint64_t)a3 forStore:(void *)a4 inDatabase:(CalDatabase *)a5
{
  v7 = self;
  uint64_t v8 = [(CADAccountAccessHandler *)self dataProvider];
  v9 = [v8 storeIDForStore:a4 inDatabase:a5];

  v10 = [(CADAllowSpecifiedAccountsAccessHandler *)v7 allowedSourceIdentifiers];
  LOBYTE(v7) = [v10 containsObject:v9];

  return (char)v7;
}

- (NSSet)allowedSourceIdentifiers
{
  return self->_allowedSourceIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_restrictedCalendarRowIDs, 0);
}

@end
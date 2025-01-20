@interface GaletteStoreSession
- (BOOL)needsThirdPartyPurchaseConfirmationWithBundleID:(id)a3;
- (GaletteStoreSession)initWithConnection:(id)a3;
- (SQLiteConnection)connection;
- (id)appForBundleID:(id)a3;
- (int64_t)modeForBundleID:(id)a3;
@end

@implementation GaletteStoreSession

- (GaletteStoreSession)initWithConnection:(id)a3
{
  v4 = (SQLiteConnection *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GaletteStoreSession;
  v5 = [(GaletteStoreSession *)&v8 init];
  connection = v5->_connection;
  v5->_connection = v4;

  return v5;
}

- (BOOL)needsThirdPartyPurchaseConfirmationWithBundleID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v5 = [(GaletteStoreSession *)self connection];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100373DDC;
  v8[3] = &unk_100523FE8;
  id v6 = v4;
  id v9 = v6;
  v10 = &v11;
  sub_100009834((uint64_t)v5, @"SELECT * FROM pending_galette_confirmation WHERE bundle_id = ?;", v8);

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

- (int64_t)modeForBundleID:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v4];
  id v6 = sub_1002FF548((uint64_t)GaletteAppEntity, self->_connection, v5);
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100373F50;
  v9[3] = &unk_100521428;
  v9[4] = &v10;
  [v6 enumerateMemoryEntitiesUsingBlock:v9];
  int64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (id)appForBundleID:(id)a3
{
  id v4 = a3;
  v5 = +[SQLiteComparisonPredicate predicateWithProperty:@"bundle_id" equalToValue:v4];
  id v6 = sub_1002FF548((uint64_t)GaletteAppEntity, self->_connection, v5);
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_100018308;
  char v14 = sub_100017D40;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100374118;
  v9[3] = &unk_100521428;
  v9[4] = &v10;
  [v6 enumerateMemoryEntitiesUsingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (SQLiteConnection)connection
{
  return (SQLiteConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end
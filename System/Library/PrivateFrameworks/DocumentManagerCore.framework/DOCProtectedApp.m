@interface DOCProtectedApp
- (BOOL)isEqual:(id)a3;
- (DOCProtectedApp)initWith:(id)a3 oids:(id)a4;
- (NSSet)oids;
- (NSString)appContainerBundleID;
- (id)description;
- (unint64_t)hash;
- (void)setAppContainerBundleID:(id)a3;
- (void)setOids:(id)a3;
@end

@implementation DOCProtectedApp

- (DOCProtectedApp)initWith:(id)a3 oids:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DOCProtectedApp;
  v8 = [(DOCProtectedApp *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(DOCProtectedApp *)v8 setAppContainerBundleID:v6];
    v10 = (void *)[v7 copy];
    [(DOCProtectedApp *)v9 setOids:v10];
  }
  return v9;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)DOCProtectedApp;
  v4 = [(DOCProtectedApp *)&v11 description];
  v5 = [(DOCProtectedApp *)self appContainerBundleID];
  id v6 = [(DOCProtectedApp *)self oids];
  id v7 = [v6 allObjects];
  v8 = [v7 componentsJoinedByString:@","];
  v9 = [v3 stringWithFormat:@"%@ appContainerBundleID=%@, oids=%@", v4, v5, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DOCProtectedApp *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    char v11 = 1;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v6 = [(DOCProtectedApp *)self appContainerBundleID];
  id v7 = [(DOCProtectedApp *)v5 appContainerBundleID];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v9 = [(DOCProtectedApp *)self oids];
    v10 = [(DOCProtectedApp *)v5 oids];
    char v11 = [v9 isEqualToSet:v10];
  }
  else
  {
LABEL_6:
    char v11 = 0;
  }
LABEL_8:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(DOCProtectedApp *)self appContainerBundleID];
  uint64_t v4 = [v3 hash];
  v5 = [(DOCProtectedApp *)self oids];
  unint64_t v6 = [v5 hash] + v4;

  return v6;
}

- (NSString)appContainerBundleID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAppContainerBundleID:(id)a3
{
}

- (NSSet)oids
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOids:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oids, 0);
  objc_storeStrong((id *)&self->_appContainerBundleID, 0);
}

@end
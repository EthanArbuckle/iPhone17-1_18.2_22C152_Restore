@interface CKCustomAppMenuItem
- (CKCustomAppMenuItem)initWithIdentifier:(id)a3 displayName:(id)a4;
- (NSString)__ck_displayName;
- (id)__ck_identifier;
- (id)__ck_imageForTraitCollection:(id)a3;
@end

@implementation CKCustomAppMenuItem

- (CKCustomAppMenuItem)initWithIdentifier:(id)a3 displayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKCustomAppMenuItem;
  v9 = [(CKCustomAppMenuItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->___ck_identifier, a3);
    objc_storeStrong((id *)&v10->___ck_displayName, a4);
  }

  return v10;
}

- (id)__ck_imageForTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [(CKCustomAppMenuItem *)self __ck_identifier];
  v6 = +[CKAppMenuDataSource imageForIdentifier:v5 traitCollection:v4];

  return v6;
}

- (NSString)__ck_displayName
{
  return self->___ck_displayName;
}

- (id)__ck_identifier
{
  return self->___ck_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->___ck_identifier, 0);

  objc_storeStrong((id *)&self->___ck_displayName, 0);
}

@end
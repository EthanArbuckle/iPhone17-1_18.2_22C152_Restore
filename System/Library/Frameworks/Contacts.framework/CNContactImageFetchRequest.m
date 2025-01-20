@interface CNContactImageFetchRequest
+ (id)predicateForImagesMatchingContactIdentifiers:(id)a3;
+ (id)recentImagesRequestForContactIdenfitiers:(id)a3;
- (CNContactImageFetchRequest)initWithContactIdentifiers:(id)a3;
- (NSArray)contactIdentifiers;
- (NSPersistentStoreRequest)persistentStoreRequest;
- (void)setContactIdentifiers:(id)a3;
@end

@implementation CNContactImageFetchRequest

+ (id)recentImagesRequestForContactIdenfitiers:(id)a3
{
  id v3 = a3;
  v4 = [[CNContactImageFetchRequest alloc] initWithContactIdentifiers:v3];

  return v4;
}

+ (id)predicateForImagesMatchingContactIdentifiers:(id)a3
{
  return (id)[MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"contactIdentifier", a3];
}

- (CNContactImageFetchRequest)initWithContactIdentifiers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNContactImageFetchRequest;
  v6 = [(CNContactImageFetchRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactIdentifiers, a3);
  }

  return v7;
}

- (NSPersistentStoreRequest)persistentStoreRequest
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CNContactImage"];
  [v3 setReturnsObjectsAsFaults:0];
  v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"lastUsedDate" ascending:0];
  v10[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v3 setSortDescriptors:v5];

  v6 = objc_opt_class();
  v7 = [(CNContactImageFetchRequest *)self contactIdentifiers];
  v8 = [v6 predicateForImagesMatchingContactIdentifiers:v7];
  [v3 setPredicate:v8];

  return (NSPersistentStoreRequest *)v3;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
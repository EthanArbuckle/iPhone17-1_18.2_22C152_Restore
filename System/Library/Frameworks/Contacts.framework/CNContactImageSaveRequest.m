@interface CNContactImageSaveRequest
+ (id)saveRequestToCreateImage:(id)a3 forContactIdentifier:(id)a4;
+ (id)saveRequestToCreateImages:(id)a3 forContactIdentifier:(id)a4;
+ (id)saveRequestToDeleteImageForIdentifier:(id)a3;
+ (id)saveRequestToDeleteImageForIdentifiers:(id)a3;
+ (id)saveRequestToDeleteImagesForContactIdentifiers:(id)a3;
- (CNContactImageSaveRequest)initWithContactImages:(id)a3 contactIdentifiers:(id)a4 attributeName:(id)a5 operationType:(int64_t)a6;
- (NSArray)contactIdentifiers;
- (NSArray)images;
- (NSPersistentStoreRequest)persistentStoreRequest;
- (NSString)attributeName;
- (id)createStoreRequest;
- (id)deleteStoreRequest;
- (int64_t)operationType;
- (void)setContactIdentifiers:(id)a3;
@end

@implementation CNContactImageSaveRequest

+ (id)saveRequestToCreateImage:(id)a3 forContactIdentifier:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [CNContactImageSaveRequest alloc];
  v13[0] = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  id v12 = v5;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];

  v10 = [(CNContactImageSaveRequest *)v7 initWithContactImages:v8 contactIdentifiers:v9 attributeName:@"contactIdentifier" operationType:0];

  return v10;
}

+ (id)saveRequestToCreateImages:(id)a3 forContactIdentifier:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [CNContactImageSaveRequest alloc];
  v11[0] = v5;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  v9 = [(CNContactImageSaveRequest *)v7 initWithContactImages:v6 contactIdentifiers:v8 attributeName:@"contactIdentifier" operationType:0];

  return v9;
}

+ (id)saveRequestToDeleteImagesForContactIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = [CNContactImageSaveRequest alloc];
  id v5 = [(CNContactImageSaveRequest *)v4 initWithContactImages:MEMORY[0x1E4F1CBF0] contactIdentifiers:v3 attributeName:@"contactIdentifier" operationType:2];

  return v5;
}

+ (id)saveRequestToDeleteImageForIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:&v8 count:1];
  id v6 = +[CNContactImageSaveRequest saveRequestToDeleteImageForIdentifiers:](CNContactImageSaveRequest, "saveRequestToDeleteImageForIdentifiers:", v5, v8, v9);

  return v6;
}

+ (id)saveRequestToDeleteImageForIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = [CNContactImageSaveRequest alloc];
  id v5 = [(CNContactImageSaveRequest *)v4 initWithContactImages:MEMORY[0x1E4F1CBF0] contactIdentifiers:v3 attributeName:@"identifier" operationType:2];

  return v5;
}

- (CNContactImageSaveRequest)initWithContactImages:(id)a3 contactIdentifiers:(id)a4 attributeName:(id)a5 operationType:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CNContactImageSaveRequest;
  v14 = [(CNContactImageSaveRequest *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_images, a3);
    objc_storeStrong((id *)&v15->_contactIdentifiers, a4);
    v15->_operationType = a6;
    objc_storeStrong((id *)&v15->_attributeName, a5);
  }

  return v15;
}

- (NSPersistentStoreRequest)persistentStoreRequest
{
  if ([(CNContactImageSaveRequest *)self operationType] == 2)
  {
    id v3 = [(CNContactImageSaveRequest *)self deleteStoreRequest];
  }
  else if ([(CNContactImageSaveRequest *)self operationType])
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(CNContactImageSaveRequest *)self createStoreRequest];
  }

  return (NSPersistentStoreRequest *)v3;
}

- (id)deleteStoreRequest
{
  id v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"CNContactImage"];
  id v4 = [(CNContactImageSaveRequest *)self contactIdentifiers];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28F60];
    id v6 = [(CNContactImageSaveRequest *)self attributeName];
    v7 = [(CNContactImageSaveRequest *)self contactIdentifiers];
    id v8 = [v5 predicateWithFormat:@"%K IN %@", v6, v7];
  }
  else
  {
    id v8 = 0;
  }
  [v3 setPredicate:v8];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v3];

  return v9;
}

- (id)createStoreRequest
{
  return 0;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void)setContactIdentifiers:(id)a3
{
}

- (NSArray)images
{
  return self->_images;
}

- (int64_t)operationType
{
  return self->_operationType;
}

- (NSString)attributeName
{
  return self->_attributeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeName, 0);
  objc_storeStrong((id *)&self->_images, 0);

  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

@end
@interface CRKASMConcreteCourse
+ (id)courseNameForClass:(id)a3;
+ (id)trustedUserIdentifierForTrustedUsers:(id)a3;
+ (id)trustedUsersFromPersons:(id)a3 environment:(id)a4;
+ (id)usersFromPersons:(id)a3 environment:(id)a4;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (CRKASMCertificateVendor)certificateVendor;
- (CRKASMConcreteCourse)initWithBackingClass:(id)a3 location:(id)a4 persons:(id)a5 trustedPersons:(id)a6 identityVendor:(id)a7 manageableLocationIDs:(id)a8 environment:(id)a9;
- (CRKASMIdentityVendor)identityVendor;
- (CRKASMLocation)location;
- (CRKIdentity)identity;
- (DMFControlGroupIdentifier)identifier;
- (NSArray)trustedUsers;
- (NSArray)users;
- (NSDate)creationDate;
- (NSSet)allTrustedUserCertificates;
- (NSSet)trustedUserIdentifiers;
- (NSString)backingClassObjectID;
- (NSString)name;
- (id)description;
- (unint64_t)color;
- (unint64_t)hash;
- (unint64_t)mascot;
@end

@implementation CRKASMConcreteCourse

- (CRKASMConcreteCourse)initWithBackingClass:(id)a3 location:(id)a4 persons:(id)a5 trustedPersons:(id)a6 identityVendor:(id)a7 manageableLocationIDs:(id)a8 environment:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v44 = a7;
  id v19 = a8;
  id v20 = a9;
  v45.receiver = self;
  v45.super_class = (Class)CRKASMConcreteCourse;
  v21 = [(CRKASMConcreteCourse *)&v45 init];
  if (v21)
  {
    v22 = [(id)objc_opt_class() trustedUsersFromPersons:v18 environment:v20];
    v23 = [v15 objectID];
    uint64_t v24 = [v23 copy];
    backingClassObjectID = v21->_backingClassObjectID;
    v21->_backingClassObjectID = (NSString *)v24;

    objc_storeStrong((id *)&v21->_identityVendor, a7);
    uint64_t v26 = [v20 certificateVendor];
    certificateVendor = v21->_certificateVendor;
    v21->_certificateVendor = (CRKASMCertificateVendor *)v26;

    v28 = (void *)MEMORY[0x263F39D20];
    v29 = [v15 objectID];
    uint64_t v30 = objc_msgSend(v28, "crk_identifierWithOpaqueString:", v29);
    identifier = v21->_identifier;
    v21->_identifier = (DMFControlGroupIdentifier *)v30;

    v21->_mascot = +[CRKClassKitColorAndMascotUtility mascotForClass:v15];
    v21->_color = +[CRKClassKitColorAndMascotUtility colorForClass:v15];
    objc_storeStrong((id *)&v21->_trustedUsers, v22);
    v32 = [[CRKASMConcreteLocation alloc] initWithBackingLocation:v16];
    location = v21->_location;
    v21->_location = (CRKASMLocation *)v32;

    uint64_t v34 = [(id)objc_opt_class() courseNameForClass:v15];
    name = v21->_name;
    v21->_name = (NSString *)v34;

    uint64_t v36 = [(id)objc_opt_class() usersFromPersons:v17 environment:v20];
    users = v21->_users;
    v21->_users = (NSArray *)v36;

    uint64_t v38 = [(id)objc_opt_class() trustedUserIdentifierForTrustedUsers:v22];
    trustedUserIdentifiers = v21->_trustedUserIdentifiers;
    v21->_trustedUserIdentifiers = (NSSet *)v38;

    if ([v15 isEditable])
    {
      v40 = [v16 objectID];
      v21->_editable = [v19 containsObject:v40];
    }
    else
    {
      v21->_editable = 0;
    }
    uint64_t v41 = [v15 dateCreated];
    creationDate = v21->_creationDate;
    v21->_creationDate = (NSDate *)v41;
  }
  return v21;
}

- (CRKIdentity)identity
{
  v2 = [(CRKASMConcreteCourse *)self identityVendor];
  v3 = [v2 identity];

  return (CRKIdentity *)v3;
}

- (NSSet)allTrustedUserCertificates
{
  v3 = [(CRKASMConcreteCourse *)self certificateVendor];
  v4 = [(CRKASMConcreteCourse *)self trustedUserIdentifiers];
  v5 = [v3 certificatesForUserIdentifiers:v4];

  return (NSSet *)v5;
}

- (unint64_t)hash
{
  v3 = [(CRKASMConcreteCourse *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(CRKASMConcreteCourse *)self name];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = [(CRKASMConcreteCourse *)self mascot];
  unint64_t v8 = v6 ^ v7 ^ [(CRKASMConcreteCourse *)self color];
  uint64_t v9 = [(CRKASMConcreteCourse *)self isEditable];
  v10 = [(CRKASMConcreteCourse *)self users];
  uint64_t v11 = v8 ^ v9 ^ [v10 hash];
  v12 = [(CRKASMConcreteCourse *)self trustedUsers];
  uint64_t v13 = [v12 hash];
  v14 = [(CRKASMConcreteCourse *)self identityVendor];
  uint64_t v15 = v13 ^ [v14 hash];
  id v16 = [(CRKASMConcreteCourse *)self certificateVendor];
  uint64_t v17 = v15 ^ [v16 hash];
  id v18 = [(CRKASMConcreteCourse *)self location];
  uint64_t v19 = v11 ^ v17 ^ [v18 hash];
  id v20 = [(CRKASMConcreteCourse *)self creationDate];
  unint64_t v21 = v19 ^ [v20 hash];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(@"identifier, name, mascot, color, editable, users, trustedUsers, identityVendor, certificateVendor, location, creationDate", "componentsSeparatedByString:", @",");
  uint64_t v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_3;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  unint64_t v8 = self;
  uint64_t v9 = (CRKASMConcreteCourse *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKASMConcreteCourse *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v17 = v9;
          uint64_t v18 = [(CRKASMConcreteCourse *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKASMConcreteCourse *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)description
{
  uint64_t v17 = NSString;
  uint64_t v16 = objc_opt_class();
  uint64_t v18 = [(CRKASMConcreteCourse *)self identifier];
  v3 = [v18 stringValue];
  id v4 = [(CRKASMConcreteCourse *)self name];
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKASMConcreteCourse mascot](self, "mascot"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CRKASMConcreteCourse color](self, "color"));
  BOOL v7 = [(CRKASMConcreteCourse *)self isEditable];
  unint64_t v8 = @"NO";
  if (v7) {
    unint64_t v8 = @"YES";
  }
  uint64_t v9 = v8;
  id v10 = [(CRKASMConcreteCourse *)self users];
  id v11 = [(CRKASMConcreteCourse *)self trustedUsers];
  uint64_t v12 = [(CRKASMConcreteCourse *)self location];
  uint64_t v13 = [(CRKASMConcreteCourse *)self creationDate];
  uint64_t v14 = [v17 stringWithFormat:@"<%@: %p { identifier = %@, name = %@, mascot = %@, color = %@, editable = %@, users = %@, trustedUsers = %@, location = %@, creationDate = %@ }>", v16, self, v3, v4, v5, v6, v9, v10, v11, v12, v13];

  return v14;
}

+ (id)trustedUserIdentifierForTrustedUsers:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = objc_msgSend(a3, "crk_mapUsingBlock:", &__block_literal_global_20);
  v5 = [v3 setWithArray:v4];

  return v5;
}

uint64_t __61__CRKASMConcreteCourse_trustedUserIdentifierForTrustedUsers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (id)courseNameForClass:(id)a3
{
  id v3 = a3;
  id v4 = [v3 displayName];
  v5 = (void *)[v4 copy];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    unint64_t v8 = [v3 className];
    id v7 = (id)[v8 copy];
  }

  return v7;
}

+ (id)usersFromPersons:(id)a3 environment:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__CRKASMConcreteCourse_usersFromPersons_environment___block_invoke;
  v9[3] = &unk_2646F3DB0;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "crk_mapUsingBlock:", v9);

  return v7;
}

id __53__CRKASMConcreteCourse_usersFromPersons_environment___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userFactory];
  id v5 = [v4 userForPerson:v3];

  return v5;
}

+ (id)trustedUsersFromPersons:(id)a3 environment:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__CRKASMConcreteCourse_trustedUsersFromPersons_environment___block_invoke;
  v9[3] = &unk_2646F3DD8;
  id v10 = v5;
  id v6 = v5;
  id v7 = objc_msgSend(a3, "crk_mapUsingBlock:", v9);

  return v7;
}

id __60__CRKASMConcreteCourse_trustedUsersFromPersons_environment___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userFactory];
  id v5 = [v4 trustedUserForPerson:v3];

  return v5;
}

- (unint64_t)color
{
  return self->_color;
}

- (BOOL)isEditable
{
  return self->_editable;
}

- (DMFControlGroupIdentifier)identifier
{
  return self->_identifier;
}

- (CRKASMLocation)location
{
  return self->_location;
}

- (unint64_t)mascot
{
  return self->_mascot;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)trustedUsers
{
  return self->_trustedUsers;
}

- (NSArray)users
{
  return self->_users;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)backingClassObjectID
{
  return self->_backingClassObjectID;
}

- (CRKASMIdentityVendor)identityVendor
{
  return self->_identityVendor;
}

- (CRKASMCertificateVendor)certificateVendor
{
  return self->_certificateVendor;
}

- (NSSet)trustedUserIdentifiers
{
  return self->_trustedUserIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_certificateVendor, 0);
  objc_storeStrong((id *)&self->_identityVendor, 0);
  objc_storeStrong((id *)&self->_backingClassObjectID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_users, 0);
  objc_storeStrong((id *)&self->_trustedUsers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
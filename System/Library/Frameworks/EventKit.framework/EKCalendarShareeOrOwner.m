@interface EKCalendarShareeOrOwner
+ (id)ownerForEKCalendar:(id)a3;
+ (id)shareeWithEKSharee:(id)a3 forCalendar:(id)a4;
- (BOOL)isCurrentUserForScheduling;
- (BOOL)isCurrentUserForSharing;
- (BOOL)isEqual:(id)a3;
- (NSString)UUID;
- (NSString)emailAddress;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)name;
- (NSString)phoneNumber;
- (NSURL)URL;
- (unint64_t)hash;
- (void)setEmailAddress:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setName:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation EKCalendarShareeOrOwner

+ (id)shareeWithEKSharee:(id)a3 forCalendar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___EKCalendarShareeOrOwner;
  uint64_t v8 = objc_msgSend(objc_msgSendSuper2(&v21, sel_alloc), "init");
  v9 = [v6 name];
  [(id)v8 setName:v9];

  v10 = [v6 emailAddress];
  [(id)v8 setEmailAddress:v10];

  v11 = [v6 phoneNumber];
  [(id)v8 setPhoneNumber:v11];

  v12 = [v6 firstName];
  [(id)v8 setFirstName:v12];

  v13 = [v6 lastName];
  [(id)v8 setLastName:v13];

  v14 = [v6 URL];
  [(id)v8 setURL:v14];

  uint64_t v15 = [v6 UUID];
  v16 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v15;

  if ([v7 sharingStatus])
  {
    v17 = [v7 source];
    v18 = [v17 ownerAddresses];
    v19 = [v6 address];
    *(unsigned char *)(v8 + 8) = [v18 containsObject:v19];
  }
  else
  {
    *(unsigned char *)(v8 + 8) = 0;
  }

  return (id)v8;
}

+ (id)ownerForEKCalendar:(id)a3
{
  id v4 = a3;
  if ([v4 sharingStatus])
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___EKCalendarShareeOrOwner;
    uint64_t v5 = objc_msgSend(objc_msgSendSuper2(&v15, sel_alloc), "init");
    id v6 = [v4 ownerIdentityDisplayName];
    [(id)v5 setName:v6];

    id v7 = [v4 ownerIdentityEmail];
    [(id)v5 setEmailAddress:v7];

    uint64_t v8 = [v4 ownerIdentityPhoneNumber];
    [(id)v5 setPhoneNumber:v8];

    v9 = [v4 ownerIdentityFirstName];
    [(id)v5 setFirstName:v9];

    v10 = [v4 ownerIdentityLastName];
    [(id)v5 setLastName:v10];

    v11 = [v4 ownerIdentityAddress];
    [(id)v5 setURL:v11];

    uint64_t v12 = [v4 uniqueIdentifier];
    v13 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v12;

    *(unsigned char *)(v5 + 8) = [v4 sharingStatus] == 1;
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (id)v5;
}

- (BOOL)isCurrentUserForScheduling
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EKCalendarShareeOrOwner *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    char v8 = 1;
    goto LABEL_7;
  }
  if ([(EKCalendarShareeOrOwner *)v4 conformsToProtocol:&unk_1EF973DF0])
  {
    id v6 = [(EKCalendarShareeOrOwner *)v5 UUID];
    id v7 = [(EKCalendarShareeOrOwner *)self UUID];
    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
LABEL_5:
    char v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(EKCalendarShareeOrOwner *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isCurrentUserForSharing
{
  return self->_isCurrentUserForSharing;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
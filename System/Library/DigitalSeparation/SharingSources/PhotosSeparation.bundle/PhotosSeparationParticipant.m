@interface PhotosSeparationParticipant
- (BOOL)isOwner;
- (NSPersonNameComponents)nameComponents;
- (NSString)debugDescription;
- (NSString)emailAddress;
- (NSString)phoneNumber;
- (NSString)unifiedContactIdentifier;
- (NSString)uuid;
- (PhotosSeparationParticipant)initWithRole:(int64_t)a3 permission:(int64_t)a4 emailAddress:(id)a5 phoneNumber:(id)a6;
- (id)representedObject;
- (int64_t)permission;
- (int64_t)role;
@end

@implementation PhotosSeparationParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_emailAddress, 0);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (int64_t)permission
{
  return self->_permission;
}

- (int64_t)role
{
  return self->_role;
}

- (NSString)debugDescription
{
  v3 = [(PhotosSeparationParticipant *)self emailAddress];
  v4 = [(PhotosSeparationParticipant *)self phoneNumber];
  unsigned int v5 = [(PhotosSeparationParticipant *)self isOwner];
  CFStringRef v6 = @"NO";
  if (v5) {
    CFStringRef v6 = @"YES";
  }
  v7 = +[NSString stringWithFormat:@"email: %@, phone: %@, owner: %@", v3, v4, v6];

  return (NSString *)v7;
}

- (NSPersonNameComponents)nameComponents
{
  return 0;
}

- (NSString)unifiedContactIdentifier
{
  return 0;
}

- (id)representedObject
{
  return 0;
}

- (BOOL)isOwner
{
  return (char *)[(PhotosSeparationParticipant *)self role] == (char *)&dword_0 + 1;
}

- (PhotosSeparationParticipant)initWithRole:(int64_t)a3 permission:(int64_t)a4 emailAddress:(id)a5 phoneNumber:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PhotosSeparationParticipant;
  v13 = [(PhotosSeparationParticipant *)&v19 init];
  v14 = v13;
  if (v13)
  {
    v13->_role = a3;
    v13->_permission = a4;
    objc_storeStrong((id *)&v13->_emailAddress, a5);
    objc_storeStrong((id *)&v14->_phoneNumber, a6);
    v15 = +[NSUUID UUID];
    uint64_t v16 = [v15 UUIDString];
    uuid = v14->_uuid;
    v14->_uuid = (NSString *)v16;
  }
  return v14;
}

@end
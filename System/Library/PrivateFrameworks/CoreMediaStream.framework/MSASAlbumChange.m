@interface MSASAlbumChange
- (BOOL)wasDeleted;
- (MSASInvitation)invitation;
- (NSString)GUID;
- (NSString)URLString;
- (NSString)name;
- (NSString)ownerEmail;
- (NSString)ownerFirstName;
- (NSString)ownerFullName;
- (NSString)ownerLastName;
- (NSString)ownerPersonID;
- (id)description;
- (void)setGUID:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setName:(id)a3;
- (void)setOwnerEmail:(id)a3;
- (void)setOwnerFirstName:(id)a3;
- (void)setOwnerFullName:(id)a3;
- (void)setOwnerLastName:(id)a3;
- (void)setOwnerPersonID:(id)a3;
- (void)setURLString:(id)a3;
- (void)setWasDeleted:(BOOL)a3;
@end

@implementation MSASAlbumChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_ownerLastName, 0);
  objc_storeStrong((id *)&self->_ownerFirstName, 0);
  objc_storeStrong((id *)&self->_ownerFullName, 0);
  objc_storeStrong((id *)&self->_ownerPersonID, 0);
  objc_storeStrong((id *)&self->_ownerEmail, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setInvitation:(id)a3
{
}

- (MSASInvitation)invitation
{
  return self->_invitation;
}

- (void)setURLString:(id)a3
{
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setOwnerLastName:(id)a3
{
}

- (NSString)ownerLastName
{
  return self->_ownerLastName;
}

- (void)setOwnerFirstName:(id)a3
{
}

- (NSString)ownerFirstName
{
  return self->_ownerFirstName;
}

- (void)setOwnerFullName:(id)a3
{
}

- (void)setOwnerPersonID:(id)a3
{
}

- (NSString)ownerPersonID
{
  return self->_ownerPersonID;
}

- (void)setOwnerEmail:(id)a3
{
}

- (NSString)ownerEmail
{
  return self->_ownerEmail;
}

- (void)setGUID:(id)a3
{
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSString)ownerFullName
{
  ownerFullName = self->_ownerFullName;
  if (ownerFullName)
  {
    v3 = ownerFullName;
  }
  else
  {
    v3 = [NSString stringWithFormat:@"%@ %@", self->_ownerFirstName, self->_ownerLastName];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)MSASAlbumChange;
  v4 = [(MSASAlbumChange *)&v14 description];
  v5 = [(MSASAlbumChange *)self GUID];
  v6 = [(MSASAlbumChange *)self name];
  v7 = [(MSASAlbumChange *)self ownerFullName];
  v8 = [(MSASAlbumChange *)self ownerEmail];
  v9 = [(MSASAlbumChange *)self ownerPersonID];
  v10 = objc_msgSend(NSString, "MSStringWithBool:", -[MSASAlbumChange wasDeleted](self, "wasDeleted"));
  v11 = [(MSASAlbumChange *)self invitation];
  v12 = [v3 stringWithFormat:@"%@: GUID : %@, name: %@, owner: %@ (%@ %@) was deleted: %@, share: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return v12;
}

@end
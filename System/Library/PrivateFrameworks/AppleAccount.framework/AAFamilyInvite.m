@interface AAFamilyInvite
- (BOOL)isChildTransferInvite;
- (BOOL)isEqual:(id)a3;
- (NSNumber)organizerDSID;
- (NSNumber)recepientDSID;
- (NSString)childFirstName;
- (NSString)childLastName;
- (NSString)code;
- (NSString)organizerEmail;
- (NSString)organizerFirstName;
- (NSString)organizerLastName;
- (unint64_t)hash;
- (void)setChildFirstName:(id)a3;
- (void)setChildLastName:(id)a3;
- (void)setCode:(id)a3;
- (void)setIsChildTransferInvite:(BOOL)a3;
- (void)setOrganizerDSID:(id)a3;
- (void)setOrganizerEmail:(id)a3;
- (void)setOrganizerFirstName:(id)a3;
- (void)setOrganizerLastName:(id)a3;
- (void)setRecepientDSID:(id)a3;
@end

@implementation AAFamilyInvite

- (BOOL)isEqual:(id)a3
{
  v4 = (AAFamilyInvite *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(AAFamilyInvite *)v4 code];
      char v6 = [v5 isEqualToString:self->_code];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_code hash];
}

- (NSString)code
{
  return self->_code;
}

- (void)setCode:(id)a3
{
}

- (NSString)organizerFirstName
{
  return self->_organizerFirstName;
}

- (void)setOrganizerFirstName:(id)a3
{
}

- (NSString)organizerLastName
{
  return self->_organizerLastName;
}

- (void)setOrganizerLastName:(id)a3
{
}

- (NSString)organizerEmail
{
  return self->_organizerEmail;
}

- (void)setOrganizerEmail:(id)a3
{
}

- (NSNumber)organizerDSID
{
  return self->_organizerDSID;
}

- (void)setOrganizerDSID:(id)a3
{
}

- (NSNumber)recepientDSID
{
  return self->_recepientDSID;
}

- (void)setRecepientDSID:(id)a3
{
}

- (BOOL)isChildTransferInvite
{
  return self->_isChildTransferInvite;
}

- (void)setIsChildTransferInvite:(BOOL)a3
{
  self->_isChildTransferInvite = a3;
}

- (NSString)childFirstName
{
  return self->_childFirstName;
}

- (void)setChildFirstName:(id)a3
{
}

- (NSString)childLastName
{
  return self->_childLastName;
}

- (void)setChildLastName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childLastName, 0);
  objc_storeStrong((id *)&self->_childFirstName, 0);
  objc_storeStrong((id *)&self->_recepientDSID, 0);
  objc_storeStrong((id *)&self->_organizerDSID, 0);
  objc_storeStrong((id *)&self->_organizerEmail, 0);
  objc_storeStrong((id *)&self->_organizerLastName, 0);
  objc_storeStrong((id *)&self->_organizerFirstName, 0);

  objc_storeStrong((id *)&self->_code, 0);
}

@end
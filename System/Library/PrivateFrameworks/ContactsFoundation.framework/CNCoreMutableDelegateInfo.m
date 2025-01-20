@interface CNCoreMutableDelegateInfo
- (BOOL)isMe;
- (NSNumber)dsid;
- (NSPersonNameComponents)nameComponents;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)principalPath;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setDsid:(id)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setNameComponents:(id)a3;
- (void)setPrincipalPath:(id)a3;
@end

@implementation CNCoreMutableDelegateInfo

- (NSNumber)dsid
{
  return self->super._dsid;
}

- (void)setDsid:(id)a3
{
  self->super._dsid = (NSNumber *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)altDSID
{
  return self->super._altDSID;
}

- (void)setAltDSID:(id)a3
{
  self->super._altDSID = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)appleID
{
  return self->super._appleID;
}

- (void)setAppleID:(id)a3
{
  self->super._appleID = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSString)principalPath
{
  return self->super._principalPath;
}

- (void)setPrincipalPath:(id)a3
{
  self->super._principalPath = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (NSPersonNameComponents)nameComponents
{
  return self->super._nameComponents;
}

- (void)setNameComponents:(id)a3
{
  self->super._nameComponents = (NSPersonNameComponents *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)isMe
{
  return self->super._isMe;
}

- (void)setIsMe:(BOOL)a3
{
  self->super._isMe = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CNCoreDelegateInfo alloc];
  dsid = self->super._dsid;
  altDSID = self->super._altDSID;
  appleID = self->super._appleID;
  principalPath = self->super._principalPath;
  nameComponents = self->super._nameComponents;
  BOOL isMe = self->super._isMe;

  return [(CNCoreDelegateInfo *)v4 initWithDSID:dsid altDSID:altDSID appleID:appleID principalPath:principalPath nameComponents:nameComponents isMe:isMe];
}

@end
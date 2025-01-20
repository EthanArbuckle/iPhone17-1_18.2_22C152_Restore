@interface HotspotFamilyMember
- (HotspotFamilyMember)init;
- (HotspotFamilyMember)initWithAltDSID:(id)a3 displayName:(id)a4 shareOption:(int)a5;
- (NSString)altDSID;
- (NSString)displayName;
- (int)shareOption;
- (void)setAltDSID:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setShareOption:(int)a3;
@end

@implementation HotspotFamilyMember

- (HotspotFamilyMember)init
{
  v5.receiver = self;
  v5.super_class = (Class)HotspotFamilyMember;
  v2 = [(HotspotFamilyMember *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(HotspotFamilyMember *)v2 setAltDSID:&stru_26F3105F0];
    [(HotspotFamilyMember *)v3 setDisplayName:&stru_26F3105F0];
    [(HotspotFamilyMember *)v3 setShareOption:1];
  }
  return v3;
}

- (HotspotFamilyMember)initWithAltDSID:(id)a3 displayName:(id)a4 shareOption:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HotspotFamilyMember;
  v10 = [(HotspotFamilyMember *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(HotspotFamilyMember *)v10 setAltDSID:v8];
    [(HotspotFamilyMember *)v11 setDisplayName:v9];
    [(HotspotFamilyMember *)v11 setShareOption:v5];
  }

  return v11;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (int)shareOption
{
  return self->_shareOption;
}

- (void)setShareOption:(int)a3
{
  self->_shareOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
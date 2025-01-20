@interface BPSTinkerFamilyDetails
- (FAFamilyMember)organizerParentFamilyMember;
- (FAFamilyMember)pairingParentFamilyMember;
- (FAFamilyMember)tinkerFamilyMember;
- (void)setOrganizerParentFamilyMember:(id)a3;
- (void)setPairingParentFamilyMember:(id)a3;
- (void)setTinkerFamilyMember:(id)a3;
@end

@implementation BPSTinkerFamilyDetails

- (FAFamilyMember)tinkerFamilyMember
{
  return self->_tinkerFamilyMember;
}

- (void)setTinkerFamilyMember:(id)a3
{
}

- (FAFamilyMember)pairingParentFamilyMember
{
  return self->_pairingParentFamilyMember;
}

- (void)setPairingParentFamilyMember:(id)a3
{
}

- (FAFamilyMember)organizerParentFamilyMember
{
  return self->_organizerParentFamilyMember;
}

- (void)setOrganizerParentFamilyMember:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_pairingParentFamilyMember, 0);
  objc_storeStrong((id *)&self->_tinkerFamilyMember, 0);
}

@end
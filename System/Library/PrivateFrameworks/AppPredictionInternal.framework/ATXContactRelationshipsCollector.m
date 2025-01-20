@interface ATXContactRelationshipsCollector
- (ATXContactRelationshipsCollector)initWithContactStore:(id)a3;
- (NSSet)cnContactIdsOfEmergencyContacts;
- (NSSet)cnContactIdsOfFavoriteContacts;
- (NSSet)cnContactIdsOfICloudFamilyMembers;
- (NSSet)cnContactIdsOfPinnedChatsInMessage;
- (NSSet)vipContactEmailAddresses;
@end

@implementation ATXContactRelationshipsCollector

- (ATXContactRelationshipsCollector)initWithContactStore:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXContactRelationshipsCollector;
  v5 = [(ATXContactRelationshipsCollector *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F4AF60] cnContactIdsOfEmergencyContacts];
    cnContactIdsOfEmergencyContacts = v5->_cnContactIdsOfEmergencyContacts;
    v5->_cnContactIdsOfEmergencyContacts = (NSSet *)v6;

    uint64_t v8 = [MEMORY[0x1E4F4AF60] vipContactEmailAddresses];
    vipContactEmailAddresses = v5->_vipContactEmailAddresses;
    v5->_vipContactEmailAddresses = (NSSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F4AF60] cnContactIdsOfICloudFamilyMembers];
    cnContactIdsOfICloudFamilyMembers = v5->_cnContactIdsOfICloudFamilyMembers;
    v5->_cnContactIdsOfICloudFamilyMembers = (NSSet *)v10;

    uint64_t v12 = [MEMORY[0x1E4F4AF60] cnContactIdsOfFavoriteContactsWithContactStore:v4];
    cnContactIdsOfFavoriteContacts = v5->_cnContactIdsOfFavoriteContacts;
    v5->_cnContactIdsOfFavoriteContacts = (NSSet *)v12;

    uint64_t v14 = objc_opt_new();
    cnContactIdsOfPinnedChatsInMessage = v5->_cnContactIdsOfPinnedChatsInMessage;
    v5->_cnContactIdsOfPinnedChatsInMessage = (NSSet *)v14;
  }
  return v5;
}

- (NSSet)cnContactIdsOfEmergencyContacts
{
  return self->_cnContactIdsOfEmergencyContacts;
}

- (NSSet)vipContactEmailAddresses
{
  return self->_vipContactEmailAddresses;
}

- (NSSet)cnContactIdsOfICloudFamilyMembers
{
  return self->_cnContactIdsOfICloudFamilyMembers;
}

- (NSSet)cnContactIdsOfFavoriteContacts
{
  return self->_cnContactIdsOfFavoriteContacts;
}

- (NSSet)cnContactIdsOfPinnedChatsInMessage
{
  return self->_cnContactIdsOfPinnedChatsInMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnContactIdsOfPinnedChatsInMessage, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfFavoriteContacts, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfICloudFamilyMembers, 0);
  objc_storeStrong((id *)&self->_vipContactEmailAddresses, 0);
  objc_storeStrong((id *)&self->_cnContactIdsOfEmergencyContacts, 0);
}

@end
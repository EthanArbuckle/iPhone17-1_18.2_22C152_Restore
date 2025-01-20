@interface GKSuggestedFriend
- (BOOL)supportsFriendingViaPush;
- (CNContact)contact;
- (GKSuggestedFriend)initWithContact:(id)a3 contactAssociationID:(id)a4 supportsFriendingViaPush:(BOOL)a5;
- (NSString)contactAssociationID;
@end

@implementation GKSuggestedFriend

- (GKSuggestedFriend)initWithContact:(id)a3 contactAssociationID:(id)a4 supportsFriendingViaPush:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKSuggestedFriend;
  v11 = [(GKSuggestedFriend *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contact, a3);
    objc_storeStrong((id *)&v12->_contactAssociationID, a4);
    v12->_supportsFriendingViaPush = a5;
  }

  return v12;
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSString)contactAssociationID
{
  return self->_contactAssociationID;
}

- (BOOL)supportsFriendingViaPush
{
  return self->_supportsFriendingViaPush;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactAssociationID, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end
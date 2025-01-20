@interface EMSectionedMessageListObjectConverter
+ (id)itemIDForItemID:(id)a3 inSection:(id)a4;
+ (id)messageListItemForMessageListItem:(id)a3 inSection:(id)a4;
+ (id)objectIDForObjectID:(id)a3 inSection:(id)a4;
@end

@implementation EMSectionedMessageListObjectConverter

+ (id)itemIDForItemID:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[_EMSectionedMessageListItemID alloc] initWithItemID:v5 sectionID:v6];

  return v7;
}

+ (id)objectIDForObjectID:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[_EMSectionedObjectID alloc] initWithObjectID:v5 sectionID:v6];

  return v7;
}

+ (id)messageListItemForMessageListItem:(id)a3 inSection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[_EMSectionedMessageListItem alloc] initWithMessageListItem:v5 sectionID:v6];

  return v7;
}

@end
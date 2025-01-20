@interface MUIResultSuggestion
- (EMMessageList)messageList;
- (EMMessageObjectID)objectID;
- (MUIResultSuggestion)initWithObjectID:(id)a3 messageList:(id)a4 authors:(id)a5 authorEmailAddresses:(id)a6;
- (NSArray)authorEmailAddresses;
- (NSArray)authors;
@end

@implementation MUIResultSuggestion

- (MUIResultSuggestion)initWithObjectID:(id)a3 messageList:(id)a4 authors:(id)a5 authorEmailAddresses:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MUIResultSuggestion;
  v15 = [(MUIResultSuggestion *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_authors, a5);
    objc_storeStrong((id *)&v16->_authorEmailAddresses, a6);
    objc_storeStrong((id *)&v16->_objectID, a3);
    objc_storeStrong((id *)&v16->_messageList, a4);
  }

  return v16;
}

- (NSArray)authors
{
  return self->_authors;
}

- (NSArray)authorEmailAddresses
{
  return self->_authorEmailAddresses;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (EMMessageObjectID)objectID
{
  return self->_objectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_authorEmailAddresses, 0);
  objc_storeStrong((id *)&self->_authors, 0);
}

@end
@interface IMSPISuggestionsObject
- (IMSPISuggestionsObject)initWithChatGuid:(id)a3 displayName:(id)a4 participants:(id)a5;
- (NSArray)participants;
- (NSString)chatGUID;
- (NSString)displayName;
- (id)description;
@end

@implementation IMSPISuggestionsObject

- (IMSPISuggestionsObject)initWithChatGuid:(id)a3 displayName:(id)a4 participants:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IMSPISuggestionsObject;
  v12 = [(IMSPISuggestionsObject *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_chatGUID, a3);
    objc_storeStrong((id *)&v13->_displayName, a4);
    objc_storeStrong((id *)&v13->_participants, a5);
  }

  return v13;
}

- (id)description
{
  v5 = NSString;
  v6 = objc_msgSend_chatGUID(self, a2, v2, v3);
  id v10 = objc_msgSend_displayName(self, v7, v8, v9);
  v14 = objc_msgSend_participants(self, v11, v12, v13);
  v17 = objc_msgSend_stringWithFormat_(v5, v15, @"IMSPISuggestionsObject: %p [Chat guid: %@ DisplayName: %@ Participants: %@]", v16, self, v6, v10, v14);

  return v17;
}

- (NSString)chatGUID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)participants
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_chatGUID, 0);
}

@end
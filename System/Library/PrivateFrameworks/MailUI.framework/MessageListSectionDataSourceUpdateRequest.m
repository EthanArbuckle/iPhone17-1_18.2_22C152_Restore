@interface MessageListSectionDataSourceUpdateRequest
- (BOOL)shouldClearSnapshot;
- (EMMessageList)messageList;
- (MessageListSectionDataSourceUpdateRequest)initWithSection:(id)a3;
- (MessageListSectionDataSourceUpdateRequest)initWithSection:(id)a3 messageList:(id)a4;
- (MessageListSectionDataSourceUpdateRequest)initWithSection:(id)a3 messageList:(id)a4 shouldClearSnapshot:(BOOL)a5;
- (NSString)ef_publicDescription;
- (NSString)section;
@end

@implementation MessageListSectionDataSourceUpdateRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageList, 0);
  objc_storeStrong((id *)&self->_section, 0);
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  v4 = [(MessageListSectionDataSourceUpdateRequest *)self section];
  v5 = [(MessageListSectionDataSourceUpdateRequest *)self messageList];
  v6 = [v3 stringWithFormat:@"<%p: MessageListSectionDataSourceUpdateRequest> section=%@, messageList=%@, shouldClearSnapshot=%d", self, v4, v5, -[MessageListSectionDataSourceUpdateRequest shouldClearSnapshot](self, "shouldClearSnapshot")];

  return (NSString *)v6;
}

- (NSString)section
{
  return self->_section;
}

- (BOOL)shouldClearSnapshot
{
  return self->_shouldClearSnapshot;
}

- (EMMessageList)messageList
{
  return self->_messageList;
}

- (MessageListSectionDataSourceUpdateRequest)initWithSection:(id)a3 messageList:(id)a4 shouldClearSnapshot:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MessageListSectionDataSourceUpdateRequest;
  v11 = [(MessageListSectionDataSourceUpdateRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_section, a3);
    objc_storeStrong((id *)&v12->_messageList, a4);
    v12->_shouldClearSnapshot = a5;
  }

  return v12;
}

- (MessageListSectionDataSourceUpdateRequest)initWithSection:(id)a3 messageList:(id)a4
{
  return [(MessageListSectionDataSourceUpdateRequest *)self initWithSection:a3 messageList:a4 shouldClearSnapshot:1];
}

- (MessageListSectionDataSourceUpdateRequest)initWithSection:(id)a3
{
  return [(MessageListSectionDataSourceUpdateRequest *)self initWithSection:a3 messageList:0];
}

@end
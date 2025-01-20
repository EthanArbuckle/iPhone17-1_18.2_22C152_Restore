@interface MessageListDataSourceUpdateRequest
- (BOOL)startsWithEmptySnapshot;
- (MessageListDataSourceUpdateRequest)initWithSectionUpdates:(id)a3 sectionsToRemove:(id)a4 startsWithEmptySnapshot:(BOOL)a5;
- (NSArray)sectionsToRemove;
- (NSArray)sectionsToUpdate;
- (NSString)ef_publicDescription;
@end

@implementation MessageListDataSourceUpdateRequest

- (BOOL)startsWithEmptySnapshot
{
  return self->_startsWithEmptySnapshot;
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  v4 = [(MessageListDataSourceUpdateRequest *)self sectionsToUpdate];
  v5 = [(MessageListDataSourceUpdateRequest *)self sectionsToRemove];
  v6 = [v3 stringWithFormat:@"<%p: MessageListDataSourceUpdateRequest> sectionsToUpdate=%@, sectionsToRemove=%@, startsWithEmptySnapshot=%d", self, v4, v5, -[MessageListDataSourceUpdateRequest startsWithEmptySnapshot](self, "startsWithEmptySnapshot")];

  return (NSString *)v6;
}

- (NSArray)sectionsToUpdate
{
  return self->_sectionsToUpdate;
}

- (NSArray)sectionsToRemove
{
  return self->_sectionsToRemove;
}

- (MessageListDataSourceUpdateRequest)initWithSectionUpdates:(id)a3 sectionsToRemove:(id)a4 startsWithEmptySnapshot:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MessageListDataSourceUpdateRequest;
  v11 = [(MessageListDataSourceUpdateRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_sectionsToUpdate, a3);
    objc_storeStrong((id *)&v12->_sectionsToRemove, a4);
    v12->_startsWithEmptySnapshot = a5;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionsToRemove, 0);
  objc_storeStrong((id *)&self->_sectionsToUpdate, 0);
}

@end
@interface MessageListSectionUpdate
- (BOOL)animated;
- (BOOL)cleanSnapshot;
- (BOOL)immediateCompletion;
- (MessageListSectionDataSource)sectionDataSource;
- (MessageListSectionUpdate)initWithMessageListSectionDataSource:(id)a3 animated:(BOOL)a4 cleanSnapshot:(BOOL)a5 prepareHandler:(id)a6 updateHandler:(id)a7 immediateCompletion:(BOOL)a8 completionHandler:(id)a9;
- (MessageListSectionUpdate)initWithMessageListSectionDataSource:(id)a3 animated:(BOOL)a4 cleanSnapshot:(BOOL)a5 updateHandler:(id)a6;
- (NSString)ef_publicDescription;
- (id)completionHandler;
- (id)prepareHandler;
- (id)updateHandler;
- (void)setAnimated:(BOOL)a3;
- (void)setCleanSnapshot:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setImmediateCompletion:(BOOL)a3;
- (void)setPrepareHandler:(id)a3;
- (void)setSectionDataSource:(id)a3;
- (void)setUpdateHandler:(id)a3;
@end

@implementation MessageListSectionUpdate

- (id)updateHandler
{
  return self->_updateHandler;
}

- (id)prepareHandler
{
  return self->_prepareHandler;
}

- (NSString)ef_publicDescription
{
  v3 = NSString;
  v4 = [(MessageListSectionUpdate *)self sectionDataSource];
  v5 = [v4 section];
  v6 = [v3 stringWithFormat:@"<%p: MessageListSectionUpdate> section=%@ animated=%d cleanSnapshot=%d immediateCompletion=%d", self, v5, -[MessageListSectionUpdate animated](self, "animated"), -[MessageListSectionUpdate cleanSnapshot](self, "cleanSnapshot"), -[MessageListSectionUpdate immediateCompletion](self, "immediateCompletion")];

  return (NSString *)v6;
}

- (MessageListSectionDataSource)sectionDataSource
{
  return self->_sectionDataSource;
}

- (BOOL)cleanSnapshot
{
  return self->_cleanSnapshot;
}

- (BOOL)animated
{
  return self->_animated;
}

- (BOOL)immediateCompletion
{
  return self->_immediateCompletion;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (MessageListSectionUpdate)initWithMessageListSectionDataSource:(id)a3 animated:(BOOL)a4 cleanSnapshot:(BOOL)a5 updateHandler:(id)a6
{
  return [(MessageListSectionUpdate *)self initWithMessageListSectionDataSource:a3 animated:a4 cleanSnapshot:a5 prepareHandler:0 updateHandler:a6 immediateCompletion:0 completionHandler:0];
}

- (MessageListSectionUpdate)initWithMessageListSectionDataSource:(id)a3 animated:(BOOL)a4 cleanSnapshot:(BOOL)a5 prepareHandler:(id)a6 updateHandler:(id)a7 immediateCompletion:(BOOL)a8 completionHandler:(id)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)MessageListSectionUpdate;
  v20 = [(MessageListSectionUpdate *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_sectionDataSource, a3);
    v21->_animated = a4;
    v21->_cleanSnapshot = a5;
    v22 = _Block_copy(v17);
    id prepareHandler = v21->_prepareHandler;
    v21->_id prepareHandler = v22;

    v24 = _Block_copy(v18);
    id updateHandler = v21->_updateHandler;
    v21->_id updateHandler = v24;

    v21->_immediateCompletion = a8;
    v26 = _Block_copy(v19);
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v26;
  }
  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_prepareHandler, 0);
  objc_storeStrong((id *)&self->_sectionDataSource, 0);
}

- (void)setSectionDataSource:(id)a3
{
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void)setCleanSnapshot:(BOOL)a3
{
  self->_cleanSnapshot = a3;
}

- (void)setImmediateCompletion:(BOOL)a3
{
  self->_immediateCompletion = a3;
}

- (void)setPrepareHandler:(id)a3
{
}

- (void)setUpdateHandler:(id)a3
{
}

- (void)setCompletionHandler:(id)a3
{
}

@end
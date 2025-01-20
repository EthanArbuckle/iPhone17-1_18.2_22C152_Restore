@interface AFUIPanelState
- (BOOL)isDisplayed;
- (RTIDocumentState)documentState;
- (RTIDocumentTraits)documentTraits;
- (id)initDisplayed:(BOOL)a3 documentTraits:(id)a4 documentState:(id)a5 textOperationsHandler:(id)a6;
- (id)initNotDisplayed;
- (id)textOperationsHandler;
@end

@implementation AFUIPanelState

- (id)initNotDisplayed
{
  return [(AFUIPanelState *)self initDisplayed:0 documentTraits:0 documentState:0 textOperationsHandler:0];
}

- (id)initDisplayed:(BOOL)a3 documentTraits:(id)a4 documentState:(id)a5 textOperationsHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AFUIPanelState;
  v13 = [(AFUIPanelState *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_displayed = a3;
    uint64_t v15 = [v10 copy];
    documentTraits = v14->_documentTraits;
    v14->_documentTraits = (RTIDocumentTraits *)v15;

    uint64_t v17 = [v11 copy];
    documentState = v14->_documentState;
    v14->_documentState = (RTIDocumentState *)v17;

    uint64_t v19 = [v12 copy];
    id textOperationsHandler = v14->_textOperationsHandler;
    v14->_id textOperationsHandler = (id)v19;
  }
  return v14;
}

- (BOOL)isDisplayed
{
  return self->_displayed;
}

- (RTIDocumentTraits)documentTraits
{
  return self->_documentTraits;
}

- (RTIDocumentState)documentState
{
  return self->_documentState;
}

- (id)textOperationsHandler
{
  return self->_textOperationsHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_textOperationsHandler, 0);
  objc_storeStrong((id *)&self->_documentState, 0);

  objc_storeStrong((id *)&self->_documentTraits, 0);
}

@end
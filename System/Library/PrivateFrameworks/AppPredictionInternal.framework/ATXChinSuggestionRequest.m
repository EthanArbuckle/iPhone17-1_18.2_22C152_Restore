@interface ATXChinSuggestionRequest
- (ATXChinSuggestionRequest)initWithAcceptedBlock:(id)a3 rejectedBlock:(id)a4;
- (id)acceptedBlock;
- (id)description;
- (id)rejectedBlock;
- (unint64_t)debugIdentifier;
- (void)setDebugIdentifier:(unint64_t)a3;
@end

@implementation ATXChinSuggestionRequest

- (ATXChinSuggestionRequest)initWithAcceptedBlock:(id)a3 rejectedBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXChinSuggestionRequest;
  v8 = [(ATXChinSuggestionRequest *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_debugIdentifier = 0;
    v10 = _Block_copy(v6);
    id acceptedBlock = v9->_acceptedBlock;
    v9->_id acceptedBlock = v10;

    v12 = _Block_copy(v7);
    id rejectedBlock = v9->_rejectedBlock;
    v9->_id rejectedBlock = v12;
  }
  return v9;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<Request #%llu>", -[ATXChinSuggestionRequest debugIdentifier](self, "debugIdentifier"));
}

- (unint64_t)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(unint64_t)a3
{
  self->_debugIdentifier = a3;
}

- (id)acceptedBlock
{
  return self->_acceptedBlock;
}

- (id)rejectedBlock
{
  return self->_rejectedBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rejectedBlock, 0);
  objc_storeStrong(&self->_acceptedBlock, 0);
}

@end
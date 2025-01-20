@interface SGQuickResponsesReplyRecord
- (NSString)langResponse;
- (SGQuickResponsesReplyRecord)initWithDisplayed:(double)a3 selected:(double)a4 matched:(double)a5;
- (double)displayed;
- (double)matched;
- (double)selected;
@end

@implementation SGQuickResponsesReplyRecord

- (void).cxx_destruct
{
}

- (double)matched
{
  return self->_matched;
}

- (double)selected
{
  return self->_selected;
}

- (double)displayed
{
  return self->_displayed;
}

- (NSString)langResponse
{
  return self->_langResponse;
}

- (SGQuickResponsesReplyRecord)initWithDisplayed:(double)a3 selected:(double)a4 matched:(double)a5
{
  if (a3 < 0.0)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1317, @"Invalid parameter not satisfying: %@", @"displayed >= 0" object file lineNumber description];
  }
  if (a4 < 0.0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1318, @"Invalid parameter not satisfying: %@", @"selected >= 0" object file lineNumber description];
  }
  if (a5 < 0.0)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SGQuickResponsesStore.m", 1319, @"Invalid parameter not satisfying: %@", @"matched >= 0" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)SGQuickResponsesReplyRecord;
  result = [(SGQuickResponsesReplyRecord *)&v14 init];
  if (result)
  {
    result->_displayed = a3;
    result->_selected = a4;
    result->_matched = a5;
  }
  return result;
}

@end
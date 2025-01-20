@interface CHParseTreeNode
- (CHParseTreeNode)initWithName:(id)a3 inputRange:(_NSRange)a4;
- (NSString)name;
- (_NSRange)inputRange;
@end

@implementation CHParseTreeNode

- (CHParseTreeNode)initWithName:(id)a3 inputRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  uint64_t v14 = objc_msgSend_init(self, v9, v10, v11, v12, v13);
  v15 = (CHParseTreeNode *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 8), a3);
    v15->_inputRange.NSUInteger location = location;
    v15->_inputRange.NSUInteger length = length;
  }

  return v15;
}

- (NSString)name
{
  return self->_name;
}

- (_NSRange)inputRange
{
  NSUInteger length = self->_inputRange.length;
  NSUInteger location = self->_inputRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
}

@end
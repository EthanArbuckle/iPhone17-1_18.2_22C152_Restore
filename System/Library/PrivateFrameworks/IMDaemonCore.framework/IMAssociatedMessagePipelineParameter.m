@interface IMAssociatedMessagePipelineParameter
- (IMAssociatedMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4;
- (IMAssociatedMessagePipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4;
- (NSString)associatedMessageFallbackHash;
- (_NSRange)associatedMessageRange;
- (id)description;
- (int64_t)associatedMessageType;
- (void)setAssociatedMessageFallbackHash:(id)a3;
- (void)setAssociatedMessageRange:(_NSRange)a3;
- (void)setAssociatedMessageType:(int64_t)a3;
@end

@implementation IMAssociatedMessagePipelineParameter

- (IMAssociatedMessagePipelineParameter)initWithBD:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMAssociatedMessagePipelineParameter;
  v7 = [(IMTextMessagePipelineParameter *)&v17 initWithBD:v6 idsTrustedData:a4];
  if (v7)
  {
    v8 = [v6 messageSubType];
    v9 = [v8 tapback];

    -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", [v9 associatedMessageType]);
    v10 = [v9 associatedMessageGUID];
    [(IMTextMessagePipelineParameter *)v7 setAssociatedMessageGUID:v10];

    uint64_t v11 = [v9 associatedMessageFallbackHash];
    associatedMessageFallbackHash = v7->_associatedMessageFallbackHash;
    v7->_associatedMessageFallbackHash = (NSString *)v11;

    uint64_t v13 = [v9 associatedMessageRange];
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v13, v14);
    v15 = [v9 plainTextBody];
    [(IMTextMessagePipelineParameter *)v7 setPlainTextBody:v15];
  }
  return v7;
}

- (IMAssociatedMessagePipelineParameter)initWithBDBasic:(id)a3 idsTrustedData:(id)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMAssociatedMessagePipelineParameter;
  v7 = [(IMTextMessagePipelineParameter *)&v17 initWithBDBasic:v6 idsTrustedData:a4];
  if (v7)
  {
    v8 = [v6 messageSubType];
    v9 = [v8 tapback];

    -[IMAssociatedMessagePipelineParameter setAssociatedMessageType:](v7, "setAssociatedMessageType:", [v9 associatedMessageType]);
    v10 = [v9 associatedMessageGUID];
    [(IMTextMessagePipelineParameter *)v7 setAssociatedMessageGUID:v10];

    uint64_t v11 = [v9 associatedMessageFallbackHash];
    associatedMessageFallbackHash = v7->_associatedMessageFallbackHash;
    v7->_associatedMessageFallbackHash = (NSString *)v11;

    uint64_t v13 = [v9 associatedMessageRange];
    -[IMAssociatedMessagePipelineParameter setAssociatedMessageRange:](v7, "setAssociatedMessageRange:", v13, v14);
    v15 = [v9 plainTextBody];
    [(IMTextMessagePipelineParameter *)v7 setPlainTextBody:v15];
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(IMTextMessagePipelineParameter *)self GUID];
  int64_t v5 = [(IMAssociatedMessagePipelineParameter *)self associatedMessageType];
  id v6 = [(IMTextMessagePipelineParameter *)self associatedMessageGUID];
  v7 = [(IMTextMessagePipelineParameter *)self timestamp];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isFromStorage](self, "isFromStorage"));
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isLastFromStorage](self, "isLastFromStorage"));
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[IMTextMessagePipelineParameter isFromMe](self, "isFromMe"));
  uint64_t v11 = [(IMTextMessagePipelineParameter *)self messageItems];
  v12 = [v3 stringWithFormat:@"<IMMessageTapbackPipelineParameter %p> { guid: %@, assocatedMessageType: %lld, associatedMessageGUID: %@, timestamp: %@, isFromStorage: %@, isLastFromStorage: %@, isFromMe: %@, output messageItems: %lu}", self, v4, v5, v6, v7, v8, v9, v10, objc_msgSend(v11, "count")];

  return v12;
}

- (int64_t)associatedMessageType
{
  return self->_associatedMessageType;
}

- (void)setAssociatedMessageType:(int64_t)a3
{
  self->_associatedMessageType = a3;
}

- (NSString)associatedMessageFallbackHash
{
  return self->_associatedMessageFallbackHash;
}

- (void)setAssociatedMessageFallbackHash:(id)a3
{
}

- (_NSRange)associatedMessageRange
{
  p_associatedMessageRange = &self->_associatedMessageRange;
  NSUInteger location = self->_associatedMessageRange.location;
  NSUInteger length = p_associatedMessageRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAssociatedMessageRange:(_NSRange)a3
{
  self->_associatedMessageRange = a3;
}

- (void).cxx_destruct
{
}

@end
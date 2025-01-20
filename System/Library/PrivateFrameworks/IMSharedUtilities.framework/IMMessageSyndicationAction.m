@interface IMMessageSyndicationAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlighted;
- (IMMessagePartGUID)messagePartGUID;
- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 encodedMessagePartGUID:(id)a6 messagePartRange:(_NSRange)a7;
- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 encodedMessagePartGUID:(id)a6 messagePartRange:(_NSRange)a7 version:(unsigned __int8)a8;
- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 messagePartGUID:(id)a6 messagePartRange:(_NSRange)a7;
- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 messagePartGUID:(id)a6 messagePartRange:(_NSRange)a7 version:(unsigned __int8)a8;
- (IMMessageSyndicationAction)initWithCoder:(id)a3;
- (IMMessageSyndicationAction)initWithDictionary:(id)a3;
- (_NSRange)messagePartRange;
- (id)copyDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)messagePartSyndicationStatus;
- (int64_t)messagePartSyndicationType;
- (unsigned)syndicatedItemType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMMessageSyndicationAction

- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 messagePartGUID:(id)a6 messagePartRange:(_NSRange)a7
{
  LOBYTE(v8) = IMSyndicationActionCurrentVersion;
  return -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:", a3, a4, a5, a6, a7.location, a7.length, v8);
}

- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 messagePartGUID:(id)a6 messagePartRange:(_NSRange)a7 version:(unsigned __int8)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v17 = v16;
  if (IMSyndicationActionCurrentVersion != a8)
  {
    v19 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1A09F13F0(IMSyndicationActionCurrentVersion, a8, v19);
    }
    goto LABEL_21;
  }
  if (!v16)
  {
    v19 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1A09F1298(v19);
    }
    goto LABEL_21;
  }
  if (!length)
  {
    v22 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v26.NSUInteger location = location;
      v26.NSUInteger length = 0;
      sub_1A09F12DC(v26, v22);
    }

    goto LABEL_22;
  }
  int v18 = v11 & 0xFFFFFFFB;
  if ((v11 & 4) == 0) {
    int v18 = v11;
  }
  if ((v11 & 8) != 0) {
    v18 &= ~8u;
  }
  if ((v11 & 0x10) != 0) {
    v18 &= ~0x10u;
  }
  if ((v11 & 0x20) != 0) {
    v18 &= ~0x20u;
  }
  if ((v11 & 0x40) != 0) {
    v18 &= ~0x40u;
  }
  if (v18)
  {
    v19 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1A09F1374(v11, v19);
    }
LABEL_21:

LABEL_22:
    v20 = 0;
    goto LABEL_23;
  }
  v25.receiver = self;
  v25.super_class = (Class)IMMessageSyndicationAction;
  v23 = [(IMSyndicationAction *)&v25 initWithChatGUID:v14 syndicationStartDate:v15 syndicationActionType:v11];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_messagePartGUID, a6);
    v24->_messagePartRange.NSUInteger location = location;
    v24->_messagePartRange.NSUInteger length = length;
  }
  self = v24;
  v20 = self;
LABEL_23:

  return v20;
}

- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 encodedMessagePartGUID:(id)a6 messagePartRange:(_NSRange)a7
{
  LOBYTE(v8) = IMSyndicationActionCurrentVersion;
  return -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:version:", a3, a4, a5, a6, a7.location, a7.length, v8);
}

- (IMMessageSyndicationAction)initWithChatGUID:(id)a3 syndicationStartDate:(id)a4 syndicationActionType:(unsigned __int8)a5 encodedMessagePartGUID:(id)a6 messagePartRange:(_NSRange)a7 version:(unsigned __int8)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v17 = v16;
  if (v16 && [v16 length])
  {
    int v18 = [[IMMessagePartGUID alloc] initWithEncodedMessagePartGUID:v17];
    LOBYTE(v22) = a8;
    self = -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:", v14, v15, v11, v18, location, length, v22);

    v19 = self;
  }
  else
  {
    v20 = IMLogHandleForCategory("IMSyndicationAction");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1A09F1298(v20);
    }

    v19 = 0;
  }

  return v19;
}

- (IMMessageSyndicationAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"salc"];
  uint64_t v19 = [v5 integerValue];

  v6 = [v4 objectForKeyedSubscript:@"saln"];
  uint64_t v7 = [v6 integerValue];

  uint64_t v8 = [v4 objectForKeyedSubscript:@"sacg"];
  v9 = objc_opt_class();
  v10 = [v4 objectForKeyedSubscript:@"sasd"];
  uint64_t v11 = [v9 dateFromNanoSeconds:v10];
  v12 = [v4 objectForKeyedSubscript:@"sat2"];
  uint64_t v13 = [v12 unsignedCharValue];
  id v14 = [v4 objectForKeyedSubscript:@"samp"];
  id v15 = [v4 objectForKeyedSubscript:@"savs"];

  LOBYTE(v18) = [v15 unsignedCharValue];
  id v16 = -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:encodedMessagePartGUID:messagePartRange:version:", v8, v11, v13, v14, v19, v7, v18);

  return v16;
}

- (id)copyDictionaryRepresentation
{
  v15.receiver = self;
  v15.super_class = (Class)IMMessageSyndicationAction;
  id v3 = [(IMSyndicationAction *)&v15 copyDictionaryRepresentation];
  uint64_t v4 = [(IMMessageSyndicationAction *)self messagePartRange];
  uint64_t v6 = v5;
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v4];
  [v3 setObject:v7 forKeyedSubscript:@"salc"];

  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v6];
  [v3 setObject:v8 forKeyedSubscript:@"saln"];

  v9 = [(IMMessageSyndicationAction *)self messagePartGUID];
  v10 = [v9 encodedMessagePartGUID];
  uint64_t v11 = (void *)[v10 copy];
  [v3 setObject:v11 forKeyedSubscript:@"samp"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"));
  [v3 setObject:v12 forKeyedSubscript:@"sat2"];

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[IMSyndicationAction version](self, "version"));
  [v3 setObject:v13 forKeyedSubscript:@"savs"];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMMessageSyndicationAction;
  if ([(IMSyndicationAction *)&v17 isEqual:v4]
    && (int v5 = [(IMSyndicationAction *)self syndicationActionType],
        v5 == [v4 syndicationActionType]))
  {
    uint64_t v6 = [(IMMessageSyndicationAction *)self messagePartRange];
    uint64_t v8 = v7;
    char v10 = 0;
    if (v6 == [v4 messagePartRange] && v8 == v9)
    {
      uint64_t v11 = [(IMMessageSyndicationAction *)self messagePartGUID];
      v12 = [v4 messagePartGUID];
      id v13 = v11;
      id v14 = v12;
      objc_super v15 = v14;
      if (v13 == v14)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if (v13 && v14) {
          char v10 = [v13 isEqual:v14];
        }
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (IMMessageSyndicationAction)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sacg"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sasd"];
  unsigned __int8 v7 = [v4 decodeInt64ForKey:@"sat2"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"samp"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"IMSyndicatedMessagePartRangeKey"];
  uint64_t v10 = [v9 rangeValue];
  uint64_t v12 = v11;
  char v13 = [v4 decodeInt64ForKey:@"savs"];

  LOBYTE(v16) = v13;
  id v14 = -[IMMessageSyndicationAction initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:](self, "initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:", v5, v6, v7, v8, v10, v12, v16);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)IMMessageSyndicationAction;
  id v4 = a3;
  [(IMSyndicationAction *)&v10 encodeWithCoder:v4];
  int v5 = (void *)MEMORY[0x1E4F29238];
  uint64_t v6 = [(IMMessageSyndicationAction *)self messagePartRange];
  uint64_t v8 = objc_msgSend(v5, "valueWithRange:", v6, v7);
  [v4 encodeObject:v8 forKey:@"IMSyndicatedMessagePartRangeKey"];

  uint64_t v9 = [(IMMessageSyndicationAction *)self messagePartGUID];
  [v4 encodeObject:v9 forKey:@"samp"];

  objc_msgSend(v4, "encodeInt64:forKey:", -[IMSyndicationAction syndicationActionType](self, "syndicationActionType"), @"sat2");
  objc_msgSend(v4, "encodeInt64:forKey:", -[IMSyndicationAction version](self, "version"), @"savs");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int v5 = [(IMSyndicationAction *)self chatGUID];
  uint64_t v6 = [(IMSyndicationAction *)self syndicationStartDate];
  uint64_t v7 = [(IMSyndicationAction *)self syndicationActionType];
  uint64_t v8 = [(IMMessageSyndicationAction *)self messagePartGUID];
  uint64_t v9 = [(IMMessageSyndicationAction *)self messagePartRange];
  uint64_t v11 = v10;
  LOBYTE(v14) = [(IMSyndicationAction *)self version];
  uint64_t v12 = objc_msgSend(v4, "initWithChatGUID:syndicationStartDate:syndicationActionType:messagePartGUID:messagePartRange:version:", v5, v6, v7, v8, v9, v11, v14);

  return v12;
}

- (id)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)IMMessageSyndicationAction;
  id v4 = [(IMSyndicationAction *)&v9 description];
  v11.NSUInteger location = [(IMMessageSyndicationAction *)self messagePartRange];
  int v5 = NSStringFromRange(v11);
  uint64_t v6 = [(IMMessageSyndicationAction *)self messagePartGUID];
  uint64_t v7 = [v3 stringWithFormat:@"%@ range: %@, messagePartGUID: %@", v4, v5, v6];

  return v7;
}

- (BOOL)isHighlighted
{
  return ([(IMSyndicationAction *)self syndicationActionType] >> 2) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unsigned)syndicatedItemType
{
  return 1;
}

- (_NSRange)messagePartRange
{
  p_messagePartRange = &self->_messagePartRange;
  NSUInteger location = self->_messagePartRange.location;
  NSUInteger length = p_messagePartRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (IMMessagePartGUID)messagePartGUID
{
  return self->_messagePartGUID;
}

- (void).cxx_destruct
{
}

- (int64_t)messagePartSyndicationType
{
  if (![(IMSyndicationAction *)self syndicationActionType]
    || ([(IMSyndicationAction *)self syndicationActionType] & 8) != 0)
  {
    return 0;
  }
  if (([(IMSyndicationAction *)self syndicationActionType] & 0x10) != 0) {
    return 4;
  }
  if (([(IMSyndicationAction *)self syndicationActionType] & 4) == 0)
  {
    if (([(IMSyndicationAction *)self syndicationActionType] & 0x20) == 0) {
      return ([(IMSyndicationAction *)self syndicationActionType] >> 3) & 8;
    }
    return 0;
  }
  return 1;
}

- (int64_t)messagePartSyndicationStatus
{
  return ([(IMSyndicationAction *)self syndicationActionType] >> 5) & 1;
}

@end
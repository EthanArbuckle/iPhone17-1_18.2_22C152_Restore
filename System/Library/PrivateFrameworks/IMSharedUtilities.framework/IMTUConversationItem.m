@interface IMTUConversationItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isFromMe;
- (IMTUConversationItem)initWithCoder:(id)a3;
- (IMTUConversationItem)initWithDictionary:(id)a3;
- (IMTUConversationItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 messageSummaryInfo:(id)a6;
- (NSDictionary)messageSummaryInfo;
- (id)copyDictionaryRepresentation;
- (unint64_t)avMode;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setAvMode:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
@end

@implementation IMTUConversationItem

- (IMTUConversationItem)initWithSender:(id)a3 time:(id)a4 guid:(id)a5 messageSummaryInfo:(id)a6
{
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)IMTUConversationItem;
  v11 = [(IMItem *)&v15 initWithSender:a3 time:a4 guid:a5 type:6];
  if (v11)
  {
    uint64_t v12 = [v10 objectForKey:@"conversationAVMode"];
    if (v12) {
      v13 = (void *)v12;
    }
    else {
      v13 = &unk_1EF305730;
    }
    v11->_avMode = [v13 unsignedIntegerValue];
  }
  return v11;
}

- (IMTUConversationItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)IMTUConversationItem;
  v5 = [(IMItem *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_flags = [v4 decodeInt64ForKey:@"flags"];
    v5->_avMode = [v4 decodeIntegerForKey:@"conversationAVMode"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMTUConversationItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMTUConversationItem;
  v5 = [(IMItem *)&v10 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"flags"];
    v5->_flags = [v6 unsignedLongLongValue];

    uint64_t v7 = [v4 objectForKey:@"conversationAVMode"];
    if (v7) {
      v8 = (void *)v7;
    }
    else {
      v8 = &unk_1EF305730;
    }
    v5->_avMode = [v8 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IMTUConversationItem;
  id v4 = a3;
  [(IMItem *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt64:forKey:", self->_flags, @"flags", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_avMode forKey:@"conversationAVMode"];
}

- (id)copyDictionaryRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)IMTUConversationItem;
  v3 = [(IMItem *)&v8 copyDictionaryRepresentation];
  id v4 = (void *)MEMORY[0x1A6228190]();
  objc_super v5 = [NSNumber numberWithUnsignedLongLong:self->_flags];
  if (v5) {
    CFDictionarySetValue(v3, @"flags", v5);
  }

  v6 = [NSNumber numberWithUnsignedInteger:self->_avMode];
  if (v6) {
    CFDictionarySetValue(v3, @"conversationAVMode", v6);
  }

  return v3;
}

- (BOOL)isFromMe
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (NSDictionary)messageSummaryInfo
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v5 = @"conversationAVMode";
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMTUConversationItem avMode](self, "avMode"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)avMode
{
  return self->_avMode;
}

- (void)setAvMode:(unint64_t)a3
{
  self->_avMode = a3;
}

@end
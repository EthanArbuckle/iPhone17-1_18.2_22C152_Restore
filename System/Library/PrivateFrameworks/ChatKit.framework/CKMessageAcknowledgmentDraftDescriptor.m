@interface CKMessageAcknowledgmentDraftDescriptor
+ (id)acknowledgmentBarColor;
+ (id)allMessageAcknowledgmentDescriptorsWithServiceName:(id)a3;
- (CKMessageAcknowledgmentDraftDescriptor)initWithMessageAcknowledgmentType:(int64_t)a3 serviceName:(id)a4;
- (NSString)acknowledgmentImageName;
- (NSString)serviceName;
- (UIColor)acknowledgmentImageColor;
- (UIColor)selectedAcknowledgmentImageColor;
- (UIColor)selectedBalloonColor;
- (id)symbolName;
- (int64_t)messageAcknowledgmentType;
- (int64_t)themeColor;
@end

@implementation CKMessageAcknowledgmentDraftDescriptor

- (CKMessageAcknowledgmentDraftDescriptor)initWithMessageAcknowledgmentType:(int64_t)a3 serviceName:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKMessageAcknowledgmentDraftDescriptor;
  v7 = [(CKMessageAcknowledgmentDraftDescriptor *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_messageAcknowledgmentType = a3;
    uint64_t v9 = [v6 copy];
    serviceName = v8->_serviceName;
    v8->_serviceName = (NSString *)v9;
  }
  return v8;
}

- (NSString)acknowledgmentImageName
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = objc_msgSend(v3, "messageAcknowledgmentImageNameForType:", -[CKMessageAcknowledgmentDraftDescriptor messageAcknowledgmentType](self, "messageAcknowledgmentType"));

  return (NSString *)v4;
}

- (id)symbolName
{
  int64_t v2 = [(CKMessageAcknowledgmentDraftDescriptor *)self messageAcknowledgmentType];
  if ((unint64_t)(v2 - 2000) > 5) {
    return 0;
  }
  else {
    return off_1E5625F08[v2 - 2000];
  }
}

- (int64_t)themeColor
{
  if (self->_messageAcknowledgmentType == 2000) {
    return [(NSString *)self->_serviceName isEqualToString:*MEMORY[0x1E4F6E1B0]];
  }
  else {
    return 0;
  }
}

- (UIColor)acknowledgmentImageColor
{
  int64_t v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 theme];
  v4 = [v3 messageAcknowledgment:2 acknowledgmentImageColor:0];

  return (UIColor *)v4;
}

- (UIColor)selectedAcknowledgmentImageColor
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 theme];
  v5 = objc_msgSend(v4, "messageAcknowledgment:selectedAcknowledgmentImageColor:", 2, -[CKMessageAcknowledgmentDraftDescriptor themeColor](self, "themeColor"));

  return (UIColor *)v5;
}

- (UIColor)selectedBalloonColor
{
  v3 = +[CKUIBehavior sharedBehaviors];
  v4 = [v3 theme];
  v5 = [v4 messageAcknowledgmentSelectedBalloonColorForStyle:2 serviceName:self->_serviceName];

  return (UIColor *)v5;
}

+ (id)acknowledgmentBarColor
{
  int64_t v2 = +[CKUIBehavior sharedBehaviors];
  v3 = [v2 theme];
  v4 = [v3 messageAcknowledgmentBalloonColorForStyle:2];

  return v4;
}

+ (id)allMessageAcknowledgmentDescriptorsWithServiceName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = +[CKUIBehavior sharedBehaviors];
  id v6 = [v5 messageAcknowledgmentPickerBarAcknowledgmentOrder];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = -[CKMessageAcknowledgmentDraftDescriptor initWithMessageAcknowledgmentType:serviceName:]([CKMessageAcknowledgmentDraftDescriptor alloc], "initWithMessageAcknowledgmentType:serviceName:", [*(id *)(*((void *)&v13 + 1) + 8 * i) integerValue], v3);
        [v4 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v4;
}

- (int64_t)messageAcknowledgmentType
{
  return self->_messageAcknowledgmentType;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
}

@end
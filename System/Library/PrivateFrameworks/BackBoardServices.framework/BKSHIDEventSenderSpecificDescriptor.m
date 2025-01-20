@interface BKSHIDEventSenderSpecificDescriptor
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventDescriptor)sourceDescriptor;
- (BKSHIDEventSenderSpecificDescriptor)initWithCoder:(id)a3;
- (BKSHIDEventSenderSpecificDescriptor)initWithDescriptor:(id)a3 senderID:(unint64_t)a4;
- (BOOL)describes:(id)a3;
- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)requiresFuzzyMatching;
- (id)descriptorByAddingSenderIDToMatchCriteria:(unint64_t)a3;
- (unint64_t)senderID;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSourceDescriptor:(id)a3;
@end

@implementation BKSHIDEventSenderSpecificDescriptor

- (void).cxx_destruct
{
}

- (void)setSourceDescriptor:(id)a3
{
}

- (BKSHIDEventDescriptor)sourceDescriptor
{
  return self->_sourceDescriptor;
}

- (unint64_t)senderID
{
  return self->_senderID;
}

- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3
{
  unint64_t v5 = [(BKSHIDEventSenderSpecificDescriptor *)self senderID];
  if (v5 != IOHIDEventGetSenderID()) {
    return 0;
  }
  sourceDescriptor = self->_sourceDescriptor;
  return [(BKSHIDEventDescriptor *)sourceDescriptor matchesHIDEvent:a3];
}

- (BOOL)describes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(BKSHIDEventSenderSpecificDescriptor *)self senderID];
    if (v6 == [v5 senderID])
    {
      sourceDescriptor = self->_sourceDescriptor;
      v8 = [v5 sourceDescriptor];
      BOOL v9 = [(BKSHIDEventDescriptor *)sourceDescriptor describes:v8];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)requiresFuzzyMatching
{
  return 1;
}

- (BKSHIDEventSenderSpecificDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKSHIDEventSenderSpecificDescriptor;
  id v5 = [(BKSHIDEventDescriptor *)&v12 init];
  if (!v5) {
    goto LABEL_4;
  }
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_senderID"];
  v5->_senderID = [v6 unsignedLongLongValue];

  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sourceDescriptor"];
  sourceDescriptor = v5->_sourceDescriptor;
  v5->_sourceDescriptor = (BKSHIDEventDescriptor *)v7;

  BOOL v9 = v5->_sourceDescriptor;
  if (v9)
  {
    id v5 = [(BKSHIDEventSenderSpecificDescriptor *)v5 initWithDescriptor:v9 senderID:v5->_senderID];
    v10 = v5;
  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t senderID = self->_senderID;
  id v7 = a3;
  unint64_t v6 = [v4 numberWithUnsignedLongLong:senderID];
  [v7 encodeObject:v6 forKey:@"_senderID"];

  [v7 encodeObject:self->_sourceDescriptor forKey:@"_sourceDescriptor"];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventSenderSpecificDescriptor;
  [(BKSHIDEventDescriptor *)&v7 appendDescriptionToFormatter:v4];
  id v5 = (id)[v4 appendUInt64:self->_senderID withName:@"senderID" format:1];
  id v6 = (id)[v4 appendObject:self->_sourceDescriptor withName:@"sourceDescriptor"];
}

- (id)descriptorByAddingSenderIDToMatchCriteria:(unint64_t)a3
{
  v3 = [[BKSHIDEventSenderSpecificDescriptor alloc] initWithDescriptor:self->_sourceDescriptor senderID:a3];
  return v3;
}

- (BKSHIDEventSenderSpecificDescriptor)initWithDescriptor:(id)a3 senderID:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKSHIDEventSenderSpecificDescriptor;
  v8 = [(BKSHIDEventDescriptor *)&v11 _initWithEventType:0];
  BOOL v9 = (BKSHIDEventSenderSpecificDescriptor *)v8;
  if (v8)
  {
    objc_storeStrong(v8 + 3, a3);
    v9->_unint64_t senderID = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
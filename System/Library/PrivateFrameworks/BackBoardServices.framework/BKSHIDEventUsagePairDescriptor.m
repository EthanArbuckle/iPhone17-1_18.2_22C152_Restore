@interface BKSHIDEventUsagePairDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorForHIDEventType:(unsigned int)a3 page:(unsigned __int16)a4 usage:(unsigned __int16)a5;
- (BKSHIDEventUsagePairDescriptor)initWithCoder:(id)a3;
- (BOOL)_page:(unsigned int)a3 usage:(unsigned int)a4 matchesHIDEvent:(__IOHIDEvent *)a5;
- (BOOL)describes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)requiresFuzzyMatching;
- (id)_initWithPage:(unsigned int)a3 usage:(unsigned int)a4 eventType:(unsigned int)a5;
- (unint64_t)hash;
- (unsigned)page;
- (unsigned)usage;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventUsagePairDescriptor

- (unint64_t)hash
{
  return BSHashPurifyNS();
}

- (id)_initWithPage:(unsigned int)a3 usage:(unsigned int)a4 eventType:(unsigned int)a5
{
  v12.receiver = self;
  v12.super_class = (Class)BKSHIDEventUsagePairDescriptor;
  v8 = [(BKSHIDEventDescriptor *)&v12 _initWithEventType:*(void *)&a5];
  v9 = v8;
  if (v8)
  {
    v8[3] = a3;
    v8[4] = a4;
    if (!a3)
    {
      if (a4)
      {
        v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2, v9, @"BKSHIDEventUsagePairDescriptor.m", 54, @"Invalid parameter not satisfying: %@", @"usage == kHIDUsage_Undefined" object file lineNumber description];
      }
    }
  }
  return v9;
}

- (BOOL)describes:(id)a3
{
  id v4 = a3;
  v5 = v4;
  unsigned int page = self->_page;
  if (*(&self->super._hidEventType + 1))
  {
    if (!page)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        BOOL v9 = 0;
        goto LABEL_12;
      }
      int v7 = *(&self->super._hidEventType + 1);
      BOOL v8 = v7 == [v5 page];
      goto LABEL_8;
    }
LABEL_6:
    BOOL v9 = [(BKSHIDEventUsagePairDescriptor *)self isEqual:v4];
    goto LABEL_12;
  }
  if (page) {
    goto LABEL_6;
  }
  int v10 = [v4 hidEventType];
  BOOL v8 = v10 == [(BKSHIDEventDescriptor *)self hidEventType];
LABEL_8:
  BOOL v9 = v8;
LABEL_12:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;
  BOOL v7 = v6
    && (v9.receiver = self,
        v9.super_class = (Class)BKSHIDEventUsagePairDescriptor,
        [(BKSHIDEventDescriptor *)&v9 isEqual:v6])
    && v6[3] == *(&self->super._hidEventType + 1)
    && v6[4] == self->_page;

  return v7;
}

- (unsigned)usage
{
  return self->_page;
}

- (unsigned)page
{
  return *(&self->super._hidEventType + 1);
}

- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventUsagePairDescriptor;
  BOOL v5 = -[BKSHIDEventDescriptor matchesHIDEvent:](&v7, sel_matchesHIDEvent_);
  if (v5) {
    LOBYTE(v5) = [(BKSHIDEventUsagePairDescriptor *)self _page:*(&self->super._hidEventType + 1) usage:self->_page matchesHIDEvent:a3];
  }
  return v5;
}

- (BOOL)requiresFuzzyMatching
{
  return !*(&self->super._hidEventType + 1) || self->_page == 0;
}

- (BOOL)_page:(unsigned int)a3 usage:(unsigned int)a4 matchesHIDEvent:(__IOHIDEvent *)a5
{
  if (!(a4 | a3)) {
    return 1;
  }
  if (!a3 && a4) {
    return 0;
  }
  int Type = IOHIDEventGetType();
  if (Type != 3 && Type != 1) {
    return 0;
  }
  int IntegerValue = IOHIDEventGetIntegerValue();
  int v10 = IOHIDEventGetIntegerValue();
  BOOL v12 = IntegerValue == a3 && v10 == a4;
  if (a4) {
    return v12;
  }
  else {
    return IntegerValue == a3;
  }
}

- (BKSHIDEventUsagePairDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_page"];
  uint64_t v6 = [v5 unsignedIntValue];

  objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_usage"];
  uint64_t v8 = [v7 unsignedIntValue];

  objc_super v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];

  uint64_t v10 = [v9 unsignedIntValue];
  return (BKSHIDEventUsagePairDescriptor *)[(BKSHIDEventUsagePairDescriptor *)self _initWithPage:v6 usage:v8 eventType:v10];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  uint64_t v5 = *(&self->super._hidEventType + 1);
  id v6 = a3;
  objc_super v7 = [v4 numberWithUnsignedInt:v5];
  [v6 encodeObject:v7 forKey:@"_page"];

  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_page];
  [v6 encodeObject:v8 forKey:@"_usage"];

  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventUsagePairDescriptor;
  objc_super v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BKSHIDEventDescriptor hidEventType](&v10, sel_hidEventType));
  [v6 encodeObject:v9 forKey:@"_type"];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BKSHIDEventUsagePairDescriptor;
  [(BKSHIDEventDescriptor *)&v7 appendDescriptionToFormatter:v4];
  id v5 = (id)[v4 appendUnsignedInteger:*(&self->super._hidEventType + 1) withName:@"page" format:1];
  id v6 = (id)[v4 appendUnsignedInteger:self->_page withName:@"usage" format:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptorForHIDEventType:(unsigned int)a3 page:(unsigned __int16)a4 usage:(unsigned __int16)a5
{
  if (a3 == 3)
  {
    objc_super v7 = off_1E54402D8;
LABEL_5:
    uint64_t v8 = -[__objc2_class descriptorWithPage:usage:](*v7, "descriptorWithPage:usage:", a4, a5, v5);
    return v8;
  }
  if (a3 == 1)
  {
    objc_super v7 = off_1E5440328;
    goto LABEL_5;
  }
  uint64_t v8 = 0;
  return v8;
}

@end
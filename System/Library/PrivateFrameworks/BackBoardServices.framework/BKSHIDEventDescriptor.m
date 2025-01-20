@interface BKSHIDEventDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)descriptorForHIDEvent:(__IOHIDEvent *)a3;
+ (id)descriptorWithEventType:(unsigned int)a3;
- (BKSHIDEventDescriptor)init;
- (BKSHIDEventDescriptor)initWithCoder:(id)a3;
- (BKSHIDEventDescriptor)initWithEventType:(unsigned int)a3;
- (BOOL)describes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)requiresFuzzyMatching;
- (NSString)description;
- (id)_initWithEventType:(unsigned int)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)descriptorByAddingSenderIDToMatchCriteria:(unint64_t)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unsigned)hidEventType;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSHIDEventDescriptor

+ (id)descriptorForHIDEvent:(__IOHIDEvent *)a3
{
  uint64_t Type = IOHIDEventGetType();
  if ((int)Type <= 28)
  {
    if (Type == 1)
    {
      v4 = BKSHIDEventVendorDefinedDescriptor;
      uint64_t IntegerValue = IOHIDEventGetIntegerValue();
      goto LABEL_10;
    }
    if (Type == 3)
    {
      v4 = BKSHIDEventKeyboardDescriptor;
      uint64_t IntegerValue = IOHIDEventGetIntegerValue();
LABEL_10:
      v6 = [(__objc2_class *)v4 descriptorWithPage:IntegerValue usage:IOHIDEventGetIntegerValue()];
      goto LABEL_12;
    }
LABEL_8:
    v6 = +[BKSHIDEventDescriptor descriptorWithEventType:Type];
    goto LABEL_12;
  }
  if (Type != 29)
  {
    if (Type == 39)
    {
      v6 = +[BKSHIDEventGenericGestureDescriptor descriptorWithGenericGestureType:IOHIDEventGetIntegerValue()];
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  v6 = +[BKSHIDEventBiometricDescriptor descriptorWithBiometricEventType:IOHIDEventGetIntegerValue()];
LABEL_12:
  return v6;
}

- (id)_initWithEventType:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKSHIDEventDescriptor;
  id result = [(BKSHIDEventDescriptor *)&v5 init];
  if (result) {
    *((_DWORD *)result + 2) = a3;
  }
  return result;
}

+ (id)descriptorWithEventType:(unsigned int)a3
{
  v3 = [[BKSHIDEventDescriptor alloc] initWithEventType:*(void *)&a3];
  return v3;
}

- (BKSHIDEventDescriptor)initWithEventType:(unsigned int)a3
{
  v4 = self;
  if ((int)a3 > 28)
  {
    if (a3 == 29)
    {
      objc_super v5 = BKSHIDEventBiometricDescriptor;
      goto LABEL_10;
    }
    if (a3 == 39)
    {
      objc_super v5 = BKSHIDEventGenericGestureDescriptor;
      goto LABEL_10;
    }
  }
  else
  {
    if (a3 == 1)
    {
      objc_super v5 = BKSHIDEventVendorDefinedDescriptor;
      goto LABEL_10;
    }
    if (a3 == 3)
    {
      objc_super v5 = BKSHIDEventKeyboardDescriptor;
LABEL_10:
      v6 = (BKSHIDEventDescriptor *)objc_alloc_init(v5);
      goto LABEL_11;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)BKSHIDEventDescriptor;
  v9 = [(BKSHIDEventDescriptor *)&v10 init];
  if (v9) {
    v9->_hidEventuint64_t Type = a3;
  }
  v6 = v9;
  v4 = v6;
LABEL_11:
  v7 = v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0) {
    BOOL v6 = [v4 hidEventType] == self->_hidEventType;
  }

  return v6;
}

- (unsigned)hidEventType
{
  return self->_hidEventType;
}

- (unint64_t)hash
{
  return self->_hidEventType;
}

- (BOOL)describes:(id)a3
{
  hidEventuint64_t Type = self->_hidEventType;
  return !hidEventType || hidEventType == [a3 hidEventType];
}

- (BOOL)matchesHIDEvent:(__IOHIDEvent *)a3
{
  hidEventuint64_t Type = self->_hidEventType;
  return !hidEventType || hidEventType == IOHIDEventGetType();
}

- (BOOL)requiresFuzzyMatching
{
  return self->_hidEventType == 0;
}

- (BKSHIDEventDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];

  uint64_t v6 = [v5 unsignedIntValue];
  return [(BKSHIDEventDescriptor *)self initWithEventType:v6];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  hidEventuint64_t Type = self->_hidEventType;
  id v5 = a3;
  id v6 = [v3 numberWithUnsignedInt:hidEventType];
  [v5 encodeObject:v6 forKey:@"_type"];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v3 = a3;
  [v3 appendString:IOHIDEventTypeGetName() withName:0];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BKSHIDEventDescriptor *)self succinctDescriptionBuilder];
  [(BKSHIDEventDescriptor *)self appendDescriptionToFormatter:v4];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(BKSHIDEventDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKSHIDEventDescriptor *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __36__BKSHIDEventDescriptor_description__block_invoke;
  objc_super v10 = &unk_1E5441BB0;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __36__BKSHIDEventDescriptor_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (BKSHIDEventDescriptor)init
{
  id v4 = [NSString stringWithFormat:@"-init is unavailable"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v5 = NSStringFromSelector(a2);
    id v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    objc_super v10 = v5;
    __int16 v11 = 2114;
    id v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    v16 = @"BKSHIDEventDescriptor.m";
    __int16 v17 = 1024;
    int v18 = 69;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18AA0B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  id result = (BKSHIDEventDescriptor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (id)descriptorByAddingSenderIDToMatchCriteria:(unint64_t)a3
{
  id v3 = [[BKSHIDEventSenderSpecificDescriptor alloc] initWithDescriptor:self senderID:a3];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
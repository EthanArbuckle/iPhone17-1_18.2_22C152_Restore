@interface _UTRuntimeConstantType
+ (BOOL)supportsSecureCoding;
+ (id)typeWithIdentifier:(id)a3 bundle:(id)a4 infoPlistKey:(__CFString *)a5;
- (void)dealloc;
@end

@implementation _UTRuntimeConstantType

+ (id)typeWithIdentifier:(id)a3 bundle:(id)a4 infoPlistKey:(__CFString *)a5
{
  if (!a3)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", 0, a4, a5);
    [v10 handleFailureInMethod:a2, a1, @"UTCoreTypes.mm", 685, @"Invalid parameter not satisfying: %@", @"identifier != nil" object file lineNumber description];
  }
  Instance = class_createInstance((Class)a1, 0);
  if (!Instance)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"UTCoreTypes.mm", 688, @"Failed to allocate instance of %@.", a1 object file lineNumber description];
  }
  Instance[2] = [a3 copy];

  return Instance;
}

- (void)dealloc
{
  identifier = self->super._fields.identifier;
  if (identifier) {
    CFRelease(identifier);
  }
  v4.receiver = self;
  v4.super_class = (Class)_UTRuntimeConstantType;
  [(_UTRuntimeConstantType *)&v4 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
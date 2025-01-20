@interface BKSEventDeferringChainIdentity
+ (BKSEventDeferringChainIdentity)new;
+ (BOOL)supportsSecureCoding;
+ (id)build:(id)a3;
+ (id)protobufSchema;
- (BKSEventDeferringChainIdentity)init;
- (BKSEventDeferringChainIdentity)initWithCoder:(id)a3;
- (BKSEventDeferringChainIdentity)initWithDisplay:(id)a3 environment:(id)a4;
- (BKSHIDEventDeferringEnvironment)environment;
- (BKSHIDEventDisplay)display;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_init;
- (id)_initWithCopyOf:(id *)a1;
- (id)didFinishProtobufDecodingWithError:(id *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BKSEventDeferringChainIdentity

- (BKSHIDEventDeferringEnvironment)environment
{
  return self->_environment;
}

- (unint64_t)hash
{
  [(BKSHIDEventDisplay *)self->_display hash];
  [(BKSHIDEventDeferringEnvironment *)self->_environment hash];
  return BSHashPurifyNS();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_display, 0);
}

- (BKSEventDeferringChainIdentity)initWithDisplay:(id)a3 environment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (BKSEventDeferringChainIdentity *)-[BKSEventDeferringChainIdentity _init](self);
  if (v8)
  {
    if (!v6)
    {
      id v6 = +[BKSHIDEventDisplay nullDisplay];
    }
    objc_storeStrong((id *)&v8->_display, v6);
    objc_storeStrong((id *)&v8->_environment, a4);
  }

  return v8;
}

- (id)_init
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      uint64_t v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        v4 = [MEMORY[0x1E4F28B00] currentHandler];
        [v4 handleFailureInMethod:sel__init object:v1 file:@"BKSEventDeferringChainIdentity.m" lineNumber:63 description:@"BKSEventDeferringChainIdentity cannot be subclassed"];
      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSEventDeferringChainIdentity;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (BSEqualObjects()) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BKSHIDEventDisplay)display
{
  return self->_display;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  id v4 = (id)[v6 appendObject:self->_environment withName:0];
  id v5 = (id)[v6 appendObject:self->_display withName:@"display"];
}

- (id)_initWithCopyOf:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = (id *)-[BKSEventDeferringChainIdentity _init](a1);
    a1 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 1, v3[1]);
      objc_storeStrong(a1 + 2, v3[2]);
    }
  }

  return a1;
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  if (self->_display)
  {
    if (self->_environment)
    {
      id v4 = self;
      goto LABEL_7;
    }
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28798];
    id v7 = &unk_1ED76CA20;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28798];
    id v7 = &unk_1ED76C9F8;
  }
  id v8 = [v5 errorWithDomain:v6 code:5 userInfo:v7];
  id v4 = 0;
  *a3 = v8;
LABEL_7:
  return v4;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [BKSMutableEventDeferringChainIdentity alloc];
  return -[BKSEventDeferringChainIdentity _initWithCopyOf:]((id *)&v4->super.super.isa, self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  display = self->_display;
  id v7 = v4;
  if (display)
  {
    [v4 encodeObject:display forKey:@"display"];
    id v4 = v7;
  }
  environment = self->_environment;
  if (environment)
  {
    [v7 encodeObject:environment forKey:@"environment"];
    id v4 = v7;
  }
}

- (BKSEventDeferringChainIdentity)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)BKSEventDeferringChainIdentity;
  id v3 = a3;
  id v4 = [(BKSEventDeferringChainIdentity *)&v10 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"display", v10.receiver, v10.super_class);
  display = v4->_display;
  v4->_display = (BKSHIDEventDisplay *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"environment"];

  environment = v4->_environment;
  v4->_environment = (BKSHIDEventDeferringEnvironment *)v7;

  return v4;
}

- (BKSEventDeferringChainIdentity)init
{
  id v3 = [MEMORY[0x1E4F28B00] currentHandler];
  id v4 = [NSString stringWithUTF8String:"-[BKSEventDeferringChainIdentity init]"];
  [v3 handleFailureInFunction:v4 file:@"BKSEventDeferringChainIdentity.m" lineNumber:52 description:@"cannot directly allocate BKSEventDeferringChainIdentity"];

  return 0;
}

+ (id)protobufSchema
{
  return (id)[MEMORY[0x1E4F4F808] buildSchemaForClass:a1 builder:&__block_literal_global_9612];
}

void __48__BKSEventDeferringChainIdentity_protobufSchema__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_display"];
  [v2 addField:"_environment"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BKSEventDeferringChainIdentity)new
{
  id v2 = [MEMORY[0x1E4F28B00] currentHandler];
  id v3 = [NSString stringWithUTF8String:"+[BKSEventDeferringChainIdentity new]"];
  [v2 handleFailureInFunction:v3 file:@"BKSEventDeferringChainIdentity.m" lineNumber:57 description:@"cannot directly allocate BKSEventDeferringChainIdentity"];

  return 0;
}

+ (id)build:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = -[BKSEventDeferringChainIdentity _init]([BKSMutableEventDeferringChainIdentity alloc]);
  v3[2](v3, v4);

  uint64_t v5 = (void *)[v4 copy];
  return v5;
}

@end
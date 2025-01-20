@interface CHSWidgetRenderScheme
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOpaque;
- (BOOL)isValid;
- (CHSWidgetRenderScheme)init;
- (CHSWidgetRenderScheme)initWithBSXPCCoder:(id)a3;
- (CHSWidgetRenderScheme)initWithCoder:(id)a3;
- (CHSWidgetRenderScheme)initWithRenderingMode:(unint64_t)a3;
- (CHSWidgetRenderScheme)initWithRenderingMode:(unint64_t)a3 backgroundViewPolicy:(unint64_t)a4;
- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3;
- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3 backgroundViewPolicy:(unint64_t)a4;
- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3 opaque:(BOOL)a4;
- (NSString)description;
- (id)_compatibilityRenderSchemesFromDeprecatedRenderingModes;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)backgroundViewPolicy;
- (unint64_t)hash;
- (unint64_t)renderingMode;
- (unint64_t)renderingModes;
- (void)_initWithWidgetRenderScheme:(void *)a1;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetRenderScheme

- (CHSWidgetRenderScheme)init
{
  return [(CHSWidgetRenderScheme *)self initWithRenderingMode:0];
}

- (CHSWidgetRenderScheme)initWithRenderingMode:(unint64_t)a3
{
  return [(CHSWidgetRenderScheme *)self initWithRenderingMode:a3 backgroundViewPolicy:0];
}

- (CHSWidgetRenderScheme)initWithRenderingMode:(unint64_t)a3 backgroundViewPolicy:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHSWidgetRenderScheme;
  result = [(CHSWidgetRenderScheme *)&v7 init];
  if (result)
  {
    result->_renderingMode = a3;
    result->_backgroundViewPolicy = a4;
  }
  return result;
}

- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3
{
  return [(CHSWidgetRenderScheme *)self initWithRenderingModes:a3 backgroundViewPolicy:0];
}

- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3 backgroundViewPolicy:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CHSWidgetRenderScheme;
  result = [(CHSWidgetRenderScheme *)&v7 init];
  if (result)
  {
    result->_backgroundViewPolicy = a4;
    result->_renderingModes = a3;
  }
  return result;
}

- (void)_initWithWidgetRenderScheme:(void *)a1
{
  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)CHSWidgetRenderScheme;
    v4 = objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      v4[1] = v3[1];
      v4[3] = v3[3];
      v4[2] = v3[2];
    }
  }

  return a1;
}

- (unint64_t)renderingModes
{
  return self->_renderingModes;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[CHSMutableWidgetRenderScheme allocWithZone:a3];
  return -[CHSWidgetRenderScheme _initWithWidgetRenderScheme:](v4, self);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendUnsignedInteger:self->_renderingMode];
  id v5 = (id)[v3 appendUnsignedInteger:self->_renderingModes];
  id v6 = (id)[v3 appendUnsignedInteger:self->_backgroundViewPolicy];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builder];
  unint64_t renderingMode = self->_renderingMode;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __33__CHSWidgetRenderScheme_isEqual___block_invoke;
  v20[3] = &unk_1E56C84B8;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendUnsignedInteger:renderingMode counterpart:v20];
  unint64_t renderingModes = self->_renderingModes;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __33__CHSWidgetRenderScheme_isEqual___block_invoke_2;
  v18[3] = &unk_1E56C84B8;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendUnsignedInteger:renderingModes counterpart:v18];
  unint64_t backgroundViewPolicy = self->_backgroundViewPolicy;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __33__CHSWidgetRenderScheme_isEqual___block_invoke_3;
  v16[3] = &unk_1E56C84B8;
  id v13 = v10;
  id v17 = v13;
  id v14 = (id)[v5 appendUnsignedInteger:backgroundViewPolicy counterpart:v16];
  LOBYTE(v10) = [v5 isEqual];

  return (char)v10;
}

uint64_t __33__CHSWidgetRenderScheme_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

uint64_t __33__CHSWidgetRenderScheme_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

uint64_t __33__CHSWidgetRenderScheme_isEqual___block_invoke_3(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 16);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = NSStringFromCHSWidgetRenderingMode(self->_renderingMode);
  [v3 appendString:v4 withName:@"renderingMode"];

  unint64_t renderingModes = self->_renderingModes;
  if (renderingModes)
  {
    id v6 = NSStringFromCHSWidgetRenderingModes(renderingModes);
    [v3 appendString:v6 withName:@"renderingModes"];
  }
  id v7 = NSStringFromCHSWidgetBackgroundViewPolicy(self->_backgroundViewPolicy);
  [v3 appendString:v7 withName:@"backgroundViewPolicy"];

  id v8 = [v3 build];

  return (NSString *)v8;
}

- (BOOL)isValid
{
  return CHSWidgetRenderingModesIsValid(self->_renderingModes);
}

- (id)_compatibilityRenderSchemesFromDeprecatedRenderingModes
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  unint64_t renderingModes = self->_renderingModes;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v10 = __80__CHSWidgetRenderScheme__compatibilityRenderSchemesFromDeprecatedRenderingModes__block_invoke;
  id v11 = &unk_1E56C8A10;
  v12 = self;
  id v13 = &v14;
  v3 = v9;
  if (renderingModes)
  {
    char v20 = 0;
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)renderingModes);
    v4.i16[0] = vaddlv_u8(v4);
    int v5 = v4.i32[0];
    if (v4.i32[0])
    {
      unint64_t v6 = 0;
      do
      {
        if (((1 << v6) & renderingModes) != 0)
        {
          ((void (*)(void *))v10)(v3);
          if (v20) {
            break;
          }
          --v5;
        }
        if (v6 > 0x3E) {
          break;
        }
        ++v6;
      }
      while (v5 > 0);
    }
  }

  id v7 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v7;
}

void __80__CHSWidgetRenderScheme__compatibilityRenderSchemesFromDeprecatedRenderingModes__block_invoke(uint64_t a1, unint64_t a2)
{
  if ((a2 & 2) != 0) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = (a2 >> 1) & 2;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    unint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id v7 = [[CHSWidgetRenderScheme alloc] initWithRenderingMode:v3 backgroundViewPolicy:*(void *)(*(void *)(a1 + 32) + 16)];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "addObject:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:LODWORD(self->_renderingMode) forKey:@"renderingMode"];
  [v4 encodeInt32:LODWORD(self->_backgroundViewPolicy) forKey:@"backgroundViewPolicy"];
}

- (CHSWidgetRenderScheme)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CHSWidgetRenderScheme;
  uint64_t v5 = [(CHSWidgetRenderScheme *)&v19 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"renderingModes"])
    {
      int v6 = [v4 decodeInt32ForKey:@"renderingModes"];
      uint64_t v7 = v6;
      v5->_unint64_t renderingModes = v6;
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      uint64_t v16 = (void (*)(uint64_t *))__39__CHSWidgetRenderScheme_initWithCoder___block_invoke;
      id v17 = &unk_1E56C94A0;
      v18 = v5;
      id v8 = &v14;
      if (v6)
      {
        char v20 = 0;
        uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
        v9.i16[0] = vaddlv_u8(v9);
        int v10 = v9.i32[0];
        if (v9.i32[0])
        {
          unint64_t v11 = 0;
          do
          {
            if (((1 << v11) & v7) != 0)
            {
              v16(v8);
              if (v20) {
                break;
              }
              --v10;
            }
            if (v11 > 0x3E) {
              break;
            }
            ++v11;
          }
          while (v10 > 0);
        }
      }
    }
    if (objc_msgSend(v4, "containsValueForKey:", @"renderingMode", v14, v15)) {
      v5->_unint64_t renderingMode = (int)[v4 decodeInt32ForKey:@"renderingMode"];
    }
    if ([v4 containsValueForKey:@"backgroundViewPolicy"]) {
      unint64_t v12 = (int)[v4 decodeInt32ForKey:@"backgroundViewPolicy"];
    }
    else {
      unint64_t v12 = [v4 decodeBoolForKey:@"opaque"] ^ 1;
    }
    v5->_unint64_t backgroundViewPolicy = v12;
  }

  return v5;
}

uint64_t __39__CHSWidgetRenderScheme_initWithCoder___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    *(void *)(*(void *)(result + 32) + 8) = a2;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeUInt64:self->_renderingMode forKey:@"renderingMode"];
  [v4 encodeUInt64:self->_backgroundViewPolicy forKey:@"backgroundViewPolicy"];
}

- (CHSWidgetRenderScheme)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[CHSWidgetRenderScheme initWithRenderingMode:backgroundViewPolicy:](self, "initWithRenderingMode:backgroundViewPolicy:", [v4 decodeUInt64ForKey:@"renderingMode"], objc_msgSend(v4, "decodeUInt64ForKey:", @"backgroundViewPolicy"));

  return v5;
}

- (CHSWidgetRenderScheme)initWithRenderingModes:(unint64_t)a3 opaque:(BOOL)a4
{
  return [(CHSWidgetRenderScheme *)self initWithRenderingModes:a3 backgroundViewPolicy:!a4];
}

- (BOOL)isOpaque
{
  return self->_backgroundViewPolicy == 0;
}

- (unint64_t)backgroundViewPolicy
{
  return self->_backgroundViewPolicy;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

@end
@interface BLSBacklightSceneVisualState
+ (BOOL)supportsSecureCoding;
- (BLSBacklightSceneVisualState)init;
- (BLSBacklightSceneVisualState)initWithActiveAppearance:(int64_t)a3 updateFidelity:(int64_t)a4 adjustedLuminance:(int64_t)a5;
- (BLSBacklightSceneVisualState)initWithActiveAppearance:(int64_t)a3 updateFidelity:(int64_t)a4 adjustedLuminance:(int64_t)a5 dimmed:(BOOL)a6;
- (BLSBacklightSceneVisualState)initWithCoder:(id)a3;
- (BLSBacklightSceneVisualState)initWithXPCDictionary:(id)a3;
- (BOOL)isDimmed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEssentiallyEqualToVisualState:(id)a3;
- (NSString)description;
- (id)bls_shortLoggingString;
- (id)newVisualStateWithUpdateFidelity:(int64_t)a3;
- (int64_t)activeAppearance;
- (int64_t)adjustedLuminance;
- (int64_t)expectedFidelity;
- (int64_t)grantedFidelity;
- (int64_t)updateFidelity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BLSBacklightSceneVisualState

- (int64_t)adjustedLuminance
{
  return self->_adjustedLuminance;
}

uint64_t __40__BLSBacklightSceneVisualState_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) isDimmed];
}

uint64_t __40__BLSBacklightSceneVisualState_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) adjustedLuminance];
}

uint64_t __40__BLSBacklightSceneVisualState_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateFidelity];
}

uint64_t __40__BLSBacklightSceneVisualState_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) activeAppearance];
}

- (int64_t)updateFidelity
{
  return self->_updateFidelity;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (int64_t)activeAppearance
{
  return self->_activeAppearance;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t activeAppearance = self->_activeAppearance;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __40__BLSBacklightSceneVisualState_isEqual___block_invoke;
  v28[3] = &unk_1E6107400;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendInteger:activeAppearance counterpart:v28];
  int64_t updateFidelity = self->_updateFidelity;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __40__BLSBacklightSceneVisualState_isEqual___block_invoke_2;
  v26[3] = &unk_1E6107400;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendInteger:updateFidelity counterpart:v26];
  int64_t adjustedLuminance = self->_adjustedLuminance;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40__BLSBacklightSceneVisualState_isEqual___block_invoke_3;
  v24[3] = &unk_1E6107400;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendInteger:adjustedLuminance counterpart:v24];
  uint64_t dimmed = self->_dimmed;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __40__BLSBacklightSceneVisualState_isEqual___block_invoke_4;
  v22 = &unk_1E6107880;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendBool:dimmed counterpart:&v19];
  LOBYTE(dimmed) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return dimmed;
}

- (BLSBacklightSceneVisualState)initWithActiveAppearance:(int64_t)a3 updateFidelity:(int64_t)a4 adjustedLuminance:(int64_t)a5
{
  return [(BLSBacklightSceneVisualState *)self initWithActiveAppearance:a3 updateFidelity:a4 adjustedLuminance:a5 dimmed:0];
}

- (BLSBacklightSceneVisualState)initWithActiveAppearance:(int64_t)a3 updateFidelity:(int64_t)a4 adjustedLuminance:(int64_t)a5 dimmed:(BOOL)a6
{
  v12.receiver = self;
  v12.super_class = (Class)BLSBacklightSceneVisualState;
  result = [(BLSBacklightSceneVisualState *)&v12 init];
  if (result)
  {
    result->_int64_t activeAppearance = a3;
    result->_int64_t updateFidelity = a4;
    result->_int64_t adjustedLuminance = a5;
    BOOL v11 = a5 == 2 && a6;
    result->_uint64_t dimmed = v11;
  }
  return result;
}

- (BLSBacklightSceneVisualState)init
{
  return [(BLSBacklightSceneVisualState *)self initWithActiveAppearance:1 updateFidelity:3 adjustedLuminance:2];
}

- (id)newVisualStateWithUpdateFidelity:(int64_t)a3
{
  v5 = [BLSBacklightSceneVisualState alloc];
  int64_t activeAppearance = self->_activeAppearance;
  int64_t adjustedLuminance = self->_adjustedLuminance;
  BOOL dimmed = self->_dimmed;

  return [(BLSBacklightSceneVisualState *)v5 initWithActiveAppearance:activeAppearance updateFidelity:a3 adjustedLuminance:adjustedLuminance dimmed:dimmed];
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_activeAppearance == 1 withName:@"active"];
  v5 = NSStringFromBLSUpdateFidelity(self->_updateFidelity);
  [v3 appendString:v5 withName:@"fidelity"];

  int64_t adjustedLuminance = self->_adjustedLuminance;
  id v7 = @"Off";
  if (adjustedLuminance == 1) {
    id v7 = @"Low";
  }
  if (adjustedLuminance == 2) {
    id v8 = @"Full";
  }
  else {
    id v8 = v7;
  }
  [v3 appendString:v8 withName:@"adjustedLuminance"];
  id v9 = (id)[v3 appendBool:self->_dimmed withName:@"dimmed" ifEqualTo:1];
  id v10 = [v3 build];

  return (NSString *)v10;
}

- (id)bls_shortLoggingString
{
  v3 = objc_opt_new();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __54__BLSBacklightSceneVisualState_bls_shortLoggingString__block_invoke;
  id v10 = &unk_1E6106FA8;
  id v11 = v3;
  objc_super v12 = self;
  id v4 = v3;
  [v4 appendProem:0 block:&v7];
  v5 = objc_msgSend(v4, "description", v7, v8, v9, v10);

  return v5;
}

id __54__BLSBacklightSceneVisualState_bls_shortLoggingString__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromBLSUpdateFidelity(*(void *)(*(void *)(a1 + 40) + 24));
  id v4 = (id)[v2 appendObject:v3 withName:0];

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 32);
  v6 = @"Off";
  if (v5 == 1) {
    v6 = @"Low";
  }
  if (v5 == 2) {
    uint64_t v7 = @"Full";
  }
  else {
    uint64_t v7 = v6;
  }
  id v8 = (id)[*(id *)(a1 + 32) appendObject:v7 withName:0];
  if (*(void *)(*(void *)(a1 + 40) + 16) == 1) {
    id v9 = @"active";
  }
  else {
    id v9 = @"inactive";
  }
  id result = (id)[*(id *)(a1 + 32) appendObject:v9 withName:0];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 8)) {
    return (id)[*(id *)(a1 + 32) appendObject:@"dimmed" withName:0];
  }
  return result;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_activeAppearance];
  id v5 = (id)[v3 appendInteger:self->_updateFidelity];
  id v6 = (id)[v3 appendInteger:self->_adjustedLuminance];
  id v7 = (id)[v3 appendBool:self->_dimmed];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (BOOL)isEssentiallyEqualToVisualState:(id)a3
{
  id v4 = a3;
  if ([(BLSBacklightSceneVisualState *)self isEqual:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    int dimmed = self->_dimmed;
    if (dimmed == [v4 isDimmed])
    {
      int64_t v7 = [(BLSBacklightSceneVisualState *)self updateFidelity];
      uint64_t v8 = [v4 updateFidelity];
      BOOL v9 = v8 == 1;
      if (v7 != 2) {
        BOOL v9 = 0;
      }
      if (v7 == 1) {
        BOOL v5 = v8 == 2;
      }
      else {
        BOOL v5 = v9;
      }
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (int64_t)grantedFidelity
{
  return self->_updateFidelity;
}

- (int64_t)expectedFidelity
{
  if (self->_activeAppearance) {
    return self->_updateFidelity;
  }
  else {
    return 2;
  }
}

- (BLSBacklightSceneVisualState)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "act");
  int64_t v6 = xpc_dictionary_get_int64(v4, "fid");
  int64_t v7 = xpc_dictionary_get_int64(v4, "lum");
  BOOL v8 = xpc_dictionary_get_BOOL(v4, "dim");

  return [(BLSBacklightSceneVisualState *)self initWithActiveAppearance:int64 updateFidelity:v6 adjustedLuminance:v7 dimmed:v8];
}

- (void)encodeWithXPCDictionary:(id)a3
{
  int64_t activeAppearance = self->_activeAppearance;
  xpc_object_t xdict = a3;
  xpc_dictionary_set_int64(xdict, "act", activeAppearance);
  xpc_dictionary_set_int64(xdict, "fid", self->_updateFidelity);
  xpc_dictionary_set_int64(xdict, "lum", self->_adjustedLuminance);
  xpc_dictionary_set_BOOL(xdict, "dim", self->_dimmed);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightSceneVisualState)initWithCoder:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  int64_t v6 = [v4 stringWithUTF8String:"act"];
  uint64_t v7 = [v5 decodeIntegerForKey:v6];

  BOOL v8 = [NSString stringWithUTF8String:"fid"];
  uint64_t v9 = [v5 decodeIntegerForKey:v8];

  id v10 = [NSString stringWithUTF8String:"lum"];
  uint64_t v11 = [v5 decodeIntegerForKey:v10];

  objc_super v12 = [NSString stringWithUTF8String:"dim"];
  uint64_t v13 = [v5 decodeBoolForKey:v12];

  return [(BLSBacklightSceneVisualState *)self initWithActiveAppearance:v7 updateFidelity:v9 adjustedLuminance:v11 dimmed:v13];
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t activeAppearance_low = SLODWORD(self->_activeAppearance);
  id v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithUTF8String:"act"];
  [v6 encodeInteger:activeAppearance_low forKey:v7];

  uint64_t updateFidelity_low = SLODWORD(self->_updateFidelity);
  uint64_t v9 = [NSString stringWithUTF8String:"fid"];
  [v6 encodeInteger:updateFidelity_low forKey:v9];

  uint64_t adjustedLuminance_low = SLODWORD(self->_adjustedLuminance);
  uint64_t v11 = [NSString stringWithUTF8String:"lum"];
  [v6 encodeInteger:adjustedLuminance_low forKey:v11];

  BOOL dimmed = self->_dimmed;
  id v13 = [NSString stringWithUTF8String:"dim"];
  [v6 encodeBool:dimmed forKey:v13];
}

@end
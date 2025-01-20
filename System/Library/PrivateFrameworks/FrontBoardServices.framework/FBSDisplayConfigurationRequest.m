@interface FBSDisplayConfigurationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CGSize)logicalScale;
- (CGSize)nativePixelSize;
- (FBSDisplayConfigurationRequest)init;
- (FBSDisplayConfigurationRequest)initWithCoder:(id)a3;
- (FBSDisplayConfigurationRequest)initWithXPCDictionary:(id)a3;
- (NSString)description;
- (double)pointScale;
- (double)refreshRate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)hdrMode;
- (int64_t)overscanCompensation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation FBSDisplayConfigurationRequest

- (FBSDisplayConfigurationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBSDisplayConfigurationRequest;
  result = [(FBSDisplayConfigurationRequest *)&v3 init];
  if (result)
  {
    result->_overscanCompensation = -1;
    result->_hdrMode = -1;
  }
  return result;
}

- (unint64_t)hash
{
  objc_super v3 = [off_1E58F4508 builder];
  id v4 = (id)[v3 appendInteger:self->_overscanCompensation];
  id v5 = [v3 appendCGSize:self->_nativePixelSize.width, self->_nativePixelSize.height];
  id v6 = (id)[v3 appendCGFloat:self->_pointScale];
  id v7 = (id)[v3 appendDouble:self->_refreshRate];
  id v8 = (id)[v3 appendInteger:self->_hdrMode];
  id v9 = [v3 appendCGSize:self->_logicalScale.width, self->_logicalScale.height];
  unint64_t v10 = [v3 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [off_1E58F4500 builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  int64_t overscanCompensation = self->_overscanCompensation;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke;
  v38[3] = &unk_1E58F5600;
  id v7 = v4;
  id v39 = v7;
  id v8 = (id)[v5 appendInteger:overscanCompensation counterpart:v38];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_2;
  v36[3] = &unk_1E58F5E38;
  id v9 = v7;
  id v37 = v9;
  id v10 = (id)[v5 appendCGSize:v36 counterpart:self->_nativePixelSize.width, self->_nativePixelSize.height];
  double pointScale = self->_pointScale;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_3;
  v34[3] = &unk_1E58F5E60;
  id v12 = v9;
  id v35 = v12;
  id v13 = (id)[v5 appendCGFloat:v34 counterpart:pointScale];
  double refreshRate = self->_refreshRate;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_4;
  v32[3] = &unk_1E58F5E60;
  id v15 = v12;
  id v33 = v15;
  id v16 = (id)[v5 appendDouble:v32 counterpart:refreshRate];
  int64_t hdrMode = self->_hdrMode;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_5;
  v30[3] = &unk_1E58F5600;
  id v18 = v15;
  id v31 = v18;
  id v19 = (id)[v5 appendInteger:hdrMode counterpart:v30];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  v27 = __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_6;
  v28 = &unk_1E58F5E38;
  id v29 = v18;
  double width = self->_logicalScale.width;
  double height = self->_logicalScale.height;
  id v22 = v18;
  id v23 = [v5 appendCGSize:&v25 counterpart:width, height];
  LOBYTE(v18) = [v5 isEqual:v25 v26 v27 v28];

  return (char)v18;
}

uint64_t __42__FBSDisplayConfigurationRequest_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8);
}

double __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_2(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 16);
}

double __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 32);
}

double __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 40);
}

uint64_t __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_5(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 48);
}

double __42__FBSDisplayConfigurationRequest_isEqual___block_invoke_6(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 56);
}

- (NSString)description
{
  return (NSString *)[(FBSDisplayConfigurationRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result = [(FBSDisplayConfigurationRequest *)+[FBSMutableDisplayConfigurationRequest allocWithZone:a3] init];
  *((void *)result + 1) = self->_overscanCompensation;
  *((_OWORD *)result + 1) = self->_nativePixelSize;
  *((void *)result + 4) = *(void *)&self->_pointScale;
  *((void *)result + 5) = *(void *)&self->_refreshRate;
  *((void *)result + 6) = self->_hdrMode;
  *(CGSize *)((char *)result + 56) = self->_logicalScale;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FBSDisplayConfigurationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSDisplayConfigurationRequest *)self init];
  if (v5)
  {
    v5->_int64_t overscanCompensation = [v4 decodeInt64ForKey:@"overscanCompensation"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nativePixelSize"];
    id v7 = (void *)v6;
    if (v6)
    {
      v5->_nativePixelSize.double width = MEMORY[0x19F398970](v6);
      v5->_nativePixelSize.double height = v8;
    }
    else
    {
      v5->_nativePixelSize = (CGSize)*MEMORY[0x1E4F1DB30];
    }
    [v4 decodeFloatForKey:@"pointScale"];
    v5->_double pointScale = v9;
    [v4 decodeDoubleForKey:@"refreshRate"];
    v5->_double refreshRate = v10;
    v5->_int64_t hdrMode = [v4 decodeInt64ForKey:@"hdrMode"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logicalScale"];
    id v12 = (void *)v11;
    if (v11)
    {
      v5->_logicalScale.double width = MEMORY[0x19F398970](v11);
      v5->_logicalScale.double height = v13;
    }
    else
    {
      v5->_logicalScale = (CGSize)*MEMORY[0x1E4F1DB30];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (FBSDisplayConfigurationRequest)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSDisplayConfigurationRequest *)self init];
  if (v5)
  {
    uint64_t v6 = xpc_dictionary_get_value(v4, (const char *)[@"overscanCompensation" UTF8String]);
    id v7 = v6;
    CGFloat v8 = (objc_class *)MEMORY[0x1E4F145C0];
    if (v6)
    {
      if (object_getClass(v6) == v8) {
        v5->_int64_t overscanCompensation = xpc_int64_get_value(v7);
      }
    }
    [@"nativePixelSize" UTF8String];
    BSDeserializeCGSizeFromXPCDictionaryWithKey();
  }

  return 0;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict = a3;
  if (xdict)
  {
    if (self->_overscanCompensation != -1) {
      xpc_dictionary_set_int64(xdict, (const char *)[@"overscanCompensation" UTF8String], self->_overscanCompensation);
    }
    BSFloatIsZero();
  }
}

- (id)succinctDescription
{
  v2 = [(FBSDisplayConfigurationRequest *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[off_1E58F44F0 builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(FBSDisplayConfigurationRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(FBSDisplayConfigurationRequest *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__FBSDisplayConfigurationRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E58F4AB0;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

void __72__FBSDisplayConfigurationRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v2 != -1)
  {
    objc_super v3 = *(void **)(a1 + 40);
    id v4 = FBSDisplayOverscanCompensationDescription(v2);
    [v3 appendString:v4 withName:@"overscanCompensation"];
  }
  BSFloatIsZero();
}

- (int64_t)overscanCompensation
{
  return self->_overscanCompensation;
}

- (CGSize)nativePixelSize
{
  double width = self->_nativePixelSize.width;
  double height = self->_nativePixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)pointScale
{
  return self->_pointScale;
}

- (double)refreshRate
{
  return self->_refreshRate;
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

- (CGSize)logicalScale
{
  double width = self->_logicalScale.width;
  double height = self->_logicalScale.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end
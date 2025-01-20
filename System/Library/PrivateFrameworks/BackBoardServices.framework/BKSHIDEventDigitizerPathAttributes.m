@interface BKSHIDEventDigitizerPathAttributes
+ (id)protobufSchema;
- (BKSHIDEventAuthenticationMessage)authenticationMessage;
- (BKSWindowServerHitTestSecurityAnalysis)securityAnalysis;
- (BOOL)isEqual:(id)a3;
- (CGPoint)hitTestLocation;
- (CGPoint)preciseLocation;
- (NSString)description;
- (double)hitTestLocationX;
- (double)hitTestLocationY;
- (double)preciseLocationX;
- (double)preciseLocationY;
- (float)zGradient;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)hitTestContextCategory;
- (int64_t)pathIndex;
- (unsigned)locus;
- (unsigned)touchIdentifier;
- (unsigned)userIdentifier;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setAuthenticationMessage:(id)a3;
- (void)setHitTestContextCategory:(int64_t)a3;
- (void)setHitTestLocation:(CGPoint)a3;
- (void)setHitTestLocationX:(double)a3;
- (void)setHitTestLocationY:(double)a3;
- (void)setLocus:(unsigned __int8)a3;
- (void)setPathIndex:(int64_t)a3;
- (void)setPreciseLocation:(CGPoint)a3;
- (void)setPreciseLocationX:(double)a3;
- (void)setPreciseLocationY:(double)a3;
- (void)setSecurityAnalysis:(id)a3;
- (void)setTouchIdentifier:(unsigned int)a3;
- (void)setUserIdentifier:(unsigned int)a3;
- (void)setZGradient:(float)a3;
@end

@implementation BKSHIDEventDigitizerPathAttributes

- (float)zGradient
{
  return self->_zGradient;
}

- (unsigned)touchIdentifier
{
  return self->_touchIdentifier;
}

- (BKSWindowServerHitTestSecurityAnalysis)securityAnalysis
{
  return self->_securityAnalysis;
}

- (double)preciseLocationY
{
  return self->_preciseLocation.y;
}

- (double)preciseLocationX
{
  return self->_preciseLocation.x;
}

- (double)hitTestLocationY
{
  return self->_hitTestLocation.y;
}

- (double)hitTestLocationX
{
  return self->_hitTestLocation.x;
}

- (BKSHIDEventAuthenticationMessage)authenticationMessage
{
  return self->_authenticationMessage;
}

- (void)setZGradient:(float)a3
{
  self->_zGradient = a3;
}

- (void)setUserIdentifier:(unsigned int)a3
{
  self->_userIdentifier = a3;
}

- (void)setTouchIdentifier:(unsigned int)a3
{
  self->_touchIdentifier = a3;
}

- (void)setPreciseLocation:(CGPoint)a3
{
  self->_preciseLocation = a3;
}

- (void)setPathIndex:(int64_t)a3
{
  self->_pathIndex = a3;
}

- (void)setLocus:(unsigned __int8)a3
{
  self->_locus = a3;
}

- (void)setHitTestLocation:(CGPoint)a3
{
  self->_hitTestLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityAnalysis, 0);
  objc_storeStrong((id *)&self->_authenticationMessage, 0);
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__BKSHIDEventDigitizerPathAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_281 != -1) {
    dispatch_once(&protobufSchema_onceToken_281, block);
  }
  v2 = (void *)protobufSchema_schema_280;
  return v2;
}

- (unsigned)locus
{
  return self->_locus;
}

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

- (void)setSecurityAnalysis:(id)a3
{
}

- (void)setAuthenticationMessage:(id)a3
{
}

- (void)setHitTestContextCategory:(int64_t)a3
{
  self->_hitTestContextCategory = a3;
}

- (int64_t)hitTestContextCategory
{
  return self->_hitTestContextCategory;
}

- (CGPoint)preciseLocation
{
  double x = self->_preciseLocation.x;
  double y = self->_preciseLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)hitTestLocation
{
  double x = self->_hitTestLocation.x;
  double y = self->_hitTestLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unsigned)userIdentifier
{
  return self->_userIdentifier;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v14 = a3;
  id v4 = (id)[v14 appendInteger:self->_pathIndex withName:@"pathIndex"];
  id v5 = (id)[v14 appendInteger:self->_touchIdentifier withName:@"touchIdentifier"];
  id v6 = (id)[v14 appendInteger:self->_userIdentifier withName:@"userIdentifier"];
  id v7 = (id)[v14 appendInteger:self->_locus withName:@"locus"];
  v8 = NSStringFromBKSTouchHitTestContextCategory(self->_hitTestContextCategory);
  [v14 appendString:v8 withName:@"hitTestContextCategory"];

  id v9 = (id)[v14 appendFloat:@"zGradient" withName:self->_zGradient];
  id v10 = (id)objc_msgSend(v14, "appendPoint:withName:", @"hitTestLocation", self->_hitTestLocation.x, self->_hitTestLocation.y);
  id v11 = (id)objc_msgSend(v14, "appendPoint:withName:", @"preciseLocation", self->_preciseLocation.x, self->_preciseLocation.y);
  id v12 = (id)[v14 appendObject:self->_authenticationMessage withName:@"authenticationMessage" skipIfNil:1];
  id v13 = (id)[v14 appendObject:self->_securityAnalysis withName:@"securityAnalysis" skipIfNil:1];
}

- (void)setPreciseLocationY:(double)a3
{
  self->_preciseLocation.double y = a3;
}

- (void)setPreciseLocationX:(double)a3
{
  self->_preciseLocation.double x = a3;
}

- (void)setHitTestLocationY:(double)a3
{
  self->_hitTestLocation.double y = a3;
}

- (void)setHitTestLocationX:(double)a3
{
  self->_hitTestLocation.double x = a3;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSHIDEventDigitizerPathAttributes;
  if ([(BKSHIDEventDigitizerPathAttributes *)&v9 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    if (self->_pathIndex == v5[3]
      && self->_touchIdentifier == *((_DWORD *)v5 + 3)
      && self->_userIdentifier == *((_DWORD *)v5 + 4)
      && self->_locus == *((unsigned __int8 *)v5 + 8)
      && self->_hitTestContextCategory == v5[4]
      && self->_zGradient == *((float *)v5 + 5)
      && self->_hitTestLocation.x == *((double *)v5 + 7)
      && self->_hitTestLocation.y == *((double *)v5 + 8)
      && self->_preciseLocation.x == *((double *)v5 + 9)
      && self->_preciseLocation.y == *((double *)v5 + 10))
    {
      v8 = v5;
      if (BSEqualObjects()) {
        char v6 = BSEqualObjects();
      }
      else {
        char v6 = 0;
      }
      id v5 = v8;
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  *(void *)(v4 + 24) = self->_pathIndex;
  *(_DWORD *)(v4 + 12) = self->_touchIdentifier;
  *(_DWORD *)(v4 + 16) = self->_userIdentifier;
  *(void *)(v4 + 32) = self->_hitTestContextCategory;
  *(unsigned char *)(v4 + 8) = self->_locus;
  *(float *)(v4 + 20) = self->_zGradient;
  *(CGPoint *)(v4 + 56) = self->_hitTestLocation;
  *(CGPoint *)(v4 + 72) = self->_preciseLocation;
  objc_storeStrong((id *)(v4 + 40), self->_authenticationMessage);
  objc_storeStrong((id *)(v4 + 48), self->_securityAnalysis);
  return (id)v4;
}

uint64_t __52__BKSHIDEventDigitizerPathAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  protobufSchema_schema_280 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_283];
  return MEMORY[0x1F41817F8]();
}

void __52__BKSHIDEventDigitizerPathAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_pathIndex"];
  [v2 addField:"_touchIdentifier"];
  [v2 addField:"_userIdentifier"];
  [v2 addField:"_hitTestContextCategory"];
  [v2 addField:"_locus"];
  [v2 addField:"_zGradient"];
  [v2 addField:"_hitTestLocation"];
  [v2 addField:"_preciseLocation"];
  [v2 addField:"_authenticationMessage"];
  [v2 addField:"_securityAnalysis"];
}

@end
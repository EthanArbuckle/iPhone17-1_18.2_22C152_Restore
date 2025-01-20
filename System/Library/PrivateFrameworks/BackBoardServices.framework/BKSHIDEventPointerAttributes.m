@interface BKSHIDEventPointerAttributes
+ (id)protobufSchema;
- (BKSWindowServerHitTestSecurityAnalysis)hitTestSecurityAnalysis;
- (BOOL)isEqual:(id)a3;
- (CGPoint)acceleratedRelativePosition;
- (CGPoint)unacceleratedRelativePosition;
- (NSArray)hitTestContexts;
- (double)acceleratedRelativePositionX;
- (double)acceleratedRelativePositionY;
- (double)unacceleratedRelativePositionX;
- (double)unacceleratedRelativePositionY;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)contextMove;
- (int64_t)contextType;
- (int64_t)fingerDownCount;
- (unsigned)pointerEdgeMask;
- (unsigned)pointerState;
- (unsigned)teleportState;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setAcceleratedRelativePosition:(CGPoint)a3;
- (void)setAcceleratedRelativePositionX:(double)a3;
- (void)setAcceleratedRelativePositionY:(double)a3;
- (void)setContextMove:(int64_t)a3;
- (void)setContextType:(int64_t)a3;
- (void)setFingerDownCount:(int64_t)a3;
- (void)setHitTestContexts:(id)a3;
- (void)setHitTestSecurityAnalysis:(id)a3;
- (void)setPointerEdgeMask:(unsigned __int8)a3;
- (void)setPointerState:(unsigned __int16)a3;
- (void)setTeleportState:(unsigned __int16)a3;
- (void)setUnacceleratedRelativePosition:(CGPoint)a3;
- (void)setUnacceleratedRelativePositionX:(double)a3;
- (void)setUnacceleratedRelativePositionY:(double)a3;
@end

@implementation BKSHIDEventPointerAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitTestSecurityAnalysis, 0);
  objc_storeStrong((id *)&self->_hitTestContexts, 0);
}

- (void)setHitTestSecurityAnalysis:(id)a3
{
}

- (BKSWindowServerHitTestSecurityAnalysis)hitTestSecurityAnalysis
{
  return self->_hitTestSecurityAnalysis;
}

- (void)setTeleportState:(unsigned __int16)a3
{
  self->_teleportState = a3;
}

- (unsigned)teleportState
{
  return self->_teleportState;
}

- (void)setPointerEdgeMask:(unsigned __int8)a3
{
  self->_pointerEdgeMask = a3;
}

- (unsigned)pointerEdgeMask
{
  return self->_pointerEdgeMask;
}

- (void)setFingerDownCount:(int64_t)a3
{
  self->_fingerDownCount = a3;
}

- (int64_t)fingerDownCount
{
  return self->_fingerDownCount;
}

- (void)setAcceleratedRelativePosition:(CGPoint)a3
{
  self->_acceleratedRelativePosition = a3;
}

- (CGPoint)acceleratedRelativePosition
{
  double x = self->_acceleratedRelativePosition.x;
  double y = self->_acceleratedRelativePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setUnacceleratedRelativePosition:(CGPoint)a3
{
  self->_unacceleratedRelativePosition = a3;
}

- (CGPoint)unacceleratedRelativePosition
{
  double x = self->_unacceleratedRelativePosition.x;
  double y = self->_unacceleratedRelativePosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHitTestContexts:(id)a3
{
}

- (NSArray)hitTestContexts
{
  return self->_hitTestContexts;
}

- (void)setContextType:(int64_t)a3
{
  self->_contextType = a3;
}

- (int64_t)contextType
{
  return self->_contextType;
}

- (void)setContextMove:(int64_t)a3
{
  self->_contextMove = a3;
}

- (int64_t)contextMove
{
  return self->_contextMove;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKSHIDEventPointerAttributes;
  [(BKSHIDEventDigitizerAttributes *)&v14 appendDescriptionToFormatter:v4];
  v5 = NSStringFromBKSHIDEventContextType(self->_contextType);
  [v4 appendString:v5 withName:@"contextType"];

  v6 = NSStringFromBKSHIDEventContextMove(self->_contextMove);
  [v4 appendString:v6 withName:@"contextMove"];

  id v7 = (id)[v4 appendObject:self->_hitTestContexts withName:@"hitTestContexts" skipIfNil:1];
  id v8 = (id)[v4 appendObject:self->_hitTestSecurityAnalysis withName:@"hitTestSecurityAnalysis" skipIfNil:1];
  id v9 = (id)objc_msgSend(v4, "appendPoint:withName:", @"unacceleratedRelativePosition", self->_unacceleratedRelativePosition.x, self->_unacceleratedRelativePosition.y);
  id v10 = (id)objc_msgSend(v4, "appendPoint:withName:", @"acceleratedRelativePosition", self->_acceleratedRelativePosition.x, self->_acceleratedRelativePosition.y);
  if (self->_fingerDownCount >= 1) {
    id v11 = (id)objc_msgSend(v4, "appendInteger:withName:");
  }
  if (self->_pointerEdgeMask)
  {
    v12 = NSStringFromBKSHIDEventScreenEdgeMask(self->_pointerEdgeMask);
    [v4 appendString:v12 withName:@"pointerEdgeMask"];
  }
  if (self->_teleportState)
  {
    v13 = NSStringFromBKSHIDEventTeleportState(self->_teleportState);
    [v4 appendString:v13 withName:@"teleportState"];
  }
}

- (void)setPointerState:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 - 1) <= 3u)
  {
    uint64_t v3 = (unsigned __int16)(a3 - 1);
    int64_t v4 = qword_18AA85040[v3];
    int64_t v5 = qword_18AA85060[v3];
    self->_contextType = v4;
    self->_contextMove = v5;
  }
}

- (unsigned)pointerState
{
  unint64_t contextType = self->_contextType;
  if (contextType >= 2)
  {
    if (contextType == 2)
    {
      unint64_t contextMove = self->_contextMove;
      if (contextMove < 3) {
        return 0x300040004uLL >> (16 * contextMove);
      }
    }
LABEL_7:
    LOWORD(v4) = 2;
    return v4;
  }
  unint64_t v3 = self->_contextMove;
  if (v3 >= 3) {
    goto LABEL_7;
  }
  return 0x300010002uLL >> (16 * v3);
}

- (void)setAcceleratedRelativePositionY:(double)a3
{
  self->_acceleratedRelativePosition.double y = a3;
}

- (void)setAcceleratedRelativePositionX:(double)a3
{
  self->_acceleratedRelativePosition.double x = a3;
}

- (double)acceleratedRelativePositionY
{
  return self->_acceleratedRelativePosition.y;
}

- (double)acceleratedRelativePositionX
{
  return self->_acceleratedRelativePosition.x;
}

- (void)setUnacceleratedRelativePositionY:(double)a3
{
  self->_unacceleratedRelativePosition.double y = a3;
}

- (void)setUnacceleratedRelativePositionX:(double)a3
{
  self->_unacceleratedRelativePosition.double x = a3;
}

- (double)unacceleratedRelativePositionY
{
  return self->_unacceleratedRelativePosition.y;
}

- (double)unacceleratedRelativePositionX
{
  return self->_unacceleratedRelativePosition.x;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKSHIDEventPointerAttributes;
  if ([(BKSHIDEventDigitizerAttributes *)&v9 isEqual:v4]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    int64_t v5 = (double *)v4;
    v6 = v5;
    BOOL v7 = self->_contextMove == *((void *)v5 + 15)
      && self->_contextType == *((void *)v5 + 16)
      && BSEqualObjects()
      && BSEqualObjects()
      && self->_unacceleratedRelativePosition.x == v6[20]
      && self->_unacceleratedRelativePosition.y == v6[21]
      && self->_acceleratedRelativePosition.x == v6[22]
      && self->_acceleratedRelativePosition.y == v6[23]
      && self->_fingerDownCount == *((void *)v6 + 18)
      && self->_pointerEdgeMask == *((unsigned __int8 *)v6 + 112)
      && self->_teleportState == *((unsigned __int16 *)v6 + 57);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKSHIDEventPointerAttributes;
  id v5 = -[BKSHIDEventDigitizerAttributes copyWithZone:](&v9, sel_copyWithZone_);
  *((void *)v5 + 16) = self->_contextType;
  *((void *)v5 + 15) = self->_contextMove;
  uint64_t v6 = [(NSArray *)self->_hitTestContexts copyWithZone:a3];
  BOOL v7 = (void *)*((void *)v5 + 17);
  *((void *)v5 + 17) = v6;

  objc_storeStrong((id *)v5 + 19, self->_hitTestSecurityAnalysis);
  *((_OWORD *)v5 + 10) = self->_unacceleratedRelativePosition;
  *((_OWORD *)v5 + 11) = self->_acceleratedRelativePosition;
  *((void *)v5 + 18) = self->_fingerDownCount;
  *((unsigned char *)v5 + 112) = self->_pointerEdgeMask;
  *((_WORD *)v5 + 57) = self->_teleportState;
  return v5;
}

+ (id)protobufSchema
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__BKSHIDEventPointerAttributes_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_516 != -1) {
    dispatch_once(&protobufSchema_onceToken_516, block);
  }
  v2 = (void *)protobufSchema_schema_515;
  return v2;
}

uint64_t __46__BKSHIDEventPointerAttributes_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4F808] buildSchemaForClass:*(void *)(a1 + 32) builder:&__block_literal_global_518];
  uint64_t v2 = protobufSchema_schema_515;
  protobufSchema_schema_515 = v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

void __46__BKSHIDEventPointerAttributes_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 addField:"_contextType"];
  [v2 addField:"_contextMove"];
  [v2 addRepeatingField:"_hitTestContexts" containsClass:objc_opt_class()];
  [v2 addField:"_hitTestSecurityAnalysis"];
  [v2 addField:"_unacceleratedRelativePosition"];
  [v2 addField:"_acceleratedRelativePosition"];
  [v2 addField:"_fingerDownCount"];
  [v2 addField:"_pointerEdgeMask"];
  [v2 addField:"_teleportState"];
}

@end
@interface MTLProfileControl
- (BOOL)isEqual:(id)a3;
- (BOOL)uscEmitPosition;
- (BOOL)uscEmitThreadControlFlow;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)hash;
- (unsigned)uscCliqueTraceLevel;
- (void)setUscCliqueTraceLevel:(unsigned __int8)a3;
- (void)setUscEmitPosition:(BOOL)a3;
- (void)setUscEmitThreadControlFlow:(BOOL)a3;
@end

@implementation MTLProfileControl

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3)
      && self->_uscCliqueTraceLevel == *((unsigned __int8 *)a3 + 8)
      && self->_uscEmitPosition == *((unsigned __int8 *)a3 + 9)
      && self->_uscEmitThreadControlFlow == *((unsigned __int8 *)a3 + 10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_WORD *)result + 4) = *(_WORD *)&self->_uscCliqueTraceLevel;
    *((unsigned char *)result + 10) = self->_uscEmitThreadControlFlow;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  BOOL uscEmitPosition = self->_uscEmitPosition;
  v4[0] = self->_uscCliqueTraceLevel;
  v4[1] = uscEmitPosition;
  v4[2] = self->_uscEmitThreadControlFlow;
  return _MTLHashState(v4, 0xCuLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTLProfileControl;
  return [(MTLProfileControl *)&v4 description];
}

- (id)description
{
  return [(MTLProfileControl *)self formattedDescription:0];
}

- (unsigned)uscCliqueTraceLevel
{
  return self->_uscCliqueTraceLevel;
}

- (void)setUscCliqueTraceLevel:(unsigned __int8)a3
{
  self->_uscCliqueTraceLevel = a3;
}

- (BOOL)uscEmitPosition
{
  return self->_uscEmitPosition;
}

- (void)setUscEmitPosition:(BOOL)a3
{
  self->_BOOL uscEmitPosition = a3;
}

- (BOOL)uscEmitThreadControlFlow
{
  return self->_uscEmitThreadControlFlow;
}

- (void)setUscEmitThreadControlFlow:(BOOL)a3
{
  self->_uscEmitThreadControlFlow = a3;
}

@end
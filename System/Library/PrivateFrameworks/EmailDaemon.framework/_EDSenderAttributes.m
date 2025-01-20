@interface _EDSenderAttributes
- (BOOL)isContact;
- (BOOL)isCoreRecent;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrimarySender;
- (BOOL)isVIP;
- (NSString)description;
- (_EDSenderAttributes)initWithisVIP:(BOOL)a3 isContact:(BOOL)a4 isCoreRecent:(BOOL)a5 isPrimarySender:(BOOL)a6;
- (id)cachedSelf;
- (unint64_t)hash;
- (void)setIsContact:(BOOL)a3;
- (void)setIsCoreRecent:(BOOL)a3;
- (void)setIsPrimarySender:(BOOL)a3;
- (void)setIsVIP:(BOOL)a3;
@end

@implementation _EDSenderAttributes

- (id)cachedSelf
{
  if (cachedSelf_onceToken != -1) {
    dispatch_once(&cachedSelf_onceToken, &__block_literal_global_42);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&cachedSelf_sTableLock);
  v3 = objc_msgSend((id)cachedSelf_sUniqueObjectIDs, "ef_uniquedObject:", self);
  os_unfair_lock_unlock((os_unfair_lock_t)&cachedSelf_sTableLock);

  return v3;
}

- (_EDSenderAttributes)initWithisVIP:(BOOL)a3 isContact:(BOOL)a4 isCoreRecent:(BOOL)a5 isPrimarySender:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_EDSenderAttributes;
  v10 = [(_EDSenderAttributes *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(_EDSenderAttributes *)v10 setIsVIP:v9];
    [(_EDSenderAttributes *)v11 setIsContact:v8];
    [(_EDSenderAttributes *)v11 setIsCoreRecent:v7];
    [(_EDSenderAttributes *)v11 setIsPrimarySender:v6];
  }
  v12 = [(_EDSenderAttributes *)v11 cachedSelf];

  return v12;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [NSNumber numberWithBool:self->_isVIP];
  v5 = [NSNumber numberWithBool:self->_isContact];
  BOOL v6 = [NSNumber numberWithBool:self->_isCoreRecent];
  BOOL v7 = [NSNumber numberWithBool:self->_isPrimarySender];
  BOOL v8 = [v3 stringWithFormat:@"SenderAttributes: isVIP=%@, isContact=%@ isRecent=%@ isPrimary=%@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (unint64_t)hash
{
  BOOL v3 = [(_EDSenderAttributes *)self isVIP];
  BOOL v4 = [(_EDSenderAttributes *)self isContact];
  uint64_t v5 = 1089;
  if (v3) {
    uint64_t v5 = 1122;
  }
  uint64_t v6 = 33 * (v5 + v4) + [(_EDSenderAttributes *)self isCoreRecent];
  return 33 * v6 + [(_EDSenderAttributes *)self isPrimarySender];
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (_EDSenderAttributes *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL v6 = [(_EDSenderAttributes *)self isVIP];
      if (v6 == [(_EDSenderAttributes *)v5 isVIP]
        && (BOOL v7 = [(_EDSenderAttributes *)self isContact],
            v7 == [(_EDSenderAttributes *)v5 isContact])
        && (BOOL v8 = [(_EDSenderAttributes *)self isCoreRecent],
            v8 == [(_EDSenderAttributes *)v5 isCoreRecent]))
      {
        BOOL v11 = [(_EDSenderAttributes *)self isPrimarySender];
        BOOL v9 = v11 ^ [(_EDSenderAttributes *)v5 isPrimarySender] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (BOOL)isVIP
{
  return self->_isVIP;
}

- (void)setIsVIP:(BOOL)a3
{
  self->_isVIP = a3;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (void)setIsContact:(BOOL)a3
{
  self->_isContact = a3;
}

- (BOOL)isCoreRecent
{
  return self->_isCoreRecent;
}

- (void)setIsCoreRecent:(BOOL)a3
{
  self->_isCoreRecent = a3;
}

- (BOOL)isPrimarySender
{
  return self->_isPrimarySender;
}

- (void)setIsPrimarySender:(BOOL)a3
{
  self->_isPrimarySender = a3;
}

@end
@interface MPPMediaPredicate
- (BOOL)hasCompoundPredicate;
- (BOOL)hasConditionalPredicate;
- (BOOL)hasPersistentIDsPredicate;
- (BOOL)hasPropertyPredicate;
- (BOOL)hasSearchStringPredicate;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MPPCompoundPredicate)compoundPredicate;
- (MPPConditionalPredicate)conditionalPredicate;
- (MPPPersistentIDsPredicate)persistentIDsPredicate;
- (MPPPropertyPredicate)propertyPredicate;
- (MPPSearchStringPredicate)searchStringPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)setCompoundPredicate:(id)a3;
- (void)setConditionalPredicate:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPersistentIDsPredicate:(id)a3;
- (void)setPropertyPredicate:(id)a3;
- (void)setSearchStringPredicate:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPPMediaPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchStringPredicate, 0);
  objc_storeStrong((id *)&self->_propertyPredicate, 0);
  objc_storeStrong((id *)&self->_persistentIDsPredicate, 0);
  objc_storeStrong((id *)&self->_conditionalPredicate, 0);

  objc_storeStrong((id *)&self->_compoundPredicate, 0);
}

- (void)setSearchStringPredicate:(id)a3
{
}

- (MPPSearchStringPredicate)searchStringPredicate
{
  return self->_searchStringPredicate;
}

- (void)setPersistentIDsPredicate:(id)a3
{
}

- (MPPPersistentIDsPredicate)persistentIDsPredicate
{
  return self->_persistentIDsPredicate;
}

- (void)setConditionalPredicate:(id)a3
{
}

- (MPPConditionalPredicate)conditionalPredicate
{
  return self->_conditionalPredicate;
}

- (void)setCompoundPredicate:(id)a3
{
}

- (MPPCompoundPredicate)compoundPredicate
{
  return self->_compoundPredicate;
}

- (void)setPropertyPredicate:(id)a3
{
}

- (MPPPropertyPredicate)propertyPredicate
{
  return self->_propertyPredicate;
}

- (int)type
{
  return self->_type;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(MPPPropertyPredicate *)self->_propertyPredicate hash] ^ v3;
  unint64_t v5 = [(MPPCompoundPredicate *)self->_compoundPredicate hash];
  unint64_t v6 = v4 ^ v5 ^ [(MPPConditionalPredicate *)self->_conditionalPredicate hash];
  unint64_t v7 = [(MPPPersistentIDsPredicate *)self->_persistentIDsPredicate hash];
  return v6 ^ v7 ^ [(MPPSearchStringPredicate *)self->_searchStringPredicate hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_type != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  propertyPredicate = self->_propertyPredicate;
  if ((unint64_t)propertyPredicate | *((void *)v4 + 4)
    && !-[MPPPropertyPredicate isEqual:](propertyPredicate, "isEqual:"))
  {
    goto LABEL_17;
  }
  compoundPredicate = self->_compoundPredicate;
  if ((unint64_t)compoundPredicate | *((void *)v4 + 1))
  {
    if (!-[MPPCompoundPredicate isEqual:](compoundPredicate, "isEqual:")) {
      goto LABEL_17;
    }
  }
  conditionalPredicate = self->_conditionalPredicate;
  if ((unint64_t)conditionalPredicate | *((void *)v4 + 2))
  {
    if (!-[MPPConditionalPredicate isEqual:](conditionalPredicate, "isEqual:")) {
      goto LABEL_17;
    }
  }
  persistentIDsPredicate = self->_persistentIDsPredicate;
  if ((unint64_t)persistentIDsPredicate | *((void *)v4 + 3))
  {
    if (!-[MPPPersistentIDsPredicate isEqual:](persistentIDsPredicate, "isEqual:")) {
      goto LABEL_17;
    }
  }
  searchStringPredicate = self->_searchStringPredicate;
  if ((unint64_t)searchStringPredicate | *((void *)v4 + 5)) {
    char v10 = -[MPPSearchStringPredicate isEqual:](searchStringPredicate, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_type;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  id v7 = [(MPPPropertyPredicate *)self->_propertyPredicate copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(MPPCompoundPredicate *)self->_compoundPredicate copyWithZone:a3];
  char v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = [(MPPConditionalPredicate *)self->_conditionalPredicate copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = [(MPPPersistentIDsPredicate *)self->_persistentIDsPredicate copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  id v15 = [(MPPSearchStringPredicate *)self->_searchStringPredicate copyWithZone:a3];
  v16 = (void *)v6[5];
  v6[5] = v15;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(MPPMediaPredicate *)self hasType]) {
    objc_msgSend(v9, "setType:", -[MPPMediaPredicate type](self, "type"));
  }
  if ([(MPPMediaPredicate *)self hasPropertyPredicate])
  {
    id v4 = [(MPPMediaPredicate *)self propertyPredicate];
    [v9 setPropertyPredicate:v4];
  }
  if ([(MPPMediaPredicate *)self hasCompoundPredicate])
  {
    uint64_t v5 = [(MPPMediaPredicate *)self compoundPredicate];
    [v9 setCompoundPredicate:v5];
  }
  if ([(MPPMediaPredicate *)self hasConditionalPredicate])
  {
    unint64_t v6 = [(MPPMediaPredicate *)self conditionalPredicate];
    [v9 setConditionalPredicate:v6];
  }
  if ([(MPPMediaPredicate *)self hasPersistentIDsPredicate])
  {
    id v7 = [(MPPMediaPredicate *)self persistentIDsPredicate];
    [v9 setPersistentIDsPredicate:v7];
  }
  if ([(MPPMediaPredicate *)self hasSearchStringPredicate])
  {
    v8 = [(MPPMediaPredicate *)self searchStringPredicate];
    [v9 setSearchStringPredicate:v8];
  }
}

- (void)writeTo:(id)a3
{
  id v15 = a3;
  if (*(unsigned char *)&self->_has) {
    [v15 writeInt32:self->_type forTag:1];
  }
  if (self->_propertyPredicate)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPPropertyPredicate *)self->_propertyPredicate writeTo:v4];
    uint64_t v5 = [v4 data];
    [v15 writeData:v5 forTag:2];
  }
  if (self->_compoundPredicate)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPCompoundPredicate *)self->_compoundPredicate writeTo:v6];
    id v7 = [v6 data];
    [v15 writeData:v7 forTag:3];
  }
  if (self->_conditionalPredicate)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPConditionalPredicate *)self->_conditionalPredicate writeTo:v8];
    id v9 = [v8 data];
    [v15 writeData:v9 forTag:4];
  }
  if (self->_persistentIDsPredicate)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPPersistentIDsPredicate *)self->_persistentIDsPredicate writeTo:v10];
    id v11 = [v10 data];
    [v15 writeData:v11 forTag:5];
  }
  v12 = v15;
  if (self->_searchStringPredicate)
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPSearchStringPredicate *)self->_searchStringPredicate writeTo:v13];
    v14 = [v13 data];
    [v15 writeData:v14 forTag:6];

    v12 = v15;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MPPMediaPredicateReadFrom(self, a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  propertyPredicate = self->_propertyPredicate;
  if (propertyPredicate)
  {
    id v6 = [(MPPPropertyPredicate *)propertyPredicate dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"propertyPredicate"];
  }
  compoundPredicate = self->_compoundPredicate;
  if (compoundPredicate)
  {
    id v8 = [(MPPCompoundPredicate *)compoundPredicate dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"compoundPredicate"];
  }
  conditionalPredicate = self->_conditionalPredicate;
  if (conditionalPredicate)
  {
    id v10 = [(MPPConditionalPredicate *)conditionalPredicate dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"conditionalPredicate"];
  }
  persistentIDsPredicate = self->_persistentIDsPredicate;
  if (persistentIDsPredicate)
  {
    v12 = [(MPPPersistentIDsPredicate *)persistentIDsPredicate dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"persistentIDsPredicate"];
  }
  searchStringPredicate = self->_searchStringPredicate;
  if (searchStringPredicate)
  {
    v14 = [(MPPSearchStringPredicate *)searchStringPredicate dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"searchStringPredicate"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPMediaPredicate;
  id v4 = [(MPPMediaPredicate *)&v8 description];
  uint64_t v5 = [(MPPMediaPredicate *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSearchStringPredicate
{
  return self->_searchStringPredicate != 0;
}

- (BOOL)hasPersistentIDsPredicate
{
  return self->_persistentIDsPredicate != 0;
}

- (BOOL)hasConditionalPredicate
{
  return self->_conditionalPredicate != 0;
}

- (BOOL)hasCompoundPredicate
{
  return self->_compoundPredicate != 0;
}

- (BOOL)hasPropertyPredicate
{
  return self->_propertyPredicate != 0;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)dealloc
{
  [(MPPMediaPredicate *)self setPropertyPredicate:0];
  [(MPPMediaPredicate *)self setCompoundPredicate:0];
  [(MPPMediaPredicate *)self setConditionalPredicate:0];
  [(MPPMediaPredicate *)self setPersistentIDsPredicate:0];
  [(MPPMediaPredicate *)self setSearchStringPredicate:0];
  v3.receiver = self;
  v3.super_class = (Class)MPPMediaPredicate;
  [(MPPMediaPredicate *)&v3 dealloc];
}

@end
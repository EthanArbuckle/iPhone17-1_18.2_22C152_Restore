@interface MPPPersistentIDsPredicate
- (BOOL)hasShouldContain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldContain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)persistentIDs;
- (int64_t)persistentIDsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)persistentIDsCount;
- (void)addPersistentIDs:(int64_t)a3;
- (void)clearPersistentIDs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)setHasShouldContain:(BOOL)a3;
- (void)setPersistentIDs:(int64_t *)a3 count:(unint64_t)a4;
- (void)setShouldContain:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPPPersistentIDsPredicate

- (BOOL)shouldContain
{
  return self->_shouldContain;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_shouldContain;
  }
  else {
    uint64_t v2 = 0;
  }
  return PBRepeatedInt64Hash() ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[36] & 1) == 0 || self->_shouldContain != v4[32]) {
      goto LABEL_8;
    }
  }
  else if (v4[36])
  {
LABEL_8:
    char IsEqual = 0;
    goto LABEL_9;
  }
  char IsEqual = PBRepeatedInt64IsEqual();
LABEL_9:

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v4 + 32) = self->_shouldContain;
    *(unsigned char *)(v4 + 36) |= 1u;
  }
  PBRepeatedInt64Copy();
  return v5;
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(MPPPersistentIDsPredicate *)self hasShouldContain]) {
    objc_msgSend(v7, "setShouldContain:", -[MPPPersistentIDsPredicate shouldContain](self, "shouldContain"));
  }
  if ([(MPPPersistentIDsPredicate *)self persistentIDsCount])
  {
    [v7 clearPersistentIDs];
    unint64_t v4 = [(MPPPersistentIDsPredicate *)self persistentIDsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v7, "addPersistentIDs:", -[MPPPersistentIDsPredicate persistentIDsAtIndex:](self, "persistentIDsAtIndex:", i));
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*(unsigned char *)&self->_has)
  {
    [v4 writeBOOL:self->_shouldContain forTag:1];
    id v4 = v7;
  }
  p_persistentIDs = &self->_persistentIDs;
  if (p_persistentIDs->count)
  {
    unint64_t v6 = 0;
    do
    {
      [v7 writeInt64:p_persistentIDs->list[v6] forTag:2];
      id v4 = v7;
      ++v6;
    }
    while (v6 < p_persistentIDs->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MPPPersistentIDsPredicateReadFrom(self, a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithBool:self->_shouldContain];
    [v3 setObject:v4 forKey:@"shouldContain"];
  }
  unint64_t v5 = PBRepeatedInt64NSArray();
  [v3 setObject:v5 forKey:@"persistentIDs"];

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPPersistentIDsPredicate;
  id v4 = [(MPPPersistentIDsPredicate *)&v8 description];
  unint64_t v5 = [(MPPPersistentIDsPredicate *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)setPersistentIDs:(int64_t *)a3 count:(unint64_t)a4
{
}

- (int64_t)persistentIDsAtIndex:(unint64_t)a3
{
  p_persistentIDs = &self->_persistentIDs;
  unint64_t count = self->_persistentIDs.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%ld) is out of range (%ld)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_persistentIDs->list[a3];
}

- (void)addPersistentIDs:(int64_t)a3
{
}

- (void)clearPersistentIDs
{
}

- (int64_t)persistentIDs
{
  return self->_persistentIDs.list;
}

- (unint64_t)persistentIDsCount
{
  return self->_persistentIDs.count;
}

- (BOOL)hasShouldContain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasShouldContain:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setShouldContain:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldContain = a3;
}

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)MPPPersistentIDsPredicate;
  [(MPPPersistentIDsPredicate *)&v3 dealloc];
}

@end
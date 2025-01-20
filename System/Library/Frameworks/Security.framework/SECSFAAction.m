@interface SECSFAAction
- (BOOL)hasAbc;
- (BOOL)hasAction;
- (BOOL)hasDrop;
- (BOOL)hasRadarnumber;
- (BOOL)hasTtr;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)radarnumber;
- (SECSFAActionAutomaticBugCapture)abc;
- (SECSFAActionDropEvent)drop;
- (SECSFAActionTapToRadar)ttr;
- (id)actionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAction:(id)a3;
- (int)action;
- (unint64_t)hash;
- (void)clearOneofValuesForAction;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbc:(id)a3;
- (void)setAction:(int)a3;
- (void)setDrop:(id)a3;
- (void)setHasAction:(BOOL)a3;
- (void)setRadarnumber:(id)a3;
- (void)setTtr:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ttr, 0);
  objc_storeStrong((id *)&self->_radarnumber, 0);
  objc_storeStrong((id *)&self->_drop, 0);

  objc_storeStrong((id *)&self->_abc, 0);
}

- (SECSFAActionDropEvent)drop
{
  return self->_drop;
}

- (SECSFAActionAutomaticBugCapture)abc
{
  return self->_abc;
}

- (SECSFAActionTapToRadar)ttr
{
  return self->_ttr;
}

- (void)setRadarnumber:(id)a3
{
}

- (NSString)radarnumber
{
  return self->_radarnumber;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 48))
  {
    self->_action = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  v12 = v4;
  if (*((void *)v4 + 4))
  {
    -[SECSFAAction setRadarnumber:](self, "setRadarnumber:");
    v5 = v12;
  }
  ttr = self->_ttr;
  uint64_t v7 = v5[5];
  if (ttr)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[SECSFAActionTapToRadar mergeFrom:](ttr, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[SECSFAAction setTtr:](self, "setTtr:");
  }
  v5 = v12;
LABEL_11:
  abc = self->_abc;
  uint64_t v9 = v5[1];
  if (abc)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[SECSFAActionAutomaticBugCapture mergeFrom:](abc, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[SECSFAAction setAbc:](self, "setAbc:");
  }
  v5 = v12;
LABEL_17:
  drop = self->_drop;
  uint64_t v11 = v5[3];
  if (drop)
  {
    if (v11) {
      -[SECSFAActionDropEvent mergeFrom:](drop, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[SECSFAAction setDrop:](self, "setDrop:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_action;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_radarnumber hash] ^ v3;
  unint64_t v5 = [(SECSFAActionTapToRadar *)self->_ttr hash];
  unint64_t v6 = v4 ^ v5 ^ [(SECSFAActionAutomaticBugCapture *)self->_abc hash];
  return v6 ^ [(SECSFAActionDropEvent *)self->_drop hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_action != *((_DWORD *)v4 + 4)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }
  radarnumber = self->_radarnumber;
  if ((unint64_t)radarnumber | *((void *)v4 + 4)
    && !-[NSString isEqual:](radarnumber, "isEqual:"))
  {
    goto LABEL_15;
  }
  ttr = self->_ttr;
  if ((unint64_t)ttr | *((void *)v4 + 5))
  {
    if (!-[SECSFAActionTapToRadar isEqual:](ttr, "isEqual:")) {
      goto LABEL_15;
    }
  }
  abc = self->_abc;
  if ((unint64_t)abc | *((void *)v4 + 1))
  {
    if (!-[SECSFAActionAutomaticBugCapture isEqual:](abc, "isEqual:")) {
      goto LABEL_15;
    }
  }
  drop = self->_drop;
  if ((unint64_t)drop | *((void *)v4 + 3)) {
    char v9 = -[SECSFAActionDropEvent isEqual:](drop, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_action;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_radarnumber copyWithZone:a3];
  v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = [(SECSFAActionTapToRadar *)self->_ttr copyWithZone:a3];
  v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(SECSFAActionAutomaticBugCapture *)self->_abc copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(SECSFAActionDropEvent *)self->_drop copyWithZone:a3];
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_action;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_radarnumber)
  {
    objc_msgSend(v4, "setRadarnumber:");
    id v4 = v5;
  }
  if (self->_ttr)
  {
    objc_msgSend(v5, "setTtr:");
    id v4 = v5;
  }
  if (self->_abc)
  {
    objc_msgSend(v5, "setAbc:");
    id v4 = v5;
  }
  if (self->_drop)
  {
    objc_msgSend(v5, "setDrop:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_radarnumber)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_ttr)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_abc)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_drop)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAActionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  radarnumber = self->_radarnumber;
  if (radarnumber) {
    [v3 setObject:radarnumber forKey:@"radarnumber"];
  }
  ttr = self->_ttr;
  if (ttr)
  {
    uint64_t v7 = [(SECSFAActionTapToRadar *)ttr dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"ttr"];
  }
  abc = self->_abc;
  if (abc)
  {
    id v9 = [(SECSFAActionAutomaticBugCapture *)abc dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"abc"];
  }
  drop = self->_drop;
  if (drop)
  {
    id v11 = [(SECSFAActionDropEvent *)drop dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"drop"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t action = self->_action;
    if (action >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_action);
      id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = off_1E5475B08[action];
    }
    [v4 setObject:v13 forKey:@"Action"];
  }

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SECSFAAction;
  id v4 = [(SECSFAAction *)&v8 description];
  id v5 = [(SECSFAAction *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearOneofValuesForAction
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_uint64_t action = 0;
  ttr = self->_ttr;
  self->_ttr = 0;

  abc = self->_abc;
  self->_abc = 0;

  drop = self->_drop;
  self->_drop = 0;
}

- (int)StringAsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ttr"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"abc"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"drop"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)actionAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5475B08[a3];
  }

  return v3;
}

- (BOOL)hasAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t action = a3;
}

- (int)action
{
  if (*(unsigned char *)&self->_has) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setDrop:(id)a3
{
  int v4 = (SECSFAActionDropEvent *)a3;
  [(SECSFAAction *)self clearOneofValuesForAction];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t action = 3;
  drop = self->_drop;
  self->_drop = v4;
}

- (BOOL)hasDrop
{
  return self->_drop != 0;
}

- (void)setAbc:(id)a3
{
  int v4 = (SECSFAActionAutomaticBugCapture *)a3;
  [(SECSFAAction *)self clearOneofValuesForAction];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t action = 2;
  abc = self->_abc;
  self->_abc = v4;
}

- (BOOL)hasAbc
{
  return self->_abc != 0;
}

- (void)setTtr:(id)a3
{
  int v4 = (SECSFAActionTapToRadar *)a3;
  [(SECSFAAction *)self clearOneofValuesForAction];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t action = 1;
  ttr = self->_ttr;
  self->_ttr = v4;
}

- (BOOL)hasTtr
{
  return self->_ttr != 0;
}

- (BOOL)hasRadarnumber
{
  return self->_radarnumber != 0;
}

@end
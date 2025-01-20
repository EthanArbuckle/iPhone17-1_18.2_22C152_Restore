@interface TASKEdgeDnsOutput
+ (Class)ipv4Type;
+ (Class)ipv6Type;
- (BOOL)hasErrorMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)ipv4s;
- (NSMutableArray)ipv6s;
- (NSString)errorMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ipv4AtIndex:(unint64_t)a3;
- (id)ipv6AtIndex:(unint64_t)a3;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unint64_t)ipv4sCount;
- (unint64_t)ipv6sCount;
- (void)addIpv4:(id)a3;
- (void)addIpv6:(id)a3;
- (void)clearIpv4s;
- (void)clearIpv6s;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setIpv4s:(id)a3;
- (void)setIpv6s:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKEdgeDnsOutput

- (id)statusAsString:(int)a3
{
  if (a3 >= 5)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_10012A590 + a3);
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Ok"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Timeout"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NoData"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BadName"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"InternalError"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearIpv4s
{
}

- (void)addIpv4:(id)a3
{
  id v4 = a3;
  ipv4s = self->_ipv4s;
  id v8 = v4;
  if (!ipv4s)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_ipv4s;
    self->_ipv4s = v6;

    id v4 = v8;
    ipv4s = self->_ipv4s;
  }
  [(NSMutableArray *)ipv4s addObject:v4];
}

- (unint64_t)ipv4sCount
{
  return (unint64_t)[(NSMutableArray *)self->_ipv4s count];
}

- (id)ipv4AtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_ipv4s objectAtIndex:a3];
}

+ (Class)ipv4Type
{
  return (Class)objc_opt_class();
}

- (void)clearIpv6s
{
}

- (void)addIpv6:(id)a3
{
  id v4 = a3;
  ipv6s = self->_ipv6s;
  id v8 = v4;
  if (!ipv6s)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_ipv6s;
    self->_ipv6s = v6;

    id v4 = v8;
    ipv6s = self->_ipv6s;
  }
  [(NSMutableArray *)ipv6s addObject:v4];
}

- (unint64_t)ipv6sCount
{
  return (unint64_t)[(NSMutableArray *)self->_ipv6s count];
}

- (id)ipv6AtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_ipv6s objectAtIndex:a3];
}

+ (Class)ipv6Type
{
  return (Class)objc_opt_class();
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKEdgeDnsOutput;
  id v3 = [(TASKEdgeDnsOutput *)&v7 description];
  id v4 = [(TASKEdgeDnsOutput *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  uint64_t status = self->_status;
  if (status >= 5)
  {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_status];
  }
  else
  {
    v5 = *(&off_10012A590 + status);
  }
  [v3 setObject:v5 forKey:@"status"];

  if ([(NSMutableArray *)self->_ipv4s count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_ipv4s, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v7 = self->_ipv4s;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"ipv4"];
  }
  if ([(NSMutableArray *)self->_ipv6s count])
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_ipv6s, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v14 = self->_ipv6s;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) dictionaryRepresentation];
          [v13 addObject:v19];
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v16);
    }

    [v3 setObject:v13 forKey:@"ipv6"];
  }
  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"errorMessage"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000211FC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_ipv4s;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = self->_ipv6s;
  v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (self->_errorMessage) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  v12 = a3;
  v12[8] = self->_status;
  if ([(TASKEdgeDnsOutput *)self ipv4sCount])
  {
    [v12 clearIpv4s];
    unint64_t v4 = [(TASKEdgeDnsOutput *)self ipv4sCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        objc_super v7 = [(TASKEdgeDnsOutput *)self ipv4AtIndex:i];
        [v12 addIpv4:v7];
      }
    }
  }
  if ([(TASKEdgeDnsOutput *)self ipv6sCount])
  {
    [v12 clearIpv6s];
    unint64_t v8 = [(TASKEdgeDnsOutput *)self ipv6sCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        v11 = [(TASKEdgeDnsOutput *)self ipv6AtIndex:j];
        [v12 addIpv6:v11];
      }
    }
  }
  if (self->_errorMessage) {
    objc_msgSend(v12, "setErrorMessage:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[8] = self->_status;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = self->_ipv4s;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v10) copyWithZone:a3];
        [v5 addIpv4:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_ipv6s;
  id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      long long v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v16), "copyWithZone:", a3, (void)v21);
        [v5 addIpv6:v17];

        long long v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v14);
  }

  id v18 = [(NSString *)self->_errorMessage copyWithZone:a3];
  long long v19 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_status == *((_DWORD *)v4 + 8)
    && ((ipv4s = self->_ipv4s, !((unint64_t)ipv4s | v4[2]))
     || -[NSMutableArray isEqual:](ipv4s, "isEqual:"))
    && ((ipv6s = self->_ipv6s, !((unint64_t)ipv6s | v4[3]))
     || -[NSMutableArray isEqual:](ipv6s, "isEqual:")))
  {
    errorMessage = self->_errorMessage;
    if ((unint64_t)errorMessage | v4[1]) {
      unsigned __int8 v8 = -[NSString isEqual:](errorMessage, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_status;
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_ipv4s hash];
  unint64_t v5 = v4 ^ (unint64_t)[(NSMutableArray *)self->_ipv6s hash];
  return v5 ^ [(NSString *)self->_errorMessage hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t status = *((_DWORD *)v4 + 8);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(TASKEdgeDnsOutput *)self addIpv4:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 3);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[TASKEdgeDnsOutput addIpv6:](self, "addIpv6:", *(void *)(*((void *)&v15 + 1) + 8 * (void)j), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 1)) {
    -[TASKEdgeDnsOutput setErrorMessage:](self, "setErrorMessage:");
  }
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_uint64_t status = a3;
}

- (NSMutableArray)ipv4s
{
  return self->_ipv4s;
}

- (void)setIpv4s:(id)a3
{
}

- (NSMutableArray)ipv6s
{
  return self->_ipv6s;
}

- (void)setIpv6s:(id)a3
{
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ipv6s, 0);
  objc_storeStrong((id *)&self->_ipv4s, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
}

@end
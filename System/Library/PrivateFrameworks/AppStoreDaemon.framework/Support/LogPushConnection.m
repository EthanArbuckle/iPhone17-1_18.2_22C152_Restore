@interface LogPushConnection
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedText;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation LogPushConnection

- (id)formattedText
{
  v3 = +[NSMutableString string];
  v4 = v3;
  if (self)
  {
    v5 = self->_environment;
    [v4 appendFormat:@"Environment: %@\n", v5];

    token = self->_token;
  }
  else
  {
    [v3 appendFormat:@"Environment: %@\n", 0];
    token = 0;
  }
  v7 = token;
  [v4 appendFormat:@"      Token: %@\n", v7];

  if (self && [(NSMutableArray *)self->_messages count])
  {
    [v4 appendFormat:@"   Messages:\n"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = self->_messages;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [v4 appendFormat:@"         - %@\n", *(void *)(*((void *)&v15 + 1) + 8 * i)];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [v4 appendFormat:@"   Messages: <none>\n"];
  }
  id v13 = [v4 copy];

  return v13;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)LogPushConnection;
  v3 = [(LogPushConnection *)&v7 description];
  v4 = [(LogPushConnection *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  environment = self->_environment;
  if (environment) {
    [v3 setObject:environment forKey:@"environment"];
  }
  token = self->_token;
  if (token) {
    [v4 setObject:token forKey:@"token"];
  }
  messages = self->_messages;
  if (messages) {
    [v4 setObject:messages forKey:@"messages"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        if (v6++ >= 9)
        {
          unint64_t v7 = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      unint64_t v13 = v7 >> 3;
      if ((v7 >> 3) == 3) {
        break;
      }
      if (v13 == 2)
      {
        uint64_t v14 = PBReaderReadString();
        uint64_t v15 = 24;
LABEL_24:
        long long v16 = *(void **)&self->PBCodable_opaque[v15];
        *(void *)&self->PBCodable_opaque[v15] = v14;
LABEL_25:

        goto LABEL_27;
      }
      if (v13 == 1)
      {
        uint64_t v14 = PBReaderReadString();
        uint64_t v15 = 8;
        goto LABEL_24;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    long long v16 = PBReaderReadString();
    if (v16) {
      sub_1002B2BFC((uint64_t)self, v16);
    }
    goto LABEL_25;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_environment) {
    PBDataWriterWriteStringField();
  }
  if (self->_token) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  char v5 = self->_messages;
  unsigned int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      char v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      unint64_t v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_environment copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_token copyWithZone:a3];
  char v9 = (void *)v5[3];
  v5[3] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_messages;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v14), "copyWithZone:", a3, (void)v17);
        sub_1002B2BFC((uint64_t)v5, v15);

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((environment = self->_environment, !((unint64_t)environment | v4[1]))
     || -[NSString isEqual:](environment, "isEqual:"))
    && ((token = self->_token, !((unint64_t)token | v4[3]))
     || -[NSString isEqual:](token, "isEqual:")))
  {
    messages = self->_messages;
    if ((unint64_t)messages | v4[2]) {
      unsigned __int8 v8 = -[NSMutableArray isEqual:](messages, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_environment hash];
  unint64_t v4 = [(NSString *)self->_token hash] ^ v3;
  return v4 ^ (unint64_t)[(NSMutableArray *)self->_messages hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
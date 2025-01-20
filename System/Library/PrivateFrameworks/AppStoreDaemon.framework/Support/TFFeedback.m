@interface TFFeedback
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFFeedback

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TFFeedback;
  v3 = [(TFFeedback *)&v7 description];
  v4 = [(TFFeedback *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  email = self->_email;
  if (email) {
    [v3 setObject:email forKey:@"email"];
  }
  if ([(NSMutableArray *)self->_screenshots count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_screenshots, "count"));
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    objc_super v7 = self->_screenshots;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "dictionaryRepresentation", (void)v16);
          [v6 addObject:v12];
        }
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    [v4 setObject:v6 forKey:@"screenshots"];
  }
  comment = self->_comment;
  if (comment) {
    [v4 setObject:comment forKey:@"comment"];
  }
  incidentId = self->_incidentId;
  if (incidentId) {
    [v4 setObject:incidentId forKey:@"incidentId"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10026229C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_email) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_screenshots;
  id v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_comment) {
    PBDataWriterWriteStringField();
  }
  if (self->_incidentId) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_email copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = self->_screenshots;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v12), "copyWithZone:", a3, (void)v19);
        sub_100261F7C((uint64_t)v5, v13);

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  id v14 = [(NSString *)self->_comment copyWithZone:a3];
  v15 = (void *)v5[1];
  v5[1] = v14;

  id v16 = [(NSString *)self->_incidentId copyWithZone:a3];
  long long v17 = (void *)v5[3];
  v5[3] = v16;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((email = self->_email, !((unint64_t)email | v4[2]))
     || -[NSString isEqual:](email, "isEqual:"))
    && ((screenshots = self->_screenshots, !((unint64_t)screenshots | v4[4]))
     || -[NSMutableArray isEqual:](screenshots, "isEqual:"))
    && ((comment = self->_comment, !((unint64_t)comment | v4[1]))
     || -[NSString isEqual:](comment, "isEqual:")))
  {
    incidentId = self->_incidentId;
    if ((unint64_t)incidentId | v4[3]) {
      unsigned __int8 v9 = -[NSString isEqual:](incidentId, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_email hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_screenshots hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_comment hash];
  return v4 ^ v5 ^ [(NSString *)self->_incidentId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshots, 0);
  objc_storeStrong((id *)&self->_incidentId, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_comment, 0);
}

@end
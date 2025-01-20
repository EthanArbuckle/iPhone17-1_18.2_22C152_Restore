@interface TFAppleWatch
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFAppleWatch

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TFAppleWatch;
  v3 = [(TFAppleWatch *)&v7 description];
  v4 = [(TFAppleWatch *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  model = self->_model;
  if (model) {
    [v3 setObject:model forKey:@"model"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v4 setObject:osVersion forKey:@"osVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1003768C8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_model)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_osVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_model copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_osVersion copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((model = self->_model, !((unint64_t)model | v4[1]))
     || -[NSString isEqual:](model, "isEqual:")))
  {
    osVersion = self->_osVersion;
    if ((unint64_t)osVersion | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](osVersion, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_model hash];
  return [(NSString *)self->_osVersion hash] ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
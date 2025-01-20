@interface TASKRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TASKInput)input;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInput:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKRequest;
  v3 = [(TASKRequest *)&v7 description];
  v4 = [(TASKRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  input = self->_input;
  if (input)
  {
    v5 = [(TASKInput *)input dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"input"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006EDB8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(TASKInput *)self->_input copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    input = self->_input;
    if ((unint64_t)input | v4[1]) {
      unsigned __int8 v6 = -[TASKInput isEqual:](input, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(TASKInput *)self->_input hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  input = self->_input;
  uint64_t v6 = v4[1];
  if (input)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v7 = v4;
    input = (TASKInput *)-[TASKInput mergeFrom:](input, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_super v7 = v4;
    input = (TASKInput *)-[TASKRequest setInput:](self, "setInput:");
  }
  v4 = v7;
LABEL_7:
  _objc_release_x1(input, v4);
}

- (TASKInput)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
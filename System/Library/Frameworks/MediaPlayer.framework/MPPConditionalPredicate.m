@interface MPPConditionalPredicate
- (BOOL)hasConditionalPredicate;
- (BOOL)hasElsePredicate;
- (BOOL)hasThenPredicate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MPPMediaPredicate)conditionalPredicate;
- (MPPMediaPredicate)elsePredicate;
- (MPPMediaPredicate)thenPredicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)setConditionalPredicate:(id)a3;
- (void)setElsePredicate:(id)a3;
- (void)setThenPredicate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPPConditionalPredicate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thenPredicate, 0);
  objc_storeStrong((id *)&self->_elsePredicate, 0);

  objc_storeStrong((id *)&self->_conditionalPredicate, 0);
}

- (void)setElsePredicate:(id)a3
{
}

- (MPPMediaPredicate)elsePredicate
{
  return self->_elsePredicate;
}

- (void)setThenPredicate:(id)a3
{
}

- (MPPMediaPredicate)thenPredicate
{
  return self->_thenPredicate;
}

- (void)setConditionalPredicate:(id)a3
{
}

- (MPPMediaPredicate)conditionalPredicate
{
  return self->_conditionalPredicate;
}

- (unint64_t)hash
{
  unint64_t v3 = [(MPPMediaPredicate *)self->_conditionalPredicate hash];
  unint64_t v4 = [(MPPMediaPredicate *)self->_thenPredicate hash] ^ v3;
  return v4 ^ [(MPPMediaPredicate *)self->_elsePredicate hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((conditionalPredicate = self->_conditionalPredicate, !((unint64_t)conditionalPredicate | v4[1]))
     || -[MPPMediaPredicate isEqual:](conditionalPredicate, "isEqual:"))
    && ((thenPredicate = self->_thenPredicate, !((unint64_t)thenPredicate | v4[3]))
     || -[MPPMediaPredicate isEqual:](thenPredicate, "isEqual:")))
  {
    elsePredicate = self->_elsePredicate;
    if ((unint64_t)elsePredicate | v4[2]) {
      char v8 = -[MPPMediaPredicate isEqual:](elsePredicate, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(MPPMediaPredicate *)self->_conditionalPredicate copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(MPPMediaPredicate *)self->_thenPredicate copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(MPPMediaPredicate *)self->_elsePredicate copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v7 = a3;
  if ([(MPPConditionalPredicate *)self hasConditionalPredicate])
  {
    unint64_t v4 = [(MPPConditionalPredicate *)self conditionalPredicate];
    [v7 setConditionalPredicate:v4];
  }
  if ([(MPPConditionalPredicate *)self hasThenPredicate])
  {
    v5 = [(MPPConditionalPredicate *)self thenPredicate];
    [v7 setThenPredicate:v5];
  }
  if ([(MPPConditionalPredicate *)self hasElsePredicate])
  {
    id v6 = [(MPPConditionalPredicate *)self elsePredicate];
    [v7 setElsePredicate:v6];
  }
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  if (self->_conditionalPredicate)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPMediaPredicate *)self->_conditionalPredicate writeTo:v4];
    v5 = [v4 data];
    [v10 writeData:v5 forTag:1];
  }
  if (self->_thenPredicate)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPMediaPredicate *)self->_thenPredicate writeTo:v6];
    id v7 = [v6 data];
    [v10 writeData:v7 forTag:2];
  }
  if (self->_elsePredicate)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F94098]);
    [(MPPMediaPredicate *)self->_elsePredicate writeTo:v8];
    v9 = [v8 data];
    [v10 writeData:v9 forTag:3];
  }
}

- (BOOL)readFrom:(id)a3
{
  return MPPConditionalPredicateReadFrom(self, a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  conditionalPredicate = self->_conditionalPredicate;
  if (conditionalPredicate)
  {
    v5 = [(MPPMediaPredicate *)conditionalPredicate dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"conditionalPredicate"];
  }
  thenPredicate = self->_thenPredicate;
  if (thenPredicate)
  {
    id v7 = [(MPPMediaPredicate *)thenPredicate dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"thenPredicate"];
  }
  elsePredicate = self->_elsePredicate;
  if (elsePredicate)
  {
    v9 = [(MPPMediaPredicate *)elsePredicate dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"elsePredicate"];
  }

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPConditionalPredicate;
  id v4 = [(MPPConditionalPredicate *)&v8 description];
  v5 = [(MPPConditionalPredicate *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasElsePredicate
{
  return self->_elsePredicate != 0;
}

- (BOOL)hasThenPredicate
{
  return self->_thenPredicate != 0;
}

- (BOOL)hasConditionalPredicate
{
  return self->_conditionalPredicate != 0;
}

- (void)dealloc
{
  [(MPPConditionalPredicate *)self setConditionalPredicate:0];
  [(MPPConditionalPredicate *)self setThenPredicate:0];
  [(MPPConditionalPredicate *)self setElsePredicate:0];
  v3.receiver = self;
  v3.super_class = (Class)MPPConditionalPredicate;
  [(MPPConditionalPredicate *)&v3 dealloc];
}

@end
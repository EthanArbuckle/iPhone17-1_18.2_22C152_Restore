@interface UnitRank
- (BOOL)isConfusable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLaTeX;
- (NSLocale)locale;
- (UnitRank)initWithUnitID:(int)a3 rank:(float)a4 locale:(id)a5;
- (UnitRank)initWithUnitID:(int)a3 rank:(float)a4 locale:(id)a5 context:(id)a6;
- (float)rank;
- (id)context;
- (id)description;
- (int)tokenType;
- (int)unitID;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)setContext:(id)a3;
- (void)setIsConfusable:(BOOL)a3;
- (void)setIsLaTeX:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setRank:(float)a3;
- (void)setTokenType:(int)a3;
- (void)setUnitID:(int)a3;
@end

@implementation UnitRank

- (int)unitID
{
  return self->_unitID;
}

- (UnitRank)initWithUnitID:(int)a3 rank:(float)a4 locale:(id)a5 context:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)UnitRank;
  v13 = [(UnitRank *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_unitID = a3;
    v13->_rank = a4;
    objc_storeStrong((id *)&v13->_locale, a5);
    objc_storeStrong(&v14->_context, a6);
    v14->_tokenType = 2;
  }

  return v14;
}

- (UnitRank)initWithUnitID:(int)a3 rank:(float)a4 locale:(id)a5
{
  return -[UnitRank initWithUnitID:rank:locale:context:](self, "initWithUnitID:rank:locale:context:", *(void *)&a3, a5, 0);
}

- (BOOL)isLaTeX
{
  return self->_isLaTeX;
}

- (int)tokenType
{
  return self->_tokenType;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  [(UnitRank *)self rank];
  float v6 = v5;
  [v4 rank];
  if (v6 <= v7)
  {
    [(UnitRank *)self rank];
    float v10 = v9;
    [v4 rank];
    if (v10 >= v11) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = -1;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

- (float)rank
{
  return self->_rank;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setIsConfusable:(BOOL)a3
{
  self->_isConfusable = a3;
}

- (void)setIsLaTeX:(BOOL)a3
{
  self->_isLaTeX = a3;
}

- (void)setTokenType:(int)a3
{
  self->_tokenType = a3;
}

- (BOOL)isConfusable
{
  return self->_isConfusable;
}

- (void)setContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setRank:(float)a3
{
  self->_rank = a3;
}

- (void)setUnitID:(int)a3
{
  self->_unitID = a3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(UnitRank *)self unitID];
  [(UnitRank *)self rank];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"%d (%f)", v4, v5);
}

- (unint64_t)hash
{
  uint64_t v3 = 31 * [(UnitRank *)self unitID];
  [(UnitRank *)self rank];
  return v3 + (int)(float)(v4 * 1000.0) + 961;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (int v5 = -[UnitRank unitID](self, "unitID"), v5 == [v4 unitID]))
  {
    [(UnitRank *)self rank];
    float v7 = v6;
    [v4 rank];
    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

@end
@interface MPPCompoundPredicate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)predicates;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)predicatesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)predicatesCount;
- (void)addPredicates:(id)a3;
- (void)clearPredicates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)setPredicates:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPPCompoundPredicate

- (void).cxx_destruct
{
}

- (void)setPredicates:(id)a3
{
}

- (NSMutableArray)predicates
{
  return self->_predicates;
}

- (unint64_t)hash
{
  return [(NSMutableArray *)self->_predicates hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    predicates = self->_predicates;
    if ((unint64_t)predicates | v4[1]) {
      char v6 = -[NSMutableArray isEqual:](predicates, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v6 = self->_predicates;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addPredicates:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(MPPCompoundPredicate *)self predicatesCount])
  {
    [v8 clearPredicates];
    unint64_t v4 = [(MPPCompoundPredicate *)self predicatesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(MPPCompoundPredicate *)self predicatesAtIndex:i];
        [v8 addPredicates:v7];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v5 = self->_predicates;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        id v11 = objc_alloc_init(MEMORY[0x1E4F94098]);
        objc_msgSend(v10, "writeTo:", v11, (void)v13);
        v12 = [v11 data];
        [v4 writeData:v12 forTag:1];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (BOOL)readFrom:(id)a3
{
  return MPPCompoundPredicateReadFrom(self, a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_predicates count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_predicates, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    unint64_t v5 = self->_predicates;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"predicates"];
  }

  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPPCompoundPredicate;
  id v4 = [(MPPCompoundPredicate *)&v8 description];
  unint64_t v5 = [(MPPCompoundPredicate *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)predicatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_predicates objectAtIndex:a3];
}

- (unint64_t)predicatesCount
{
  return [(NSMutableArray *)self->_predicates count];
}

- (void)addPredicates:(id)a3
{
  id v4 = a3;
  predicates = self->_predicates;
  id v8 = v4;
  if (!predicates)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_predicates;
    self->_predicates = v6;

    id v4 = v8;
    predicates = self->_predicates;
  }
  [(NSMutableArray *)predicates addObject:v4];
}

- (void)clearPredicates
{
}

- (void)dealloc
{
  [(MPPCompoundPredicate *)self setPredicates:0];
  v3.receiver = self;
  v3.super_class = (Class)MPPCompoundPredicate;
  [(MPPCompoundPredicate *)&v3 dealloc];
}

@end
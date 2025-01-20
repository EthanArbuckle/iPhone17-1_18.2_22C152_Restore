@interface ADSynchronizedIdItemPair
- (ADSynchronizedIdItem)current;
- (ADSynchronizedIdItem)next;
- (ADSynchronizedIdItemPair)initWithCurrent:(id)a3 andNext:(id)a4;
- (ADSynchronizedIdItemPair)initWithRemote:(id)a3;
- (BOOL)setCurrentIfNil:(id)a3 andCreationTime:(id)a4 andValidityDays:(unsigned int)a5;
- (id)adoptRemoteIfEarly:(id)a3;
- (id)description;
- (id)selectEarliest:(id)a3;
- (unint64_t)_populateNullsWithCreationTime:(id)a3 today:(id)a4 minValidityDays:(unsigned int)a5 maxValidityDays:(unsigned int)a6 currentOption:(unint64_t)a7 nextOption:(unint64_t)a8;
@end

@implementation ADSynchronizedIdItemPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_current, 0);
}

- (ADSynchronizedIdItem)next
{
  return (ADSynchronizedIdItem *)objc_getProperty(self, a2, 16, 1);
}

- (ADSynchronizedIdItem)current
{
  return (ADSynchronizedIdItem *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)setCurrentIfNil:(id)a3 andCreationTime:(id)a4 andValidityDays:(unsigned int)a5
{
  current = self->_current;
  if (!current)
  {
    uint64_t v6 = *(void *)&a5;
    id v9 = a4;
    id v10 = a3;
    v11 = +[ADSynchronizedIdItem alignToMidnight:v9];
    v12 = [[ADSynchronizedIdItem alloc] initWithValue:v10 andEffectiveFrom:v11 andValidityDays:v6 andCreatedOn:v9 andAdoptedOn:0 andSwitchedCount:0];

    v13 = self->_current;
    self->_current = v12;
  }
  return current == 0;
}

- (unint64_t)_populateNullsWithCreationTime:(id)a3 today:(id)a4 minValidityDays:(unsigned int)a5 maxValidityDays:(unsigned int)a6 currentOption:(unint64_t)a7 nextOption:(unint64_t)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  if (self->_current)
  {
    a7 = 0;
  }
  else
  {
    if (v10 != v11) {
      uint64_t v11 = arc4random_uniform(v10 - v11) + v11;
    }
    v16 = [ADSynchronizedIdItem alloc];
    id v17 = objc_alloc_init((Class)NSUUID);
    v18 = [(ADSynchronizedIdItem *)v16 initWithValue:v17 andEffectiveFrom:v15 andValidityDays:v11 andCreatedOn:v14 andAdoptedOn:0 andSwitchedCount:0];
    current = self->_current;
    self->_current = v18;
  }
  if (!self->_next && [(ADSynchronizedIdItem *)self->_current expirationDaysFrom:v15] <= 14)
  {
    v20 = [ADSynchronizedIdItem alloc];
    id v21 = objc_alloc_init((Class)NSUUID);
    v22 = [(ADSynchronizedIdItem *)self->_current expirationDate];
    v23 = [(ADSynchronizedIdItem *)v20 initWithValue:v21 andEffectiveFrom:v22 andValidityDays:v10 andCreatedOn:v14 andAdoptedOn:0 andSwitchedCount:0];
    next = self->_next;
    self->_next = v23;

    a7 |= a8;
  }

  return a7;
}

- (id)adoptRemoteIfEarly:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    uint64_t v11 = self;
    goto LABEL_18;
  }
  current = self->_current;
  v7 = [v4 current];
  v8 = v7;
  if (current)
  {

    id v9 = self->_current;
    if (v8)
    {
      uint64_t v10 = [v5 current];
      v8 = [(ADSynchronizedIdItem *)v9 selectEarliest:v10];
    }
    else
    {
      v8 = v9;
    }
  }
  next = self->_next;
  v13 = [v5 next];
  id v14 = v13;
  if (next)
  {

    id v15 = self->_next;
    if (v14)
    {
      v16 = [v5 next];
      id v14 = [(ADSynchronizedIdItem *)v15 selectEarliest:v16];
    }
    else
    {
      id v14 = v15;
    }
  }
  if (v8 != self->_current)
  {
    id v17 = [[ADSynchronizedIdItem alloc] initAndAdopt:v8 andSwitchedCount:[(ADSynchronizedIdItem *)self->_current switchedCount] + 1];

    v18 = self->_next;
    v8 = v17;
LABEL_14:
    if (v14 != v18)
    {
      v19 = [[ADSynchronizedIdItem alloc] initAndAdopt:v14 andSwitchedCount:[(ADSynchronizedIdItem *)self->_next switchedCount] + 1];

      id v14 = v19;
    }
    v20 = [[ADSynchronizedIdItemPair alloc] initWithCurrent:v8 andNext:v14];
    goto LABEL_17;
  }
  v18 = self->_next;
  if (v14 != v18) {
    goto LABEL_14;
  }
  v20 = self;
LABEL_17:
  uint64_t v11 = v20;

LABEL_18:
  return v11;
}

- (id)selectEarliest:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    uint64_t v11 = self;
    goto LABEL_18;
  }
  current = self->_current;
  v7 = [v4 current];
  v8 = v7;
  if (current)
  {

    id v9 = self->_current;
    if (v8)
    {
      uint64_t v10 = [v5 current];
      v8 = [(ADSynchronizedIdItem *)v9 selectEarliest:v10];
    }
    else
    {
      v8 = v9;
    }
  }
  next = self->_next;
  v13 = [v5 next];
  id v14 = v13;
  if (next)
  {

    id v15 = self->_next;
    if (v14)
    {
      v16 = [v5 next];
      id v14 = [(ADSynchronizedIdItem *)v15 selectEarliest:v16];
    }
    else
    {
      id v14 = v15;
    }
  }
  id v17 = self->_next;
  if (v8 == self->_current)
  {
    if (v14 == v17)
    {
      v18 = self;
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  if (v14 == v17)
  {
LABEL_15:
    v18 = [[ADSynchronizedIdItemPair alloc] initWithCurrent:v8 andNext:v14];
    goto LABEL_17;
  }
  v18 = v5;
LABEL_17:
  uint64_t v11 = v18;

LABEL_18:
  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:@"current:(%@) next:(%@)", self->_current, self->_next];
}

- (ADSynchronizedIdItemPair)initWithRemote:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ADSynchronizedIdItemPair;
  v5 = [(ADSynchronizedIdItemPair *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 current];

    if (v6)
    {
      v7 = [ADSynchronizedIdItem alloc];
      v8 = [v4 current];
      id v9 = [(ADSynchronizedIdItem *)v7 initAndAdopt:v8];
      current = v5->_current;
      v5->_current = v9;
    }
    uint64_t v11 = [v4 next];

    if (v11)
    {
      v12 = [ADSynchronizedIdItem alloc];
      v13 = [v4 next];
      id v14 = [(ADSynchronizedIdItem *)v12 initAndAdopt:v13];
      next = v5->_next;
      v5->_next = v14;
    }
  }

  return v5;
}

- (ADSynchronizedIdItemPair)initWithCurrent:(id)a3 andNext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADSynchronizedIdItemPair;
  id v9 = [(ADSynchronizedIdItemPair *)&v12 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_current, a3);
    objc_storeStrong((id *)&v10->_next, a4);
  }

  return v10;
}

@end
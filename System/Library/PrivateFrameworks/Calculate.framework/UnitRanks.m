@interface UnitRanks
+ (id)unitRanksWithUnitsInfo:(id)a3;
- (BOOL)containsCurrency;
- (BOOL)containsFrom;
- (BOOL)containsTo;
- (BOOL)containsUnit;
- (BOOL)isAmbiguous;
- (BOOL)isLaTeX;
- (NSMutableArray)ranks;
- (NSMutableSet)units;
- (UnitRanks)init;
- (UnitRanks)initWithUnitsInfo:(id)a3;
- (UnitsInfo)unitsInfo;
- (int)tokenType;
- (void)addUnitRank:(id)a3;
- (void)setIsLaTeX:(BOOL)a3;
- (void)setRanks:(id)a3;
- (void)setTokenType:(int)a3;
- (void)setUnits:(id)a3;
- (void)setUnitsInfo:(id)a3;
- (void)sort;
@end

@implementation UnitRanks

uint64_t __17__UnitRanks_sort__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)addUnitRank:(id)a3
{
  id v11 = a3;
  v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "unitID"));
  if (([(NSMutableSet *)self->_units containsObject:v4] & 1) == 0)
  {
    if ([v11 unitID] == -1)
    {
      self->_containsFrom = 1;
    }
    else if ([v11 unitID] == -2)
    {
      self->_containsTo = 1;
    }
    else if ([v11 unitID])
    {
      self->_containsUnit = 1;
    }
    else
    {
      self->_tokenType = [v11 tokenType];
    }
    if (!self->_isLaTeX && [v11 isLaTeX]) {
      self->_isLaTeX = 1;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_unitsInfo);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      id v7 = objc_loadWeakRetained((id *)&self->_unitsInfo);
      v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", (int)objc_msgSend(v11, "unitID"));
      v9 = [v8 typeInfo];
      int v10 = [v9 isCurrency];

      if (v10) {
        self->_containsCurrency = 1;
      }
    }
    [(NSMutableSet *)self->_units addObject:v4];
    [(NSMutableArray *)self->_ranks addObject:v11];
  }
}

+ (id)unitRanksWithUnitsInfo:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUnitsInfo:v3];

  return v4;
}

- (UnitRanks)initWithUnitsInfo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UnitRanks;
  v5 = [(UnitRanks *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    units = v5->_units;
    v5->_units = (NSMutableSet *)v6;

    uint64_t v8 = objc_opt_new();
    ranks = v5->_ranks;
    v5->_ranks = (NSMutableArray *)v8;

    objc_storeWeak((id *)&v5->_unitsInfo, v4);
    v5->_tokenType = 2;
  }

  return v5;
}

- (int)tokenType
{
  return self->_tokenType;
}

- (NSMutableArray)ranks
{
  return self->_ranks;
}

- (BOOL)isLaTeX
{
  return self->_isLaTeX;
}

- (void)sort
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_destroyWeak((id *)&self->_unitsInfo);
  objc_storeStrong((id *)&self->_ranks, 0);
}

- (void)setUnits:(id)a3
{
}

- (NSMutableSet)units
{
  return self->_units;
}

- (void)setIsLaTeX:(BOOL)a3
{
  self->_isLaTeX = a3;
}

- (void)setTokenType:(int)a3
{
  self->_tokenType = a3;
}

- (void)setUnitsInfo:(id)a3
{
}

- (UnitsInfo)unitsInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unitsInfo);
  return (UnitsInfo *)WeakRetained;
}

- (BOOL)containsCurrency
{
  return self->_containsCurrency;
}

- (BOOL)containsUnit
{
  return self->_containsUnit;
}

- (BOOL)containsTo
{
  return self->_containsTo;
}

- (BOOL)containsFrom
{
  return self->_containsFrom;
}

- (void)setRanks:(id)a3
{
}

- (BOOL)isAmbiguous
{
  return (unint64_t)[(NSMutableSet *)self->_units count] > 1;
}

- (UnitRanks)init
{
  v8.receiver = self;
  v8.super_class = (Class)UnitRanks;
  v2 = [(UnitRanks *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    units = v2->_units;
    v2->_units = (NSMutableSet *)v3;

    uint64_t v5 = objc_opt_new();
    ranks = v2->_ranks;
    v2->_ranks = (NSMutableArray *)v5;

    objc_storeWeak((id *)&v2->_unitsInfo, 0);
    v2->_tokenType = 2;
  }
  return v2;
}

@end
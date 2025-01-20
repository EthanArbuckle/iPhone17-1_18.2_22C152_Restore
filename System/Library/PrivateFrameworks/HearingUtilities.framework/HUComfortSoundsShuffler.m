@interface HUComfortSoundsShuffler
+ (HUComfortSoundsShuffler)shufflerWithArray:(id)a3;
- (HUComfortSoundsShuffler)initWithArray:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)nextObject;
- (void)shuffle;
@end

@implementation HUComfortSoundsShuffler

+ (HUComfortSoundsShuffler)shufflerWithArray:(id)a3
{
  id v3 = a3;
  v4 = [[HUComfortSoundsShuffler alloc] initWithArray:v3];

  return v4;
}

- (HUComfortSoundsShuffler)initWithArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUComfortSoundsShuffler;
  v5 = [(HUComfortSoundsShuffler *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithArray:v4];
    array = v5->_array;
    v5->_array = (NSMutableArray *)v6;

    [(HUComfortSoundsShuffler *)v5 shuffle];
    v5->_index = 0;
  }

  return v5;
}

- (id)nextObject
{
  v2 = self;
  objc_sync_enter(v2);
  array = v2->_array;
  unint64_t v4 = v2->_index + 1;
  v2->_index = v4;
  if (v4 >= [(NSMutableArray *)array count])
  {
    [(HUComfortSoundsShuffler *)v2 shuffle];
    v2->_index = 0;
  }
  if ([(NSMutableArray *)v2->_array count] <= v2->_index)
  {
    v5 = 0;
  }
  else
  {
    v5 = -[NSMutableArray objectAtIndex:](v2->_array, "objectAtIndex:");
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)shuffle
{
  if ((unint64_t)[(NSMutableArray *)self->_array count] >= 2)
  {
    id v7 = [(NSMutableArray *)self->_array lastObject];
    if ([(NSMutableArray *)self->_array count] != 1)
    {
      int v3 = 0;
      unint64_t v4 = 0;
      do
      {
        [(NSMutableArray *)self->_array exchangeObjectAtIndex:v4 withObjectAtIndex:v4 + arc4random_uniform(v3 + [(NSMutableArray *)self->_array count])];
        ++v4;
        --v3;
      }
      while (v4 < [(NSMutableArray *)self->_array count] - 1);
    }
    id v5 = [(NSMutableArray *)self->_array firstObject];

    uint64_t v6 = v7;
    if (v5 == v7)
    {
      [(NSMutableArray *)self->_array exchangeObjectAtIndex:0 withObjectAtIndex:[(NSMutableArray *)self->_array count] - 1];
      uint64_t v6 = v7;
    }
  }
}

- (id)description
{
  return (id)[(NSMutableArray *)self->_array description];
}

- (id)debugDescription
{
  return (id)[(NSMutableArray *)self->_array debugDescription];
}

- (void).cxx_destruct
{
}

@end
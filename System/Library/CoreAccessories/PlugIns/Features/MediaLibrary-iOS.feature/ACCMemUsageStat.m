@interface ACCMemUsageStat
- (ACCMemUsageStat)init;
- (ACCMemUsageStat)initWithName:(id)a3;
- (ACCMemUsageStatInfo)statInfo;
- (BOOL)update;
- (NSMutableDictionary)markList;
- (NSString)name;
- (double)timeIntervalSinceLastUpdate;
- (double)timeIntervalSinceMark:(id)a3;
- (double)timeIntervalSinceStart;
- (id)description;
- (id)getMark:(id)a3;
- (void)mark:(id)a3;
- (void)removeMark:(id)a3;
@end

@implementation ACCMemUsageStat

- (ACCMemUsageStat)init
{
  return [(ACCMemUsageStat *)self initWithName:0];
}

- (ACCMemUsageStat)initWithName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ACCMemUsageStat;
  v6 = [(ACCMemUsageStat *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v8 = [[ACCMemUsageStatInfo alloc] initWithName:&stru_26DA84CD0];
    statInfo = v7->_statInfo;
    v7->_statInfo = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    markList = v7->_markList;
    v7->_markList = v10;

    [(ACCMemUsageStat *)v7 update];
  }

  return v7;
}

- (id)description
{
  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  else {
    name = &stru_26DA84CD0;
  }
  return (id)[MEMORY[0x263F089D8] stringWithFormat:@"ACCMemUsageStat:%@ \nstatinfo: \n%@ markList: %lu entries \n", name, self->_statInfo, -[NSMutableDictionary count](self->_markList, "count")];
}

- (BOOL)update
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0;
  BOOL MemoryUse = getMemoryUse(&v16, &v15, &v14);
  if (MemoryUse)
  {
    [(ACCMemUsageStatInfo *)self->_statInfo updateResident:v16 virtualValue:v15 physFootprintValue:v14];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v4 = [(NSMutableDictionary *)self->_markList allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * i) updateResident:v16 virtualValue:v15 physFootprintValue:v14];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v17 count:16];
      }
      while (v6);
    }
  }
  return MemoryUse;
}

- (void)mark:(id)a3
{
  id v7 = a3;
  -[NSMutableDictionary objectForKey:](self->_markList, "objectForKey:");
  v4 = (ACCMemUsageStatInfo *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    uint64_t v5 = [ACCMemUsageStatInfo alloc];
    uint64_t v6 = [NSString stringWithFormat:@"%@-mark-%@", self->_name, v7];
    v4 = [(ACCMemUsageStatInfo *)v5 initWithName:v6 andInfo:self->_statInfo];

    [(NSMutableDictionary *)self->_markList setObject:v4 forKey:v7];
  }
}

- (id)getMark:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_markList objectForKey:a3];
}

- (void)removeMark:(id)a3
{
}

- (double)timeIntervalSinceStart
{
  [(ACCMemUsageStatInfo *)self->_statInfo timeIntervalSinceStart];
  return result;
}

- (double)timeIntervalSinceLastUpdate
{
  [(ACCMemUsageStatInfo *)self->_statInfo timeIntervalSinceLastUpdate];
  return result;
}

- (double)timeIntervalSinceMark:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_markList objectForKey:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263EFF910] date];
    uint64_t v5 = [v3 startTime];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = -1.0;
  }

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (ACCMemUsageStatInfo)statInfo
{
  return self->_statInfo;
}

- (NSMutableDictionary)markList
{
  return self->_markList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markList, 0);
  objc_storeStrong((id *)&self->_statInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
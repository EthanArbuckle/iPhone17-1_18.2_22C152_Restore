@interface CBORArray
- (CBORArray)init;
- (CBORArray)initWith:(id)a3;
- (int)fieldType;
- (void)addObject:(id)a3;
- (void)write:(id)a3;
@end

@implementation CBORArray

- (int)fieldType
{
  return 4;
}

- (CBORArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBORArray;
  v2 = [(CBORArray *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    m_data = v2->m_data;
    v2->m_data = v3;
  }
  return v2;
}

- (CBORArray)initWith:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CBORArray;
  v5 = [(CBORArray *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v4];
    m_data = v5->m_data;
    v5->m_data = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)addObject:(id)a3
{
}

- (void)write:(id)a3
{
  id v6 = a3;
  [(CBORValue *)self encodeStartItems:[(NSMutableArray *)self->m_data count] output:v6];
  if ([(NSMutableArray *)self->m_data count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [(NSMutableArray *)self->m_data objectAtIndexedSubscript:v4];
      [v5 write:v6];

      ++v4;
    }
    while ([(NSMutableArray *)self->m_data count] > v4);
  }
}

- (void).cxx_destruct
{
}

@end
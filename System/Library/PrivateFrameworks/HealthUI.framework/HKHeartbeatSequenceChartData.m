@interface HKHeartbeatSequenceChartData
- (HKHeartbeatSequenceChartData)init;
- (NSMutableArray)sections;
- (double)initialXAxisOffset;
- (int64_t)sectionCount;
- (void)_expandToSection:(int64_t)a3;
- (void)addSequencePoint:(id)a3 section:(int64_t)a4;
- (void)enumerateSequences:(id)a3;
- (void)setInitialXAxisOffset:(double)a3;
@end

@implementation HKHeartbeatSequenceChartData

- (HKHeartbeatSequenceChartData)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKHeartbeatSequenceChartData;
  v2 = [(HKHeartbeatSequenceChartData *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sections = v2->_sections;
    v2->_sections = v3;
  }
  return v2;
}

- (void)addSequencePoint:(id)a3 section:(int64_t)a4
{
  id v6 = a3;
  [(HKHeartbeatSequenceChartData *)self _expandToSection:a4];
  id v7 = [(NSMutableArray *)self->_sections objectAtIndexedSubscript:a4];
  [v7 addObject:v6];
}

- (int64_t)sectionCount
{
  return [(NSMutableArray *)self->_sections count];
}

- (void)enumerateSequences:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (unsigned int (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_sections;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      if (!v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9))) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)_expandToSection:(int64_t)a3
{
  int64_t v5 = [(NSMutableArray *)self->_sections count];
  if (v5 <= a3)
  {
    int64_t v6 = a3 - v5 + 1;
    do
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(NSMutableArray *)self->_sections addObject:v7];

      --v6;
    }
    while (v6);
  }
}

- (double)initialXAxisOffset
{
  return self->_initialXAxisOffset;
}

- (void)setInitialXAxisOffset:(double)a3
{
  self->_initialXAxisOffset = a3;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
}

@end
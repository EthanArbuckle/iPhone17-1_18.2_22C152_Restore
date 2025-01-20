@interface VCSessionBandwidthAllocationTableStreamInfo
- (BOOL)addTableEntry:(id)a3;
- (NSArray)sortedEntries;
- (NSMutableDictionary)qualityIndexToTableEntry;
- (VCSessionBandwidthAllocationTableStreamInfo)init;
- (id)entryForQualityIndex:(unsigned int)a3;
- (void)dealloc;
@end

@implementation VCSessionBandwidthAllocationTableStreamInfo

- (VCSessionBandwidthAllocationTableStreamInfo)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCSessionBandwidthAllocationTableStreamInfo;
  v2 = [(VCSessionBandwidthAllocationTableStreamInfo *)&v4 init];
  if (v2)
  {
    v2->_sortedEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_qualityIndexToTableEntry = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionBandwidthAllocationTableStreamInfo;
  [(VCSessionBandwidthAllocationTableStreamInfo *)&v3 dealloc];
}

- (BOOL)addTableEntry:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_qualityIndexToTableEntry, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "qualityIndex")));
  if (!v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_qualityIndexToTableEntry, "setObject:forKeyedSubscript:", a3, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "qualityIndex")));
    [(NSMutableArray *)self->_sortedEntries addObject:a3];
    [(NSMutableArray *)self->_sortedEntries sortUsingComparator:&__block_literal_global_103];
  }
  return v5 == 0;
}

uint64_t __61__VCSessionBandwidthAllocationTableStreamInfo_addTableEntry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = [a2 qualityIndex];
  if (v5 < [a3 qualityIndex]) {
    return -1;
  }
  unsigned int v7 = [a2 qualityIndex];
  return v7 > [a3 qualityIndex];
}

- (id)entryForQualityIndex:(unsigned int)a3
{
  qualityIndexToTableEntry = self->_qualityIndexToTableEntry;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];

  return (id)[(NSMutableDictionary *)qualityIndexToTableEntry objectForKeyedSubscript:v4];
}

- (NSArray)sortedEntries
{
  return &self->_sortedEntries->super;
}

- (NSMutableDictionary)qualityIndexToTableEntry
{
  return self->_qualityIndexToTableEntry;
}

@end
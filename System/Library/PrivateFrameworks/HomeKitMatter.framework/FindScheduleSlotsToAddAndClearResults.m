@interface FindScheduleSlotsToAddAndClearResults
- (NSArray)slotsOfSchedulesToClear;
- (NSDictionary)slotToHMMTRSchedulesToAdd;
- (void)setSlotToHMMTRSchedulesToAdd:(id)a3;
- (void)setSlotsOfSchedulesToClear:(id)a3;
@end

@implementation FindScheduleSlotsToAddAndClearResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotsOfSchedulesToClear, 0);
  objc_storeStrong((id *)&self->_slotToHMMTRSchedulesToAdd, 0);
}

- (void)setSlotsOfSchedulesToClear:(id)a3
{
}

- (NSArray)slotsOfSchedulesToClear
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSlotToHMMTRSchedulesToAdd:(id)a3
{
}

- (NSDictionary)slotToHMMTRSchedulesToAdd
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

@end
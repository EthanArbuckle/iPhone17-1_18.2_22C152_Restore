@interface _CHSRelevanceCacheBufChanges
- (uint64_t)changeTypeArchivedObjects;
- (uint64_t)changeTypeGroups;
- (unsigned)replacementArchivedObjects;
- (unsigned)replacementGroups;
- (void)omitArchivedObjects;
- (void)omitGroups;
- (void)preserveArchivedObjects;
- (void)preserveGroups;
- (void)replaceArchivedObjects:(id)a3;
- (void)replaceGroups:(id)a3;
@end

@implementation _CHSRelevanceCacheBufChanges

- (uint64_t)changeTypeArchivedObjects
{
  if (result) {
    return *(unsigned __int8 *)(result + 8);
  }
  return result;
}

- (unsigned)replacementArchivedObjects
{
  if (a1)
  {
    a1 = (unsigned int *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:a1[3]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)changeTypeGroups
{
  if (result) {
    return *(unsigned __int8 *)(result + 16);
  }
  return result;
}

- (unsigned)replacementGroups
{
  if (a1)
  {
    a1 = (unsigned int *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:a1[5]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)replaceArchivedObjects:(id)a3
{
  id v5 = a3;
  self->_changeTypeArchivedObjects = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 528, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementArchivedObjects = [v5 unsignedIntValue];
}

- (void)omitArchivedObjects
{
  self->_changeTypeArchivedObjects = 2;
}

- (void)preserveArchivedObjects
{
  self->_changeTypeArchivedObjects = 0;
}

- (void)replaceGroups:(id)a3
{
  id v5 = a3;
  self->_changeTypeGroups = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 551, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementGroups = [v5 unsignedIntValue];
}

- (void)omitGroups
{
  self->_changeTypeGroups = 2;
}

- (void)preserveGroups
{
  self->_changeTypeGroups = 0;
}

@end
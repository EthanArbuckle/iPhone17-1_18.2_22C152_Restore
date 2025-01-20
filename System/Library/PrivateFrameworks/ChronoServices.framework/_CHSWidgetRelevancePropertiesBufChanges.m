@interface _CHSWidgetRelevancePropertiesBufChanges
- (BOOL)replacementIsDeletion;
- (BOOL)replacementSupportsBackgroundRefresh;
- (double)replacementLastRelevanceUpdate;
- (uint64_t)changeTypeIsDeletion;
- (uint64_t)changeTypeLastRelevanceUpdate;
- (uint64_t)changeTypeRelevances;
- (unsigned)replacementRelevances;
- (void)omitExtensionIdentity;
- (void)omitIsDeletion;
- (void)omitKind;
- (void)omitLastRelevanceUpdate;
- (void)omitRelevances;
- (void)omitSupportsBackgroundRefresh;
- (void)preserveExtensionIdentity;
- (void)preserveIsDeletion;
- (void)preserveKind;
- (void)preserveLastRelevanceUpdate;
- (void)preserveRelevances;
- (void)preserveSupportsBackgroundRefresh;
- (void)replaceExtensionIdentity:(id)a3;
- (void)replaceIsDeletion:(BOOL)a3;
- (void)replaceKind:(id)a3;
- (void)replaceLastRelevanceUpdate:(double)a3;
- (void)replaceRelevances:(id)a3;
- (void)replaceSupportsBackgroundRefresh:(BOOL)a3;
@end

@implementation _CHSWidgetRelevancePropertiesBufChanges

- (uint64_t)changeTypeRelevances
{
  if (result) {
    return *(unsigned __int8 *)(result + 40);
  }
  return result;
}

- (unsigned)replacementRelevances
{
  if (a1)
  {
    a1 = (unsigned int *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:a1[11]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)replacementSupportsBackgroundRefresh
{
  if (result) {
    return *(unsigned char *)(result + 25) != 0;
  }
  return result;
}

- (uint64_t)changeTypeIsDeletion
{
  if (result) {
    return *(unsigned __int8 *)(result + 26);
  }
  return result;
}

- (BOOL)replacementIsDeletion
{
  if (result) {
    return *(unsigned char *)(result + 27) != 0;
  }
  return result;
}

- (uint64_t)changeTypeLastRelevanceUpdate
{
  if (result) {
    return *(unsigned __int8 *)(result + 28);
  }
  return result;
}

- (double)replacementLastRelevanceUpdate
{
  if (a1) {
    return *(double *)(a1 + 32);
  }
  else {
    return 0.0;
  }
}

- (void)replaceExtensionIdentity:(id)a3
{
  id v5 = a3;
  self->_changeTypeExtensionIdentity = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1562, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementExtensionIdentity = [v5 unsignedIntValue];
}

- (void)omitExtensionIdentity
{
  self->_changeTypeExtensionIdentity = 2;
}

- (void)preserveExtensionIdentity
{
  self->_changeTypeExtensionIdentity = 0;
}

- (void)replaceKind:(id)a3
{
  id v5 = a3;
  self->_changeTypeKind = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1585, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementKind = [v5 unsignedIntValue];
}

- (void)omitKind
{
  self->_changeTypeKind = 2;
}

- (void)preserveKind
{
  self->_changeTypeKind = 0;
}

- (void)replaceSupportsBackgroundRefresh:(BOOL)a3
{
  self->_changeTypeSupportsBackgroundRefresh = 1;
  self->_replacementSupportsBackgroundRefresh = a3;
}

- (void)omitSupportsBackgroundRefresh
{
  self->_changeTypeSupportsBackgroundRefresh = 2;
}

- (void)preserveSupportsBackgroundRefresh
{
  self->_changeTypeSupportsBackgroundRefresh = 0;
}

- (void)replaceIsDeletion:(BOOL)a3
{
  self->_changeTypeIsDeletion = 1;
  self->_replacementIsDeletion = a3;
}

- (void)omitIsDeletion
{
  self->_changeTypeIsDeletion = 2;
}

- (void)preserveIsDeletion
{
  self->_changeTypeIsDeletion = 0;
}

- (void)replaceLastRelevanceUpdate:(double)a3
{
  self->_changeTypeLastRelevanceUpdate = 1;
  self->_replacementLastRelevanceUpdate = a3;
}

- (void)omitLastRelevanceUpdate
{
  self->_changeTypeLastRelevanceUpdate = 2;
}

- (void)preserveLastRelevanceUpdate
{
  self->_changeTypeLastRelevanceUpdate = 0;
}

- (void)replaceRelevances:(id)a3
{
  id v5 = a3;
  self->_changeTypeRelevances = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1671, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementRelevances = [v5 unsignedIntValue];
}

- (void)omitRelevances
{
  self->_changeTypeRelevances = 2;
}

- (void)preserveRelevances
{
  self->_changeTypeRelevances = 0;
}

@end
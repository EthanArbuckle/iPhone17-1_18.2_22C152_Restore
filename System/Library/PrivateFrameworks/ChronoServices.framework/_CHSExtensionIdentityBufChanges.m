@interface _CHSExtensionIdentityBufChanges
- (uint64_t)changeTypeContainerBundleIdentifier;
- (uint64_t)changeTypeDeviceIdentifier;
- (unsigned)replacementContainerBundleIdentifier;
- (unsigned)replacementDeviceIdentifier;
- (void)omitContainerBundleIdentifier;
- (void)omitDeviceIdentifier;
- (void)omitExtensionBundleIdentifier;
- (void)omitTokenString;
- (void)preserveContainerBundleIdentifier;
- (void)preserveDeviceIdentifier;
- (void)preserveExtensionBundleIdentifier;
- (void)preserveTokenString;
- (void)replaceContainerBundleIdentifier:(id)a3;
- (void)replaceDeviceIdentifier:(id)a3;
- (void)replaceExtensionBundleIdentifier:(id)a3;
- (void)replaceTokenString:(id)a3;
@end

@implementation _CHSExtensionIdentityBufChanges

- (uint64_t)changeTypeContainerBundleIdentifier
{
  if (result) {
    return *(unsigned __int8 *)(result + 24);
  }
  return result;
}

- (unsigned)replacementContainerBundleIdentifier
{
  if (a1)
  {
    a1 = (unsigned int *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:a1[7]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)changeTypeDeviceIdentifier
{
  if (result) {
    return *(unsigned __int8 *)(result + 32);
  }
  return result;
}

- (unsigned)replacementDeviceIdentifier
{
  if (a1)
  {
    a1 = (unsigned int *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithUnsignedInt:a1[9]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)replaceTokenString:(id)a3
{
  id v5 = a3;
  self->_changeTypeTokenString = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1014, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementTokenString = [v5 unsignedIntValue];
}

- (void)omitTokenString
{
  self->_changeTypeTokenString = 2;
}

- (void)preserveTokenString
{
  self->_changeTypeTokenString = 0;
}

- (void)replaceExtensionBundleIdentifier:(id)a3
{
  id v5 = a3;
  self->_changeTypeExtensionBundleIdentifier = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1037, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementExtensionBundleIdentifier = [v5 unsignedIntValue];
}

- (void)omitExtensionBundleIdentifier
{
  self->_changeTypeExtensionBundleIdentifier = 2;
}

- (void)preserveExtensionBundleIdentifier
{
  self->_changeTypeExtensionBundleIdentifier = 0;
}

- (void)replaceContainerBundleIdentifier:(id)a3
{
  id v5 = a3;
  self->_changeTypeContainerBundleIdentifier = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1060, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementContainerBundleIdentifier = [v5 unsignedIntValue];
}

- (void)omitContainerBundleIdentifier
{
  self->_changeTypeContainerBundleIdentifier = 2;
}

- (void)preserveContainerBundleIdentifier
{
  self->_changeTypeContainerBundleIdentifier = 0;
}

- (void)replaceDeviceIdentifier:(id)a3
{
  id v5 = a3;
  self->_changeTypeDeviceIdentifier = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_CHSRelevanceCache_generated.mm", 1083, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementDeviceIdentifier = [v5 unsignedIntValue];
}

- (void)omitDeviceIdentifier
{
  self->_changeTypeDeviceIdentifier = 2;
}

- (void)preserveDeviceIdentifier
{
  self->_changeTypeDeviceIdentifier = 0;
}

@end
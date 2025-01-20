@interface FSVolumeSupportedCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)doesNotSupportImmutableFiles;
- (BOOL)doesNotSupportRootTimes;
- (BOOL)doesNotSupportSettingFilePermissions;
- (BOOL)doesNotSupportVolumeSizes;
- (BOOL)isEqual:(id)a3;
- (BOOL)supports2TBFiles;
- (BOOL)supports64BitObjectIDs;
- (BOOL)supportsActiveJournal;
- (BOOL)supportsDocumentID;
- (BOOL)supportsFastStatFS;
- (BOOL)supportsHardLinks;
- (BOOL)supportsHiddenFiles;
- (BOOL)supportsJournal;
- (BOOL)supportsOpenDenyModes;
- (BOOL)supportsPersistentObjectIDs;
- (BOOL)supportsSharedSpace;
- (BOOL)supportsSparseFiles;
- (BOOL)supportsSymbolicLinks;
- (BOOL)supportsVolumeGroups;
- (BOOL)supportsZeroRuns;
- (FSVolumeSupportedCapabilities)initWithCoder:(id)a3;
- (unint64_t)capabilities;
- (unint64_t)caseSensitivity;
- (void)encodeWithCoder:(id)a3;
- (void)setCaseSensitivity:(unint64_t)a3;
- (void)setDoesNotSupportImmutableFiles:(BOOL)a3;
- (void)setDoesNotSupportRootTimes:(BOOL)a3;
- (void)setDoesNotSupportSettingFilePermissions:(BOOL)a3;
- (void)setDoesNotSupportVolumeSizes:(BOOL)a3;
- (void)setSupports2TBFiles:(BOOL)a3;
- (void)setSupports64BitObjectIDs:(BOOL)a3;
- (void)setSupportsActiveJournal:(BOOL)a3;
- (void)setSupportsDocumentID:(BOOL)a3;
- (void)setSupportsFastStatFS:(BOOL)a3;
- (void)setSupportsHardLinks:(BOOL)a3;
- (void)setSupportsHiddenFiles:(BOOL)a3;
- (void)setSupportsJournal:(BOOL)a3;
- (void)setSupportsOpenDenyModes:(BOOL)a3;
- (void)setSupportsPersistentObjectIDs:(BOOL)a3;
- (void)setSupportsSharedSpace:(BOOL)a3;
- (void)setSupportsSparseFiles:(BOOL)a3;
- (void)setSupportsSymbolicLinks:(BOOL)a3;
- (void)setSupportsVolumeGroups:(BOOL)a3;
- (void)setSupportsZeroRuns:(BOOL)a3;
@end

@implementation FSVolumeSupportedCapabilities

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[FSVolumeSupportedCapabilities capabilities](self, "capabilities"), @"FSKitSupportedCapabilities");
}

- (FSVolumeSupportedCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FSVolumeSupportedCapabilities;
  v5 = [(FSVolumeSupportedCapabilities *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"FSKitSupportedCapabilities"];
    v5[8] = v6 & 1;
    v7.i64[0] = *(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v6) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
    *(_DWORD *)(v5 + 9) = vmovn_s16(v7).u32[0];
    v5[14] = (v6 & 0x40) != 0;
    v5[15] = (v6 & 0x80) != 0;
    v5[25] = (v6 & 0x800000) != 0;
    v5[26] = BYTE3(v6) & 1;
    v5[13] = (v6 & 0x20) != 0;
    uint64x2_t v8 = (uint64x2_t)vdupq_n_s64(v6);
    *((int8x8_t *)v5 + 2) = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_24DDF1BA0), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_24DDF1B90)), (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_24DDF1BC0), (int32x4_t)vshlq_u64(v8, (uint64x2_t)xmmword_24DDF1BB0)))), (int8x8_t)0x101010101010101);
    v5[24] = (v6 & 0x400000) != 0;
    if ((v6 & 0x100) != 0)
    {
      uint64_t v9 = 1;
    }
    else
    {
      if ((v6 & 0x200) == 0)
      {
        *((void *)v5 + 4) = 0;
        goto LABEL_8;
      }
      uint64_t v9 = 2;
    }
    *((void *)v5 + 4) = v9;
  }
LABEL_8:

  return (FSVolumeSupportedCapabilities *)v5;
}

- (unint64_t)capabilities
{
  unint64_t supportsPersistentObjectIDs = self->_supportsPersistentObjectIDs;
  if (self->_supportsSymbolicLinks) {
    supportsPersistentObjectIDs |= 2uLL;
  }
  if (self->_supportsHardLinks) {
    supportsPersistentObjectIDs |= 4uLL;
  }
  if (self->_supportsJournal) {
    supportsPersistentObjectIDs |= 8uLL;
  }
  if (self->_supportsActiveJournal) {
    supportsPersistentObjectIDs |= 0x10uLL;
  }
  if (self->_supportsSparseFiles) {
    supportsPersistentObjectIDs |= 0x40uLL;
  }
  if (self->_supportsZeroRuns) {
    supportsPersistentObjectIDs |= 0x80uLL;
  }
  if (self->_supportsFastStatFS) {
    supportsPersistentObjectIDs |= 0x400uLL;
  }
  if (self->_supports2TBFiles) {
    supportsPersistentObjectIDs |= 0x800uLL;
  }
  if (self->_supportsOpenDenyModes) {
    supportsPersistentObjectIDs |= 0x1000uLL;
  }
  if (self->_supportsHiddenFiles) {
    supportsPersistentObjectIDs |= 0x2000uLL;
  }
  if (self->_supports64BitObjectIDs) {
    supportsPersistentObjectIDs |= 0x20000uLL;
  }
  if (self->_supportsDocumentID) {
    supportsPersistentObjectIDs |= 0x80000uLL;
  }
  if (self->_supportsSharedSpace) {
    supportsPersistentObjectIDs |= 0x800000uLL;
  }
  if (self->_supportsVolumeGroups) {
    supportsPersistentObjectIDs |= 0x1000000uLL;
  }
  if (self->_doesNotSupportVolumeSizes) {
    supportsPersistentObjectIDs |= 0x8000uLL;
  }
  if (self->_doesNotSupportRootTimes) {
    supportsPersistentObjectIDs |= 0x20uLL;
  }
  if (self->_doesNotSupportImmutableFiles) {
    supportsPersistentObjectIDs |= 0x200000uLL;
  }
  if (self->_doesNotSupportSettingFilePermissions) {
    supportsPersistentObjectIDs |= 0x400000uLL;
  }
  if (self->_caseSensitivity == 1) {
    supportsPersistentObjectIDs |= 0x100uLL;
  }
  if (self->_caseSensitivity - 1 >= 2) {
    return supportsPersistentObjectIDs;
  }
  else {
    return supportsPersistentObjectIDs | 0x200;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FSVolumeSupportedCapabilities *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v26 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    BOOL v7 = [(FSVolumeSupportedCapabilities *)self doesNotSupportRootTimes];
    if (v7 != [(FSVolumeSupportedCapabilities *)v6 doesNotSupportRootTimes]) {
      goto LABEL_23;
    }
    BOOL v8 = [(FSVolumeSupportedCapabilities *)self doesNotSupportSettingFilePermissions];
    if (v8 != [(FSVolumeSupportedCapabilities *)v6 doesNotSupportSettingFilePermissions])goto LABEL_23; {
    BOOL v9 = [(FSVolumeSupportedCapabilities *)self supportsSymbolicLinks];
    }
    if (v9 != [(FSVolumeSupportedCapabilities *)v6 supportsSymbolicLinks]) {
      goto LABEL_23;
    }
    BOOL v10 = [(FSVolumeSupportedCapabilities *)self supportsHardLinks];
    if (v10 != [(FSVolumeSupportedCapabilities *)v6 supportsHardLinks]) {
      goto LABEL_23;
    }
    BOOL v11 = [(FSVolumeSupportedCapabilities *)self supports64BitObjectIDs];
    if (v11 != [(FSVolumeSupportedCapabilities *)v6 supports64BitObjectIDs]) {
      goto LABEL_23;
    }
    BOOL v12 = [(FSVolumeSupportedCapabilities *)self supportsDocumentID];
    if (v12 != [(FSVolumeSupportedCapabilities *)v6 supportsDocumentID]) {
      goto LABEL_23;
    }
    BOOL v13 = [(FSVolumeSupportedCapabilities *)self supportsFastStatFS];
    if (v13 != [(FSVolumeSupportedCapabilities *)v6 supportsFastStatFS]) {
      goto LABEL_23;
    }
    BOOL v14 = [(FSVolumeSupportedCapabilities *)self doesNotSupportImmutableFiles];
    if (v14 != [(FSVolumeSupportedCapabilities *)v6 doesNotSupportImmutableFiles]) {
      goto LABEL_23;
    }
    BOOL v15 = [(FSVolumeSupportedCapabilities *)self supportsJournal];
    if (v15 != [(FSVolumeSupportedCapabilities *)v6 supportsJournal]) {
      goto LABEL_23;
    }
    BOOL v16 = [(FSVolumeSupportedCapabilities *)self supportsActiveJournal];
    if (v16 != [(FSVolumeSupportedCapabilities *)v6 supportsActiveJournal]) {
      goto LABEL_23;
    }
    BOOL v17 = [(FSVolumeSupportedCapabilities *)self supportsOpenDenyModes];
    if (v17 != [(FSVolumeSupportedCapabilities *)v6 supportsOpenDenyModes]) {
      goto LABEL_23;
    }
    BOOL v18 = [(FSVolumeSupportedCapabilities *)self supportsPersistentObjectIDs];
    if (v18 != [(FSVolumeSupportedCapabilities *)v6 supportsPersistentObjectIDs]) {
      goto LABEL_23;
    }
    BOOL v19 = [(FSVolumeSupportedCapabilities *)self supportsSharedSpace];
    if (v19 == [(FSVolumeSupportedCapabilities *)v6 supportsSharedSpace]
      && (BOOL v20 = [(FSVolumeSupportedCapabilities *)self supportsSparseFiles],
          v20 == [(FSVolumeSupportedCapabilities *)v6 supportsSparseFiles])
      && (BOOL v21 = [(FSVolumeSupportedCapabilities *)self supportsVolumeGroups],
          v21 == [(FSVolumeSupportedCapabilities *)v6 supportsVolumeGroups])
      && (BOOL v22 = [(FSVolumeSupportedCapabilities *)self doesNotSupportVolumeSizes],
          v22 == [(FSVolumeSupportedCapabilities *)v6 doesNotSupportVolumeSizes])
      && (BOOL v23 = [(FSVolumeSupportedCapabilities *)self supportsVolumeGroups],
          v23 == [(FSVolumeSupportedCapabilities *)v6 supportsVolumeGroups])
      && (BOOL v24 = [(FSVolumeSupportedCapabilities *)self supportsZeroRuns],
          v24 == [(FSVolumeSupportedCapabilities *)v6 supportsZeroRuns])
      && (BOOL v25 = [(FSVolumeSupportedCapabilities *)self supports2TBFiles],
          v25 == [(FSVolumeSupportedCapabilities *)v6 supports2TBFiles]))
    {
      unint64_t v28 = [(FSVolumeSupportedCapabilities *)self caseSensitivity];
      BOOL v26 = v28 == [(FSVolumeSupportedCapabilities *)v6 caseSensitivity];
    }
    else
    {
LABEL_23:
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)supportsPersistentObjectIDs
{
  return self->_supportsPersistentObjectIDs;
}

- (void)setSupportsPersistentObjectIDs:(BOOL)a3
{
  self->_unint64_t supportsPersistentObjectIDs = a3;
}

- (BOOL)supportsSymbolicLinks
{
  return self->_supportsSymbolicLinks;
}

- (void)setSupportsSymbolicLinks:(BOOL)a3
{
  self->_supportsSymbolicLinks = a3;
}

- (BOOL)supportsHardLinks
{
  return self->_supportsHardLinks;
}

- (void)setSupportsHardLinks:(BOOL)a3
{
  self->_supportsHardLinks = a3;
}

- (BOOL)supportsJournal
{
  return self->_supportsJournal;
}

- (void)setSupportsJournal:(BOOL)a3
{
  self->_supportsJournal = a3;
}

- (BOOL)supportsActiveJournal
{
  return self->_supportsActiveJournal;
}

- (void)setSupportsActiveJournal:(BOOL)a3
{
  self->_supportsActiveJournal = a3;
}

- (BOOL)doesNotSupportRootTimes
{
  return self->_doesNotSupportRootTimes;
}

- (void)setDoesNotSupportRootTimes:(BOOL)a3
{
  self->_doesNotSupportRootTimes = a3;
}

- (BOOL)supportsSparseFiles
{
  return self->_supportsSparseFiles;
}

- (void)setSupportsSparseFiles:(BOOL)a3
{
  self->_supportsSparseFiles = a3;
}

- (BOOL)supportsZeroRuns
{
  return self->_supportsZeroRuns;
}

- (void)setSupportsZeroRuns:(BOOL)a3
{
  self->_supportsZeroRuns = a3;
}

- (BOOL)supportsFastStatFS
{
  return self->_supportsFastStatFS;
}

- (void)setSupportsFastStatFS:(BOOL)a3
{
  self->_supportsFastStatFS = a3;
}

- (BOOL)supports2TBFiles
{
  return self->_supports2TBFiles;
}

- (void)setSupports2TBFiles:(BOOL)a3
{
  self->_supports2TBFiles = a3;
}

- (BOOL)supportsOpenDenyModes
{
  return self->_supportsOpenDenyModes;
}

- (void)setSupportsOpenDenyModes:(BOOL)a3
{
  self->_supportsOpenDenyModes = a3;
}

- (BOOL)supportsHiddenFiles
{
  return self->_supportsHiddenFiles;
}

- (void)setSupportsHiddenFiles:(BOOL)a3
{
  self->_supportsHiddenFiles = a3;
}

- (BOOL)doesNotSupportVolumeSizes
{
  return self->_doesNotSupportVolumeSizes;
}

- (void)setDoesNotSupportVolumeSizes:(BOOL)a3
{
  self->_doesNotSupportVolumeSizes = a3;
}

- (BOOL)supports64BitObjectIDs
{
  return self->_supports64BitObjectIDs;
}

- (void)setSupports64BitObjectIDs:(BOOL)a3
{
  self->_supports64BitObjectIDs = a3;
}

- (BOOL)supportsDocumentID
{
  return self->_supportsDocumentID;
}

- (void)setSupportsDocumentID:(BOOL)a3
{
  self->_supportsDocumentID = a3;
}

- (BOOL)doesNotSupportImmutableFiles
{
  return self->_doesNotSupportImmutableFiles;
}

- (void)setDoesNotSupportImmutableFiles:(BOOL)a3
{
  self->_doesNotSupportImmutableFiles = a3;
}

- (BOOL)doesNotSupportSettingFilePermissions
{
  return self->_doesNotSupportSettingFilePermissions;
}

- (void)setDoesNotSupportSettingFilePermissions:(BOOL)a3
{
  self->_doesNotSupportSettingFilePermissions = a3;
}

- (BOOL)supportsSharedSpace
{
  return self->_supportsSharedSpace;
}

- (void)setSupportsSharedSpace:(BOOL)a3
{
  self->_supportsSharedSpace = a3;
}

- (BOOL)supportsVolumeGroups
{
  return self->_supportsVolumeGroups;
}

- (void)setSupportsVolumeGroups:(BOOL)a3
{
  self->_supportsVolumeGroups = a3;
}

- (unint64_t)caseSensitivity
{
  return self->_caseSensitivity;
}

- (void)setCaseSensitivity:(unint64_t)a3
{
  self->_caseSensitivity = a3;
}

@end
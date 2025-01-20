@interface AFBluetoothHeadphoneInEarDetectionState
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
+ (unint64_t)encodeForBTAddress:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5;
+ (void)decodeFromNotifyState:(unint64_t)a3 withCompletion:(id)a4;
- (AFBluetoothHeadphoneInEarDetectionState)init;
- (AFBluetoothHeadphoneInEarDetectionState)initWithBuilder:(id)a3;
- (AFBluetoothHeadphoneInEarDetectionState)initWithCoder:(id)a3;
- (AFBluetoothHeadphoneInEarDetectionState)initWithIsEnabled:(BOOL)a3 primaryEarbudSide:(int64_t)a4 primaryInEarStatus:(int64_t)a5 secondaryInEarStatus:(int64_t)a6;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)primaryEarbudSide;
- (int64_t)primaryInEarStatus;
- (int64_t)secondaryInEarStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFBluetoothHeadphoneInEarDetectionState

- (int64_t)secondaryInEarStatus
{
  return self->_secondaryInEarStatus;
}

- (int64_t)primaryInEarStatus
{
  return self->_primaryInEarStatus;
}

- (int64_t)primaryEarbudSide
{
  return self->_primaryEarbudSide;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL isEnabled = self->_isEnabled;
  id v6 = a3;
  v7 = [v4 numberWithBool:isEnabled];
  [v6 encodeObject:v7 forKey:@"AFBluetoothHeadphoneInEarDetectionState::isEnabled"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_primaryEarbudSide];
  [v6 encodeObject:v8 forKey:@"AFBluetoothHeadphoneInEarDetectionState::primaryEarbudSide"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_primaryInEarStatus];
  [v6 encodeObject:v9 forKey:@"AFBluetoothHeadphoneInEarDetectionState::primaryInEarStatus"];

  id v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_secondaryInEarStatus];
  [v6 encodeObject:v10 forKey:@"AFBluetoothHeadphoneInEarDetectionState::secondaryInEarStatus"];
}

- (AFBluetoothHeadphoneInEarDetectionState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothHeadphoneInEarDetectionState::isEnabled"];
  uint64_t v6 = [v5 BOOLValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothHeadphoneInEarDetectionState::primaryEarbudSide"];
  uint64_t v8 = [v7 integerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothHeadphoneInEarDetectionState::primaryInEarStatus"];
  uint64_t v10 = [v9 integerValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothHeadphoneInEarDetectionState::secondaryInEarStatus"];

  uint64_t v12 = [v11 integerValue];
  return [(AFBluetoothHeadphoneInEarDetectionState *)self initWithIsEnabled:v6 primaryEarbudSide:v8 primaryInEarStatus:v10 secondaryInEarStatus:v12];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFBluetoothHeadphoneInEarDetectionState *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isEnabled = self->_isEnabled;
      if (isEnabled == [(AFBluetoothHeadphoneInEarDetectionState *)v5 isEnabled]
        && (int64_t primaryEarbudSide = self->_primaryEarbudSide,
            primaryEarbudSide == [(AFBluetoothHeadphoneInEarDetectionState *)v5 primaryEarbudSide])
        && (int64_t primaryInEarStatus = self->_primaryInEarStatus,
            primaryInEarStatus == [(AFBluetoothHeadphoneInEarDetectionState *)v5 primaryInEarStatus]))
      {
        int64_t secondaryInEarStatus = self->_secondaryInEarStatus;
        BOOL v10 = secondaryInEarStatus == [(AFBluetoothHeadphoneInEarDetectionState *)v5 secondaryInEarStatus];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isEnabled];
  uint64_t v4 = [v3 hash];
  v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_primaryEarbudSide];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_primaryInEarStatus];
  uint64_t v8 = [v7 hash];
  v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:self->_secondaryInEarStatus];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v19.receiver = self;
  v19.super_class = (Class)AFBluetoothHeadphoneInEarDetectionState;
  v5 = [(AFBluetoothHeadphoneInEarDetectionState *)&v19 description];
  unint64_t primaryEarbudSide = self->_primaryEarbudSide;
  if (primaryEarbudSide > 2) {
    v7 = @"(unknown)";
  }
  else {
    v7 = off_1E5927BF8[primaryEarbudSide];
  }
  BOOL isEnabled = self->_isEnabled;
  v9 = v7;
  unint64_t primaryInEarStatus = self->_primaryInEarStatus;
  if (primaryInEarStatus > 3) {
    v11 = @"(unknown)";
  }
  else {
    v11 = off_1E592B038[primaryInEarStatus];
  }
  uint64_t v12 = v11;
  unint64_t secondaryInEarStatus = self->_secondaryInEarStatus;
  if (secondaryInEarStatus > 3) {
    v14 = @"(unknown)";
  }
  else {
    v14 = off_1E592B038[secondaryInEarStatus];
  }
  if (isEnabled) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v16 = v14;
  v17 = (void *)[v4 initWithFormat:@"%@ {BOOL isEnabled = %@, primaryEarbudSide = %@, primaryInEarStatus = %@, secondaryInEarStatus = %@}", v5, v15, v9, v12, v16];

  return v17;
}

- (id)description
{
  return [(AFBluetoothHeadphoneInEarDetectionState *)self _descriptionWithIndent:0];
}

- (AFBluetoothHeadphoneInEarDetectionState)initWithIsEnabled:(BOOL)a3 primaryEarbudSide:(int64_t)a4 primaryInEarStatus:(int64_t)a5 secondaryInEarStatus:(int64_t)a6
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __119__AFBluetoothHeadphoneInEarDetectionState_initWithIsEnabled_primaryEarbudSide_primaryInEarStatus_secondaryInEarStatus___block_invoke;
  v7[3] = &__block_descriptor_57_e59_v16__0___AFBluetoothHeadphoneInEarDetectionStateMutating__8l;
  BOOL v8 = a3;
  v7[4] = a4;
  v7[5] = a5;
  v7[6] = a6;
  return [(AFBluetoothHeadphoneInEarDetectionState *)self initWithBuilder:v7];
}

void __119__AFBluetoothHeadphoneInEarDetectionState_initWithIsEnabled_primaryEarbudSide_primaryInEarStatus_secondaryInEarStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = a2;
  [v4 setIsEnabled:v3];
  [v4 setPrimaryEarbudSide:*(void *)(a1 + 32)];
  [v4 setPrimaryInEarStatus:*(void *)(a1 + 40)];
  [v4 setSecondaryInEarStatus:*(void *)(a1 + 48)];
}

- (AFBluetoothHeadphoneInEarDetectionState)init
{
  return [(AFBluetoothHeadphoneInEarDetectionState *)self initWithBuilder:0];
}

- (AFBluetoothHeadphoneInEarDetectionState)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothHeadphoneInEarDetectionStateMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)AFBluetoothHeadphoneInEarDetectionState;
  v5 = [(AFBluetoothHeadphoneInEarDetectionState *)&v9 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_AFBluetoothHeadphoneInEarDetectionStateMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v7 isDirty])
    {
      v6->_BOOL isEnabled = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v7 getIsEnabled];
      v6->_unint64_t primaryEarbudSide = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v7 getPrimaryEarbudSide];
      v6->_unint64_t primaryInEarStatus = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v7 getPrimaryInEarStatus];
      v6->_unint64_t secondaryInEarStatus = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v7 getSecondaryInEarStatus];
    }
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothHeadphoneInEarDetectionStateMutation *))a3;
  if (v4)
  {
    v5 = [[_AFBluetoothHeadphoneInEarDetectionStateMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFBluetoothHeadphoneInEarDetectionState);
      v6->_BOOL isEnabled = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v5 getIsEnabled];
      v6->_unint64_t primaryEarbudSide = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v5 getPrimaryEarbudSide];
      v6->_unint64_t primaryInEarStatus = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v5 getPrimaryInEarStatus];
      v6->_unint64_t secondaryInEarStatus = [(_AFBluetoothHeadphoneInEarDetectionStateMutation *)v5 getSecondaryInEarStatus];
    }
    else
    {
      uint64_t v6 = (AFBluetoothHeadphoneInEarDetectionState *)[(AFBluetoothHeadphoneInEarDetectionState *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFBluetoothHeadphoneInEarDetectionState *)[(AFBluetoothHeadphoneInEarDetectionState *)self copy];
  }

  return v6;
}

+ (void)decodeFromNotifyState:(unint64_t)a3 withCompletion:(id)a4
{
  v5 = (void (**)(id, void *, id, id))a4;
  uint64x2_t v12 = (uint64x2_t)vdupq_n_s64(a3);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__AFBluetoothHeadphoneInEarDetectionState_ADBluetoothObserver__decodeFromNotifyState_withCompletion___block_invoke;
  v17[3] = &__block_descriptor_57_e59_v16__0___AFBluetoothHeadphoneInEarDetectionStateMutating__8l;
  BOOL v20 = (a3 & 0x40) != 0;
  int8x16_t v11 = (int8x16_t)vdupq_n_s64(3uLL);
  int8x16_t v18 = vandq_s8((int8x16_t)vshlq_u64(v12, (uint64x2_t)xmmword_19D0E2520), v11);
  unint64_t v19 = a3 & 3;
  id v6 = +[AFBluetoothHeadphoneInEarDetectionState newWithBuilder:v17];
  unint64_t v7 = a3 >> 14;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__AFBluetoothHeadphoneInEarDetectionState_ADBluetoothObserver__decodeFromNotifyState_withCompletion___block_invoke_2;
  v13[3] = &__block_descriptor_57_e59_v16__0___AFBluetoothHeadphoneInEarDetectionStateMutating__8l;
  BOOL v16 = (a3 & 0x2000) != 0;
  int8x16_t v14 = vandq_s8((int8x16_t)vshlq_u64(v12, (uint64x2_t)xmmword_19D0E2530), v11);
  unint64_t v15 = (a3 >> 7) & 3;
  id v8 = +[AFBluetoothHeadphoneInEarDetectionState newWithBuilder:v13];
  objc_super v9 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"%2llX", v7);
  if ((unint64_t)[v9 length] >= 3)
  {
    unint64_t v10 = 2;
    do
    {
      [v9 insertString:@":" atIndex:v10];
      v10 += 3;
    }
    while (v10 < [v9 length]);
  }
  v5[2](v5, v9, v8, v6);
}

void __101__AFBluetoothHeadphoneInEarDetectionState_ADBluetoothObserver__decodeFromNotifyState_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = a2;
  [v4 setIsEnabled:v3];
  [v4 setPrimaryEarbudSide:*(void *)(a1 + 32)];
  [v4 setPrimaryInEarStatus:*(void *)(a1 + 40)];
  [v4 setSecondaryInEarStatus:*(void *)(a1 + 48)];
}

void __101__AFBluetoothHeadphoneInEarDetectionState_ADBluetoothObserver__decodeFromNotifyState_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 56);
  id v4 = a2;
  [v4 setIsEnabled:v3];
  [v4 setPrimaryEarbudSide:*(void *)(a1 + 32)];
  [v4 setPrimaryInEarStatus:*(void *)(a1 + 40)];
  [v4 setSecondaryInEarStatus:*(void *)(a1 + 48)];
}

+ (unint64_t)encodeForBTAddress:(id)a3 headphoneInEarDetectionStateDidChangeFrom:(id)a4 to:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v24 = 0;
  unint64_t v10 = (void *)MEMORY[0x1E4F28FE8];
  int8x16_t v11 = [v7 stringByReplacingOccurrencesOfString:@":" withString:&stru_1EEE35D28];
  uint64x2_t v12 = [v10 scannerWithString:v11];

  unint64_t v13 = 0;
  if ([v12 scanHexLongLong:&v24])
  {
    v24 *= 2;
    unsigned int v14 = [v8 isEnabled];
    uint64_t v24 = 4 * (v24 | v14);
    uint64_t v15 = [v8 primaryEarbudSide];
    uint64_t v24 = 4 * (v24 | v15);
    uint64_t v16 = [v8 primaryInEarStatus];
    uint64_t v24 = 4 * (v24 | v16);
    uint64_t v17 = [v8 secondaryInEarStatus];
    uint64_t v24 = 2 * (v24 | v17);
    unsigned int v18 = [v9 isEnabled];
    uint64_t v24 = 4 * (v24 | v18);
    uint64_t v19 = [v9 primaryEarbudSide];
    uint64_t v24 = 4 * (v24 | v19);
    uint64_t v20 = [v9 primaryInEarStatus];
    uint64_t v24 = 4 * (v24 | v20);
    uint64_t v21 = [v9 secondaryInEarStatus];
    unint64_t v13 = v24 | v21;
    v24 |= v21;
    v22 = AFSiriLogContextDaemon;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136316162;
      v26 = "+[AFBluetoothHeadphoneInEarDetectionState(ADBluetoothObserver) encodeForBTAddress:headphoneInEarDetectionSta"
            "teDidChangeFrom:to:]";
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v8;
      __int16 v31 = 2112;
      id v32 = v9;
      __int16 v33 = 2048;
      unint64_t v34 = v13;
      _os_log_debug_impl(&dword_19CF1D000, v22, OS_LOG_TYPE_DEBUG, "%s Encoding (%@) %@ -> %@: %lld", buf, 0x34u);
      unint64_t v13 = v24;
    }
  }

  return v13;
}

@end
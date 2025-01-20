@interface ALSCTrivialGreenClient
+ (id)_skuRegionCode;
- (ALSCTrivialGreenClient)init;
- (BOOL)calculatedKey2Value;
- (BOOL)key1Value;
- (BOOL)key3Value;
- (BOOL)valuesFinalized;
- (id)_initWithSKURegionCode:(id)a3 key2EnablingSKURegionCodes:(id)a4;
- (void)setCalculatedKey2Value:(BOOL)a3;
@end

@implementation ALSCTrivialGreenClient

+ (id)_skuRegionCode
{
  v2 = (void *)MGCopyAnswer();
  return v2;
}

- (ALSCTrivialGreenClient)init
{
  id v3 = +[ALSCTrivialGreenClient _skuRegionCode];
  return (ALSCTrivialGreenClient *)[(ALSCTrivialGreenClient *)self _initWithSKURegionCode:v3 key2EnablingSKURegionCodes:&unk_1EDF2A2D0];
}

- (id)_initWithSKURegionCode:(id)a3 key2EnablingSKURegionCodes:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)ALSCTrivialGreenClient;
  v6 = [(ALSCTrivialGreenClient *)&v10 init];
  if (v6)
  {
    if (a3) {
      uint64_t v7 = [a4 containsObject:a3];
    }
    else {
      uint64_t v7 = 0;
    }
    [(ALSCTrivialGreenClient *)v6 setCalculatedKey2Value:v7];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(ALSCTrivialGreenClient *)v6 calculatedKey2Value];
      *(_DWORD *)buf = 67109378;
      BOOL v12 = v8;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_18FB7F000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trivial green calculated value %d for region code %@", buf, 0x12u);
    }
  }
  return v6;
}

- (BOOL)valuesFinalized
{
  return 1;
}

- (BOOL)key1Value
{
  return 0;
}

- (BOOL)key3Value
{
  return 0;
}

- (BOOL)calculatedKey2Value
{
  return self->_calculatedKey2Value;
}

- (void)setCalculatedKey2Value:(BOOL)a3
{
  self->_calculatedKey2Value = a3;
}

@end
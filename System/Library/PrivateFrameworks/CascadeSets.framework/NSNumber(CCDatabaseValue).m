@interface NSNumber(CCDatabaseValue)
- (id)databaseValue_toData;
- (uint64_t)databaseValue_type;
- (void)databaseValue_type;
@end

@implementation NSNumber(CCDatabaseValue)

- (uint64_t)databaseValue_type
{
  id v1 = a1;
  unsigned int v2 = *(char *)[v1 objCType] - 66;
  if (v2 > 0x31) {
    goto LABEL_6;
  }
  if (((1 << v2) & 0x2848200028483) != 0) {
    return 3;
  }
  if (((1 << v2) & 0x1400000000) != 0) {
    return 2;
  }
LABEL_6:
  v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    [(NSNumber(CCDatabaseValue) *)v1 databaseValue_type];
  }

  return 0;
}

- (id)databaseValue_toData
{
  id v1 = objc_msgSend(a1, "databaseValue_toString");
  unsigned int v2 = objc_msgSend(v1, "databaseValue_toData");

  return v2;
}

- (void)databaseValue_type
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = [a1 objCType];
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "%@ (objCType = %s)", (uint8_t *)&v3, 0x16u);
}

@end
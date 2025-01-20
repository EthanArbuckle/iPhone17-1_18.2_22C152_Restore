@interface BRFileObjectTypeConverter
+ (char)toChar:(unsigned __int8)a3;
+ (unsigned)toBRFileObjectIDType:(char)a3;
@end

@implementation BRFileObjectTypeConverter

+ (char)toChar:(unsigned __int8)a3
{
  if (a3 >= 5u)
  {
    v4 = brc_bread_crumbs((uint64_t)"+[BRFileObjectTypeConverter toChar:]", 34);
    v5 = brc_default_log(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      +[BRFileObjectTypeConverter toChar:]();
    }

    LOBYTE(v3) = 0;
  }
  else
  {
    return 0x6C6E666174uLL >> (8 * a3);
  }
  return v3;
}

+ (unsigned)toBRFileObjectIDType:(char)a3
{
  if (a3 <= 107)
  {
    if (a3 == 97) {
      return 1;
    }
    if (a3 == 102) {
      return 2;
    }
  }
  else
  {
    switch(a3)
    {
      case 'l':
        return 4;
      case 'n':
        return 3;
      case 't':
        return 0;
    }
  }
  v4 = brc_bread_crumbs((uint64_t)"+[BRFileObjectTypeConverter toBRFileObjectIDType:]", 53);
  v5 = brc_default_log(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
    +[BRFileObjectTypeConverter toBRFileObjectIDType:]();
  }

  return 5;
}

+ (void)toChar:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5_3(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: Unrecognized BRFileObjectIDType %d%@");
}

+ (void)toBRFileObjectIDType:.cold.1()
{
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5_3(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: Unrecognized char while converting to BRFileObjectIDType %c%@");
}

@end
@interface LSDatabaseDisplayHeader
@end

@implementation LSDatabaseDisplayHeader

uint64_t ___LSDatabaseDisplayHeader_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 12))
  {
    uint64_t result = CSStoreGetUnit();
    if (!result) {
      return CSStore2::AttributedStringWriter::withWarningColors();
    }
  }
  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_2(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_Error_0.isa, &cfstr_ContainerV08lu.isa, *(unsigned int *)(a1 + 48), *(unsigned int *)(*(void *)(a1 + 40) + 12));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_3()
{
  if (!CSStoreGetUnit()) {
    CSStore2::AttributedStringWriter::withWarningColors();
  }
  uint64_t result = CSStoreGetUnit();
  if (!result) {
    return CSStore2::AttributedStringWriter::withWarningColors();
  }
  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_4(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_Error_0.isa, &cfstr_BundleB08luHas.isa, *(unsigned int *)(a1 + 48), **(unsigned int **)(a1 + 40));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_5(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_Error_0.isa, &cfstr_BundleB08luHas_0.isa, *(unsigned int *)(a1 + 48), *(unsigned int *)(*(void *)(a1 + 40) + 4));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_6()
{
  uint64_t result = CSStoreGetUnit();
  if (!result) {
    return CSStore2::AttributedStringWriter::withWarningColors();
  }
  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_7(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_Error_0.isa, &cfstr_ClaimC08luHasI.isa, *(unsigned int *)(a1 + 48), *(unsigned int *)(*(void *)(a1 + 40) + 16));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_8(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_SeedingIsInPro.isa);
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_9(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_DatabaseIsSeed.isa);
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_10(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_DatabaseSeedin.isa);
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_11(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_Cacheguid_0.isa, &cfstr_NotFound.isa);
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_12(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_Cachesequencen.isa, &cfstr_NotFound.isa);
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_13(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), &cfstr_Path_0.isa, &cfstr_NotFound.isa);
}

@end
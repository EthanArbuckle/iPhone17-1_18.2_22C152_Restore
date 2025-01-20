@interface GEOStrictRegionSearchFilter
- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4;
@end

@implementation GEOStrictRegionSearchFilter

- (BOOL)applyToSearchParameters:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)v4;
  if (!v4 || (-[GEOPDSearchParameters _readSearchFilter]((uint64_t)v4), !*(void *)(v5 + 240)))
  {
    v6 = objc_alloc_init(GEOPDSSearchFilter);
    -[GEOPDSearchParameters setSearchFilter:](v5, v6);
  }
  uint64_t v7 = -[GEOPDSearchParameters searchFilter]((id *)v5);
  if (v7)
  {
    *(_WORD *)(v7 + 116) |= 0x400u;
    *(_WORD *)(v7 + 116) |= 2u;
    *(unsigned char *)(v7 + 112) = 1;
  }

  return 1;
}

@end
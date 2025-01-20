@interface CUIDesignLibrary
+ (CUIDesignColorTraits2)designColorTraitsWithName:(SEL)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 hierarchyLevel:(int64_t)a10;
+ (id)colorWithName:(int64_t)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 error:(id *)a10;
+ (id)colorWithName:(int64_t)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 hierarchyLevel:(int64_t)a10 error:(id *)a11;
+ (id)colorWithTraits2:(CUIDesignColorTraits2 *)a3 error:(id *)a4;
+ (id)colorWithTraits:(CUIDesignColorTraits *)a3 error:(id *)a4;
@end

@implementation CUIDesignLibrary

+ (id)colorWithTraits:(CUIDesignColorTraits *)a3 error:(id *)a4
{
  return [a1 colorWithName:a3->var0 designSystem:a3->var1 palette:a3->var2 colorScheme:a3->var3 contrast:a3->var4 styling:a3->var5 displayGamut:a3->var6 hierarchyLevel:0 error:a4];
}

+ (id)colorWithName:(int64_t)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 hierarchyLevel:(int64_t)a10 error:(id *)a11
{
  kdebug_trace();
  id result = +[CUIDesignLibraryCompositeCatalog compositeCatalogForDesignSystem:a4 colorScheme:a6 contrast:a7 styling:a8 error:a11];
  if (result)
  {
    id v24 = result;
    _CUILog(3, (uint64_t)"-[CUIDesignLibrary colorWithName:%d designSystem:%d palette:%d colorScheme:%d contrast:%d styling:%d displayGamut:%d error:]", v18, v19, v20, v21, v22, v23, a3);
    id v25 = [v24 colorWithName:a3 palette:a5 displayGamut:a9 hierarchyLevel:a10 error:a11];
    kdebug_trace();
    return v25;
  }
  return result;
}

+ (CUIDesignColorTraits2)designColorTraitsWithName:(SEL)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 hierarchyLevel:(int64_t)a10
{
  retstr->var0 = 1;
  retstr->var1 = a4;
  retstr->var2 = a5;
  retstr->var3 = a6;
  retstr->var4 = a7;
  retstr->var5 = a8;
  retstr->var6 = a9;
  retstr->var7 = a10;
  retstr->var8 = a11;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var11 = 0u;
  return result;
}

+ (id)colorWithTraits2:(CUIDesignColorTraits2 *)a3 error:(id *)a4
{
  return [a1 colorWithName:a3->var1 designSystem:a3->var2 palette:a3->var3 colorScheme:a3->var4 contrast:a3->var5 styling:a3->var6 displayGamut:a3->var7 hierarchyLevel:a3->var8 error:a4];
}

+ (id)colorWithName:(int64_t)a3 designSystem:(int64_t)a4 palette:(int64_t)a5 colorScheme:(int64_t)a6 contrast:(int64_t)a7 styling:(int64_t)a8 displayGamut:(int64_t)a9 error:(id *)a10
{
  return [a1 colorWithName:a3 designSystem:a4 palette:a5 colorScheme:a6 contrast:a7 styling:a8 displayGamut:a9 hierarchyLevel:0 error:a10];
}

@end
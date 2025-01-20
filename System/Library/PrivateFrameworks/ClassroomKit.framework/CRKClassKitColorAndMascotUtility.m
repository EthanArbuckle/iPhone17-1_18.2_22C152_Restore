@interface CRKClassKitColorAndMascotUtility
+ (BOOL)setColor:(unint64_t)a3 forClass:(id)a4 error:(id *)a5;
+ (BOOL)setMascot:(unint64_t)a3 forClass:(id)a4 error:(id *)a5;
+ (id)classThemeColors;
+ (id)colorIdentifierForColorType:(unint64_t)a3;
+ (id)colorTypesByColorIdentifier;
+ (id)mascotIdentifierForMascotType:(unint64_t)a3;
+ (id)mascotTypesByMascotIdentifier;
+ (unint64_t)classColorFromClassName:(id)a3;
+ (unint64_t)colorForClass:(id)a3;
+ (unint64_t)colorTypeForColorIdentifier:(id)a3;
+ (unint64_t)defaultMascot;
+ (unint64_t)mascotForClass:(id)a3;
+ (unint64_t)mascotTypeForMascotIdentifier:(id)a3;
@end

@implementation CRKClassKitColorAndMascotUtility

+ (unint64_t)mascotForClass:(id)a3
{
  id v4 = a3;
  v5 = [[CRKClassKitIconID alloc] initWithClass:v4];

  v6 = [(CRKClassKitIconID *)v5 mascotIdentifier];

  unint64_t v7 = [a1 mascotTypeForMascotIdentifier:v6];
  return v7;
}

+ (BOOL)setMascot:(unint64_t)a3 forClass:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 mascotIdentifierForMascotType:a3];
  if (v9)
  {
    v10 = [[CRKClassKitIconID alloc] initWithClass:v8];
    [(CRKClassKitIconID *)v10 setMascotIdentifier:v9];
    v11 = [(CRKClassKitIconID *)v10 stringValue];
    [v8 setIconID:v11];
  }
  else if (a5)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_26D819E70);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 != 0;
}

+ (unint64_t)defaultMascot
{
  return 0;
}

+ (unint64_t)mascotTypeForMascotIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 mascotTypesByMascotIdentifier];
    v6 = [v5 objectForKeyedSubscript:v4];

    if (v6)
    {
      uint64_t v7 = [v6 integerValue];
    }
    else
    {
      v9 = _CRKLogASM_10();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[CRKClassKitColorAndMascotUtility mascotTypeForMascotIdentifier:]((uint64_t)v4, v9);
      }

      uint64_t v7 = [a1 defaultMascot];
    }
    unint64_t v8 = v7;
  }
  else
  {
    unint64_t v8 = [a1 defaultMascot];
  }

  return v8;
}

+ (id)mascotIdentifierForMascotType:(unint64_t)a3
{
  id v4 = [a1 mascotTypesByMascotIdentifier];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 allKeysForObject:v5];

  uint64_t v7 = [v6 firstObject];

  return v7;
}

+ (id)mascotTypesByMascotIdentifier
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__CRKClassKitColorAndMascotUtility_mascotTypesByMascotIdentifier__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (mascotTypesByMascotIdentifier_onceToken != -1) {
    dispatch_once(&mascotTypesByMascotIdentifier_onceToken, v4);
  }
  v2 = (void *)mascotTypesByMascotIdentifier_mascotTypesByIconIdentifier;

  return v2;
}

void __65__CRKClassKitColorAndMascotUtility_mascotTypesByMascotIdentifier__block_invoke(uint64_t a1)
{
  v2 = (void *)mascotTypesByMascotIdentifier_mascotTypesByIconIdentifier;
  mascotTypesByMascotIdentifier_mascotTypesByIconIdentifier = (uint64_t)&unk_26D819E98;

  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [&unk_26D819E98 allKeys];
  id v10 = [v3 setWithArray:v4];

  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [&unk_26D819E98 allValues];
  uint64_t v7 = [v5 setWithArray:v6];

  uint64_t v8 = [v10 count];
  if (v8 != [v7 count])
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"CRKClassKitColorAndMascotUtility.m" lineNumber:85 description:@"Multiple icon identifiers map to the same mascot type"];
  }
}

+ (unint64_t)colorForClass:(id)a3
{
  id v4 = a3;
  v5 = [[CRKClassKitIconID alloc] initWithClass:v4];
  v6 = [(CRKClassKitIconID *)v5 colorIdentifier];

  if (v6)
  {
    unint64_t v7 = [a1 colorTypeForColorIdentifier:v6];
  }
  else
  {
    uint64_t v8 = [v4 className];
    unint64_t v7 = [a1 classColorFromClassName:v8];
  }
  return v7;
}

+ (BOOL)setColor:(unint64_t)a3 forClass:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 colorIdentifierForColorType:a3];
  if (v9)
  {
    id v10 = [[CRKClassKitIconID alloc] initWithClass:v8];
    [(CRKClassKitIconID *)v10 setColorIdentifier:v9];
    v11 = [(CRKClassKitIconID *)v10 stringValue];
    [v8 setIconID:v11];
  }
  else if (a5)
  {
    CRKErrorWithCodeAndUserInfo(2, &unk_26D819EC0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 != 0;
}

+ (unint64_t)colorTypeForColorIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [a1 colorTypesByColorIdentifier];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    unint64_t v7 = [v6 integerValue];
  }
  else
  {
    id v8 = _CRKLogASM_10();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CRKClassKitColorAndMascotUtility colorTypeForColorIdentifier:]((uint64_t)v4, v8);
    }

    unint64_t v7 = 4;
  }

  return v7;
}

+ (id)colorIdentifierForColorType:(unint64_t)a3
{
  id v4 = [a1 colorTypesByColorIdentifier];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 allKeysForObject:v5];

  unint64_t v7 = [v6 firstObject];

  return v7;
}

+ (id)colorTypesByColorIdentifier
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__CRKClassKitColorAndMascotUtility_colorTypesByColorIdentifier__block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a2;
  v4[5] = a1;
  if (colorTypesByColorIdentifier_onceToken != -1) {
    dispatch_once(&colorTypesByColorIdentifier_onceToken, v4);
  }
  v2 = (void *)colorTypesByColorIdentifier_colorTypesByColorIdentifier;

  return v2;
}

void __63__CRKClassKitColorAndMascotUtility_colorTypesByColorIdentifier__block_invoke(uint64_t a1)
{
  v2 = (void *)colorTypesByColorIdentifier_colorTypesByColorIdentifier;
  colorTypesByColorIdentifier_colorTypesByColorIdentifier = (uint64_t)&unk_26D819EE8;

  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = [&unk_26D819EE8 allKeys];
  id v10 = [v3 setWithArray:v4];

  v5 = (void *)MEMORY[0x263EFFA08];
  v6 = [&unk_26D819EE8 allValues];
  unint64_t v7 = [v5 setWithArray:v6];

  uint64_t v8 = [v10 count];
  if (v8 != [v7 count])
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 32) object:*(void *)(a1 + 40) file:@"CRKClassKitColorAndMascotUtility.m" lineNumber:149 description:@"Multiple color identifiers map to the same color type"];
  }
}

+ (unint64_t)classColorFromClassName:(id)a3
{
  id v4 = a3;
  v5 = [a1 classThemeColors];
  v6 = v5;
  if (v4)
  {
    unint64_t v7 = objc_msgSend(v5, "objectAtIndexedSubscript:", +[CRKASMHasher asmHashForString:maximumExclusive:](CRKASMHasher, "asmHashForString:maximumExclusive:", v4, objc_msgSend(v5, "count")));
    unint64_t v8 = [v7 integerValue];
  }
  else
  {
    v9 = _CRKLogASM_10();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CRKClassKitColorAndMascotUtility classColorFromClassName:](v9);
    }

    unint64_t v8 = 8;
  }

  return v8;
}

+ (id)classThemeColors
{
  if (classThemeColors_onceToken != -1) {
    dispatch_once(&classThemeColors_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)classThemeColors_classThemeColors;

  return v2;
}

void __52__CRKClassKitColorAndMascotUtility_classThemeColors__block_invoke()
{
  v0 = (void *)classThemeColors_classThemeColors;
  classThemeColors_classThemeColors = (uint64_t)&unk_26D81A390;
}

+ (void)mascotTypeForMascotIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Unknown mascot identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)colorTypeForColorIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Unknown color identifier: %{public}@", (uint8_t *)&v2, 0xCu);
}

+ (void)classColorFromClassName:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "ERROR: Attempted to get class color before the class was named", v1, 2u);
}

@end
@interface ISSymbol
+ (id)_generateVariantKeyFromOptions:(unint64_t)a3;
+ (id)symbolForType:(id)a3;
+ (id)symbolForTypeIdentifier:(id)a3 error:(id *)a4;
+ (id)symbolForTypeIdentifier:(id)a3 withResolutionStrategy:(int64_t)a4 variantOptions:(unint64_t)a5 error:(id *)a6;
+ (id)symbolForURL:(id)a3;
@end

@implementation ISSymbol

+ (id)symbolForTypeIdentifier:(id)a3 withResolutionStrategy:(int64_t)a4 variantOptions:(unint64_t)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    v11 = [a1 _generateVariantKeyFromOptions:a5];
    v12 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:v10];
    v13 = v12;
    switch(a4)
    {
      case 0:
        objc_msgSend(v12, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:", v11, 0);
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 1:
        v18 = objc_msgSend(v12, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:preferHeroOverBaseSymbol:", v11, 0, 1);
        v17 = v18;
        if (v11) {
          goto LABEL_14;
        }
        uint64_t v19 = objc_msgSend(v18, "_IS_symbolHeroName");
        if (!v19) {
          goto LABEL_18;
        }
        goto LABEL_17;
      case 2:
        objc_msgSend(v12, "_IS_symbolProvidingRecordWithVariantKey:allowNonVariantMatch:", v11, 1);
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 3:
        id v14 = v12;
LABEL_13:
        v17 = v14;
        if (!v11) {
          goto LABEL_18;
        }
LABEL_14:
        uint64_t v21 = objc_msgSend(v17, "_IS_symbolNameForVariantKey:", v11);
        goto LABEL_19;
      case 4:
        id v20 = v12;
LABEL_16:
        v17 = v20;
        uint64_t v19 = objc_msgSend(v20, "_IS_symbolNameForVariantKey:", v11);
        if (v19)
        {
LABEL_17:
          v22 = (void *)v19;
LABEL_20:
          if ([v17 isCoreType])
          {
            v23 = 0;
          }
          else
          {
            v23 = [v17 iconResourceBundleURL];
          }
          v16 = [(IFSymbol *)[ISSymbol alloc] initWithSymbolName:v22 bundleURL:v23];

          goto LABEL_26;
        }
LABEL_18:
        uint64_t v21 = objc_msgSend(v17, "_IS_symbolName");
LABEL_19:
        v22 = (void *)v21;
        if (v21) {
          goto LABEL_20;
        }
LABEL_22:
        if (a6)
        {
          v24 = [NSString stringWithFormat:@"Failed to find symbol using type id: %@. Options: %lu, strategy: %ld", v10, a5, a4, *MEMORY[0x1E4F28568]];
          v27 = v24;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];

          [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.iconServices.symbol-error" code:-1 userInfo:v22];
          v16 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

          goto LABEL_27;
        }
        v16 = 0;
LABEL_27:

        break;
      default:
        v17 = 0;
        goto LABEL_22;
    }
  }
  else
  {
    if (!a6)
    {
      v16 = 0;
      goto LABEL_29;
    }
    uint64_t v28 = *MEMORY[0x1E4F28568];
    v15 = [NSString stringWithFormat:@"Invalid type id"];
    v29[0] = v15;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

    [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.iconServices.symbol-error" code:-2 userInfo:v11];
    v16 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_29:
  return v16;
}

+ (id)_generateVariantKeyFromOptions:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v12 = 0;
  }
  else
  {
    if (_generateVariantKeyFromOptions__onceToken != -1) {
      dispatch_once(&_generateVariantKeyFromOptions__onceToken, &__block_literal_global_15);
    }
    v4 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)_generateVariantKeyFromOptions__orderedOptions;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v10, "unsignedIntegerValue", (void)v15) & a3) != 0)
          {
            v11 = [(id)_generateVariantKeyFromOptions__optionsToKeyPieces objectForKeyedSubscript:v10];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    if ([v4 count])
    {
      v12 = [v4 componentsJoinedByString:@"."];
    }
    else
    {
      v13 = _ISDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        +[ISSymbol _generateVariantKeyFromOptions:](v13);
      }

      v12 = 0;
    }
  }
  return v12;
}

+ (id)symbolForURL:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "__is_isApplication"))
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F223C8]) initWithURL:v3 allowPlaceholder:1 error:0];
  }
  else
  {
    if (!objc_msgSend(v3, "__is_isAppExtension"))
    {
      id v5 = 0;
      goto LABEL_10;
    }
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F223A0]) initWithURL:v3 error:0];
  }
  id v5 = (void *)v4;
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 iconDictionary];
      uint64_t v7 = objc_msgSend(v6, "_IF_stringForKey:", 0x1F063A2B0);

      if (v7)
      {
        uint64_t v8 = [v5 URL];
        v9 = [(IFSymbol *)[ISSymbol alloc] initWithSymbolName:v7 bundleURL:v8];

        goto LABEL_11;
      }
    }
  }
LABEL_10:
  uint64_t v7 = objc_msgSend(v3, "__is_typeIdentifier");
  v9 = +[ISSymbol symbolForType:v7];
LABEL_11:

  return v9;
}

+ (id)symbolForType:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)*MEMORY[0x1E4F22608];
  }
  id v9 = 0;
  id v5 = [a1 symbolForTypeIdentifier:v4 withResolutionStrategy:0 variantOptions:1 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    uint64_t v7 = _ISDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[ISSymbol symbolForType:v7];
    }

    id v5 = [(IFSymbol *)[ISSymbol alloc] initWithSymbolName:@"questionmark.square" bundleURL:0];
  }

  return v5;
}

+ (id)symbolForTypeIdentifier:(id)a3 error:(id *)a4
{
  return (id)[a1 symbolForTypeIdentifier:a3 withResolutionStrategy:0 variantOptions:1 error:a4];
}

void __43__ISSymbol__generateVariantKeyFromOptions___block_invoke()
{
  v6[33] = *MEMORY[0x1E4F143B8];
  v5[0] = &unk_1F064AC78;
  v5[1] = &unk_1F064AC90;
  v6[0] = @"fill";
  v6[1] = @"landscape";
  v5[2] = &unk_1F064ACA8;
  v5[3] = &unk_1F064ACC0;
  v6[2] = @"slash";
  v6[3] = @"radio_leftright";
  v5[4] = &unk_1F064ACD8;
  v5[5] = &unk_1F064ACF0;
  v6[4] = @"apps";
  v6[5] = @"righttoleft";
  v5[6] = &unk_1F064AD08;
  v5[7] = &unk_1F064AD20;
  v6[6] = @"badge_play";
  v6[7] = @"badge_plus";
  v5[8] = &unk_1F064AD38;
  v5[9] = &unk_1F064AD50;
  v6[8] = @"badge_minus";
  v6[9] = @"badge_checkmark";
  v5[10] = &unk_1F064AD68;
  v5[11] = &unk_1F064AD80;
  v6[10] = @"badge_xmark";
  v6[11] = @"badge_questionmark";
  v5[12] = &unk_1F064AD98;
  v5[13] = &unk_1F064ADB0;
  v6[12] = @"badge_exclamationmark";
  v6[13] = @"arrow_forward";
  v5[14] = &unk_1F064ADC8;
  v5[15] = &unk_1F064ADE0;
  v6[14] = @"arrow_turnupforward";
  v6[15] = @"lock_locked";
  v5[16] = &unk_1F064ADF8;
  v5[17] = &unk_1F064AE10;
  v6[16] = @"lock_unlocked";
  v6[17] = @"camerarear";
  v5[18] = &unk_1F064AE28;
  v5[19] = &unk_1F064AE40;
  v6[18] = @"sideright";
  v6[19] = @"exclamationmark";
  v5[20] = &unk_1F064AE58;
  v5[21] = &unk_1F064AE70;
  v6[20] = @"figurerun";
  v6[21] = @"watchface";
  v5[22] = &unk_1F064AE88;
  v5[23] = &unk_1F064AEA0;
  v6[22] = @"left";
  v6[23] = @"right";
  v5[24] = &unk_1F064AEB8;
  v5[25] = &unk_1F064AED0;
  v6[24] = @"chargingcase";
  v6[25] = @"radio_forward";
  v5[26] = &unk_1F064AEE8;
  v5[27] = &unk_1F064AF00;
  v6[26] = @"homepod";
  v6[27] = @"homepodmini";
  v5[28] = &unk_1F064AF18;
  v5[29] = &unk_1F064AF30;
  v6[28] = @"appletv";
  v6[29] = @"imac";
  v5[30] = &unk_1F064AF48;
  v5[31] = &unk_1F064AF60;
  v6[30] = @"laptop";
  v6[31] = @"speaker";
  v5[32] = &unk_1F064AF78;
  v6[32] = @"tv";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:33];
  v1 = (void *)_generateVariantKeyFromOptions__optionsToKeyPieces;
  _generateVariantKeyFromOptions__optionsToKeyPieces = v0;

  v2 = [(id)_generateVariantKeyFromOptions__optionsToKeyPieces allKeys];
  uint64_t v3 = [v2 sortedArrayUsingSelector:sel_compare_];
  id v4 = (void *)_generateVariantKeyFromOptions__orderedOptions;
  _generateVariantKeyFromOptions__orderedOptions = v3;
}

+ (void)symbolForType:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_1AE771000, a3, OS_LOG_TYPE_ERROR, "Failed to find symbol with type %@. Error: %@.", (uint8_t *)&v6, 0x16u);
}

+ (void)_generateVariantKeyFromOptions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE771000, log, OS_LOG_TYPE_ERROR, "Unknown variant option", v1, 2u);
}

@end
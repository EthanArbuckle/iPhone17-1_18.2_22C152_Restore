@interface CFXFilterEffectContentDataSource
- (BOOL)isContentAvailable;
- (BOOL)isContentNew;
- (BOOL)isStyleTransfer;
- (CFXFilterEffectContentDataSource)initWithEffectID:(id)a3;
- (NSNumber)isExpensive;
- (NSNumber)proxyRenderScale;
- (NSNumber)requiredProVideoVersion;
- (NSString)contentVersion;
- (NSString)localizedAccessibilityName;
- (NSString)localizedDisplayName;
- (int64_t)inverseToneMapOperator;
- (unint64_t)contentAvailability;
- (void)setContentAvailability:(unint64_t)a3;
- (void)setContentVersion:(id)a3;
- (void)setInverseToneMapOperator:(int64_t)a3;
- (void)setIsContentAvailable:(BOOL)a3;
- (void)setIsContentNew:(BOOL)a3;
- (void)setIsExpensive:(id)a3;
- (void)setIsStyleTransfer:(BOOL)a3;
- (void)setLocalizedAccessibilityName:(id)a3;
- (void)setLocalizedDisplayName:(id)a3;
- (void)setProxyRenderScale:(id)a3;
- (void)setRequiredProVideoVersion:(id)a3;
@end

@implementation CFXFilterEffectContentDataSource

- (CFXFilterEffectContentDataSource)initWithEffectID:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CFXFilterEffectContentDataSource;
  v5 = [(CFXFilterEffectContentDataSource *)&v54 init];
  if (!v5) {
    goto LABEL_33;
  }
  v6 = [MEMORY[0x263F086E0] jfxBundle];
  v7 = NSDictionary;
  v8 = [v6 pathForResource:kJFXEffectPropertiesResourceFile ofType:kJFXEffectPropertiesPlistKey];
  v9 = [v7 dictionaryWithContentsOfFile:v8];

  v10 = [v9 objectForKey:@"Filters"];
  v11 = v10;
  if (!v10) {
    goto LABEL_14;
  }
  if ([v10 count])
  {
    v12 = [v11 firstObject];
    v13 = [v12 objectForKey:@"effects"];
    v14 = v13;
    if (v13)
    {
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v49 = v13;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        v46 = v12;
        v47 = v9;
        v48 = v6;
        uint64_t v18 = *(void *)v51;
LABEL_7:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v50 + 1) + 8 * v19);
          v21 = [v20 objectForKey:@"identifier"];
          if ([v21 isEqualToString:v4]) {
            break;
          }

          if (v17 == ++v19)
          {
            uint64_t v17 = [v15 countByEnumeratingWithState:&v50 objects:v55 count:16];
            if (v17) {
              goto LABEL_7;
            }
            id v22 = 0;
            int v23 = 1;
            v9 = v47;
            v6 = v48;
            v12 = v46;
            goto LABEL_28;
          }
        }
        id v22 = v20;

        if (!v22)
        {
          int v23 = 1;
          v9 = v47;
          v6 = v48;
          goto LABEL_21;
        }
        v9 = v47;
        v6 = v48;
        if ((unint64_t)[v22 count] < 3)
        {
          int v23 = 1;
LABEL_21:
          v12 = v46;
          goto LABEL_29;
        }
        v5->_isContentAvailable = 0;
        contentVersion = v5->_contentVersion;
        v5->_contentAvailability = 0;
        v5->_contentVersion = (NSString *)@"nodatasource";

        requiredProVideoVersion = v5->_requiredProVideoVersion;
        v5->_requiredProVideoVersion = 0;

        v5->_isContentNew = 0;
        id v15 = [v4 stringByAppendingString:@"_Display Name"];
        v26 = [MEMORY[0x263F086E0] jfxBundle];
        uint64_t v27 = [v26 localizedStringForKey:v15 value:&stru_26E7CDB50 table:0];

        localizedDisplayName = v5->_localizedDisplayName;
        v5->_localizedDisplayName = (NSString *)v27;

        uint64_t v29 = [v4 stringByAppendingString:@"_Accessibility Name"];
        v30 = [MEMORY[0x263F086E0] jfxBundle];
        v31 = [v30 localizedStringForKey:v29 value:&stru_26E7CDB50 table:0];

        objc_storeStrong((id *)&v5->_localizedAccessibilityName, v31);
        uint64_t v32 = [v22 objectForKey:@"isExpensive"];
        isExpensive = v5->_isExpensive;
        v5->_isExpensive = (NSNumber *)v32;

        uint64_t v34 = [v22 objectForKey:@"proxyRenderScale"];
        proxyRenderScale = v5->_proxyRenderScale;
        v5->_proxyRenderScale = (NSNumber *)v34;

        v36 = [v22 objectForKey:@"isStyleTransfer"];
        v43 = v31;
        v45 = (void *)v29;
        v37 = v36;
        if (v36) {
          LOBYTE(v36) = objc_msgSend(v36, "BOOLValue", v31, v29);
        }
        v5->_isStyleTransfer = (char)v36;
        v38 = objc_msgSend(v22, "objectForKey:", *MEMORY[0x263F61690], v43);
        v39 = v38;
        v12 = v46;
        uint64_t v40 = v38 ? (int)[v38 intValue] : 2;
        v5->_inverseToneMapOperator = v40;

        int v23 = 0;
      }
      else
      {
        id v22 = 0;
        int v23 = 1;
      }
LABEL_28:

LABEL_29:
      v14 = v49;
    }
    else
    {
      int v23 = 1;
    }
  }
  else
  {
LABEL_14:
    int v23 = 1;
  }

  if (v23) {
    v41 = 0;
  }
  else {
LABEL_33:
  }
    v41 = v5;

  return v41;
}

- (BOOL)isContentAvailable
{
  return self->_isContentAvailable;
}

- (void)setIsContentAvailable:(BOOL)a3
{
  self->_isContentAvailable = a3;
}

- (unint64_t)contentAvailability
{
  return self->_contentAvailability;
}

- (void)setContentAvailability:(unint64_t)a3
{
  self->_contentAvailability = a3;
}

- (NSString)contentVersion
{
  return self->_contentVersion;
}

- (void)setContentVersion:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (void)setLocalizedDisplayName:(id)a3
{
}

- (NSString)localizedAccessibilityName
{
  return self->_localizedAccessibilityName;
}

- (void)setLocalizedAccessibilityName:(id)a3
{
}

- (NSNumber)requiredProVideoVersion
{
  return self->_requiredProVideoVersion;
}

- (void)setRequiredProVideoVersion:(id)a3
{
}

- (BOOL)isContentNew
{
  return self->_isContentNew;
}

- (void)setIsContentNew:(BOOL)a3
{
  self->_isContentNew = a3;
}

- (NSNumber)isExpensive
{
  return self->_isExpensive;
}

- (void)setIsExpensive:(id)a3
{
}

- (BOOL)isStyleTransfer
{
  return self->_isStyleTransfer;
}

- (void)setIsStyleTransfer:(BOOL)a3
{
  self->_isStyleTransfer = a3;
}

- (NSNumber)proxyRenderScale
{
  return self->_proxyRenderScale;
}

- (void)setProxyRenderScale:(id)a3
{
}

- (int64_t)inverseToneMapOperator
{
  return self->_inverseToneMapOperator;
}

- (void)setInverseToneMapOperator:(int64_t)a3
{
  self->_inverseToneMapOperator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxyRenderScale, 0);
  objc_storeStrong((id *)&self->_isExpensive, 0);
  objc_storeStrong((id *)&self->_requiredProVideoVersion, 0);
  objc_storeStrong((id *)&self->_localizedAccessibilityName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_contentVersion, 0);
}

@end
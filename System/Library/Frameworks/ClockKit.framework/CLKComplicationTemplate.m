@interface CLKComplicationTemplate
+ (BOOL)_arrayIsCompatibleWithJSONSerialization:(id)a3;
+ (BOOL)classIsCompatibleWithJSONSerialization:(Class)a3;
+ (BOOL)dictionaryIsCompatibleWithJSONSerialization:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (CLKComplicationTemplate)complicationTemplateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4 purpose:(unint64_t)a5;
+ (CLKComplicationTemplate)new;
+ (Class)_superClassFromCompatibleJSONSerializationClass:(Class)a3;
+ (id)_createJSONRepresentationFromArray:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5;
+ (id)_jsonObjectRepresentationFromObject:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5;
+ (id)_jsonRepresentationFromValue:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5;
+ (id)_secureCodingRepresentationOfEmbeddedObjectsArray:(id)a3 bundlePath:(id)a4;
+ (id)_secureCodingRepresentationOfEmbeddedObjectsDictionary:(id)a3 bundlePath:(id)a4;
+ (id)_secureCodingRepresentationOfValue:(id)a3 bundlePath:(id)a4;
+ (id)classesCompatibleWithJSONSerialization;
+ (id)createJSONRepresentationFromDictionary:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5;
+ (id)objectFromJSON:(id)a3 bundle:(id)a4;
- (BOOL)_validateSwiftUIViewForKey:(id)a3 withMaxSize:(CGSize)a4 cornerRadius:(double)a5 safeAreaInsets:(UIEdgeInsets)a6 error:(id *)a7;
- (BOOL)finalized;
- (BOOL)hasSubMinuteUpdateRate;
- (BOOL)isCompatibleWithFamily:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLinkedOnOrAfterGrace;
- (BOOL)needsSerializableCopy;
- (BOOL)renderForPreviews;
- (BOOL)usesSwiftUI;
- (BOOL)validateWithError:(id *)a3;
- (CLKComplicationBackgroundDescriptor)backgroundDescriptor;
- (CLKComplicationTemplate)initWithCoder:(id)a3;
- (Class)finalizedCopyClass;
- (NSDate)creationDate;
- (UIColor)tintColor;
- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3 purpose:(unint64_t)a4;
- (id)_validEmbeddedTemplateClassNamesForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)finalizedCopy;
- (id)initPrivate;
- (id)metadata;
- (id)viewDataForSwiftUIViewKey:(id)a3;
- (id)viewDataKeyForSwiftUIViewKey:(id)a3;
- (int64_t)compatibleFamily;
- (int64_t)sdkVersion;
- (int64_t)timeTravelUpdateFrequency;
- (int64_t)uiSensitivity;
- (unint64_t)hash;
- (void)_enumerateAllBasicKeysWithBlock:(id)a3;
- (void)_enumerateScalarKeysWithBlock:(id)a3;
- (void)_setProvidersPaused:(BOOL)a3;
- (void)beginUpdatesForClient:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endUpdatesForClient:(id)a3;
- (void)enumerateEmbeddedTemplateKeysWithBlock:(id)a3;
- (void)enumerateImageProviderKeysWithBlock:(id)a3;
- (void)enumerateProgressProviderKeysWithBlock:(id)a3;
- (void)enumerateSwiftUIViewDataKeysWithBlock:(id)a3;
- (void)enumerateTextProviderKeysWithBlock:(id)a3;
- (void)finalize;
- (void)maxSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forImageProviderKey:(id)a5;
- (void)setBackgroundDescriptor:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRenderForPreviews:(BOOL)a3;
- (void)setSDKVersionFromLS:(id)a3;
- (void)setSdkVersion:(int64_t)a3;
- (void)setTintColor:(UIColor *)tintColor;
- (void)setUISensitivity:(int64_t)a3;
@end

@implementation CLKComplicationTemplate

- (id)initPrivate
{
  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationTemplate;
  v2 = [(CLKComplicationTemplate *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF910] date];
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;
  }
  return v2;
}

+ (CLKComplicationTemplate)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CLKComplicationTemplate;
  return (CLKComplicationTemplate *)objc_msgSendSuper2(&v3, "new");
}

- (void)beginUpdatesForClient:(id)a3
{
  id v4 = a3;
  activeClients = self->_activeClients;
  id v8 = v4;
  if (!activeClients)
  {
    objc_super v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    v7 = self->_activeClients;
    self->_activeClients = v6;

    id v4 = v8;
    activeClients = self->_activeClients;
  }
  [(NSHashTable *)activeClients addObject:v4];
  [(CLKComplicationTemplate *)self _setProvidersPaused:0];
}

- (void)endUpdatesForClient:(id)a3
{
  [(NSHashTable *)self->_activeClients removeObject:a3];
  if (![(NSHashTable *)self->_activeClients count])
  {
    [(CLKComplicationTemplate *)self _setProvidersPaused:1];
  }
}

- (BOOL)hasSubMinuteUpdateRate
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke;
  v8[3] = &unk_26440DBE0;
  v8[4] = self;
  v8[5] = &v9;
  [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v8];
  if (*((unsigned char *)v10 + 24)) {
    goto LABEL_5;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_2;
  v7[3] = &unk_26440DBE0;
  v7[4] = self;
  v7[5] = &v9;
  [(CLKComplicationTemplate *)self _enumerateGaugeProviderKeysWithBlock:v7];
  if (*((unsigned char *)v10 + 24)) {
    goto LABEL_5;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_3;
  v6[3] = &unk_26440DBE0;
  v6[4] = self;
  v6[5] = &v9;
  [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v6];
  if (*((unsigned char *)v10 + 24)
    || (v5[0] = MEMORY[0x263EF8330],
        v5[1] = 3221225472,
        v5[2] = __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_4,
        v5[3] = &unk_26440DBE0,
        v5[4] = self,
        v5[5] = &v9,
        [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v5], *((unsigned char *)v10 + 24)))
  {
LABEL_5:
    BOOL v3 = 1;
  }
  else
  {
    [(CLKComplicationTemplate *)self _enumerateSwiftUIViewDataKeysWithBlock:&__block_literal_global_1];
    BOOL v3 = *((unsigned char *)v10 + 24) != 0;
  }
  _Block_object_dispose(&v9, 8);
  return v3;
}

void __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v7 updateFrequency] >= 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

void __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v7 needsTimerUpdates])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

void __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v7 needsTimerUpdates])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

void __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = [*(id *)(a1 + 32) valueForKey:a2];
  if ([v7 hasSubMinuteUpdateRate])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
}

- (BOOL)isCompatibleWithFamily:(int64_t)a3
{
  return [(CLKComplicationTemplate *)self compatibleFamily] == a3;
}

- (void)setSDKVersionFromLS:(id)a3
{
  if (a3) {
    [a3 compare:@"15.0" options:64];
  }

  -[CLKComplicationTemplate setSdkVersion:](self, "setSdkVersion:");
}

- (void)setSdkVersion:(int64_t)a3
{
  if (!self->_finalized)
  {
    self->_sdkVersion = a3;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __41__CLKComplicationTemplate_setSdkVersion___block_invoke;
    v3[3] = &unk_26440DC28;
    v3[4] = self;
    v3[5] = a3;
    [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v3];
  }
}

void __41__CLKComplicationTemplate_setSdkVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKey:a2];
  [v3 setSdkVersion:*(void *)(a1 + 40)];
}

- (int64_t)timeTravelUpdateFrequency
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke;
  v7[3] = &unk_26440DBE0;
  v7[4] = self;
  v7[5] = &v8;
  [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke_2;
  v6[3] = &unk_26440DBE0;
  v6[4] = self;
  v6[5] = &v8;
  [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke_3;
  v5[3] = &unk_26440DBE0;
  v5[4] = self;
  v5[5] = &v8;
  [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v5];
  int64_t v3 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) valueForKey:a2];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v4 = [v6 timeTravelUpdateFrequency];
  if (v3 <= v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

void __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) valueForKey:a2];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v4 = [v6 timeTravelUpdateFrequency];
  if (v3 <= v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

void __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) valueForKey:a2];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v4 = [v6 timeTravelUpdateFrequency];
  if (v3 <= v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

- (id)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  return 0;
}

- (id)viewDataForSwiftUIViewKey:(id)a3
{
  return 0;
}

- (BOOL)validateWithError:(id *)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v24 = 0;
  v25[0] = &v24;
  v25[1] = 0x3032000000;
  v25[2] = __Block_byref_object_copy_;
  v25[3] = __Block_byref_object_dispose_;
  id v26 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke;
  v19[3] = &unk_26440DC50;
  v19[4] = self;
  v19[5] = &v24;
  v19[6] = &v20;
  v19[7] = &v27;
  [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v19];
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_21;
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_2;
  v18[3] = &unk_26440DC78;
  v18[4] = self;
  v18[5] = &v24;
  v18[6] = &v20;
  v18[7] = &v27;
  [(CLKComplicationTemplate *)self _enumerateImageProviderKeysWithBlock:v18];
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_21;
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_3;
  v17[3] = &unk_26440DC50;
  v17[4] = self;
  v17[5] = &v24;
  v17[6] = &v20;
  v17[7] = &v27;
  [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v17];
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_21;
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_4;
  v16[3] = &unk_26440DCA0;
  v16[4] = self;
  v16[5] = &v24;
  v16[6] = &v20;
  v16[7] = &v27;
  [(CLKComplicationTemplate *)self _enumerateIntegerKeysWithBlock:v16];
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_21;
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_5;
  v15[3] = &unk_26440DCC8;
  v15[4] = self;
  v15[5] = &v24;
  v15[6] = &v20;
  v15[7] = &v27;
  [(CLKComplicationTemplate *)self _enumerateFloatKeysWithBlock:v15];
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_21;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_6;
  v14[3] = &unk_26440DC50;
  v14[4] = self;
  v14[5] = &v24;
  v14[6] = &v20;
  v14[7] = &v27;
  [(CLKComplicationTemplate *)self _enumerateGaugeProviderKeysWithBlock:v14];
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_21;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_7;
  v13[3] = &unk_26440DCF0;
  v13[4] = self;
  v13[5] = &v24;
  v13[6] = &v20;
  v13[7] = &v27;
  [(CLKComplicationTemplate *)self _enumerateFullColorImageProviderKeysWithBlock:v13];
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_21;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_8;
  v12[3] = &unk_26440DD18;
  v12[4] = self;
  v12[5] = &v24;
  v12[6] = &v20;
  v12[7] = &v27;
  v12[8] = a3;
  [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v12];
  if (!*((unsigned char *)v28 + 24)) {
    goto LABEL_21;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_9;
  v11[3] = &unk_26440DD68;
  v11[4] = self;
  v11[5] = &v27;
  v11[6] = &v24;
  v11[7] = &v20;
  v11[8] = a3;
  [(CLKComplicationTemplate *)self _enumerateSwiftUIViewKeysWithBlock:v11];
  if (!*((unsigned char *)v28 + 24))
  {
LABEL_21:
    if (*(void *)(v25[0] + 40))
    {
      if (*((unsigned char *)v21 + 24))
      {
        uint64_t v5 = CLKLoggingObjectForDomain(10);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          -[CLKComplicationTemplate validateWithError:]((uint64_t)v25, v5);
        }
      }
      if (a3 && !*a3)
      {
        id v6 = (void *)MEMORY[0x263F087E8];
        uint64_t v7 = *(void *)(v25[0] + 40);
        uint64_t v31 = *MEMORY[0x263F08320];
        v32[0] = v7;
        uint64_t v8 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
        *a3 = [v6 errorWithDomain:@"CLKComplicationTimelineErrorDomain" code:2 userInfo:v8];
      }
    }
  }
  BOOL v9 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v27, 8);
  return v9;
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, unsigned char *a5)
{
  id v19 = a2;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  BOOL v9 = v8;
  if (v8 || (a3 & 1) != 0)
  {
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v15 = a1 + 56;
    int v17 = *(unsigned __int8 *)(*(void *)(v16 + 8) + 24);
    if (v8) {
      BOOL v18 = v17 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18 || ([v8 validate] & 1) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v10 = NSString;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v10 stringWithFormat:@"Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", v19, v11, objc_opt_class()];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v15 = a1 + 56;
  }
  *(unsigned char *)(*(void *)(*(void *)v15 + 8) + 24) = 0;
  *a5 = 1;
LABEL_10:
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_2(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  id v22 = a2;
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  uint64_t v12 = v11;
  if (v11 || (a3 & 1) != 0)
  {
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v18 = a1 + 56;
    int v20 = *(unsigned __int8 *)(*(void *)(v19 + 8) + 24);
    if (v11) {
      BOOL v21 = v20 == 0;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21 || ([v11 validate] & 1) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v13 = NSString;
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = [v13 stringWithFormat:@"Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", v22, v14, objc_opt_class()];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    int v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v18 = a1 + 56;
  }
  *(unsigned char *)(*(void *)(*(void *)v18 + 8) + 24) = 0;
  *a8 = 1;
LABEL_10:
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_3(uint64_t a1, void *a2, char a3, uint64_t a4, unsigned char *a5)
{
  id v19 = a2;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  BOOL v9 = v8;
  if (v8 || (a3 & 1) != 0)
  {
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v15 = a1 + 56;
    int v17 = *(unsigned __int8 *)(*(void *)(v16 + 8) + 24);
    if (v8) {
      BOOL v18 = v17 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18 || ([v8 validate] & 1) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v10 = NSString;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v10 stringWithFormat:@"Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", v19, v11, objc_opt_class()];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v15 = a1 + 56;
  }
  *(unsigned char *)(*(void *)(*(void *)v15 + 8) + 24) = 0;
  *a5 = 1;
LABEL_10:
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v17 = a2;
  uint64_t v8 = a4;
  BOOL v9 = [*(id *)(a1 + 32) valueForKey:v17];
  uint64_t v10 = [v9 integerValue];

  if (v8 && (v8[2](v8, v10) & 1) == 0)
  {
    uint64_t v11 = NSString;
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [NSNumber numberWithInteger:v10];
    uint64_t v14 = [v11 stringWithFormat:@"%@: invalid value for %@: %@", v12, v17, v13];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4, unsigned char *a5)
{
  id v19 = a2;
  uint64_t v8 = a4;
  BOOL v9 = [*(id *)(a1 + 32) valueForKey:v19];
  [v9 floatValue];
  float v11 = v10;

  if (v8)
  {
    double v12 = v11;
    if ((v8[2](v8, v12) & 1) == 0)
    {
      uint64_t v13 = NSString;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [NSNumber numberWithDouble:v12];
      uint64_t v16 = [v13 stringWithFormat:@"%@: invalid value for %@: %@", v14, v19, v15];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a5 = 1;
    }
  }
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_6(uint64_t a1, void *a2, char a3, uint64_t a4, unsigned char *a5)
{
  id v19 = a2;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  BOOL v9 = v8;
  if (v8 || (a3 & 1) != 0)
  {
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v15 = a1 + 56;
    int v17 = *(unsigned __int8 *)(*(void *)(v16 + 8) + 24);
    if (v8) {
      BOOL v18 = v17 == 0;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18 || ([v8 validate] & 1) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    float v10 = NSString;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v10 stringWithFormat:@"Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", v19, v11, objc_opt_class()];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v15 = a1 + 56;
  }
  *(unsigned char *)(*(void *)(*(void *)v15 + 8) + 24) = 0;
  *a5 = 1;
LABEL_10:
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_7(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v21 = a2;
  float v10 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  uint64_t v11 = v10;
  if (v10 || (a3 & 1) != 0)
  {
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t v17 = a1 + 56;
    int v19 = *(unsigned __int8 *)(*(void *)(v18 + 8) + 24);
    if (v10) {
      BOOL v20 = v19 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20 || ([v10 validate] & 1) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v12 = NSString;
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [v12 stringWithFormat:@"Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", v21, v13, objc_opt_class()];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v17 = a1 + 56;
  }
  *(unsigned char *)(*(void *)(*(void *)v17 + 8) + 24) = 0;
  *a7 = 1;
LABEL_10:
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_8(uint64_t a1, void *a2, char a3, uint64_t a4, unsigned char *a5)
{
  id v17 = a2;
  uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  BOOL v9 = v8;
  if (v8 || (a3 & 1) != 0)
  {
    uint64_t v15 = a1 + 56;
    if (v8) {
      BOOL v16 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (v16 || ([v8 validateWithError:*(void *)(a1 + 64)] & 1) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    float v10 = NSString;
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v10 stringWithFormat:@"Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler.", v17, v11, objc_opt_class()];
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v15 = a1 + 56;
  }
  *(unsigned char *)(*(void *)(*(void *)v15 + 8) + 24) = 0;
  *a5 = 1;
LABEL_10:
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_9(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, unsigned char *a10, uint64_t a11, uint64_t a12, uint64_t a13, long long a14, uint64_t a15, uint64_t a16)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v23 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_validateSwiftUIViewForKey:withMaxSDKSize:maxDeviceSize:cornerRadius:safeAreaInsets:error:", v23, *(void *)(a1 + 64), a3, a4, a5, a6, a7, a14, a15, a16) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a10 = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && ComplicationDisplayLibraryCore()
    && (([*(id *)(a1 + 32) renderForPreviews] & 1) != 0 || CLKIsBeingDebugged()))
  {
    uint64_t v24 = [*(id *)(a1 + 32) viewDataForSwiftUIViewKey:v23];
    if (!v24)
    {
LABEL_22:

      goto LABEL_23;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v44 = 0x2050000000;
    v25 = (void *)get_ClientRendererClass_softClass;
    uint64_t v45 = get_ClientRendererClass_softClass;
    if (!get_ClientRendererClass_softClass)
    {
      uint64_t v38 = MEMORY[0x263EF8330];
      uint64_t v39 = 3221225472;
      uint64_t v40 = (uint64_t)__get_ClientRendererClass_block_invoke;
      v41 = &unk_26440E380;
      p_long long buf = &buf;
      __get_ClientRendererClass_block_invoke((uint64_t)&v38);
      v25 = *(void **)(*((void *)&buf + 1) + 24);
    }
    id v26 = v25;
    _Block_object_dispose(&buf, 8);
    id v27 = objc_alloc_init(v26);
    uint64_t v38 = 0;
    uint64_t v39 = (uint64_t)&v38;
    uint64_t v40 = 0x2020000000;
    v41 = 0;
    uint64_t v28 = 5;
    do
    {
      uint64_t v29 = +[CLKDevice currentDevice];
      [v29 screenScale];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_10;
      v37[3] = &unk_26440DD40;
      v37[4] = &v38;
      objc_msgSend(v27, "renderWithViewData:scale:handler:", v24, v37);

      --v28;
    }
    while (v28);
    int v30 = [*(id *)(a1 + 32) hasSubMinuteUpdateRate];
    uint64_t v31 = CLKLoggingObjectForDomain(1);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *(void *)(v39 + 24);
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v32;
      _os_log_impl(&dword_21C599000, v31, OS_LOG_TYPE_DEFAULT, "CLKComplicationTemplate: Complication took %gs to render", (uint8_t *)&buf, 0xCu);
    }

    double v33 = *(double *)(v39 + 24);
    if (v33 <= 0.0166666667 || v33 >= 0.0333333333)
    {
      if (v33 >= 0.0333333333)
      {
        uint64_t v34 = [NSString stringWithFormat:@"The '%@' view on %@ took more than two frames to render. This template will be removed from the timeline.", v23, objc_opt_class()];
        goto LABEL_20;
      }
    }
    else if (v30)
    {
      uint64_t v34 = [NSString stringWithFormat:@"The '%@' view on %@ took more than one frame to render which is too long when using an auto-updating view. This template will be removed from the timeline.", v23, objc_opt_class()];
LABEL_20:
      uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
      v36 = *(void **)(v35 + 40);
      *(void *)(v35 + 40) = v34;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
      *a10 = 1;
    }
    _Block_object_dispose(&v38, 8);

    goto LABEL_22;
  }
LABEL_23:
}

uint64_t __45__CLKComplicationTemplate_validateWithError___block_invoke_10(uint64_t result, double a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(double *)(v2 + 24) < a2) {
    *(double *)(v2 + 24) = a2;
  }
  return result;
}

- (BOOL)_validateSwiftUIViewForKey:(id)a3 withMaxSize:(CGSize)a4 cornerRadius:(double)a5 safeAreaInsets:(UIEdgeInsets)a6 error:(id *)a7
{
  return 1;
}

- (Class)finalizedCopyClass
{
  return 0;
}

- (id)finalizedCopy
{
  if (self->_finalized)
  {
    uint64_t v3 = self;
  }
  else
  {
    self->_finalizing = 1;
    uint64_t v3 = (CLKComplicationTemplate *)[(CLKComplicationTemplate *)self copy];
    [(CLKComplicationTemplate *)v3 finalize];
    self->_finalizing = 0;
  }

  return v3;
}

- (BOOL)usesSwiftUI
{
  return 0;
}

- (BOOL)needsSerializableCopy
{
  return 0;
}

- (void)finalize
{
  if (!self->_finalized)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__CLKComplicationTemplate_finalize__block_invoke;
    v9[3] = &unk_26440DD90;
    v9[4] = self;
    [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v9];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __35__CLKComplicationTemplate_finalize__block_invoke_2;
    v8[3] = &unk_26440DDB8;
    v8[4] = self;
    [(CLKComplicationTemplate *)self _enumerateImageProviderKeysWithBlock:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__CLKComplicationTemplate_finalize__block_invoke_3;
    v7[3] = &unk_26440DD90;
    v7[4] = self;
    [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v7];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__CLKComplicationTemplate_finalize__block_invoke_4;
    v6[3] = &unk_26440DD90;
    v6[4] = self;
    [(CLKComplicationTemplate *)self _enumerateGaugeProviderKeysWithBlock:v6];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __35__CLKComplicationTemplate_finalize__block_invoke_5;
    v5[3] = &unk_26440DDE0;
    v5[4] = self;
    [(CLKComplicationTemplate *)self _enumerateFullColorImageProviderKeysWithBlock:v5];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __35__CLKComplicationTemplate_finalize__block_invoke_6;
    v4[3] = &unk_26440DD90;
    v4[4] = self;
    [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v4];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __35__CLKComplicationTemplate_finalize__block_invoke_7;
    v3[3] = &unk_26440DE08;
    v3[4] = self;
    [(CLKComplicationTemplate *)self _enumerateSwiftUIViewKeysWithBlock:v3];
    self->_finalized = 1;
  }
}

void __35__CLKComplicationTemplate_finalize__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) valueForKey:a2];
  [v2 finalize];
}

void __35__CLKComplicationTemplate_finalize__block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  id v20 = a9;
  int v19 = [*(id *)(a1 + 32) valueForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v19, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:maskToCircle:", v20, a10, a11, a3, a4, a5, a6);
  }
  else {
    objc_msgSend(v19, "finalizeWithMaxSDKSize:maxDeviceSize:maskToCircle:", a11, a3, a4, a5, a6);
  }
}

void __35__CLKComplicationTemplate_finalize__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) valueForKey:a2];
  [v2 finalize];
}

void __35__CLKComplicationTemplate_finalize__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) valueForKey:a2];
  [v2 finalize];
}

void __35__CLKComplicationTemplate_finalize__block_invoke_5(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11)
{
  id v20 = a10;
  int v19 = [*(id *)(a1 + 32) valueForKey:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v19, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:cornerRadius:", v20, a11, a3, a4, a5, a6, a7);
  }
  else {
    objc_msgSend(v19, "finalizeWithMaxSDKSize:maxDeviceSize:cornerRadius:", a3, a4, a5, a6, a7);
  }
}

void __35__CLKComplicationTemplate_finalize__block_invoke_6(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  uint64_t v4 = [v3 tintColor];

  if (!v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) tintColor];
    [v3 setTintColor:v5];
  }
  if ([v3 finalizedCopyClass])
  {
    uint64_t v6 = [v3 finalizedCopy];

    [*(id *)(a1 + 32) setValue:v6 forKey:v7];
    uint64_t v3 = (void *)v6;
  }
  else
  {
    [v3 finalize];
  }
}

uint64_t __35__CLKComplicationTemplate_finalize__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeSwiftUIViewForKey:withMaxSDKSize:maxDeviceSize:cornerRadius:safeAreaInsets:", a2);
}

- (void)maxSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forImageProviderKey:(id)a5
{
  id v8 = a5;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __69__CLKComplicationTemplate_maxSDKSize_deviceSize_forImageProviderKey___block_invoke;
  v19[3] = &unk_26440DE30;
  id v21 = &v24;
  id v9 = v8;
  id v20 = v9;
  id v22 = a3;
  id v23 = a4;
  [(CLKComplicationTemplate *)self _enumerateImageProviderKeysWithBlock:v19];
  if (!*((unsigned char *)v25 + 24))
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __69__CLKComplicationTemplate_maxSDKSize_deviceSize_forImageProviderKey___block_invoke_2;
    uint64_t v14 = &unk_26440DE58;
    BOOL v16 = &v24;
    id v10 = v9;
    id v15 = v10;
    id v17 = a3;
    uint64_t v18 = a4;
    [(CLKComplicationTemplate *)self _enumerateFullColorImageProviderKeysWithBlock:&v11];

    if (!*((unsigned char *)v25 + 24)) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Template class %@: unknown image provider key %@", objc_opt_class(), v10, v11, v12, v13, v14 format];
    }
  }

  _Block_object_dispose(&v24, 8);
}

uint64_t __69__CLKComplicationTemplate_maxSDKSize_deviceSize_forImageProviderKey___block_invoke(uint64_t result, void *a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unsigned char *a12)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    id v17 = (void *)result;
    result = [a2 isEqualToString:*(void *)(result + 32)];
    if (result)
    {
      uint64_t v18 = (double *)v17[6];
      if (v18)
      {
        *uint64_t v18 = a3;
        v18[1] = a4;
      }
      int v19 = (double *)v17[7];
      if (v19)
      {
        *int v19 = a5;
        v19[1] = a6;
      }
      *(unsigned char *)(*(void *)(v17[5] + 8) + 24) = 1;
      *a12 = 1;
    }
  }
  return result;
}

uint64_t __69__CLKComplicationTemplate_maxSDKSize_deviceSize_forImageProviderKey___block_invoke_2(uint64_t result, void *a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned char *a11)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    BOOL v16 = (void *)result;
    result = [a2 isEqualToString:*(void *)(result + 32)];
    if (result)
    {
      id v17 = (double *)v16[6];
      if (v17)
      {
        *id v17 = a3;
        v17[1] = a4;
      }
      uint64_t v18 = (double *)v16[7];
      if (v18)
      {
        *uint64_t v18 = a5;
        v18[1] = a6;
      }
      *(unsigned char *)(*(void *)(v16[5] + 8) + 24) = 1;
      *a11 = 1;
    }
  }
  return result;
}

- (void)enumerateTextProviderKeysWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__CLKComplicationTemplate_enumerateTextProviderKeysWithBlock___block_invoke;
  v6[3] = &unk_26440DE80;
  id v7 = v4;
  id v5 = v4;
  [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v6];
}

uint64_t __62__CLKComplicationTemplate_enumerateTextProviderKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateImageProviderKeysWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__CLKComplicationTemplate_enumerateImageProviderKeysWithBlock___block_invoke;
  v6[3] = &unk_26440DEA8;
  id v7 = v4;
  id v5 = v4;
  [(CLKComplicationTemplate *)self _enumerateImageProviderKeysWithBlock:v6];
}

uint64_t __63__CLKComplicationTemplate_enumerateImageProviderKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateProgressProviderKeysWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__CLKComplicationTemplate_enumerateProgressProviderKeysWithBlock___block_invoke;
  v6[3] = &unk_26440DE80;
  id v7 = v4;
  id v5 = v4;
  [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v6];
}

uint64_t __66__CLKComplicationTemplate_enumerateProgressProviderKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateEmbeddedTemplateKeysWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__CLKComplicationTemplate_enumerateEmbeddedTemplateKeysWithBlock___block_invoke;
  v6[3] = &unk_26440DE80;
  id v7 = v4;
  id v5 = v4;
  [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v6];
}

uint64_t __66__CLKComplicationTemplate_enumerateEmbeddedTemplateKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__CLKComplicationTemplate_enumerateSwiftUIViewDataKeysWithBlock___block_invoke;
  v6[3] = &unk_26440DE80;
  id v7 = v4;
  id v5 = v4;
  [(CLKComplicationTemplate *)self _enumerateSwiftUIViewDataKeysWithBlock:v6];
}

uint64_t __65__CLKComplicationTemplate_enumerateSwiftUIViewDataKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (uint64_t v5 = [v4 uiSensitivity], v5 == -[CLKComplicationTemplate uiSensitivity](self, "uiSensitivity")))
  {
    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x2020000000;
    char v98 = 1;
    v92[0] = MEMORY[0x263EF8330];
    v92[1] = 3221225472;
    v92[2] = __35__CLKComplicationTemplate_isEqual___block_invoke;
    v92[3] = &unk_26440DED0;
    v92[4] = self;
    id v6 = v4;
    id v93 = v6;
    v94 = &v95;
    [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v92];
    if (*((unsigned char *)v96 + 24))
    {
      uint64_t v88 = 0;
      v89 = &v88;
      uint64_t v90 = 0x2020000000;
      char v91 = 1;
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_2;
      v85[3] = &unk_26440DEF8;
      v85[4] = self;
      id v7 = v6;
      id v86 = v7;
      v87 = &v88;
      [(CLKComplicationTemplate *)self _enumerateImageProviderKeysWithBlock:v85];
      if (*((unsigned char *)v89 + 24))
      {
        uint64_t v81 = 0;
        v82 = &v81;
        uint64_t v83 = 0x2020000000;
        char v84 = 1;
        v78[0] = MEMORY[0x263EF8330];
        v78[1] = 3221225472;
        v78[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_3;
        v78[3] = &unk_26440DED0;
        v78[4] = self;
        id v8 = v7;
        id v79 = v8;
        v80 = &v81;
        [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v78];
        if (*((unsigned char *)v82 + 24))
        {
          uint64_t v74 = 0;
          v75 = &v74;
          uint64_t v76 = 0x2020000000;
          char v77 = 1;
          v71[0] = MEMORY[0x263EF8330];
          v71[1] = 3221225472;
          v71[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_4;
          v71[3] = &unk_26440DF20;
          v71[4] = self;
          id v9 = v8;
          id v72 = v9;
          v73 = &v74;
          [(CLKComplicationTemplate *)self _enumerateIntegerKeysWithBlock:v71];
          if (*((unsigned char *)v75 + 24))
          {
            uint64_t v67 = 0;
            v68 = &v67;
            uint64_t v69 = 0x2020000000;
            char v70 = 1;
            v64[0] = MEMORY[0x263EF8330];
            v64[1] = 3221225472;
            v64[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_5;
            v64[3] = &unk_26440DF48;
            v64[4] = self;
            id v10 = v9;
            id v65 = v10;
            v66 = &v67;
            [(CLKComplicationTemplate *)self _enumerateFloatKeysWithBlock:v64];
            if (*((unsigned char *)v68 + 24))
            {
              uint64_t v60 = 0;
              v61 = &v60;
              uint64_t v62 = 0x2020000000;
              char v63 = 1;
              v57[0] = MEMORY[0x263EF8330];
              v57[1] = 3221225472;
              v57[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_6;
              v57[3] = &unk_26440DF70;
              v57[4] = self;
              id v11 = v10;
              id v58 = v11;
              v59 = &v60;
              [(CLKComplicationTemplate *)self _enumerateBOOLKeysWithBlock:v57];
              if (*((unsigned char *)v61 + 24))
              {
                uint64_t v53 = 0;
                v54 = &v53;
                uint64_t v55 = 0x2020000000;
                char v56 = 1;
                v50[0] = MEMORY[0x263EF8330];
                v50[1] = 3221225472;
                v50[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_7;
                v50[3] = &unk_26440DF70;
                v50[4] = self;
                id v12 = v11;
                id v51 = v12;
                v52 = &v53;
                [(CLKComplicationTemplate *)self _enumerateDateKeysWithBlock:v50];
                if (*((unsigned char *)v54 + 24)
                  && ([(CLKComplicationTemplate *)self tintColor],
                      uint64_t v13 = objc_claimAutoreleasedReturnValue(),
                      [v12 tintColor],
                      uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                      int v15 = CLKEqualObjects(v13, v14),
                      v14,
                      v13,
                      v15))
                {
                  uint64_t v46 = 0;
                  v47 = &v46;
                  uint64_t v48 = 0x2020000000;
                  char v49 = 1;
                  v43[0] = MEMORY[0x263EF8330];
                  v43[1] = 3221225472;
                  v43[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_8;
                  v43[3] = &unk_26440DED0;
                  v43[4] = self;
                  id v16 = v12;
                  id v44 = v16;
                  uint64_t v45 = &v46;
                  [(CLKComplicationTemplate *)self _enumerateGaugeProviderKeysWithBlock:v43];
                  if (*((unsigned char *)v47 + 24))
                  {
                    uint64_t v39 = 0;
                    uint64_t v40 = &v39;
                    uint64_t v41 = 0x2020000000;
                    char v42 = 1;
                    v36[0] = MEMORY[0x263EF8330];
                    v36[1] = 3221225472;
                    v36[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_9;
                    v36[3] = &unk_26440DF98;
                    v36[4] = self;
                    id v17 = v16;
                    id v37 = v17;
                    uint64_t v38 = &v39;
                    [(CLKComplicationTemplate *)self _enumerateFullColorImageProviderKeysWithBlock:v36];
                    if (*((unsigned char *)v40 + 24))
                    {
                      uint64_t v32 = 0;
                      double v33 = &v32;
                      uint64_t v34 = 0x2020000000;
                      char v35 = 1;
                      v29[0] = MEMORY[0x263EF8330];
                      v29[1] = 3221225472;
                      v29[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_10;
                      v29[3] = &unk_26440DED0;
                      v29[4] = self;
                      id v18 = v17;
                      id v30 = v18;
                      uint64_t v31 = &v32;
                      [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v29];
                      if (*((unsigned char *)v33 + 24))
                      {
                        uint64_t v25 = 0;
                        uint64_t v26 = &v25;
                        uint64_t v27 = 0x2020000000;
                        char v28 = 1;
                        v22[0] = MEMORY[0x263EF8330];
                        v22[1] = 3221225472;
                        v22[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_11;
                        v22[3] = &unk_26440DED0;
                        v22[4] = self;
                        int v19 = (void **)v18;
                        id v23 = v19;
                        uint64_t v24 = &v25;
                        [(CLKComplicationTemplate *)self _enumerateSwiftUIViewDataKeysWithBlock:v22];
                        BOOL v20 = *((unsigned char *)v26 + 24)
                           && CLKEqualObjects(self->_metadata, v19[1])
                           && self->_linkedOnOrAfterGrace == *((unsigned __int8 *)v19 + 26)
                           && self->_sdkVersion == (void)v19[5];

                        _Block_object_dispose(&v25, 8);
                      }
                      else
                      {
                        BOOL v20 = 0;
                      }

                      _Block_object_dispose(&v32, 8);
                    }
                    else
                    {
                      BOOL v20 = 0;
                    }

                    _Block_object_dispose(&v39, 8);
                  }
                  else
                  {
                    BOOL v20 = 0;
                  }

                  _Block_object_dispose(&v46, 8);
                }
                else
                {
                  BOOL v20 = 0;
                }

                _Block_object_dispose(&v53, 8);
              }
              else
              {
                BOOL v20 = 0;
              }

              _Block_object_dispose(&v60, 8);
            }
            else
            {
              BOOL v20 = 0;
            }

            _Block_object_dispose(&v67, 8);
          }
          else
          {
            BOOL v20 = 0;
          }

          _Block_object_dispose(&v74, 8);
        }
        else
        {
          BOOL v20 = 0;
        }

        _Block_object_dispose(&v81, 8);
      }
      else
      {
        BOOL v20 = 0;
      }

      _Block_object_dispose(&v88, 8);
    }
    else
    {
      BOOL v20 = 0;
    }

    _Block_object_dispose(&v95, 8);
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

void __35__CLKComplicationTemplate_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 valueForKey:v8];
  id v10 = [*(id *)(a1 + 40) valueForKey:v8];

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  id v10 = *(void **)(a1 + 32);
  id v11 = a2;
  id v12 = [v10 valueForKey:v11];
  uint64_t v13 = [*(id *)(a1 + 40) valueForKey:v11];

  LOBYTE(v11) = CLKEqualObjects(v12, v13);
  if ((v11 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a8 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 valueForKey:v8];
  id v10 = [*(id *)(a1 + 40) valueForKey:v8];

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 valueForKey:v8];
  uint64_t v10 = [v9 integerValue];
  id v11 = [*(id *)(a1 + 40) valueForKey:v8];

  uint64_t v12 = [v11 integerValue];
  if (v10 != v12)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 valueForKey:v8];
  [v9 floatValue];
  double v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 40) valueForKey:v8];

  [v12 floatValue];
  LOBYTE(v8) = CLKFloatEqualsFloat(v11, v13);

  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 valueForKey:v7];
  int v9 = [v8 BOOLValue];
  float v10 = [*(id *)(a1 + 40) valueForKey:v7];

  LODWORD(v7) = [v10 BOOLValue];
  if (v9 != v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a2;
  id v8 = [v6 valueForKey:v7];
  int v9 = [*(id *)(a1 + 40) valueForKey:v7];

  LOBYTE(v7) = CLKEqualObjects(v8, v9);
  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  int v9 = [v7 valueForKey:v8];
  float v10 = [*(id *)(a1 + 40) valueForKey:v8];

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_9(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  int v9 = *(void **)(a1 + 32);
  id v10 = a2;
  double v11 = [v9 valueForKey:v10];
  uint64_t v12 = [*(id *)(a1 + 40) valueForKey:v10];

  LOBYTE(v10) = CLKEqualObjects(v11, v12);
  if ((v10 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a7 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  int v9 = [v7 valueForKey:v8];
  id v10 = [*(id *)(a1 + 40) valueForKey:v8];

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  int v9 = [v7 valueForKey:v8];
  id v10 = [*(id *)(a1 + 40) valueForKey:v8];

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

- (unint64_t)hash
{
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __31__CLKComplicationTemplate_hash__block_invoke;
  v22[3] = &unk_26440DFC0;
  v22[4] = self;
  void v22[5] = &v23;
  uint64_t v3 = (void *)MEMORY[0x21D4AACC0](v22, a2);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __31__CLKComplicationTemplate_hash__block_invoke_2;
  v20[3] = &unk_26440DFE8;
  id v4 = v3;
  id v21 = v4;
  [(CLKComplicationTemplate *)self _enumerateAllBasicKeysWithBlock:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __31__CLKComplicationTemplate_hash__block_invoke_3;
  v18[3] = &unk_26440DE80;
  id v5 = v4;
  id v19 = v5;
  [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __31__CLKComplicationTemplate_hash__block_invoke_4;
  v16[3] = &unk_26440DE80;
  id v6 = v5;
  id v17 = v6;
  [(CLKComplicationTemplate *)self _enumerateSwiftUIViewDataKeysWithBlock:v16];
  id v7 = [(CLKComplicationTemplate *)self tintColor];
  uint64_t v8 = [v7 hash];
  uint64_t v9 = [@"tintColor" hash];
  v24[3] += v9 * v8;

  uint64_t v10 = [(NSDictionary *)self->_metadata hash];
  double v11 = v24;
  uint64_t v12 = v24[3] + v10 + self->_linkedOnOrAfterGrace;
  v24[3] = v12;
  unint64_t v13 = v12 + self->_sdkVersion;
  v11[3] = v13;
  if (self->_uiSensitivity) {
    unint64_t v14 = v13 + 1;
  }
  else {
    unint64_t v14 = v13;
  }
  v11[3] = v14;

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __31__CLKComplicationTemplate_hash__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v7 = [v3 valueForKey:v4];
  uint64_t v5 = [v7 hash];
  uint64_t v6 = [v4 hash];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v6 * v5;
}

uint64_t __31__CLKComplicationTemplate_hash__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __31__CLKComplicationTemplate_hash__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __31__CLKComplicationTemplate_hash__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_finalized)
  {
    return self;
  }
  else
  {
    if (!self->_finalizing || (uint64_t v5 = [(CLKComplicationTemplate *)self finalizedCopyClass]) == 0) {
      uint64_t v5 = (objc_class *)objc_opt_class();
    }
    uint64_t v6 = [[(objc_class *)v5 allocWithZone:a3] init];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __40__CLKComplicationTemplate_copyWithZone___block_invoke;
    v17[3] = &unk_26440E010;
    id v7 = v6;
    id v18 = v7;
    id v19 = self;
    [(CLKComplicationTemplate *)self _enumerateAllBasicKeysWithBlock:v17];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__CLKComplicationTemplate_copyWithZone___block_invoke_2;
    v14[3] = &unk_26440E038;
    uint64_t v8 = v7;
    int v15 = v8;
    id v16 = self;
    [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v14];
    uint64_t v9 = [(CLKComplicationTemplate *)self tintColor];
    [v8 setTintColor:v9];

    uint64_t v10 = [(NSDictionary *)self->_metadata mutableCopy];
    id v11 = v8[1];
    v8[1] = (id)v10;

    *((unsigned char *)v8 + 26) = self->_linkedOnOrAfterGrace;
    void v8[5] = self->_sdkVersion;
    objc_storeStrong(v8 + 7, self->_creationDate);
    void v8[6] = self->_uiSensitivity;
    objc_storeStrong(v8 + 8, self->_backgroundDescriptor);
    [(CLKComplicationTemplate *)self _setCustomCopyPropertiesOn:v8 finalizing:self->_finalizing];
    uint64_t v12 = v8;

    return v12;
  }
}

void __40__CLKComplicationTemplate_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [v2 setValue:v5 forKey:v4];
}

void __40__CLKComplicationTemplate_copyWithZone___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v6 = [v3 valueForKey:v4];
  id v5 = (void *)[v6 copy];
  [v2 setValue:v5 forKey:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x21D4AAA70]();
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke;
  v48[3] = &unk_26440E038;
  v48[4] = self;
  id v6 = v4;
  id v49 = v6;
  [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v48];

  id v7 = (void *)MEMORY[0x21D4AAA70]();
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_2;
  v46[3] = &unk_26440E060;
  v46[4] = self;
  id v8 = v6;
  id v47 = v8;
  [(CLKComplicationTemplate *)self _enumerateImageProviderKeysWithBlock:v46];

  uint64_t v9 = (void *)MEMORY[0x21D4AAA70]();
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_3;
  v44[3] = &unk_26440E038;
  v44[4] = self;
  id v10 = v8;
  id v45 = v10;
  [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v44];

  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_4;
  v42[3] = &unk_26440E088;
  v42[4] = self;
  id v11 = v10;
  id v43 = v11;
  [(CLKComplicationTemplate *)self _enumerateIntegerKeysWithBlock:v42];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_5;
  v40[3] = &unk_26440E0B0;
  v40[4] = self;
  id v12 = v11;
  id v41 = v12;
  [(CLKComplicationTemplate *)self _enumerateFloatKeysWithBlock:v40];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_6;
  v38[3] = &unk_26440E0D8;
  v38[4] = self;
  id v13 = v12;
  id v39 = v13;
  [(CLKComplicationTemplate *)self _enumerateBOOLKeysWithBlock:v38];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_7;
  v36[3] = &unk_26440E0D8;
  v36[4] = self;
  id v14 = v13;
  id v37 = v14;
  [(CLKComplicationTemplate *)self _enumerateDateKeysWithBlock:v36];
  int v15 = [(CLKComplicationTemplate *)self tintColor];
  [v14 encodeObject:v15 forKey:@"tintColor"];

  id v16 = (void *)MEMORY[0x21D4AAA70]();
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_8;
  v34[3] = &unk_26440E038;
  v34[4] = self;
  id v17 = v14;
  id v35 = v17;
  [(CLKComplicationTemplate *)self _enumerateGaugeProviderKeysWithBlock:v34];

  id v18 = (void *)MEMORY[0x21D4AAA70]();
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  void v32[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_9;
  v32[3] = &unk_26440E100;
  v32[4] = self;
  id v19 = v17;
  id v33 = v19;
  [(CLKComplicationTemplate *)self _enumerateFullColorImageProviderKeysWithBlock:v32];

  BOOL v20 = (void *)MEMORY[0x21D4AAA70]();
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_10;
  v30[3] = &unk_26440E038;
  v30[4] = self;
  id v21 = v19;
  id v31 = v21;
  [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v30];

  id v22 = (void *)MEMORY[0x21D4AAA70]();
  uint64_t v24 = MEMORY[0x263EF8330];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_114;
  uint64_t v27 = &unk_26440E038;
  char v28 = self;
  id v23 = v21;
  id v29 = v23;
  [(CLKComplicationTemplate *)self _enumerateSwiftUIViewDataKeysWithBlock:&v24];

  objc_msgSend(v23, "encodeObject:forKey:", self->_metadata, @"metadata", v24, v25, v26, v27, v28);
  [v23 encodeBool:self->_linkedOnOrAfterGrace forKey:@"linkedOnOrAfterGrace"];
  [v23 encodeInteger:self->_sdkVersion forKey:@"sdkVersion"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v23 encodeObject:self->_creationDate forKey:@"creationDate"];
  }
  [v23 encodeBool:self->_finalized forKey:@"finalized"];
  [v23 encodeInteger:self->_uiSensitivity forKey:@"sensitivity"];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [*(id *)(a1 + 40) encodeObject:v5 forKey:v4];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [*(id *)(a1 + 40) encodeObject:v5 forKey:v4];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [*(id *)(a1 + 40) encodeObject:v5 forKey:v4];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 valueForKey:v6];
  uint64_t v5 = [v4 integerValue];

  [*(id *)(a1 + 40) encodeInteger:v5 forKey:v6];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v8 = a2;
  id v4 = [v3 valueForKey:v8];
  [v4 floatValue];
  int v6 = v5;

  LODWORD(v7) = v6;
  [*(id *)(a1 + 40) encodeFloat:v8 forKey:v7];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = a2;
  id v4 = [v3 valueForKey:v6];
  uint64_t v5 = [v4 BOOLValue];

  [*(id *)(a1 + 40) encodeBool:v5 forKey:v6];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [*(id *)(a1 + 40) encodeObject:v5 forKey:v4];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [*(id *)(a1 + 40) encodeObject:v5 forKey:v4];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [*(id *)(a1 + 40) encodeObject:v5 forKey:v4];
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) valueForKey:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 40) encodeObject:v4 forKey:v3];
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    [*(id *)(a1 + 40) encodeObject:v6 forKey:@"BezelCircularClassName"];
  }
  else
  {
    double v7 = CLKLoggingObjectForDomain(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_10_cold_1((uint64_t)v4, v7);
    }

    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Property '%@' on %@ must be a valid subclass of CLKComplicationTemplate", v3, objc_opt_class() format];
  }
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_114(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  [*(id *)(a1 + 40) encodeObject:v5 forKey:v4];
}

- (CLKComplicationTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CLKComplicationTemplate *)self initPrivate];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x21D4AAA70]();
    v79[0] = MEMORY[0x263EF8330];
    v79[1] = 3221225472;
    v79[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke;
    v79[3] = &unk_26440E038;
    id v7 = v4;
    id v80 = v7;
    id v8 = v5;
    uint64_t v81 = v8;
    [(CLKComplicationTemplate *)v8 _enumerateTextProviderKeysWithBlock:v79];

    uint64_t v9 = (void *)MEMORY[0x21D4AAA70]();
    v76[0] = MEMORY[0x263EF8330];
    v76[1] = 3221225472;
    v76[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_2;
    v76[3] = &unk_26440E060;
    id v10 = v7;
    id v77 = v10;
    id v11 = v8;
    v78 = v11;
    [(CLKComplicationTemplate *)v11 _enumerateImageProviderKeysWithBlock:v76];

    id v12 = (void *)MEMORY[0x21D4AAA70]();
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_3;
    v73[3] = &unk_26440E038;
    id v13 = v10;
    id v74 = v13;
    id v14 = v11;
    v75 = v14;
    [(CLKComplicationTemplate *)v14 _enumerateProgressProviderKeysWithBlock:v73];

    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_4;
    v70[3] = &unk_26440E088;
    id v15 = v13;
    id v71 = v15;
    id v16 = v14;
    id v72 = v16;
    [(CLKComplicationTemplate *)v16 _enumerateIntegerKeysWithBlock:v70];
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_5;
    v67[3] = &unk_26440E0B0;
    id v17 = v15;
    id v68 = v17;
    id v18 = v16;
    uint64_t v69 = v18;
    [(CLKComplicationTemplate *)v18 _enumerateFloatKeysWithBlock:v67];
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_6;
    v64[3] = &unk_26440E0D8;
    id v19 = v17;
    id v65 = v19;
    BOOL v20 = v18;
    v66 = v20;
    [(CLKComplicationTemplate *)v20 _enumerateBOOLKeysWithBlock:v64];
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_7;
    v61[3] = &unk_26440E0D8;
    id v21 = v19;
    id v62 = v21;
    id v22 = v20;
    char v63 = v22;
    [(CLKComplicationTemplate *)v22 _enumerateDateKeysWithBlock:v61];
    id v23 = [v21 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    [(CLKComplicationTemplate *)v22 setTintColor:v23];

    uint64_t v24 = (void *)MEMORY[0x21D4AAA70]();
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_8;
    v58[3] = &unk_26440E038;
    id v25 = v21;
    id v59 = v25;
    uint64_t v26 = v22;
    uint64_t v60 = v26;
    [(CLKComplicationTemplate *)v26 _enumerateGaugeProviderKeysWithBlock:v58];

    uint64_t v27 = (void *)MEMORY[0x21D4AAA70]();
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_9;
    v55[3] = &unk_26440E100;
    id v28 = v25;
    id v56 = v28;
    id v29 = v26;
    id v57 = v29;
    [v29 _enumerateFullColorImageProviderKeysWithBlock:v55];

    id v30 = (void *)MEMORY[0x21D4AAA70]();
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_10;
    v52[3] = &unk_26440E038;
    id v31 = v28;
    id v53 = v31;
    uint64_t v32 = v29;
    id v54 = v32;
    [v32 _enumerateEmbeddedTemplateKeysWithBlock:v52];

    id v33 = (void *)MEMORY[0x21D4AAA70]();
    uint64_t v34 = [(id)objc_opt_class() classesCompatibleWithJSONSerialization];
    id v35 = [v31 decodeObjectOfClasses:v34 forKey:@"metadata"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v36 = [v35 copy];
      id v37 = (void *)v32[1];
      v32[1] = v36;
    }
    uint64_t v38 = (void *)MEMORY[0x21D4AAA70]();
    uint64_t v46 = MEMORY[0x263EF8330];
    uint64_t v47 = 3221225472;
    uint64_t v48 = __41__CLKComplicationTemplate_initWithCoder___block_invoke_122;
    id v49 = &unk_26440E038;
    id v39 = v31;
    id v50 = v39;
    uint64_t v40 = v32;
    id v51 = v40;
    [v40 _enumerateSwiftUIViewDataKeysWithBlock:&v46];

    *((unsigned char *)v40 + 26) = objc_msgSend(v39, "decodeBoolForKey:", @"linkedOnOrAfterGrace", v46, v47, v48, v49);
    void v40[5] = [v39 decodeIntegerForKey:@"sdkVersion"];
    id v41 = [v39 decodeObjectOfClass:objc_opt_class() forKey:@"creationDate"];
    char v42 = v41;
    if (v41)
    {
      id v43 = v41;
    }
    else
    {
      id v43 = [MEMORY[0x263EFF910] date];
    }
    id v44 = (void *)v40[7];
    v40[7] = v43;

    *((unsigned char *)v40 + 24) = [v39 decodeBoolForKey:@"finalized"];
    v40[6] = [v39 decodeIntegerForKey:@"sensitivity"];
  }
  return v5;
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [*(id *)(a1 + 40) setValue:v5 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [*(id *)(a1 + 40) setValue:v5 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [*(id *)(a1 + 40) setValue:v5 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 decodeIntegerForKey:v4];
  id v6 = *(void **)(a1 + 40);
  id v7 = [NSNumber numberWithInteger:v5];
  [v6 setValue:v7 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 decodeFloatForKey:v4];
  id v6 = *(void **)(a1 + 40);
  id v7 = [NSNumber numberWithDouble:v5];
  [v6 setValue:v7 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 decodeBoolForKey:v4];
  id v6 = *(void **)(a1 + 40);
  id v7 = [NSNumber numberWithBool:v5];
  [v6 setValue:v7 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [*(id *)(a1 + 40) setValue:v5 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [*(id *)(a1 + 40) setValue:v5 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [*(id *)(a1 + 40) setValue:v5 forKey:v4];
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"BezelCircularClassName"];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) _validEmbeddedTemplateClassNamesForKey:v3];
    int v6 = [v5 containsObject:v4];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) decodeObjectOfClass:NSClassFromString(v4) forKey:v3];
      [*(id *)(a1 + 40) setValue:v7 forKey:v3];
    }
    else
    {
      id v8 = CLKLoggingObjectForDomain(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __41__CLKComplicationTemplate_initWithCoder___block_invoke_10_cold_1();
      }
    }
  }
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_122(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:v4];
  [*(id *)(a1 + 40) setValue:v5 forKey:v4];
}

+ (CLKComplicationTemplate)complicationTemplateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4 purpose:(unint64_t)a5
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v56 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"top level object must be a dictionary. Invalid value: %@", v8 format];
  }
  uint64_t v9 = [v8 objectForKeyedSubscript:@"class"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    Class v10 = NSClassFromString(v9);
    if (([(objc_class *)v10 isSubclassOfClass:objc_opt_class()] & 1) == 0) {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"class: %@ must be a CLKComplicationTemplate class", v9 format];
    }
    id v57 = (id)[[v10 alloc] initPrivateWithJSONObjectRepresentation:v8 bundle:v56];
    if (v57)
    {
      v92[0] = MEMORY[0x263EF8330];
      v92[1] = 3221225472;
      v92[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke;
      v92[3] = &unk_26440E038;
      id v11 = v8;
      id v93 = v11;
      id v12 = v57;
      id v94 = v12;
      [v12 _enumerateTextProviderKeysWithBlock:v92];
      v88[0] = MEMORY[0x263EF8330];
      v88[1] = 3221225472;
      v88[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_2;
      v88[3] = &unk_26440E128;
      id v13 = v11;
      id v89 = v13;
      id v14 = v56;
      id v90 = v14;
      id v15 = v12;
      id v91 = v15;
      [v15 _enumerateImageProviderKeysWithBlock:v88];
      v85[0] = MEMORY[0x263EF8330];
      v85[1] = 3221225472;
      v85[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_3;
      v85[3] = &unk_26440E0D8;
      id v16 = v13;
      id v86 = v16;
      id v17 = v15;
      id v87 = v17;
      [v17 _enumerateBOOLKeysWithBlock:v85];
      v82[0] = MEMORY[0x263EF8330];
      v82[1] = 3221225472;
      v82[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_4;
      v82[3] = &unk_26440E0B0;
      id v18 = v16;
      id v83 = v18;
      id v19 = v17;
      id v84 = v19;
      [v19 _enumerateFloatKeysWithBlock:v82];
      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_5;
      v79[3] = &unk_26440E088;
      id v20 = v18;
      id v80 = v20;
      id v21 = v19;
      id v81 = v21;
      [v21 _enumerateIntegerKeysWithBlock:v79];
      v76[0] = MEMORY[0x263EF8330];
      v76[1] = 3221225472;
      v76[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_6;
      v76[3] = &unk_26440E0D8;
      id v22 = v20;
      id v77 = v22;
      id v23 = v21;
      id v78 = v23;
      [v23 _enumerateDateKeysWithBlock:v76];
      id v53 = a1;
      unint64_t v54 = a5;
      uint64_t v55 = [v22 objectForKeyedSubscript:@"tintColor"];
      if (v55)
      {
        uint64_t v24 = (void *)[objc_alloc(MEMORY[0x263F825C8]) initWithJSONObjectRepresentation:v55];
        [v23 setTintColor:v24];
      }
      v72[0] = MEMORY[0x263EF8330];
      v72[1] = 3221225472;
      v72[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_7;
      v72[3] = &unk_26440E150;
      id v25 = v22;
      id v73 = v25;
      id v26 = v14;
      id v74 = v26;
      id v27 = v23;
      id v75 = v27;
      [v27 _enumerateGaugeProviderKeysWithBlock:v72];
      v68[0] = MEMORY[0x263EF8330];
      v68[1] = 3221225472;
      v68[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_8;
      v68[3] = &unk_26440E178;
      id v28 = v25;
      id v69 = v28;
      id v29 = v26;
      id v70 = v29;
      id v30 = v27;
      id v71 = v30;
      [v30 _enumerateFullColorImageProviderKeysWithBlock:v68];
      v62[0] = MEMORY[0x263EF8330];
      v62[1] = 3221225472;
      v62[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_9;
      v62[3] = &unk_26440E1A0;
      id v31 = v28;
      id v63 = v31;
      id v66 = v53;
      id v32 = v29;
      id v64 = v32;
      unint64_t v67 = v54;
      id v33 = v30;
      id v65 = v33;
      [v33 _enumerateEmbeddedTemplateKeysWithBlock:v62];
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_10;
      v58[3] = &unk_26440E150;
      id v34 = v31;
      id v59 = v34;
      id v35 = v32;
      id v60 = v35;
      id v36 = v33;
      id v61 = v36;
      [v36 _enumerateSwiftUIViewDataKeysWithBlock:v58];
      id v37 = v36;
      uint64_t v38 = [v34 objectForKeyedSubscript:@"creationDate"];
      if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v39 = v38;
      }
      else
      {
        id v39 = [MEMORY[0x263EFF910] date];
      }
      uint64_t v40 = (void *)*((void *)v36 + 7);
      *((void *)v36 + 7) = v39;

      id v41 = [v34 objectForKeyedSubscript:@"sdkVersion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        *((void *)v36 + 5) = [v41 integerValue];
      }
      uint64_t v42 = [v34 objectForKeyedSubscript:@"metadata"];
      id v43 = (void *)v42;
      if (v54)
      {
        if (v42)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"%@' must be a dictionary. Invalid value: %@", @"metadata", v43 format];
          }
        }
        id v44 = objc_alloc_init(NSDictionary);
        id v45 = objc_opt_class();
        uint64_t v46 = [v35 bundlePath];
        uint64_t v47 = [v45 _secureCodingRepresentationOfEmbeddedObjectsDictionary:v43 bundlePath:v46];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"_createDecodableComplicationJsonDictionary has failed and the metadataDictionary is no longer a dictionary, %@", v43 format];
        }
        uint64_t v48 = [v47 copy];
        id v49 = (void *)v37[1];
        v37[1] = v48;
      }
      else
      {
        uint64_t v47 = [v34 objectForKeyedSubscript:@"sensitivity"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          *((void *)v36 + 6) = [v47 integerValue];
        }
        id v49 = [v34 objectForKeyedSubscript:@"linkedOnOrAfterGrace"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          *((unsigned char *)v36 + 26) = [v49 BOOLValue];
        }
        uint64_t v50 = [v43 copy];
        id v51 = (void *)*((void *)v36 + 1);
        *((void *)v36 + 1) = v50;
      }
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"'%@' must be a string. Invalid value: %@", @"class", v9 format];

    id v57 = 0;
  }

  return (CLKComplicationTemplate *)v57;
}

uint64_t __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a4)
  {
    id v13 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    Class v10 = (void *)v9;
    if (!a3 || v9)
    {
      id v11 = +[CLKTextProvider providerWithJSONObjectRepresentation:v9];
      [*(id *)(a1 + 40) setValue:v11 forKey:v13];
    }
    id v8 = v13;
  }

  return MEMORY[0x270F9A758](v7, v8);
}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_2(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v13 = a2;
  id v9 = a5;
  if (a4)
  {
    uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
    id v11 = (void *)v10;
    if (!a3 || v10)
    {
      id v12 = +[CLKImageProvider imageProviderWithJSONObjectRepresentation:v10 bundle:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) setValue:v12 forKey:v13];
    }
  }
}

uint64_t __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v9 = v5;
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", v9, v7 format];
      }
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key in '%@' dictionary was not provided - invalid value: %@", v9, *(void *)(a1 + 32) format];
    }
    [*(id *)(a1 + 40) setValue:v7 forKey:v9];

    id v6 = v9;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

uint64_t __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_4(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v9 = v5;
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", v9, v7 format];
      }
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key in '%@' dictionary was not provided - invalid value: %@", v9, *(void *)(a1 + 32) format];
    }
    [*(id *)(a1 + 40) setValue:v7 forKey:v9];

    id v6 = v9;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

uint64_t __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_5(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v9 = v5;
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"value for key '%@' must be a number - invalid value: %@", v9, v7 format];
      }
    }
    else
    {
      [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key in '%@' dictionary was not provided - invalid value: %@", v9, *(void *)(a1 + 32) format];
    }
    [*(id *)(a1 + 40) setValue:v7 forKey:v9];

    id v6 = v9;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

uint64_t __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_6(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    id v10 = v5;
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    if (v7)
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithJSONObjectRepresentation:v7];
      [*(id *)(a1 + 40) setValue:v8 forKey:v10];
    }
    id v6 = v10;
  }

  return MEMORY[0x270F9A758](v5, v6);
}

uint64_t __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_7(uint64_t a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a4)
  {
    id v13 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    id v10 = (void *)v9;
    if (!a3 || v9)
    {
      id v11 = +[CLKGaugeProvider providerWithJSONObjectRepresentation:v9 bundle:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) setValue:v11 forKey:v13];
    }
    id v8 = v13;
  }

  return MEMORY[0x270F9A758](v7, v8);
}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_8(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v13 = a2;
  id v9 = a5;
  if (a4)
  {
    uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v13];
    id v11 = (void *)v10;
    if (!a3 || v10)
    {
      id v12 = +[CLKFullColorImageProvider fullColorImageProviderWithJSONObjectRepresentation:v10 bundle:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) setValue:v12 forKey:v13];
    }
  }
}

uint64_t __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_9(uint64_t a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a4)
  {
    id v16 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    uint64_t v10 = (void *)v9;
    if (!a3 || v9)
    {
      uint64_t v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"BezelCircularClassName"];
      id v12 = (void *)v11;
      if (!a3 || v11)
      {
        uint64_t v13 = [(id)objc_opt_class() complicationTemplateWithJSONObjectRepresentation:v10 bundle:*(void *)(a1 + 40) purpose:*(void *)(a1 + 64)];
        id v14 = (void *)v13;
        if ((a3 & 1) == 0 && !v13) {
          [MEMORY[0x263EFF940] raise:@"CLKComplicationBundleException", @"key '%@': required embedded template is nil", v16 format];
        }
        [*(id *)(a1 + 48) setValue:v14 forKey:v16];
      }
    }

    id v8 = v16;
  }

  return MEMORY[0x270F9A758](v7, v8);
}

uint64_t __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_10(uint64_t a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a4)
  {
    id v13 = v7;
    uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
    uint64_t v10 = (void *)v9;
    if (!a3 || v9)
    {
      uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithJSONObjectRepresentation:v9 bundle:*(void *)(a1 + 40)];
      [*(id *)(a1 + 48) setValue:v11 forKey:v13];
    }
    id v8 = v13;
  }

  return MEMORY[0x270F9A758](v7, v8);
}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3 purpose:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  id v8 = (objc_class *)objc_opt_class();
  uint64_t v9 = NSStringFromClass(v8);
  [v7 setObject:v9 forKeyedSubscript:@"class"];

  [v7 setObject:&unk_26CCDB6B0 forKeyedSubscript:@"version"];
  uint64_t v10 = [(UIColor *)self->_tintColor JSONObjectRepresentation];
  [v7 setObject:v10 forKeyedSubscript:@"tintColor"];

  v65[0] = MEMORY[0x263EF8330];
  v65[1] = 3221225472;
  v65[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke;
  v65[3] = &unk_26440E038;
  v65[4] = self;
  id v11 = v7;
  id v66 = v11;
  [(CLKComplicationTemplate *)self _enumerateGaugeProviderKeysWithBlock:v65];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_2;
  v62[3] = &unk_26440E178;
  void v62[4] = self;
  id v12 = v6;
  id v63 = v12;
  id v13 = v11;
  id v64 = v13;
  [(CLKComplicationTemplate *)self _enumerateFullColorImageProviderKeysWithBlock:v62];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_3;
  v58[3] = &unk_26440E1C8;
  void v58[4] = self;
  id v14 = v12;
  id v59 = v14;
  unint64_t v61 = a4;
  id v15 = v13;
  id v60 = v15;
  [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v58];
  id v16 = NSNumber;
  [(NSDate *)self->_creationDate timeIntervalSince1970];
  id v17 = objc_msgSend(v16, "numberWithDouble:");
  [v15 setObject:v17 forKeyedSubscript:@"creationDate"];

  id v18 = [NSNumber numberWithInteger:self->_sdkVersion];
  [v15 setObject:v18 forKeyedSubscript:@"sdkVersion"];

  if (!a4)
  {
    id v20 = [NSNumber numberWithBool:self->_linkedOnOrAfterGrace];
    [v15 setObject:v20 forKeyedSubscript:@"linkedOnOrAfterGrace"];

    id v21 = [NSNumber numberWithInteger:self->_uiSensitivity];
    [v15 setObject:v21 forKeyedSubscript:@"sensitivity"];

    id v19 = (void *)[(NSDictionary *)self->_metadata copy];
    goto LABEL_5;
  }
  id v19 = [(id)objc_opt_class() createJSONRepresentationFromDictionary:self->_metadata bundlePath:v14 purpose:1];
  if (v19) {
LABEL_5:
  }
    [v15 setObject:v19 forKeyedSubscript:@"metadata"];

  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_4;
  v56[3] = &unk_26440E038;
  v56[4] = self;
  id v22 = v15;
  id v57 = v22;
  [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v56];
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_5;
  v53[3] = &unk_26440E128;
  v53[4] = self;
  id v23 = v14;
  id v54 = v23;
  id v24 = v22;
  id v55 = v24;
  [(CLKComplicationTemplate *)self _enumerateImageProviderKeysWithBlock:v53];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_6;
  v51[3] = &unk_26440E038;
  v51[4] = self;
  id v25 = v24;
  id v52 = v25;
  [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v51];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_7;
  v48[3] = &unk_26440E0D8;
  id v26 = v25;
  id v49 = v26;
  uint64_t v50 = self;
  [(CLKComplicationTemplate *)self _enumerateBOOLKeysWithBlock:v48];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_8;
  v45[3] = &unk_26440E0B0;
  id v27 = v26;
  id v46 = v27;
  uint64_t v47 = self;
  [(CLKComplicationTemplate *)self _enumerateFloatKeysWithBlock:v45];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_9;
  v42[3] = &unk_26440E088;
  id v28 = v27;
  id v43 = v28;
  id v44 = self;
  [(CLKComplicationTemplate *)self _enumerateIntegerKeysWithBlock:v42];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_10;
  v40[3] = &unk_26440E0D8;
  v40[4] = self;
  id v29 = v28;
  id v41 = v29;
  [(CLKComplicationTemplate *)self _enumerateDateKeysWithBlock:v40];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_11;
  v37[3] = &unk_26440E150;
  v37[4] = self;
  id v30 = v23;
  id v38 = v30;
  id v31 = v29;
  id v39 = v31;
  [(CLKComplicationTemplate *)self _enumerateSwiftUIViewDataKeysWithBlock:v37];
  if (a4 == 1)
  {
    id v32 = [(id)objc_opt_class() createJSONRepresentationFromDictionary:v31 bundlePath:v30 purpose:1];
    uint64_t v33 = [v32 mutableCopy];

    id v31 = (id)v33;
  }
  id v34 = v39;
  id v35 = v31;

  return v35;
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v8 = [v5 valueForKey:v6];
    id v7 = [v8 JSONObjectRepresentation];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v8 = [v5 valueForKey:v6];
    id v7 = [v8 JSONObjectRepresentationWritingResourcesToBundlePath:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v6];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v10 = [v5 valueForKey:v6];
    id v7 = [v10 JSONObjectRepresentationWritingResourcesToBundlePath:*(void *)(a1 + 40) purpose:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v6];

    id v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:@"BezelCircularClassName"];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v8 = [v5 valueForKey:v6];
    id v7 = [v8 JSONObjectRepresentation];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v8 = [v5 valueForKey:v6];
    id v7 = [v8 JSONObjectRepresentationWritingResourcesToBundlePath:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v6];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v8 = [v5 valueForKey:v6];
    id v7 = [v8 JSONObjectRepresentation];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v6];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_7(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = a2;
    id v6 = [v4 valueForKey:v5];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_8(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = a2;
    id v6 = [v4 valueForKey:v5];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_9(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = a2;
    id v6 = [v4 valueForKey:v5];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_10(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a2;
    id v7 = [v4 valueForKey:v5];
    id v6 = [v7 JSONObjectRepresentation];
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = a2;
    id v8 = [v5 valueForKey:v6];
    id v7 = [v8 JSONObjectRepresentationWritingResourcesToBundlePath:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:v6];
  }
}

+ (id)_secureCodingRepresentationOfEmbeddedObjectsDictionary:(id)a3 bundlePath:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:v7];
  if (v9)
  {
    id v10 = [v6 allKeys];
    int v11 = [v10 containsObject:@"class"];

    if (v11)
    {
      id v12 = [(id)objc_opt_class() objectFromJSON:v6 bundle:v9];
    }
    else
    {
      id v23 = v9;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id obj = [v6 allKeys];
      uint64_t v14 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            id v19 = [v6 objectForKeyedSubscript:v18];
            uint64_t v20 = [a1 _secureCodingRepresentationOfValue:v19 bundlePath:v7];
            if (!v20)
            {

              id v12 = 0;
              goto LABEL_17;
            }
            id v21 = (void *)v20;
            [v8 setObject:v20 forKeyedSubscript:v18];
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      id v12 = v8;
LABEL_17:
      uint64_t v9 = v23;
    }
  }
  else
  {
    id v13 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[CLKComplicationTemplate _secureCodingRepresentationOfEmbeddedObjectsDictionary:bundlePath:]();
    }

    id v12 = 0;
  }

  return v12;
}

+ (id)_secureCodingRepresentationOfEmbeddedObjectsArray:(id)a3 bundlePath:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:v7];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(a1, "_secureCodingRepresentationOfValue:bundlePath:", *(void *)(*((void *)&v19 + 1) + 8 * i), v7, (void)v19);
          if (!v15)
          {

            goto LABEL_14;
          }
          uint64_t v16 = (void *)v15;
          [v9 addObject:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    uint64_t v9 = v9;
    id v17 = v9;
  }
  else
  {
    uint64_t v9 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[CLKComplicationTemplate _secureCodingRepresentationOfEmbeddedObjectsDictionary:bundlePath:]();
    }
LABEL_14:
    id v17 = 0;
  }

  return v17;
}

+ (id)_secureCodingRepresentationOfValue:(id)a3 bundlePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_class();
  if ([v8 isSubclassOfClass:objc_opt_class()])
  {
    id v9 = [(id)objc_opt_class() _secureCodingRepresentationOfEmbeddedObjectsDictionary:v6 bundlePath:v7];
LABEL_7:
    id v10 = v9;
    goto LABEL_8;
  }
  if ([v8 isSubclassOfClass:objc_opt_class()])
  {
    id v9 = [a1 _secureCodingRepresentationOfEmbeddedObjectsArray:v6 bundlePath:v7];
    goto LABEL_7;
  }
  if ([(id)objc_opt_class() classIsCompatibleWithJSONSerialization:v8])
  {
    id v9 = v6;
    goto LABEL_7;
  }
  uint64_t v12 = CLKLoggingObjectForDomain(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[CLKComplicationTemplate _secureCodingRepresentationOfValue:bundlePath:]((objc_class *)v8, v12);
  }

  id v10 = 0;
LABEL_8:

  return v10;
}

- (id)_validEmbeddedTemplateClassNamesForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "set", a3);
}

- (void)_setProvidersPaused:(BOOL)a3
{
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__CLKComplicationTemplate__setProvidersPaused___block_invoke;
  v11[3] = &unk_26440E1F0;
  v11[4] = self;
  BOOL v12 = a3;
  [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_2;
  v9[3] = &unk_26440E1F0;
  v9[4] = self;
  BOOL v10 = a3;
  [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v9];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_3;
  v7[3] = &unk_26440E1F0;
  v7[4] = self;
  BOOL v8 = a3;
  [(CLKComplicationTemplate *)self _enumerateGaugeProviderKeysWithBlock:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_4;
  v5[3] = &unk_26440E1F0;
  v5[4] = self;
  BOOL v6 = a3;
  [(CLKComplicationTemplate *)self _enumerateEmbeddedTemplateKeysWithBlock:v5];
}

void __47__CLKComplicationTemplate__setProvidersPaused___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKey:a2];
  [v3 setPaused:*(unsigned __int8 *)(a1 + 40)];
}

void __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKey:a2];
  [v3 setPaused:*(unsigned __int8 *)(a1 + 40)];
}

void __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKey:a2];
  [v3 setPaused:*(unsigned __int8 *)(a1 + 40)];
}

void __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) valueForKey:a2];
  [v3 _setProvidersPaused:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_enumerateScalarKeysWithBlock:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke;
  v12[3] = &unk_26440E218;
  id v5 = v4;
  id v13 = v5;
  [(CLKComplicationTemplate *)self _enumerateIntegerKeysWithBlock:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke_2;
  v10[3] = &unk_26440E240;
  id v6 = v5;
  id v11 = v6;
  [(CLKComplicationTemplate *)self _enumerateFloatKeysWithBlock:v10];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke_3;
  v8[3] = &unk_26440E268;
  id v9 = v6;
  id v7 = v6;
  [(CLKComplicationTemplate *)self _enumerateBOOLKeysWithBlock:v8];
}

uint64_t __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_enumerateAllBasicKeysWithBlock:(id)a3
{
  id v4 = a3;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke;
  v24[3] = &unk_26440DE80;
  id v5 = v4;
  id v25 = v5;
  [(CLKComplicationTemplate *)self _enumerateTextProviderKeysWithBlock:v24];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_2;
  v22[3] = &unk_26440DEA8;
  id v6 = v5;
  id v23 = v6;
  [(CLKComplicationTemplate *)self _enumerateImageProviderKeysWithBlock:v22];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_3;
  v20[3] = &unk_26440DE80;
  id v7 = v6;
  id v21 = v7;
  [(CLKComplicationTemplate *)self _enumerateProgressProviderKeysWithBlock:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_4;
  v18[3] = &unk_26440DFE8;
  id v8 = v7;
  id v19 = v8;
  [(CLKComplicationTemplate *)self _enumerateScalarKeysWithBlock:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_5;
  v16[3] = &unk_26440E268;
  id v9 = v8;
  id v17 = v9;
  [(CLKComplicationTemplate *)self _enumerateDateKeysWithBlock:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_6;
  v14[3] = &unk_26440DE80;
  id v10 = v9;
  id v15 = v10;
  [(CLKComplicationTemplate *)self _enumerateGaugeProviderKeysWithBlock:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_7;
  v12[3] = &unk_26440E290;
  id v13 = v10;
  id v11 = v10;
  [(CLKComplicationTemplate *)self _enumerateFullColorImageProviderKeysWithBlock:v12];
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(UIColor *)tintColor
{
}

- (BOOL)isLinkedOnOrAfterGrace
{
  return self->_linkedOnOrAfterGrace;
}

- (BOOL)renderForPreviews
{
  return self->_renderForPreviews;
}

- (void)setRenderForPreviews:(BOOL)a3
{
  self->_renderForPreviews = a3;
}

- (int64_t)sdkVersion
{
  return self->_sdkVersion;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (int64_t)uiSensitivity
{
  return self->_uiSensitivity;
}

- (void)setUISensitivity:(int64_t)a3
{
  self->_uiSensitivity = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (CLKComplicationBackgroundDescriptor)backgroundDescriptor
{
  return self->_backgroundDescriptor;
}

- (void)setBackgroundDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDescriptor, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_activeClients, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (id)classesCompatibleWithJSONSerialization
{
  if (classesCompatibleWithJSONSerialization_classSetNTKOnceToken != -1) {
    dispatch_once(&classesCompatibleWithJSONSerialization_classSetNTKOnceToken, &__block_literal_global_24);
  }
  id v2 = (void *)classesCompatibleWithJSONSerialization_classesCompatibleWithJSONSerialization;

  return v2;
}

uint64_t __84__CLKComplicationTemplate_JSONSerialization__classesCompatibleWithJSONSerialization__block_invoke()
{
  uint64_t v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v13 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_msgSend(v14, "setWithObjects:", v13, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  uint64_t v11 = classesCompatibleWithJSONSerialization_classesCompatibleWithJSONSerialization;
  classesCompatibleWithJSONSerialization_classesCompatibleWithJSONSerialization = v10;

  return MEMORY[0x270F9A758](v10, v11);
}

+ (id)createJSONRepresentationFromDictionary:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v23 = a4;
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v10 = v8;
  id obj = [v8 allKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v16 = [v10 objectForKeyedSubscript:v15];
        uint64_t v17 = [a1 _jsonRepresentationFromValue:v16 bundlePath:v23 purpose:a5];
        if (!v17)
        {
          long long v20 = CLKLoggingObjectForDomain(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            +[CLKComplicationTemplate(JSONSerialization) createJSONRepresentationFromDictionary:bundlePath:purpose:]();
          }

          id v19 = 0;
          goto LABEL_13;
        }
        uint64_t v18 = (void *)v17;
        [v9 setObject:v17 forKeyedSubscript:v15];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v19 = v9;
LABEL_13:

  return v19;
}

+ (id)objectFromJSON:(id)a3 bundle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 allKeys];
  int v8 = [v7 containsObject:@"class"];

  if (!v8) {
    goto LABEL_12;
  }
  id v9 = [v5 objectForKeyedSubscript:@"class"];
  uint64_t v10 = NSClassFromString(v9);

  if (!v10)
  {
    uint64_t v11 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CLKComplicationTemplate(JSONSerialization) objectFromJSON:bundle:](v11);
    }
  }
  uint64_t v12 = [(id)objc_opt_class() _superClassFromCompatibleJSONSerializationClass:v10];
  if (!v12)
  {
    uint64_t v15 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[CLKComplicationTemplate(JSONSerialization) objectFromJSON:bundle:]();
    }

    goto LABEL_12;
  }
  uint64_t v13 = (void *)v12;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [[v10 alloc] initWithJSONObjectRepresentation:v5 bundle:v6];
      goto LABEL_19;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v13 providerWithJSONObjectRepresentation:v5];
      goto LABEL_19;
    }
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v13 providerWithJSONObjectRepresentation:v5 bundle:v6];
      goto LABEL_19;
    }
    uint64_t v18 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[CLKComplicationTemplate(JSONSerialization) objectFromJSON:bundle:](v5, @"class");
    }

LABEL_12:
    uint64_t v16 = 0;
    goto LABEL_20;
  }
  uint64_t v14 = [[v10 alloc] initWithJSONObjectRepresentation:v5];
LABEL_19:
  uint64_t v16 = (void *)v14;
LABEL_20:

  return v16;
}

+ (BOOL)classIsCompatibleWithJSONSerialization:(Class)a3
{
  return [a1 _superClassFromCompatibleJSONSerializationClass:a3] != 0;
}

+ (BOOL)dictionaryIsCompatibleWithJSONSerialization:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 allValues];

  LOBYTE(v4) = [v4 _arrayIsCompatibleWithJSONSerialization:v5];
  return (char)v4;
}

+ (BOOL)_arrayIsCompatibleWithJSONSerialization:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_opt_class();
        if (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class(), (void)v13))
        {
          if (([a1 dictionaryIsCompatibleWithJSONSerialization:v9] & 1) == 0) {
            goto LABEL_16;
          }
        }
        else if ([v10 isSubclassOfClass:objc_opt_class()])
        {
          if (([a1 _arrayIsCompatibleWithJSONSerialization:v9] & 1) == 0) {
            goto LABEL_16;
          }
        }
        else if (![a1 classIsCompatibleWithJSONSerialization:v10])
        {
LABEL_16:
          BOOL v11 = 0;
          goto LABEL_17;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

+ (id)_createJSONRepresentationFromArray:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(a1, "_jsonRepresentationFromValue:bundlePath:purpose:", v16, v9, a5, (void)v22);
        if (!v17)
        {
          long long v20 = CLKLoggingObjectForDomain(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            +[CLKComplicationTemplate(JSONSerialization) createJSONRepresentationFromDictionary:bundlePath:purpose:]();
          }

          id v19 = 0;
          goto LABEL_13;
        }
        uint64_t v18 = (void *)v17;
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v19 = v10;
LABEL_13:

  return v19;
}

+ (id)_jsonObjectRepresentationFromObject:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = objc_opt_class();
    if ([v9 classIsCompatibleWithJSONSerialization:objc_opt_class()])
    {
      if (objc_opt_respondsToSelector())
      {
        id v10 = [v7 JSONObjectRepresentation];
      }
      else if (objc_opt_respondsToSelector())
      {
        id v10 = [v7 JSONObjectRepresentationWritingResourcesToBundlePath:v8];
      }
      else if (objc_opt_respondsToSelector())
      {
        id v10 = [v7 JSONObjectRepresentationWritingResourcesToBundlePath:v8 purpose:a5];
      }
      else
      {
        id v10 = v7;
      }
      uint64_t v12 = v10;
      goto LABEL_15;
    }
    id v11 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[CLKComplicationTemplate(JSONSerialization) _jsonObjectRepresentationFromObject:bundlePath:purpose:]();
    }
  }
  uint64_t v12 = 0;
LABEL_15:

  return v12;
}

+ (id)_jsonRepresentationFromValue:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [a1 createJSONRepresentationFromDictionary:v8 bundlePath:v9 purpose:a5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1 _createJSONRepresentationFromArray:v8 bundlePath:v9 purpose:a5];
    }
    else {
    uint64_t v10 = [a1 _jsonObjectRepresentationFromObject:v8 bundlePath:v9 purpose:a5];
    }
  }
  id v11 = (void *)v10;

  return v11;
}

+ (Class)_superClassFromCompatibleJSONSerializationClass:(Class)a3
{
  Class v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(a1, "classesCompatibleWithJSONSerialization", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([(objc_class *)v3 isSubclassOfClass:v9])
          {
            Class v3 = v9;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    Class v3 = 0;
LABEL_12:
  }

  return v3;
}

- (int64_t)compatibleFamily
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)validateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_21C599000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v3, 0xCu);
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  id v4 = v3;
  OUTLINED_FUNCTION_0_0(&dword_21C599000, a2, v5, "Invalid embedded template class (%@)", v6);
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_10_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C599000, v0, v1, "Invalid embedded template class (%@)", v2);
}

+ (void)complicationTemplateWithJSONObjectRepresentation:(void *)a1 bundle:(uint64_t)a2 purpose:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_21C599000, a3, (uint64_t)a3, "Complication bundle: %@", (uint8_t *)a2);
}

+ (void)_secureCodingRepresentationOfEmbeddedObjectsDictionary:bundlePath:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C599000, v0, v1, "Cannot create bundle from given path: %@", v2);
}

+ (void)_secureCodingRepresentationOfValue:(objc_class *)a1 bundlePath:(NSObject *)a2 .cold.1(objc_class *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = NSStringFromClass(a1);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21C599000, a2, v4, "Cannot encode class: %@ since it is not a supported type", v5);
}

@end
@interface CLKComplicationTemplateGraphicBezelCircularText
+ (CLKComplicationTemplateGraphicBezelCircularText)templateWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate;
+ (CLKComplicationTemplateGraphicBezelCircularText)templateWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate textProvider:(CLKTextProvider *)textProvider;
- (BOOL)needsSerializableCopy;
- (CLKComplicationTemplateGraphicBezelCircularText)initWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate;
- (CLKComplicationTemplateGraphicBezelCircularText)initWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate textProvider:(CLKTextProvider *)textProvider;
- (CLKComplicationTemplateGraphicCircular)circularTemplate;
- (CLKTextProvider)textProvider;
- (id)_validEmbeddedTemplateClassNamesForKey:(id)a3;
- (id)serializableCopyWithImageProviders:(id)a3;
- (int64_t)compatibleFamily;
- (void)_enumerateEmbeddedTemplateKeysWithBlock:(id)a3;
- (void)_enumerateTextProviderKeysWithBlock:(id)a3;
- (void)setCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate;
- (void)setTextProvider:(CLKTextProvider *)textProvider;
@end

@implementation CLKComplicationTemplateGraphicBezelCircularText

- (CLKComplicationTemplateGraphicBezelCircularText)initWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate
{
  return [(CLKComplicationTemplateGraphicBezelCircularText *)self initWithCircularTemplate:circularTemplate textProvider:0];
}

- (CLKComplicationTemplateGraphicBezelCircularText)initWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate textProvider:(CLKTextProvider *)textProvider
{
  v6 = circularTemplate;
  v7 = textProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicBezelCircularText;
  v8 = [(CLKComplicationTemplate *)&v11 initPrivate];
  v9 = v8;
  if (v8)
  {
    [(CLKComplicationTemplateGraphicBezelCircularText *)v8 setCircularTemplate:v6];
    [(CLKComplicationTemplateGraphicBezelCircularText *)v9 setTextProvider:v7];
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicBezelCircularText)templateWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate
{
  v4 = circularTemplate;
  v5 = (void *)[objc_alloc((Class)a1) initWithCircularTemplate:v4];

  return (CLKComplicationTemplateGraphicBezelCircularText *)v5;
}

+ (CLKComplicationTemplateGraphicBezelCircularText)templateWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate textProvider:(CLKTextProvider *)textProvider
{
  v6 = textProvider;
  v7 = circularTemplate;
  v8 = (void *)[objc_alloc((Class)a1) initWithCircularTemplate:v7 textProvider:v6];

  return (CLKComplicationTemplateGraphicBezelCircularText *)v8;
}

- (int64_t)compatibleFamily
{
  return 9;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, uint64_t, uint64_t, char *))a3 + 2))(a3, @"textProvider", 1, 1, &v3);
}

- (void)_enumerateEmbeddedTemplateKeysWithBlock:(id)a3
{
  char v3 = 0;
  (*((void (**)(id, __CFString *, void, uint64_t, char *))a3 + 2))(a3, @"circularTemplate", 0, 1, &v3);
}

- (id)_validEmbeddedTemplateClassNamesForKey:(id)a3
{
  if (_validEmbeddedTemplateClassNamesForKey__onceToken != -1) {
    dispatch_once(&_validEmbeddedTemplateClassNamesForKey__onceToken, &__block_literal_global_1425);
  }
  char v3 = (void *)_validEmbeddedTemplateClassNamesForKey____classNames;

  return v3;
}

void __90__CLKComplicationTemplateGraphicBezelCircularText__validEmbeddedTemplateClassNamesForKey___block_invoke()
{
  v36[16] = *MEMORY[0x263EF8340];
  v31 = (void *)MEMORY[0x263EFFA08];
  v0 = (objc_class *)objc_opt_class();
  v35 = NSStringFromClass(v0);
  v36[0] = v35;
  v1 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v1);
  v36[1] = v34;
  v2 = (objc_class *)objc_opt_class();
  v33 = NSStringFromClass(v2);
  v36[2] = v33;
  char v3 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v3);
  v36[3] = v32;
  v4 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v4);
  v36[4] = v30;
  v5 = (objc_class *)objc_opt_class();
  v29 = NSStringFromClass(v5);
  v36[5] = v29;
  v6 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v6);
  v36[6] = v28;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v36[7] = v8;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v36[8] = v10;
  objc_super v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  v36[9] = v12;
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v36[10] = v14;
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v36[11] = v16;
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v36[12] = v18;
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  v36[13] = v20;
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v36[14] = v22;
  v23 = (objc_class *)objc_opt_class();
  v24 = NSStringFromClass(v23);
  v36[15] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:16];
  uint64_t v26 = [v31 setWithArray:v25];
  v27 = (void *)_validEmbeddedTemplateClassNamesForKey____classNames;
  _validEmbeddedTemplateClassNamesForKey____classNames = v26;
}

- (BOOL)needsSerializableCopy
{
  v2 = [(CLKComplicationTemplateGraphicBezelCircularText *)self circularTemplate];
  char v3 = [v2 needsSerializableCopy];

  return v3;
}

- (id)serializableCopyWithImageProviders:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = (id)objc_opt_new();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__CLKComplicationTemplateGraphicBezelCircularText_serializableCopyWithImageProviders___block_invoke;
  v11[3] = &unk_26440E2D8;
  v11[4] = &v12;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];
  v5 = [(CLKComplicationTemplateGraphicBezelCircularText *)self circularTemplate];
  v6 = [v5 serializableCopyWithImageProviders:v13[5]];

  v7 = [CLKComplicationTemplateGraphicBezelCircularText alloc];
  v8 = [(CLKComplicationTemplateGraphicBezelCircularText *)self textProvider];
  v9 = [(CLKComplicationTemplateGraphicBezelCircularText *)v7 initWithCircularTemplate:v6 textProvider:v8];

  [(CLKComplicationTemplate *)v9 setSdkVersion:[(CLKComplicationTemplate *)self sdkVersion]];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __86__CLKComplicationTemplateGraphicBezelCircularText_serializableCopyWithImageProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  v5 = [a2 componentsSeparatedByString:@"."];
  if ((unint64_t)[v5 count] >= 2)
  {
    v6 = [v5 objectAtIndexedSubscript:0];
    int v7 = [v6 isEqualToString:@"circularTemplate"];

    if (v7)
    {
      v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      v9 = [v5 objectAtIndexedSubscript:1];
      [v8 setObject:v10 forKeyedSubscript:v9];
    }
  }
}

- (CLKComplicationTemplateGraphicCircular)circularTemplate
{
  return self->_circularTemplate;
}

- (void)setCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate
{
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);

  objc_storeStrong((id *)&self->_circularTemplate, 0);
}

@end
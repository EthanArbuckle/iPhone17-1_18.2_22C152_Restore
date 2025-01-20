@interface INControlHomeIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasTitle;
- (INControlHomeIntent)initWithContents:(id)a3;
- (INControlHomeIntent)initWithUserTask:(id)a3 filters:(id)a4;
- (INControlHomeIntent)initWithUserTask:(id)a3 filters:(id)a4 time:(id)a5;
- (INDateComponentsRange)time;
- (INHomeUserTask)userTask;
- (NSArray)contents;
- (NSArray)filters;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_initWithIdentifier:(id)a3 backingStore:(id)a4 schema:(id)a5 error:(id *)a6;
- (id)_metadata;
- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setContents:(id)a3;
- (void)setFilters:(id)a3;
- (void)setTime:(id)a3;
- (void)setUserTask:(id)a3;
@end

@implementation INControlHomeIntent

- (id)verb
{
  return @"ControlHome";
}

- (id)domain
{
  return @"HomeKit";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INControlHomeIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 time];
  v10 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);

  [v8 setTime:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"userTask";
  v3 = [(INControlHomeIntent *)self userTask];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"filters";
  v5 = [(INControlHomeIntent *)self filters];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"time";
  v7 = [(INControlHomeIntent *)self time];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  if (!v5) {
  if (!v3)
  }

  return v9;
}

- (id)_initWithIdentifier:(id)a3 backingStore:(id)a4 schema:(id)a5 error:(id *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)INControlHomeIntent;
  id v6 = [(INIntent *)&v12 _initWithIdentifier:a3 backingStore:a4 schema:a5 error:a6];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 backingStore];
    if ([v8 contentsCount])
    {
      v9 = [v8 contents];
      v10 = INIntentSlotValueTransformFromHomeContents(v9);
      [v7 setContents:v10];
    }
  }
  return v7;
}

- (void)setContents:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v4 = [a3 firstObject];
  v5 = [v4 actions];
  id v6 = [v5 firstObject];

  if (v6)
  {
    v7 = INIntentSlotValueTransformToHomeAction(v6);
    v8 = [INHomeUserTask alloc];
    uint64_t v9 = [v6 type];
    v10 = [v7 attributeValue];
    id v11 = INIntentSlotValueTransformFromHomeAttributeValue(v10);
    objc_super v12 = [(INHomeUserTask *)v8 initWithTaskType:1 attribute:v9 value:v11];
    [(INControlHomeIntent *)self setUserTask:v12];
  }
  v13 = [v4 filter];

  if (v13)
  {
    v14 = [v4 filter];
    v16[0] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [(INControlHomeIntent *)self setFilters:v15];
  }
}

- (NSArray)contents
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(INControlHomeIntent *)self userTask];
  uint64_t v4 = [(INControlHomeIntent *)self filters];
  if (v3 | v4)
  {
    if (v3)
    {
      v23 = [INHomeAction alloc];
      uint64_t v22 = [(id)v3 attribute];
      v25 = [(id)v3 value];
      uint64_t v5 = [v25 type];
      v24 = [(id)v3 value];
      uint64_t v6 = [v24 BOOLValue];
      v7 = [(id)v3 value];
      [v7 doubleValue];
      double v9 = v8;
      v10 = [(id)v3 value];
      uint64_t v11 = [v10 integerValue];
      objc_super v12 = [(id)v3 value];
      v13 = [v12 stringValue];
      v14 = [(INHomeAction *)v23 initWithType:v22 valueType:v5 BOOLValue:v6 doubleValue:v11 integerValue:v13 stringValue:v9];
      v27[0] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    }
    else
    {
      v15 = 0;
    }
    v17 = [INHomeContent alloc];
    v18 = [(INControlHomeIntent *)self filters];
    v19 = [v18 firstObject];
    v20 = [(INHomeContent *)v17 initWithFilter:v19 actions:v15];
    v26 = v20;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  }
  else
  {
    v16 = 0;
  }

  return (NSArray *)v16;
}

- (INControlHomeIntent)initWithContents:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 firstObject];
  uint64_t v5 = [v4 actions];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    v7 = INIntentSlotValueTransformToHomeAction(v6);
    double v8 = [INHomeUserTask alloc];
    uint64_t v9 = [v6 type];
    v10 = [v7 attributeValue];
    uint64_t v11 = INIntentSlotValueTransformFromHomeAttributeValue(v10);
    objc_super v12 = [(INHomeUserTask *)v8 initWithTaskType:1 attribute:v9 value:v11];
  }
  else
  {
    objc_super v12 = 0;
  }
  v13 = [v4 filter];

  if (v13)
  {
    v14 = [v4 filter];
    v17[0] = v14;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  }
  v15 = [(INControlHomeIntent *)self initWithUserTask:v12 filters:v13];

  return v15;
}

- (void)setTime:(id)a3
{
  id v4 = a3;
  id v6 = [(INControlHomeIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setTime:v5];
}

- (INDateComponentsRange)time
{
  v2 = [(INControlHomeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 time];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setFilters:(id)a3
{
  id v4 = a3;
  id v6 = [(INControlHomeIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToHomeFilters(v4);

  [v6 setFilters:v5];
}

- (NSArray)filters
{
  v2 = [(INControlHomeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 filters];
  id v4 = INIntentSlotValueTransformFromHomeFilters(v3);

  return (NSArray *)v4;
}

- (void)setUserTask:(id)a3
{
  id v4 = a3;
  id v6 = [(INControlHomeIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToHomeUserTask(v4);

  [v6 setUserTask:v5];
}

- (INHomeUserTask)userTask
{
  v2 = [(INControlHomeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 userTask];
  id v4 = INIntentSlotValueTransformFromHomeUserTask(v3);

  return (INHomeUserTask *)v4;
}

- (INControlHomeIntent)initWithUserTask:(id)a3 filters:(id)a4
{
  return [(INControlHomeIntent *)self initWithUserTask:a3 filters:a4 time:0];
}

- (INControlHomeIntent)initWithUserTask:(id)a3 filters:(id)a4 time:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)INControlHomeIntent;
  uint64_t v11 = [(INIntent *)&v14 init];
  objc_super v12 = v11;
  if (v11)
  {
    [(INControlHomeIntent *)v11 setUserTask:v8];
    [(INControlHomeIntent *)v12 setFilters:v9];
    [(INControlHomeIntent *)v12 setTime:v10];
  }

  return v12;
}

- (id)_categoryVerb
{
  return @"Run";
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INControlHomeIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INControlHomeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_subtitleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v5 = a3;
  id v6 = [(INControlHomeIntent *)self filters];
  v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = [v7 home];

    if (v8)
    {
      id v9 = [v7 home];
      id v8 = objc_msgSend(v9, "_intents_readableTitleWithLocalizer:", v5);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v5 = a3;
  id v6 = [(INControlHomeIntent *)self filters];
  v7 = [v6 firstObject];

  id v8 = [(INControlHomeIntent *)self userTask];
  id v9 = v8;
  id v10 = 0;
  if (v7 && v8)
  {
    if ([v8 taskType] == 1)
    {
      if ([v9 attribute] == 1)
      {
        uint64_t v11 = [v7 entityName];
        if (v11 && (objc_super v12 = (void *)v11, v13 = [v7 entityType], v12, v13 == 5))
        {
          objc_super v14 = NSString;
          v15 = @"Run %@";
        }
        else
        {
          v16 = [v9 value];
          int v17 = [v16 BOOLValue];

          objc_super v14 = NSString;
          if (v17) {
            v15 = @"Turn on %@";
          }
          else {
            v15 = @"Turn off %@";
          }
        }
      }
      else
      {
        objc_super v14 = NSString;
        v15 = @"Control %@";
      }
      v18 = INLocalizedStringWithLocalizer(v15, v15, v5);
      v19 = objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);
      id v10 = objc_msgSend(v14, "localizedStringWithFormat:", v18, v19);
    }
    else
    {
      id v10 = 0;
    }
  }

  return v10;
}

- (BOOL)_hasTitle
{
  uint64_t v3 = [(INControlHomeIntent *)self userTask];
  id v4 = [(INControlHomeIntent *)self filters];
  BOOL v5 = 0;
  if ([v4 count] && v3) {
    BOOL v5 = [v3 taskType] == 1;
  }

  return v5;
}

@end
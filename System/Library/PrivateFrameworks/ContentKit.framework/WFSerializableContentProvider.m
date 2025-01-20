@interface WFSerializableContentProvider
+ (id)sharedProvider;
- (NSMutableDictionary)entriesForClassNames;
- (WFSerializableContentProvider)init;
- (id)entryConsideringSuperclassesForClass:(Class)a3;
- (id)objectOfClass:(Class)a3 withSerializedRepresentation:(id)a4;
- (id)serializedRepresentationForObject:(id)a3;
- (void)registerSerializableContentClasses;
@end

@implementation WFSerializableContentProvider

- (void).cxx_destruct
{
}

- (NSMutableDictionary)entriesForClassNames
{
  return self->_entriesForClassNames;
}

- (void)registerSerializableContentClasses
{
  v12[6] = *MEMORY[0x263EF8340];
  v11[0] = @"MKMapItem";
  v3 = [[WFSerializableContentProviderEntry alloc] initWithSerializedRepresentationBlock:&__block_literal_global_82 deserializationBlock:&__block_literal_global_104];
  v12[0] = v3;
  v11[1] = @"CLLocation";
  v4 = [[WFSerializableContentProviderEntry alloc] initWithSerializedRepresentationBlock:&__block_literal_global_120_3917 deserializationBlock:&__block_literal_global_125];
  v12[1] = v4;
  v11[2] = @"MPMediaItem";
  v5 = [[WFSerializableContentProviderEntry alloc] initWithSerializedRepresentationBlock:&__block_literal_global_129 deserializationBlock:&__block_literal_global_134];
  v12[2] = v5;
  v11[3] = @"EKCalendarItem";
  v6 = [[WFSerializableContentProviderEntry alloc] initWithSerializedRepresentationBlock:&__block_literal_global_138 deserializationBlock:&__block_literal_global_140];
  v12[3] = v6;
  v11[4] = @"EKEvent";
  v7 = [[WFSerializableContentProviderEntry alloc] initWithSerializedRepresentationBlock:&__block_literal_global_153 deserializationBlock:&__block_literal_global_155];
  v12[4] = v7;
  v11[5] = @"REMReminder";
  v8 = [[WFSerializableContentProviderEntry alloc] initWithSerializedRepresentationBlock:&__block_literal_global_164 deserializationBlock:&__block_literal_global_166];
  v12[5] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  v10 = [(WFSerializableContentProvider *)self entriesForClassNames];
  [v10 addEntriesFromDictionary:v9];
}

- (id)entryConsideringSuperclassesForClass:(Class)a3
{
  if (a3)
  {
    v3 = a3;
    do
    {
      v5 = [(WFSerializableContentProvider *)self entriesForClassNames];
      v6 = NSStringFromClass(v3);
      v7 = [v5 objectForKeyedSubscript:v6];

      uint64_t v8 = [(objc_class *)v3 superclass];
      if (!v8) {
        break;
      }
      v3 = (objc_class *)v8;
    }
    while (!v7);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)objectOfClass:(Class)a3 withSerializedRepresentation:(id)a4
{
  id v7 = a4;
  if (!a3)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFSerializableContentProvider.m", 129, @"Invalid parameter not satisfying: %@", @"class" object file lineNumber description];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [(objc_class *)a3 objectWithWFSerializedRepresentation:v7];
  }
  else
  {
    v9 = NSStringFromClass(a3);
    v10 = [(WFSerializableContentProvider *)self entriesForClassNames];
    v11 = [v10 objectForKeyedSubscript:v9];

    if (v11)
    {
      v12 = [v11 deserializationBlock];
      uint64_t v8 = ((void (**)(void, id))v12)[2](v12, v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  return v8;
}

- (id)serializedRepresentationForObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFSerializableContentProvider.m", 117, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 wfSerializedRepresentation];
  }
  else
  {
    id v7 = [(WFSerializableContentProvider *)self entryConsideringSuperclassesForClass:objc_opt_class()];
    uint64_t v8 = v7;
    if (v7)
    {
      v9 = [v7 serializationBlock];
      v6 = ((void (**)(void, id))v9)[2](v9, v5);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (WFSerializableContentProvider)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFSerializableContentProvider;
  v2 = [(WFSerializableContentProvider *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    entriesForClassNames = v2->_entriesForClassNames;
    v2->_entriesForClassNames = (NSMutableDictionary *)v3;

    id v5 = v2;
  }

  return v2;
}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1) {
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_4027);
  }
  v2 = (void *)sharedProvider_registry;
  return v2;
}

uint64_t __47__WFSerializableContentProvider_sharedProvider__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedProvider_registry;
  sharedProvider_registry = v0;

  v2 = (void *)sharedProvider_registry;
  return [v2 registerSerializableContentClasses];
}

@end
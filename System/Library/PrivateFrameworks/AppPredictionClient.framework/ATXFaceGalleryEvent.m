@interface ATXFaceGalleryEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)galleryDidAppearEventWithConfiguration:(id)a3;
+ (id)galleryDidDisappearEvent;
+ (id)itemsDidAppearEventWithItems:(id)a3;
- (ATXFaceGalleryConfiguration)configuration;
- (ATXFaceGalleryEvent)initWithEventType:(int64_t)a3 configuration:(id)a4 items:(id)a5;
- (ATXFaceGalleryEvent)initWithProto:(id)a3;
- (ATXFaceGalleryEvent)initWithProtoData:(id)a3;
- (NSArray)items;
- (NSDictionary)jsonDictionary;
- (NSString)description;
- (id)encodeAsProto;
- (id)json;
- (id)proto;
- (int64_t)eventType;
- (unsigned)dataVersion;
- (void)setEventType:(int64_t)a3;
@end

@implementation ATXFaceGalleryEvent

+ (id)galleryDidAppearEventWithConfiguration:(id)a3
{
  id v3 = a3;
  v4 = [[ATXFaceGalleryEvent alloc] initWithEventType:1 configuration:v3 items:0];

  return v4;
}

+ (id)galleryDidDisappearEvent
{
  v2 = [[ATXFaceGalleryEvent alloc] initWithEventType:2 configuration:0 items:0];

  return v2;
}

+ (id)itemsDidAppearEventWithItems:(id)a3
{
  id v3 = a3;
  v4 = [[ATXFaceGalleryEvent alloc] initWithEventType:3 configuration:0 items:v3];

  return v4;
}

- (ATXFaceGalleryEvent)initWithEventType:(int64_t)a3 configuration:(id)a4 items:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXFaceGalleryEvent;
  v11 = [(ATXFaceGalleryEvent *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_eventType = a3;
    objc_storeStrong((id *)&v11->_configuration, a4);
    uint64_t v13 = [v10 copy];
    items = v12->_items;
    v12->_items = (NSArray *)v13;
  }
  return v12;
}

- (NSString)description
{
  id v3 = NSString;
  int64_t v4 = [(ATXFaceGalleryEvent *)self eventType];
  if (v4 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5D09C48[(int)v4];
  }
  v6 = [(ATXFaceGalleryEvent *)self configuration];
  v7 = [v3 stringWithFormat:@"<ATXFaceGalleryEvent type: %@ configuration: %@>", v5, v6];

  return (NSString *)v7;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];

  return v6;
}

- (NSDictionary)jsonDictionary
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"eventType";
  int64_t v3 = [(ATXFaceGalleryEvent *)self eventType];
  if (v3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v3);
    int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v4 = off_1E5D09C48[(int)v3];
  }
  v14[0] = v4;
  v13[1] = @"configuration";
  id v5 = [(ATXFaceGalleryEvent *)self configuration];
  v6 = [v5 jsonDictionary];
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v7;
  v13[2] = @"items";
  v8 = [(ATXFaceGalleryEvent *)self items];
  id v9 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_81);
  id v10 = v9;
  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (!v9) {

  }
  if (!v6) {

  }
  return (NSDictionary *)v11;
}

uint64_t __37__ATXFaceGalleryEvent_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonDictionary];
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  int64_t v3 = [(ATXFaceGalleryEvent *)self jsonDictionary];
  int64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXFaceGalleryEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBFaceGalleryEvent alloc] initWithData:v4];

    self = [(ATXFaceGalleryEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXFaceGalleryEvent *)self proto];
  int64_t v3 = [v2 data];

  return v3;
}

- (ATXFaceGalleryEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[ATXDigestTimeline initWithProto:]((uint64_t)self, v10);
    }

    goto LABEL_8;
  }
  id v5 = v4;
  uint64_t v6 = (int)-[ATXPBFaceGalleryEvent eventType]((uint64_t)v5);
  if (-[ATXPBFaceGalleryEvent hasConfiguration]((BOOL)v5))
  {
    v7 = [ATXFaceGalleryConfiguration alloc];
    v8 = -[ATXPBFaceGalleryEvent configuration]((uint64_t)v5);
    id v9 = [(ATXFaceGalleryConfiguration *)v7 initWithProto:v8];
  }
  else
  {
    id v9 = 0;
  }
  v12 = -[ATXPBFaceGalleryEvent items]((uint64_t)v5);
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = -[ATXPBFaceGalleryEvent items]((uint64_t)v5);
    v15 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_31_0);
  }
  else
  {
    v15 = 0;
  }
  self = [(ATXFaceGalleryEvent *)self initWithEventType:v6 configuration:v9 items:v15];

  v11 = self;
LABEL_14:

  return v11;
}

ATXFaceGalleryItem *__37__ATXFaceGalleryEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [[ATXFaceGalleryItem alloc] initWithProto:v2];

  return v3;
}

- (id)proto
{
  int64_t v3 = objc_opt_new();
  -[ATXPBFaceGalleryEvent setEventType:]((uint64_t)v3, [(ATXFaceGalleryEvent *)self eventType]);
  id v4 = [(ATXFaceGalleryEvent *)self configuration];
  id v5 = [v4 proto];
  -[ATXPBFaceGalleryEvent setConfiguration:]((uint64_t)v3, v5);

  uint64_t v6 = [(ATXFaceGalleryEvent *)self items];
  v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_34_0);
  v8 = v7;
  if (!v7) {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = (void *)[v7 mutableCopy];
  -[ATXPBFaceGalleryEvent setItems:]((uint64_t)v3, v9);

  return v3;
}

uint64_t __28__ATXFaceGalleryEvent_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int64_t)a3
{
  self->_eventType = a3;
}

- (ATXFaceGalleryConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
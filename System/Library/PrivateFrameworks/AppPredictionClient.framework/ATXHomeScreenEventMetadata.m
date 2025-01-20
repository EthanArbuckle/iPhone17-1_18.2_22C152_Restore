@interface ATXHomeScreenEventMetadata
+ (BOOL)supportsSecureCoding;
- (ATXCGRectWrapper)visibleRect;
- (ATXHomeScreenEventMetadata)init;
- (ATXHomeScreenEventMetadata)initWithCoder:(id)a3;
- (ATXHomeScreenEventMetadata)initWithPageIndex:(id)a3 suggestedPageType:(int64_t)a4 stacks:(id)a5 widgetsInStack:(id)a6 isSuggestionInAddWidgetSheet:(id)a7 isWidgetInTodayView:(id)a8 visibleRect:(id)a9 engagedUrl:(id)a10;
- (ATXHomeScreenEventMetadata)initWithProto:(id)a3;
- (ATXHomeScreenEventMetadata)initWithProtoData:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenEventMetadata:(id)a3;
- (NSArray)bundleIds;
- (NSArray)widgetsInStack;
- (NSDictionary)stacks;
- (NSNumber)isStalenessRotation;
- (NSNumber)isSuggestionInAddWidgetSheet;
- (NSNumber)isWidgetInTodayView;
- (NSNumber)pageIndex;
- (NSURL)engagedUrl;
- (id)dictionaryRepresentation;
- (id)encodeAsProto;
- (id)proto;
- (int64_t)suggestedPageType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIds:(id)a3;
- (void)setEngagedUrl:(id)a3;
- (void)setIsStalenessRotation:(id)a3;
- (void)setIsSuggestionInAddWidgetSheet:(id)a3;
- (void)setIsWidgetInTodayView:(id)a3;
- (void)setPageIndex:(id)a3;
- (void)setStacks:(id)a3;
- (void)setSuggestedPageType:(int64_t)a3;
- (void)setVisibleRect:(id)a3;
- (void)setWidgetsInStack:(id)a3;
@end

@implementation ATXHomeScreenEventMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isStalenessRotation, 0);
  objc_storeStrong((id *)&self->_engagedUrl, 0);
  objc_storeStrong((id *)&self->_visibleRect, 0);
  objc_storeStrong((id *)&self->_isWidgetInTodayView, 0);
  objc_storeStrong((id *)&self->_isSuggestionInAddWidgetSheet, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_widgetsInStack, 0);
  objc_storeStrong((id *)&self->_pageIndex, 0);
  objc_storeStrong((id *)&self->_widgets, 0);

  objc_storeStrong((id *)&self->_stackIds, 0);
}

- (ATXHomeScreenEventMetadata)init
{
  return [(ATXHomeScreenEventMetadata *)self initWithPageIndex:0 suggestedPageType:0 stacks:0 widgetsInStack:0 isSuggestionInAddWidgetSheet:0 isWidgetInTodayView:0 visibleRect:0 engagedUrl:0];
}

- (ATXHomeScreenEventMetadata)initWithPageIndex:(id)a3 suggestedPageType:(int64_t)a4 stacks:(id)a5 widgetsInStack:(id)a6 isSuggestionInAddWidgetSheet:(id)a7 isWidgetInTodayView:(id)a8 visibleRect:(id)a9 engagedUrl:(id)a10
{
  id v34 = a3;
  id v16 = a5;
  id v17 = a6;
  id v33 = a7;
  id v32 = a8;
  id v18 = a9;
  id v19 = a10;
  v35.receiver = self;
  v35.super_class = (Class)ATXHomeScreenEventMetadata;
  v20 = [(ATXHomeScreenEventMetadata *)&v35 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_pageIndex, a3);
    uint64_t v22 = objc_opt_new();
    stackIds = v21->_stackIds;
    v21->_stackIds = (NSMutableArray *)v22;

    uint64_t v24 = objc_opt_new();
    widgets = v21->_widgets;
    v21->_widgets = (NSMutableArray *)v24;

    v26 = (void *)[v17 copy];
    v27 = v26;
    if (v26) {
      v28 = v26;
    }
    else {
      v28 = (NSArray *)objc_opt_new();
    }
    widgetsInStack = v21->_widgetsInStack;
    v21->_widgetsInStack = v28;

    objc_storeStrong((id *)&v21->_isSuggestionInAddWidgetSheet, a7);
    objc_storeStrong((id *)&v21->_isWidgetInTodayView, a8);
    objc_storeStrong((id *)&v21->_visibleRect, a9);
    objc_storeStrong((id *)&v21->_engagedUrl, a10);
    v21->_suggestedPageType = a4;
  }
  -[ATXHomeScreenEventMetadata setStacks:](v21, "setStacks:", v16, a4);

  return v21;
}

- (void)setStacks:(id)a3
{
  stackIds = self->_stackIds;
  id v5 = a3;
  [(NSMutableArray *)stackIds removeAllObjects];
  [(NSMutableArray *)self->_widgets removeAllObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__ATXHomeScreenEventMetadata_setStacks___block_invoke;
  v6[3] = &unk_1E5D08F00;
  v6[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)setPageIndex:(id)a3
{
}

- (id)proto
{
  v3 = objc_opt_new();
  pageIndex = self->_pageIndex;
  if (pageIndex) {
    -[ATXPBHomeScreenEventMetadata setPageIndex:]((uint64_t)v3, [(NSNumber *)pageIndex unsignedIntegerValue]);
  }
  id v5 = (void *)[(NSArray *)self->_bundleIds mutableCopy];
  -[ATXPBHomeScreenEventMetadata setBundleIds:]((uint64_t)v3, v5);

  -[ATXPBHomeScreenEventMetadata setStackIds:]((uint64_t)v3, self->_stackIds);
  -[ATXPBHomeScreenEventMetadata setSuggestedPageType:]((uint64_t)v3, self->_suggestedPageType);
  v6 = [(NSMutableArray *)self->_widgets _pas_mappedArrayWithTransform:&__block_literal_global_21_3];
  v7 = [(NSArray *)self->_widgetsInStack _pas_mappedArrayWithTransform:&__block_literal_global_23_1];
  v8 = (void *)[v6 mutableCopy];
  -[ATXPBHomeScreenEventMetadata setWidgetIdentifiables:]((uint64_t)v3, v8);

  v9 = (void *)[v7 mutableCopy];
  -[ATXPBHomeScreenEventMetadata setWidgetInStackIdentifiables:]((uint64_t)v3, v9);

  v10 = [(ATXHomeScreenEventMetadata *)self isSuggestionInAddWidgetSheet];

  if (v10)
  {
    v11 = [(ATXHomeScreenEventMetadata *)self isSuggestionInAddWidgetSheet];
    -[ATXPBHomeScreenEventMetadata setIsSuggestionInAddWidgetSheet:]((uint64_t)v3, [v11 BOOLValue]);
  }
  isWidgetInTodayView = self->_isWidgetInTodayView;
  if (isWidgetInTodayView) {
    -[ATXPBHomeScreenEventMetadata setIsWidgetInTodayView:]((uint64_t)v3, [(NSNumber *)isWidgetInTodayView BOOLValue]);
  }
  v13 = [(ATXCGRectWrapper *)self->_visibleRect proto];
  -[ATXPBHomeScreenEventMetadata setVisibleRect:]((uint64_t)v3, v13);

  v14 = [(NSURL *)self->_engagedUrl absoluteString];
  -[ATXPBHomeScreenEventMetadata setEngagedUrl:]((uint64_t)v3, v14);

  isStalenessRotation = self->_isStalenessRotation;
  if (isStalenessRotation) {
    -[ATXPBHomeScreenEventMetadata setIsStalenessRotation:]((uint64_t)v3, [(NSNumber *)isStalenessRotation BOOLValue]);
  }

  return v3;
}

- (NSNumber)isSuggestionInAddWidgetSheet
{
  return self->_isSuggestionInAddWidgetSheet;
}

- (NSDictionary)stacks
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  id v12 = (id)objc_opt_new();
  stackIds = self->_stackIds;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__ATXHomeScreenEventMetadata_stacks__block_invoke;
  v6[3] = &unk_1E5D08ED8;
  v6[4] = self;
  void v6[5] = &v7;
  [(NSMutableArray *)stackIds enumerateObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __36__ATXHomeScreenEventMetadata_stacks__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 16) count] > a3)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 16) objectAtIndex:a3];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setValue:v5 forKey:v6];
  }
}

void __40__ATXHomeScreenEventMetadata_setStacks___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:v6];
}

- (ATXHomeScreenEventMetadata)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBHomeScreenEventMetadata alloc] initWithData:v4];

    self = [(ATXHomeScreenEventMetadata *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (ATXHomeScreenEventMetadata)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = -[ATXPBHomeScreenEventMetadata widgetIdentifiables]((uint64_t)v5);
      uint64_t v7 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_71);

      v8 = -[ATXPBHomeScreenEventMetadata widgetInStackIdentifiables]((uint64_t)v5);
      uint64_t v9 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_15_1);

      v43.receiver = self;
      v43.super_class = (Class)ATXHomeScreenEventMetadata;
      v10 = [(ATXHomeScreenEventMetadata *)&v43 init];
      if (v10)
      {
        if (-[ATXPBHomeScreenEventMetadata hasPageIndex]((uint64_t)v5))
        {
          uint64_t v11 = [NSNumber numberWithUnsignedLongLong:-[ATXPBHomeScreenEventMetadata pageIndex]((uint64_t)v5)];
          pageIndex = v10->_pageIndex;
          v10->_pageIndex = (NSNumber *)v11;
        }
        v13 = -[ATXPBHomeScreenEventMetadata bundleIds]((uint64_t)v5);
        uint64_t v14 = [v13 copy];
        bundleIds = v10->_bundleIds;
        v10->_bundleIds = (NSArray *)v14;

        v10->_suggestedPageType = (int)-[ATXPBHomeScreenEventMetadata suggestedPageType]((uint64_t)v5);
        id v16 = -[ATXPBHomeScreenEventMetadata stackIds]((uint64_t)v5);
        id v17 = v16;
        if (v16) {
          id v18 = v16;
        }
        else {
          id v18 = (NSMutableArray *)objc_opt_new();
        }
        stackIds = v10->_stackIds;
        v10->_stackIds = v18;

        v21 = (void *)[v7 mutableCopy];
        uint64_t v22 = v21;
        if (v21) {
          v23 = v21;
        }
        else {
          v23 = (NSMutableArray *)objc_opt_new();
        }
        widgets = v10->_widgets;
        v10->_widgets = v23;

        if (v9) {
          v25 = v9;
        }
        else {
          v25 = (NSArray *)objc_opt_new();
        }
        widgetsInStack = v10->_widgetsInStack;
        v10->_widgetsInStack = v25;

        if (-[ATXPBHomeScreenEventMetadata hasIsSuggestionInAddWidgetSheet]((uint64_t)v5))
        {
          uint64_t v27 = [NSNumber numberWithBool:-[ATXPBHomeScreenEventMetadata isSuggestionInAddWidgetSheet]((BOOL)v5)];
          isSuggestionInAddWidgetSheet = v10->_isSuggestionInAddWidgetSheet;
          v10->_isSuggestionInAddWidgetSheet = (NSNumber *)v27;
        }
        if (-[ATXPBHomeScreenEventMetadata hasIsWidgetInTodayView]((uint64_t)v5))
        {
          uint64_t v29 = [NSNumber numberWithBool:-[ATXPBHomeScreenEventMetadata isWidgetInTodayView]((BOOL)v5)];
          isWidgetInTodayView = v10->_isWidgetInTodayView;
          v10->_isWidgetInTodayView = (NSNumber *)v29;
        }
        v31 = [ATXCGRectWrapper alloc];
        id v32 = -[ATXPBHomeScreenEventMetadata visibleRect]((uint64_t)v5);
        uint64_t v33 = [(ATXCGRectWrapper *)v31 initWithProto:v32];
        visibleRect = v10->_visibleRect;
        v10->_visibleRect = (ATXCGRectWrapper *)v33;

        objc_super v35 = -[ATXPBHomeScreenEventMetadata engagedUrl]((uint64_t)v5);

        if (v35)
        {
          v36 = (void *)MEMORY[0x1E4F1CB10];
          v37 = -[ATXPBHomeScreenEventMetadata engagedUrl]((uint64_t)v5);
          uint64_t v38 = [v36 URLWithString:v37];
          engagedUrl = v10->_engagedUrl;
          v10->_engagedUrl = (NSURL *)v38;
        }
        if (-[ATXPBHomeScreenEventMetadata hasIsStalenessRotation]((uint64_t)v5))
        {
          uint64_t v40 = [NSNumber numberWithBool:-[ATXPBHomeScreenEventMetadata isStalenessRotation]((BOOL)v5)];
          isStalenessRotation = v10->_isStalenessRotation;
          v10->_isStalenessRotation = (NSNumber *)v40;
        }
      }
      self = v10;

      id v19 = self;
    }
    else
    {
      id v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXHomeScreenEventMetadata initWithProto:]((uint64_t)self, v5);
      }
      id v19 = 0;
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

ATXHomeScreenWidgetIdentifiable *__44__ATXHomeScreenEventMetadata_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ATXHomeScreenWidgetIdentifiable alloc] initWithProto:v2];

  return v3;
}

ATXHomeScreenWidgetIdentifiable *__44__ATXHomeScreenEventMetadata_initWithProto___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[ATXHomeScreenWidgetIdentifiable alloc] initWithProto:v2];

  return v3;
}

uint64_t __35__ATXHomeScreenEventMetadata_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __35__ATXHomeScreenEventMetadata_proto__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (id)encodeAsProto
{
  id v2 = [(ATXHomeScreenEventMetadata *)self proto];
  v3 = [v2 data];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      id v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXHomeScreenEventMetadata *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXHomeScreenEventMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  id v6 = [(ATXHomeScreenEventMetadata *)self initWithProtoData:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXHomeScreenEventMetadata *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenEventMetadata *)self isEqualToATXHomeScreenEventMetadata:v5];

  return v6;
}

- (BOOL)isEqualToATXHomeScreenEventMetadata:(id)a3
{
  id v4 = (id *)a3;
  pageIndex = self->_pageIndex;
  BOOL v6 = (NSNumber *)v4[3];
  if (pageIndex == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    v8 = pageIndex;
    char v9 = [(NSNumber *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_27;
    }
  }
  stackIds = self->_stackIds;
  id v11 = (NSMutableArray *)v4[1];
  if (stackIds == v11)
  {
  }
  else
  {
    id v12 = v11;
    id v13 = stackIds;
    char v14 = [(NSMutableArray *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_27;
    }
  }
  widgets = self->_widgets;
  id v16 = (NSMutableArray *)v4[2];
  if (widgets == v16)
  {
  }
  else
  {
    id v17 = v16;
    id v18 = widgets;
    char v19 = [(NSMutableArray *)v18 isEqual:v17];

    if ((v19 & 1) == 0) {
      goto LABEL_27;
    }
  }
  widgetsInStack = self->_widgetsInStack;
  uint64_t v21 = (NSArray *)v4[5];
  if (widgetsInStack == v21)
  {
  }
  else
  {
    uint64_t v22 = v21;
    v23 = widgetsInStack;
    char v24 = [(NSArray *)v23 isEqual:v22];

    if ((v24 & 1) == 0) {
      goto LABEL_27;
    }
  }
  isSuggestionInAddWidgetSheet = self->_isSuggestionInAddWidgetSheet;
  v26 = (NSNumber *)v4[7];
  if (isSuggestionInAddWidgetSheet == v26)
  {
  }
  else
  {
    uint64_t v27 = v26;
    v28 = isSuggestionInAddWidgetSheet;
    char v29 = [(NSNumber *)v28 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_27;
    }
  }
  isWidgetInTodayView = self->_isWidgetInTodayView;
  v31 = (NSNumber *)v4[8];
  if (isWidgetInTodayView == v31)
  {
  }
  else
  {
    id v32 = v31;
    uint64_t v33 = isWidgetInTodayView;
    char v34 = [(NSNumber *)v33 isEqual:v32];

    if ((v34 & 1) == 0) {
      goto LABEL_27;
    }
  }
  visibleRect = self->_visibleRect;
  v36 = (ATXCGRectWrapper *)v4[9];
  if (visibleRect == v36)
  {
  }
  else
  {
    v37 = v36;
    uint64_t v38 = visibleRect;
    BOOL v39 = [(ATXCGRectWrapper *)v38 isEqual:v37];

    if (!v39)
    {
LABEL_27:
      char v40 = 0;
      goto LABEL_28;
    }
  }
  v42 = self->_engagedUrl;
  objc_super v43 = v42;
  if (v42 == v4[10]) {
    char v40 = 1;
  }
  else {
    char v40 = -[NSURL isEqual:](v42, "isEqual:");
  }

LABEL_28:
  return v40;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSNumber *)self->_pageIndex hash];
  uint64_t v4 = [(NSMutableArray *)self->_stackIds hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSMutableArray *)self->_widgets hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_widgetsInStack hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSNumber *)self->_isSuggestionInAddWidgetSheet hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSNumber *)self->_isWidgetInTodayView hash] - v7 + 32 * v7;
  unint64_t v9 = [(ATXCGRectWrapper *)self->_visibleRect hash] - v8 + 32 * v8;
  return [(NSURL *)self->_engagedUrl hash] - v9 + 32 * v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(ATXHomeScreenEventMetadata *)self stacks];
  uint64_t v5 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        id v12 = [v6 objectForKeyedSubscript:v11];
        id v13 = [v12 dictionaryRepresentation];
        [v5 setObject:v13 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  char v14 = [(ATXHomeScreenEventMetadata *)self widgetsInStack];
  v15 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_32_0);

  if (self->_pageIndex) {
    pageIndex = self->_pageIndex;
  }
  else {
    pageIndex = (NSNumber *)@"nil";
  }
  [v3 setObject:pageIndex forKeyedSubscript:@"pageIndex"];
  [v3 setObject:v5 forKeyedSubscript:@"stacks"];
  [v3 setObject:v15 forKeyedSubscript:@"widgetsInStack"];
  if (self->_isSuggestionInAddWidgetSheet) {
    isSuggestionInAddWidgetSheet = self->_isSuggestionInAddWidgetSheet;
  }
  else {
    isSuggestionInAddWidgetSheet = (NSNumber *)@"nil";
  }
  [v3 setObject:isSuggestionInAddWidgetSheet forKeyedSubscript:@"isSuggestionInAddWidgetSheet"];
  int64_t suggestedPageType = self->_suggestedPageType;
  if (suggestedPageType >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suggestedPageType);
    char v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v19 = off_1E5D08F60[(int)suggestedPageType];
  }
  [v3 setObject:v19 forKeyedSubscript:@"suggestedPageType"];

  if (self->_isWidgetInTodayView) {
    isWidgetInTodayView = self->_isWidgetInTodayView;
  }
  else {
    isWidgetInTodayView = (NSNumber *)@"nil";
  }
  [v3 setObject:isWidgetInTodayView forKeyedSubscript:@"isWidgetInTodayView"];
  uint64_t v21 = [(ATXCGRectWrapper *)self->_visibleRect description];
  uint64_t v22 = (void *)v21;
  if (v21) {
    v23 = (__CFString *)v21;
  }
  else {
    v23 = @"nil";
  }
  [v3 setObject:v23 forKeyedSubscript:@"visibleRect"];

  uint64_t v24 = [(NSURL *)self->_engagedUrl absoluteString];
  v25 = (void *)v24;
  if (v24) {
    v26 = (__CFString *)v24;
  }
  else {
    v26 = @"nil";
  }
  [v3 setObject:v26 forKeyedSubscript:@"engagedUrl"];

  uint64_t v27 = [(NSArray *)self->_bundleIds componentsJoinedByString:@", "];
  v28 = (void *)v27;
  if (v27) {
    char v29 = (__CFString *)v27;
  }
  else {
    char v29 = @"nil";
  }
  [v3 setObject:v29 forKeyedSubscript:@"bundleIds"];

  return v3;
}

uint64_t __54__ATXHomeScreenEventMetadata_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (NSNumber)pageIndex
{
  return self->_pageIndex;
}

- (int64_t)suggestedPageType
{
  return self->_suggestedPageType;
}

- (void)setSuggestedPageType:(int64_t)a3
{
  self->_int64_t suggestedPageType = a3;
}

- (NSArray)widgetsInStack
{
  return self->_widgetsInStack;
}

- (void)setWidgetsInStack:(id)a3
{
}

- (NSArray)bundleIds
{
  return self->_bundleIds;
}

- (void)setBundleIds:(id)a3
{
}

- (void)setIsSuggestionInAddWidgetSheet:(id)a3
{
}

- (NSNumber)isWidgetInTodayView
{
  return self->_isWidgetInTodayView;
}

- (void)setIsWidgetInTodayView:(id)a3
{
}

- (ATXCGRectWrapper)visibleRect
{
  return self->_visibleRect;
}

- (void)setVisibleRect:(id)a3
{
}

- (NSURL)engagedUrl
{
  return self->_engagedUrl;
}

- (void)setEngagedUrl:(id)a3
{
}

- (NSNumber)isStalenessRotation
{
  return self->_isStalenessRotation;
}

- (void)setIsStalenessRotation:(id)a3
{
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBHomeScreenEventMetadata proto", (uint8_t *)&v5, 0xCu);
}

@end
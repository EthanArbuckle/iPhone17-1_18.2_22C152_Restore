@interface HFAnalyticsTileInteractionEvent
+ (unint64_t)_numberOfRepresentedHomeKitObjectsForItem:(id)a3;
- (BOOL)isActionSetItem;
- (BOOL)isCameraItem;
- (BOOL)isRoomDashboard;
- (BOOL)isServiceLikeItem;
- (BOOL)isStatusItem;
- (HFAnalyticsTileInteractionEvent)initWithData:(id)a3;
- (NSNumber)tileIsEditing;
- (NSString)contextType;
- (NSString)itemClassName;
- (NSString)processName;
- (NSString)sourceViewControllerClassName;
- (NSString)tileInteractionArea;
- (id)payload;
- (int64_t)itemPrimaryState;
- (int64_t)itemPriority;
- (unint64_t)interactionType;
- (unint64_t)numberOfRepresentedHomeKitObjects;
- (void)setContextType:(id)a3;
- (void)setInteractionType:(unint64_t)a3;
- (void)setIsActionSetItem:(BOOL)a3;
- (void)setIsCameraItem:(BOOL)a3;
- (void)setIsRoomDashboard:(BOOL)a3;
- (void)setIsServiceLikeItem:(BOOL)a3;
- (void)setIsStatusItem:(BOOL)a3;
- (void)setItemClassName:(id)a3;
- (void)setItemPrimaryState:(int64_t)a3;
- (void)setItemPriority:(int64_t)a3;
- (void)setNumberOfRepresentedHomeKitObjects:(unint64_t)a3;
- (void)setProcessName:(id)a3;
- (void)setSourceViewControllerClassName:(id)a3;
- (void)setTileInteractionArea:(id)a3;
- (void)setTileIsEditing:(id)a3;
@end

@implementation HFAnalyticsTileInteractionEvent

- (HFAnalyticsTileInteractionEvent)initWithData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"interactionType"];
  uint64_t v6 = [v5 integerValue];

  if (!v6) {
    NSLog(&cfstr_Hfanalyticstil_0.isa);
  }
  objc_opt_class();
  v7 = [v4 objectForKeyedSubscript:@"item"];
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (!v9) {
    NSLog(&cfstr_Hfanalyticstil.isa);
  }
  objc_opt_class();
  v10 = [v4 objectForKeyedSubscript:@"tileInteractionArea"];
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  objc_opt_class();
  v13 = [v4 objectForKeyedSubscript:@"sourceViewController"];
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  v37.receiver = self;
  v37.super_class = (Class)HFAnalyticsTileInteractionEvent;
  v16 = [(HFAnalyticsEvent *)&v37 initWithEventType:13];
  v17 = v16;
  if (v16)
  {
    v16->_interactionType = v6;
    v18 = [v4 objectForKeyedSubscript:@"room"];
    v17->_isRoomDashboard = v18 != 0;

    objc_opt_class();
    v17->_isActionSetItem = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v17->_isCameraItem = objc_opt_isKindOfClass() & 1;
    v17->_isServiceLikeItem = [v9 conformsToProtocol:&unk_26C0FC090];
    objc_opt_class();
    v17->_isStatusItem = objc_opt_isKindOfClass() & 1;
    objc_opt_class();
    v19 = [v4 objectForKeyedSubscript:@"overrideItemClassName"];
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    id v21 = v20;

    if ([v21 length])
    {
      v22 = (NSString *)v21;
    }
    else
    {
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    itemClassName = v17->_itemClassName;
    v17->_itemClassName = v22;

    v25 = [v9 latestResults];
    v26 = [v25 objectForKeyedSubscript:@"state"];
    v17->_itemPrimaryState = [v26 integerValue];

    v27 = [v9 latestResults];
    v28 = [v27 objectForKeyedSubscript:@"priority"];
    v17->_itemPriority = [v28 integerValue];

    v17->_numberOfRepresentedHomeKitObjects = [(id)objc_opt_class() _numberOfRepresentedHomeKitObjectsForItem:v9];
    v29 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v30 = [v29 processName];
    processName = v17->_processName;
    v17->_processName = (NSString *)v30;

    if (v15)
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = @"nil";
    }
    objc_storeStrong((id *)&v17->_sourceViewControllerClassName, v33);
    if (v15) {

    }
    objc_storeStrong((id *)&v17->_tileInteractionArea, v11);
    objc_opt_class();
    v34 = [v4 objectForKeyedSubscript:@"dashboardContextType"];
    if (objc_opt_isKindOfClass()) {
      v35 = v34;
    }
    else {
      v35 = 0;
    }
    objc_storeStrong((id *)&v17->_contextType, v35);
  }
  return v17;
}

- (id)payload
{
  v21.receiver = self;
  v21.super_class = (Class)HFAnalyticsTileInteractionEvent;
  v3 = [(HFAnalyticsEvent *)&v21 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFAnalyticsTileInteractionEvent interactionType](self, "interactionType"));
  [v4 setObject:v5 forKeyedSubscript:@"interactionType"];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsTileInteractionEvent isRoomDashboard](self, "isRoomDashboard"));
  [v4 setObject:v6 forKeyedSubscript:@"isRoomDashboard"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsTileInteractionEvent isActionSetItem](self, "isActionSetItem"));
  [v4 setObject:v7 forKeyedSubscript:@"isActionSetItem"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsTileInteractionEvent isCameraItem](self, "isCameraItem"));
  [v4 setObject:v8 forKeyedSubscript:@"isCameraItem"];

  id v9 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsTileInteractionEvent isServiceLikeItem](self, "isServiceLikeItem"));
  [v4 setObject:v9 forKeyedSubscript:@"isServiceLikeItem"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HFAnalyticsTileInteractionEvent isStatusItem](self, "isStatusItem"));
  [v4 setObject:v10 forKeyedSubscript:@"isStatusItem"];

  v11 = [(HFAnalyticsTileInteractionEvent *)self itemClassName];
  [v4 setObject:v11 forKeyedSubscript:@"item"];

  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFAnalyticsTileInteractionEvent numberOfRepresentedHomeKitObjects](self, "numberOfRepresentedHomeKitObjects"));
  [v4 setObject:v12 forKeyedSubscript:@"numberOfRepresentedHomeKitObjects"];

  v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFAnalyticsTileInteractionEvent itemPrimaryState](self, "itemPrimaryState"));
  [v4 setObject:v13 forKeyedSubscript:@"primaryState"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[HFAnalyticsTileInteractionEvent itemPriority](self, "itemPriority"));
  [v4 setObject:v14 forKeyedSubscript:@"priority"];

  id v15 = [(HFAnalyticsTileInteractionEvent *)self processName];
  [v4 setObject:v15 forKeyedSubscript:@"processName"];

  v16 = [(HFAnalyticsTileInteractionEvent *)self sourceViewControllerClassName];
  [v4 setObject:v16 forKeyedSubscript:@"sourceViewController"];

  v17 = [(HFAnalyticsTileInteractionEvent *)self tileIsEditing];
  [v4 setObject:v17 forKeyedSubscript:@"tileIsEditing"];

  v18 = [(HFAnalyticsTileInteractionEvent *)self tileInteractionArea];
  [v4 setObject:v18 forKeyedSubscript:@"tileInteractionArea"];

  v19 = [(HFAnalyticsTileInteractionEvent *)self contextType];
  [v4 setObject:v19 forKeyedSubscript:@"dashboardContext"];

  [v4 setObject:&unk_26C0F7308 forKeyedSubscript:@"homeAppEventCount"];
  return v4;
}

+ (unint64_t)_numberOfRepresentedHomeKitObjectsForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 latestResults];

    v5 = [v4 objectForKeyedSubscript:@"representedHomeKitObjects"];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x263EFFA08] set];
    }
    v10 = v7;

    unint64_t v11 = [v10 count];
    return v11;
  }
  else
  {
    unsigned int v8 = [v3 conformsToProtocol:&unk_26C0FBAD0];

    return v8;
  }
}

- (unint64_t)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(unint64_t)a3
{
  self->_interactionType = a3;
}

- (BOOL)isRoomDashboard
{
  return self->_isRoomDashboard;
}

- (void)setIsRoomDashboard:(BOOL)a3
{
  self->_isRoomDashboard = a3;
}

- (BOOL)isActionSetItem
{
  return self->_isActionSetItem;
}

- (void)setIsActionSetItem:(BOOL)a3
{
  self->_isActionSetItem = a3;
}

- (BOOL)isCameraItem
{
  return self->_isCameraItem;
}

- (void)setIsCameraItem:(BOOL)a3
{
  self->_isCameraItem = a3;
}

- (BOOL)isServiceLikeItem
{
  return self->_isServiceLikeItem;
}

- (void)setIsServiceLikeItem:(BOOL)a3
{
  self->_isServiceLikeItem = a3;
}

- (BOOL)isStatusItem
{
  return self->_isStatusItem;
}

- (void)setIsStatusItem:(BOOL)a3
{
  self->_isStatusItem = a3;
}

- (NSNumber)tileIsEditing
{
  return self->_tileIsEditing;
}

- (void)setTileIsEditing:(id)a3
{
  self->_tileIsEditing = (NSNumber *)a3;
}

- (NSString)tileInteractionArea
{
  return self->_tileInteractionArea;
}

- (void)setTileInteractionArea:(id)a3
{
}

- (NSString)itemClassName
{
  return self->_itemClassName;
}

- (void)setItemClassName:(id)a3
{
}

- (int64_t)itemPrimaryState
{
  return self->_itemPrimaryState;
}

- (void)setItemPrimaryState:(int64_t)a3
{
  self->_itemPrimaryState = a3;
}

- (int64_t)itemPriority
{
  return self->_itemPriority;
}

- (void)setItemPriority:(int64_t)a3
{
  self->_itemPriority = a3;
}

- (unint64_t)numberOfRepresentedHomeKitObjects
{
  return self->_numberOfRepresentedHomeKitObjects;
}

- (void)setNumberOfRepresentedHomeKitObjects:(unint64_t)a3
{
  self->_numberOfRepresentedHomeKitObjects = a3;
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (NSString)sourceViewControllerClassName
{
  return self->_sourceViewControllerClassName;
}

- (void)setSourceViewControllerClassName:(id)a3
{
}

- (NSString)contextType
{
  return self->_contextType;
}

- (void)setContextType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextType, 0);
  objc_storeStrong((id *)&self->_sourceViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_itemClassName, 0);
  objc_storeStrong((id *)&self->_tileInteractionArea, 0);
}

@end
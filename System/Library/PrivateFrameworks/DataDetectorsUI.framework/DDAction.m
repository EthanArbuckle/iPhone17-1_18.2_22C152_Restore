@interface DDAction
+ (BOOL)actionAvailableForContact:(id)a3;
+ (BOOL)isAvailable;
+ (BOOL)supportsSecureCoding;
+ (id)actionWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
+ (id)clientActionsDelegate;
+ (id)contextByAddingValue:(id)a3 toKey:(id)a4 inContext:(id)a5;
+ (id)defaultActionWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
+ (id)encodableContextWithContext:(id)a3;
+ (id)matchingSchemes;
+ (id)patchedSchemeForScheme:(id)a3;
+ (void)setClientActionsDelegate:(id)a3;
- (BOOL)ambiguousIcon;
- (BOOL)canBePerformedByOpeningURL;
- (BOOL)canBePerformedWhenDeviceIsLocked;
- (BOOL)companion;
- (BOOL)hasUserInterface;
- (BOOL)isDefaultAction;
- (BOOL)isPlaceholderAction;
- (BOOL)menuItemNameCanFallbackToServiceName;
- (BOOL)treatAsMenu;
- (CNContact)contact;
- (DDAction)companionAction;
- (DDAction)initWithCoder:(id)a3;
- (DDAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (DDActionDelegate)delegate;
- (NSArray)associatedVisualResults;
- (UIImage)compactIcon;
- (UIImage)icon;
- (UIView)fallBackView;
- (UIViewController)viewController;
- (__CFArray)associatedResults;
- (__DDResult)coalescedResult;
- (__DDResult)result;
- (id)_iconFromName:(uint64_t)a1;
- (id)context;
- (id)description;
- (id)extractedActionSubtitle;
- (id)feedbackIdentifier;
- (id)generateIdentifier;
- (id)handleString;
- (id)iconName;
- (id)localizedName;
- (id)localizedSubItemName;
- (id)localizedSubItemName:(BOOL)a3;
- (id)notificationIconBundleIdentifier;
- (id)notificationURL;
- (id)oneLinerLocalizedSubItemName;
- (id)serviceIdentifier;
- (id)serviceName;
- (id)subtitle;
- (id)url;
- (id)variantIconName;
- (int)hostApplication;
- (int)interactionType;
- (uint64_t)calloutFlavor;
- (unint64_t)menuItemattributes;
- (void)_openURL:(id)a3 fromView:(id)a4 options:(id)a5;
- (void)_openURL:(id)a3 options:(id)a4 fallbackURL:(id)a5;
- (void)_performFromView:(id)a3 byOpeningURL:(id)a4;
- (void)_performFromView:(id)a3 byOpeningURL:(id)a4 disableAppLink:(BOOL)a5;
- (void)addToRecents;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)localizedName;
- (void)perform;
- (void)performFromView:(id)a3;
- (void)prepareViewControllerForActionController:(id)a3;
- (void)setAssociatedVisualResults:(id)a3;
- (void)setCompanion:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFallBackView:(id)a3;
- (void)setHostApplication:(int)a3;
- (void)setTreatAsMenu:(BOOL)a3;
- (void)setViewController:(id)a3;
- (void)setupPopoverPresentationController:(id)a3 view:(id)a4;
- (void)updateSourceRect:(CGRect)a3;
@end

@implementation DDAction

- (void)dealloc
{
  result = self->_result;
  if (result) {
    CFRelease(result);
  }
  coalescedResult = self->_coalescedResult;
  if (coalescedResult) {
    CFRelease(coalescedResult);
  }
  associatedResults = self->_associatedResults;
  if (associatedResults) {
    CFRelease(associatedResults);
  }
  v6.receiver = self;
  v6.super_class = (Class)DDAction;
  [(DDAction *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fallBackView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_associatedVisualResults, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_ics, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (BOOL)isAvailable
{
  return 1;
}

- (DDAction)initWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DDAction;
  v11 = [(DDAction *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_url, a3);
    objc_storeStrong((id *)&v12->_context, a5);
    if (a4)
    {
      v13 = (__DDResult *)DDCreateUpdatedResultWithContext(a4, v10);
      if (!v13) {
        v13 = (__DDResult *)CFRetain(a4);
      }
    }
    else
    {
      v13 = 0;
    }
    v12->_result = v13;
    uint64_t v14 = [v10 objectForKeyedSubscript:@"Contact"];
    contact = v12->_contact;
    v12->_contact = (CNContact *)v14;

    uint64_t v16 = [v10 objectForKeyedSubscript:@"ICS"];
    ics = v12->_ics;
    v12->_ics = (NSString *)v16;

    DDTrackEventCreationInHostApplication(&v12->_hostApplication);
  }

  return v12;
}

+ (void)setClientActionsDelegate:(id)a3
{
  id obj = a1;
  id v4 = a3;
  objc_sync_enter(obj);
  objc_storeWeak(&_clientActionsDelegate, v4);

  objc_sync_exit(obj);
}

+ (id)clientActionsDelegate
{
  id v2 = a1;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&_clientActionsDelegate);
  objc_sync_exit(v2);

  return WeakRetained;
}

+ (id)matchingSchemes
{
  return 0;
}

+ (id)patchedSchemeForScheme:(id)a3
{
  id v4 = a3;
  if (v4
    && ([a1 matchingSchemes],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsObject:v4],
        v5,
        v6))
  {
    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)contextByAddingValue:(id)a3 toKey:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = (id)[v9 mutableCopy];
    }
    v11 = v10;
    [v10 setObject:v7 forKeyedSubscript:v8];
  }
  else if (v7)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v7, v8, 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)encodableContextWithContext:(id)a3
{
  v18[14] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v18[0] = @"EventTitle";
  v18[1] = @"SelectedText";
  v18[2] = @"ReferenceDate";
  v18[3] = @"SpecialURL";
  v18[4] = @"IsAccountManaged";
  v18[5] = @"CoreRecents";
  v18[6] = @"EventComponents";
  v18[7] = @"ICS";
  v18[8] = @"Contact";
  v18[9] = @"LeadingText";
  v18[10] = @"MiddleText";
  v18[11] = @"TrailingText";
  v18[12] = @"GroupTranscript";
  v18[13] = @"CoreSpotlightUniqueIdentifier";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, (void)v13);
        if (v11) {
          [v4 setObject:v11 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = +[DDAction encodableContextWithContext:self->_context];
  [v12 encodeObject:v4 forKey:@"context"];

  if (self->_result)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F5F150], "resultFromCoreResult:");
    [v12 encodeObject:v5 forKey:@"result"];
  }
  if ([(DDAction *)self coalescedResult])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F5F150], "resultFromCoreResult:", -[DDAction coalescedResult](self, "coalescedResult"));
    [v12 encodeObject:v6 forKey:@"coalescedResult"];
  }
  else if ([(DDAction *)self associatedResults])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F5F150], "resultsFromCoreResults:", -[DDAction associatedResults](self, "associatedResults"));
    [v12 encodeObject:v7 forKey:@"associatedResults"];

    associatedVisualResults = self->_associatedVisualResults;
    if (associatedVisualResults) {
      [v12 encodeObject:associatedVisualResults forKey:@"associatedVisualResults"];
    }
  }
  contact = self->_contact;
  if (contact) {
    [v12 encodeObject:contact forKey:@"contact"];
  }
  ics = self->_ics;
  v11 = v12;
  if (ics)
  {
    [v12 encodeObject:ics forKey:@"event"];
    v11 = v12;
  }
  [v11 encodeObject:self->_url forKey:@"url"];
  [v12 encodeBool:self->_isDefaultAction forKey:@"isDefault"];
  [v12 encodeInteger:self->_hostApplication forKey:@"hostApplication"];
}

- (DDAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)DDAction;
  id v5 = [(DDAction *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v40 = (void *)MEMORY[0x1E4F1CAD0];
    id v41 = v8;
    uint64_t v39 = objc_opt_class();
    uint64_t v38 = objc_opt_class();
    uint64_t v37 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    long long v16 = objc_msgSend(v40, "setWithObjects:", v39, v38, v37, v36, v9, v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
    v17 = [v4 decodeObjectOfClasses:v16 forKey:@"context"];
    uint64_t v18 = [v41 initWithDictionary:v17];
    context = v5->_context;
    v5->_context = (NSDictionary *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"event"];
    ics = v5->_ics;
    v5->_ics = (NSString *)v22;

    if ([v4 containsValueForKey:@"result"])
    {
      v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"result"];
      v5->_result = (__DDResult *)CFRetain((CFTypeRef)[v24 coreResult]);
    }
    if ([v4 containsValueForKey:@"coalescedResult"])
    {
      v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coalescedResult"];
      v5->_coalescedResult = (__DDResult *)CFRetain((CFTypeRef)[v25 coreResult]);

      v5->_cachedCoalescedResult = 1;
    }
    if ([v4 containsValueForKey:@"associatedResults"])
    {
      v26 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v27 = objc_opt_class();
      v28 = objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
      v29 = [v4 decodeObjectOfClasses:v28 forKey:@"associatedResults"];

      v5->_associatedResults = (__CFArray *)copyCoreResultsArray(v29);
      if ([v4 containsValueForKey:@"associatedVisualResults"])
      {
        v30 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v31 = objc_opt_class();
        v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
        uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"associatedVisualResults"];
        associatedVisualResults = v5->_associatedVisualResults;
        v5->_associatedVisualResults = (NSArray *)v33;
      }
      v5->_cachedAssociatedResults = 1;
    }
    v5->_isDefaultAction = [v4 decodeBoolForKey:@"isDefault"];
    v5->_hostApplication = [v4 decodeIntegerForKey:@"hostApplication"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)actionWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithURL:v9 result:a4 context:v8];

  return v10;
}

+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithURL:v9 result:a4 context:v8];

  uint64_t v11 = [v10 companionAction];
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    objc_super v19 = v10;
    uint64_t v20 = v11;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = &v19;
    uint64_t v15 = 2;
  }
  else
  {
    uint64_t v18 = v10;
    uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v14 = &v18;
    uint64_t v15 = 1;
  }
  long long v16 = objc_msgSend(v13, "arrayWithObjects:count:", v14, v15, v18, v19, v20, v21);

  return v16;
}

- (id)extractedActionSubtitle
{
  return 0;
}

+ (id)defaultActionWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([a1 isAvailable])
  {
    uint64_t v10 = [a1 actionWithURL:v8 result:a4 context:v9];
    uint64_t v11 = [v10 defaultAction];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)updateSourceRect:(CGRect)a3
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = +[DDAction contextByAddingValue:v6 toKey:@"SourceRect" inContext:self->_context];
  context = self->_context;
  self->_context = v4;
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v4 = a3;
  id v5 = [(DDAction *)self viewController];
  [v4 action:self viewControllerReady:v5];
  [v4 action:self presentationShouldBeModal:1];
}

- (int)interactionType
{
  return 0;
}

- (BOOL)hasUserInterface
{
  return [(DDAction *)self interactionType] != 0;
}

- (BOOL)canBePerformedByOpeningURL
{
  return 0;
}

- (BOOL)canBePerformedWhenDeviceIsLocked
{
  return 0;
}

- (void)perform
{
}

- (void)performFromView:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[DDAction performFromView:]();
  }
}

- (void)_openURL:(id)a3 options:(id)a4 fallbackURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(33, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__DDAction__openURL_options_fallbackURL___block_invoke;
  v15[3] = &unk_1E5A855A0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  objc_super v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__DDAction__openURL_options_fallbackURL___block_invoke_2;
  v7[3] = &unk_1E5A85B60;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v11 = v6;
  [v2 openURL:v3 options:v4 completionHandler:v7];
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = dispatch_get_global_queue(33, 0);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__DDAction__openURL_options_fallbackURL___block_invoke_3;
    v6[3] = &unk_1E5A855A0;
    id v7 = *(id *)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v4 = *(id *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 56);
    id v9 = v4;
    uint64_t v10 = v5;
    dispatch_async(v3, v6);
  }
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_3(uint64_t a1)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    id v2 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __41__DDAction__openURL_options_fallbackURL___block_invoke_4;
    v13[3] = &unk_1E5A85B38;
    id v14 = *(id *)(a1 + 48);
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 56);
    id v15 = v5;
    uint64_t v16 = v6;
    [v2 openURL:v3 options:v4 completionHandler:v13];

    id v7 = v14;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = *MEMORY[0x1E4F62688];
    v17[0] = *MEMORY[0x1E4F626A0];
    v17[1] = v10;
    v18[0] = MEMORY[0x1E4F1CC38];
    v18[1] = MEMORY[0x1E4F1CC38];
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    id v12 = 0;
    [v8 openSensitiveURL:v9 withOptions:v11 error:&v12];
    id v7 = v12;

    if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __41__DDAction__openURL_options_fallbackURL___block_invoke_3_cold_1((id *)(a1 + 48), a1, (uint64_t)v7);
    }
  }
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __41__DDAction__openURL_options_fallbackURL___block_invoke_4_cold_1(a1);
  }
}

- (void)_openURL:(id)a3 fromView:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F42738] sharedApplication];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__DDAction__openURL_fromView_options___block_invoke;
  v15[3] = &unk_1E5A85B60;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  objc_super v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 _openURL:v14 originatingView:v13 options:v12 completionHandler:v15];
}

void __38__DDAction__openURL_fromView_options___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (dd_isInternalInstall())
    {
      uint64_t v3 = [*(id *)(a1 + 32) radarWebURL];
      if (v3)
      {
        uint64_t v4 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v5 = *(void *)(a1 + 40);
        uint64_t v6 = *(void *)(a1 + 48);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __38__DDAction__openURL_fromView_options___block_invoke_2;
        v10[3] = &unk_1E5A85B60;
        v10[4] = *(void *)(a1 + 56);
        id v11 = *(id *)(a1 + 32);
        id v12 = *(id *)(a1 + 48);
        id v13 = v3;
        [v4 _openURL:v13 originatingView:v5 options:v6 completionHandler:v10];
      }
      else
      {
        [*(id *)(a1 + 56) _openURL:*(void *)(a1 + 32) options:*(void *)(a1 + 48) fallbackURL:0];
      }
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 48);
      id v8 = *(void **)(a1 + 56);
      [v8 _openURL:v7 options:v9 fallbackURL:0];
    }
  }
}

uint64_t __38__DDAction__openURL_fromView_options___block_invoke_2(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _openURL:*(void *)(result + 40) options:*(void *)(result + 48) fallbackURL:*(void *)(result + 56)];
  }
  return result;
}

- (void)_performFromView:(id)a3 byOpeningURL:(id)a4
{
}

- (void)_performFromView:(id)a3 byOpeningURL:(id)a4 disableAppLink:(BOOL)a5
{
  BOOL v5 = a5;
  v18[4] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9 && [(DDAction *)self canBePerformedByOpeningURL])
  {
    uint64_t v10 = *MEMORY[0x1E4F62688];
    v17[0] = *MEMORY[0x1E4F626A0];
    v17[1] = v10;
    v18[0] = MEMORY[0x1E4F1CC38];
    v18[1] = MEMORY[0x1E4F1CC38];
    v18[2] = &unk_1EF50FF48;
    uint64_t v11 = *MEMORY[0x1E4F43F60];
    void v17[2] = *MEMORY[0x1E4F62650];
    v17[3] = v11;
    id v12 = [MEMORY[0x1E4F28ED0] numberWithBool:v5];
    void v18[3] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

    id v14 = [(DDAction *)self serviceIdentifier];
    if (v14)
    {
      id v15 = [MEMORY[0x1E4F223E0] defaultWorkspace];
      id v16 = [v15 operationToOpenResource:v9 usingApplication:v14 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:v13 delegate:0];

      [v16 start];
    }
    else
    {
      [(DDAction *)self _openURL:v9 fromView:v8 options:v13];
    }
  }
}

- (id)serviceIdentifier
{
  return 0;
}

- (DDAction)companionAction
{
  return 0;
}

- (id)localizedName
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[DDAction localizedName]();
  }
  return &stru_1EF5023D8;
}

- (id)subtitle
{
  return 0;
}

- (unint64_t)menuItemattributes
{
  return 0;
}

- (id)handleString
{
  return 0;
}

- (id)oneLinerLocalizedSubItemName
{
  return [(DDAction *)self localizedSubItemName:1];
}

- (id)localizedSubItemName
{
  return [(DDAction *)self localizedSubItemName:0];
}

- (id)localizedSubItemName:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(DDAction *)self context];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"ContactLabel"];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = [(DDAction *)self context];
    id v9 = [v8 objectForKeyedSubscript:@"ContactValue"];

    if (v9)
    {
      uint64_t v10 = NSString;
      if (v3)
      {
        uint64_t v11 = DDLocalizedString(@"%@: %@");
        id v12 = [(DDAction *)self context];
        id v13 = [v12 objectForKeyedSubscript:@"ContactLabel"];
        id v14 = [(DDAction *)self context];
        id v15 = [v14 objectForKeyedSubscript:@"ContactValue"];
        id v16 = objc_msgSend(v10, "stringWithFormat:", v11, v13, v15);
      }
      else
      {
        uint64_t v11 = [(DDAction *)self context];
        id v12 = [v11 objectForKeyedSubscript:@"ContactLabel"];
        id v13 = [(DDAction *)self context];
        id v14 = [v13 objectForKeyedSubscript:@"ContactValue"];
        id v16 = [v10 stringWithFormat:@"%@\n%@", v12, v14];
      }

      goto LABEL_11;
    }
  }
  else
  {
  }
  id v17 = [(DDAction *)self context];
  id v18 = [v17 objectForKeyedSubscript:@"ContactValue"];

  if (v18)
  {
    objc_super v19 = [(DDAction *)self context];
    id v16 = [v19 objectForKeyedSubscript:@"ContactValue"];
  }
  else
  {
    id v16 = [(DDAction *)self localizedName];
  }
LABEL_11:
  return v16;
}

- (BOOL)isPlaceholderAction
{
  return 0;
}

- (id)notificationIconBundleIdentifier
{
  return 0;
}

- (id)notificationURL
{
  return 0;
}

- (id)url
{
  return self->_url;
}

- (__DDResult)result
{
  return self->_result;
}

- (__DDResult)coalescedResult
{
  if (self->_cachedCoalescedResult) {
    return self->_coalescedResult;
  }
  uint64_t v4 = [(NSDictionary *)self->_context objectForKey:@"GroupAllResultsKey"];
  BOOL v5 = copyCoreResultsArray(v4);
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(NSDictionary *)self->_context objectForKey:@"AllResults"];
  }
  id v8 = v7;

  BOOL v3 = 0;
  if (self->_result && v8)
  {
    SignatureContainingResult = (const void *)DDResultGetSignatureContainingResult();
    if (SignatureContainingResult) {
      BOOL v3 = (__DDResult *)CFRetain(SignatureContainingResult);
    }
    else {
      BOOL v3 = 0;
    }
    self->_coalescedResult = v3;
    self->_cachedCoalescedResult = 1;
  }

  return v3;
}

- (__CFArray)associatedResults
{
  if (self->_cachedAssociatedResults) {
    return self->_associatedResults;
  }
  uint64_t v4 = self->_result;
  context = self->_context;
  id v10 = 0;
  uint64_t v6 = (__CFArray *)copyAssociatedResultsFromResultWithContext(v4, context, &v10);
  id v7 = v10;
  id v8 = v10;
  self->_associatedResults = v6;
  if (v6)
  {
    objc_storeStrong((id *)&self->_associatedVisualResults, v7);
    self->_cachedAssociatedResults = 1;
    associatedResults = self->_associatedResults;
  }
  else
  {
    associatedResults = 0;
  }

  return associatedResults;
}

- (NSArray)associatedVisualResults
{
  [(DDAction *)self associatedResults];
  associatedVisualResults = self->_associatedVisualResults;
  return associatedVisualResults;
}

- (id)generateIdentifier
{
  id v2 = NSString;
  BOOL v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  BOOL v5 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [v2 stringWithFormat:@"com.apple.datadetectors.%@.%@", v4, v6];

  return v7;
}

- (id)feedbackIdentifier
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)ambiguousIcon
{
  id v2 = [(DDAction *)self iconName];
  if (v2) {
    char v3 = [&unk_1EF510C50 containsObject:v2];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (id)iconName
{
  return 0;
}

- (id)variantIconName
{
  id v2 = [(DDAction *)self iconName];
  char v3 = [v2 stringByAppendingString:@".fill"];

  return v3;
}

- (id)_iconFromName:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  BOOL v5 = 0;
  if (a1)
  {
    if (v3)
    {
      BOOL v5 = [MEMORY[0x1E4F42A80] _systemImageNamed:v3];
      if (!v5)
      {
        uint64_t v6 = (void *)MEMORY[0x1E4F42A80];
        id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.DataDetectorsUI"];
        BOOL v5 = [v6 imageNamed:v4 inBundle:v7];
      }
    }
  }

  return v5;
}

- (UIImage)icon
{
  id v3 = [(DDAction *)self iconName];
  uint64_t v4 = -[DDAction _iconFromName:]((uint64_t)self, v3);

  return (UIImage *)v4;
}

- (UIImage)compactIcon
{
  id v3 = [(DDAction *)self variantIconName];
  uint64_t v4 = -[DDAction _iconFromName:]((uint64_t)self, v3);
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(DDAction *)self icon];
  }
  id v7 = v6;

  return (UIImage *)v7;
}

- (BOOL)menuItemNameCanFallbackToServiceName
{
  return 0;
}

- (id)serviceName
{
  return 0;
}

- (id)context
{
  return self->_context;
}

- (void)addToRecents
{
  if (self->_result)
  {
    objc_msgSend(MEMORY[0x1E4F5F150], "resultFromCoreResult:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    +[DDCoreRecents addResultToRecents:v3 associatedResults:[(DDAction *)self associatedResults] weight:0 context:self->_context userInitiated:1];
  }
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p result:%@ URL:%@>", v5, self, self->_result, self->_url];

  return v6;
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  return 0;
}

- (void)setupPopoverPresentationController:(id)a3 view:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(NSDictionary *)self->_context objectForKeyedSubscript:@"SourceRect"];
  id v8 = [v6 window];

  if (v8)
  {
    id v9 = v6;
    id v10 = v9;
    if (!v9) {
      goto LABEL_10;
    }
    uint64_t v11 = v9;
    while (![v11 isHidden])
    {
      uint64_t v12 = [v11 superview];

      uint64_t v11 = (void *)v12;
      if (!v12) {
        goto LABEL_10;
      }
    }
    uint64_t v13 = [(DDAction *)self fallBackView];

    id v6 = v7;
    id v7 = v11;
    id v10 = (void *)v13;
  }
  else
  {
    id v10 = [(DDAction *)self fallBackView];
  }

  id v7 = 0;
LABEL_10:
  id v14 = [v10 window];

  if (!v14)
  {

    id v10 = 0;
  }
  [v15 setSourceView:v10];
  [v15 _setCentersPopoverIfSourceViewNotSet:1];
  if (v7) {
    [v7 CGRectValue];
  }
  else {
    [v10 bounds];
  }
  objc_msgSend(v15, "setSourceRect:");
}

- (uint64_t)calloutFlavor
{
  if (result)
  {
    v1 = [*(id *)(result + 56) objectForKeyedSubscript:@"kDDContextNoRoomForSubtitlesKey"];
    uint64_t v2 = [v1 BOOLValue];

    return v2;
  }
  return result;
}

- (BOOL)isDefaultAction
{
  return self->_isDefaultAction;
}

- (BOOL)companion
{
  return self->_isCompanion;
}

- (void)setCompanion:(BOOL)a3
{
  self->_isCompanion = a3;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void)setViewController:(id)a3
{
}

- (int)hostApplication
{
  return self->_hostApplication;
}

- (void)setHostApplication:(int)a3
{
  self->_hostApplication = a3;
}

- (CNContact)contact
{
  return (CNContact *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContact:(id)a3
{
}

- (DDActionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DDActionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)fallBackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fallBackView);
  return (UIView *)WeakRetained;
}

- (void)setFallBackView:(id)a3
{
}

- (BOOL)treatAsMenu
{
  return self->_treatAsMenu;
}

- (void)setTreatAsMenu:(BOOL)a3
{
  self->_treatAsMenu = a3;
}

- (void)setAssociatedVisualResults:(id)a3
{
}

- (void)performFromView:.cold.1()
{
  objc_opt_class();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v0, "Please override -performFromView: in the DDAction subclass %@", v1, v2, v3, v4, 2u);
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_3_cold_1(id *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*a1 scheme];
  int v5 = 138412802;
  id v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = objc_opt_class();
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempts to open %@ url failed (%@ - %@)", (uint8_t *)&v5, 0x20u);
}

void __41__DDAction__openURL_options_fallbackURL___block_invoke_4_cold_1(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) scheme];
  uint64_t v3 = [*(id *)(a1 + 40) scheme];
  int v4 = 138412802;
  int v5 = v2;
  __int16 v6 = 2112;
  __int16 v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = objc_opt_class();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Attempts to open %@ url failed, including with fallback %@ url (%@)", (uint8_t *)&v4, 0x20u);
}

- (void)localizedName
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_2(&dword_1A1709000, MEMORY[0x1E4F14500], v1, "Please override -localizedName in your DDAction subclass %@", v2, v3, v4, v5, 2u);
}

@end
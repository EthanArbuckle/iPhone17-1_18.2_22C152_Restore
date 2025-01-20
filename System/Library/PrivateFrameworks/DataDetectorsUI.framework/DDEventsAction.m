@interface DDEventsAction
+ (BOOL)actionAvailableForResult:(__DDResult *)a3 url:(id)a4 context:(id)a5;
+ (BOOL)isAvailable;
+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5;
- (BOOL)canBePerformedByOpeningURL;
- (id)iconName;
- (id)localizedName;
- (id)makeURL;
- (id)notificationIconBundleIdentifier;
- (id)notificationURL;
- (id)subtitle;
- (id)viewController;
- (int)interactionType;
- (void)performFromView:(id)a3;
@end

@implementation DDEventsAction

+ (BOOL)isAvailable
{
  return [MEMORY[0x1E4F59BB8] shouldShowRSVPDataDetectors];
}

+ (BOOL)actionAvailableForResult:(__DDResult *)a3 url:(id)a4 context:(id)a5
{
  int HasType = DDResultHasType();
  if (HasType)
  {
    LOBYTE(HasType) = [a1 isAvailable];
  }
  return HasType;
}

+ (id)actionsWithURL:(id)a3 result:(__DDResult *)a4 context:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([a1 isAvailable])
  {
    v10 = +[DDAction actionWithURL:v8 result:a4 context:v9];
    v13[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)localizedName
{
  v2 = [(DDEventsAction *)self notificationIconBundleIdentifier];
  v3 = dd_applicationNameWithBundleIdentifier(v2);

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    DDLocalizedStringFromTable(@"Apple Invites", @"Action name when tap and holding a Confetti app trigger link. Must match the Confetti marketing name localization.", @"Apple Invites", @"Localizable-extra");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)subtitle
{
  return 0;
}

- (id)iconName
{
  return @"events.icon";
}

- (int)interactionType
{
  return 0;
}

- (id)notificationIconBundleIdentifier
{
  return @"com.apple.rsvp";
}

- (id)makeURL
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v21[0] = @"EventTitle";
  v21[1] = @"SelectedText";
  v21[2] = @"ReferenceDate";
  v21[3] = @"SpecialURL";
  v21[4] = @"CoreSpotlightUniqueIdentifier";
  v21[5] = @"DocumentLanguage";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];
  id v4 = [(DDAction *)self context];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count") + 1);
  v6 = beginDateOfEventResults([(DDAction *)self associatedResults], v4, 0, 0, 0);
  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:@"event-start-date"];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        v13 = objc_msgSend(v4, "objectForKeyedSubscript:", v12, (void)v16);
        [v5 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v14 = [MEMORY[0x1E4F59BB8] urlForRSVPDataDetectorsWithContext:v5];

  return v14;
}

- (id)notificationURL
{
  targetURL = self->_targetURL;
  if (!targetURL)
  {
    id v4 = [(DDEventsAction *)self makeURL];
    v5 = self->_targetURL;
    self->_targetURL = v4;

    targetURL = self->_targetURL;
  }
  return targetURL;
}

- (BOOL)canBePerformedByOpeningURL
{
  return 1;
}

- (void)performFromView:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(33, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__DDEventsAction_performFromView___block_invoke;
  v7[3] = &unk_1E5A85428;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __34__DDEventsAction_performFromView___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) makeURL];
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = [v2 scheme];
    if (v4)
    {
      v5 = (void *)v4;
    }
    else
    {
      id v6 = [v3 absoluteString];

      if (!v6)
      {
LABEL_9:
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __34__DDEventsAction_performFromView___block_invoke_2;
        block[3] = &unk_1E5A85618;
        uint64_t v10 = *(void **)(a1 + 40);
        block[4] = *(void *)(a1 + 32);
        id v14 = v10;
        id v15 = v3;
        id v11 = v3;
        dispatch_async(MEMORY[0x1E4F14428], block);

        return;
      }
      id v7 = (void *)MEMORY[0x1E4F1CB10];
      v5 = [v3 absoluteString];
      id v8 = [@"https://" stringByAppendingString:v5];
      uint64_t v9 = [v7 URLWithString:v8];

      v3 = (void *)v9;
    }

    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't get feature url", v12, 2u);
  }
}

uint64_t __34__DDEventsAction_performFromView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performFromView:*(void *)(a1 + 40) byOpeningURL:*(void *)(a1 + 48)];
}

- (id)viewController
{
  return 0;
}

- (void).cxx_destruct
{
}

@end
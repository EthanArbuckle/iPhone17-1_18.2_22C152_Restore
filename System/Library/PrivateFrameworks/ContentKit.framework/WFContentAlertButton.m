@interface WFContentAlertButton
+ (id)buttonWithContentItem:(id)a3 selected:(BOOL)a4 stickySelection:(BOOL)a5 handler:(id)a6;
+ (void)processContentAlertButtonSubtitles:(id)a3;
- (BOOL)addSubtitleCompletionHandler:(id)a3;
- (BOOL)hasContentSubtitle;
- (BOOL)hideSubtitle;
- (NSString)subtitle;
- (OS_dispatch_group)group;
- (WFContentItem)contentItem;
- (void)getSubtitle:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHideSubtitle:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)start;
@end

@implementation WFContentAlertButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

- (void)setGroup:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setHideSubtitle:(BOOL)a3
{
  self->_hideSubtitle = a3;
}

- (BOOL)hideSubtitle
{
  return self->_hideSubtitle;
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)addSubtitleCompletionHandler:(id)a3
{
  id v4 = a3;
  group = self->_group;
  if (!group)
  {
    [(WFContentAlertButton *)self start];
    group = self->_group;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__WFContentAlertButton_addSubtitleCompletionHandler___block_invoke;
  v8[3] = &unk_264288800;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], v8);

  return 0;
}

uint64_t __53__WFContentAlertButton_addSubtitleCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)start
{
  v3 = (OS_dispatch_group *)dispatch_group_create();
  group = self->_group;
  self->_group = v3;

  dispatch_group_enter((dispatch_group_t)self->_group);
  v5 = [(WFContentAlertButton *)self contentItem];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__WFContentAlertButton_start__block_invoke;
  v6[3] = &unk_264288DF8;
  v6[4] = self;
  self->_hasContentSubtitle = [v5 getListSubtitle:v6];

  if (!self->_hasContentSubtitle) {
    dispatch_group_leave((dispatch_group_t)self->_group);
  }
}

void __29__WFContentAlertButton_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 copy];
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  *(void *)(v4 + 88) = v3;

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  dispatch_group_leave(v6);
}

- (void)getSubtitle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__WFContentAlertButton_getSubtitle___block_invoke;
  v6[3] = &unk_2642884D0;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(WFContentAlertButton *)self addSubtitleCompletionHandler:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __36__WFContentAlertButton_getSubtitle___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    int v5 = [WeakRetained hideSubtitle];
    uint64_t v6 = *(void *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    else
    {
      id v7 = [v4 contentItem];
      id v8 = [(id)objc_opt_class() localizedTypeDescription];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
    }
  }
}

- (BOOL)hasContentSubtitle
{
  if (!self->_group) {
    [(WFContentAlertButton *)self start];
  }
  return self->_hasContentSubtitle;
}

+ (void)processContentAlertButtonSubtitles:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 objectsMatchingClass:objc_opt_class()];
  int v5 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v13 = [v12 contentItem];
        [v5 addObject:objc_opt_class()];

        v9 |= [v12 hasContentSubtitle];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);

    if (v9)
    {
      BOOL v14 = 0;
      goto LABEL_12;
    }
  }
  else
  {
  }
  BOOL v14 = [v5 count] == 1;
LABEL_12:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v15 = v6;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "setHideSubtitle:", v14, (void)v20);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v17);
  }
}

+ (id)buttonWithContentItem:(id)a3 selected:(BOOL)a4 stickySelection:(BOOL)a5 handler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v11 = a3;
  id v12 = a6;
  v13 = [v11 name];
  BOOL v14 = [MEMORY[0x263F85448] parseAnnotatedString:v13];
  id v15 = [v14 displayString];

  uint64_t v16 = [a1 buttonWithTitle:v15 subtitle:0 selected:v8 stickySelection:v7 style:0 handler:v12 image:0];

  if (v16)
  {
    objc_storeStrong(v16 + 12, a3);
    uint64_t v17 = v16;
  }

  return v16;
}

@end
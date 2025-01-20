@interface EKEventURLDetailItem
+ (Class)_SGSuggestionsServiceClass;
- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4;
- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (void)_updateWithChanges;
- (void)reset;
@end

@implementation EKEventURLDetailItem

- (void)reset
{
  cell = self->_cell;
  self->_cell = 0;
}

+ (Class)_SGSuggestionsServiceClass
{
  return (Class)EKWeakLinkClass();
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(EKEvent *)self->super._event isBirthday]) {
    return 0;
  }
  v6 = [(EKEvent *)self->super._event URL];
  v7 = [v6 absoluteString];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [(EKEvent *)self->super._event URL];
    url = self->_url;
    self->_url = v9;
  }
  if (![MEMORY[0x1E4F57700] currentProcessIsFirstPartyCalendarApp]) {
    return self->_url != 0;
  }
  v11 = [(EKEvent *)self->super._event suggestionInfo];

  if (!v11) {
    return self->_url != 0;
  }
  v12 = [(EKEvent *)self->super._event suggestionInfo];
  v13 = [v12 uniqueKey];

  if (!v13)
  {
    v21 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      event = self->super._event;
      v23 = v21;
      v24 = [(EKEvent *)event calendarItemExternalIdentifier];
      v25 = [(EKEvent *)self->super._event suggestionInfo];
      *(_DWORD *)buf = 138543618;
      id v34 = v24;
      __int16 v35 = 2112;
      v36 = v25;
      _os_log_impl(&dword_1B3F4C000, v23, OS_LOG_TYPE_ERROR, "We found an event with suggestionInfo but no unique key [id: %{public}@ suggestionInfo:%@]", buf, 0x16u);
    }
    return 0;
  }
  v14 = self->_url;
  v15 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_SGSuggestionsServiceClass"), "serviceForEvents");
  v16 = [(EKEvent *)self->super._event suggestionInfo];
  v17 = [v16 uniqueKey];
  v18 = self->_url;
  v19 = [MEMORY[0x1E4F1CA20] currentLocale];
  if (v14)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __54__EKEventURLDetailItem_configureWithCalendar_preview___block_invoke;
    v31[3] = &unk_1E6087E48;
    v31[4] = self;
    [v15 launchInfoForSuggestedEventWithUniqueIdentifier:v17 sourceURL:v18 clientLocale:v19 withCompletion:v31];

    return 1;
  }
  else
  {
    id v32 = 0;
    v26 = [v15 launchInfoForSuggestedEventWithUniqueIdentifier:v17 sourceURL:v18 clientLocale:v19 error:&v32];
    id v27 = v32;
    launchInfo = self->_launchInfo;
    self->_launchInfo = v26;

    v29 = self->_launchInfo;
    BOOL v5 = v29 != 0;
    if (!v29)
    {
      v30 = kEKUILogHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v27;
        _os_log_impl(&dword_1B3F4C000, v30, OS_LOG_TYPE_ERROR, "Could not find synchronous launch info for suggested event: %@", buf, 0xCu);
      }
    }
  }
  return v5;
}

void __54__EKEventURLDetailItem_configureWithCalendar_preview___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__EKEventURLDetailItem_configureWithCalendar_preview___block_invoke_2;
  block[3] = &unk_1E6087548;
  id v10 = v5;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __54__EKEventURLDetailItem_configureWithCalendar_preview___block_invoke_2(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  if (v2)
  {
    objc_storeStrong((id *)(a1[6] + 88), v2);
    v3 = (void *)a1[6];
    [v3 _updateWithChanges];
  }
  else
  {
    v4 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[5];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1B3F4C000, v4, OS_LOG_TYPE_ERROR, "Could not find async launch info for suggested event: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_updateWithChanges
{
  id v3 = [(EKEventURLDetailItem *)self cellForSubitemAtIndex:0];
  [v3 updateWithURL:self->_url launchInfo:self->_launchInfo];
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4 forceUpdate:(BOOL)a5
{
  cell = self->_cell;
  if (cell)
  {
    if (a5)
    {
      [(UITableViewCell *)self->_cell update];
      cell = self->_cell;
    }
    [(UITableViewCell *)cell layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:a4];
  }
  else
  {
    id v8 = -[EKEventURLDetailItem cellForSubitemAtIndex:](self, "cellForSubitemAtIndex:", a3, a5, a4);
  }
  [(UITableViewCell *)self->_cell bounds];
  return v9;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  cell = self->_cell;
  if (!cell)
  {
    if (self->_launchInfo)
    {
      uint64_t v5 = [[EKEventDetailURLCell alloc] initWithEvent:self->super._event launchInfo:self->_launchInfo editable:0 style:0];
    }
    else
    {
      if (!self->_url)
      {
        id v10 = kEKUILogHandle;
        if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl(&dword_1B3F4C000, v10, OS_LOG_TYPE_ERROR, "We are displaying a cell with no launchInfo and no url. This should not be possible.", v11, 2u);
        }
        goto LABEL_7;
      }
      uint64_t v5 = [[EKEventDetailURLCell alloc] initWithEvent:self->super._event url:self->_url editable:0 style:0];
    }
    int v6 = self->_cell;
    self->_cell = &v5->super.super.super;

LABEL_7:
    [(UITableViewCell *)self->_cell update];
    uint64_t v7 = self->_cell;
    [(UITableViewCell *)v7 frame];
    [(UITableViewCell *)v7 layoutForWidth:[(EKEventDetailItem *)self cellPosition] position:v8];
    cell = self->_cell;
  }

  return cell;
}

- (BOOL)hasDetailViewControllerAtIndex:(unint64_t)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_launchInfo, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end
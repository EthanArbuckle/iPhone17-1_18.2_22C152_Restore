@interface AXRDeviceActionsViewController
- (AXRDeviceActionsViewController)initWithRemoteDevice:(id)a3 delegate:(id)a4;
- (AXRDeviceActionsViewControllerDelegate)delegate;
- (AXRemoteDevice)activeDevice;
- (BOOL)_canShowWhileLocked;
- (BOOL)_deviceSupportsHandGestures;
- (BOOL)_indexPathSectionIsForHandGestures:(int64_t)a3;
- (BOOL)accessibilityPerformEscape;
- (id)_actionForIndexPath:(id)a3;
- (id)_footerForSection:(int64_t)a3;
- (id)_imageForListItemAtIndexPath:(id)a3;
- (id)_leadingImageViewForListItemAtIndexPath:(id)a3;
- (id)_subtitleForListItemAtIndexPath:(id)a3;
- (id)_supportedHandGestures;
- (id)_titleForListItemAtIndexPath:(id)a3;
- (id)_titleForSection:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)_handGestureEventUsageForIndexPath:(id)a3;
- (int64_t)_numberOfRowsInSection:(int64_t)a3;
- (int64_t)_numberOfSections;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleIndexPathSelection:(id)a3;
- (void)setActiveDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AXRDeviceActionsViewController

- (AXRDeviceActionsViewController)initWithRemoteDevice:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXRDeviceActionsViewController;
  v8 = [(AXRDeviceActionsViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(AXRDeviceActionsViewController *)v8 setActiveDevice:v6];
    [(AXRDeviceActionsViewController *)v9 setDelegate:v7];
  }

  return v9;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AXRDeviceActionsViewController;
  [(AXRDeviceActionsViewController *)&v4 viewDidLoad];
  v3 = [(AXRDeviceActionsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"CellIdentifier"];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXRDeviceActionsViewController;
  [(AXRDeviceActionsViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AXRDeviceActionsViewController;
  [(AXRDeviceActionsViewController *)&v3 viewDidDisappear:a3];
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)_deviceSupportsHandGestures
{
  return 0;
}

- (id)_supportedHandGestures
{
  return &unk_26ECE9ED0;
}

- (int64_t)_numberOfSections
{
  objc_super v3 = [(AXRDeviceActionsViewController *)self activeDevice];
  objc_super v4 = [v3 deviceRemoteActions];
  uint64_t v5 = [v4 count];

  return v5 + [(AXRDeviceActionsViewController *)self _deviceSupportsHandGestures];
}

- (BOOL)_indexPathSectionIsForHandGestures:(int64_t)a3
{
  BOOL v5 = [(AXRDeviceActionsViewController *)self _deviceSupportsHandGestures];
  if (v5) {
    LOBYTE(v5) = [(AXRDeviceActionsViewController *)self _numberOfSections] - 1 == a3;
  }
  return v5;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  BOOL v5 = [(AXRDeviceActionsViewController *)self activeDevice];
  id v6 = [v5 deviceRemoteActions];
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    if (![(AXRDeviceActionsViewController *)self _deviceSupportsHandGestures]) {
      return 0;
    }
    v10 = [(AXRDeviceActionsViewController *)self _supportedHandGestures];
    int64_t v12 = [v10 count];
  }
  else
  {
    v8 = [(AXRDeviceActionsViewController *)self activeDevice];
    v9 = [v8 deviceRemoteActions];
    v10 = [v9 objectAtIndexedSubscript:a3];

    objc_super v11 = [v10 remoteActions];
    int64_t v12 = [v11 count];
  }
  return v12;
}

- (id)_titleForSection:(int64_t)a3
{
  BOOL v5 = [(AXRDeviceActionsViewController *)self activeDevice];
  id v6 = [v5 deviceRemoteActions];
  unint64_t v7 = [v6 count];

  if (v7 <= a3)
  {
    if ([(AXRDeviceActionsViewController *)self _deviceSupportsHandGestures])
    {
      objc_super v11 = AXRLocalizedStringForKey();
    }
    else
    {
      objc_super v11 = 0;
    }
  }
  else
  {
    v8 = [(AXRDeviceActionsViewController *)self activeDevice];
    v9 = [v8 deviceRemoteActions];
    v10 = [v9 objectAtIndexedSubscript:a3];

    objc_super v11 = [v10 localizedTitle];
  }
  return v11;
}

- (id)_footerForSection:(int64_t)a3
{
  BOOL v5 = [(AXRDeviceActionsViewController *)self activeDevice];
  id v6 = [v5 deviceRemoteActions];
  unint64_t v7 = [v6 count];

  if (v7 <= a3 && [(AXRDeviceActionsViewController *)self _deviceSupportsHandGestures])
  {
    v8 = AXRLocalizedStringForKey();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_actionForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [(AXRDeviceActionsViewController *)self activeDevice];
  unint64_t v7 = [v6 deviceRemoteActions];
  unint64_t v8 = [v7 count];

  if (v5 >= v8)
  {
    v13 = 0;
  }
  else
  {
    v9 = [(AXRDeviceActionsViewController *)self activeDevice];
    v10 = [v9 deviceRemoteActions];
    objc_super v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));

    int64_t v12 = [v11 remoteActions];
    v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  return v13;
}

- (int64_t)_handGestureEventUsageForIndexPath:(id)a3
{
  id v4 = a3;
  if (-[AXRDeviceActionsViewController _indexPathSectionIsForHandGestures:](self, "_indexPathSectionIsForHandGestures:", [v4 section]))
  {
    unint64_t v5 = [(AXRDeviceActionsViewController *)self _supportedHandGestures];
    id v6 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));
    int64_t v7 = (int)[v6 intValue];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (void)_handleIndexPathSelection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [(AXRDeviceActionsViewController *)self activeDevice];
  int64_t v7 = [v6 deviceRemoteActions];
  unint64_t v8 = [v7 count];

  if (v5 >= v8)
  {
    uint64_t v10 = [v4 section];

    [(AXRDeviceActionsViewController *)self _indexPathSectionIsForHandGestures:v10];
  }
  else
  {
    id v11 = [(AXRDeviceActionsViewController *)self _actionForIndexPath:v4];

    v9 = [(AXRDeviceActionsViewController *)self delegate];
    [v9 actionsViewController:self selectedAction:v11];
  }
}

- (id)_titleForListItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [(AXRDeviceActionsViewController *)self activeDevice];
  int64_t v7 = [v6 deviceRemoteActions];
  unint64_t v8 = [v7 count];

  if (v5 >= v8)
  {
    if (-[AXRDeviceActionsViewController _indexPathSectionIsForHandGestures:](self, "_indexPathSectionIsForHandGestures:", [v4 section]))
    {
      [(AXRDeviceActionsViewController *)self _handGestureEventUsageForIndexPath:v4];
      id v11 = AXLocalizedStringForHandGestureEventUsage();
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    v9 = [(AXRDeviceActionsViewController *)self _actionForIndexPath:v4];
    uint64_t v10 = [(AXRDeviceActionsViewController *)self activeDevice];
    [v10 deviceType];
    id v11 = AXRLocalizedStringForRemoteActionWithDeviceType();
  }
  return v11;
}

- (id)_subtitleForListItemAtIndexPath:(id)a3
{
  id v4 = a3;
  if (-[AXRDeviceActionsViewController _indexPathSectionIsForHandGestures:](self, "_indexPathSectionIsForHandGestures:", [v4 section]))
  {
    int64_t v5 = [(AXRDeviceActionsViewController *)self _handGestureEventUsageForIndexPath:v4];
    id v6 = [(AXRDeviceActionsViewController *)self activeDevice];
    int64_t v7 = [v6 customizedRemoteActionForHandGestureEventUsage:v5];

    unint64_t v8 = [(AXRDeviceActionsViewController *)self activeDevice];
    [v8 deviceType];
    v9 = AXRLocalizedStringForRemoteActionWithDeviceType();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_imageForListItemAtIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 section];
  id v6 = [(AXRDeviceActionsViewController *)self activeDevice];
  int64_t v7 = [v6 deviceRemoteActions];
  unint64_t v8 = [v7 count];

  if (v5 >= v8)
  {
    id v11 = 0;
  }
  else
  {
    v9 = [(AXRDeviceActionsViewController *)self _actionForIndexPath:v4];
    uint64_t v10 = [(AXRDeviceActionsViewController *)self activeDevice];
    id v11 = AXRUIImageForRemoteActionWithDeviceType(v9, [v10 deviceType]);
  }
  return v11;
}

- (id)_leadingImageViewForListItemAtIndexPath:(id)a3
{
  objc_super v3 = [(AXRDeviceActionsViewController *)self _imageForListItemAtIndexPath:a3];
  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(AXRDeviceActionsViewController *)self _numberOfRowsInSection:a4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(AXRDeviceActionsViewController *)self _titleForSection:a4];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = [a3 dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:v6];
  unint64_t v8 = [v7 defaultContentConfiguration];
  v9 = [(AXRDeviceActionsViewController *)self _imageForListItemAtIndexPath:v6];
  [v8 setImage:v9];

  uint64_t v10 = [MEMORY[0x263F1C550] secondaryLabelColor];
  id v11 = [v8 imageProperties];
  [v11 setTintColor:v10];

  int64_t v12 = [(AXRDeviceActionsViewController *)self _titleForListItemAtIndexPath:v6];
  [v8 setText:v12];

  v13 = [(AXRDeviceActionsViewController *)self _subtitleForListItemAtIndexPath:v6];

  [v8 setSecondaryText:v13];
  [v7 setContentConfiguration:v8];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  [(AXRDeviceActionsViewController *)self _handleIndexPathSelection:v6];
}

- (AXRemoteDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (AXRDeviceActionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXRDeviceActionsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeDevice, 0);
}

@end
@interface MUTransitLineIncidentsViewController
- (GEOTransitLineItem)lineItem;
- (MKTransitItemReferenceDateUpdater)itemUpdater;
- (MUTransitLineIncidentsViewController)initWithLineItem:(id)a3;
- (MUTransitLineIncidentsViewControllerDelegate)incidentsDelegate;
- (NSDate)referenceDate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_incidentCellForRow:(int64_t)a3;
- (id)_incidents;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_showIncidentDetails;
- (void)setIncidentsDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4;
- (void)transitUIReferenceTimeUpdated:(id)a3;
- (void)updateTransitLineItemIfNeeded;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MUTransitLineIncidentsViewController

- (MUTransitLineIncidentsViewController)initWithLineItem:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MUTransitLineIncidentsViewController;
  v6 = [(MUTransitLineIncidentsViewController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lineItem, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F31088]) initWithDelegate:v7];
    itemUpdater = v7->_itemUpdater;
    v7->_itemUpdater = (MKTransitItemReferenceDateUpdater *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F31080]) initWithLineItem:v5];
    incidentsController = v7->_incidentsController;
    v7->_incidentsController = (MKTransitItemIncidentsController *)v10;

    v12 = [(MUTransitLineIncidentsViewController *)v7 referenceDate];
    [(MKTransitItemIncidentsController *)v7->_incidentsController setReferenceDate:v12];

    v13 = [(MUTransitLineIncidentsViewController *)v7 _incidents];
    BOOL v14 = [v13 count] != 0;
    v15 = [MEMORY[0x1E4F63E38] sharedData];
    [v15 setPlaceCardTransitAdvisoryBanner:v14];

    [(MUTransitLineIncidentsViewController *)v7 updateTransitLineItemIfNeeded];
  }

  return v7;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MUTransitLineIncidentsViewController;
  [(MUTransitLineIncidentsViewController *)&v7 viewDidLoad];
  v3 = [(MUTransitLineIncidentsViewController *)self tableView];
  [v3 _setTopPadding:0.0];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  id v5 = [(MUTransitLineIncidentsViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(MUTransitLineIncidentsViewController *)self view];
  [v6 setPreservesSuperviewLayoutMargins:1];
}

- (void)updateTransitLineItemIfNeeded
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (([(GEOTransitLineItem *)self->_lineItem isIncidentsTTLExpired] & 1) != 0
    || ([(GEOTransitLineItem *)self->_lineItem hasIncidentComponent] & 1) == 0)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F30F10]);
    v4 = [(GEOTransitLineItem *)self->_lineItem identifier];
    id v5 = (void *)[v3 initWithGEOMapItemIdentifier:v4];

    if (v5)
    {
      objc_initWeak(&location, self);
      v6 = [MEMORY[0x1E4F30F28] sharedService];
      v13[0] = v5;
      objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      uint64_t v8 = [v6 ticketForTransitLines:v7 traits:0];

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __69__MUTransitLineIncidentsViewController_updateTransitLineItemIfNeeded__block_invoke;
      v9[3] = &unk_1E574FF60;
      objc_copyWeak(&v11, &location);
      id v10 = v5;
      [v8 submitWithHandler:v9 networkActivity:0];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __69__MUTransitLineIncidentsViewController_updateTransitLineItemIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v11 = objc_msgSend(v10, "identifier", (void)v20);
          int v12 = [v11 isEqual:*(void *)(a1 + 32)];

          if (v12)
          {
            id v13 = v10;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v13 = 0;
LABEL_12:

    BOOL v14 = (void *)*((void *)WeakRetained + 131);
    *((void *)WeakRetained + 131) = v13;
    id v15 = v13;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F31080]) initWithLineItem:v15];
    objc_super v17 = (void *)*((void *)WeakRetained + 128);
    *((void *)WeakRetained + 128) = v16;

    v18 = [WeakRetained referenceDate];
    [*((id *)WeakRetained + 128) setReferenceDate:v18];

    if ([WeakRetained isViewLoaded])
    {
      v19 = [WeakRetained tableView];
      [v19 reloadData];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MUTransitLineIncidentsViewController;
  [(MUTransitLineIncidentsViewController *)&v5 viewWillAppear:a3];
  v4 = [(MUTransitLineIncidentsViewController *)self itemUpdater];
  [v4 setActive:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MUTransitLineIncidentsViewController;
  [(MUTransitLineIncidentsViewController *)&v5 viewDidDisappear:a3];
  v4 = [(MUTransitLineIncidentsViewController *)self itemUpdater];
  [v4 setActive:0];
}

- (void)transitUIReferenceTimeUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_referenceDate, a3);
  if ([(MUTransitLineIncidentsViewController *)self isViewLoaded])
  {
    id v4 = [(MUTransitLineIncidentsViewController *)self tableView];
    [v4 reloadData];
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MUTransitLineIncidentsViewController;
  [(MUTransitLineIncidentsViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(MUTransitLineIncidentsViewController *)self tableView];
  [v3 contentSize];
  -[MUTransitLineIncidentsViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (NSDate)referenceDate
{
  referenceDate = self->_referenceDate;
  if (!referenceDate)
  {
    objc_super v4 = [MEMORY[0x1E4F31088] referenceDate];
    objc_super v5 = self->_referenceDate;
    self->_referenceDate = v4;

    referenceDate = self->_referenceDate;
  }
  return referenceDate;
}

- (id)_incidents
{
  incidentsController = self->_incidentsController;
  id v3 = [(MUTransitLineIncidentsViewController *)self lineItem];
  objc_super v4 = [(MKTransitItemIncidentsController *)incidentsController incidentsForLine:v3];

  return v4;
}

- (id)_incidentCellForRow:(int64_t)a3
{
  objc_super v5 = [(MUTransitLineIncidentsViewController *)self tableView];
  uint64_t v6 = objc_msgSend(v5, "_mapkit_dequeueReusableCellWithIdentifier:", @"kIncidentCellIdentifier");

  if (!v6) {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F31068]) initWithStyle:0 reuseIdentifier:@"kIncidentCellIdentifier"];
  }
  uint64_t v7 = [(MUTransitLineIncidentsViewController *)self _incidents];
  uint64_t v8 = v7;
  if (a3 < 0)
  {
    v9 = 0;
  }
  else
  {
    if ([v7 count] > (unint64_t)a3)
    {
      v9 = [v8 objectAtIndexedSubscript:a3];
      if (!a3) {
        goto LABEL_10;
      }
LABEL_9:
      uint64_t v10 = [v8 objectAtIndexedSubscript:a3 - 1];
      goto LABEL_11;
    }
    v9 = 0;
    if (a3) {
      goto LABEL_9;
    }
  }
LABEL_10:
  uint64_t v10 = 0;
LABEL_11:
  int v11 = [(id)v10 isBlockingIncident];
  unsigned int v12 = v11 ^ [v9 isBlockingIncident];
  if (v10) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 1;
  }
  BOOL v14 = [(MUTransitLineIncidentsViewController *)self referenceDate];
  [v6 configureWithIncident:v9 referenceDate:v14 shouldShowImage:v13 inSiri:0];

  if (a3 < -1 || (unint64_t v15 = a3 + 1, v15 >= [v8 count]))
  {
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = [v8 objectAtIndexedSubscript:v15];
  }
  int v17 = [(id)v16 isBlockingIncident];
  unsigned int v18 = v17 ^ [v9 isBlockingIncident];
  if (!v16 || v18)
  {
    [v6 setSeparatorHidden:1];
    if (v16) {
      unsigned __int8 v20 = 0;
    }
    else {
      unsigned __int8 v20 = v12;
    }
    uint64_t v21 = 3;
    if (v13) {
      uint64_t v21 = 1;
    }
    if (((v10 != 0) & v20) != 0) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v21;
    }
    if (v10 | v16) {
      uint64_t v19 = v22;
    }
    else {
      uint64_t v19 = 0;
    }
  }
  else
  {
    [v6 setSeparatorHidden:0];
    [v6 setTrailingSeparatorInset:0.0];
    if (v13) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2;
    }
  }
  [v6 setCellPosition:v19];
  if (v16) {
    uint64_t v23 = v18;
  }
  else {
    uint64_t v23 = 0;
  }
  [v6 setPadBottom:v23];

  return v6;
}

- (void)_showIncidentDetails
{
  id v4 = [(MUTransitLineIncidentsViewController *)self incidentsDelegate];
  id v3 = [(MUTransitLineIncidentsViewController *)self _incidents];
  [v4 transitLineIncidentsViewController:self didSelectDetailsForIncidents:v3];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(MUTransitLineIncidentsViewController *)self _incidents];
  int64_t v4 = [v3 count] != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t v4 = [(MUTransitLineIncidentsViewController *)self _incidents];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "row", a3);
  return [(MUTransitLineIncidentsViewController *)self _incidentCellForRow:v5];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 35.0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v5 = (void *)MEMORY[0x1E4FB1618];
  id v6 = a4;
  id v7 = [v5 clearColor];
  [v6 setBackgroundColor:v7];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MUTransitLineIncidentsViewController *)self _showIncidentDetails];
  [v7 deselectRowAtIndexPath:v6 animated:1];
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->_referenceDate, a4);
  [(MKTransitItemIncidentsController *)self->_incidentsController setReferenceDate:v7];
  if ([(MUTransitLineIncidentsViewController *)self isViewLoaded])
  {
    id v6 = [(MUTransitLineIncidentsViewController *)self tableView];
    [v6 reloadData];
  }
}

- (MUTransitLineIncidentsViewControllerDelegate)incidentsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incidentsDelegate);
  return (MUTransitLineIncidentsViewControllerDelegate *)WeakRetained;
}

- (void)setIncidentsDelegate:(id)a3
{
}

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (MKTransitItemReferenceDateUpdater)itemUpdater
{
  return self->_itemUpdater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemUpdater, 0);
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_destroyWeak((id *)&self->_incidentsDelegate);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_incidentsController, 0);
}

@end
@interface TPSCellularNetworkController
- (BOOL)isNetworkSelectionEnabled;
- (CTNetworkSelectionInfo)networkSelectionInfo;
- (CTXPCServiceSubscriptionContext)subscriptionContext;
- (NSArray)networkItems;
- (NSArray)networks;
- (TPSCellularNetworkController)init;
- (TPSCellularNetworkController)initWithSubscriptionContext:(id)a3;
- (TPSCellularNetworkItem)selectedNetworkItem;
- (TPSRegistrationTelephonyController)registrationController;
- (id)networkItemAtIndex:(int64_t)a3;
- (id)networkItemForNetwork:(id)a3;
- (int64_t)networkSelectionMode;
- (void)networkSelectionInfoChangedForRegistrationController:(id)a3;
- (void)networksChangedForRegistrationController:(id)a3;
- (void)selectNetworkItemAtIndex:(unint64_t)a3;
- (void)setNetworkItems:(id)a3;
- (void)setNetworkSelectionInfo:(id)a3;
- (void)setNetworkSelectionMode:(int64_t)a3;
- (void)setNetworks:(id)a3;
- (void)setSelectedNetworkItem:(id)a3;
- (void)updateNetworkSelectionModeForNetworkSelectionInfo:(id)a3;
- (void)updateSelectedNetworkForNetworkSelectionInfo:(id)a3;
@end

@implementation TPSCellularNetworkController

- (TPSCellularNetworkController)init
{
  return 0;
}

- (TPSCellularNetworkController)initWithSubscriptionContext:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSCellularNetworkController;
  v6 = [(TPSCellularNetworkController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v8 = (TPSRegistrationTelephonyController *)[objc_alloc((Class)TPSRegistrationTelephonyController) initWithSubscriptionContext:v5];
    registrationController = v7->_registrationController;
    v7->_registrationController = v8;

    [(TPSRegistrationTelephonyController *)v7->_registrationController addDelegate:v7 queue:&_dispatch_main_q];
    uint64_t v10 = [(TPSRegistrationTelephonyController *)v7->_registrationController networkSelectionInfo];
    networkSelectionInfo = v7->_networkSelectionInfo;
    v7->_networkSelectionInfo = (CTNetworkSelectionInfo *)v10;

    [(TPSCellularNetworkController *)v7 updateSelectedNetworkForNetworkSelectionInfo:v7->_networkSelectionInfo];
    [(TPSCellularNetworkController *)v7 updateNetworkSelectionModeForNetworkSelectionInfo:v7->_networkSelectionInfo];
  }

  return v7;
}

- (void)setNetworkItems:(id)a3
{
  id v5 = (NSArray *)a3;
  p_networkItems = &self->_networkItems;
  if (self->_networkItems != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_networkItems, a3);
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"TPSCellularNetworkControllerNetworkItemsDidChangeNotification" object:self];

    id v5 = v8;
  }

  _objc_release_x1(p_networkItems, v5);
}

- (BOOL)isNetworkSelectionEnabled
{
  v2 = [(TPSCellularNetworkController *)self networkSelectionInfo];
  BOOL v3 = [v2 selectionMode] != 0;

  return v3;
}

- (void)setNetworkSelectionMode:(int64_t)a3
{
  if (self->_networkSelectionMode == a3) {
    return;
  }
  self->_networkSelectionMode = a3;
  if (a3 == 2)
  {
    v4 = [(TPSCellularNetworkController *)self registrationController];
    [v4 fetchNetworkList];
LABEL_9:

    goto LABEL_10;
  }
  if (a3 != 1)
  {
    if (!a3) {
      -[TPSCellularNetworkController setNetworks:](self, "setNetworks:");
    }
    goto LABEL_10;
  }
  [(TPSCellularNetworkController *)self setNetworks:0];
  id v5 = [(TPSCellularNetworkController *)self selectedNetworkItem];

  if (v5)
  {
    v4 = [(TPSCellularNetworkController *)self registrationController];
    [v4 automaticallySelectNetwork];
    goto LABEL_9;
  }
LABEL_10:
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"TPSCellularNetworkControllerNetworkSelectionModeDidChangeNotification" object:self];
}

- (void)setSelectedNetworkItem:(id)a3
{
  id v5 = (TPSCellularNetworkItem *)a3;
  p_selectedNetworkItem = &self->_selectedNetworkItem;
  if (self->_selectedNetworkItem != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_selectedNetworkItem, a3);
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"TPSCellularNetworkControllerSelectedNetworkItemDidChangeNotification" object:self];

    id v5 = v8;
  }

  _objc_release_x1(p_selectedNetworkItem, v5);
}

- (void)setNetworks:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_networks != v5)
  {
    objc_storeStrong((id *)&self->_networks, a3);
    if (v5)
    {
      id v6 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v5 count]];
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      v7 = v5;
      id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = -[TPSCellularNetworkController networkItemForNetwork:](self, "networkItemForNetwork:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
            [v6 addObject:v12];
          }
          id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
    else
    {
      id v6 = 0;
    }
    -[TPSCellularNetworkController setNetworkItems:](self, "setNetworkItems:", v6, (void)v13);
  }
}

- (void)updateNetworkSelectionModeForNetworkSelectionInfo:(id)a3
{
  if ([a3 selectionMode] == (char *)&dword_0 + 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }

  [(TPSCellularNetworkController *)self setNetworkSelectionMode:v4];
}

- (void)updateSelectedNetworkForNetworkSelectionInfo:(id)a3
{
  uint64_t v4 = [a3 selection];
  if (v4)
  {
    uint64_t v5 = [(TPSCellularNetworkController *)self networkItemForNetwork:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  [(TPSCellularNetworkController *)self setSelectedNetworkItem:v5];
}

- (id)networkItemAtIndex:(int64_t)a3
{
  uint64_t v4 = [(TPSCellularNetworkController *)self networkItems];
  uint64_t v5 = v4;
  if (a3 < 0 || (unint64_t)[v4 count] <= a3)
  {
    v7 = TPSCellularNetworkLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_5A18(a3, v7);
    }

    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (void)selectNetworkItemAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(TPSCellularNetworkController *)self networks];
  id v6 = [v5 objectAtIndexedSubscript:a3];

  if (v6)
  {
    v7 = TPSCellularNetworkLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Requesting manual selection of network %@.", (uint8_t *)&v9, 0xCu);
    }

    id v8 = [(TPSCellularNetworkController *)self registrationController];
    [v8 selectNetwork:v6];
  }
}

- (id)networkItemForNetwork:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [TPSCellularNetworkItem alloc];
  uint64_t v5 = [v3 plmn];
  id v6 = [v3 name];
  v7 = objc_msgSend(v3, "tps_localizedName");

  id v8 = [(TPSCellularNetworkItem *)v4 initWithIdentifier:v5 name:v6 localizedName:v7];

  return v8;
}

- (void)networksChangedForRegistrationController:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSCellularNetworkController *)self registrationController];

  if (v5 == v4)
  {
    id v6 = TPSCellularNetworkLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling networks changed delegate callback.", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [v4 networks];
    [(TPSCellularNetworkController *)self setNetworks:v8];
  }
}

- (void)networkSelectionInfoChangedForRegistrationController:(id)a3
{
  id v4 = a3;
  id v5 = [(TPSCellularNetworkController *)self registrationController];

  if (v5 == v4)
  {
    id v6 = TPSCellularNetworkLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = (id)objc_opt_class();
      id v7 = v10;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling networks selection information changed delegate callback.", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [v4 networkSelectionInfo];
    [(TPSCellularNetworkController *)self setNetworkSelectionInfo:v8];
    [(TPSCellularNetworkController *)self updateSelectedNetworkForNetworkSelectionInfo:v8];
    [(TPSCellularNetworkController *)self updateNetworkSelectionModeForNetworkSelectionInfo:v8];
  }
}

- (int64_t)networkSelectionMode
{
  return self->_networkSelectionMode;
}

- (TPSCellularNetworkItem)selectedNetworkItem
{
  return self->_selectedNetworkItem;
}

- (NSArray)networkItems
{
  return self->_networkItems;
}

- (TPSRegistrationTelephonyController)registrationController
{
  return self->_registrationController;
}

- (NSArray)networks
{
  return self->_networks;
}

- (CTNetworkSelectionInfo)networkSelectionInfo
{
  return self->_networkSelectionInfo;
}

- (void)setNetworkSelectionInfo:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_networkSelectionInfo, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);
  objc_storeStrong((id *)&self->_networkItems, 0);

  objc_storeStrong((id *)&self->_selectedNetworkItem, 0);
}

@end
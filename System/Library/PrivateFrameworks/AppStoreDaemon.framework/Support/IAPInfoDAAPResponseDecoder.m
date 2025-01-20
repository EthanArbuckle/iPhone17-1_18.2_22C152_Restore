@interface IAPInfoDAAPResponseDecoder
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didFinishWithState:(int64_t)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
- (void)parserDidCancel:(id)a3;
- (void)parserDidStart:(id)a3;
@end

@implementation IAPInfoDAAPResponseDecoder

- (void)parserDidStart:(id)a3
{
  v4 = (NSMutableArray *)objc_opt_new();
  items = self->_items;
  self->_items = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  deletedItems = self->_deletedItems;
  self->_deletedItems = v6;

  v8 = (NSMutableArray *)objc_opt_new();
  currentItemsArray = self->_currentItemsArray;
  self->_currentItemsArray = v8;
}

- (void)parser:(id)a3 didFinishWithState:(int64_t)a4
{
  if (a4 != 2)
  {
    self->_success = 0;
    v17 = (NSMutableArray *)objc_opt_new();
    items = self->_items;
    self->_items = v17;

    v19 = (NSMutableArray *)objc_opt_new();
    deletedItems = self->_deletedItems;
    self->_deletedItems = v19;

    v9 = ASDLogHandleForCategory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    int v21 = 138412290;
    id v22 = (id)objc_opt_class();
    id v16 = v22;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%@]: Failed to decode response", (uint8_t *)&v21, 0xCu);
    goto LABEL_4;
  }
  self->_success = 1;
  v5 = +[NSArray arrayWithArray:self->_items];
  addedIAPs = self->_addedIAPs;
  self->_addedIAPs = v5;

  v7 = +[NSArray arrayWithArray:self->_deletedItems];
  removedIAPs = self->_removedIAPs;
  self->_removedIAPs = v7;

  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_opt_class();
    unsigned int status = self->_status;
    BOOL update = self->_update;
    serverRevision = self->_serverRevision;
    v14 = self->_addedIAPs;
    v15 = self->_removedIAPs;
    int v21 = 138413570;
    id v22 = v10;
    __int16 v23 = 1024;
    unsigned int v24 = status;
    __int16 v25 = 1024;
    BOOL v26 = update;
    __int16 v27 = 2112;
    v28 = serverRevision;
    __int16 v29 = 2112;
    v30 = v14;
    __int16 v31 = 2112;
    v32 = v15;
    id v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%@]: Parsed response\nstatus: %i\nisUpdate: %{BOOL}d\nserverRevision: %@\niaps: %@\ndeletedIaps: %@", (uint8_t *)&v21, 0x36u);
LABEL_4:
  }
LABEL_6:
}

- (void)parserDidCancel:(id)a3
{
  self->_success = 0;
  v4 = (NSMutableArray *)objc_opt_new();
  items = self->_items;
  self->_items = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  deletedItems = self->_deletedItems;
  self->_deletedItems = v6;
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  self->_success = 0;
  v5 = (NSMutableArray *)objc_opt_new();
  items = self->_items;
  self->_items = v5;

  v7 = (NSMutableArray *)objc_opt_new();
  deletedItems = self->_deletedItems;
  self->_deletedItems = v7;
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835625315)
  {
    if ((int)a4 <= 1836213102)
    {
      if ((int)a4 > 1835819883)
      {
        if (a4 == 1835819884) {
          return result;
        }
        int v5 = 1835821428;
      }
      else
      {
        if (a4 == 1835625316) {
          return result;
        }
        int v5 = 1835625572;
      }
      goto LABEL_22;
    }
    if ((int)a4 <= 1836344174)
    {
      if (a4 == 1836213103) {
        return result;
      }
      int v5 = 1836282996;
      goto LABEL_22;
    }
    if (a4 != 1836344175 && a4 != 1836413810)
    {
      int v5 = 1836414073;
      goto LABEL_22;
    }
  }
  else
  {
    if ((int)a4 > 1634368096)
    {
      if (a4 - 1634368097 <= 0x13 && ((1 << (a4 - 97)) & 0xE4011) != 0) {
        return result;
      }
      int v5 = 1634952301;
LABEL_22:
      if (a4 != v5) {
        return 0;
      }
      return result;
    }
    if (a4 != 1633968755 && a4 != 1634025833)
    {
      int v5 = 1634038895;
      goto LABEL_22;
    }
  }
  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL v4 = a4 == 1835819884 || a4 == 1835821428;
  return a4 == 1633968755 || v4;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  id v7 = a3;
  switch(a4)
  {
    case 0x6D75646Cu:
      id v12 = v7;
      deletedItems = self->_deletedItems;
      break;
    case 0x6D6C6974u:
      id v12 = v7;
      v11 = (ASDMutableIAPInfo *)objc_alloc_init((Class)ASDMutableIAPInfo);
      currentItem = self->_currentItem;
      self->_currentItem = v11;
      goto LABEL_8;
    case 0x6D6C636Cu:
      id v12 = v7;
      deletedItems = self->_items;
      break;
    default:
      goto LABEL_9;
  }
  v9 = deletedItems;
  currentItem = self->_currentItemsArray;
  self->_currentItemsArray = v9;
LABEL_8:

  id v7 = v12;
LABEL_9:
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v10 = a3;
  if ((int)a4 <= 1634368110)
  {
    if ((int)a4 > 1634368096)
    {
      if (a4 == 1634368097)
      {
        currentItem = self->_currentItem;
        id v17 = v10;
        id v12 = +[NSNumber numberWithUnsignedLongLong:(((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))+ a5[7]];
        [(ASDMutableIAPInfo *)currentItem setAppAdamId:v12];
      }
      else
      {
        if (a4 != 1634368101) {
          goto LABEL_28;
        }
        id v17 = v10;
        id v12 = +[NSDate dateWithTimeIntervalSince1970:(double)bswap32(*(_DWORD *)a5)];
        [(ASDMutableIAPInfo *)self->_currentItem setExpirationDate:v12];
      }
    }
    else if (a4 == 1634025833)
    {
      v13 = self->_currentItem;
      id v17 = v10;
      id v12 = +[NSNumber numberWithUnsignedLongLong:(((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))+ a5[7]];
      [(ASDMutableIAPInfo *)v13 setAdamId:v12];
    }
    else
    {
      if (a4 != 1634038895) {
        goto LABEL_28;
      }
      id v17 = v10;
      id v12 = +[NSDate dateWithTimeIntervalSince1970:(double)bswap32(*(_DWORD *)a5)];
      [(ASDMutableIAPInfo *)self->_currentItem setPurchaseDate:v12];
    }
LABEL_26:

LABEL_27:
    id v10 = v17;
    goto LABEL_28;
  }
  if ((int)a4 <= 1634952300)
  {
    switch(a4)
    {
      case 0x616A7A6Fu:
        id v17 = v10;
        char v11 = a5[3];
        [(ASDMutableIAPInfo *)self->_currentItem setHasUsedFreeOffer:v11 & 1];
        [(ASDMutableIAPInfo *)self->_currentItem setHasUsedIntroPricingOffer:(v11 & 2) != 0];
        goto LABEL_27;
      case 0x616A7A72u:
        id v17 = v10;
        [(ASDMutableIAPInfo *)self->_currentItem setAutoRenewStatus:*a5 != 0];
        goto LABEL_27;
      case 0x616A7A73u:
        id v17 = v10;
        id v12 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
        [(ASDMutableIAPInfo *)self->_currentItem setSubscriptionFamilyId:v12];
        goto LABEL_26;
      case 0x616A7A74u:
        if (*a5 < 5u)
        {
          id v17 = v10;
          -[ASDMutableIAPInfo setType:](self->_currentItem, "setType:");
          goto LABEL_27;
        }
        self->_errorParsingItem = 1;
        break;
      default:
        goto LABEL_28;
    }
    goto LABEL_28;
  }
  if ((int)a4 <= 1836413809)
  {
    if (a4 != 1634952301)
    {
      if (a4 == 1836282996) {
        self->_unsigned int status = bswap32(*(_DWORD *)a5);
      }
      goto LABEL_28;
    }
    id v17 = v10;
    id v12 = +[NSDate dateWithTimeIntervalSince1970:(double)bswap32(*(_DWORD *)a5)];
    [(ASDMutableIAPInfo *)self->_currentItem setLastModifiedDate:v12];
    goto LABEL_26;
  }
  if (a4 == 1836413810)
  {
    id v17 = v10;
    v15 = +[NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)a5)];
    serverRevision = self->_serverRevision;
    self->_serverRevision = v15;

    goto LABEL_27;
  }
  if (a4 == 1836414073) {
    self->_BOOL update = *a5 != 0;
  }
LABEL_28:
}

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1835821428)
  {
    if (self->_errorParsingItem)
    {
      id v7 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        currentItem = self->_currentItem;
        int v11 = 138412290;
        id v12 = currentItem;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[IAPInfoItemsResponseParserDelegate]: Error parsing item: %@", (uint8_t *)&v11, 0xCu);
      }

      self->_errorParsingItem = 0;
    }
    else
    {
      currentItemsArray = self->_currentItemsArray;
      id v9 = [(ASDMutableIAPInfo *)self->_currentItem copy];
      [(NSMutableArray *)currentItemsArray addObject:v9];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedIAPs, 0);
  objc_storeStrong((id *)&self->_addedIAPs, 0);
  objc_storeStrong((id *)&self->_serverRevision, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
  objc_storeStrong((id *)&self->_currentItemsArray, 0);
  objc_storeStrong((id *)&self->_deletedItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
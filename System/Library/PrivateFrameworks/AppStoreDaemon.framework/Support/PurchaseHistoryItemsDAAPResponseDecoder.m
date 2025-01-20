@interface PurchaseHistoryItemsDAAPResponseDecoder
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

@implementation PurchaseHistoryItemsDAAPResponseDecoder

- (void)parserDidStart:(id)a3
{
  v4 = (NSMutableArray *)objc_opt_new();
  currentBatchAdded = self->_currentBatchAdded;
  self->_currentBatchAdded = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  currentBatchRemoved = self->_currentBatchRemoved;
  self->_currentBatchRemoved = v6;

  v8 = (NSMutableArray *)objc_opt_new();
  currentRequiredCapabilities = self->_currentRequiredCapabilities;
  self->_currentRequiredCapabilities = v8;
}

- (void)parser:(id)a3 didFinishWithState:(int64_t)a4
{
  self->_doneParsing = 1;
  if (a4 != 2)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    currentBatchAdded = self->_currentBatchAdded;
    self->_currentBatchAdded = v5;

    v7 = (NSMutableArray *)objc_opt_new();
    currentBatchRemoved = self->_currentBatchRemoved;
    self->_currentBatchRemoved = v7;

    v9 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 138412290;
      *(void *)&v11[4] = objc_opt_class();
      id v10 = *(id *)&v11[4];
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%@]: Error decoding response", v11, 0xCu);
    }
  }
  -[NSConditionLock unlockWithCondition:](self->_parsingLock, "unlockWithCondition:", 2, *(_OWORD *)v11);
}

- (void)parserDidCancel:(id)a3
{
  self->_doneParsing = 1;
  v4 = (NSMutableArray *)objc_opt_new();
  currentBatchAdded = self->_currentBatchAdded;
  self->_currentBatchAdded = v4;

  v6 = (NSMutableArray *)objc_opt_new();
  currentBatchRemoved = self->_currentBatchRemoved;
  self->_currentBatchRemoved = v6;

  parsingLock = self->_parsingLock;
  [(NSConditionLock *)parsingLock unlockWithCondition:2];
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  self->_doneParsing = 1;
  v5 = (NSMutableArray *)objc_opt_new();
  currentBatchAdded = self->_currentBatchAdded;
  self->_currentBatchAdded = v5;

  v7 = (NSMutableArray *)objc_opt_new();
  currentBatchRemoved = self->_currentBatchRemoved;
  self->_currentBatchRemoved = v7;

  parsingLock = self->_parsingLock;
  [(NSConditionLock *)parsingLock unlockWithCondition:2];
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1634362225)
  {
    if ((int)a4 > 1634952303)
    {
      if ((int)a4 > 1835819883)
      {
        if ((int)a4 <= 2002871400)
        {
          if (a4 != 1835819884 && a4 != 1835821428)
          {
            int v6 = 1836409964;
            goto LABEL_60;
          }
          return result;
        }
        if (a4 == 2002871401 || a4 == 2002874985) {
          return result;
        }
        int v6 = 2002876271;
LABEL_60:
        if (a4 != v6) {
          return 0;
        }
        return result;
      }
      if ((int)a4 > 1835624552)
      {
        if (a4 != 1835624553 && a4 != 1835625572)
        {
          int v6 = 1835626093;
          goto LABEL_60;
        }
        return result;
      }
      if (a4 == 1634952304) {
        return result;
      }
      unsigned __int16 v8 = 26478;
    }
    else
    {
      if ((int)a4 <= 1634364740)
      {
        if ((a4 - 1634363493 > 0xA || ((1 << (a4 - 101)) & 0x421) == 0) && a4 != 1634362226)
        {
          unsigned __int16 v5 = 26992;
          goto LABEL_43;
        }
        return result;
      }
      if ((int)a4 <= 1634366050)
      {
        if (a4 != 1634364741 && a4 != 1634364773)
        {
          unsigned __int16 v5 = 28789;
LABEL_43:
          int v6 = v5 | 0x616A0000;
          goto LABEL_60;
        }
        return result;
      }
      if (a4 == 1634366051 || a4 == 1634366060) {
        return result;
      }
      unsigned __int16 v8 = 24946;
    }
    int v6 = v8 | 0x61730000;
    goto LABEL_60;
  }
  if ((int)a4 <= 1634035307)
  {
    if ((int)a4 > 1634030191)
    {
      if ((int)a4 <= 1634030418)
      {
        if (a4 == 1634030192) {
          return result;
        }
        unsigned __int16 v7 = 21321;
      }
      else
      {
        if (a4 == 1634030419 || a4 == 1634034497) {
          return result;
        }
        unsigned __int16 v7 = 25430;
      }
    }
    else if ((int)a4 <= 1634027336)
    {
      if (a4 == 1633968755) {
        return result;
      }
      unsigned __int16 v7 = 16969;
    }
    else
    {
      if (a4 == 1634027337 || a4 == 1634028622) {
        return result;
      }
      unsigned __int16 v7 = 19819;
    }
LABEL_56:
    int v6 = v7 | 0x61650000;
    goto LABEL_60;
  }
  if ((int)a4 <= 1634354770)
  {
    if ((int)a4 > 1634037810)
    {
      if (a4 != 1634037811 && a4 != 1634038895)
      {
        unsigned __int16 v5 = 18000;
        goto LABEL_43;
      }
      return result;
    }
    if (a4 == 1634035308) {
      return result;
    }
    unsigned __int16 v7 = 27753;
    goto LABEL_56;
  }
  if ((int)a4 > 1634358082)
  {
    if (a4 != 1634358083 && a4 != 1634358114)
    {
      unsigned __int16 v5 = 25442;
      goto LABEL_43;
    }
  }
  else if (a4 != 1634354771 && a4 != 1634355570)
  {
    unsigned __int16 v5 = 20565;
    goto LABEL_43;
  }
  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1835819883)
  {
    if (a4 != 1835819884 && a4 != 1835821428)
    {
      int v5 = 1836409964;
LABEL_8:
      if (a4 != v5) {
        return 0;
      }
    }
  }
  else if (a4 != 1633968755 && a4 != 1634035308)
  {
    int v5 = 1634366060;
    goto LABEL_8;
  }
  return result;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1835821428)
  {
    unsigned __int16 v7 = (ASDPurchaseHistoryApp *)objc_alloc_init((Class)ASDPurchaseHistoryApp);
    currentItem = self->_currentItem;
    self->_currentItem = v7;
  }
  self->_currentContainerCode = a4;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v20 = a3;
  if ((int)a4 <= 1634362209)
  {
    if ((int)a4 <= 1634036840)
    {
      if ((int)a4 <= 1634030191)
      {
        if ((int)a4 > 1634028621)
        {
          if (a4 == 1634028622)
          {
            id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
            [(ASDPurchaseHistoryApp *)self->_currentItem setLongTitle:v10];
            goto LABEL_101;
          }
          if (a4 == 1634028907)
          {
            uint64_t v13 = bswap32(*(_DWORD *)a5);
            [(ASDPurchaseHistoryApp *)self->_currentItem setMediaKind:v13];
            if (v13 == 0x4000000) {
              [(ASDPurchaseHistoryApp *)self->_currentItem setSupportsMac:1];
            }
          }
        }
        else
        {
          if (a4 == 1634026057)
          {
            id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
            [(ASDPurchaseHistoryApp *)self->_currentItem setBundleID:v10];
            goto LABEL_101;
          }
          if (a4 == 1634027337) {
            [(ASDPurchaseHistoryApp *)self->_currentItem setGenreID:bswap32(*(_DWORD *)a5)];
          }
        }
      }
      else if ((int)a4 <= 1634030418)
      {
        if (a4 == 1634030192)
        {
          id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
          [(ASDPurchaseHistoryApp *)self->_currentItem setRedownloadParams:v10];
          goto LABEL_101;
        }
        if (a4 == 1634030409) {
          [(ASDPurchaseHistoryApp *)self->_currentItem setStoreItemID:(((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))+ a5[7]];
        }
      }
      else
      {
        if (a4 != 1634030419)
        {
          if (a4 == 1634034497)
          {
            id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
            [(ASDPurchaseHistoryApp *)self->_currentItem setIconURLString:v10];
          }
          else
          {
            if (a4 != 1634034518) {
              goto LABEL_102;
            }
            id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
            [(ASDPurchaseHistoryApp *)self->_currentItem setCircularIconURLString:v10];
          }
          goto LABEL_101;
        }
        char v14 = a5[1];
        if ((v14 & 2) != 0) {
          [(ASDPurchaseHistoryApp *)self->_currentItem setSupportsIPad:1];
        }
        if ((v14 & 5) != 0) {
          [(ASDPurchaseHistoryApp *)self->_currentItem setSupportsIPhone:1];
        }
        if ((v14 & 8) != 0) {
          [(ASDPurchaseHistoryApp *)self->_currentItem setSupportsMac:1];
        }
        if ((v14 & 0x10) != 0) {
          [(ASDPurchaseHistoryApp *)self->_currentItem setSupportsRealityDevice:1];
        }
      }
      goto LABEL_102;
    }
    if ((int)a4 <= 1634354770)
    {
      if ((int)a4 > 1634038894)
      {
        if (a4 == 1634038895)
        {
          [(ASDPurchaseHistoryApp *)self->_currentItem setPurchaseToken:bswap32(*(_DWORD *)a5)];
        }
        else if (a4 == 1634354768)
        {
          [(ASDPurchaseHistoryApp *)self->_currentItem setFirstParty:*a5 != 0];
        }
      }
      else if (a4 == 1634036841)
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setSupportsLayeredImage:*a5 != 0];
      }
      else if (a4 == 1634037811)
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setHasP3:*a5 != 0];
      }
      goto LABEL_102;
    }
    if ((int)a4 <= 1634357332)
    {
      if (a4 == 1634354771)
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setFamilyShared:*a5 != 0];
      }
      else if (a4 == 1634355570)
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setOptedInForXROSEligibility:*a5 != 0];
      }
      goto LABEL_102;
    }
    if (a4 != 1634357333)
    {
      if (a4 == 1634358083)
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setContentRatingFlags:__rev16(*(unsigned __int16 *)a5)];
      }
      else if (a4 == 1634358114)
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setIs32BitOnly:*a5 != 0];
      }
      goto LABEL_102;
    }
    id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    currentItem = self->_currentItem;
    id v12 = +[NSURL URLWithString:v10];
    [(ASDPurchaseHistoryApp *)currentItem setProductURL:v12];
LABEL_91:

    goto LABEL_101;
  }
  if ((int)a4 <= 1634366050)
  {
    if ((int)a4 <= 1634363502)
    {
      if ((int)a4 > 1634363492)
      {
        if (a4 == 1634363493)
        {
          [(ASDPurchaseHistoryApp *)self->_currentItem setHasMessagesExtension:*a5 != 0];
        }
        else if (a4 == 1634363498)
        {
          [(ASDPurchaseHistoryApp *)self->_currentItem setHiddenFromSpringboard:*a5 != 0];
        }
        goto LABEL_102;
      }
      if (a4 != 1634362210)
      {
        if (a4 == 1634362226) {
          [(ASDPurchaseHistoryApp *)self->_currentItem setCurrentlyOptedInForXROSEligibility:*a5 != 0];
        }
        goto LABEL_102;
      }
      [(ASDPurchaseHistoryApp *)self->_currentItem setCustomBrowserEngineApp:*a5 != 0];
      v16 = [(ASDPurchaseHistoryApp *)self->_currentItem appCapabilities];
      id v10 = [v16 mutableCopy];

      if (!v10) {
        id v10 = objc_alloc_init((Class)NSMutableArray);
      }
      [v10 addObject:@"is-custom-browser-engine-app"];
      id v12 = [v10 copy];
      [(ASDPurchaseHistoryApp *)self->_currentItem setAppCapabilities:v12];
    }
    else
    {
      if ((int)a4 <= 1634364740)
      {
        if (a4 == 1634363503)
        {
          id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
          [(ASDPurchaseHistoryApp *)self->_currentItem setOvalIconURLString:v10];
          goto LABEL_101;
        }
        if (a4 == 1634363760) {
          [(ASDPurchaseHistoryApp *)self->_currentItem setIsPreorder:*a5 != 0];
        }
        goto LABEL_102;
      }
      if (a4 == 1634364741)
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setCurrentlyOptedInForMacOSEligibility:*a5 != 0];
        goto LABEL_102;
      }
      if (a4 == 1634364773)
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setOptedInForMacOSEligibility:*a5 != 0];
        goto LABEL_102;
      }
      if (a4 != 1634365557) {
        goto LABEL_102;
      }
      id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
      v11 = self->_currentItem;
      id v12 = +[NSURL URLWithString:v10];
      [(ASDPurchaseHistoryApp *)v11 setPreflightPackageURL:v12];
    }
    goto LABEL_91;
  }
  if ((int)a4 <= 1835625571)
  {
    if ((int)a4 <= 1634952303)
    {
      if (a4 == 1634366051)
      {
        id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
        if (self->_currentContainerCode == 1634366060) {
          [(NSMutableArray *)self->_currentRequiredCapabilities addObject:v10];
        }
      }
      else
      {
        if (a4 != 1634951538) {
          goto LABEL_102;
        }
        id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
        [(ASDPurchaseHistoryApp *)self->_currentItem setDeveloperName:v10];
      }
    }
    else if (a4 == 1634952304)
    {
      id v10 = +[NSDate dateWithTimeIntervalSince1970:(double)bswap32(*(_DWORD *)a5)];
      [(ASDPurchaseHistoryApp *)self->_currentItem setDatePurchased:v10];
    }
    else
    {
      if (a4 != 1634953070)
      {
        if (a4 == 1835624553) {
          [(ASDPurchaseHistoryApp *)self->_currentItem setHidden:*a5 != 0];
        }
        goto LABEL_102;
      }
      id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
      [(ASDPurchaseHistoryApp *)self->_currentItem setGenreName:v10];
    }
LABEL_101:

    goto LABEL_102;
  }
  if ((int)a4 <= 2002871400)
  {
    if (a4 == 1835625572)
    {
      unint64_t v17 = (((unint64_t)*a5 << 56) | ((unint64_t)a5[1] << 48) | ((unint64_t)a5[2] << 40) | ((unint64_t)a5[3] << 32) | ((unint64_t)a5[4] << 24) | ((unint64_t)a5[5] << 16) | ((unint64_t)a5[6] << 8))
          + a5[7];
      if (self->_currentContainerCode == 1836409964)
      {
        currentBatchRemoved = self->_currentBatchRemoved;
        v19 = +[NSNumber numberWithUnsignedLongLong:v17];
        [(NSMutableArray *)currentBatchRemoved addObject:v19];

        sub_10038BF44(self);
      }
      else
      {
        [(ASDPurchaseHistoryApp *)self->_currentItem setLockerItemID:v17];
      }
      goto LABEL_102;
    }
    if (a4 != 1835626093) {
      goto LABEL_102;
    }
    id v10 = [objc_alloc((Class)NSString) initWithBytes:a5 length:a6 encoding:4];
    [(ASDPurchaseHistoryApp *)self->_currentItem setTitle:v10];
    goto LABEL_101;
  }
  switch(a4)
  {
    case 0x77616469u:
      [(ASDPurchaseHistoryApp *)self->_currentItem setWatchAppDeliveredIniOSApp:*a5 != 0];
      break;
    case 0x77617269u:
      [(ASDPurchaseHistoryApp *)self->_currentItem setWatchAppRunsIndependently:*a5 != 0];
      break;
    case 0x7761776Fu:
      [(ASDPurchaseHistoryApp *)self->_currentItem setWatchOnly:*a5 != 0];
      break;
  }
LABEL_102:
}

- (void)parser:(id)a3 didEndContainerCode:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1634366060)
  {
    [(ASDPurchaseHistoryApp *)self->_currentItem setRequiredCapabilities:self->_currentRequiredCapabilities];
    unsigned __int16 v8 = (NSMutableArray *)objc_opt_new();
    currentRequiredCapabilities = self->_currentRequiredCapabilities;
    self->_currentRequiredCapabilities = v8;
  }
  else if (a4 == 1835821428)
  {
    if (self->_errorParsingItem)
    {
      unsigned __int16 v7 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v12 = objc_opt_class();
        currentItem = self->_currentItem;
        int v15 = 138412546;
        v16 = v12;
        __int16 v17 = 2112;
        v18 = currentItem;
        id v14 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%@]: Error parsing item: %@", (uint8_t *)&v15, 0x16u);
      }
      self->_errorParsingItem = 0;
    }
    else
    {
      [(NSMutableArray *)self->_currentBatchAdded addObject:self->_currentItem];
      unint64_t batchSize = self->_batchSize;
      unint64_t v11 = self->_currentBatchCount + 1;
      self->_currentBatchCount = v11;
      if (v11 >= batchSize)
      {
        [(NSConditionLock *)self->_parsingLock unlockWithCondition:2];
        [(NSConditionLock *)self->_parsingLock lockWhenCondition:1];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_isUpdate, 0);
  objc_storeStrong((id *)&self->_parsingQueue, 0);
  objc_storeStrong((id *)&self->_parsingLock, 0);
  objc_storeStrong((id *)&self->_currentRequiredCapabilities, 0);
  objc_storeStrong((id *)&self->_currentBatchRemoved, 0);
  objc_storeStrong((id *)&self->_currentBatchAdded, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_currentItem, 0);
}

@end
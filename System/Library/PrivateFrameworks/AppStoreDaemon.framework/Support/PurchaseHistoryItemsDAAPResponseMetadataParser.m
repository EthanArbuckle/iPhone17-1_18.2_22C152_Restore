@interface PurchaseHistoryItemsDAAPResponseMetadataParser
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didFinishWithState:(int64_t)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parserDidCancel:(id)a3;
- (void)parserDidStart:(id)a3;
@end

@implementation PurchaseHistoryItemsDAAPResponseMetadataParser

- (void)parserDidStart:(id)a3
{
  isUpdate = self->_isUpdate;
  self->_isUpdate = 0;

  revision = self->_revision;
  self->_revision = 0;

  status = self->_status;
  self->_status = 0;

  self->_hasParsedData = 0;
}

- (void)parser:(id)a3 didFinishWithState:(int64_t)a4
{
  self->_hasParsedData = 1;
}

- (void)parserDidCancel:(id)a3
{
  isUpdate = self->_isUpdate;
  self->_isUpdate = 0;

  revision = self->_revision;
  self->_revision = 0;

  status = self->_status;
  self->_status = 0;

  self->_hasParsedData = 0;
  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = (id)objc_opt_class();
    id v8 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "[%@]: Parser canceled", (uint8_t *)&v9, 0xCu);
  }
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  isUpdate = self->_isUpdate;
  self->_isUpdate = 0;

  revision = self->_revision;
  self->_revision = 0;

  status = self->_status;
  self->_status = 0;

  self->_hasParsedData = 0;
  int v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138412546;
    id v12 = (id)objc_opt_class();
    __int16 v13 = 2114;
    id v14 = v5;
    id v10 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%@]: Parser failed with error: %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL result = 1;
  if ((int)a4 > 1836413809)
  {
    if (a4 == 1836413810) {
      return result;
    }
    int v5 = 1836414073;
  }
  else
  {
    if (a4 == 1633968755) {
      return result;
    }
    int v5 = 1836282996;
  }
  if (a4 != v5) {
    return 0;
  }
  return result;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1633968755;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v9 = a3;
  switch(a4)
  {
    case 0x6D757479u:
      id v15 = v9;
      if (*a5) {
        id v12 = &__kCFBooleanTrue;
      }
      else {
        id v12 = &__kCFBooleanFalse;
      }
      __int16 v13 = v12;
      isUpdate = self->_isUpdate;
      self->_isUpdate = v13;
      break;
    case 0x6D757372u:
      id v15 = v9;
      id v14 = +[NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)a5)];
      isUpdate = self->_revision;
      self->_revision = v14;
      break;
    case 0x6D737474u:
      id v15 = v9;
      id v10 = +[NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)a5)];
      isUpdate = self->_status;
      self->_status = v10;
      break;
    default:
      goto LABEL_11;
  }

  id v9 = v15;
LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_isUpdate, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
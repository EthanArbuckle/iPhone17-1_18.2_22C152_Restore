@interface PurchaseHistoryUpdateDAAPResponseDecoder
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (void)parser:(id)a3 didFailWithError:(id)a4;
- (void)parser:(id)a3 didFinishWithState:(int64_t)a4;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parserDidCancel:(id)a3;
- (void)parserDidStart:(id)a3;
@end

@implementation PurchaseHistoryUpdateDAAPResponseDecoder

- (void)parserDidStart:(id)a3
{
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
  revision = self->_revision;
  self->_revision = 0;

  status = self->_status;
  self->_status = 0;

  self->_hasParsedData = 0;
  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138412290;
    id v9 = (id)objc_opt_class();
    id v7 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%@]: Parser canceled", (uint8_t *)&v8, 0xCu);
  }
}

- (void)parser:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  revision = self->_revision;
  self->_revision = 0;

  status = self->_status;
  self->_status = 0;

  self->_hasParsedData = 0;
  int v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2114;
    id v13 = v5;
    id v9 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%@]: Parser failed with error: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL v4 = a4 == 1836413028 || a4 == 1836413810;
  return a4 == 1836282996 || v4;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1836413028;
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  id v9 = a3;
  if (a4 == 1836413810)
  {
    id v13 = v9;
    __int16 v12 = +[NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)a5)];
    revision = self->_revision;
    self->_revision = v12;
  }
  else
  {
    if (a4 != 1836282996) {
      goto LABEL_6;
    }
    id v13 = v9;
    int v10 = +[NSNumber numberWithUnsignedInt:bswap32(*(_DWORD *)a5)];
    revision = self->_status;
    self->_status = v10;
  }

  id v9 = v13;
LABEL_6:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
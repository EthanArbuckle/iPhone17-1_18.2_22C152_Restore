@interface SKDownloadInternal
@end

@implementation SKDownloadInternal

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transaction);
  objc_storeStrong((id *)&self->_contentVersion, 0);
  objc_storeStrong((id *)&self->_contentLength, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_productID, 0);

  objc_storeStrong((id *)&self->_downloadID, 0);
}

@end
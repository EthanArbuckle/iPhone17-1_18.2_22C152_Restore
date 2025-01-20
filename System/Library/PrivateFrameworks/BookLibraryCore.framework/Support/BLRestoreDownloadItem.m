@interface BLRestoreDownloadItem
- (NSError)error;
- (id)description;
- (void)setError:(id)a3;
@end

@implementation BLRestoreDownloadItem

- (id)description
{
  v3 = [(BLRestoreContentItem *)self storeItemID];
  v4 = [(BLRestoreContentItem *)self title];
  v5 = [(BLRestoreContentItem *)self storeAccountID];
  v6 = [(BLRestoreContentItem *)self downloadKind];
  v7 = +[NSString stringWithFormat:@"{ itemID: %@ t: %@ a: %@, kind: %@ }", v3, v4, v5, v6];

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
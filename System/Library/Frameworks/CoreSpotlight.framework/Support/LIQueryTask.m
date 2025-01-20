@interface LIQueryTask
- (NSString)searchToken;
- (VolumeScan)volumeScan;
- (void)cancel;
- (void)setSearchToken:(id)a3;
- (void)setVolumeScan:(id)a3;
@end

@implementation LIQueryTask

- (void)cancel
{
  if (self->_searchToken) {
    -[VolumeScan cancelWithToken:](self->_volumeScan, "cancelWithToken:");
  }
}

- (VolumeScan)volumeScan
{
  return self->_volumeScan;
}

- (void)setVolumeScan:(id)a3
{
}

- (NSString)searchToken
{
  return self->_searchToken;
}

- (void)setSearchToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchToken, 0);

  objc_storeStrong((id *)&self->_volumeScan, 0);
}

@end
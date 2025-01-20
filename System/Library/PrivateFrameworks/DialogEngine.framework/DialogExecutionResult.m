@interface DialogExecutionResult
- (NSArray)dialog;
- (NSDictionary)meta;
- (NSString)catId;
- (void)setCatId:(id)a3;
- (void)setDialog:(id)a3;
- (void)setMeta:(id)a3;
@end

@implementation DialogExecutionResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_meta, 0);
  objc_storeStrong((id *)&self->_catId, 0);
}

- (void)setDialog:(id)a3
{
}

- (NSArray)dialog
{
  return self->_dialog;
}

- (void)setMeta:(id)a3
{
}

- (NSDictionary)meta
{
  return self->_meta;
}

- (void)setCatId:(id)a3
{
}

- (NSString)catId
{
  return self->_catId;
}

@end
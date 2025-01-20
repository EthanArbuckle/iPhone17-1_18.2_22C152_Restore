@interface GKSaveAccountResult
- (NSError)error;
- (NSURL)objectID;
- (void)setError:(id)a3;
- (void)setObjectID:(id)a3;
@end

@implementation GKSaveAccountResult

- (NSURL)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
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
  objc_storeStrong((id *)&self->_error, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
@interface IDSCKFetchRecordZoneChangesOptions
+ (Class)__class;
+ (id)alloc;
- (IDSCKServerChangeToken)previousServerChangeToken;
- (NSArray)desiredKeys;
- (unint64_t)resultsLimit;
- (void)setDesiredKeys:(id)a3;
- (void)setPreviousServerChangeToken:(id)a3;
- (void)setResultsLimit:(unint64_t)a3;
@end

@implementation IDSCKFetchRecordZoneChangesOptions

+ (Class)__class
{
  if (qword_1E944F560 != -1) {
    dispatch_once(&qword_1E944F560, &unk_1EEFCE038);
  }
  v2 = (void *)qword_1E944F558;
  return (Class)v2;
}

+ (id)alloc
{
  v4 = (objc_class *)objc_msgSend___class(a1, a2, v2, v3);
  return [v4 alloc];
}

- (IDSCKServerChangeToken)previousServerChangeToken
{
  return self->_previousServerChangeToken;
}

- (void)setPreviousServerChangeToken:(id)a3
{
}

- (unint64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (void)setResultsLimit:(unint64_t)a3
{
  self->_resultsLimit = a3;
}

- (NSArray)desiredKeys
{
  return self->_desiredKeys;
}

- (void)setDesiredKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_previousServerChangeToken, 0);
}

@end
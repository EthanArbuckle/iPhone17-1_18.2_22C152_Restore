@interface CNUIGroupsAndContainersContactsSaveResult
- (BOOL)saveDidSucceed;
- (CNUIGroupsAndContainersContactsSaveResult)initWithSuccess:(BOOL)a3 error:(id)a4 addedContacts:(id)a5;
- (NSArray)addedContacts;
- (NSError)error;
@end

@implementation CNUIGroupsAndContainersContactsSaveResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedContacts, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (NSArray)addedContacts
{
  return self->_addedContacts;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)saveDidSucceed
{
  return self->_saveDidSucceed;
}

- (CNUIGroupsAndContainersContactsSaveResult)initWithSuccess:(BOOL)a3 error:(id)a4 addedContacts:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CNUIGroupsAndContainersContactsSaveResult;
  v11 = [(CNUIGroupsAndContainersContactsSaveResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_saveDidSucceed = a3;
    objc_storeStrong((id *)&v11->_error, a4);
    objc_storeStrong((id *)&v12->_addedContacts, a5);
  }

  return v12;
}

@end
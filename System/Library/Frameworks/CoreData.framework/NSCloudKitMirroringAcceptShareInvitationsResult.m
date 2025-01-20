@interface NSCloudKitMirroringAcceptShareInvitationsResult
- (NSArray)acceptedShareMetadatas;
- (NSArray)acceptedShares;
- (NSCloudKitMirroringAcceptShareInvitationsResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 acceptedShares:(id)a5 acceptedShareMetadatas:(id)a6 error:(id)a7;
- (void)dealloc;
- (void)setAcceptedShareMetadatas:(id)a3;
- (void)setAcceptedShares:(id)a3;
@end

@implementation NSCloudKitMirroringAcceptShareInvitationsResult

- (NSCloudKitMirroringAcceptShareInvitationsResult)initWithRequest:(id)a3 storeIdentifier:(id)a4 acceptedShares:(id)a5 acceptedShareMetadatas:(id)a6 error:(id)a7
{
  BOOL v13 = ((unint64_t)a5 | (unint64_t)a6) == 0;
  if (!((unint64_t)a5 | (unint64_t)a6))
  {
LABEL_8:
    BOOL v14 = 0;
    goto LABEL_9;
  }
  if (!a5 || !a6)
  {
    uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", "Invalid arguments to initialize a share invitations result. If the operation failed both acceptedShares and acceptedShareMetadatas should be nil, otherwise there should be both arrays.");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)v25.receiver);
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_18AB82000, v22, OS_LOG_TYPE_FAULT, "CoreData: Invalid arguments to initialize a share invitations result. If the operation failed both acceptedShares and acceptedShareMetadatas should be nil, otherwise there should be both arrays.", buf, 2u);
    }
    goto LABEL_8;
  }
  if ([a5 count]) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = [a6 count] != 0;
  }
LABEL_9:
  v25.receiver = self;
  v25.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsResult;
  v23 = [(NSCloudKitMirroringResult *)&v25 initWithRequest:a3 storeIdentifier:a4 success:!v13 madeChanges:v14 error:a7];
  if (v23)
  {
    v23->_acceptedShares = (NSArray *)a5;
    v23->_acceptedShareMetadatas = (NSArray *)a6;
  }
  return v23;
}

- (void)dealloc
{
  self->_acceptedShares = 0;
  self->_acceptedShareMetadatas = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringAcceptShareInvitationsResult;
  [(NSCloudKitMirroringResult *)&v3 dealloc];
}

- (NSArray)acceptedShares
{
  return self->_acceptedShares;
}

- (void)setAcceptedShares:(id)a3
{
}

- (NSArray)acceptedShareMetadatas
{
  return self->_acceptedShareMetadatas;
}

- (void)setAcceptedShareMetadatas:(id)a3
{
}

@end
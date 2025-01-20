@interface CPLCKShareRecordTodo
- (id)description;
@end

@implementation CPLCKShareRecordTodo

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  scopedIdentifier = self->_scopedIdentifier;
  Class recordClass = self->_recordClass;
  v6 = [(CKRecordID *)self->_privateRecordID recordName];
  v7 = [(CKRecordID *)self->_sharedRecordID recordName];
  id v8 = [v3 initWithFormat:@"<%@ %@ [%@->%@]>", recordClass, scopedIdentifier, v6, v7];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedTarget, 0);
  objc_storeStrong((id *)&self->_recordModificationDate, 0);
  objc_storeStrong((id *)&self->_proposedContributorUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_sharedRecordID, 0);
  objc_storeStrong((id *)&self->_privateRecordID, 0);
  objc_storeStrong((id *)&self->_recordClass, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
}

@end
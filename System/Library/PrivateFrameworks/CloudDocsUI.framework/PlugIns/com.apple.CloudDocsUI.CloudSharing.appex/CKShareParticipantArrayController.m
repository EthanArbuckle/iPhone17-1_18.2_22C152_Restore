@interface CKShareParticipantArrayController
- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4;
- (CKShare)share;
- (CKShareParticipantArrayController)initWithDelegate:(id)a3;
- (CKShareParticipantArrayController)initWithDelegate:(id)a3 share:(id)a4;
- (CNKeyDescriptor)avatarKeyDescriptor;
- (NSArray)currentParticipants;
- (void)_scheduleParticipantLookup:(id)a3;
- (void)_scheduleParticipantUpdate;
- (void)setAvatarKeyDescriptor:(id)a3;
- (void)setCurrentParticipants:(id)a3;
- (void)setShare:(id)a3;
@end

@implementation CKShareParticipantArrayController

- (CKShareParticipantArrayController)initWithDelegate:(id)a3 share:(id)a4
{
  id v6 = a4;
  v7 = [(CKShareParticipantArrayController *)self initWithDelegate:a3];
  v8 = v7;
  if (v7) {
    [(CKShareParticipantArrayController *)v7 setShare:v6];
  }

  return v8;
}

- (CKShareParticipantArrayController)initWithDelegate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKShareParticipantArrayController;
  v3 = [(CKShareParticipantArrayController *)&v10 initWithDelegate:a3];
  v4 = v3;
  if (v3)
  {
    currentParticipants = v3->_currentParticipants;
    v3->_currentParticipants = (NSArray *)&__NSArray0__struct;

    id v6 = objc_alloc_init((Class)CNAvatarViewController);
    uint64_t v7 = [v6 descriptorForRequiredKeys];
    avatarKeyDescriptor = v4->_avatarKeyDescriptor;
    v4->_avatarKeyDescriptor = (CNKeyDescriptor *)v7;
  }
  return v4;
}

- (void)setShare:(id)a3
{
  v5 = (CKShare *)a3;
  p_share = &self->_share;
  if (self->_share != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_share, a3);
    p_share = (CKShare **)[(CKShareParticipantArrayController *)self _scheduleParticipantUpdate];
    v5 = v7;
  }

  _objc_release_x1(p_share, v5);
}

- (void)_scheduleParticipantUpdate
{
  v3 = cdui_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[INFO] Scheduling participant update", buf, 2u);
  }

  v4 = [(CKShareParticipantArrayController *)self share];
  v5 = [(CKShareParticipantArrayController *)self operationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002431C;
  v7[3] = &unk_10004CA00;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)_scheduleParticipantLookup:(id)a3
{
  id v4 = a3;
  v5 = [(CKShareParticipantArrayController *)self operationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000246D4;
  v7[3] = &unk_10004CA00;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (BOOL)objectAttributeModified:(id)a3 newObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 contact];
  id v8 = [v6 contact];

  if (v7 == v8
    && ([v5 participant],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v6 participant],
        objc_super v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 == v10))
  {
    v13 = [v5 contact];
    v14 = [v6 contact];
    unsigned __int8 v15 = [v13 isEqual:v14];

    char v11 = v15 ^ 1;
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (CKShare)share
{
  return self->_share;
}

- (NSArray)currentParticipants
{
  return self->_currentParticipants;
}

- (void)setCurrentParticipants:(id)a3
{
}

- (CNKeyDescriptor)avatarKeyDescriptor
{
  return self->_avatarKeyDescriptor;
}

- (void)setAvatarKeyDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarKeyDescriptor, 0);
  objc_storeStrong((id *)&self->_currentParticipants, 0);

  objc_storeStrong((id *)&self->_share, 0);
}

@end
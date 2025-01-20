@interface FAFamilyMemberDetailsPageSurrogate
- (BOOL)respondsToSelector:(SEL)a3;
- (FAFamilyMemberDetailsPageSurrogate)initWithPage:(id)a3 forPerson:(id)a4 account:(id)a5 store:(id)a6;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation FAFamilyMemberDetailsPageSurrogate

- (FAFamilyMemberDetailsPageSurrogate)initWithPage:(id)a3 forPerson:(id)a4 account:(id)a5 store:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
  v14 = [(FAFamilyMemberDetailsPageSurrogate *)&v23 init];
  if (v14)
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x263F25D08]) initWithAppleAccount:v12 store:v13];
    pictureStore = v14->_pictureStore;
    v14->_pictureStore = (AAUIProfilePictureStore *)v15;

    objc_storeStrong((id *)&v14->_familyMember, a4);
    v17 = [v10 tableViewOM];
    uint64_t v18 = [v17 tableView];
    remoteTableView = v14->_remoteTableView;
    v14->_remoteTableView = (UITableView *)v18;

    uint64_t v20 = [v10 tableViewOM];
    remoteTableViewController = v14->_remoteTableViewController;
    v14->_remoteTableViewController = (UITableViewDelegate *)v20;

    [(UITableView *)v14->_remoteTableView setDelegate:v14];
  }

  return v14;
}

- (void)dealloc
{
  remoteTableView = self->_remoteTableView;
  if (remoteTableView) {
    [(UITableView *)remoteTableView setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
  [(FAFamilyMemberDetailsPageSurrogate *)&v4 dealloc];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:self->_remoteTableViewController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
    [(FAFamilyMemberDetailsPageSurrogate *)&v5 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
  objc_super v5 = -[FAFamilyMemberDetailsPageSurrogate methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!v5)
  {
    objc_super v5 = [(UITableViewDelegate *)self->_remoteTableViewController methodSignatureForSelector:a3];
  }
  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)FAFamilyMemberDetailsPageSurrogate;
  return [(FAFamilyMemberDetailsPageSurrogate *)&v6 respondsToSelector:a3];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  objc_super v6 = (UITableView *)a3;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      objc_super v7 = [(UITableViewDelegate *)self->_remoteTableViewController tableView:v6 viewForHeaderInSection:a4];
    }
    else
    {
      int v8 = [(FAFamilyMember *)self->_familyMember isMe];
      pictureStore = self->_pictureStore;
      if (v8) {
        [(AAUIProfilePictureStore *)pictureStore profilePictureForAccountOwner];
      }
      else {
      id v10 = [(AAUIProfilePictureStore *)pictureStore fa_profilePictureForFamilyMember:self->_familyMember];
      }
      id v11 = [(FAFamilyMember *)self->_familyMember fullName];
      id v12 = [(FAFamilyMember *)self->_familyMember appleID];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        id v14 = [(FAFamilyMember *)self->_familyMember inviteEmail];
      }
      uint64_t v15 = v14;

      objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F25D10]) initWithName:v11 email:v15 image:v10];
      [v7 setTopPadding:8.0];
    }
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  objc_super v6 = (UITableView *)a3;
  double v7 = 0.0;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      [(UITableViewDelegate *)self->_remoteTableViewController tableView:v6 heightForHeaderInSection:a4];
      double v7 = v8;
    }
    else
    {
      [MEMORY[0x263F25D10] desiredHeight];
      double v7 = v9 + 8.0;
    }
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  objc_super v6 = (UITableView *)a3;
  double v7 = 0.0;
  if (self->_remoteTableView == v6)
  {
    if (a4)
    {
      [(UITableViewDelegate *)self->_remoteTableViewController tableView:v6 heightForFooterInSection:a4];
    }
    else
    {
      double v9 = [(FAFamilyMemberDetailsPageSurrogate *)self tableView:v6 titleForFooterInSection:0];

      if (v9)
      {
        double v7 = *MEMORY[0x263F839B8];
        goto LABEL_7;
      }
      UIRoundToViewScale();
    }
    double v7 = v8;
  }
LABEL_7:

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pictureStore, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
  objc_storeStrong((id *)&self->_remoteTableView, 0);
  objc_storeStrong((id *)&self->_remoteTableViewController, 0);
}

@end